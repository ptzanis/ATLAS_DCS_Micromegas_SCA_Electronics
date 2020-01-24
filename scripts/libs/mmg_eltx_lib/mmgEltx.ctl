string eltxProjectName(){

  return getSystemName();
}


string getDetector(){
    return "MMG";
}

string getSide(){
    return substr($obj,9,1);
}

string getSector(){
    return substr($obj,18,2);
}

string getChamber(){
    return substr($obj,0,9);
}

string getChamberSide(){
    return substr($obj,6,1);
}

string getChamberZaxis(){
    return substr($obj,3,1);
}

string getChamberRaxis(){
    return substr($obj,5,1);
}

string getChamberSector(){
    return substr($obj,7,2);
}

string getChamberDomain(){
  string domain;
  domain=getDetector()+"_SIDE_"+getChamberSide()+"_SECTOR_"+getChamberSector();
  return domain;
}
string getLayer(){
    return substr($obj,15,1);
}

string getPCB(){
    return substr($obj,20,1);
}

string getBoard(){
    return substr($obj,27,1);
}

string getBoardChannel(){

  string channel;
  dpGet(eltxProjectName()+getDetector()+"_Side"+getChamberSide()+".Sector"+getChamberSector()+".Z"+getChamberZaxis()+".R"+getChamberRaxis()+".Layer"+getLayer()+".PCB"+getPCB()+".Board"+getBoard()+".info.channel",channel);
  return channel;

}

string getSCAID(string channel){

  string id;
  dpGet(eltxProjectName()+channel+".id",id);
  return id;

}

string getSCAAddress(string channel){

  string address;
  dpGet(eltxProjectName()+channel+".address",address);
  return address;

}

string getBoardType(){

  string type;
  dpGet(eltxProjectName()+getDetector()+"_Side"+getChamberSide()+".Sector"+getChamberSector()+".Z"+getChamberZaxis()+".R"+getChamberRaxis()+".Layer"+getLayer()+".PCB"+getPCB()+".Board"+getBoard()+".info.type",type);
  return type;

}

void addLogoNTUABNL(int x,int y)
{

addSymbol(myModuleName(),myPanelName(),"mmg_eltx_tools/logoNTUABNL.pnl","logoNTUABNL","",x,y,0,1,1);

}

void parameterDisplay(string dpe,string parameter,string unit,int x,int y,int digitsBeforeComma,int digitsAfterComma,float xScale=1.0, float yScale=1.0){

    dyn_string parameters;
    parameters = makeDynString("$dpe:" + dpe, "$format:["+digitsBeforeComma+"."+digitsAfterComma+"f]",
                                        "$parameter:"+parameter,
                                        "$unit:"+unit,
                                        "$width:",
                                        "$color:black",
                                        "$bgcolor:_Transparent",
                                        "$qualityEl:"+"");



    addSymbol(myModuleName(), myPanelName(), "objects/fsmAtlas/parameter.pnl", "parameter_pnl_Ref_"+dpe,
              parameters, x, y, 0, xScale, yScale);


}


string getOPCServer()
{

  string opcServer="_SCA_OPC_UA_SERVER";

  return opcServer;

}

dyn_string getAnalogItemsOfBoard(string boardType){

  dyn_string analogItemsOfBoard;
  analogItemsOfBoard=dpNames("Board_Settings."+boardType+".*","MMG_ELTX_Board_Settings");
  for(int i=1;i<=dynlen(analogItemsOfBoard);i++)
  {
    strreplace(analogItemsOfBoard[i],eltxProjectName()+"Board_Settings."+boardType+".","");
  }
  return analogItemsOfBoard;

}

dyn_string getTotalScaNames(){

  dyn_string scaNamesList;
  scaNamesList=dpNames("*","fwScaSCA");
  for(int i=1;i<=dynlen(scaNamesList);i++)
  {
    strreplace(scaNamesList[i],getSystemName(),"");
  }
  return scaNamesList;
}

string mmgGeneral_Fsm_getState(string domain, string obj)
{
 int isDU = fwFsm_isDU($domain, $obj);
 string state;

 if (isDU == 0)
    fwCU_getState(obj, state);
  else
    fwDU_getState(domain, obj, state);

 return state;
}
