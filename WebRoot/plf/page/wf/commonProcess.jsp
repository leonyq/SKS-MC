<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
 <style>
        .card-icon{
	   display: inline-block;
	    width: 50px;
	    height: 50px;
	    background:#999;
	    vertical-align: middle;
        line-height: 50px;
        text-align: center;
        border-radius: 4px;
        padding:10px 0;
        box-sizing: border-box;
  }
  .card-icon img{
	    width:28px;
	    user-select: none;
	    
	  }
        
    </style>

<script type="text/javascript"><%-- 业务模型公用JS页面 --%>


function clickLocale()
{
  $('#upFile').click();
}
function reloadPg(msg){
	isSubmit = false;
	window.parent.reloadPg(msg);
}

function alertInfo(msg){
	isSubmit = false;
	util.alert(msg);
}

function chooseSysPic(){
      var piframeId = window.frameElement.id;
      //alert(piframeId);
      var url='${path}/comm/WorkFlowAction_chooseSysPic.ms'+'?mcIframeName='+window.name+'&piframeId='+piframeId;
      showPopWin(url, 800, 430,null,"<dict:lang value='系统图标库' />");
    }

function chooseLaunch(){
      var piframeId = window.frameElement.id;
      //alert(piframeId);
      var url='${path}/comm/WorkFlowAction_chooseLaunch.ms?mcIframeName='+window.name+'&piframeId='+piframeId;
      showPopWin(url, 800, 430,null,"<dict:lang value='发起人选择' />");
    }
function selectLoc(obj){
  var f = document.getElementById("upFile").files; 
   $("#iconPath").val(f[0].name); 
  $("#selectType").val('local');
  _setImagePreview('photoImg','preview','upFile');
}
 //图片上传控件预览
	function _setImagePreview(photoImgID,previewID,upFileID){
			//显示删除图片按钮
			//新增
			var del_img_id=photoImgID.replace("photoImg","").replace("$","");
			if(photoImgID.indexOf('_a')==-1){
				del_img_id=del_img_id+'_a';
			}
			var del_img_obj=document.getElementById(del_img_id);
			if(del_img_id!=null && del_img_id!='' && del_img_obj!=null){
				del_img_obj.style.display = '';
			}
			//编辑
			var tmp='upFile'+del_img_id;
			tmp=tmp.replace("_a","");
			if(document.getElementById(tmp)!=null){
				var tname=$('#'+tmp).attr('name');
				if(tname!=null){
					var temp=tname.replace(".","_")+"_a";
					if(temp!=null){
						if(document.getElementById(temp)!=null){
							document.getElementById(temp).style.display = '';
						}
						
					}
					
				}
				
			}
	
			var hhotoObj = document.getElementById(upFileID);
			var imgObjPreview = document.getElementById(previewID);
			if (hhotoObj.files && hhotoObj.files[0]) {
				//火狐下，直接設img属性
				imgObjPreview.style.display = 'inline-block';
				//imgObjPreview.style.width = '120px';
				//imgObjPreview.style.height = '60px';
				imgObjPreview.src = window.URL.createObjectURL(hhotoObj.files[0]);
			}else{
				//IE下，使用滤镜
				hhotoObj.select();
				var imgSrc = document.selection.createRange().text;
				document.selection.empty();
				var imgId = document.getElementById(photoImgID);
				//imgId.style.width = '120px';
				//imgId.style.height = '60px';
				try {
					imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				} catch (e) {
					utilsFp.confirmIcon(3,"","","", "<dict:lang value='图片格式不支持，请重新选择(.png后缀格式的图片)' />",0,"300","");
					return false;
				}
				imgObjPreview.style.display = 'none';
				//document.selection.empty();
			}
			return true;
		}
</script>