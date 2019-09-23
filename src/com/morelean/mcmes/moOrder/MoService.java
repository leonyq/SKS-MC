package com.morelean.mcmes.moOrder;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * 
 * @Title 制令单-数据库相关操作方法
 * @Description 〈功能详细描述〉
 * @ClassName MoService
 * @author Administrator
 * @version 1.0 developer 2017-7-28 created
 * @see MoService
 * @since 2017-7-28
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class MoService
{

  private ModelService modelService;
  private ModelAction modelAction;

  /**
   * 
   * @Description: 获取当前制令单相关信息-入参map
   * @param map
   * @return
   * List
   * @throws
   */
  public List thisMoInfoMap(Map map)
  {
    String sql = "SELECT T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T.* FROM T_CO_MATERIAL_ONLINE T "
                 + "LEFT JOIN T_CO_DEVICE T1 ON T1.CD_DEVICE_SN = '|| :CMO_DEVICE_SEQ' "
                 + "LEFT JOIN T_CO_AREA_DEVICE T2 ON T2.CAD_DEVICE_ID = T1.ID LEFT JOIN T_CO_ITEM T3 ON T.CMO_ITEM_CODE = T3.CI_ITEM_CODE "
                 + "WHERE T.CMO_MO_NUMBER = '|| :CMO_MO_NUMBER' AND T.CMO_MODEL_CODE = '|| :CMO_MODEL_CODE' "
                 + "AND T.CMO_PROCESS_FACE = '|| :CMO_PROCESS_FACE' AND T.CMO_AREA_SN = '|| :CMO_AREA_SN' AND T.CMO_DEVICE_SEQ = T2.CAD_DEVICE_SEQUENCE AND T.CMO_LOAD_FLAG = 'Y' AND T.CMO_SHKIP_FLAG = 'N'";
    List list = modelService.listDataSql(sql, map);
    return list;

  }
  
  /**
   * 
   * @Description: 获取当前制令单相关信息-入参obj
   * @param obj
   * @return
   * List
   * @throws
   */
  public List thisMoInfoObj(Object[] obj)
  {
    String sql = "SELECT T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T.* FROM T_CO_MATERIAL_ONLINE T "
                 + "LEFT JOIN T_CO_DEVICE T1 ON T1.CD_DEVICE_SN = ?  AND T.DATA_AUTH=T1.DATA_AUTH "
                 + "LEFT JOIN T_CO_AREA_DEVICE T2 ON T2.CAD_DEVICE_ID = T1.ID AND T.DATA_AUTH=T2.DATA_AUTH  "
                 +" JOIN T_CO_ITEM T3 ON T.CMO_ITEM_CODE = T3.CI_ITEM_CODE AND T.DATA_AUTH=T3.DATA_AUTH"
                 + "WHERE T.CMO_MO_NUMBER = ? AND T.CMO_MODEL_CODE = ? "
                 + "AND T.CMO_PROCESS_FACE = ? AND T.CMO_AREA_SN = ? AND T.CMO_DEVICE_SEQ = T2.CAD_DEVICE_SEQUENCE  "
                 +" AND T.CMO_LOAD_FLAG = 'Y' AND T.CMO_SHKIP_FLAG = 'N' AND T.DATA_AUTH=?";
    List list = modelService.listDataSql(sql, obj);
    return list;

  }
  
  /**
   * 
   * @Description: 对比制令单相关信息-入参map
   * @param map
   * @return
   * List
   * @throws
   */
  public List inMoInfoMap(Map map)
  {
    String sql = "SELECT F.CI_ITEM_NAME,F.CI_ITEM_SPEC,C.* FROM T_CO_MATERIAL_TABLE A " +
        "LEFT JOIN T_CO_MATERIAL_LINE B ON A.CM_SN = B.CM_SN " +
        "LEFT JOIN T_CO_MATERIAL_DETAIL C ON A.CM_SN = C.CM_SN " +
        "LEFT JOIN T_CO_AREA_DEVICE D ON C.CMD_DEVICE_SEQ = D.CAD_DEVICE_SEQUENCE " +
        "LEFT JOIN T_CO_DEVICE E ON D.CAD_DEVICE_ID = E.ID " +
        "LEFT JOIN T_CO_ITEM F ON C.CMD_ITEM_CODE = F.CI_ITEM_CODE " +
        "WHERE A.CM_MODEL_CODE = '|| :CMO_MODEL_CODE ||' AND B.CML_AREA_SN ='|| :CMO_AREA_SN ||' " +
        "AND E.CD_DEVICE_SN='|| :CMO_DEVICE_SEQ ||' AND A.CM_PROCESS_FACE ='|| :CMO_PROCESS_FACE ||'";
    List list = modelService.listDataSql(sql, map);
    return list;

  }
  
  /**
   * 
   * @Description: 对比制令单相关信息-入参obj
   * @param obj
   * @return
   * List
   * @throws
   */
  public List inMoInfoObj(Object[] obj)
  {
    String sql = "SELECT F.CI_ITEM_NAME,F.CI_ITEM_SPEC,C.* FROM T_CO_MATERIAL_TABLE A " +
        "LEFT JOIN T_CO_MATERIAL_LINE B ON A.CM_SN = B.CM_SN AND A.DATA_AUTH=B.DATA_AUTH " +
        "LEFT JOIN T_CO_MATERIAL_DETAIL C ON A.CM_SN = C.CM_SN AND A.DATA_AUTH=C.DATA_AUTH  " +
        "LEFT JOIN T_CO_AREA_DEVICE D ON C.CMD_DEVICE_SEQ = D.CAD_DEVICE_SEQUENCE AND A.DATA_AUTH=D.DATA_AUTH  " +
        "LEFT JOIN T_CO_DEVICE E ON D.CAD_DEVICE_ID = E.ID AND A.DATA_AUTH=E.DATA_AUTH  " +
        "LEFT JOIN T_CO_ITEM F ON C.CMD_ITEM_CODE = F.CI_ITEM_CODE AND A.DATA_AUTH=F.DATA_AUTH  " +
        "WHERE A.CM_MODEL_CODE = ? AND B.CML_AREA_SN = ? " +
        "AND E.CD_DEVICE_SN= ? AND A.CM_PROCESS_FACE = ? AND A.DATA_AUTH=? ";
    List list = modelService.listDataSql(sql, obj);
    //List list = modelService.listSql(sql, modelAction.getPage(), null, null, null);
    return list;

  }

  /**
   * 
   * @Description: 根据物料料号查询替代料信息
   * @param obj
   * @return
   * List
   * @throws
   */
  public List replace(Object[] obj)
  {
    String sql = "SELECT T.* FROM T_CO_ITEM_REPLACE T WHERE T.CR_ITEM_MIAN = ? AND T.DATA_AUTH=? ";
    List list = modelService.listDataSql(sql, obj);
    return list;

  }
  
  
  public MoService(ModelService modelService, ModelAction modelAction)
  {
    super();
    this.modelService = modelService;
    this.modelAction = modelAction;
  }
  

}