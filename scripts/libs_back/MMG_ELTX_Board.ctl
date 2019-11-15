MMG_ELTX_Board_initialize(string domain, string device)
{
DebugN("****************************** THIS IS FSM");
        fwDU_setState(domain, device, "OFF");
}

MMG_ELTX_Board_valueChanged( string domain, string device, string &fwState)
{
}

MMG_ELTX_Board_doCommand(string domain, string device, string command)
{
}

