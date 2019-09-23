package com.more.mes.labelmanage.template;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.common.method.MCConstants;

/**
 * @Title 删除标签模板
 * @Description 〈功能详细描述〉
 * @ClassName DelTemplate
 * @author csh
 * @version 1.0 developer 2018-3-29 created
 * @see DelTemplate
 * @since 2018-3-29
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class DelTemplate implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String delId = modelAction.getRequest().getParameter("delId");
    String code = CommMethod.getSessionUser().getPartitionCode();

    if (StringUtils.isNotBlank(delId))
    {
      /*
       * String sql =
       * "select 1 from ML_LABEL_DATA t where t.template_id= ? and PARTITION_CODE = ?"; List
       * subList = modelService.listDataSql(sql, new Object[] {delId, code}); if (subList != null
       * && !subList.isEmpty()) { return
       * modelAction.alertParentInfo(modelAction.getText("已上传标签数据，不能删除")); } sql =
       * "delete from ml_barcode_data_items t where t.di_id in (select id from ml_data_items t where t.TEMPLATE_ID=?) "
       * ; modelService.execSql(sql, new Object[] {delId}); // 数据项 sql =
       * "delete from ml_data_items t where t.TEMPLATE_ID=? "; modelService.execSql(sql, new
       * Object[] {delId});
       */
      

      String templateSql = "SELECT T.ID,T.SAMPLE_MAP FROM ML_TEMPLATE T WHERE T.ID = ? "; 
      Map temMap = modelService.queryForMap(templateSql, new Object[] {delId});
      if (null!=temMap && !temMap.isEmpty())
      {
        if (StringUtils.isNotBlank(temMap.get("SAMPLE_MAP")))
        {
          deleteFile(modelAction.getRequest().getSession().getServletContext().getRealPath(StringUtils.toString(temMap.get("SAMPLE_MAP"))));
        }
      }
      String dataItemSql = "SELECT T.PICTURE_FLAG,T.PICTURE_PATH FROM ML_DATA_ITEMS T WHERE T.TEMPLATE_ID = ? "; 
      List<Map<String, Object>> dataItemLs = modelService.listDataSql(dataItemSql, new Object[] {delId});
      if (null!=dataItemLs && !dataItemLs.isEmpty())
      {
        for (Map dataItemMap : dataItemLs)
        {
          if ("Y".equals(dataItemMap.get("PICTURE_FLAG")))
          {
            //删除标签模板数据项图
            deleteFile(modelAction.getRequest().getSession().getServletContext().getRealPath(MCConstants.DATAITEMPIC_PATH_FW + dataItemMap.get("PICTURE_PATH")));
            
          }
        }
      }
   // 删除标签模板  ML_TEMPLATE
      String sqlTem = "delete from ML_TEMPLATE t where t.id = ? ";
      modelService.execSql(sqlTem, new Object[] {delId});
   // 删除数据项信息  ML_DATA_ITEMS
      String sql = "delete from ML_DATA_ITEMS t where t.TEMPLATE_ID = ? ";
      modelService.execSql(sql, new Object[] {delId});
   // 删除包装规则  ML_PACKAGING_RULES 
      String mprSql = "delete from ML_PACKAGING_RULES t where t.item_label_id = ? ";
      modelService.execSql(mprSql, new Object[] {delId});
    }
    return modelAction.delAjaxLoadTable(modelAction.getText("删除成功"));
  }
  
  /**
   * 删除单个文件
   * 
   * @param sPath
   *          被删除文件path
   * @return 删除成功返回true，否则返回false
   */
  public boolean deleteFile(String sPath)
  {
    boolean flag = false;
    File file = new File(sPath);
    // 路径为文件且不为空则进行删除
    if (file.isFile() && file.exists())
    {
      file.delete();
      flag = true;
    }
    return flag;
  }
}
