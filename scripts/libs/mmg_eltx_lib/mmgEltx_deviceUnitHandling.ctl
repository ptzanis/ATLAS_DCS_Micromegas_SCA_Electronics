#uses "mmg_eltx_lib/mmgEltx.ctl"

void mmgEltxHandle_Fsm_Board_initialize(string domain,string device){

 DebugN("this is init","domain is ----> "+domain,"device is ----> "+device);

 mmgEltxBoard_setupDuDpConnect(domain, device);

}

void mmgEltxHandle_Fsm_Board_doCommand(string domain, string device, string command){

  if(command=="REFRESH")
  {
    fwFsmAtlas_startTimeout(30, domain, device,"UNKNOWN");
  }


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

//     dpGet("MMG_MMFE8_L1P1_HOL/ai/0V65for1V3A.temperature:_alert_hdl.._act_text");
    for(int i=1;i<=dynlen(boardItemList);i++)
    {
      dynAppend(channels,getDetector()+"_"+boardChannel+boardItemList[i]+":_alert_hdl.._act_text");
    }

    dynAppend(channels,boardOPCServer);
    dynAppend(channels,boardLVChannel);
    dynAppend(channels,boardSCAOnlineChannel);


    dpConnectUserData("mmgEltxBoard_DuCallback_StatusOnDpe",domainDevice , channels);

}


void mmgEltxBoard_DuCallback_StatusOnDpe(dyn_string domainDevice, dyn_string dpeBoardItem, dyn_string value )
{
  bool isOPCOn=(bool)value[dynlen(dpeBoardItem)-2];
  bool isLVOn=(bool)value[dynlen(dpeBoardItem)-1];
  bool isBoardScaOnline=(bool)value[dynlen(dpeBoardItem)];

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

  dyn_string valueTempList, valuePowerList;

  dyn_string temperatureItemList, powerItemList;

  dyn_string stateStatus;

  stateStatus[1]="READY";
  stateStatus[2]="OK";

     if(isLVOn)
     {
       if(isOPCOn)
       {
         if(isBoardScaOnline)
         {

            dpeBoardItem[1]=dpSubStr(dpeBoardItem[1],DPSUB_SYS_DP_EL);
            fwAlertConfig_get(dpeBoardItem[1], configExists, alertConfigType, alertTexts, alertLimits, alertClasses, summaryDpeList, alertPanel,alertPanelParameters,alertHelp,isActive,exceptionInfo);
//             dynClear(alertLimits);

           if(configExists)
           {
             for(int i=1; i<=(dynlen(dpeBoardItem)-3);i++)
            {
              dpeBoardItem[i]=dpSubStr(dpeBoardItem[i],DPSUB_SYS_DP_EL);
//               fwAlertConfig_get(dpeBoardItem[i], configExists, alertConfigType, alertTexts, alertLimits, alertClasses, summaryDpeList, alertPanel,alertPanelParameters,alertHelp,isActive,exceptionInfo);

              if(patternMatch("*.temperature",dpeBoardItem[i]))
              {

//               downLimit=alertLimits[1];
//               upLimit=alertLimits[2];

//               dynAppend(downLimitTempList, downLimit);
//               dynAppend(upLimitTempList, upLimit);

              dynAppend(temperatureItemList, dpeBoardItem[i]);
              dynAppend(valueTempList, value[i]);
              }

             if(patternMatch("*.power",dpeBoardItem[i]))
              {

//               downLimit=alertLimits[1];
//               upLimit=alertLimits[2];

//               dynAppend(downLimitPowerList, downLimit);
//               dynAppend(upLimitPowerList, upLimit);

              dynAppend(powerItemList, dpeBoardItem[i]);
              dynAppend(valuePowerList, value[i]);
              }

             }

            stateStatus=determineTemperatureStateStatus(temperatureItemList, valueTempList, device);
            determinePowerStateStatus(powerItemList, valuePowerList, device);

            }
             else // no alert configuration found
            {
              stateStatus[1]="UNKNOWN";
              stateStatus[2]="WARNING";
             }
        }
         else // Board SCA Online Status FALSE
         {
            stateStatus[1]="DISCONNECTED";
            stateStatus[2]="FATAL";
         }
       }
      else // OPC Server not running
      {
      stateStatus[1]="UNKNOWN";
      stateStatus[2]="FATAL";
      }
     }
    else // Board LV is off
    {
      stateStatus[1]="LV_OFF";
      stateStatus[2]="OK";
    }

  fwFsmAtlas_setDUState(domain,device,stateStatus[1], "");
  fwFsmAtlas_setStatus(domain,device,stateStatus[2], "");


}


dyn_string determineTemperatureStateStatus(dyn_string boardItems, dyn_string state, string device){

  dyn_string stateStatusFinal;

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


void determinePowerStateStatus(dyn_string boardItems, dyn_string powerStatus, string device){

  if(dynlen(dynPatternMatch("WARNING",powerStatus))!=0)
     setBoardState(device, "power",2);
  else if(dynlen(dynPatternMatch("READY",powerStatus))!=0)
     setBoardState(device, "power",1);

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

  dyn_float valueTempList, downLimitTempList, upLimitTempList;
  dyn_float valuePowerList, downLimitPowerList, upLimitPowerList;

  dyn_string temperatureItemList, powerItemList;

  dyn_string stateStatus;

  stateStatus[1]="READY";
  stateStatus[2]="OK";

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
            dynClear(stateStatus);
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
*/

string returnBoldAnalogItem(string item, string boardChannel)
{

   strreplace(item, ":_online.._value","");
   strreplace(item, eltxProjectName()+boardChannel+"/ai/","");
   strreplace(item, ".power","");
   strreplace(item, ".temperature","");

   return item;


 }
