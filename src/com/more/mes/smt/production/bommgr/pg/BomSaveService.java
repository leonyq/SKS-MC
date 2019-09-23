
package com.more.mes.smt.production.bommgr.pg;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 
 * @Title <新增bom信息>
 * @Description <新增bom信息> 
 * @ClassName BomSaveService
 * @see BomSaveService
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class BomSaveService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // 获取封装的数据
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String cbItemCode = request.getParameter("paraMap0@0#CB_ITEM_CODE");
    String cbVer = request.getParameter("paraMap0@0#CB_VER");
    String cbDefault = request.getParameter("paraMap0@0#CB_DEFAULT");
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    Map map = modelService.getAddComm(request, modelAction.getCurrUser(), modelAction);
    String sql="SELECT * FROM (SELECT ROW_NUMBER () OVER (ORDER BY ID ASC) AS ROWNUM,ID	FROM t_co_bom WHERE	 CB_ITEM_CODE= ? AND CB_VER= ? AND DATA_AUTH=?) AS rrr WHERE	ROWNUM = 1";
    //String sql = "select id from t_co_bom where rownum=1 and CB_ITEM_CODE=? AND CB_VER=?";
    List list = modelService.listDataSql(sql, new Object[] {cbItemCode, cbVer,dataAuth});
    if (null!=list &&  list.size() > 0)
    {
      // return
      // modelAction.alertParentInfo((modelAction.getText("机种料号"+cbItemCode+"对应版本"+cbVer+"已经存在！")));
      return modelAction.alertParentInfo((modelAction.getText("该机种料号已存在对应版本")));
    }
    String sql_s = "select * from t_co_bom where CB_ITEM_CODE=? AND CB_DEFAULT=? AND DATA_AUTH=? ";
    if ("Y".equals(cbDefault))
    {
      List lists = modelService.listDataSql(sql_s, new Object[] {cbItemCode, "Y",dataAuth});
      if (null!=list &&  lists.size() > 0)
      {
        return modelAction.alertParentInfo((modelAction.getText("该机种料号已存在默认标志")));
      }
    }
    for (Object key : map.keySet())
    {
      String tempCode = null;
      String tempCode1 = null;
      if (key.toString().equals("b9f80468a9fe4b74ada4fceff23db738"))
      {
        JSONArray array = JSONArray.fromObject(map.get(key));
        for (int i = 0; i < array.size(); i++ )
        {
          tempCode = array.getJSONObject(i).get("CBD_ITEM_CODE").toString();
          if (cbItemCode.equals(tempCode))
          {
            return modelAction.alertParentInfo(modelAction.getText("机种料号" + cbItemCode + "和物料号"
                                                                   + tempCode + "不能相同！"));
            // return
            // modelAction.alertParentInfo(modelAction.getTexts("机种料号%s和物料号%s不能相同",cbItemCode,tempCode));
          }
          for (int j = i + 1; j < array.size(); j++ )
          {
            tempCode1 = array.getJSONObject(j).get("CBD_ITEM_CODE").toString();
            if (tempCode1.equals(tempCode))
            {
              // return
              // modelAction.alertParentInfo(modelAction.getTexts("物料号%s和物料号%s不能相同",tempCode1,tempCode));
              return modelAction.alertParentInfo(modelAction.getText("物料号重复:") + tempCode1);
            }
          }
        }

      }
    }
    modelService.addComm(request, modelAction.getCurrUser(), modelAction);
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
    /*
     * if (StringUtils.isBlank(isCloseWin)) { return
     * modelAction.alertInfoClear(modelAction.getText("新增成功"), "2"); } else { return
     * modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
     * Constants.OPERATE_TYPE_ADD); // return
     * modelAction.reloadParent(modelAction.getText("新增成功")); }
     */
  }

}
