string eltxProjectName(){

  return getSystemName();
}

string getDetector(){
    return "MMG";
}





string getSide(string obj){
    return substr(obj,9,1);
}

string getSector(string obj){
    return substr(obj,18,2);
}

string getLayer(string obj){
    return substr(obj,27,1);
}

string getBoard(string obj){
    return substr(obj,35,2);
}




string getDomain(string obj){
  string domain;
  domain=getDetector($obj)+"_SIDE_"+getSide($obj)+"_SECTOR_"+getSector($obj);
  return domain;
}


getBoardChamberInfo(string side, int layer, string board,  string &Zaxis, string &Raxis, string &cLayer, string &pcb, string &cBoard ){

  if(side=="A")
  {
    //Zaxis
    if(layer<=4)
      Zaxis="Z2";
    if(layer>=5)
      Zaxis="Z3";

    //pcb
  if(board=="01" || board=="02" || board=="03" || board=="04" )
    pcb="1";
  if(board=="05" || board=="06" || board=="07" || board=="08" )
    pcb="2";
  if(board=="09" || board=="10" || board=="11" || board=="12" )
    pcb="3";
  if(board=="13" || board=="14" || board=="15" || board=="16" )
    pcb="4";
  if(board=="17" || board=="18" || board=="19" || board=="20" )
    pcb="5";
  if(board=="21" || board=="22" || board=="23" || board=="24" )
    pcb="6";
  if(board=="25" || board=="26" || board=="27" || board=="28" )
    pcb="7";
  if(board=="29" || board=="30" || board=="31" || board=="32" )
    pcb="8";

  //Raxis
    if(pcb<=5)
      Raxis="R1";
    if(pcb>=6)
      Raxis="R2";

  //cLayer
  if(layer<=4)
    cLayer=layer;
  if(layer>=5)
    cLayer=layer-4;

  //cBoard
   if(board=="01" || board=="05" || board=="09" || board=="13" || board=="17" || board=="21" || board=="25" || board=="29" )
    cBoard="1";
  if(board=="02" || board=="06" || board=="10" || board=="14" || board=="18" || board=="22" || board=="26" || board=="30" )
    cBoard="2";
  if(board=="03" || board=="07" || board=="11" || board=="15" || board=="19" || board=="23" || board=="27" || board=="31" )
    cBoard="3";
  if(board=="04" || board=="08" || board=="12" || board=="16" || board=="20" || board=="24" || board=="28" || board=="32" )
    cBoard="4";


  }

}


string getChamber(string obj){

    string Z=getChamberZaxis(obj);
    string R=getChamberRaxis(obj);
    string side=getSide(obj);
    string sector=getSector(obj);

    string chamber="EIZ"+Z+"R"+R+side+sector;

    return chamber;
}



string getBoardChannel(string obj){

  string channel;
  dpGet(eltxProjectName()+getDetector(obj)+"_ELTX_"+getSide(obj)+getSector(obj)+".Layer"+getLayer(obj)+".Board"+getBoard(obj)+".info.channel",channel);
  return channel;

}


string getBoardType(string obj){

  string type;
  dpGet(eltxProjectName()+getDetector(obj)+"_ELTX_"+getSide(obj)+getSector(obj)+".Layer"+getLayer(obj)+".Board"+getBoard(obj)+".info.type",type);
  return type;

}


string getBoardLVChannel(string obj){

  string channelLV=eltxProjectName()+getDetector(obj)+"_ELTX_"+getSide(obj)+getSector(obj)+".Layer"+getLayer(obj)+".Board"+getBoard(obj)+".power.isLVOn";
  return channelLV;

}

int getBoardState(string obj, string mode){

 int valueState;
 dpGet(eltxProjectName()+getDetector(obj)+"_ELTX_"+getSide(obj)+getSector(obj)+".Layer"+getLayer(obj)+".Board"+getBoard(obj)+".state."+mode, valueState);
 return valueState;
}

void setBoardState(string obj, string mode, int valueToSet){

 dpSet(eltxProjectName()+getDetector(obj)+"_ELTX_"+getSide(obj)+getSector(obj)+".Layer"+getLayer(obj)+".Board"+getBoard(obj)+".state."+mode, valueToSet);

}


void updateBoardState(string mode, string dpeChannel, int value){

   shape stateShape=getShape("");

  if(value==1)
   stateShape.backCol("green");
  if(value==2)
   stateShape.backCol("yellow");
  if(value==3)
   stateShape.backCol("red");

}

string getSCAOnlineChannel(string boardChannel){

  string scaChannel=eltxProjectName()+boardChannel+".online";
  return scaChannel;

}

string getSCAID(string boardChannel){

  string id;
  dpGet(eltxProjectName()+boardChannel+".id",id);
  return id;

}

string getSCAAddress(string boardChannel){

  string address;
  dpGet(eltxProjectName()+boardChannel+".address",address);
  return address;

}

string getBoardOPCServer(string boardChannel)
{

  string scaChannel=getSCAOnlineChannel(boardChannel);

  bool configExists;
  dyn_anytype config;
  bool isActive;
  dyn_string exceptionInfo;

  fwPeriphAddress_get(scaChannel, configExists, config, isActive, exceptionInfo);

  string opcServerOfBoard="_"+config[12];

  return opcServerOfBoard;

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



dyn_string getAnalogItemsOfBoard(string boardType){

  dyn_string analogItemsOfBoard;
  analogItemsOfBoard=dpNames("Board_Settings."+boardType+".*","MMG_ELTX_Board_Settings");
  string dpeType;

  for(int i=1;i<=dynlen(analogItemsOfBoard);i++)
  {
     if(boardType=="MMFE8")
     {
      if(i<=3)
        dpeType=".power";
      else
        dpeType=".temperature";
     }

     if(boardType=="L1DDC")
     {
      if(i==6 || i==7)
        dpeType=".power";
      else
        dpeType=".temperature";
     }

     if(boardType=="ADDC")
     {
      if(i<=2)
        dpeType=".power";
      else
        dpeType=".temperature";
     }

    strreplace(analogItemsOfBoard[i],eltxProjectName()+"Board_Settings."+boardType+".","");
    analogItemsOfBoard[i]="/ai/"+analogItemsOfBoard[i]+dpeType;
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

// Mapping ------------------------------------------------------------------------------

mapping getBoardsListOfChannelAndTypeOfSide(string side){

  dyn_string objectsSide=dpNames("*_"+side+"*","MMG_ELTX_Board");
  dyn_string objectSector, objectLayer, objectBoard;

  string channel, type;
  mapping channelAndTypeList;

  for(int objectsUnderSide_i=1; objectsUnderSide_i<=dynlen(objectsSide); objectsUnderSide_i++)
  {
    objectSector=dpNames(objectsSide[objectsUnderSide_i]+".*");
    for(int objectSector_i=1; objectSector_i<=dynlen(objectSector); objectSector_i++)
      {
        objectLayer=dpNames(objectSector[objectSector_i]+".*");
        for(int objectLayer_i=1;objectLayer_i<=dynlen(objectLayer);objectLayer_i++)
        {
          objectBoard=dpNames(objectLayer[objectLayer_i]);
          for(int objectBoard_i=1; objectBoard_i<=dynlen(objectBoard);objectBoard_i++)
          {
                dpGet(objectBoard[objectBoard_i]+".info.channel",channel);
                dpGet(objectBoard[objectBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectsUnderBoard_i
          }//objectsUnderLayer_i
    }//objectsUnderSector_i
  }//objectsUnderSide_i

 return channelAndTypeList;
}

mapping getBoardsListOfChannelAndTypeOfSector(string sector){

  dyn_string objectSector=dpNames("*_"+sector+"*","MMG_ELTX_Board");
  dyn_string objectLayer, objectBoard;

  string channel, type;
  mapping channelAndTypeList;

    for(int objectSector_i=1; objectSector_i<=dynlen(objectSector); objectSector_i++)
      {
        objectLayer=dpNames(objectSector[objectSector_i]+".*");
        for(int objectLayer_i=1; objectLayer_i<=dynlen(objectLayer); objectLayer_i++)
        {
          objectBoard=dpNames(objectLayer[objectLayer_i]+".*");
          for(int objectBoard_i=1; objectBoard_i<=dynlen(objectBoard);objectBoard_i++)
          {
                dpGet(objectBoard[objectBoard_i]+".info.channel",channel);
                dpGet(objectBoard[objectBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectBoard_i
          }//objectLayer_i
    }//objectSector_i

 return channelAndTypeList;
}

mapping getBoardsListOfChannelAndTypeOfSectorLayer(string sector, int layer){

  dyn_string objectLayer=dpNames("*_"+sector+".Layer"+layer,"MMG_ELTX_Board");
  dyn_string objectBoard;

  string channel, type;
  mapping channelAndTypeList;

  if(dynlen(objectLayer)!=0)
    objectBoard=dpNames(objectLayer[1]+".*");

     for(int objectBoard_i=1; objectBoard_i<=dynlen(objectBoard);objectBoard_i++)
          {
                dpGet(objectBoard[objectBoard_i]+".info.channel",channel);
                dpGet(objectBoard[objectBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectBoard_i

 return channelAndTypeList;
}

mapping getBoardsListOfChannelAndTypeOfSectorLayerBoard(string sector, int layer, string board){

  string objectBoard=dpNames("*_"+sector+".Layer"+layer+".Board"+board,"MMG_ELTX_Board");

  string channel, type;
  mapping channelAndTypeList;

  dpGet(objectBoard+".info.channel",channel);
  dpGet(objectBoard+".info.type",type);

  if(channel!="" && type!="")
    channelAndTypeList[channel]=type;


 return channelAndTypeList;
}




// Mapping ------------------------------------------------------------------------------

dyn_string getChannelListOfBoardTypeFromMappingList(mapping mappingList,string boardType)
{
  dyn_string list;

  for(int i=1;i<=mappinglen(mappingList);i++)
  {
    if(mappingGetValue(mappingList,i)==boardType)
      dynAppend(list,mappingGetKey(mappingList,i));
  }

  return list;

}


dyn_string returnBoardsOfLayer(int layer)
{

  dyn_string layer1_5=makeDynString("01","04","05","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","28","29","32");
  dyn_string layer2_6=makeDynString("02","03","06","07","10","11","14","15","18","19","22","23","26","27","30","31");
  dyn_string layer3_7=makeDynString("01","04","05","08","09","12","13","16","17","20","21","24","25","28","29","32");
  dyn_string layer4_8=makeDynString("02","03","06","07","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","26","27","30","31");

  dyn_string layerBoards;

  if(layer==1 || layer==5)
    layerBoards=layer1_5;
  if(layer==2 || layer==6)
    layerBoards=layer2_6;
  if(layer==3 || layer==7)
    layerBoards=layer3_7;
  if(layer==4 || layer==8)
    layerBoards=layer4_8;


  return layerBoards;


}
