package com.morelean.mcmes.materialtable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 〈料站表修改〉
 * @description 修改保存
 * @ClassName MaterialEditSave
 * @author msad013
 * @version 1.0 developer 2017-6-1 created
 * @see MaterialEditSave
 * @since 2017-6-1
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class MaterialEditSave implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  MsHTranMan hbtran = BussService.getHbTran();

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // 获取封装的数据
    HttpServletRequest request = modelAction.getRequest();
    boolean flag = true;
    Smap<String, Object> smapTemp = modelAction.getParaMapObj();
    smapTemp.initParam();
    try
    {
      // 料站表
    	///////////
      String cmSn = request.getParameter("paraMapObj.CM_SN");
      String cmModelCode = request.getParameter("code");
      String cmProcessFace = request.getParameter("paraMapObj.CM_PROCESS_FACE");
      String cmTrack = request.getParameter("paraMapObj.CM_TRACK");
      String speed = request.getParameter("paraMapObj.CM_MOUNT_SPEED");
      String track = request.getParameter("paraMapObj.CM_TRACK");
      String memo = request.getParameter("paraMapObj.CM_MEMO");
      String staus = request.getParameter("paraMapObj.CM_STAUS");
      String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      String areaSn;
      String areaSnj;
      String sql;
      List<Map> list;
      Map map;
     // String cmlAreaSn[] = request.getParameterValues("paraMap2@CML_AREA_SN");
      String[] cmlAreaSn = null;
      // 关联线别
      String areaSns = request.getParameter("areaSn");
      if (StringUtils.isNotBlank(areaSns)) {
    	  cmlAreaSn = areaSns.split(",");
      }
      // 料站明细
      String deviceType[] = request.getParameterValues("paraMap2@CMD_DEVICE_TYPE2");// 贴片机型
      String prograName[] = request.getParameterValues("paraMap2@CMD_PROGRAM_NAME");// 程式名称
      String deviceSeq[] = request.getParameterValues("paraMap2@CMD_DEVICE_SEQ");// 设备序号
      String tableNo[] = request.getParameterValues("paraMap2@CMD_TABLE_NO");// TABLE
      String cmdLoadpoint[] = request.getParameterValues("paraMap2@CMD_LOADPOINT");// 料站
      String chanelSn[] = request.getParameterValues("paraMap2@CMD_CHANEL_SN2");// 通道
      String itemCode[] = request.getParameterValues("paraMap2@CMD_ITEM_CODE");// 料号
      String feederSpec[] = request.getParameterValues("paraMap2@CMD_FEEDER_SPEC");// feeder
      String tryFlag[] = request.getParameterValues("paraMap2@CMD_TRY_FLAG");// TRAY
      String shkipFlag[] = request.getParameterValues("paraMap2@CMD_SHKIP_FLAG");// 跳过标志
      String pointNum[] = request.getParameterValues("paraMap2@CMD_POINT_NUM");// 点数
      String pointLocation[] = request.getParameterValues("paraMap2@CMD_POINT_LOCATION");// 点位
      String bomFlag[] = request.getParameterValues("paraMap2@CMD_BOM_FLAG");// BOM
      String cmdMemo[] = request.getParameterValues("paraMap2@CMD_MEMO");// 说明
      String device;
      String table = null;
      String loadpoint = null;
      String chanel = null;
      String deviceSeq1 = null;
      String tableNo1 = null;
      String loadpoint1 = null;
      String chanel1 = null;
      String itemCod = null;
      List<Object> whereList = new ArrayList<Object>();
      sql = "select id from T_CO_MATERIAL_TABLE where CM_SN =? and DATA_AUTH =?  ";
      list = modelService.listDataSql(sql, new Object[] {cmSn,dataAuth});
      if (list != null && !list.isEmpty())
      {
        String dataId = modelAction.getDataId();
        map = list.get(0);
        if (!map.get("ID").equals(dataId))
        {
          hbtran.rollback();
          return modelAction.alertParentInfo((modelAction.getText("料站表编码已经存在！")));

        }
      }

      if (cmlAreaSn==null)
      {

        hbtran.rollback();
        return modelAction.alertParentInfo((modelAction.getText("关联线别为空！")));

      }

      for (int i = 0; i < cmlAreaSn.length; i++ )
      {
        areaSn = cmlAreaSn[i];
        sql = "select s.cm_sn from T_CO_MATERIaL_table t join T_CO_MATERIAL_LINE s on s.cm_sn=t.cm_sn"
              + " where t.cm_model_code=? and t.cm_process_face=? and s.cml_area_sn=? and t.CM_TRACK=? and t.data_auth=?  and s.data_auth=? ";
        list = modelService.listDataSql(sql, new Object[] {cmModelCode, cmProcessFace, areaSn,
          cmTrack,dataAuth,dataAuth});
        if (list != null && !list.isEmpty())
        {
          map = list.get(0);
          if (!map.get("CM_SN").equals(cmSn))
          {
            hbtran.rollback();
            return modelAction.alertParentInfo((modelAction.getText("同个机种同个面别同个轨道在同一条线别只允许存在一份料站表")));
          }
        }
        sql = "select t.CD_DEVICE_CLASS,dl.CDL_TABLE,dl.cdl_loadpoint  from t_Co_Area_Device s  join t_co_device t "
              + "  on t.id = s.cad_device_id join t_co_device_loadpoint dl on dl.cd_device_id=t.id join t_co_area b on b.ca_id=s.ca_id where b.ca_parentareaid=? and t.data_auth=?  and s.data_auth=? and dl.data_auth=?  and b.data_auth=?  ";
        List list1 = modelService.listDataSql(sql, new Object[] {areaSn,dataAuth,dataAuth,dataAuth,dataAuth});

        for (int j = i + 1; j < cmlAreaSn.length; j++ )
        {
          areaSnj = cmlAreaSn[j];
          List list2 = modelService.listDataSql(sql, new Object[] {areaSnj,dataAuth,dataAuth,dataAuth,dataAuth});
          if (areaSnj.equals(areaSn))
          {
            hbtran.rollback();
            return modelAction.alertParentInfo((modelAction.getText("关联线别重复")));
          }
          if (!equalList(list1, list2))
          {
            hbtran.rollback();
            return modelAction.alertParentInfo((modelAction.getText("关联线别的设备型号、Table、料站存在不同")));
          }
        }
      }

      Map<String, Object> chanelmap = new HashMap<String, Object>();
      if (deviceType.length == 0)
      {
        hbtran.rollback();
        return modelAction.alertParentInfo((modelAction.getText("请新增料站表明细！")));
      }

      for (int i = 0; i < deviceType.length; i++ )
      {
        device = deviceSeq[i];
        table = tableNo[i];
        loadpoint = cmdLoadpoint[i];
        chanel = chanelSn[i];
        itemCod = itemCode[i];
        String ckey = device + table + loadpoint;
        if (chanelmap.containsKey(ckey))
        {
          if (!"A".equals(chanelmap.get(ckey)))
          {
            if ("A".equals(chanel))
            {
              hbtran.rollback();
              return modelAction.alertParentInfo((modelAction.getText("一个料站不能同时存在单通道与左右等其他通道")));
            }
          }
          else if ("A".equals(chanelmap.get(ckey)))
          {
            if (!"A".equals(chanel))
            {
              hbtran.rollback();
              return modelAction.alertParentInfo((modelAction.getText("一个料站不能同时存在单通道与左右等其他通道")));
            }
          }
        }
        chanelmap.put(ckey, chanel);
        
        List<String> allDev = new ArrayList<String>();
       
        for (int j = 0; j < deviceType.length; j++ )
        {
          String devString="";
          deviceSeq1 = deviceSeq[j];
          tableNo1 = tableNo[j];
          loadpoint1 = cmdLoadpoint[j];
          chanel1 = chanelSn[j];
   
            devString=deviceSeq1+"-"+tableNo1+"-"+loadpoint1+"-"+chanel1;
          if(allDev.contains(devString)) {
        	 return modelAction.alertParentInfo((modelAction.getText("1料站表明细设备序号、TABLE、料站和通道不能完全相同！")));
          }
           allDev.add(devString);
        //   if (deviceSeq.equals(deviceSeq1) && tableNo.equals(tableNo1)
        //       && loadpoint.equals(loadpoint1) && chanel.equals(chanel1))
        //   {
        //     hbtran.rollback();
        //     return modelAction.alertParentInfo((modelAction.getText("料站表明细设备序号、TABLE、料站和通道不能完全相同！")));
        //   }
        }


      }
      int res;
      TableDataMapExt headTabel = new TableDataMapExt();
      headTabel.setTableName("T_CO_MATERIAL_TABLE");
      headTabel.setSqlWhere(" and id = ? ");
      whereList.add(request.getParameter("dataId"));
      headTabel.setSqlWhereArgs(whereList);
      headTabel.getColMap().put("CM_NAME", request.getParameter("paraMapObj.CM_NAME"));
      headTabel.getColMap().put("CM_MOUNT_SPEED", Double.valueOf(speed));
      headTabel.getColMap().put("CM_STAUS", request.getParameter("paraMapObj.CM_STAUS"));
      headTabel.getColMap().put("CM_MEMO", request.getParameter("paraMapObj.CM_MEMO"));
      headTabel.getColMap().put("EDIT_USER", CommMethod.getSessionUser().getId());
      headTabel.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
      headTabel.getColMap().put("CM_TRACK", cmTrack);
      if (StringUtils.isNotBlank(dataAuth))
      {
        headTabel.getColMap().put("DATA_AUTH", dataAuth);
      }
      // modelService.edit(headTabel);

      res = modelService.edit(headTabel);
      if (res < 1)
      {
        flag = false;
      }

      List<Map> lineList = new ArrayList<Map>();
      whereList.clear();
      whereList.add(cmSn);
      whereList.add(dataAuth);
      TableDataMapExt lineTable = new TableDataMapExt();
      lineTable.setTableName("T_CO_MATERIAL_LINE");
      lineTable.setSqlWhere(" and CM_SN = ? and DATA_AUTH = ? ");
      lineTable.setSqlWhereArgs(whereList);
      res = modelService.del(lineTable);// 删除原纪录
      if (res < 1)
      {
        flag = false;
      }
      for (int i = 0; i < cmlAreaSn.length; i++ )
      {
        TableDataMapExt lineTable2 = new TableDataMapExt();
        lineTable2.setTableName("T_CO_MATERIAL_LINE");
        lineTable2.getColMap().put("ID", StringUtils.getUUID());
        lineTable2.getColMap().put("CM_SN", cmSn);
        lineTable2.getColMap().put("CML_AREA_SN", cmlAreaSn[i]);
        lineTable2.getColMap().put("DEPT_ID", CommMethod.getSessionUser().getDeptId());
        lineTable2.getColMap().put("CREATE_USER", CommMethod.getSessionUser().getId());
        lineTable2.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
        lineTable2.getColMap().put("DATA_AUTH", dataAuth);
        res = modelService.save(lineTable2);
        if (res < 1)
        {
          flag = false;
        }
      }// 新增修改后的记录

      whereList.clear();
      whereList.add(cmSn);
      whereList.add(dataAuth);
      TableDataMapExt detTable = new TableDataMapExt();
      detTable.setTableName("T_CO_MATERIAL_DETAIL");
      detTable.setSqlWhere(" and CM_SN = ? and DATA_AUTH = ? ");
      detTable.setSqlWhereArgs(whereList);
      res = modelService.del(detTable);// 删除原纪录
      if (res < 1) flag = false;
      for (int i = 0; i < deviceType.length; i++ )
      {
        TableDataMapExt detTable2 = new TableDataMapExt();
        detTable2.setTableName("T_CO_MATERIAL_DETAIL");
        detTable2.getColMap().put("ID", StringUtils.getUUID());
        detTable2.getColMap().put("CM_SN", cmSn);
        detTable2.getColMap().put("CMD_DEVICE_TYPE", deviceType[i]);
        detTable2.getColMap().put("CMD_PROGRAM_NAME", prograName[i]);
        detTable2.getColMap().put("CMD_DEVICE_SEQ", deviceSeq[i]);
        detTable2.getColMap().put("CMD_TABLE_NO", tableNo[i]);
        detTable2.getColMap().put("CMD_LOADPOINT", cmdLoadpoint[i]);
        detTable2.getColMap().put("CMD_CHANEL_SN", chanelSn[i]);
        detTable2.getColMap().put("CMD_ITEM_CODE", itemCode[i]);
        detTable2.getColMap().put("CMD_POINT_NUM", Double.valueOf(pointNum[i]));
        detTable2.getColMap().put("CMD_POINT_LOCATION", pointLocation[i]);
        detTable2.getColMap().put("CMD_TRY_FLAG", tryFlag[i]);
        detTable2.getColMap().put("CMD_SHKIP_FLAG", shkipFlag[i]);
        detTable2.getColMap().put("CMD_BOM_FLAG", bomFlag[i]);
        detTable2.getColMap().put("CMD_MEMO", cmdMemo[i]);
        detTable2.getColMap().put("CMD_FEEDER_SPEC", feederSpec[i]);
        detTable2.getColMap().put("DEPT_ID", CommMethod.getSessionUser().getDeptId());
        detTable2.getColMap().put("CREATE_USER", CommMethod.getSessionUser().getId());
        detTable2.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
        detTable2.getColMap().put("DATA_AUTH", dataAuth);
        // modelService.save(detTable2);
        res = modelService.save(detTable2);
        if (res < 1) flag = false;
      }// 新增修改后的记录

    }
    catch (Exception e)
    {
       hbtran.rollback();
       e.printStackTrace();
      log.error("修改失败", e);
    }

    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    OperResult operResult = null;
    if (flag == true)
    {
      hbtran.commit();
      return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
        Constants.OPERATE_TYPE_EDIT);
    }
    else
    {
      hbtran.rollback();
      return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.FAIL,
        Constants.OPERATE_TYPE_EDIT);
    }

  }

  private boolean equalList(List list1, List list2)
  {

    if (list1.size() != list2.size()) return false;

      return list2.containsAll(list1);

  }
}
