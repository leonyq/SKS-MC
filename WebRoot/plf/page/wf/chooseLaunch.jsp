<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="发起人选择" /></title>
	
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
		
    <jsp:include page="/plf/common/pub_head.jsp">
 		<jsp:param name="zTree" value="1" />
	</jsp:include>
	
	
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>

    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
   
    <style>
        *{
            margin: 0;
            padding: 0;
        }
    
        html,body{
            height: 100%;
            font-size:12px;
        }
    
       
        .selet-btn{
           display: inline-block;
           font-size: 13px;
           color: #333333;
           text-align: center;
           width: 63px;
           height: 28px;
           line-height:30px;
           cursor: pointer;
           border-radius: 2px;
          border: 1px solid #333;
          
        }
        .show-check-node,.del-show-check-node{
		    display: inline-block;
		    width: 32px;
		    height: 30px;
		    line-height: 30px;
		    color: #fff;
		    font-size: 14px;
		    text-align: center;
		    background: #009f95;
            position: absolute;
             cursor: pointer;
             left: 50%;
		    transform: translateX(-50%);
        }
        .show-check-node{
         top:70px;
        }
        .del-show-check-node{
          top:140px;
        }
        .checked-show{
           display: inline-block;
           padding-top:10px;
           vertical-align: top;
           font-size: 14px;
              
        }
       
        .checked-show:after{
         content:"";
         display:block;
         clear:both;
        }
        .select-checked{
           width:293px;
           height:284px;
           box-sizing: border-box;
           border:1px solid rgb(169, 169, 169);
           overflow-y: scroll;
           padding:5px 10px;
           margin-top:5px;
           
        }

        .ischecked input{
           margin-right:5px;
        }
    </style>
</head>
<body>

           <div class="edit" style="height:100%;">
		
		  <ul id="index_tree" class="ztree" style="display: inline-block;width: 450px;height:320px;"></ul>
             <div class="show-check-node">
               &gt
             </div>
             <div class="del-show-check-node">
               &lt
             </div>
             <div class="checked-show">
                <p><dict:lang value="选中的部门和用户" /></p>
                <div class="select-checked">
                
                </div>
            </div>
		
		
		
		
		
		 <div class="ptop_10 txac">
		    <input type='button' value='<dict:lang value="提交" />'  class="layui-btn" onclick="commit(this)">
			<input type="button" value='<dict:lang value="关闭" />'  onclick="closePopWin();" class="layui-btn layui-btn-danger">
				
		 </div>

	</div>
	<div class="dialog-mask" id="backPicDivshadow" style="z-index:1029"></div>
       
    <%-- </div>--%>
    
    <script>
        
    </script>
</body>
</html>

<script type="text/javascript">
var piframeId = "<c:out value='${piframeId}' />"; 
var parentWindows = $(window.parent.document).contents().find(
					"#" + piframeId)[0].contentWindow;
var setting = {
		check: {
			enable: true,
			chkStyle: "checkbox",
			chkboxType :{ "Y" : "", "N" : "" },
		},
		view: { 
			showIcon: true, //设置是否显示节点图标  
			showLine: true, //设置是否显示节点与节点之间的连线  
			},
	    data: {
				simpleData: {
					enable: true,
					pIdKey: "upId"
				}
			},
	   async: { 
				enable:true,   
			},
	  callback: {
		     onExpand : appenduser,
             onClick : appenduser
			}
}

function appenduser(event, treeId, treeNode, clickFlag) {  
                        
                        if(treeNode.stype!=1&&treeNode.stype!=2){  
                            treeNode.stype=1;
                            $.ajax({
                                url: "${path}sys/PostMgrAction_searchUserList.ms",
                                data:{"deptId":treeNode.id},
                                error: function () {//请求失败处理函数
                                    
                                },
                                success:function(data)
                                    {                                        
                                        if(data == null || data == ""){
                                           
                                        }
                                        else{
                                                var treeObj = $.fn.zTree.getZTreeObj("index_tree");
                                                //treeNode.halfCheck = false;
                                                var parentZNode = treeObj.getNodeByParam("id", treeNode.id, null);//获取指定父节点
                                                var userD=data.ajaxPage.dataList;
                                                var jsondata=new Object;;
                                                for(var k=0;k<userD.length;k++){
                                                 jsondata.id=userD[k].ID;
                                                 jsondata.name=userD[k].NAME;
                                                 jsondata.icon="${path}plf/page/fp/img/tree-p.png";
                                                 jsondata.stype=2;
                                                 newNode = treeObj.addNodes(parentZNode,jsondata, false);
                                                }
                                            }
                                    }
                                });
                        } 
                        return false;
                    }
/*var zNodes = [
  {  name: "test1",
	 open: true, 
	 children: [ { name: "test1_1" }, { name: "test1_2" }] 
  },
  {  name: "test2",
	 open: true,
	 children: [  { name: "test2_1" }, { name: "test2_2" }] 
  } ];*/
  
$.ajax({
	type: "POST",
    dataType: "json",
	url: "${path}sys/FuncAction_listDeptTreeByZtree.ms",
	success: function(data){
		if(data){
			var zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
			//var node = zTreeObj.getNodeByTId("tree_1");
			//zTreeObj.expandNode(node, true, false, true);
			var node = zTreeObj.getNodeByParam("id", "FA174AFF136D496A87B65443D22357E3", null);
			if(node!=null){
			  zTreeObj.expandNode(node, true, false, true);
			  zTreeObj.selectNode(node,false); 
			  zTreeObj.setting.callback.onClick(null, zTreeObj.setting.treeId, node);
			}
			 
		   if(parentWindows.launchHt!=null&&parentWindows.launchHt!='')
		   {
		     nodesArry=(parentWindows.launchHt).slice(0);
		     showCheckedNodes();
		   }
		}
		
    },
	error: function(msg){
			util.alert("error:"+msg.responseText);
	  }
	});

//$.fn.zTree.init($("#index_tree"), setting, zNodes);
var nodesArry=[];
function unique(arr){
	 var newArr = [];
	 var newIdArr = [];
	 for(var i=0;i<arr.length;i++){
	   if(newIdArr.indexOf(arr[i].id) == -1){
	           newArr.push(arr[i]);
	           newIdArr.push(arr[i].id);
	    }
	  }
	  return newArr;
 }
function showCheckedNodes(){
	 $(".select-checked").empty();
 	 $.each(nodesArry, function (index, item) { 
 		 $(".select-checked").append("<p class='ischecked'><input type='checkbox' id='"+item.id+"' stype='"+item.stype+"' >"+item.name+"</p>");
 	
     });
}
$(".show-check-node").click(function(){
	var treeObj = $.fn.zTree.getZTreeObj("index_tree");
	var nodes = treeObj.getCheckedNodes(true);
	
	 $.each(nodes, function (index,item) { 
		 
		nodesArry.push(item);
    });
	 nodesArry=unique(nodesArry);
	 showCheckedNodes();
			
});
$(".del-show-check-node").click(function(){
			    var checkedItems=[];
			    $.each($(".ischecked input[type='checkbox']"),function(){
			       if(this.checked){   		
			        	checkedItems.push($(this).attr('id'));
			        	
			       }
			        	      
			     });  
			        		
			    var treeObj = $.fn.zTree.getZTreeObj("index_tree");
			    //console.log(nodesArry,"nodes",checkedItems)
			
			    // $.each(nodesArry,function(i,t){
			    	  
					        
			   // }); 
			    for(var i=0;i<nodesArry.length;i++){
			    	$.each(checkedItems,function(index,item){
			    		 //console.log(nodesArry[i],nodesArry[i].tId)
			    		if(nodesArry[i].id===item){
					 		  nodesArry.splice(i,1);
					 	  }
			    	  });
			    }
			   showCheckedNodes(); 
			   $.each(checkedItems,function(index,item){ 
			       var node = treeObj.getNodeByParam('id',item);
			        treeObj.checkNode(node, false, true);		        
			        
			     });  
		     
		});

	function commit(){
	   var priv_group_ids='';
	   var priv_user_ids='';
	   var privName='';
			    $.each($(".ischecked input[type='checkbox']"),function(){
	
			        if(privName=='') privName=$(this).parents('p').text();
			        else privName+='\n'+$(this).parents('p').text();
			        if($(this).attr('stype')==2){
			        	if(priv_user_ids=='') priv_user_ids=$(this).attr('id');
			        	else priv_user_ids+=';'+$(this).attr('id');
			        }
			        else{
			            if(priv_group_ids=='') priv_group_ids=$(this).attr('id');
			        	else priv_group_ids+=';'+$(this).attr('id');
			        }
			        	      
			     }); 
			    parentWindows.$("#priv_group_ids").val(priv_group_ids);
			    parentWindows.$("#priv_user_ids").val(priv_user_ids);
				parentWindows.$("#launch").html(privName);
				parentWindows.launchHt=nodesArry;
				closePopWin();
	
	}
	

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>