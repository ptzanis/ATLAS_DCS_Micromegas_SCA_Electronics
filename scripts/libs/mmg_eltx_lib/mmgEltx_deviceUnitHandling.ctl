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
day1 : first try for DU temp handling
*/

void mmgEltxBoard_setupDuDpConnect(string domain, string device)
{
    string boardChannel=getBoardChannel(device);
    string boardType=getBoardType(device);

    dyn_string boardItemList=getAnalogItemsOfBoard(boardType);
    dyn_string domainDevice=makeDynString(domain, device);

    dyn_string channels;

    for(int i=1;i<=dynlen(boardItemList);i++)
    {
      dynAppend(channels,getDetector()+"_"+boardChannel+boardItemList[i]);
    }

     dpConnectUserData("mmgEltxBoard_DuCallback_StatusOnDpe",domainDevice , channels);

}


 void mmgEltxBoard_DuCallback_StatusOnDpe(dyn_string domainDevice, dyn_string dpe, dyn_float value)
{
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

  float downLimit, upLimit;


  for(int i=1; i<=dynlen(dpe);i++)
  {
     dpe[i]=dpSubStr(dpe[i],DPSUB_SYS_DP_EL);
     fwAlertConfig_get(dpe[i], configExists, alertConfigType, alertTexts, alertLimits, alertClasses, summaryDpeList, alertPanel,alertPanelParameters,alertHelp,isActive,exceptionInfo);
     downLimit=alertLimits[1];
     upLimit=alertLimits[2];

    if(isActive && configExists)
    {
      if(value[i]>35.0)
      {
       fwFsmAtlas_setDUState(domain,device,"HOT", "");
       fwFsmAtlas_setStatus(domain,device,"FATAL", "");
      }
     }
     else
     {
       fwFsmAtlas_setDUState(domain,device,"UNKNOWN", "");
       fwFsmAtlas_setStatus(domain,device,"WARNING", "");
     }


  }

}


string returnBoldAnalogItem(string item, string boardChannel)
{

   strreplace(item, ":_online.._value","");
   strreplace(item, eltxProjectName()+boardChannel+"/ai/","");
   strreplace(item, ".power","");
   strreplace(item, ".temperature","");

   return item;


 }
