<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<!DOCTYPE html>
<html lang='en'>
<%@ include file="/plf/common/pub_tag.jsp" %>
<head>
<%@ include file="/plf/common/pub_meta.jsp" %>
<meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title></title>
    
    <jsp:include page="/plf/common/pub_head.jsp" />
    
    <link rel="stylesheet" href="${path}/plf/page/inf/ding/ztree/css/zTreeStyle/zTreeStyle.css">
    <script src="${path}/plf/page/inf/ding/ztree/js/jquery-1.12.4.min.js"></script>
	<script src="${path}/plf/page/inf/ding/ztree/js/jquery.ztree.core.min.js"></script>
	<script src="${path}/plf/page/inf/ding/ztree/js/jquery.ztree.excheck.min.js"></script>
	<script src="${path}/plf/page/inf/ding/ztree/js/jquery.ztree.exhide.min.js"></script>

    <style>
        *{
            margin: 0;
            padding: 0;
        }
    
        html,body{
            height: 100%;
            font-size: 12px;
        }

        .container{
            height: 570px;
            width: 900px;
           
            box-sizing: border-box;
            padding: 10px 20px;
        }

        .container .search{
            height: 25px;
            position: relative;
        }
        
        .container .search>*{
            float: left;
        }

        .container .search input{
            height: 100%;
            width: 160px;
            box-sizing: border-box;
            margin-right:10px; 
            padding-left: 25px;
        }
        
        .container .search img{
            position: absolute;
            width: 15px;
            height: 15px;
            left: 5px;
            top:5px;
        }

        .container .main{
            height: 480px;
            margin-top: 10px;
        }

        .container .main>*{
            float: left;
        }

        .container .main .left{
            height: 100%;
            width: 300px;
            margin-right:10px; 
            border: 1px solid #ddd;
            box-sizing: border-box;
            overflow:auto;
        }
        
        .container .main .top{
            width: calc(100% - 310px);
            height: 240px;
            background-color: #f0f0f0;
            padding-top:20px; 
            box-sizing: border-box;
            overflow: auto;
        }

        .container .main .top ul{
            list-style: none;
        }

        .container .main .top ul li{
            position: relative;
            float: left;
            margin:0 15px;
            margin-bottom: 22px;
            height: 26px;
        }

        .container .main .top ul li .name{
            padding: 5px 12px;
            background-color: #ddd;
            font-size: 12px;
            line-height: 1;
            color: #333;
            border-radius:2px; 
            cursor: pointer;
        }

        .container .main .top ul li .close{
            position: absolute;
            width: 12px;
            height: 12px;
            background-image: url(${path}/plf/page/inf/ding/img/ico-delete.png);
            top: -6px;
            right:-6px;
            display: none;
            cursor: pointer;
        }

        .container .main .top ul li:hover .close{
            display: block;
        }

        .container .main .bottom{
            margin-top: 20px;
            width: calc(100% - 310px);
            height: 220px;
            border: 1px solid #ddd;
            box-sizing: border-box;
            padding: 20px;
        }
        
        .container .main .bottom .explain{
            width: 80px;
            height: 27px;
            background-color: #004098;
            color: #fff;
            text-align: center;
            line-height: 27px;
            font-size: 12px;
        }

        .container .main .bottom ul{
            list-style: none;
        }

        .container .main .bottom ul li{
            margin-top: 10px;
        }

        .container .main .bottom .asterisk{
            color: #dd4b39;
            margin-top:20px; 
        }

        .container .buttons{
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class='container'>
        <div class="search">
        		<input type="text" placeholder="请输入人名" id="searchname" name="searchname">
            	<button class="search-btn">搜索</button>
            	<img src="${path}/plf/page/inf/ding/img/ico-search.png">
            	
        	<form id="add_form" name="addForm" action="${path}ding/dingAction_addTaskDing.ms" method="post" target="submitFrame">
            	<input type="hidden" id="type" name="paraMap.TYPE" />
    			<input type="hidden" id="task_id" name="paraMap.TASK_ID" />
    			<input type="hidden" id="ding_user_ids" name="paraMap.DING_USER_IDS" />
    	
            </form>
        </div>
        <div class="main">
            <div class="left">
            	<ul id="treeDemo" class="ztree"></ul>
            </div>
            
            <div class="top">
                <ul class="userBox">
                	<!-- 
                    <li><span class="name">柯南海</span><span class="close"></span></li>
                    -->
                    
                    <s:iterator value="ajaxList" status="index">
				    	<li id="<s:property value="TASK_ID"/>">
				    		<span class="name"><s:property value="NAME"/></span>
				    		<span class="close" id="t_<s:property value="ID"/>" onclick="close_click('<s:property value="ID"/>')"></span>
				    	</li>
				    </s:iterator>
    
                </ul>
            </div>
            <div class="bottom">
                <div class="explain">限流说明</div>
                <ul>
                    <li>1、给同一用户发相同内容消息一天仅允许一次</li>
                    <li>2、同一接口调用频率为1500分钟</li>
                    <li>3、给同一用户发消息一天不超过500次</li>
                    <li>4、长度不能超过5000个字</li>
                </ul>
                <p class="asterisk">* 用户被禁言因发送消息过于频繁或超量而被流控过滤后实际未发送的userid。未被限流的接收者仍会被成功发送</p>
            </div>
        </div>
        <p class="buttons">
            <button class="btn botton_img_add">提交</button>
            <button onclick="reset()" class='botton_img_search'>重置</button>
            <button onclick="parent.closePopWin();" class='botton_img_search'>关闭</button>
        </p>
    </div>
    
</body>

<script>
    function getUserIds() {
        var r='';
        $('.userBox>li').each(function () {
            r+='|'+this.id;
        });
        return r.replace(/^\|/,'');
    }
    function getUsernames() {
        var r='';
        $('.userBox>li').each(function () {
            r+='|'+$(this).children('span').text();
        });
        return r.replace(/^\|/,'');
    }
    function removeItem(treeNode) {
        $('#'+treeNode.id).remove();
    }
    function addItem(treeNode) {
        /*removeItem(treeNode);
        if(treeNode.isParent)return;*/
        $('.userBox').append('<li id="'+treeNode.id+'">\n' +
            '       <span class="name">'+treeNode.name+'</span>\n' +
            '       <span class="close" id="t_'+treeNode.id+'" onclick="close_click(\''+treeNode.id+'\')" ></span>\n' +
            '   </li>');
    }
    function getCheckedChildNodes() {
        var allNodes=treeObj.transformToArray(treeObj.getNodesByParam('level',0,null));
        var r=[];
        $.each(allNodes,function (i, v) {
            if(this.checked&&!this.isParent){
                r.push(this);
            }

        })
        return r;
    }
    var setting = {
        /*async: {
            enable: true,
            url:"/ding/getUsersTreeAsync",
            autoParam:["id"],
            dataFilter:function (treeId, parentNode, responseData) {
                var ids=getUserIds();
                var idArr=ids.split('|');
                for(var i=0;i<responseData.length;i++){
                    var node=responseData[i];
                    var index=$.inArray(node.id,idArr);
                    if(index!=-1){
                        node.checked=true;
                    }
                }
                return responseData;
            }
        },*/
        check: {
            enable: true
        },
        callback: {
            onCheck: function (event, treeId, treeNode) {
                var nodes=getCheckedChildNodes();
                $('.userBox>li').remove();
                for(var i=0;i<nodes.length;i++){
                    var node=nodes[i];
                    addItem(node);
                }
            }

        },
        data: {
            simpleData: {
                enable: true,
                pIdKey: "upId"
            }
        }
    };
    var treeObj;
    /*$.ajax({
        url:'/ding/getUsersTree',
        data:{userIds:'010542220329075253|0506424938074037'},
        success:function (res) {
             treeObj=$.fn.zTree.init($("#treeDemo"), setting,res);
        }
    })*/
    
    var type='<s:property value="paraMap.TYPE" />';
    var task_id='<s:property value="paraMap.TASK_ID" />';
    
    $.ajax({
        url:'${path}ding/dingAction_getDingUserByztree.ms?paraMap.TYPE='+type+'&paraMap.TASK_ID='+task_id,
        success:function (res) {
        	console.log(res.ajaxList);
            treeObj=$.fn.zTree.init($("#treeDemo"), setting,res.ajaxList);
            
            treeObj.expandAll(true);
            
        }
    })

    // treeObj = $.fn.zTree.init($("#treeDemo"), setting);
    $('.btn').click(function () {
        var nodes=getCheckedChildNodes();
        var r=[];
        var ding_user_ids='';
        for(var i=0;i<nodes.length;i++){
            var node=nodes[i];
            r.push({
                dingUserId:node.id
            })
            
            if(ding_user_ids==''){
            	ding_user_ids=node.id+",";
            }else{
            	ding_user_ids=ding_user_ids+node.id+",";
            }
            
        }
        //todo 把r数组ajax请求到后台批量插入MS_TASK_DING_USER
        console.log(r);
        
        if(isSubmit){util.alert("数据正在提交，请稍候...")};
        
		 var type='<s:property value="paraMap.TYPE" />';
    	 var task_id='<s:property value="paraMap.TASK_ID" />';
         document.getElementById('type').value=type;
         document.getElementById('task_id').value=task_id;
         document.getElementById('ding_user_ids').value=ding_user_ids;
         
         if(ding_user_ids==''){
        	util.alert("请先勾选钉钉企业用户...");
        	return;
         }
		
		document.forms.add_form.submit();
		isSubmit = true;
		
    })
    
    $(document).on('click','.userBox i',function () {
        if(!treeObj)return;
        var id=$(this).parent().attr('id');
        $(this).parent().remove();
        var node=treeObj.getNodeByParam("id", id, null);
        treeObj.checkNode(node, false, true);
    }).on('click','.search-btn',function () {
        var val=$.trim($(this).prev().val());
        
        //if(val==''){
        //	util.alert("请输入人名搜索...");
        //}
        
        var nodes=treeObj.getNodesByParamFuzzy("name", $(this).prev().val(), null);
        var nodeArr;

        if(!val||!nodes||nodes.length==0){

            treeObj.showNodes(treeObj.transformToArray(treeObj.getNodesByParam('level',0,null)));
            return;
        }

        for(var i=0;i<nodes.length;i++){
            if(i==0){
                nodeArr=nodes[i].getPath();
            }else{
                var paths=nodes[i].getPath();
                for(var j=0;j<paths.length;j++){
                    nodeArr.push(paths[j]);
                }
            }
        }
        var cNodes=treeObj.transformToArray(nodes);
        for(var z=0;z<cNodes.length;z++){
            nodeArr.push(cNodes[z]);
        }
        var roots=treeObj.getNodesByParam('level',0,null);

        for(var k=0;k<roots.length;k++){
            var root=roots[k];
            var tNodes=distinctNodes(nodeArr);
            recurShow(root,tNodes);
        }
        treeObj.expandAll(true);

    });
    
    
    //对node进行去重
    function distinctNodes(nodes) {
        var arr=[];
        for(var i=0;i<nodes.length;i++){
            if(!inNodes(nodes[i],arr)){
                arr.push(nodes[i]);
            }
        }
        return arr;

    }
    /**
     *
     * @param roots 所有根节点
     * @param nodes 所有要显示的节点
     */
    function recurShow(root, nodes) {
        if(!inNodes(root,nodes)){
            treeObj.hideNode(root);
            return;
        }
        var children=root.children;
        treeObj.showNode(root);
        if(!children){
            return;
        }
        treeObj.hideNodes(children);
        for(var j=0;j<children.length;j++){
            if(inNodes(children[j],nodes)){
                treeObj.showNode(children[j]);
                recurShow(children[j],nodes);
            }
        }
    }
    function inNodes(node, nodes) {
        for(var i=0;i<nodes.length;i++){
            if(node.id==nodes[i].id){
                return true;
            }
        }
        return false;
    }
    
    var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reset(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		treeObj.checkAllNodes(false); 
		
		$('.userBox>li').remove();
		
	}

	 function close_click(id){
	 	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	 	var node = treeObj.getNodeByParam("id", id, null);
	 	treeObj.checkNode(node, false, false);
	 	
	 	$('#t_'+id).parent().remove();
	 	
	 }
	
</script>

</html>
