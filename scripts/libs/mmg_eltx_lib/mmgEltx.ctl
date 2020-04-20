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


string getChamberZaxis(string obj){
   int layer=getLayer(obj);
   if(layer<=4)
     return "2";
   if(layer>=5)
     return "3";
}


string getChamberBoard(string obj){

  string board=getBoard(obj);
  if(board=="01" || board=="05" || board=="09" || board=="13" || board=="17" || board=="21" || board=="25" || board=="29" )
    return "1";
  if(board=="02" || board=="06" || board=="10" || board=="14" || board=="18" || board=="22" || board=="26" || board=="30" )
    return "2";
  if(board=="03" || board=="07" || board=="11" || board=="15" || board=="19" || board=="23" || board=="27" || board=="31" )
    return "3";
  if(board=="04" || board=="08" || board=="12" || board=="16" || board=="20" || board=="24" || board=="28" || board=="32" )
    return "4";
}

string getChamberLayer(string obj){

  int layer=getLayer(obj);
  if(layer<=4)
    layer=layer;
  if(layer>=5)
    layer=layer-4;

   return layer;

}
string getChamberPCB(string obj){

  string board=getBoard(obj);
  if(board=="01" || board=="02" || board=="03" || board=="04" )
    return "1";
  if(board=="05" || board=="06" || board=="07" || board=="08" )
    return "2";
  if(board=="09" || board=="10" || board=="11" || board=="12" )
    return "3";
  if(board=="13" || board=="14" || board=="15" || board=="16" )
    return "4";
  if(board=="17" || board=="18" || board=="19" || board=="20" )
    return "5";
  if(board=="21" || board=="22" || board=="23" || board=="24" )
    return "6";
  if(board=="25" || board=="26" || board=="27" || board=="28" )
    return "7";
  if(board=="29" || board=="30" || board=="31" || board=="32" )
    return "8";

}

string getChamberRaxis(string obj){

    int pcb=getChamberPCB(obj);
    if(pcb<=5)
      return "1";
    if(pcb>=6)
      return "2";
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
  dpGet(eltxProjectName(obj)+getDetector(obj)+"_Side"+getSide(obj)+".Sector"+getSector(obj)+".Z"+getChamberZaxis(obj)+".R"+getChamberRaxis(obj)+".Layer"+getChamberLayer(obj)+".PCB"+getChamberPCB(obj)+".Board"+getChamberBoard(obj)+".info.channel",channel);
  return channel;

}



string getBoardType(string obj){

  string type;
  dpGet(eltxProjectName(obj)+getDetector(obj)+"_Side"+getSide(obj)+".Sector"+getSector(obj)+".Z"+getChamberZaxis(obj)+".R"+getChamberRaxis(obj)+".Layer"+getChamberLayer(obj)+".PCB"+getChamberPCB(obj)+".Board"+getChamberBoard(obj)+".info.type",type);
  return type;

}

string getBoardLVChannel(string obj){

  string channel=eltxProjectName(obj)+getDetector(obj)+"_Side"+getSide(obj)+".Sector"+getSector(obj)+".Z"+getChamberZaxis(obj)+".R"+getChamberRaxis(obj)+".Layer"+getChamberLayer(obj)+".PCB"+getChamberPCB(obj)+".Board"+getChamberBoard(obj)+".power.isLVOn";
  return channel;

}

int getBoardState(string obj, string mode){

 int valueState;
 dpGet(eltxProjectName(obj)+getDetector(obj)+"_Side"+getChamberSide(obj)+".Sector"+getChamberSector(obj)+".Z"+getChamberZaxis(obj)+".R"+getChamberRaxis(obj)+".Layer"+getLayer(obj)+".PCB"+getPCB(obj)+".Board"+getBoard(obj)+".state."+mode, valueState);
 return valueState;
}

void setBoardState(string obj, string mode, int valueToSet){

 dpSet(eltxProjectName(obj)+getDetector(obj)+"_Side"+getSide(obj)+".Sector"+getSector(obj)+".Z"+getChamberZaxis(obj)+".R"+getChamberRaxis(obj)+".Layer"+getChamberLayer(obj)+".PCB"+getChamberPCB(obj)+".Board"+getChamberBoard(obj)+".state."+mode, valueToSet);

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


mapping getBoardsListOfChannelAndTypeOfSide(string side){

  dyn_string objectsUnderSide=dpNames("MMG_Side"+side+".*");
  dyn_string objectsUnderSector, objectsUnderZ, objectsUnderR, objectsUnderLayer, objectsUnderPCB, objectsUnderBoard;

  string channel, type;
  mapping channelAndTypeList;

  for(int objectsUnderSector_i=1; objectsUnderSector_i<=dynlen(objectsUnderSide);objectsUnderSector_i++)
  {
    objectsUnderZ=dpNames(objectsUnderSide[objectsUnderSector_i]+".*");
    for(int objectsUnderZ_i=1; objectsUnderZ_i<=dynlen(objectsUnderZ);objectsUnderZ_i++)
      {
        objectsUnderR=dpNames(objectsUnderZ[objectsUnderZ_i]+".*");
        for(int objectsUnderR_i=1;objectsUnderR_i<=dynlen(objectsUnderR);objectsUnderR_i++)
        {
          objectsUnderLayer=dpNames(objectsUnderR[objectsUnderR_i]+".*");
          for(int objectsUnderLayer_i=1;objectsUnderLayer_i<=dynlen(objectsUnderLayer);objectsUnderLayer_i++)
          {
            objectsUnderPCB=dpNames(objectsUnderLayer[objectsUnderLayer_i]+".*");
            for(int objectsUnderPCB_i=1;objectsUnderPCB_i<=dynlen(objectsUnderPCB);objectsUnderPCB_i++)
            {
              objectsUnderBoard=dpNames(objectsUnderPCB[objectsUnderPCB_i]+".*");
              for(int objectsUnderBoard_i=1;objectsUnderBoard_i<=dynlen(objectsUnderBoard);objectsUnderBoard_i++)
              {
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.channel",channel);
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectsUnderBoard_i
            }//objectsUnderPCB_i
          }//objectsUnderLayer_i
        }//objectsUnderR_i
      }//objectsUnderZ_i
    }//objectsUnderSector_i

 return channelAndTypeList;
}

mapping getBoardsListOfChannelAndTypeOfSector(string side, string sector){

  dyn_string objectsUnderSector=dpNames("MMG_Side"+side+".Sector"+sector);
  dyn_string objectsUnderZ, objectsUnderR, objectsUnderLayer, objectsUnderPCB, objectsUnderBoard;

  string channel, type;
  mapping channelAndTypeList;


    objectsUnderZ=dpNames(objectsUnderSector[1]+".*");
    for(int objectsUnderZ_i=1; objectsUnderZ_i<=dynlen(objectsUnderZ);objectsUnderZ_i++)
      {
        objectsUnderR=dpNames(objectsUnderZ[objectsUnderZ_i]+".*");
        for(int objectsUnderR_i=1;objectsUnderR_i<=dynlen(objectsUnderR);objectsUnderR_i++)
        {
          objectsUnderLayer=dpNames(objectsUnderR[objectsUnderR_i]+".*");
          for(int objectsUnderLayer_i=1;objectsUnderLayer_i<=dynlen(objectsUnderLayer);objectsUnderLayer_i++)
          {
            objectsUnderPCB=dpNames(objectsUnderLayer[objectsUnderLayer_i]+".*");
            for(int objectsUnderPCB_i=1;objectsUnderPCB_i<=dynlen(objectsUnderPCB);objectsUnderPCB_i++)
            {
              objectsUnderBoard=dpNames(objectsUnderPCB[objectsUnderPCB_i]+".*");
              for(int objectsUnderBoard_i=1;objectsUnderBoard_i<=dynlen(objectsUnderBoard);objectsUnderBoard_i++)
              {
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.channel",channel);
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectsUnderBoard_i
            }//objectsUnderPCB_i
          }//objectsUnderLayer_i
        }//objectsUnderR_i
      }//objectsUnderZ_i


 return channelAndTypeList;

}

mapping getBoardsListOfChannelAndTypeOfChamber(string chamber){

  // EIZ2R1A01
  string axial=substr(chamber,2,2);
  string radial=substr(chamber,4,2);
  string side=substr(chamber,6,1);
  string sector=substr(chamber,7,2);

  dyn_string objectsUnderLayer, objectsUnderPCB, objectsUnderBoard;

  string channel, type;
  mapping channelAndTypeList;


          objectsUnderLayer=dpNames("MMG_Side"+side+".Sector"+sector+"."+axial+"."+radial+".*");
          for(int objectsUnderLayer_i=1;objectsUnderLayer_i<=dynlen(objectsUnderLayer);objectsUnderLayer_i++)
          {
            objectsUnderPCB=dpNames(objectsUnderLayer[objectsUnderLayer_i]+".*");
            for(int objectsUnderPCB_i=1;objectsUnderPCB_i<=dynlen(objectsUnderPCB);objectsUnderPCB_i++)
            {
              objectsUnderBoard=dpNames(objectsUnderPCB[objectsUnderPCB_i]+".*");
              for(int objectsUnderBoard_i=1;objectsUnderBoard_i<=dynlen(objectsUnderBoard);objectsUnderBoard_i++)
              {
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.channel",channel);
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectsUnderBoard_i
            }//objectsUnderPCB_i
          }//objectsUnderLayer_i


 return channelAndTypeList;

}

mapping getBoardsListOfChannelAndTypeOfChamberLayer(string chamber, int layer){

  // EIZ2R1A01
  string axial=substr(chamber,2,2);
  string radial=substr(chamber,4,2);
  string side=substr(chamber,6,1);
  string sector=substr(chamber,7,2);

  dyn_string  objectsUnderPCB, objectsUnderBoard;

  string channel, type;
  mapping channelAndTypeList;


            objectsUnderPCB=dpNames("MMG_Side"+side+".Sector"+sector+"."+axial+"."+radial+".Layer"+layer+".*");
            for(int objectsUnderPCB_i=1;objectsUnderPCB_i<=dynlen(objectsUnderPCB);objectsUnderPCB_i++)
            {
              objectsUnderBoard=dpNames(objectsUnderPCB[objectsUnderPCB_i]+".*");
              for(int objectsUnderBoard_i=1;objectsUnderBoard_i<=dynlen(objectsUnderBoard);objectsUnderBoard_i++)
              {
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.channel",channel);
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectsUnderBoard_i
            }//objectsUnderPCB_i


 return channelAndTypeList;

}

mapping getBoardsListOfChannelAndTypeOfChamberLayerPCB(string chamber, int layer, int pcb){

  // EIZ2R1A01
  string axial=substr(chamber,2,2);
  string radial=substr(chamber,4,2);
  string side=substr(chamber,6,1);
  string sector=substr(chamber,7,2);

  dyn_string objectsUnderBoard;

  string channel, type;
  mapping channelAndTypeList;

              objectsUnderBoard=dpNames("MMG_Side"+side+".Sector"+sector+"."+axial+"."+radial+".Layer"+layer+".PCB"+pcb+".*");
              for(int objectsUnderBoard_i=1;objectsUnderBoard_i<=dynlen(objectsUnderBoard);objectsUnderBoard_i++)
              {
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.channel",channel);
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.type",type);
                if(channel!="" && type!="")
                  channelAndTypeList[channel]=type;

              }//objectsUnderBoard_i

 return channelAndTypeList;

}


// alternate mapping ChannelAndTypeOfChamberLayerPCB --------------------------------------------------------------------------------------------------------------------------------------------

mapping getBoardsListOfChannelAndTypeOfPCB(string chamber, int layer, int pcb){

  // EIZ2R1A01
  string axial=substr(chamber,2,2);
  string radial=substr(chamber,4,2);
  string side=substr(chamber,6,1);
  string sector=substr(chamber,7,2);

  dyn_string objectsUnderBoard;

  string channel, type;
  dyn_string channelType;
  mapping channelAndTypeList;

              objectsUnderBoard=dpNames("MMG_Side"+side+".Sector"+sector+"."+axial+"."+radial+".Layer"+layer+".PCB"+pcb+".*");
              for(int objectsUnderBoard_i=1;objectsUnderBoard_i<=dynlen(objectsUnderBoard);objectsUnderBoard_i++)
              {
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.channel",channel);
                dpGet(objectsUnderBoard[objectsUnderBoard_i]+".info.type",type);
                channelType[1]=channel;
                channelType[2]=type;

                if(channel!="" && type!="")
                  channelAndTypeList["Board"+objectsUnderBoard_i]=channelType;

              }//objectsUnderBoard_i

 return channelAndTypeList;

}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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

void updateBoardState(string mode, string dpeChannel, int value){

  shape stateShape=getShape(mode+"State");

  if(value==1)
   stateShape.backCol("green");
  if(value==2)
   stateShape.backCol("yellow");
  if(value==3)
   stateShape.backCol("red");

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
