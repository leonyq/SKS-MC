/**
 * 
 */
package com.more.buss.eis.bd.factoryModel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.base.login.model.DeptDto;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DhtmlXTreeUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.DtreeBean;
import com.more.fw.core.dbo.model.dto.DtreeItemBean;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @author development
 *
 */
public class listfactoryTree implements FuncService
{

  /* (non-Javadoc)
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction, com.more.fw.core.dbo.model.service.ModelService)
   */
  @Override
  public String exeFunc(ModelAction modelaction, ModelService modelservice)
  {
    String pid = modelaction.getRequest().getParameter("id");
    if (StringUtils.isBlank(pid))
    {
      pid = Constants.DEPT_TREE_ROOT_ID;
    }
    // TODO Auto-generated method stub
    /*String sql = "select * from T_CO_AREA where 1=1";
    List l;
    l = modelservice.listSql(sql, null, null, null, null, null);
    modelaction.setDataList(l);*/
    String deptTreeXml = listTree(pid,modelservice);
    System.out.println("deptTreeXml===="+deptTreeXml);
    return modelaction.outXml(deptTreeXml, Constants.CHARACTER_ENCODING_DEFAULT);
   // return modelaction.ActionForwardExeid("modelAction.getExeid()");  
  }
  
  /**
   * 列表显示树菜单数据
   * 
   * @param pid
   * @return
   */
  public String listTree(String pid,ModelService modelservice)
  {
    String isOpen = null;
    String isSelect = null;
    if (Constants.DEPT_TREE_ROOT_ID.equals(pid))
    {
      isOpen = DhtmlXTreeUtil.ENABLE;
      isSelect = DhtmlXTreeUtil.ENABLE;
    }
    Map<String, Object> mapParam = new HashMap<String, Object>();
    DeptDto deptDtoSh = new DeptDto();
    deptDtoSh.setUpId(pid);
    String sqlWhere = DeptDto.createHqlWhere(deptDtoSh, "A", mapParam);
    String hql = DeptDto.MAPPING_FETCH;
    String hqlCount = DeptDto.MAPPING_COUNT;
    String orderBy = "order by A.name";
   // List<DeptDto> list = this.getBaseDao().listHql(hql, hqlCount, null, sqlWhere, mapParam,orderBy);
    String sql = "select * from T_CO_AREA where 1=1";
    List list = modelservice.listSql(sql, null, null, null, null, null);
    DtreeBean dtreeBean = new DtreeBean();
    dtreeBean.setId(pid);
    if (null != list && list.size() > 0)
    {
      List<DtreeItemBean> itemlist = new ArrayList<DtreeItemBean>();
//      for (DeptDto dto : list)
//      {
//        DtreeItemBean itemBean = new DtreeItemBean();
//        itemBean.setId(dto.getId());
//        itemBean.setText(dto.getName());
//        itemBean.setIm0("leaf.gif");
//        itemBean.setIm1("folderOpen.gif");
//        itemBean.setIm2("folderClosed.gif");
//        itemBean.setChild("1");
//        itemBean.setOpen(isOpen);
//        itemBean.setSelect(isSelect);
//        itemlist.add(itemBean);
//      }
      dtreeBean.setItemlist(itemlist);
    }
    return DhtmlXTreeUtil.getTree(dtreeBean);
  }

}
