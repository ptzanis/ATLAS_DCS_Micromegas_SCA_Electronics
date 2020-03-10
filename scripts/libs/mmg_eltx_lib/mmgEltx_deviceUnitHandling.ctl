#uses "mmg_eltx_lib/mmgEltx.ctl"

void mmgEltxHandle_Fsm_Board_initialize(string domain,string device){

 DebugN("this is init","domain is ----> "+domain,"device is ----> "+device);

mmgEltxBoard_setupDuDpConnect(domain, device);

}

void mmgEltxHandle_Fsm_Board_doCommand(string domain, string device, string command){


fwFsmAtlas_startTimeout(10,domain, device, "NOT_READY","READY");

}


/*
 Board DU State/Status Handling
*/

void mmgEltxBoard_setupDuDpConnect(string domain, string device)
{
    string boardChannel=getBoardChannel(device);
    string boardType=getBoardType(device);
    string boardLVChannel=getBoardLVChannel(device);
    string boardSCAOnlineChannel=getSCAOnlineChannel(boardChannel);
    string boardOPCServer=getBoardOPCServer(boardChannel)+".State.ConnState";


    dyn_string boardItemList=getAnalogItemsOfBoard(boardType);
    dyn_string domainDevice=makeDynString(domain, device);

    dyn_string channels;

    for(int i=1;i<=dynlen(boardItemList);i++)
    {
      dynAppend(channels,getDetector()+"_"+boardChannel+boardItemList[i]);
    }

    dynAppend(channels,boardOPCServer);
    dynAppend(channels,boardLVChannel);
    dynAppend(channels,boardSCAOnlineChannel);


     dpConnectUserData("mmgEltxBoard_DuCallback_StatusOnDpe",domainDevice , channels);

}

/*
 void mmgEltxBoard_DuCallback_StatusOnDpe(dyn_string domainDevice, dyn_string dpeBoardItem, dyn_anytype value )
{

  bool isOPCOn=value[dynlen(dpeBoardItem)-2];
  bool isLVOn=value[dynlen(dpeBoardItem)-1];
  bool isBoardScaOnline=value[dynlen(dpeBoardItem)];

  string domain=domainDevice[1];
  string device=domainDevice[2];

  bool configExists;
 	int alertConfigType;
  dyn_string alertTexts;
	dyn_float alertLimits;
	dyn_string alertClasses;
  dyn_string summaryDpeList;
	string alertPanel;
	dyn_string alertPanelParameters;
	string alertHelp;
  bool isActive;
	dyn_string exceptionInfo;
  string board;
  float downLimit, upLimit;

  dyn_bool powerStatus;
  dynClear(powerStatus);
  int powerCounter=0;

  DebugN(dpeBoardItem);

     if(isLVOn)
     {
       if(isOPCOn)
       {
         if(isBoardScaOnline)
         {
             for(int i=1; i<=(dynlen(dpeBoardItem)-3);i++)
            {
              dpeBoardItem[i]=dpSubStr(dpeBoardItem[i],DPSUB_SYS_DP_EL);
              fwAlertConfig_get(dpeBoardItem[i], configExists, alertConfigType, alertTexts, alertLimits, alertClasses, summaryDpeList, alertPanel,alertPanelParameters,alertHelp,isActive,exceptionInfo);

              if(configExists)
             {
              downLimit=alertLimits[1];
              upLimit=alertLimits[2];

              if(patternMatch("*.temperature",dpeBoardItem[i]))
              {

                 if(value[i]>=upLimit && value[i]<200.0)
                  {
                 fwFsmAtlas_setDUState(domain,device,"HIGH_TEMP", "");
                 fwFsmAtlas_setStatus(domain,device,"ERROR", "");
                 setBoardState(device, "temperature",3);
                 break;
                  }
                 else if(value[i]>=downLimit && value[i]<upLimit)
                  {
                 fwFsmAtlas_setDUState(domain,device,"OVER_TEMP", "");
                 fwFsmAtlas_setStatus(domain,device,"WARNING", "");
                 setBoardState(device, "temperature",2);
                 break;
                  }
                 else if(value[i]<downLimit)
                  {
                 fwFsmAtlas_setDUState(domain,device,"READY", "");
                 fwFsmAtlas_setStatus(domain,device,"OK", "");
                 setBoardState(device, "temperature",1);
                 break;
                  }
                else if(patternMatch("*vmm*",dpeBoardItem[i]) && value[i]>200.0)
                  {
                 fwFsmAtlas_setDUState(domain,device,"CALIBRATION", "");
                 fwFsmAtlas_setStatus(domain,device,"OK", "");
                 setBoardState(device, "temperature",1);
                 break;
                  }
               }

              if(patternMatch("*.power",dpeBoardItem[i]))
              {
                  powerCounter++;
                  if(value[i]>=downLimit && value[i]<=upLimit)
                     powerStatus[powerCounter]=TRUE;
                  else
                     powerStatus[powerCounter]=FALSE;
              }


             }
             else // no alert configuration found
            {
             fwFsmAtlas_setDUState(domain,device,"UNKNOWN", "");
             fwFsmAtlas_setStatus(domain,device,"WARNING", "");
             }
          }

          // Board Power Handling
        int powerStatusFinal=1;
        for(int i=1;i<=dynlen(powerStatus);i++)
       {
          if(powerStatus[i]!=TRUE)
              powerStatusFinal=2;
       }
        setBoardState(device, "power",powerStatusFinal);

         }
         else // Board SCA Online Status FALSE
         {
       fwFsmAtlas_setDUState(domain,device,"DISCONNECTED", "");
       fwFsmAtlas_setStatus(domain,device,"FATAL", "");
         }
       }
      else // OPC Server not running
      {
    fwFsmAtlas_setDUState(domain,device,"UNKNOWN", "");
    fwFsmAtlas_setStatus(domain,device,"FATAL", "");
      }

     }
    else // Board LV is off
    {
  fwFsmAtlas_setDUState(domain,device,"LV_OFF", "");
  fwFsmAtlas_setStatus(domain,device,"OK", "");
    }


}
*/

 void mmgEltxBoard_DuCallback_StatusOnDpe(dyn_string domainDevice, dyn_string dpeBoardItem, dyn_anytype value )
{

  bool isOPCOn=value[dynlen(dpeBoardItem)-2];
  bool isLVOn=value[dynlen(dpeBoardItem)-1];
  bool isBoardScaOnline=value[dynlen(dpeBoardItem)];

  string domain=domainDevice[1];
  string device=domainDevice[2];

  bool configExists;
 	int alertConfigType;
  dyn_string alertTexts;
	dyn_float alertLimits;
	dyn_string alertClasses;
  dyn_string summaryDpeList;
	string alertPanel;
	dyn_string alertPanelParameters;
	string alertHelp;
  bool isActive;
	dyn_string exceptionInfo;
  string board;
  float downLimit, upLimit;

  dyn_float valueTempList, downLimitTempList, upLimitTempList;
  dyn_float valuePowerList, downLimitPowerList, upLimitPowerList;

  dyn_string temperatureItemList, powerItemList;

  dyn_string stateStatus;

     if(isLVOn)
     {
       if(isOPCOn)
       {
         if(isBoardScaOnline)
         {

            dpeBoardItem[1]=dpSubStr(dpeBoardItem[1],DPSUB_SYS_DP_EL);
            fwAlertConfig_get(dpeBoardItem[1], configExists, alertConfigType, alertTexts, alertLimits, alertClasses, summaryDpeList, alertPanel,alertPanelParameters,alertHelp,isActive,exceptionInfo);
            dynClear(alertLimits);

           if(configExists)
           {
             for(int i=1; i<=(dynlen(dpeBoardItem)-3);i++)
            {
              dpeBoardItem[i]=dpSubStr(dpeBoardItem[i],DPSUB_SYS_DP_EL);
              fwAlertConfig_get(dpeBoardItem[i], configExists, alertConfigType, alertTexts, alertLimits, alertClasses, summaryDpeList, alertPanel,alertPanelParameters,alertHelp,isActive,exceptionInfo);

              if(patternMatch("*.temperature",dpeBoardItem[i]))
              {

              downLimit=alertLimits[1];
              upLimit=alertLimits[2];

              dynAppend(downLimitTempList, downLimit);
              dynAppend(upLimitTempList, upLimit);

              dynAppend(temperatureItemList, dpeBoardItem[i]);
              dynAppend(valueTempList, value[i]);
              }

             if(patternMatch("*.power",dpeBoardItem[i]))
              {

              downLimit=alertLimits[1];
              upLimit=alertLimits[2];

              dynAppend(downLimitPowerList, downLimit);
              dynAppend(upLimitPowerList, upLimit);

              dynAppend(powerItemList, dpeBoardItem[i]);
              dynAppend(valuePowerList, value[i]);
              }



             }

            stateStatus=determineTemperatureStateStatus(temperatureItemList, valueTempList, downLimitTempList, upLimitTempList, device);
            determinePowerStateStatus(powerItemList, valuePowerList, downLimitPowerList, upLimitPowerList, device);


            fwFsmAtlas_setDUState(domain,device,stateStatus[1], "");
            fwFsmAtlas_setStatus(domain,device,stateStatus[2], "");

            }
             else // no alert configuration found
            {
             fwFsmAtlas_setDUState(domain,device,"UNKNOWN", "");
             fwFsmAtlas_setStatus(domain,device,"WARNING", "");
             }
        }
         else // Board SCA Online Status FALSE
         {
       fwFsmAtlas_setDUState(domain,device,"DISCONNECTED", "");
       fwFsmAtlas_setStatus(domain,device,"FATAL", "");
         }
       }
      else // OPC Server not running
      {
    fwFsmAtlas_setDUState(domain,device,"UNKNOWN", "");
    fwFsmAtlas_setStatus(domain,device,"FATAL", "");
      }

     }
    else // Board LV is off
    {
  fwFsmAtlas_setDUState(domain,device,"LV_OFF", "");
  fwFsmAtlas_setStatus(domain,device,"OK", "");
    }




}


dyn_string determineTemperatureStateStatus(dyn_string boardItems, dyn_anytype value, dyn_float downLimit, dyn_float upLimit, string device){

  dyn_string state;
  dyn_string stateStatusFinal;

  for(int i=1; i<=dynlen(boardItems);i++)
   {
           if(value[i]>=upLimit[i] && value[i]<200.0)
                 state[i]="HIGH_TEMP";
           else if(value[i]>=downLimit[i] && value[i]<upLimit[i])
                 state[i]="OVER_TEMP";
           else if(patternMatch("*vmm*",boardItems[i]) && value[i]>200.0)
                 state[i]="CALIBRATION";
           else if(value[i]<downLimit[i])
                 state[i]="READY";

   }


    if(dynlen(dynPatternMatch("CALIBRATION",state))!=0)
  {
    stateStatusFinal[1]="CALIBRATION";
    stateStatusFinal[2]="OK";
    setBoardState(device, "temperature",1);

    if(dynlen(dynPatternMatch("OVER_TEMP",state))!=0)
    {
        stateStatusFinal[2]="WARNING";
        setBoardState(device, "temperature",2);

    }
    if(dynlen(dynPatternMatch("HIGH_TEMP",state))!=0)
    {
        stateStatusFinal[2]="ERROR";
        setBoardState(device, "temperature",3);

     }

  }
  else if(dynlen(dynPatternMatch("HIGH_TEMP",state))!=0)
  {
    stateStatusFinal[1]="HIGH_TEMP";
    stateStatusFinal[2]="ERROR";
    setBoardState(device, "temperature",3);
  }
  else if(dynlen(dynPatternMatch("OVER_TEMP",state))!=0)
  {
    stateStatusFinal[1]="OVER_TEMP";
    stateStatusFinal[2]="WARNING";
    setBoardState(device, "temperature",2);
  }
  else if(dynlen(dynPatternMatch("READY",state))!=0)
  {
    stateStatusFinal[1]="READY";
    stateStatusFinal[2]="OK";
    setBoardState(device, "temperature",1);
  }

   return stateStatusFinal;


 }


void determinePowerStateStatus(dyn_string boardItems, dyn_anytype value, dyn_float downLimit, dyn_float upLimit, string device){

  dyn_string powerStatus;

  for(int i=1; i<=dynlen(boardItems);i++)
   {
         if(value[i]>=downLimit[i] && value[i]<=upLimit[i])
            powerStatus[i]="TRUE";
         else
            powerStatus[i]="FALSE";
   }


  if(dynlen(dynPatternMatch("FALSE",powerStatus))!=0)
     setBoardState(device, "power",2);
  else if(dynlen(dynPatternMatch("TRUE",powerStatus))!=0)
     setBoardState(device, "power",1);



}

string returnBoldAnalogItem(string item, string boardChannel)
{

   strreplace(item, ":_online.._value","");
   strreplace(item, eltxProjectName()+boardChannel+"/ai/","");
   strreplace(item, ".power","");
   strreplace(item, ".temperature","");

   return item;


 }
