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
  
  <script src="${path}/plf/page/inf/ding/ztree/js/clipboard.js"></script>

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
        }

        .container .buttons{
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class='container'>

        <div class="main">
            <div class="left">
              <ul id="treeDemo" class="ztree"></ul>
            </div>
            
			<blockquote class="layui-elem-quote">
				<div class="explain">说明</div>
                <ul style="color:red;">
                    <li>1、只展示有成功绑定钉钉的用户数据</li>
                    <li>2、点击有绑定钉钉的用户节点可以复制绑定的钉钉ID</li>

					<input type='hidden' id='copytxt_id' class='copytxt_cls' data-clipboard-action="copy"/>

                </ul>
			</blockquote>
			<%--
            <div class="bottom">
                <div class="explain">说明</div>
                <ul style="color:red;">
                    <li>1、只展示有成功绑定钉钉的用户数据</li>
                    <li>2、点击有绑定钉钉的用户节点可以复制绑定的钉钉ID</li>

					<input type='hidden' id='copytxt_id' class='copytxt_cls' data-clipboard-action="copy"/>

                </ul>
            </div> --%>
        </div>

    </div>
    
</body>


<script>
    //兼容复制到剪贴板
  function copyToClipboard(txt) {
    if(window.clipboardData)
    {
    window.clipboardData.clearData();
    window.clipboardData.setData("Text",txt);
    }
    else if(navigator.userAgent.indexOf("Opera") != -1)
    {
    window.location = txt;
    }
    else if (window.netscape)
    {
    try {
    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
    }
    catch (e)
    {
    }
    var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
    if (!clip) return;
    var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
    if (!trans) return;
    trans.addDataFlavor('text/unicode');
    var str = new Object();
    var len = new Object();
    var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
    var copytext = txt;
    str.data = copytext;
    trans.setTransferData("text/unicode",str,copytext.length*2);
    var clipid = Components.interfaces.nsIClipboard;
    if (!clip) return false;
    clip.setData(trans,null,clipid.kGlobalClipboard);
    }
  }

    var setting = {
    	view: {
    		showLine: false
        },
        check: {
            enable: false
        },
        callback: {
           onClick: zTreeOnClick
        },
        data: {
            simpleData: {
                enable: true,
                pIdKey: "upId"
            }
        }
    };
    var treeObj;
    
    var dept_id='<s:property value="ajaxMap.DEPT_ID" />';
    
    $.ajax({
        url:'${path}ding/dingAction_ckuserbyztree.ms?paramMap.DEPT_ID='+dept_id,
        success:function (res) {
          //console.log(res.ajaxList);
            treeObj=$.fn.zTree.init($("#treeDemo"), setting,res.ajaxList);
		var nodes = treeObj.getNodes();
		if (nodes.length>0) {
		    for(var i=0;i<nodes.length;i++){
		    treeObj.expandNode(nodes[i], true, false, false);
		    }
		}
            //treeObj.expandAll(true);
            
        }
    })


        
  function zTreeOnClick(event, treeId, treeNode){
    var name=treeNode.name;
    if(name.indexOf('(')!=-1 && name.indexOf(')')!=-1){
      var beg=name.indexOf('(');
      var end=name.indexOf(')');
      var ding_user_id=name.substring(beg+1,end);
      
      if(ding_user_id!=null && ding_user_id!=''){
         //copyToClipboard(ding_user_id)
         //util.alert("该用户绑定的钉钉ID已经复制到剪贴板");
         
        $("#copytxt_id").attr("data-clipboard-text", ding_user_id);
        $("#copytxt_id").trigger("click");
        
      }
      
    }
    
    }
    
    
    

    
    $(document).ready(function(){
      var clipboard = new ClipboardJS('.copytxt_cls');
	  clipboard.on('success', function(e) {
	       //alert('该用户绑定的钉钉ID已经复制到剪贴板');
	       util.alert("<dict:lang value="该用户绑定的钉钉ID已经复制到剪贴板" />");
	  });
    
    });
  
</script>

</html>
