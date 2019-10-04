string eltxProjectName(){

  return "ATLMMGELTX:";
}


string getDetector(){
    return substr($obj,0,3);
}

string getSide(){
    return substr($obj,9,1);
}

string getSector(){
    return substr($obj,18,2);
}

string getChamber(){
    return substr($obj,21,9);
}

string getLayer(){
    return substr($obj,36,1);
}

string getPCB(){
    return substr($obj,41,1);
}

string getBoard(){
    return substr($obj,48,1);
}

string getBoardChannel(){

  string channel;
  dpGet(eltxProjectName()+getDetector()+"_ELTX_"+getChamber()+".Layer"+getLayer()+".PCB"+getPCB()+".Board"+getBoard()+".info.channel",channel);
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
  dpGet(eltxProjectName()+getDetector()+"_ELTX_"+getChamber()+".Layer"+getLayer()+".PCB"+getPCB()+".Board"+getBoard()+".info.type",type);
  return type;

}

void addLogoNTUABNL(int x,int y)
{

addSymbol(myModuleName(),myPanelName(),"mmg_eltx_tools/logoNTUABNL.pnl","logoNTUABNL","",x,y,0,1,1);

}

void parameterDisplay(string dpe,string parameter,string unit,int x,int y,int digitsBeforeComma,int digitsAfterComma){

    dyn_string parameters;
    parameters = makeDynString("$dpe:" + dpe, "$format:["+digitsBeforeComma+"."+digitsAfterComma+"f]",
                                        "$parameter:"+parameter,
                                        "$unit:"+unit,
                                        "$width:",
                                        "$color:black",
                                        "$bgcolor:_Transparent",
                                        "$qualityEl:"+"");



    addSymbol(myModuleName(), myPanelName(), "objects/fsmAtlas/parameter.pnl", "parameter_pnl_Ref_"+dpe,
              parameters, x, y, 0, 1, 1);


}


string getOPCServer()
{

  string opcServer="_SCA_OPC_UA_SERVER";

  return opcServer;

}

dyn_string getAnalogItemsOfBoard(string board,string boardType){

  dyn_string analogItemsOfBoard;

  dpGet("MMG_ELTX_"+boardType+".AnalogItems",analogItemsOfBoard);



  return analogItemsOfBoard;

}

