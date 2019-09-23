<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
					
<tr> 
     <td class="title tr1" > <dict:lang value="是否记忆" />  </td>
     <td>
       <dict:selectDict dictCode="YESNO" dictValue="%{paraMap.SAVE_MARK}"  
   
       custom_option="<option value=''>%{getText('--请选择--')}</option>" 
       id="paraMap_SAVE_MARK"   name="paraMap.SAVE_MARK"   filterVal="2"/>
     </td>
</tr> 