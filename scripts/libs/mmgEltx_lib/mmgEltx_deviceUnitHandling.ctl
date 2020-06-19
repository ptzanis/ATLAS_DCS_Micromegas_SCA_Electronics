#uses "mmgEltx_lib/mmgEltx.ctl"

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

  stateStatus[1]="OPERATIONAL";
  stateStatus[2]="OK";

     if(isLVOn)
     {
       if(isOPCOn)
       {
         if(isBoardScaOnline)
         {

            dpeBoardItem[1]=dpSubStr(dpeBoardItem[1],DPSUB_SYS_DP_EL);
            fwAlertConfig_get(dpeBoardItem[1], configExists, alertConfigType, alertTexts, alertLimits, alertClasses, summaryDpeList, alertPanel,alertPanelParameters,alertHelp,isActive,exceptionInfo);

           if(configExists)
           {
             for(int i=1; i<=(dynlen(dpeBoardItem)-3);i++)
            {
              dpeBoardItem[i]=dpSubStr(dpeBoardItem[i],DPSUB_SYS_DP_EL);

              if(patternMatch("*.temperature",dpeBoardItem[i]))
              {

              dynAppend(temperatureItemList, dpeBoardItem[i]);
              dynAppend(valueTempList, value[i]);
              }

             if(patternMatch("*.power",dpeBoardItem[i]))
              {

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
    stateStatusFinal[1]="OPERATIONAL";
    stateStatusFinal[2]="ERROR";
    setBoardState(device, "temperature",3);
  }
  else if(dynlen(dynPatternMatch("OVER_TEMP",state))!=0)
  {
    stateStatusFinal[1]="OPERATIONAL";
    stateStatusFinal[2]="WARNING";
    setBoardState(device, "temperature",2);
  }
  else if(dynlen(dynPatternMatch("GOOD",state))!=0)
  {
    stateStatusFinal[1]="OPERATIONAL";
    stateStatusFinal[2]="OK";
    setBoardState(device, "temperature",1);
  }

   return stateStatusFinal;


 }


void determinePowerStateStatus(dyn_string boardItems, dyn_string powerStatus, string device){

  if(dynlen(dynPatternMatch("WARNING",powerStatus))!=0)
     setBoardState(device, "power",2);
  else if(dynlen(dynPatternMatch("GOOD",powerStatus))!=0)
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
