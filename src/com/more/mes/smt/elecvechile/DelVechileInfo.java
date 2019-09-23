package com.more.mes.smt.elecvechile;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bsh.This;

import com.ibm.sslite.w;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;

/**
 * @Description 电子料站删除
 * @ClassName DelVechileInfo
 * @author WZY
 */
public class DelVechileInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String iframeId = request.getParameter("iframeid");

    try
    {
      String arridString = request.getParameter("arrId");
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      if(arridString!=null && !arridString.equals("")) {
    	  String[] arrId = arridString.split(",");// 要删除的id

          String sql = "SELECT WEC_SN FROM T_WMS_ELEC_VECHILE WHERE ID=?";

          String sql1 = "SELECT WEC_STATUS FROM T_WMS_ELEC_VECHILE WHERE ID=?";

          for (int i = 0; i < arrId.length; i++ )
          {
            String id = arrId[i];

            for (int j = 0; j < arrId.length; j++ )
            {
              String ids = CommMethod.escapeJs(arrId[i]);
              List<Map> mList = modService.listDataSql(sql1, new Object[] {ids});
              if(mList!=null && !mList.isEmpty()) {
            	  Map maps = mList.get(0);

                  String wecStatus = (String)maps.get("WEC_STATUS");// 通过id获取料车状态，

                  if (wecStatus.equals("2") || wecStatus == "2" )
                  {
                    return modelAction.alertParentInfo(modelAction.getText("已有料车被占用"));
                  }
                  if (wecStatus.equals("3") || wecStatus == "3")
                  {
                    return modelAction.alertParentInfo(modelAction.getText("已有料车被交接"));
                  }
              }
            }

            List<Map> list = modService.listDataSql(sql, new Object[] {id});
            if(list!=null && !list.isEmpty()) {
            	Map map = list.get(0);
                List list2 = new ArrayList();
                String wecSn = (String)map.get("WEC_SN");// 通过id获取料车SN，
                
                // 删除 T_WMS_ELEC_VECHILE（仓库电子周转料车信息表）的信息， 通过id。
                TableDataMapExt tExt = new TableDataMapExt();
                tExt.setTableName("T_WMS_ELEC_VECHILE");
                tExt.setSqlWhere(" and id =?");
                list2.add(id);
                tExt.setSqlWhereArgs(list2);
                modService.del(tExt);

                // 删除 T_WMS_ELEC_VECHILE_DETAIL （仓库电子周转料车货位信息表）的相关数据
                TableDataMapExt deleExt = new TableDataMapExt();
                deleExt.setTableName("T_WMS_ELEC_VECHILE_DETAIL");
                deleExt.setSqlWhere(" and WEC_SN = ? AND DATA_AUTH = ? ");
                list2.clear();
                list2.add(wecSn);
                list2.add(dataAuth);
                deleExt.setSqlWhereArgs(list2);
                modService.del(deleExt);
            }
          }
      }else{
          return modelAction.alertParentInfo(modelAction.getText("需要删除的id为空"));
      }
      
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }

    return modelAction.reloadIframeById(iframeId, modelAction.getText("删除成功"));
  }

}
