main() 
{
  int id  = moduleAddMenu("JCOP Framework"); 
  moduleAddAction("Installation", "", "Meta+I", id, 0, "_openInstallationTool");
}

 /**
 * @reviewed 2018-06-26 @whitelisted{WinCCOAIntegration}
 */
void _openInstallationTool()
{
  ModuleOnWithPanel("JCOP Framework Installation Tool", -1, -1, 10, 20, 1, 1, "", "fwInstallation/fwInstallation.pnl", "JCOP Framework Installation Tool", makeDynString()); 
}
