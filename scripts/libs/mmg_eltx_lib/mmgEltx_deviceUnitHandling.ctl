#uses "mmg_eltx_lib/mmgEltx.ctl"

void mmgEltxHandle_Fsm_Board_initialize(string domain,string device){

DebugN("this is init","domain is ----> "+domain,"device is ----> "+device);

// fwDU_setState(domain, device, "NOT_READY");

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


    dyn_string boardItemList=getAnalogItemsOfBoard(boardType);
    dyn_string domainDevice=makeDynString(domain, device);

    dyn_string channels;

    for(int i=1;i<=dynlen(boardItemList);i++)
    {
      dynAppend(channels,getDetector()+"_"+boardChannel+boardItemList[i]);
    }

    dynAppend(channels,boardLVChannel);
    dynAppend(channels,boardSCAOnlineChannel);



     dpConnectUserData("mmgEltxBoard_DuCallback_StatusOnDpe",domainDevice , channels);

}


 void mmgEltxBoard_DuCallback_StatusOnDpe(dyn_string domainDevice, dyn_string dpeBoardItem, dyn_anytype value )
{

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
  int powerCounter=0;




       if(isLVOn)
       {
         if(isBoardScaOnline)
         {
             for(int i=1; i<=(dynlen(dpeBoardItem)-2);i++)
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
                  if(value[i]>downLimit && value[i]<upLimit)
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

         }
         else // Board SCA Online Status FALSE
         {
       fwFsmAtlas_setDUState(domain,device,"DISCONNECTED", "");
       fwFsmAtlas_setStatus(domain,device,"FATAL", "");
         }

       }
       else // Board LV is off
       {
       fwFsmAtlas_setDUState(domain,device,"LV_OFF", "");
       fwFsmAtlas_setStatus(domain,device,"OK", "");
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

string returnBoldAnalogItem(string item, string boardChannel)
{

   strreplace(item, ":_online.._value","");
   strreplace(item, eltxProjectName()+boardChannel+"/ai/","");
   strreplace(item, ".power","");
   strreplace(item, ".temperature","");

   return item;


 }
