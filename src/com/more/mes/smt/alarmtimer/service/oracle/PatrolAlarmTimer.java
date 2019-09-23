package com.more.mes.smt.alarmtimer.service.oracle;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;

public class PatrolAlarmTimer implements IJobx
{
  private final Log log = LogFactory.getLog(this.getClass());

  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  // private ModelAction modelAction = (ModelAction)SpringContextUtil.getBean("modelAction");
  private Date inputTime = DateUtil.getCurDate();

  @Override
  public void exec(Args args)
  {
    // TODO Auto-generated method stub
    // 获取巡检方案信息 QI_MODEL 巡检方式（1-时段巡检，2-投产后检），QI_TYPE（1-免检，2-抽检，3-全检） 巡检模式,QI_ADVANCE_ALARM
    // 巡检预警时间,QI_INPUT_TIME投产后检时间,QIT_BEGIN_TIME时段开始时间,QIT_END_TIME结束时间
    String timeSql = "SELECT T1.QI_MODEL, " + " T1.QI_TYPE, " + " T1.QI_ADVANCE_ALARM, "
                     + " T1.QI_INPUT_TIME, " + " T2.QIT_BEGIN_TIME, " + " T2.QIT_END_TIME, "
                     + " T1.QI_ALTERATE_FLAG " + " FROM T_QC_INSPECTION_INFO T1 "
                     + " LEFT JOIN T_QC_INSPECTION_TIME T2 " + " ON T1.ID = T2.QI_ID "
                     + " WHERE 1=1 AND T1.QI_DEFAULT_FALG='Y'";
   
    List<Map<String, Object>> timeList = modelService.listDataSql(timeSql);
    if (timeList != null && !timeList.isEmpty())
    {
      String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm");
      Date nowTime = DateUtil.parseDate(StringUtils.toString(nowDate), "yyyy-MM-dd HH:mm");
      int timeListSize = timeList.size();
      String qiModel = StringUtils.toString(timeList.get(0).get("QI_MODEL"));
      String qiType = StringUtils.toString(timeList.get(0).get("QI_TYPE"));
      String qiFlag = StringUtils.toString(timeList.get(0).get("QI_ALTERATE_FLAG"));
      if ("Y".equals(qiFlag))
      {
        qiFlag = "1";
      }
      else
      {
        qiFlag = "2";
      }
      int advAlarm = 0;
      int inputTime = 0;
      String qwlTYPE = "";// 报警类型（1-预警，2-报警）
      if (timeList.get(0).get("QI_ADVANCE_ALARM") != null)
      {
        advAlarm = Integer.parseInt(StringUtils.toString(timeList.get(0).get("QI_ADVANCE_ALARM")));

      }
      if (timeList.get(0).get("QI_INPUT_TIME") != null)
      {
        inputTime = Integer.parseInt(StringUtils.toString(timeList.get(0).get("QI_INPUT_TIME")));
      }

      if ("1".equals(qiModel))
      {
        // 时段巡检
        Date startTime = null;
        Date endTime = null;

        for (int i = 0; i < timeListSize; i++ )
        {
          if (timeList.get(0).get("QIT_END_TIME") != null)
          {
            endTime = DateUtil.parseDate(
              StringUtils.toString(timeList.get(i).get("QIT_END_TIME")), "yyyy-MM-dd HH:mm");
          }
          if (timeList.get(0).get("QIT_BEGIN_TIME") != null)
          {
            startTime = DateUtil.parseDate(
              StringUtils.toString(timeList.get(i).get("QIT_BEGIN_TIME")), "yyyy-MM-dd HH:mm");
          }
          if ("2".equals(qiType))
          {
            String alarmSql = " select t1.cmo_mo_number    as mo_number, "
                              + " t1.cmo_process_face as process_face, "
                              + " t1.cmo_model_code   as model_code, "
                              + " t1.cmo_area_sn      as area_sn, "
                              + " t1.cmo_device_seq   as device_seq, "
                              + " t3.pdo_device_sn    as device_sn "
                              + " from T_CO_MATERIAL_ONLINE t1 "
                              + " left join T_PM_DEVICE_ONLINE t3 "
                              + " on t1.cmo_device_seq = t3.pdo_device_seq "
                              + " and t1.cmo_area_sn = t3.pdo_area_sn "
                              + " where not exists (select * " + " from T_QC_OPERATION_LOG t2 "
                              + " where trunc(t2.qol_orerate_time) = trunc(sysdate) "
                              + " and t1.cmo_mo_number = t2.qol_mo_number "
                              + " and t1.cmo_process_face = t2.qol_process_face "
                              + " and t1.cmo_model_code = t2.qol_model_code "
                              + " and t1.cmo_area_sn = t2.qol_area_sn "
                              + " and t1.cmo_device_seq = t2.qol_device_seq "
                              + " and t3.pdo_device_sn = t2.qol_device_sn "
                              /* + " and t2.qol_event = '1' " */
                              + " and to_date(?, 'yyyy-MM-dd HH24:mi:ss') < "
                              + " t2.qol_orerate_time and " + " t2.qol_orerate_time < "
                              + " to_date(?, 'yyyy-MM-dd HH24:mi:ss')) "
                              + " group by t1.cmo_mo_number, " + " t1.cmo_process_face, "
                              + " t1.cmo_model_code, " + " t1.cmo_area_sn, "
                              + " t1.cmo_device_seq, " + " t3.pdo_device_sn";
            compareTime(advAlarm, qwlTYPE, qiFlag, startTime, endTime, nowTime, alarmSql);
          }
          else if ("3".equals(qiType))
          {
            // 全检
            // ////////////////////////////////////////////////////////////////////////////////////////////////////////////
            String alarmSql = "select t1.cmo_mo_number    as mo_number, "
                              + " t1.cmo_process_face as process_face, "
                              + " t1.cmo_model_code   as model_code, "
                              + " t1.cmo_area_sn      as area_sn, "
                              + " t1.cmo_device_seq   as device_seq, "
                              + " t3.pdo_device_sn    as device_sn "
                              + " from T_CO_MATERIAL_ONLINE t1 "
                              + " left join T_PM_DEVICE_ONLINE t3 "
                              + " on t1.cmo_device_seq = t3.pdo_device_seq "
                              + " and t1.cmo_area_sn = t3.pdo_area_sn "
                              + " where not exists (select * " + " from T_QC_OPERATION_LOG t2 "
                              + " where trunc(t2.qol_orerate_time) = trunc(sysdate) "
                              + " and t1.cmo_item_code = t2.qol_item_code "
                              + " and t1.cmo_table_no=t2.qol_table_no "
                              + " and t1.cmo_loadpoint=t2.qol_loadpoint_sn "
                              + " and t1.cmo_chanel_sn=t2.qol_chanel_no "
                              + " and t1.cmo_mo_number = t2.qol_mo_number "
                              + " and t1.cmo_process_face = t2.qol_process_face "
                              + " and t1.cmo_model_code = t2.qol_model_code "
                              + " and t1.cmo_area_sn = t2.qol_area_sn "
                              + " and t1.cmo_device_seq = t2.qol_device_seq "
                              + " and t3.pdo_device_sn = t2.qol_device_sn "
                              /* + " and t2.qol_event = '1' " */
                              + " and to_date(?, 'yyyy-MM-dd HH24:mi:ss') < "
                              + " t2.qol_orerate_time " + " and t2.qol_orerate_time < "
                              + " to_date(?, 'yyyy-MM-dd HH24:mi:ss')) "
                              + " group by t1.cmo_mo_number, " + " t1.cmo_process_face, "
                              + " t1.cmo_model_code, " + " t1.cmo_area_sn, "
                              + " t1.cmo_device_seq, " + " t3.pdo_device_sn";
            compareTime(advAlarm, qwlTYPE, qiFlag, startTime, endTime, nowTime, alarmSql);
          }
        }
      }
      else if ("2".equals(qiModel))
      {
        // 投产后检
        String sql = "select t.pmo_number as mo_number, "
                     + "  t.pmo_process_face as process_face, "
                     + " t.pmo_model_code as model_code, "
                     + " t.pmo_area_sn as area_sn, "
                     /*
                      * + " t1.pdo_device_sn as device_sn, " + " t1.pdo_device_seq as device_seq, "
                      */
                     + " t.pmo_time + numtodsinterval(?, 'minute') as end_time "
                     + " from T_PM_MO_ONLINE t "
                     /*
                      * + " left join t_pm_device_online t1 " + " on t.pmo_number = t1.pdo_number "
                      * + " and t.pmo_model_code = t1.pdo_model_code " +
                      * " and t.pmo_process_face = t1.pdo_process_face " +
                      * " and t.pmo_area_sn = t1.pdo_area_sn "
                      */
                     + " where TO_CHAR(t.pmo_time + numtodsinterval(?, 'minute'), 'yyyy-MM-dd HH24:mi') = ?";
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> tempList = null;
        List<Map<String, Object>> tempList2 = null;

        int tempInputTime = inputTime - advAlarm;
        if (advAlarm != 0)
        {
          // 预警
          tempList = modelService.listDataSql(sql, new Object[] {tempInputTime, tempInputTime,
            nowDate});
          if (tempList != null && !tempList.isEmpty())
          {
            list = tempList;
            qwlTYPE = "1";
          }
        }
        // 报警
        tempList2 = modelService.listDataSql(sql, new Object[] {inputTime, inputTime, nowDate});
        if (tempList2 != null && !tempList2.isEmpty())
        {
          list = tempList2;
          qwlTYPE = "2";
        }

        if (list != null && !list.isEmpty())
        {
          int listSize = list.size();
          for (int i = 0; i < listSize; i++ )
          {
            Date endTime = DateUtil.parseDate(StringUtils.toString(list.get(i).get("END_TIME")),
              "yyyy-MM-dd HH:mm:ss");
            if ("2".equals(qiType))
            {
              // 抽检
              // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              String alarmSql = "select t1.cmo_mo_number    as mo_number, "
                                + " t1.cmo_process_face as process_face, "
                                + " t1.cmo_model_code   as model_code, "
                                + " t1.cmo_area_sn      as area_sn, "
                                + " t1.cmo_device_seq   as device_seq, "
                                + " t3.pdo_device_sn    as device_sn "
                                + " from T_CO_MATERIAL_ONLINE t1 "
                                + " left join T_PM_DEVICE_ONLINE t3 "
                                + " on t1.cmo_device_seq = t3.pdo_device_seq "
                                + " and t1.cmo_area_sn = t3.pdo_area_sn "
                                + " where not exists "
                                + " (select * "
                                + " from T_QC_OPERATION_LOG t2 "
                                + " where t1.cmo_mo_number = t2.qol_mo_number "
                                + " and t1.cmo_process_face = t2.qol_process_face "
                                + " and t1.cmo_model_code = t2.qol_model_code "
                                + " and t1.cmo_area_sn = t2.qol_area_sn "
                                + " and t1.cmo_device_seq = t2.qol_device_seq "
                                + " and t3.pdo_device_sn = t2.qol_device_sn "
                                /* + " and t2.qol_event = '1' " */
                                + " and t2.qol_orerate_time < to_date(?, 'yyyy-MM-dd HH24:mi:ss')) "
                                + " and t1.cmo_mo_number = ? " + " and t1.cmo_process_face = ? "
                                + " and t1.cmo_model_code = ? " + " and t1.cmo_area_sn=? "
                                + " group by t1.cmo_mo_number, " + " t1.cmo_process_face, "
                                + " t1.cmo_model_code, " + " t1.cmo_area_sn, "
                                + " t1.cmo_device_seq, " + " t3.pdo_device_sn ";
              saveInfo("2", qwlTYPE, qiFlag, null, endTime, alarmSql, list.get(i));
            }
            else if ("3".equals(qiType))
            {
              // 全检
              // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              String alarmSql = "select t1.cmo_mo_number    as mo_number, "
                                + " t1.cmo_process_face as process_face, "
                                + " t1.cmo_model_code   as model_code, "
                                + " t1.cmo_area_sn      as area_sn, "
                                + " t1.cmo_device_seq   as device_seq, "
                                + " t3.pdo_device_sn    as device_sn "
                                + " from T_CO_MATERIAL_ONLINE t1 "
                                + " left join T_PM_DEVICE_ONLINE t3 "
                                + " on t1.cmo_device_seq = t3.pdo_device_seq "
                                + " and t1.cmo_area_sn = t3.pdo_area_sn "
                                + " where not exists "
                                + " (select * "
                                + " from T_QC_OPERATION_LOG t2 "
                                + " where t1.cmo_mo_number = t2.qol_mo_number "
                                + " and t1.cmo_item_code = t2.qol_item_code "
                                + " and t1.cmo_table_no=t2.qol_table_no "
                                + " and t1.cmo_loadpoint=t2.qol_loadpoint_sn "
                                + " and t1.cmo_chanel_sn=t2.qol_chanel_no "
                                + " and t1.cmo_process_face = t2.qol_process_face "
                                + " and t1.cmo_model_code = t2.qol_model_code "
                                + " and t1.cmo_area_sn = t2.qol_area_sn "
                                + " and t1.cmo_device_seq = t2.qol_device_seq "
                                + " and t3.pdo_device_sn = t2.qol_device_sn "
                                /* + " and t2.qol_event = '1' " */
                                + " and t2.qol_orerate_time < to_date(?, 'yyyy-MM-dd HH24:mi:ss')) "
                                + " and t1.cmo_mo_number = ? " + " and t1.cmo_process_face = ? "
                                + " and t1.cmo_model_code = ? " + " and t1.cmo_area_sn=? "
                                + " group by t1.cmo_mo_number, " + " t1.cmo_process_face, "
                                + " t1.cmo_model_code, " + " t1.cmo_area_sn, "
                                + " t1.cmo_device_seq, " + " t3.pdo_device_sn ";
              saveInfo("2", qwlTYPE, qiFlag, null, endTime, alarmSql, list.get(i));
            }
          }
        }
      }
    }
  }

  public void compareTime(int advAlarm, String qwlTYPE, String qiFlag, Date startTime,
                          Date endTime, Date nowTime, String alarmSql)
  {
    if (advAlarm != 0)
    {// 预警
      Date tempTime = new Date(endTime.getTime() - 60000 * advAlarm);
      if (tempTime.compareTo(nowTime) == 0)
      {
        qwlTYPE = "1";// 预警
        saveInfo("1", qwlTYPE, qiFlag, startTime, tempTime, alarmSql, null);
      }
    }
    // 报警
    if (endTime.compareTo(nowTime) == 0)
    {
      qwlTYPE = "2";// 报警
      saveInfo("1", qwlTYPE, qiFlag, startTime, endTime, alarmSql, null);
    }
  }

  public void saveInfo(String type, String qwlTYPE, String qiFlag, Date startTime, Date endTime,
                       String sql, Map<String, Object> infoMap)
  {
    // 预警或报警
    // 获取未巡检的记录
    List<Map<String, Object>> list = null;
    String starTimeStr;
    String endTimeStr;
    if ("1".equals(type))
    {
      // 时段

      starTimeStr = DateUtil.formatDate(startTime, "yyyy-MM-dd HH:mm:ss");
      endTimeStr = DateUtil.formatDate(endTime, "yyyy-MM-dd HH:mm:ss");
      list = modelService.listDataSql(sql, new Object[] {starTimeStr, endTimeStr});
    }
    else
    {
      // 投产
      endTimeStr = DateUtil.formatDate(endTime, "yyyy-MM-dd HH:mm:ss");
      list = modelService.listDataSql(sql, new Object[] {endTimeStr, infoMap.get("MO_NUMBER"),
        infoMap.get("PROCESS_FACE"), infoMap.get("MODEL_CODE"), infoMap.get("AREA_SN")});
    }

    if (list != null && !list.isEmpty())
    {
      int listSize = list.size();
      for (int i = 0; i < listSize; i++ )
      {
        // 保存巡检报警信息
        TableDataMapExt qcTd = new TableDataMapExt();
        qcTd.setTableName("T_QC_WARNING_LOG");
        // CommMethod.addSysDefCol(td.getColMap(), modelAction.getUser());
        String infoId = StringUtils.getUUID();
        Map<String, Object> qcMap = qcTd.getColMap();
        qcMap.put("ID", infoId); // ID
        qcMap.put("QWL_EVENT", qiFlag); // 事件（1-换班检 2-QC巡检 3-品质报警）
        qcMap.put("QWL_STATUS", "N");// 状态（Y/N，Y表示已解除，N表示未解除）
        qcMap.put("QWL_TYPE", qwlTYPE);// 类型(1-预警 2-报警)
        qcMap.put("QWL_TIME", endTime);// 预警时间
        // qcMap.put("QWL_TIME", inputTime);// 预警时间
        qcMap.put("QWL_MO_NUMBER", list.get(i).get("MO_NUMBER"));// 制令单
        qcMap.put("QWL_AREA_SN", list.get(i).get("AREA_SN"));// 线别代码
        qcMap.put("QWL_MODEL_CODE", list.get(i).get("MODEL_CODE"));// 机种代码
        qcMap.put("QWL_PROCESS_FACE", list.get(i).get("PROCESS_FACE"));// 加工面(0:单面，1:正面，2:反面，3:阴阳面)
        qcMap.put("QWL_CONTENT", "巡检未完成");// 预警内容
        qcMap.put("QWL_DEVICE_SN", list.get(i).get("DEVICE_SN"));// 设备SN
        try
        {
          modelService.save(qcTd);
        }
        catch (Exception e)
        {
          log.error(e);
        }

        // 保存设备信号信息
        TableDataMapExt singelTd = new TableDataMapExt();
        singelTd.setTableName("T_CO_DEVICE_SINGEL");
        // CommMethod.addSysDefCol(td.getColMap(), modelAction.getUser());
        Map<String, Object> singelMap = singelTd.getColMap();
        String id = StringUtils.getUUID();
        singelMap.put("ID", id); // ID
        singelMap.put("CDS_ID", infoId); // 预警、巡检等业务
        singelMap.put("CDS_TYPE", "1");// 业务标识 （1: 物料巡检，2:预警平台）
        singelMap.put("CDS_AREA_SN", list.get(i).get("AREA_SN"));// 线别SN
        singelMap.put("CDS_DEVICE_SEQ", list.get(i).get("DEVICE_SEQ"));// 设备序号
        singelMap.put("CDS_DEVICE_SN", list.get(i).get("DEVICE_SN"));// 设备SN
        if ("1".equals(qwlTYPE))
        {
          singelMap.put("CDS_FRIST_TRACK", "2");// 一轨（单轨）信号(0:无 1:断开 2:连通)
        }
        else
        {
          singelMap.put("CDS_FRIST_TRACK", "1");// 一轨（单轨）信号(0:无 1:断开 2:连通)
        }
        singelMap.put("CDS_SECOND_TRACK", "1");// 信号状态(0:无 1:断开 2:连通)
        singelMap.put("CDS_STOP_FLAG", "N");// 停机标识（Y/N）
        singelMap.put("CDS_VALID_FLAG", "Y");// 数据状态(有效:Y，无效:N)
        singelMap.put("CDS_TIME", endTime);// 发生时间
        // singelMap.put("CDS_TIME", inputTime);// 发生时间
        if ("1".equals(qwlTYPE))
        {
          singelMap.put("CDS_ALARM_TYPE", "1");// 预警类型(预警)
        }
        else
        {
          singelMap.put("CDS_ALARM_TYPE", "2");// 预警类型(报警)
        }
        try
        {
          modelService.save(singelTd);
        }
        catch (Exception e)
        {
          log.error(e);
        }
      }
    }
  }
}
