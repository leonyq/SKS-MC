package com.more.buss.eis.bd.techitem.service;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class TechItemCheck implements ValidateFuncService {

  private final Log log = LogFactory.getLog(this.getClass());

  /**
   * @param 工艺物料管控唯一性验证
   * @param paraMap
   * @param modelService
   * @param modelAction
   * @param objs
   * @return
   * @see com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService#valJavaFun(java.lang.String, java.util.Map, com.more.fw.core.dbo.model.service.ModelService,
   *      com.more.fw.core.base.core.action.ModelAction, java.lang.Object[])
   */
  public OperResult valJavaFun(String formId, Map paraMap, ModelService modelService, ModelAction modelAction,
      Object... objs) {
    Map resultMap = null;
    Map resultMap_s = null;
    Map packMap_s = null;
    Map packMap = null;
    Map resultMapSql_s = null;
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String type = modelAction.getParaMap2().get("type");
    String ctiModelCode = StringUtils.toString(paraMap.get("CTI_MODEL_CODE"));//机种
    String ctiProductStep = StringUtils.toString(paraMap.get("CTI_PRODUCT_STEP"));//生产阶别
    String ctiGroup = StringUtils.toString(paraMap.get("CTI_GROUP"));//管控工序
    String ctiItemCode = StringUtils.toString(paraMap.get("CTI_ITEM_CODE"));//管控料号
    String ctiProcessFace = StringUtils.toString(paraMap.get("CTI_PROCESS_FACE"));//加工面别
    int ctiAssySeq = Integer.valueOf(StringUtils.toString(paraMap.get("CTI_ASSY_SEQ")));//组立顺序
    String ctiItemType = StringUtils.toString(paraMap.get("CTI_ITEM_TYPE"));//管控类型
    String dataId = modelAction.getDataId();
    
    
    
    String packSql = "SELECT T.VR_VALUE FROM T_SYS_PARAMETER_INI T WHERE T.VR_CLASS = 'PACK0001' and  t.DATA_AUTH = ?   ";
    String sql_s = "SELECT COUNT(1) AS COUNT FROM T_CO_TECH_ITEM WHERE CTI_MODEL_CODE=? AND CTI_GROUP = ? AND CTI_PROCESS_FACE = ? AND CTI_ASSY_SEQ = ? AND  CTI_ITEM_TYPE != '1'";
    String sql = "SELECT COUNT(1) AS COUNT FROM T_CO_TECH_ITEM WHERE CTI_MODEL_CODE=? AND CTI_PRODUCT_STEP = ? AND CTI_GROUP = ? AND CTI_ITEM_CODE = ? AND CTI_PROCESS_FACE = ?   ";
    
    String mapSql_s = "SELECT COUNT(1) AS COUNT FROM T_CO_TECH_ITEM WHERE CTI_MODEL_CODE=? AND CTI_GROUP = ? AND CTI_ITEM_TYPE = ?  and  CTI_ITEM_CODE =?";
 
    if (("edit").equals(type))
    {
      sql = sql + "AND ID != ?";
      resultMap = modelService.queryForMap(sql, new Object[] { ctiModelCode, ctiProductStep, ctiGroup, ctiItemCode,ctiProcessFace ,dataId});
      sql_s = sql_s + " AND ID != ?";
      resultMap_s = modelService.queryForMap(sql_s, new Object[] { ctiModelCode, ctiGroup, ctiProcessFace ,ctiAssySeq ,dataId});
      mapSql_s = mapSql_s + " AND ID != ?";
      resultMapSql_s = modelService.queryForMap(mapSql_s , new Object[]{ ctiModelCode,ctiGroup,ctiItemType ,ctiItemCode,dataId});
    }else{
      resultMap = modelService.queryForMap(sql, new Object[] { ctiModelCode, ctiProductStep, ctiGroup, ctiItemCode,ctiProcessFace });
      resultMap_s = modelService.queryForMap(sql_s, new Object[] { ctiModelCode, ctiGroup, ctiProcessFace ,ctiAssySeq});
      resultMapSql_s = modelService.queryForMap(mapSql_s , new Object[]{ ctiModelCode,ctiGroup,ctiItemType, ctiItemCode});
    }
    int count = Integer.parseInt(resultMap.get("count").toString());
    int count_s = Integer.parseInt(resultMap_s.get("count").toString());
    int count_sqls = Integer.parseInt(resultMapSql_s.get("count").toString());
    //packMap = modelService.queryForMap(packSql);
    packMap = modelService.queryForMap(packSql, new Object[] { dataAuth });
    int pack = 0;
    if(packMap != null){
        Object packStr = packMap.get("VR_VALUE");
        if(packStr != null){
        pack = Integer.parseInt(packStr.toString());
        }
    }
    
    
    if (pack == 1)
    {
//    2018/06/27  在管控类型为辅料制具，不进行校验
      if (!ctiItemType.equals("1"))
      {
        if (count_s > 0) {
          return new OperResult(false, CommMethod.getText("该管控记录下已存在该组立顺序"));
        }
      }
      
    }
    if (count > 0 || count_sqls > 0) {
        return new OperResult(false, CommMethod.getText("该管控记录已存在"));
    } else {
      return new OperResult(true);
    }
    
  }
}
