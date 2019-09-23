/**
 *根据asn 获取货架层数与货位
 */
function sortInfo(asn,allData){
	var shelvesObject = new Object();//货架数组
	var shelvesArray=new Array();
	var singleSide=new Object();//单面数组
	var positiveSize=new Object();//正面数组
	var otherSide=new Object();//正面数组
	var layerServen=new Array();
	var sOne=new Array();
	var sTwo=new Array();
	var sThree=new Array();
	var sFour=new Array();
	var sFiver=new Array();
	var sSix=new Array();
	var sServen=new Array();
	var aOne=new Array();
	var aTwo=new Array();
	var aThree=new Array();
	var aFour=new Array();
	var aFiver=new Array();
	var aSix=new Array();
	var aServen=new Array();
	var bOne=new Array();
	var bTwo=new Array();
	var bThree=new Array();
	var bFour=new Array();
	var bFiver=new Array();
	var bSix=new Array();
	var bServen=new Array();
			for (var i = 0; i < allData.length; i++) {
				if (asn == allData[i].WA_SUPERIOR_SN) {
					var arlength=allData[i].WSI_STORAGE_CODE.length;
					var layer = parseInt(allData[i].WA_STOREY_NO);
					var column = parseInt(allData[i].WA_FLOW_NO);
					var dull=allData[i].WSI_ITEM_FLAG;
					if(dull=="良品"){
						dull=allData[i].DULL;
					}
					var data = {
						"layer" : layer,
						"column" : column,
						"arsn" : allData[i].WSI_STORAGE_CODE,
						"starogeType":allData[i].WA_STAROGE_TYPE,
						"waFace":allData[i].WA_FACE,
						"dull":dull,
						"orderValue":layer+""+allData[i].WA_FLOW_NO
					};
					if(allData[i].WA_FACE=="S"){
						shelvesObject.faceS="S";
					}
					if(allData[i].WA_FACE=="A"){
						shelvesObject.faceA="A";
					}
					if(allData[i].WA_FACE=="B"){
						shelvesObject.faceB="B";
					}
					shelvesArray.push(data);
					var layType=allData[i].WA_FACE+layer;
					
				}
			}
			shelvesArray=arraySort(shelvesArray);
			for(var i=0;i<shelvesArray.length;i++){
					var layType=shelvesArray[i].waFace+shelvesArray[i].layer;
					switch(layType)
						{
						case "S1":sOne.push(shelvesArray[i]); break;
						case "S2":sTwo.push(shelvesArray[i]);break;
						case "S3":sThree.push(shelvesArray[i]);break;
						case "S4":sFour.push(shelvesArray[i]);break;
						case "S5":sFiver.push(shelvesArray[i]);break;
						case "S6":sSix.push(shelvesArray[i]);break;
						case "S7":sServen.push(shelvesArray[i]);break;
						case "A1":aOne.push(shelvesArray[i]); break;
						case "A2":aTwo.push(shelvesArray[i]);break;
						case "A3":aThree.push(shelvesArray[i]);break;
						case "A4":aFour.push(shelvesArray[i]);break;
						case "A5":aFiver.push(shelvesArray[i]);break;
						case "A6":aSix.push(shelvesArray[i]);break;
						case "A7":aServen.push(shelvesArray[i]);break;
						case "B1":bOne.push(shelvesArray[i]); break;
						case "B2":bTwo.push(shelvesArray[i]);break;
						case "B3":bThree.push(shelvesArray[i]);break;
						case "B4":bFour.push(shelvesArray[i]);break;
						case "B5":bFiver.push(shelvesArray[i]);break;
						case "B6":bSix.push(shelvesArray[i]);break;
						case "B7":bServen.push(shelvesArray[i]);break;
						default:
						  
						}
				
			}
			shelvesObject.singleSide={
				S1:sOne,
				S2:sTwo,
				S3:sThree,
				S4:sFour,
				S5:sFiver,
				S6:sSix,
				S7:sServen,
			};
			shelvesObject.positiveSize={
				A1:aOne,
				A2:aTwo,
				A3:aThree,
				A4:aFour,
				A5:aFiver,
				A6:aSix,
				A7:aServen,
			};
			
			shelvesObject.otherSide={
				B1:bOne,
				B2:bTwo,
				B3:bThree,
				B4:bFour,
				B5:bFiver,
				B6:bSix,
				B7:bServen,
			};
			if(sServen.length>0||aServen.length>0||bServen.length>0){
				shelvesObject.layer=7;
				
			}else if(sSix.length>0||aSix.length>0||bSix.length>0){
				shelvesObject.layer=6;
			}else if(sFiver.length>0||aFiver.length>0||bFiver.length>0){
				shelvesObject.layer=5;
			}else if(sFour.length>0||aFour.length>0||bFour.length>0){
				shelvesObject.layer=4;
			}else if(sThree.length>0||aThree.length>0||bThree.length>0){
				shelvesObject.layer=3;
			}else if(sTwo.length>0||aTwo.length>0||bTwo.length>0){
				shelvesObject.layer=2;
			}else{
				shelvesObject.layer=1;
			}
			return shelvesObject;
	
}

/**
*冒泡排序货架层数信息
 */
function arraySort(array) {
	var i = 0, len = array.length;
	var temp;
	for (var i = 0; i < len; i++) {
		
			for (j = 0; j < len; j++) {
				if (array[i].orderValue < array[j].orderValue) {
					temp = array[j];
					array[j] = array[i];
					array[i] = temp;
				}
			}
		}
			return array;
}