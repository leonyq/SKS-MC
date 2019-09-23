/**
 * 
 */
package com.more.mes.smt.linemonitor.service.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * @Title 线体监控服务类
 * @Description
 * @ClassName LineMonitorService
 * @author hxh
 * @version 1.0 developer 2017-7-31 created
 * @see LineMonitorService
 * @since 2017-7-31
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class LineMonitorService
{
  private static final Log log = LogFactory
			.getLog("com.more.mes.smt.linemonitor.service.base.LineMonitorService");
  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  //
  /**
   * @Description: 获取监控线体下拉框值
   * @return List
   * @throws
   */
  public List getMonitorLineCom()
  {
    String sql = "select ca_id colkey,ca_name colvalue from t_co_area where ca_type='1' and ca_status='Y'";
    List list = modelService.listSql(sql, null, null, null, null);
    return list;
  }

  /**
   * @Description: 获取工作中心下拉框值
   * @return List
   * @throws
   */
  public List getWorkCenterCom(String parentId)
  {
    String sql = "select ca_id colkey,ca_name colvalue from t_co_area where ca_type='2' and ca_status='Y' and ca_parentareaid=:parentId";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("parentId", parentId);
    List list = modelService.listSql(sql, null, sqlParaMap, null, null);
    return list;
  }

  /**
   * @Description: 获取设备列表
   * @return List
   * @throws
   */
  public List getDeviceList(String caId)
  {
    String sql = "select a.ca_id," + " a.cad_device_id," + " a.cad_device_sequence,"
                 + " d.cd_device_sn," + " d.cd_device_name" + " from t_co_device d"
                 + " left join t_co_area_device a" + " on d.id = a.cad_device_id"
                 + " join t_co_area b" + "  on a.ca_id = b.ca_id" + " and b.ca_type = '2'"
                 + " and b.ca_status = 'Y'" + " join t_co_area c"
                 + " on b.ca_parentareaid = c.ca_id" + " and c.ca_type = '1'"
                 + " and c.ca_status = 'Y'"
                 + " and c.ca_id =:caId order by a.cad_device_sequence asc";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("caId", caId);
    List list = modelService.listSql(sql, null, sqlParaMap, null, null);
    return list;
  }

  /***
   * @Description: 保存设备列表
   * @return List
   * @throws
   **/
  @SuppressWarnings("unchecked")
  public Boolean addSetting(Map map) {
    try
    {
      Map comMap = (Map)map.get("map");
      String caId = String.valueOf(comMap.get("CA_ID"));

      TableDataMapExt ext = new TableDataMapExt();
      ext.setTableName("T_CS_LINE_SETTING");// 线体监控设置信息
      // 先删除
      ext.setSqlWhere(" and ca_id=?");
      ext.getSqlWhereArgs().add(caId);
      modelService.del(ext);
      // modelService.execSql("delete from T_CS_LINE_SETTING");

      ext.setColMap(comMap);
      ext.getColMap().put("ID", StringUtils.getUUID());

      TableDataMapExt extIn = new TableDataMapExt();
      extIn.setTableName("T_CS_STATION");// 投入站
      // 先删除
      extIn.setSqlWhere(" and ca_id=?");
      extIn.getSqlWhereArgs().add(caId);
      modelService.del(extIn);
      // modelService.execSql("delete from T_CS_STATION");

      extIn.setColMap((Map)map.get("inMap"));
      extIn.getColMap().put("ID", StringUtils.getUUID());

      TableDataMapExt extFront = new TableDataMapExt();
      extFront.setTableName("T_CS_STATION");// 炉前站
      extFront.setColMap((Map)map.get("frontMap"));
      extFront.getColMap().put("ID", StringUtils.getUUID());

      modelService.save(ext);
      modelService.save(extIn);
      modelService.save(extFront);

      TableDataMapExt extDev = new TableDataMapExt();
      // 先删除
      extDev.setTableName("T_CS_CONTROL_SIGNAL");// 设备信息
      extDev.setSqlWhere(" and ca_id=?");
      extDev.getSqlWhereArgs().add(caId);
      modelService.del(extDev);
      // modelService.execSql("delete from T_CS_CONTROL_SIGNAL");

      if (StringUtils.isNotBlank(map.get("device")))
      {
        List<Map> list = (List)map.get("device");
        TableDataMapExt extDevice;
        for (Map listMap : list)
        {
          extDevice = new TableDataMapExt();
          extDevice.setTableName("T_CS_CONTROL_SIGNAL");// 设备信息
          extDevice.setColMap(listMap);
          extDevice.getColMap().put("ID", StringUtils.getUUID());
          modelService.save(extDevice);
        }
      }
      return true;
    }
    catch (Exception ex)
    {
      return false;
    }
  }

  /***
   * @Description: 读取设备列表
   * @return List
   * @throws
   **/
  @SuppressWarnings("unchecked")
  public Map getSetting(String caId) {
    Map map = new HashMap();

    // 线体监控设置信息
    String sql = "select a.id,"
                 + "       a.dept_id,"
                 + "       a.create_user,"
                 + "       a.create_time,"
                 + "       a.edit_user,"
                 + "       a.edit_time,"
                 + "       a.ca_id,"
                 + "       a.alarm_time,"
                 + "       a.line_ip1,"
                 + "       a.line_port1,"
                 + "       a.line_state1,"
                 + "       a.line_ip2,"
                 + "       a.line_port2,"
                 + "       a.line_state2,"
                 + "       a.line_ip3,"
                 + "       a.line_port3,"
                 + "       a.line_state3,"
                 + "       a.alarm_light_state,"
                 + "       a.alarm_controller,"
                 + "       a.control_signal1,"
                 + "       a.control_signal2,b.ca_name,"
                 + "       a.server_ip,"
                 + "       nvl(a.server_port,-1) server_port,"
                 + "       a.server_state"
                 + "  from t_cs_line_setting a left join t_co_area b on a.ca_id = b.ca_id WHERE a.ca_id=:caId";
    // 投入，炉前站
    String stationSql = "select a.id,"
                        + "       a.dept_id,"
                        + "       a.create_user,"
                        + "       a.create_time,"
                        + "       a.edit_user,"
                        + "       a.edit_time,"
                        + "       a.ca_id,"
                        + "       a.type,"
                        + "       decode(a.type,'1','投入站','2','炉前站') type_name,"
                        + "       a.work_center_id,"
                        + "       a.sensor_state,"
                        + "       a.sensor_controller,"
                        + "       a.input_signal,"
                        + "       a.smema_state,"
                        + "       a.smema_controller,"
                        + "       a.control_signal,"
                        + "       a.scaner_state1,"
                        + "       a.scaner_ip1,"
                        + "       a.scaner_port1,"
                        + "       a.scaner_state2,"
                        + "       a.scaner_ip2,"
                        + "       a.scaner_port2,"
                        + "       C.CA_NAME AS WORK_CENTER_NAME,"
                        + "       a.work_center_state,b.ca_name"
                        + "  from t_cs_station  a left join t_co_area b on a.ca_id = b.ca_id LEFT JOIN T_CO_AREA C ON A.WORK_CENTER_ID=C.CA_ID where a.type=:type and b.ca_id=:caId";
    // 设备信息
    /*
     * String deviceSql = "select A.* from(select distinct a.cad_device_sequence device_seq, " +
     * " b.cd_device_name device_name, " + " b.cd_device_sn device_sn, " +
     * " nvl(d.track,'') track, " + " nvl(d.line_controller,'') line_controller, " +
     * " nvl(d.controller_signal,'') controller_signal " + " from T_CO_DEVICE_LOADPOINT h " +
     * " left join t_co_device b " + " on b.cd_device_sn = h.cd_device_sn " +
     * " left join t_co_area_device a " + " on a.cad_device_id = b.id " +
     * " left join t_pm_device_online c " + " on b.cd_device_sn = c.pdo_device_sn " +
     * " left join t_co_area f " + " on a.ca_id = f.ca_id " + " left join T_CS_CONTROL_SIGNAL d " +
     * " on b.cd_device_sn = d.device_sn " + " where f.ca_parentareaid = :caId) A " +
     * " order by to_number(A.device_seq)";
     */
    String deviceSql = "SELECT\n"
                       + "A.CAD_DEVICE_SEQUENCE AS DEVICE_SEQ,\n"
                       + "C.CD_DEVICE_SN AS DEVICE_SN,\n"
                       + "C.CD_DEVICE_NAME AS DEVICE_NAME,\n"
                       + "NVL(D.TRACK,'') AS TRACK,\n"
                       + "NVL(D.LINE_CONTROLLER,'') AS LINE_CONTROLLER,\n"
                       + "NVL(D.CONTROLLER_SIGNAL,'') AS CONTROLLER_SIGNAL\n"
                       + "FROM T_CO_AREA_DEVICE A\n"
                       + "LEFT JOIN T_CO_AREA B ON A.CA_ID=B.CA_ID\n"
                       + "LEFT JOIN T_CO_DEVICE C ON A.CAD_DEVICE_ID=C.ID\n"
                       + "LEFT JOIN T_CS_CONTROL_SIGNAL D ON B.CA_PARENTAREAID=D.CA_ID AND C.CD_DEVICE_SN=D.DEVICE_SN AND A.CAD_DEVICE_SEQUENCE=D.DEVICE_SEQ\n"
                       + "WHERE B.CA_PARENTAREAID=:caId \n" + "AND A.CAD_DEVICE_ID IN (\n"
                       + "SELECT\n" + "E.CD_DEVICE_ID\n" + "FROM T_CO_DEVICE_LOADPOINT E\n"
                       + ")\n" + "ORDER BY TO_NUMBER(A.CAD_DEVICE_SEQUENCE) ASC";

    // 线体监控设置信息
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("caId", caId);
    List list = modelService.listSql(sql, null, sqlParaMap, null, null);
    if (list != null && !list.isEmpty())
    {
      map.put("map", list.get(0));
    }

    // 投入站
    Map<String, String> inMap = new HashMap<String, String>();
    inMap.put("type", "1");
    inMap.put("caId", caId);
    List inList = modelService.listSql(stationSql, null, inMap, null, null);
    if (inList != null && !inList.isEmpty())
    {
      map.put("inMap", inList.get(0));
    }

    // 炉前站
    Map<String, String> frontMap = new HashMap<String, String>();
    frontMap.put("type", "2");
    frontMap.put("caId", caId);
    List frontList = modelService.listSql(stationSql, null, frontMap, null, null);
    if (frontList != null && !frontList.isEmpty())
    {
      map.put("frontMap", frontList.get(0));
    }

    // 设备信息
    Map<String, String> deviceMap = new HashMap<String, String>();
    deviceMap.put("caId", caId);
    List deviceList = modelService.listSql(deviceSql, null, deviceMap, null, null);
    if (deviceList != null && !deviceList.isEmpty())
    {
      map.put("device", deviceList);
    }
    return map;
  }

  /**
   * @Description: 获取在线制令单列表
   * @return List
   * @throws
   */
  public Map getMoOnLineList(String caId)
  {
    Map map = new HashMap();
    String moSql = "select a.pmo_area_sn ca_id, a.pmo_number, \r\n"
                   + "     c.ci_item_code, c.ci_item_name, \r\n"
                   + "     c.ci_item_spec,  b.pm_target_qty, \r\n"
                   + "     b.pm_finish_count,  d.ca_name,\r\n" + "     b.pm_process_face\r\n"
                   + "     from t_pm_mo_online a \r\n"
                   + "     left join t_pm_mo_base b on a.pmo_number = b.pm_mo_number \r\n"
                   + "     left join t_co_item c on a.pmo_model_code = c.ci_item_code \r\n"
                   + "     left join t_co_area d on a.pmo_area_sn=d.ca_id \r\n"
                   + "     where a.pmo_area_sn = :caId";

    // 查询在线制令单信息
    List<Map> moList = null;
    Map<String, String> paraMap = new HashMap<String, String>();
    paraMap.put("caId", caId);
    moList = modelService.listSql(moSql, null, paraMap, null, null);
    map.put("moList", moList);
    return map;
  }

  /**
   * @Description: 获取设备列表
   * @return List
   * @throws
   */
  public List getDeviceOnLineList(String caId, String deviceSn)
  {
    Map map = new HashMap();
    // String sql =
    // "select a.ca_id,b.ca_name from t_cs_line_setting a join t_co_area b on a.ca_id = b.ca_id";
    String moSql = "select T.* from(select distinct a.ca_id, " + " b.cd_device_sn, "
                   + " d.pm_mo_number, " + " d.pm_model_code, " + " e.ci_item_name, "
                   + " d.pm_target_qty, " + " d.pm_finish_count, " + " c.pdo_type, "
                   + " a.cad_device_sequence, " + " b.cd_device_name "
                   + " from T_CO_DEVICE_LOADPOINT h " + " left join t_co_device b "
                   + " on b.cd_device_sn = h.cd_device_sn " + " left join t_co_area_device a "
                   + " on a.cad_device_id = b.id " + " left join t_pm_device_online c "
                   + " on b.cd_device_sn = c.pdo_device_sn " + " left join t_pm_mo_base d "
                   + " on c.pdo_number = d.pm_mo_number " + " left join t_co_item e "
                   + " on d.pm_model_code = e.ci_item_code " + " left join t_co_area f "
                   + " on a.ca_id = f.ca_id ";
    // " where f.ca_parentareaid=:caId";
    if (StringUtils.isNotBlank(caId))
    {
      moSql += " where f.ca_parentareaid=:caId";
      map.put("caId", caId);
    }
    else
    {
      moSql += " where c.pdo_device_sn=:deviceSn";
      map.put("deviceSn", deviceSn);
    }
    moSql = moSql + " ) T  order by to_number(T.cad_device_sequence)";
    List<Map> list = modelService.listSql(moSql, null, map, null, null);

    return list;
  }

  /**
   * @Description: 获取线体料表信息
   * @return List
   * @throws
   */
  public List getMaterialList(String areaSN/* , String moNum, String deviceSN */)
  {
    /*
     * String sql = "select A.* " + " from (select distinct t7.pdo_device_seq, " +
     * " t7.pdo_device_sn, " + " t3.cd_device_name, " +
     * " DECODE(t5.pdo_type,'1','上线','0','转产','3','就绪') as pdo_type, " +
     * " t2.cmo_table_no || '-' || t2.cmo_loadpoint cmo_loadpoint, " +
     * " DECODE(t2.cmo_chanel_sn,'A','单通道','L','左通道','M','中通道','R','右通道') as wsi_chanel_no, " +
     * " t2.cmo_mo_number, " + " t2.cmo_model_code, " +
     * " DECODE(t2.cmo_process_face,'0','单面','1','正面','2','反面','3','阴阳面') as wsi_process_face, " +
     * " t2.cmo_item_code, " + " t1.wsi_item_sn, " + " t4.ci_item_name, " + " t4.ci_item_spec, " +
     * " t1.wsi_online_flag, " + " t2.cmo_shkip_flag,t1.wsi_loadtime " +
     * " from t_co_material_online t2 " + " left join t_wip_station_item t1 " +
     * " on t2.cmo_mo_number = t1.wsi_mo_number " + " and t2.cmo_area_sn = t1.wsi_area_id " +
     * " and t2.cmo_process_face = t1.wsi_process_face " +
     * " and t2.cmo_device_seq = t1.wsi_device_seq " + " and t2.cmo_table_no = t1.wsi_table_no " +
     * " and t2.cmo_loadpoint = t1.wsi_loadpoint_sn " +
     * " and t2.cmo_chanel_sn = t1.wsi_chanel_no AND t2.DATA_AUTH=t1.DATA_AUTH " +
     * " left join t_co_device t3 " + " on 1 = 1 " + " left join t_co_item t4 " + " on 1 = 1 " +
     * " left join t_pm_device_online t5 " + " on 1 = 1 " + " left join t_co_area t6 " +
     * "  on t1.wsi_area_id = t6.ca_parentareaid " + " left join T_PM_DEVICE_ONLINE t7 " +
     * " on t2.cmo_device_seq = t7.pdo_device_seq " + " and t2.cmo_area_sn = t7.pdo_area_sn " +
     * " where 1 = 1 " + " and t2.cmo_area_sn = :areaSN " +
     * " and t3.cd_device_sn = t7.pdo_device_sn " + " and t5.pdo_device_sn = t7.pdo_device_sn " +
     * " and t2.cmo_item_code = t4.ci_item_code " + " ) A " + " order by A.wsi_online_flag desc, "
     * + " A.cmo_shkip_flag, " + " A.pdo_device_seq, " + " A.cmo_loadpoint, " +
     * " A.wsi_chanel_no ";
     */
	   
    /*String sql = "SELECT\n"
                 + "B.PDO_DEVICE_SEQ,\n"
                 + "B.PDO_DEVICE_SN,\n"
                 + "C.CD_DEVICE_NAME,\n"
                 + "DECODE(B.PDO_TYPE,'1','上线','2','转产','3','就绪','') PDO_TYPE,\n"
                 + "A.CMO_MO_NUMBER,\n"
                 + "A.CMO_MODEL_CODE,\n"
                 + "DECODE(A.CMO_PROCESS_FACE,'0','单面','1','正面','2','反面','3','阴阳面','') WSI_PROCESS_FACE,\n"
                 + "NVL(A.CMO_TABLE_NO,'')||'-'||NVL(A.CMO_LOADPOINT,'') CMO_LOADPOINT, \n"
                 + "DECODE(A.CMO_CHANEL_SN,'A','单通道','L','左通道','M','中通道','R','右通道','') WSI_CHANEL_NO,\n"
                 + "E.WSI_ITEM_SN,\n"
                 + "A.CMO_ITEM_CODE,\n"
                 + "F.CI_ITEM_NAME,\n"
                 + "F.CI_ITEM_SPEC,\n"
                 + "E.WSI_ONLINE_FLAG,\n"
                 + "A.CMO_SHKIP_FLAG,\n"
                 + "E.WSI_LOADTIME\n"
                 + "FROM T_CO_MATERIAL_ONLINE A\n"
                 + "LEFT JOIN T_PM_DEVICE_ONLINE B ON A.CMO_AREA_SN=B.PDO_AREA_SN \n"
                 + "                                  AND A.CMO_DEVICE_SEQ=B.PDO_DEVICE_SEQ  \n"
                 + "                                  AND A.CMO_PROCESS_FACE=B.PDO_PROCESS_FACE\n"
                 + "LEFT JOIN T_CO_DEVICE C ON B.PDO_DEVICE_SN=C.CD_DEVICE_SN\n"
                 + "LEFT JOIN T_CO_ITEM D ON A.CMO_MODEL_CODE=D.CI_ITEM_CODE\n"
                 + "LEFT JOIN T_WIP_STATION_ITEM E ON A.CMO_MO_NUMBER=E.WSI_MO_NUMBER --制令单号\n"
                 + "                                  AND A.CMO_MODEL_CODE=E.WSI_MODEL_CODE --机种\n"
                 + "                                  AND A.CMO_ITEM_CODE=E.WSI_ITEM_CODE --料号\n"
                 + "                                  AND A.CMO_PROCESS_FACE=E.WSI_PROCESS_FACE --面别\n"
                 + "                                  AND A.CMO_AREA_SN=E.WSI_AREA_ID --线别\n"
                 + "                                  AND A.CMO_TABLE_NO=E.WSI_TABLE_NO  --Table\n"
                 + "                                  AND A.CMO_LOADPOINT=E.WSI_LOADPOINT_SN --料站\n"
                 + "                                  AND A.CMO_CHANEL_SN=E.WSI_CHANEL_NO --通道\n"
                 + "                                  AND B.PDO_DEVICE_SN=E.WSI_DEVICE_SN --机台SN\n"
                 + "                                  AND A.CMO_DEVICE_SEQ=E.WSI_DEVICE_SEQ --机台序号\n"
                 + "                                  AND A.DATA_AUTH=E.DATA_AUTH\n"
                 + "                                  AND E.WSI_ONLINE_FLAG='Y'\n"
                 + "LEFT JOIN T_CO_ITEM F ON A.CMO_ITEM_CODE=F.CI_ITEM_CODE\n"
                 + "WHERE A.CMO_AREA_SN=:areaSN ORDER BY NVL(A.CMO_SHKIP_FLAG,'A') ASC, NVL(E.WSI_ONLINE_FLAG,'A') ASC,B.PDO_DEVICE_SEQ ASC,A.CMO_TABLE_NO ASC,A.CMO_LOADPOINT ASC,E.WSI_CHANEL_NO ASC";*/
	  String sql="SELECT\r\n" + 
		  		"B.PDO_DEVICE_SEQ,\r\n" + 
		  		"B.PDO_DEVICE_SN,\r\n" + 
		  		"C.CD_DEVICE_NAME,\r\n" + 
		  		"DECODE(B.PDO_TYPE,'1','上线','2','转产','3','就绪','') PDO_TYPE,\r\n" + 
		  		"A.WSI_MO_NUMBER AS CMO_MO_NUMBER,\r\n" + 
		  		"A.WSI_MODEL_CODE AS CMO_MODEL_CODE,\r\n" + 
		  		"DECODE(A.WSI_PROCESS_FACE,'0','单面','1','正面','2','反面','3','阴阳面','') WSI_PROCESS_FACE,\r\n" + 
		  		"NVL(A.WSI_TABLE_NO,'')||'-'||NVL(A.WSI_LOADPOINT_SN,'') CMO_LOADPOINT, \r\n" + 
		  		"DECODE(A.WSI_CHANEL_NO,'A','单通道','L','左通道','M','中通道','R','右通道','') WSI_CHANEL_NO,\r\n" + 
		  		"A.WSI_ITEM_SN,\r\n" + 
		  		"A.WSI_ITEM_CODE AS CMO_ITEM_CODE,\r\n" + 
		  		"F.CI_ITEM_NAME,\r\n" + 
		  		"F.CI_ITEM_SPEC,\r\n" + 
		  		"A.WSI_ONLINE_FLAG,\r\n" + 
		  		"NVL(E.CMO_SHKIP_FLAG,'N') AS CMO_SHKIP_FLAG,\r\n" + 
		  		"A.WSI_LOADTIME\r\n" + 
		  		"FROM T_WIP_STATION_ITEM A\r\n" + 
		  		"LEFT JOIN T_PM_DEVICE_ONLINE B ON A.WSI_AREA_ID=B.PDO_AREA_SN\r\n" + 
		  		"                                  AND A.WSI_DEVICE_SEQ=B.PDO_DEVICE_SEQ\r\n" + 
		  		"                                  AND A.WSI_PROCESS_FACE=B.PDO_PROCESS_FACE\r\n" + 
		  		"LEFT JOIN T_CO_DEVICE C ON B.PDO_DEVICE_SN=C.CD_DEVICE_SN\r\n" + 
		  		"LEFT JOIN T_CO_ITEM D ON A.WSI_MODEL_CODE=D.CI_ITEM_CODE\r\n" + 
		  		"LEFT JOIN T_CO_ITEM F ON A.WSI_ITEM_CODE=F.CI_ITEM_CODE\r\n" + 
		  		"LEFT JOIN T_CO_MATERIAL_ONLINE E ON E.CMO_MO_NUMBER=A.WSI_MO_NUMBER --制令单号\r\n" + 
		  		"                                 AND E.CMO_MODEL_CODE=A.WSI_MODEL_CODE --机种\r\n" + 
		  		"                                 AND E.CMO_ITEM_CODE=A.WSI_ITEM_CODE --料号\r\n" + 
		  		"                                 AND E.CMO_PROCESS_FACE=A.WSI_PROCESS_FACE --面别\r\n" + 
		  		"                                 AND E.CMO_AREA_SN=A.WSI_AREA_ID --线别\r\n" + 
		  		"                                 AND E.CMO_TABLE_NO=A.WSI_TABLE_NO  --Table\r\n" + 
		  		"                                 AND E.CMO_LOADPOINT=A.WSI_LOADPOINT_SN --料站\r\n" + 
		  		"                                 AND E.CMO_CHANEL_SN=A.WSI_CHANEL_NO --通道\r\n" + 
		  		"                                 AND B.PDO_DEVICE_SN=A.WSI_DEVICE_SN --机台SN\r\n" + 
		  		"                                 AND E.CMO_DEVICE_SEQ=A.WSI_DEVICE_SEQ --机台序号\r\n" + 
		  		"                                 AND E.DATA_AUTH=A.DATA_AUTH\r\n" + 
		  		"WHERE A.WSI_AREA_ID=:areaSN AND A.WSI_ONLINE_FLAG='Y' AND A.WSI_DEVICE_SEQ IS NOT NULL AND B.PDO_DEVICE_SEQ IS NOT NULL\r\n" + 
		  		"ORDER BY NVL(E.CMO_SHKIP_FLAG,'A') ASC, \r\n" + 
		  		"NVL(A.WSI_ONLINE_FLAG,'A') ASC,\r\n" + 
		  		"B.PDO_DEVICE_SEQ ASC,\r\n" + 
		  		"A.WSI_TABLE_NO ASC,\r\n" + 
		  		"A.WSI_LOADPOINT_SN ASC,\r\n" + 
		  		"A.WSI_CHANEL_NO ASC";
    //SQL语句中的 NVL(A.CMO_SHKIP_FLAG,'A') / NVL(E.WSI_ONLINE_FLAG,'A') 排序，为了 NULL 值能排在 前面 而取了 'A'，'A'不具有任何意义  2018-02-12 by cc
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSN", areaSN);
    /*
     * sqlParaMap.put("moNum", moNum); sqlParaMap.put("deviceSN", deviceSN);
     */
    List list = modelService.listSql(sql, null, sqlParaMap, null, null);
    return list;
  }

  /**
   * @Description: 获取线体料站信息
   * @return List
   * @throws
   */
  public Map<String, Object> getFeedStation(String areaSN, String deviceSN)
  {
    String sql = "SELECT \r\n" + 
    		"T.CDL_TABLE, \r\n" + 
    		"T.CDL_LOADPOINT, \r\n" + 
    		"B.CMO_LOAD_FLAG, \r\n" + 
    		"B.CMO_SHKIP_FLAG \r\n" + 
    		"FROM T_CO_DEVICE_LOADPOINT T \r\n" + 
    		"LEFT JOIN T_CO_AREA_DEVICE A ON T.CD_DEVICE_ID = A.CAD_DEVICE_ID \r\n" + 
    		"LEFT JOIN T_CO_MATERIAL_ONLINE B ON A.CAD_DEVICE_SEQUENCE = B.CMO_DEVICE_SEQ \r\n" + 
    		"                                    AND T.CDL_TABLE = B.CMO_TABLE_NO \r\n" + 
    		"                                    AND T.CDL_LOADPOINT = B.CMO_LOADPOINT \r\n" + 
    		"LEFT JOIN T_CO_AREA C ON B.CMO_AREA_SN=C.CA_PARENTAREAID\r\n" + 
    		"WHERE 1 = 1 \r\n" + 
    		"AND A.CA_ID = C.CA_ID \r\n" + 
    		"AND T.CD_DEVICE_SN = :deviceSN\r\n" + 
    		"AND C.CA_PARENTAREAID =:caAreaSN\r\n" + 
    		"ORDER BY T.CDL_TABLE,TO_NUMBER(REGEXP_SUBSTR(T.CDL_LOADPOINT,'[0-9]*[0-9]',1))";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    /* sqlParaMap.put("moNum", moNum); */
    sqlParaMap.put("deviceSN", deviceSN);
    sqlParaMap.put("caAreaSN", areaSN);
    List<Map<String, Object>> list = modelService.listSql(sql, null, sqlParaMap, null, null);
    Map<String, Object> stationMap = new LinkedHashMap<String, Object>();
    if (list != null && !list.isEmpty())
    {
      int listSize = list.size();
      for (int i = 0; i < listSize; i++ )
      {
        String key = StringUtils.toString(list.get(i).get("CDL_TABLE"));

        List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
        for (int j = 0; j < listSize; j++ )
        {
          Map<String, Object> tempMap = new HashMap<String, Object>();
          if (list.get(i).get("CDL_TABLE").equals(list.get(j).get("CDL_TABLE")))
          {
            tempMap.put("CDL_LOADPOINT", list.get(j).get("CDL_LOADPOINT"));
            tempMap.put("CMO_LOAD_FLAG", list.get(j).get("CMO_LOAD_FLAG"));
            tempMap.put("CMO_SHKIP_FLAG", list.get(j).get("CMO_SHKIP_FLAG"));
            tempList.add(tempMap);
          }
        }
        stationMap.put(key, tempList);
      }
    }
    return stationMap;
  }

  /**
   * @Description: 获取巡检报警信息
   * @return List
   * @throws
   */
  public List getAlarmInfo(String areaSN)
  {
    String sql = "select DISTINCT t.id, "
                 + " t.qwl_time, "
                 + " t.qwl_type, "
                 + " '类型:' || DECODE(t.qwl_event,'1','换班巡检','2','QC巡检','3','品质报警') || '/制令单:' || t.qwl_mo_number || "
                 + " '/机种:' || t.qwl_model_code || '/设备SN:' || t.qwl_device_sn || "
                 + " '/预警内容:' || t.qwl_content  || '/预警时间:' || to_char(t.qwl_time,'yyyy-MM-dd HH24:MI:SS') as qwl_info "
                 + " from T_QC_WARNING_LOG t " + " where t.qwl_status = 'N' "
                 + " and t.qwl_area_sn = :areaSN ";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSN", areaSN);
    @SuppressWarnings("rawtypes")
    List list = modelService.listSql(sql, null, sqlParaMap, null, null);

    return list;
  }

  public Map<String, Object> checkProductSn(String caId, String productSN)
  {
    String res;
    // 调用存储过程 (校验产品SN)
    // if ("P1604".equals(productSN))
    // {
    // res = "OK:产品SN过站成功";
    // }
    // else
    // {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2};
    int[] outPlace = {3, 4, 5, 6};
    List<Object> inputVals = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    inputVals.add(productSN);
    inputVals.add(caId);
    outType.add("String");
    outType.add("String");
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_CHECK_SN");
    pf.setInPlace(inPlace);
    pf.setOutPlace(outPlace);
    pf.setValArgs(inputVals);
    pf.setOutValType(outType);
    pf.setTotalLen(inputVals.size() + outType.size());
    List<Object> list = modelService.procComm(pf);
    res = StringUtils.toString(list.get(3));
    if ("OK".equals(res))
    {
      // 调用存储过程 (保存产品过站信息)
      String moNum = StringUtils.toString(list.get(1));
      ProFuncDto pf2 = new ProFuncDto();
      int[] inPlace2 = {1, 2, 3, 4, 5, 6, 7, 8, 9};
      int[] outPlace2 = {10, 11};
      List<Object> inputVals2 = new ArrayList<Object>();
      List<Object> outType2 = new ArrayList<Object>();
      inputVals2.add(productSN);
      inputVals2.add(moNum);
      inputVals2.add(caId);
      inputVals2.add(null);
      inputVals2.add(null);
      inputVals2.add(null);
      inputVals2.add(null);
      inputVals2.add(null);
      inputVals2.add(null);
      outType2.add("String");
      outType2.add("String");
      pf2.setClassName("P_C_SAVE_SN_INFO");
      pf2.setInPlace(inPlace2);
      pf2.setOutPlace(outPlace2);
      pf2.setValArgs(inputVals2);
      pf2.setOutValType(outType2);
      pf2.setTotalLen(inputVals2.size() + outType2.size());
      List<Object> list2 = modelService.procComm(pf2);
      res = StringUtils.toString(list2.get(1));
    }
    // }
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("RES", res);
    return map;
  }

  public List getDeviceSingel(String areaSN)
  {
    String sql = "select T2.* \n" + "from (select T1.device_sn, \n"
                 + "min(T1.DEVICE_STATUS) as DEVICE_STATUS, \n"
                 + "min(T1.FRIST_TRACK) as FRIST_TRACK, \n"
                 + "max(T1.ALARM_TYPE) as ALARM_TYPE \n"
                 + "from (SELECT DISTINCT B.CD_DEVICE_SN as device_sn, \n" + "C.PDO_TYPE, \n"
                 + "D.CDS_FRIST_TRACK, \n" + "D.CDS_ALARM_TYPE, \n"
                 + "DECODE(C.PDO_TYPE,'','空闲','1','上线','2','转产','3','就绪') AS DEVICE_STATUS, \n"
                 + "CASE \n" + "  WHEN D.CDS_FRIST_TRACK IS NULL THEN \n" + "     CASE \n"
                 + "      WHEN C.PDO_TYPE = '3' THEN '连通' \n"
                 + "      WHEN C.PDO_TYPE IS NULL THEN '连通' \n" + "      ELSE '断开' END \n"
                 + "  ELSE \n" + "     CASE\n" + "      WHEN D.CDS_ALARM_TYPE='2' THEN\n"
                 + "        CASE\n" + "          WHEN D.CDS_FRIST_TRACK = '1' THEN '断开' \n"
                 + "          WHEN D.CDS_FRIST_TRACK = '2' THEN '连通'\n"
                 + "          ELSE '不操作' END\n" + "       ELSE '不操作' END\n"
                 + "  END FRIST_TRACK, \n"
                 + "DECODE(D.CDS_ALARM_TYPE,'1','N','2','Y','') AS ALARM_TYPE \n"
                 + "FROM T_CO_AREA_DEVICE T LEFT JOIN T_CO_AREA A \n"
                 + "ON T.CA_ID = A.CA_ID  LEFT JOIN T_CO_DEVICE B \n"
                 + "ON T.CAD_DEVICE_ID = B.ID \n" + "LEFT JOIN T_PM_DEVICE_ONLINE C \n"
                 + "ON B.CD_DEVICE_SN = C.PDO_DEVICE_SN \n"
                 + "AND C.PDO_AREA_SN =:areaSN \n" + "LEFT JOIN T_CO_DEVICE_SINGEL D \n"
                 + "ON B.CD_DEVICE_SN = D.CDS_DEVICE_SN   \n" + "WHERE 1 = 1 \n"
                 + "AND A.CA_PARENTAREAID =:areaSN2 \n"
                 + "order by B.CD_DEVICE_SN, D.CDS_ALARM_TYPE desc) T1  \n"
                 + "group by T1.device_sn) T2  order by T2.device_sn";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSN", areaSN);
    sqlParaMap.put("areaSN2", areaSN);
    List list = modelService.listSql(sql, null, sqlParaMap, null, null);

    return list;
  }
  
  /**
   * 获取是否记录信号日志标识
   * @return
   */
  public String getSignLogParam(){
	  try{
		  String sqlStr="SELECT\r\n" + 
		  		"A.VR_VALUE\r\n" + 
		  		"FROM T_SYS_PARAMETER_INI A\r\n" + 
		  		"WHERE A.PRG_NAME='SMT'\r\n" + 
		  		"AND A.VR_CLASS='LM0001'\r\n" + 
		  		"AND ROWNUM=1";
		  List<Map> dataList=modelService.listDataSql(sqlStr);
		  if(dataList!=null && dataList.size()>0){
			  return dataList.get(0).get("VR_VALUE").toString();
		  }
		  else {
			  return null;
		  }
	  }
	  catch(Exception ex){
		  log.error("getSignLogParam:",ex);
		  return null;
	  }
  }
  
  /**
   * 记录信号日志
   * @param controller
   * @param workdStation
   * @param sign 1:传感器信号   2:SMEMA信号   3:报警灯信号   4:扫码枪1信号   5:扫码枪2信号   6:要板信号   7:过板信号
   * @return
   */
  public Boolean loggerSign(String controller,String workdStation,String signFlag,String sign){
	  try{
		  //判定当前   控制器+工作中心  是否存在日志记录
		  String sqlStr="SELECT\r\n" + 
		  		"A.ID\r\n" + 
		  		"FROM T_CS_LINE_ACTUALSIGN A\r\n" + 
		  		"WHERE A.TCLA_CONTROLER_IP=?\r\n" + 
		  		"AND A.TCLA_WORK_STATION=?";
		  List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{controller,workdStation});
		  //操作数据
		  String sqlInner="";
		  if(dataList.size()<=0){
			  sqlStr="INSERT INTO T_CS_LINE_ACTUALSIGN\r\n" + 
			  		"(\r\n" + 
			  		"ID,\r\n" + 
			  		"TCLA_CONTROLER_IP,\r\n" + 
			  		"TCLA_WORK_STATION,\r\n" + 
			  		"TCLA_SENSOR_SIGN,\r\n" + 
			  		"TCLA_SMEMA_SIGN,\r\n" + 
			  		"TCLA_LIGHT_SIGN,\r\n" + 
			  		"TCLA_SCANER1_SIGN,\r\n" + 
			  		"TCLA_SCANER2_SIGN,\r\n" + 
			  		"TCLA_CALL_SIGN,\r\n" + 
			  		"TCLA_PASS_SIGN,\r\n" + 
			  		"TCLA_LAST_COLLECT_TIME\r\n" + 
			  		")VALUES\r\n" + 
			  		"(\r\n" + 
			  		"f_c_getnewid(),\r\n" + 
			  		"?,\r\n" + 
			  		"TO_NUMBER(?),\r\n" + 
			  		"%s,\r\n" + 
			  		"SYSDATE\r\n" + 
			  		")";
			  Object[] paramObj=new Object[]{controller,workdStation,sign};
			  if("1".equals(signFlag)) sqlInner="?,'N','N','N','N','N','N'";
			  else if("2".equals(signFlag)){
				  sqlInner="'N',?,'N','N','N',DECODE(?,'Y','Y','N'),DECODE(?,'Y','N','Y')"; 
				  paramObj=new Object[]{controller,workdStation,sign,sign,sign};
			  } 
			  else if("3".equals(signFlag)) sqlInner="'N','N',?,'N','N','N','N'"; 
			  else if("4".equals(signFlag)) sqlInner="'N','N','N',?,'N','N','N'"; 
			  else if("5".equals(signFlag)) sqlInner="'N','N','N','N',?,'N','N'";
			  else if("6".equals(signFlag)) sqlInner="'N','N','N','N','N',?,'N'"; 
			  else if("7".equals(signFlag)) sqlInner="'N','N','N','N','N','N',?";
              return modelService.execSql(String.format(sqlStr, sqlInner), paramObj) > 0;
			  
		  }
		  else {
			  sqlStr="UPDATE T_CS_LINE_ACTUALSIGN \r\n" + 
			  		"SET %s,TCLA_LAST_COLLECT_TIME=SYSDATE\r\n" + 
			  		"WHERE TCLA_CONTROLER_IP=? AND TCLA_WORK_STATION=?";
			  Object[] paramObj=new Object[]{sign,controller,workdStation};
			  if("1".equals(signFlag)) sqlInner="TCLA_SENSOR_SIGN=?";
			  else if("2".equals(signFlag)) {
				  sqlInner="TCLA_SMEMA_SIGN=?,TCLA_CALL_SIGN=DECODE(?,'Y','Y','N'),TCLA_PASS_SIGN=DECODE(?,'Y','N','Y')"; 
				  paramObj=new Object[]{sign,sign,sign,controller,workdStation};
			  }
			  else if("3".equals(signFlag)) sqlInner="TCLA_LIGHT_SIGN=?"; 
			  else if("4".equals(signFlag)) sqlInner="TCLA_SCANER1_SIGN=?"; 
			  else if("5".equals(signFlag)) sqlInner="TCLA_SCANER2_SIGN=?";
			  else if("6".equals(signFlag)) sqlInner="TCLA_CALL_SIGN=?"; 
			  else if("7".equals(signFlag)) sqlInner="TCLA_PASS_SIGN=?";
              return modelService.execSql(String.format(sqlStr, sqlInner), paramObj) > 0;
		  }

      }
	  catch(Exception ex){
		  log.error("loggerSign:",ex);
		  return false;
	  }
  }
}
