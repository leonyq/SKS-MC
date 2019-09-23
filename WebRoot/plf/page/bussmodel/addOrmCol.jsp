<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><s:property value="%{getText('addOrmCol.title')}"/></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
<body>
<div class="all">
	<div>
	<form id="add_form" name="addForm" action="${path}sys/BussModelAction_addOrmCol.ms" method="post">
		<s:token />
		<input type="hidden" id="MID" name="paraMap.MID" value="<s:property value="paraMap.MID"/>"/>
		<input type="hidden" id="ORMID" name="paraMap.ORMID" value="<s:property value="paraMap.ORMID"/>"/>
	<table class="add_table">
        <tr>
          <td colspan="6"><s:property value="%{getText('addOrmCol.title')}"/>
          	<span class="Point"> <span class="Eng">*</span> 
          	<s:property value="%{getText('common.needInfo')}"/></span>
          	<a title="ID , DEPTID , CREATEUSER , CREATE_TIME , EDITUSER , EDIT_TIME">
          	(<s:property value="%{getText('addOrmCol.info1')}"/>)
          	</a>
          </td>
				</tr>
		<tr>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.COL_NO')}"/></td>
				<td width="30%">
				<s:textfield name="paraMap.COL_NO" id="paraMap_COL_NO" maxlength="15"/>
				<span class="Eng">* <br/><span id="paraMap_COL_NO_err"><c:out value='${errors["paraMap.COL_NO"][0]}' /></span></span>
				</td>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.COL_NAME')}"/></td>
				<td width="30%">
				<s:textfield name="paraMap.COL_NAME" id="paraMap_COL_NAME" maxlength="60"/>
				<span class="Eng">* <br/><span id="paraMap_COL_NAME_err"><c:out value='${errors["paraMap.COL_NAME"][0]}' /></span></span>
				</td>
      </tr>
		<tr>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.COL_TYPES')}"/></td>
				<td width="30%">
					<s:select id="paraMap_COL_TYPES" name="paraMap.COL_TYPES" headerKey="" headerValue="%{getText('common..select.Input')}" 
						list="@com.more.fw.core.common.database.DataBaseFiled@FILED_LIST" listKey="key" listValue="value"  />
				<span class="Eng">* <br/><span id="paraMap_COL_TYPES_err"><c:out value='${errors["paraMap.COL_TYPES"][0]}' /></span></span>
				</td>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.LEN')}"/></td>
				<td width="30%">
				<s:textfield name="paraMap.LEN" id="paraMap_LEN" maxlength="60"/>
				<span class="Eng">* <br/><span id="paraMap_LEN_err"><c:out value='${errors["paraMap.LEN"][0]}' /></span></span>
				</td>
      </tr>
      
		<tr>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.IS_NULL')}"/></td>
				<td width="30%">
				<s:textfield name="paraMap.IS_NULL" id="paraMap_IS_NULL" maxlength="15"/>
				</td>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.DEF_VAL')}"/></td>
				<td width="30%">
				<s:textfield name="paraMap.DEF_VAL" id="paraMap_DEF_VAL" maxlength="60"/>
				</td>
      </tr>
		<tr>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.UI')}"/></td>
				<td width="30%">
				<s:textfield name="paraMap.UI" id="paraMap_UI" maxlength="15"/>
				<span class="Eng">* <br/><span id="paraMap_UI_err"><c:out value='${errors["paraMap.UI"][0]}' /></span></span>
				</td>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.IS_DISP')}"/></td>
				<td width="30%">
				<s:textfield name="paraMap.IS_DISP" id="paraMap_IS_DISP" maxlength="60"/>
				</td>
      </tr>
		<tr>
				<td width="20%" class="tr1"><s:property value="%{getText('addOrmCol.TYPE')}"/></td>
				<td width="30%" colspan="3">
				<s:textfield name="paraMap.TYPE" id="paraMap_TYPE" maxlength="15"/>
				<span class="Eng">* <br/><span id="paraMap_TYPE_err"><c:out value='${errors["paraMap.TYPE"][0]}' /></span></span>
				</td>
      </tr>
     </table>
     </form>
   </div>
   <br />
   <br />
   <br />
   <div class="ptop_10 txac">
		<input type="button" value="<s:property value="%{getText('button.submit')}"/>" onclick="add(this);" class="botton_img_add">
		&nbsp;&nbsp;
		<input type="button" value="<s:property value="%{getText('button.close')}"/>" onclick="parent.closePopWin();" class="botton_img_search">
	</div>
</div>

<script type="text/javascript">
	

	function add(thisObj){
		if(!valData()){
			return ;
		}
		document.forms.add_form.submit();
		thisObj.onclick = function(){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
	}
        
    function valData(){
    	var paraMap_COL_NO = document.getElementById("paraMap_COL_NO");
    	if(val.isBlank(paraMap_COL_NO)){
    		document.getElementById("paraMap_COL_NO_err").innerHTML = "<s:property value="%{getText('addOrm.ORM_NAME')}"/><s:property value="%{getText('common.valdate.info1')}"/>";
    		paraMap_COL_NO.focus();
    		return false;
    	}else{
    		document.getElementById("paraMap_COL_NO_err").innerHTML = "";
    	}
    	var paraMap_COL_NAME = document.getElementById("paraMap_COL_NAME");
    	if(val.isBlank(paraMap_COL_NAME)){
    		document.getElementById("paraMap_COL_NAME_err").innerHTML = "<s:property value="%{getText('addOrm.TABLE_NAME')}"/><s:property value="%{getText('common.valdate.info1')}"/>";
    		paraMap_COL_NAME.focus();
    		return false;
    	}else{
    		document.getElementById("paraMap_COL_NAME_err").innerHTML = "";
    	}
    	
    	return true;
    }

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>