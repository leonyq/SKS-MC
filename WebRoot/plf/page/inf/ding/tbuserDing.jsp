<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="钉钉平台企业" /> 
	</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>

    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title></title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
    
        html,body{
            height: 100%;
            font-size:14px;
        }
    
        .container{
            height: 315px;
            width: 625px;
            padding:0px 40px;
            padding-top: 50px; 
            box-sizing: border-box;

        }

        .container .msg{
            text-align: center;
        }

        .container .msg img{
            height: 40px;
            vertical-align: middle;
            margin-right: 20px;
        }
        
        .container p{
            text-align: center;
            margin-top: 25px;
        }

        .container p .count{
            font-size: 20px;
            color: #00c66b;
            font-family: 'arial'
        }

        .container p .err{
            color: #dd4b39;
        }

        .container textarea{
            resize: none;
            width: 100%;
            height: 300px;
            margin-top: 20px;
            margin-left: 10px;
            padding: 5px;
            box-sizing: border-box;
            outline: none;
        }
    </style>
<body>
    <div class='container'>
        <div class="msg">
            <img src="${path}/plf/page/inf/ding/img/ico-correct.png">
            <span>
	            
	          <s:if test="ajaxMap.result!=null">
               	 已同步完成
              </s:if>
              
              <s:if test="ajaxMap.result==null">
                                                同步异常
              </s:if>
              
            </span>
        </div>
        <p>同步成功 <span class="count"><s:property value="ajaxMap.result_num_succ"/></span> 人，未匹配人数 <span class="count err"><s:property value="ajaxMap.result_num_err"/></span> 人</p>
        <textarea>未匹配用户有：<s:property value="ajaxMap.result_name_err"/></textarea>
        <!-- 默认不显示，存在未匹配人数时显示 -->
    </div>
    
    <script>
        
    </script>
</body>
</html>


<script type="text/javascript">
var isSubmit = false;
function reloadPg(msg){
	isSubmit = false;
	window.parent.reloadPg(msg);
}

function alertInfo(msg){
	isSubmit = false;
	util.alert(msg);
}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>