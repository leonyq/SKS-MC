package com.more.morelabel.labelmanage.barcodevariables.service;

import java.util.List;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * @Title 标签变量及变量值数据操作类
 * @Description 标签变量数据操作类
 * @ClassName BarcodeVariablesDataService
 * @author csh
 * @version 1.0 developer 2017-11-1 created
 * @see BarcodeVariablesDataService
 * @since 2017-11-1
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class BarcodeVariablesDataService
{
  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  /**
   * @Description: 根据类型获取系统级数据
   * @param type
   * @return List
   * @throws
   */
  public List getSysBVListInType(String type)
  {
    String sql = "SELECT T.* FROM ML_BARCODE_VARIABLES T WHERE T.BARCODE_TYPE = ? AND T.SHARE_SIGN = 'Y' ORDER BY T.VARIABLE_NAME";
    List list = modelService.listDataSql(sql, new Object[] {Integer.parseInt(type)});
    return list;
  }

  /**
   * @Description: 获取所有系统级文件
   * @return List
   * @throws
   */
  public List getAllSysBVList()
  {
    String sql = "SELECT T.* FROM ML_BARCODE_VARIABLES T WHERE T.SHARE_SIGN = 'Y' ORDER BY T.VARIABLE_NAME";
    List list = modelService.listDataSql(sql);
    return list;
  }

  /**
   * @Description: 根据类型获取数据
   * @param type
   * @param dataAuth
   * @return List
   * @throws
   */
  public List getBVListInType(String type, String sign)
  {
    //String sql = "SELECT T.* FROM ML_BARCODE_VARIABLES T WHERE T.BARCODE_TYPE = ? AND T.SHARE_SIGN = ? AND T.DATA_AUTH = ? ORDER BY T.VARIABLE_NAME";
    String sql = "SELECT T.* FROM ML_BARCODE_VARIABLES T WHERE T.BARCODE_TYPE = ? AND T.SHARE_SIGN = ? ORDER BY T.VARIABLE_NAME";
    List list = modelService.listDataSql(sql,
      new Object[] {Integer.parseInt(type), sign});
    return list;
  }

  /**
   * @Description: 获取标签变量的变量值
   * @param bvId
   * @return List
   * @throws
   */
  public List getBVVal(String bvId)
  {
    String sql = "SELECT T.*,T1.VARIABLE_NAME,T1.DECIMAL_DIGITS FROM ML_BARCODE_VAL T LEFT JOIN ML_BARCODE_VARIABLES T1 ON T1.ID = T.BV_ID WHERE T.BV_ID = ? ORDER BY T.SEQ ";
    List list = modelService.listDataSql(sql, new Object[] {bvId});
    return list;
  }

  /**
   * @Description: 获取所有标签变量的变量值
   * @return List
   * @throws
   */
  public List getBVAllVal()
  {
    String sql = "SELECT T.* FROM ML_BARCODE_VAL T ";
    List list = modelService.listDataSql(sql);
    return list;
  }

  /**
   * @Description: 判断当前组织机构为顶级数据（即UP_ID字段值为-1）
   * @param id
   * @return int
   * @throws
   */
  public int chackUpId(String id)
  {
    String sql = "SELECT T.* FROM SY_DEPT T WHERE T.UP_ID = '-1' AND T.ID = ? ";
    int count = modelService.countSql(sql, new Object[] {id});
    return count;
  }

  /**
   * @Description: 验证当前组织机构下名称不允许重复
   * @param dataAuth
   * @param name
   * @return int
   * @throws
   */
  public int chackBVName(String dataAuth, String name, String id)
  {
    String sql = "SELECT T.* FROM ML_BARCODE_VARIABLES T WHERE T.DATA_AUTH = ? AND T.VARIABLE_NAME = ? AND T.ID != ? ";
    int count = modelService.countSql(sql, new Object[] {dataAuth, name, id});
    return count;
  }

  /**
   * @Description: 修改时验证当前组织机构下名称不允许重复
   * @param dataAuth
   * @param name
   * @return int
   * @throws
   */
  public int chackEditBVName(String dataAuth, String name)
  {
    String sql = "SELECT T.* FROM ML_BARCODE_VARIABLES T WHERE T.DATA_AUTH = ? AND T.VARIABLE_NAME = ? ";
    int count = modelService.countSql(sql, new Object[] {dataAuth, name});
    return count;
  }

  /**
   * @Description: 根据id获取标签变量
   * @param id
   * @return List
   * @throws
   */
  public List getSysBVListInId(String id)
  {
    String sql = "SELECT T.* FROM ML_BARCODE_VARIABLES T WHERE T.ID = ? ";
    List list = modelService.listDataSql(sql, new Object[] {id});
    return list;
  }

  /**
   * @Description: 根据id获取标签变量值
   * @param bvId
   * @return List
   * @throws
   */
  public List getSysBVValListInId(String bvId)
  {
    String sql = "SELECT T.* FROM ML_BARCODE_VAL T WHERE T.BV_ID = ? ";
    List list = modelService.listDataSql(sql, new Object[] {bvId});
    return list;
  }

  /**
   * @Description: 验证标签变量是否已被引用
   * @param id
   * @return int
   * @throws
   */
  public int getitemValue(String id)
  {
    String sql = "SELECT T.* FROM ML_BARCODE_DATA_ITEMS T WHERE T.ITEM_VALUE = ? ";
    int count = modelService.countSql(sql, new Object[] {id});
    return count;
  }
}
