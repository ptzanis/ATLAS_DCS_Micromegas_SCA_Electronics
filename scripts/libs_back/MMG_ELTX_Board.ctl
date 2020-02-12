#uses "mmg_eltx_lib/mmgEltx_datapointHandling.ctl"
#uses "mmg_eltx_lib/mmgEltx_deviceUnitHandling.ctl"

MMG_ELTX_Board_initialize(string domain, string device)
{
   mmgEltxHandle_Fsm_Board_initialize(domain,device);
}



MMG_ELTX_Board_valueChanged( string domain, string device, string &fwState)
{
}

#uses "mmg_eltx_lib/mmgEltx_datapointHandling.ctl"
#uses "mmg_eltx_lib/mmgEltx_deviceUnitHandling.ctl"

MMG_ELTX_Board_doCommand(string domain, string device, string command)
{
  mmgEltxHandle_Fsm_Board_doCommand(domain, device, command);
}

