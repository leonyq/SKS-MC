package com.more.mcmes.moorder.oracle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.ConstantsMc;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 保存功能
 * @author Administrator
 *
 */
public class OnLineSave implements FuncService
{

  @SuppressWarnings("unchecked")
@Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest req = modelAction.getRequest();
    String iframeId = req.getParameter("iframeId");
    String formId = req.getParameter("formId");

    if (StringUtils.isBlank(formId))
    {
      formId = req.getParameter("formIds");
    }
    String isCloseWin = req.getParameter("isCloseWin");// 是否关闭窗口
    
    if (!CommMethod.isRepeatSubmit(req))
    {
     CommMethod.rmSessionMap(modelAction.getSession(), ConstantsMc.FORM_TOKEN);
    }else
      {
       // return ajaxTableAlertInfoClear("请不要重复提交表单！", "2");//ajaxTableAlertInfoClear
        return modelAction.alertParentInfo(modelAction.getText("请不要重复提交表单！"));
      }
    int res = 0;
    String pmMoNumber = req.getParameter("paraMapObj.PM_MO_NUMBER");// 制令单号
    String pmAreaSn = req.getParameter("paraMapObj.PM_AREA_SN");// 线别
    String projectId = req.getParameter("projectId");// 工单号
    String modelCode = req.getParameter("paraMapObj.PM_MODEL_CODE");// 机种
    String modelCodeVer = req.getParameter("paraMapObj.PM_MODEL_CODE_VER");//机种版本号
    String processFace = req.getParameter("face");// 加工面别
    String techSn = req.getParameter("paraMapObj.PM_TECH_SN");// 工艺
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String scheduleDate = req.getParameter("paraMapObj.PM_SCHEDULE_DATE");// 预投产
    String pmDueDate = req.getParameter("paraMapObj.PM_DUE_DATE");// 预关结
    String qtyNumber = req.getParameter("paraMapObj.PM_TARGET_QTY");// 计划数量
    String unNumber = req.getParameter("paraMapObj.PM_UNIT_NUM").equals("")?"0":req.getParameter("paraMapObj.PM_UNIT_NUM");// 联板
    String jigNumber = req.getParameter("paraMapObj.PM_JIGSAW_NUM").equals("")?"0":req.getParameter("paraMapObj.PM_JIGSAW_NUM");// 条码拼板
    String snRule = req.getParameter("paraMapObj.PM_SN_RULE");// 产品条码
    String subRule = req.getParameter("paraMapObj.PM_SUB_RULE");// 小板条码
    String traRule = req.getParameter("paraMapObj.PM_TRANSFER_RULE");// 中转条码
    String errScrap = req.getParameter("paraMapObj.PM_ERROR_SCRAP");// 不良报废
    int conType;// 管控类型
    String fqcFlag = req.getParameter("paraMapObj.PM_AUTO_FQC");// FQC自动送检
    String fqcNumber = req.getParameter("paraMapObj.PM_FQC_NUM");// 送检批量
    String track = req.getParameter("track"); //2018/06/12  轨道
    String inputCode = req.getParameter("INPUT_CODE");// 送检批量
    String outputCode = req.getParameter("OUTPUT_CODE"); //2018/06/12  轨道    
    String starGourp = req.getParameter("paraMapObj.PM_START_GROUP");
    String endGourp = req.getParameter("paraMapObj.PM_END_GROUP");
    Integer fqcNumber2 = 0;
    String sql0 = "select t.PMO_AREA_SN from T_PM_MO_ONLINE t where t.PMO_NUMBER = ? AND T.DATA_AUTH=? ";
    List<Map> list0 = new ArrayList<Map>();
    list0 = modelService.listDataSql(sql0, new Object[]{pmMoNumber,dataAuth});
    String paraArea = null;
    for(int i=0;i<list0.size();i++){
    	paraArea = String.valueOf(list0.get(i).get("PMO_AREA_SN"));
    	if(!paraArea.equals(pmAreaSn)){
    		throw new BussException(modelAction.getText("该制令单已在其他线别上")+":"+paraArea);
    	}
    }
    if (fqcNumber != null && !"".equals(fqcNumber))
    {
      fqcNumber2 = Integer.parseInt(fqcNumber);
    }
    String sql4 = "select VR_VALUE from  T_SYS_PARAMETER_INI where VR_CLASS='SMT0013' AND DATA_AUTH=? ";

    List<Map> list3 = modelService.listDataSql(sql4,new Object[] {dataAuth});
    String vrValue = "0";
    if(null!=list3 && list3.size()>0){
       vrValue = list3.get(0).get("VR_VALUE").toString();
    }
    
    

    if (vrValue.equals("1"))
    {
      String indictorFlag = req.getParameter("indictorFlag");// 生产指示单标志
      if ("true".equals(indictorFlag))
      {
        String sql = "";
        String indicatorSn = "";
        List<Map<String, Object>> result = null;
        sql = "SELECT * FROM T_CO_INDICATORR T WHERE T.CO_MODEL_CODE=? AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";
        result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
        if (!(result == null) && !result.isEmpty())
        {
          // 存在 新增指示单信息
          // /////////////////////////////////////////
          String dataAuth2 = StringUtils.toString(result.get(0).get("DATA_AUTH"));
          indicatorSn = StringUtils.toString(result.get(0).get("CO_INDICATORR_SN"));// 指示单号
          TableDataMapExt tMap = new TableDataMapExt();
          tMap.setTableName("T_CO_INDICATORR_ONLINE");
          String infoId = StringUtils.getUUID();
          CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
          tMap.getColMap().putAll(result.get(0));
          tMap.getColMap().put("CO_MO_NUMBER", pmMoNumber);
          tMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
          tMap.getColMap().put("ID", infoId);
          tMap.getColMap().put("CO_ONLINE_TIME", DateUtil.getCurDate());
          modelService.save(tMap);

          sql = "SELECT T2.* " + " FROM T_CO_INDICATORR T "
                + " LEFT JOIN T_CO_INDICATORR_PROJECT_INFO T2 "
                + " ON T.CO_INDICATORR_SN = T2.CO_INDICATORR_SN "
                + " WHERE T.CO_MODEL_CODE = ?  AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";
          result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
          if (!(result == null) && !result.isEmpty())
          {
            for (int i = 0; i < result.size(); i++ )
            {
              TableDataMapExt itemMap = new TableDataMapExt();
              itemMap.setTableName("T_CO_INDICATORR_ONLINEPRO_INFO");
              String infoId2 = StringUtils.getUUID();
              CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
              itemMap.getColMap().putAll(result.get(i));
              itemMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
              itemMap.getColMap().put("ID", infoId2);
              itemMap.getColMap().put("CO_INDICATORR_ID", infoId);
              modelService.save(itemMap);
            }
          }
        }
      }
    }

    String sql = "select t.PMO_NUMBER from T_PM_MO_ONLINE t where t.PMO_NUMBER = ? "
      + "and t.PMO_AREA_SN = ? and t.PMO_TRACK = ? AND T.DATA_AUTH=? ";
    List dataList = modelService.listDataSql(sql, new Object[] {pmMoNumber,pmAreaSn,track,dataAuth});//t.PMO_NUMBER = ? and
    if (dataList == null || dataList.isEmpty())
    {// 制令单在线表不存在该制令单,删除该表线别下的其他制令单，并添加该制令单
     // 1.删除
    	List<Object> sqlList = new ArrayList<Object>();
      TableDataMapExt delMoTable = new TableDataMapExt();
      //ArrayList moList = new ArrayList();
      String sql2 = "select * from T_PM_MO_ONLINE where PMO_AREA_SN = ? AND DATA_AUTH=? ";
      List dataList2 = modelService.listDataSql(sql2, new Object[] {pmAreaSn,dataAuth});
      if (dataList2 != null && !dataList2.isEmpty())
      {
    	sqlList.add(pmAreaSn);
    	sqlList.add(track);
    	sqlList.add(dataAuth);
        delMoTable.setTableName("T_PM_MO_ONLINE");
        delMoTable.setSqlWhere("and PMO_AREA_SN = ? AND PMO_TRACK = ? AND DATA_AUTH=? ");
        delMoTable.setSqlWhereArgs(sqlList);
        //moList.add(pmAreaSn);
        //delMoTable.setSqlWhereArgs(moList);
        res = modelService.del(delMoTable);
        /*if (res < 1)
        {
          throw new BussException("保存失败");
        }*/
      }

      // 2.添加
      TableDataMapExt saveMoTable = new TableDataMapExt();
      Map colMap = saveMoTable.getColMap();
      CommMethod.addSysDefCol(colMap, modelAction.getUser());
      saveMoTable.setTableName("T_PM_MO_ONLINE");
      colMap.put("ID", StringUtils.getUUID());
      colMap.put("PMO_NUMBER", pmMoNumber);
      colMap.put("PMO_PROJECT_ID", projectId);
      colMap.put("PMO_TYPE", 1);// 作业类型（1上线，2下线）
      colMap.put("PMO_MODEL_CODE", modelCode);
      colMap.put("PMO_MODEL_CODE_VER", modelCodeVer);
      colMap.put("PMO_AREA_SN", pmAreaSn);
      colMap.put("PMO_PROCESS_FACE", processFace);
      colMap.put("PMO_TECH_SN", techSn);
      colMap.put("PMO_TRACK", track);
      colMap.put("PMO_TIME", DateUtil.getCurDate());
      colMap.put("PMO_EMP", CommMethod.getSessionUser().getId());
      if (dataAuth != null && !dataAuth.equals(""))
      {
        colMap.put("DATA_AUTH", dataAuth);
      }
      res = modelService.save(saveMoTable);
      if (res < 1)
      {
        throw new BussException(modelAction.getText("保存失败"));
      }

    }
    else
    {// 制令单在线表存在该制令单,修改上线信息
     // 3.修改
      List<Object> sqlList = new ArrayList<Object>();
      sqlList.add(pmMoNumber);
      sqlList.add(dataAuth);
      TableDataMapExt editMoTable = new TableDataMapExt();
      Map colMap = editMoTable.getColMap();
      editMoTable.setTableName("T_PM_MO_ONLINE");
      editMoTable.setSqlWhere(" and PMO_NUMBER = ? AND DATA_AUTH=? ");
      editMoTable.setSqlWhereArgs(sqlList);
      colMap.put("PMO_PROJECT_ID", projectId);
      colMap.put("PMO_TYPE", "1");// 作业类型（1上线，2下线）
      colMap.put("PMO_MODEL_CODE", modelCode);
      colMap.put("PMO_MODEL_CODE_VER", modelCodeVer);
      colMap.put("PMO_AREA_SN", pmAreaSn);
      colMap.put("PMO_PROCESS_FACE", processFace);
      colMap.put("PMO_TECH_SN", techSn);
      colMap.put("PMO_TIME", DateUtil.getCurDate());
      colMap.put("PMO_EMP", CommMethod.getSessionUser().getId());
      if (dataAuth != null && !dataAuth.equals(""))
      {
        colMap.put("DATA_AUTH", dataAuth);
      }

      res = modelService.edit(editMoTable);
      if (res < 1)
      {
        throw new BussException(modelAction.getText("保存失败"));
      }

    }
    // 保存设备
    String[] devSns = req.getParameterValues("devsn");// 设备sn
    String[] pdoTypes = req.getParameterValues("pdotype");// 设备状态
    String[] checks = req.getParameterValues("checked");// 判断是否勾选
    String[] devSeqs2 = req.getParameterValues("devseq");// 设备序号
    String[] workSta = req.getParameterValues("ca_id");// 工作中心
    String devSn = "";
    String pdoType = "";
    String check = "";
    String devSeq2 = "";
    int size = 0;
    if (devSns != null)
    {
      size = devSns.length;
    }
    TableDataMapExt devTable = new TableDataMapExt();
    Map colMap1 = devTable.getColMap();
    CommMethod.addSysDefCol(colMap1, modelAction.getUser());
    devTable.setTableName("T_PM_DEVICE_ONLINE");
    //记录在线设备日志表
    TableDataMapExt devlogTable = new TableDataMapExt();
    devlogTable.setTableName("T_PM_DEVICE_ONLINE_L");    
    if (size == 0)
    {
      colMap1.put("ID", StringUtils.getUUID());
      colMap1.put("PDO_NUMBER", pmMoNumber);
      colMap1.put("PDO_PROJECT_ID", projectId);
      colMap1.put("PDO_MODEL_CODE", modelCode);
      colMap1.put("PDO_AREA_SN", pmAreaSn);
      colMap1.put("PDO_PROCESS_FACE", processFace);
      colMap1.put("PDO_TRACK", track);
      colMap1.put("PDO_TYPE", "1");
      colMap1.put("PDO_TIME", DateUtil.getCurDate());// 作业时间
      colMap1.put("PDO_EMP", CommMethod.getSessionUser().getId());// 作业员
      res = modelService.save(devTable);
      if (res < 1)
      {
        throw new BussException(modelAction.getText("保存失败"));
      }
      
      CommMethod.addSysDefCol(devlogTable.getColMap(), modelAction.getUser());
      devlogTable.getColMap().put("PDO_NUMBER", pmMoNumber);
      devlogTable.getColMap().put("PDO_PROJECT_ID", projectId);
      devlogTable.getColMap().put("PDO_MODEL_CODE", modelCode);
      devlogTable.getColMap().put("PDO_AREA_SN", pmAreaSn);
      devlogTable.getColMap().put("PDO_PROCESS_FACE", processFace);
      devlogTable.getColMap().put("PDO_TRACK", track);
      devlogTable.getColMap().put("PDO_TYPE", "1");
      devlogTable.getColMap().put("PDO_TIME", DateUtil.getCurDate());// 作业时间
      devlogTable.getColMap().put("PDO_EMP", CommMethod.getSessionUser().getId());// 作业员
      res = modelService.save(devlogTable);
      if (res < 1)
      {
        throw new BussException(modelAction.getText("保存失败"));
      }
    }
    for (int i = 0; i < size; i++ )
    {
      devSn = devSns[i];
      pdoType = pdoTypes[i];
      check = checks[i];
      devSeq2 = devSeqs2[i];
      if ("N".equals(check))
      {
        continue;
      }
      else
      {
        colMap1.put("ID", StringUtils.getUUID());
        colMap1.put("PDO_NUMBER", pmMoNumber);
        colMap1.put("PDO_PROJECT_ID", projectId);
        colMap1.put("PDO_MODEL_CODE", modelCode);
        colMap1.put("PDO_AREA_SN", pmAreaSn);
        colMap1.put("PDO_PROCESS_FACE", processFace);
        colMap1.put("PDO_TRACK", track);
        colMap1.put("PDO_DEVICE_SN", devSn);
        colMap1.put("PDO_DEVICE_SEQ", devSeq2);
        colMap1.put("PDO_TYPE", "1");
        colMap1.put("PDO_TIME", DateUtil.getCurDate());// 作业时间
        colMap1.put("PDO_EMP", CommMethod.getSessionUser().getId());// 作业员
        if (dataAuth != null && !dataAuth.equals(""))
        {
          colMap1.put("DATA_AUTH", dataAuth);
        }

        res = modelService.save(devTable);
        if (res < 1)
        {
          throw new BussException(modelAction.getText("保存失败"));
        }
        
        //记录日志表
        devlogTable.getColMap().clear();
        CommMethod.addSysDefCol(devlogTable.getColMap(), modelAction.getUser());
        devlogTable.getColMap().put("PDO_NUMBER", pmMoNumber);
        devlogTable.getColMap().put("PDO_PROJECT_ID", projectId);
        devlogTable.getColMap().put("PDO_MODEL_CODE", modelCode);
        devlogTable.getColMap().put("PDO_AREA_SN", pmAreaSn);
        devlogTable.getColMap().put("PDO_PROCESS_FACE", processFace);
        devlogTable.getColMap().put("PDO_TRACK", track);
        devlogTable.getColMap().put("PDO_DEVICE_SN", devSn);
        devlogTable.getColMap().put("PDO_DEVICE_SEQ", devSeq2);
        devlogTable.getColMap().put("PDO_TYPE", "1");
        devlogTable.getColMap().put("PDO_TIME", DateUtil.getCurDate());// 作业时间
        devlogTable.getColMap().put("PDO_EMP", CommMethod.getSessionUser().getId());// 作业员
        if (dataAuth != null && !dataAuth.equals(""))
        {
        	devlogTable.getColMap().put("DATA_AUTH", dataAuth);
        }

        res = modelService.save(devlogTable);
        if (res < 1)
        {
          throw new BussException(modelAction.getText("保存失败"));
        }

      }
    }
    // 保存料站信息
    String[] cmSns = req.getParameterValues("CM_SN");// 主料料号
    String[] itemCodes = req.getParameterValues("CMD_ITEM_CODE");// 主料料号
    String[] devTypes = req.getParameterValues("CMD_DEVICE_TYPE");// 贴片机型
    String[] proNames = req.getParameterValues("CMD_PROGRAM_NAME");// 程序名称
    String[] devSeqs = req.getParameterValues("CMD_DEVICE_SEQ");// 设备序号
    String[] tables = req.getParameterValues("CMD_TABLE_NO");// table
    String[] loadPoints = req.getParameterValues("CMD_LOADPOINT");// 料站
    String[] chanels = req.getParameterValues("CMD_CHANEL_SN");// 通道
    String[] pointNumbers = req.getParameterValues("CMD_POINT_NUM");// 点数
    String[] pointLocations = req.getParameterValues("CMD_POINT_LOCATION");// 点位
    String[] tryFlags = req.getParameterValues("CMD_TRY_FLAG");// TRY盘物料(Y/N)
    String[] skipFlags = req.getParameterValues("CMD_SHKIP_FLAG");// 跳过标志
    String[] bomFlags = req.getParameterValues("CMD_BOM_FLAG");// BOM范围(Y/N)
    // String [] loadFlags = req.getParameterValues("CMD_LOAD_FLAG");//上料状态(Y/N)
    if (itemCodes == null)
    {
      size = 0;
    }
    else
    {
      size = itemCodes.length;
    }
    //根据设备、table、料站、通道判断在线料表是否有数据
    String querySql = "SELECT T.CM_SN FROM T_CO_MATERIAL_ONLINE T WHERE T.CMO_DEVICE_SEQ = ? " +
    		"AND T.CMO_TABLE_NO = ? AND T.CMO_LOADPOINT = ? AND T.CMO_CHANEL_SN = ? AND T.CMO_AREA_SN = ? " +
    		"AND T.CMO_LOAD_FLAG = 'Y' AND T.DATA_AUTH=? ";
    List<Map> quList = null;
    TableDataMapExt cmdTable = new TableDataMapExt();
    Map colMap2 = cmdTable.getColMap();
    CommMethod.addSysDefCol(colMap2, modelAction.getUser());
    cmdTable.setTableName("T_CO_MATERIAL_ONLINE");
    for (int i = 0; i < size; i++ )
    {
      colMap2.put("CMD_ID", StringUtils.getUUID());
      colMap2.put("CM_SN", cmSns[i]);
      colMap2.put("CMO_MO_NUMBER", pmMoNumber);
      colMap2.put("CMO_PROJECT_ID", projectId);
      colMap2.put("CMO_MODEL_CODE", modelCode);
      colMap2.put("CMO_AREA_SN", pmAreaSn);
      colMap2.put("CMO_PROCESS_FACE", processFace);
      colMap2.put("CMO_TRACK", track);
      colMap2.put("CMO_ITEM_CODE", itemCodes[i]);
      if (dataAuth != null && !dataAuth.equals(""))
      {
        colMap2.put("DATA_AUTH", dataAuth);
      }
      colMap2.put("CMO_DEVICE_TYPE", devTypes[i]);
      if (proNames[i] == null || proNames[i] == "null")
      {
        proNames[i] = "";
      }
      colMap2.put("CMO_PROGRAM_NAME", proNames[i]);
      colMap2.put("CMO_DEVICE_SEQ", devSeqs[i]);
      colMap2.put("CMO_TABLE_NO", tables[i]);
      colMap2.put("CMO_LOADPOINT", loadPoints[i]);
      colMap2.put("CMO_CHANEL_SN", chanels[i]);
      int num1 = 0;
      if(!pointNumbers[i].equals("") && pointNumbers[i]!=null) num1 = Integer.valueOf(pointNumbers[i]);
      colMap2.put("CMO_POINT_NUM",num1);

      colMap2.put("CMO_POINT_LOCATION", pointLocations[i]);

      colMap2.put("CMO_TRY_FLAG", tryFlags[i]);
      if (tryFlags[i] == null || tryFlags[i] == "null")
      {
        bomFlags[i] = "N";
      }
      colMap2.put("CMO_SHKIP_FLAG", skipFlags[i]);
      if (bomFlags[i] == null || bomFlags[i] == "null")
      {
        bomFlags[i] = "N";
      }

      colMap2.put("CMO_BOM_FLAG", bomFlags[i]);
      quList = modelService.listDataSql(querySql, new Object[] {devSeqs[i],tables[i],loadPoints[i],chanels[i],pmAreaSn,dataAuth});
      if(quList!=null&&quList.size()>0){
    	  colMap2.put("CMO_LOAD_FLAG", "Y");
    	  //插入物料作业记录
    	  String insSql = "INSERT INTO T_WIP_STATION_ITEM(WSI_MO_NUMBER,WSI_ACTIONTYPE,WSI_MODEL_CODE," +
    	  		"WSI_PROCESS_FACE,WSI_AREA_ID,WSI_WORKSTATION_SN,WSI_ONLINE_FLAG,WSI_ITEM_SN,WSI_ITEM_CODE," +
    	  		"WSI_LOT_NO,WSI_ITEM_COUNT,WSI_POINT,WSI_POINT_NUM,WSI_SUPPLIERS,WSI_ITEM_SN_OLD,WSI_ITEM_CODE_OLD," +
    	  		"WSI_LOT_NO_OLD,WSI_COUNT_OLD,WSI_DEVICE_SN,WSI_DEVICE_SEQ,WSI_TRUCK_NO,WSI_TABLE_NO,WSI_LOADPOINT_SN," +
    	  		"WSI_FEEDER_SN,WSI_CHANEL_NO,WSI_TRAY_FLAG,WSI_REPEAT_FLAG,WSI_LOADTIME,WSI_EMP,ID,DEPT_ID,CREATE_USER," +
    	  		"CREATE_TIME,EDIT_USER,EDIT_TIME,WSI_ITEM_TYPE,DATA_AUTH,WSI_PRODUCT_NUM,WSI_TRACK) SELECT " +
    	  		"?,'0',?,?,?,?,'Y',WSI_ITEM_SN,WSI_ITEM_CODE,WSI_LOT_NO,WSI_ITEM_COUNT,WSI_POINT,WSI_POINT_NUM," +
    	  		"WSI_SUPPLIERS,WSI_ITEM_SN_OLD,WSI_ITEM_CODE_OLD,WSI_LOT_NO_OLD,WSI_COUNT_OLD,WSI_DEVICE_SN,WSI_DEVICE_SEQ," +
    	  		"WSI_TRUCK_NO,WSI_TABLE_NO,WSI_LOADPOINT_SN,WSI_FEEDER_SN,WSI_CHANEL_NO,WSI_TRAY_FLAG,WSI_REPEAT_FLAG," +
    	  		"SYSDATE,?,?,DEPT_ID,CREATE_USER,SYSDATE,EDIT_USER,EDIT_TIME,WSI_ITEM_TYPE,DATA_AUTH,WSI_PRODUCT_NUM," +
    	  		"? FROM T_WIP_STATION_ITEM T WHERE T.WSI_DEVICE_SEQ = ? AND T.WSI_TABLE_NO = ? " +
    	  		" AND T.WSI_LOADPOINT_SN = ? AND T.WSI_CHANEL_NO = ? AND T.WSI_AREA_ID = ? AND T.WSI_ONLINE_FLAG = 'Y' AND "+
    	  	  "T.DATA_AUTH=? ";
    	  try {
    		  modelService.execSql(insSql, new Object[]{pmMoNumber,modelCode,processFace,pmAreaSn,
        			  workSta[0],CommMethod.getSessionUser().getLoginName(),StringUtils.getUUID(),track,
        			  devSeqs[i],tables[i],loadPoints[i],chanels[i],pmAreaSn,dataAuth});
			} catch (Exception e) {
				throw new BussException(modelAction.getText("保存失败"));
			}
    	  
      }else{
    	  colMap2.put("CMO_LOAD_FLAG", "N");
      }
      colMap2.put("ID", StringUtils.getUUID());
      res = modelService.save(cmdTable);
      if (res < 1)
      {
        throw new BussException(modelAction.getText("保存失败"));
      }
    }
    //断当前设备是否上料完成
    String arSql = "select t.CMO_DEVICE_SEQ from T_CO_MATERIAL_ONLINE t WHERE T.CMO_AREA_SN = ? AND T.DATA_AUTH=? ";
    List<Map> arList = modelService.listDataSql(arSql, new Object[] {pmAreaSn,dataAuth});
    if(arList!=null&&arList.size()>0){
        String checkSql = "select t.CMO_DEVICE_SEQ "+
            "from T_CO_MATERIAL_ONLINE t "+
            "WHERE T.CMO_AREA_SN = ? " +
        		"AND T.CMO_MO_NUMBER = ? AND T.CMO_PROCESS_FACE = ? " +
        		"AND T.CMO_DEVICE_SEQ = ? " +
        		"AND T.CMO_LOAD_FLAG = 'N' AND T.CMO_SHKIP_FLAG = 'N' AND T.CMO_TRACK = ? "+
        	  "AND T.DATA_AUTH=? ";
        List<Map> checkList = null;
        for(int i=0;i<size; i++){
        	checkList = modelService.listDataSql(checkSql, new Object[] {pmAreaSn,pmMoNumber,processFace,devSeqs[i],track,dataAuth});
        	if(checkList.isEmpty()){ //上料完成
        		String upSql = "UPDATE T_PM_DEVICE_ONLINE T SET PDO_TYPE = '3' " +
        				"where T.PDO_AREA_SN = ? AND T.PDO_DEVICE_SEQ = ? AND T.PDO_TRACK = ? AND T.DATA_AUTH=? ";
        		try {
    				modelService.execSql(upSql, new Object[]{pmAreaSn,devSeqs[i],track,dataAuth});
    			} catch (Exception e) {
    				throw new BussException(modelAction.getText("保存失败"));
    			}
        	}
        }
    }
    List<Object> sqlList = new ArrayList<Object>();
    sqlList.add(pmMoNumber);
    sqlList.add(dataAuth);
    TableDataMapExt editMoBaseTable = new TableDataMapExt();
    Map colMap = editMoBaseTable.getColMap();
    editMoBaseTable.setTableName("T_PM_MO_BASE");
    editMoBaseTable.setSqlWhere(" and PM_MO_NUMBER = ? AND DATA_AUTH=? ");
    editMoBaseTable.setSqlWhereArgs(sqlList);
    colMap.put("PM_TECH_SN", techSn);// 工艺名称
    colMap.put("PM_AREA_SN", pmAreaSn);// 线别
    colMap.put("PM_PROCESS_FACE", processFace);// 加工面
    colMap.put("PM_SCHEDULE_DATE", DateUtil.parseDate(scheduleDate, "yyyy-MM-dd HH:mm:ss"));// 预投产
    colMap.put("PM_DUE_DATE", DateUtil.parseDate(pmDueDate, "yyyy-MM-dd HH:mm:ss"));// 预关结
    // colMap.put("PM_TARGET_QTY", qtyNumber);//计划数量
    colMap.put("PM_UNIT_NUM", Integer.valueOf(unNumber));// 联板
    colMap.put("PM_JIGSAW_NUM", Integer.valueOf(jigNumber));// 条码平板
    colMap.put("PM_SN_RULE", snRule);// 产品条码
    colMap.put("PM_SUB_RULE", subRule);// 小板条码
    colMap.put("PM_TRANSFER_RULE", traRule);// 中转条码
    colMap.put("PM_ERROR_SCRAP", errScrap);// 不良报废
    if(StringUtils.isEmpty(errScrap))errScrap="N";
    if(req.getParameter("paraMapObj.PM_CONTROL_TYPE")==null || req.getParameter("paraMapObj.PM_CONTROL_TYPE").equals("")){
    	colMap.put("PM_CONTROL_TYPE", null);// 管控类型
    }else{
    	conType = Integer.valueOf(req.getParameter("paraMapObj.PM_CONTROL_TYPE"));// 管控类型
    	colMap.put("PM_CONTROL_TYPE", conType);// 管控类型
    }    
    colMap.put("PM_AUTO_FQC", fqcFlag);// FQC自动送检
    colMap.put("PM_START_GROUP", starGourp);// 起始工序
    colMap.put("PM_END_GROUP", endGourp);// 结束工序    
    if ("Y".equals(fqcFlag))
    {
      colMap.put("PM_FQC_NUM", fqcNumber2);// 送检批量
    }
    else
    {
      colMap.put("PM_FQC_NUM", 0);// 送检批量
    }
    res = modelService.edit(editMoBaseTable);
    if (res < 1)
    {
      throw new BussException(modelAction.getText("保存失败"));
    }
    
   /* String m_res = SaveProductSn(dataAuth,modelService, projectId, pmMoNumber, "", "", "",
      modelAction.getUser().getId());
        if (!m_res.equals("OK")) {
        throw new BussException(m_res.replace("NG:", ""));
    }*/

    // 新增员工上岗记录日志 查询当前线别所有上线的员工
    String userSql = "SELECT t.user_id FROM T_USER_STATION_ON_OFF t "
                     + "WHERE t.ca_area_sn = ? AND t.on_off_type = '1' AND T.DATA_AUTH=? ";
    List<Map> uList = modelService.listDataSql(userSql, new Object[] {pmAreaSn,dataAuth});
    if (uList != null && uList.size() > 0)
    {
      int num = uList.size();
      TableDataMapExt uTable = new TableDataMapExt();
      uTable.setTableName("T_USER_STATION_ON_OFF_LOG");
      for (int i = 0; i < num; i++ )
      {
        uTable.getColMap().clear();
        CommMethod.addSysDefCol(uTable.getColMap(), modelAction.getUser());
        uTable.getColMap().put("USER_ID", uList.get(i).get("USER_ID"));
        uTable.getColMap().put("ON_OFF_TYPE", "1");
        uTable.getColMap().put("CA_AREA_SN", pmAreaSn);
        uTable.getColMap().put("MO_NUMBER", pmMoNumber);
        uTable.getColMap().put("OP_TIME", DateUtil.getCurDate());
        modelService.save(uTable);
      }
    }
    // return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
    // Constants.OPERATE_TYPE_EDIT);
    return modelAction.ajaxTablereloadParentFun(modelAction.getText("上线成功"), formId, iframeId);
  }

  @SuppressWarnings("unchecked")
  public String getIndicatorSn(String dataAuth, String prefix, String dispatchSn,
                               ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3};
    int[] outplace = {4, 5};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
    list.add(prefix);
    list.add(dispatchSn);
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String res = (String)relist.get(0); // 结果
    return res;
  }
  //生成工单号段
  @SuppressWarnings("unchecked")
  public String SaveProductSn(String dataAuth,ModelService modelService, String project_id, String mo_number, String sn_start,
                              String sn_end, String sn_prefix, String user_id) {
      
      ProFuncDto pf = new ProFuncDto();
      int[] inPlace = {1, 2, 3, 4, 5, 6,7};
      int[] outplace = {8};
      List<Object> list = new ArrayList<Object>();
      List<Object> outType = new ArrayList<Object>();
      list.add(dataAuth);
      list.add(project_id);
      list.add(mo_number);
      list.add(sn_start);
      list.add(sn_end);
      list.add(sn_prefix);
      list.add(user_id);
      outType.add("String");
      pf.setClassName("P_MES_SAVE_PRODUCT_SN");
      pf.setInPlace(inPlace);// 存储过程中in
      pf.setOutPlace(outplace); // 存储过程中out
      pf.setTotalLen(8);// 总个数
      pf.setValArgs(list);// 存储过程中输入的参数
      pf.setOutValType(outType);// 输出的参数
      List<Object> relist = modelService.procComm(pf);// 接收返回值
      String res = (String) relist.get(0); // 结果
      return res;
     
  }
}
