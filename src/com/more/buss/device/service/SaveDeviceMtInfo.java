package com.more.buss.device.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存设备信息项目维护的内容
 * @author Administrator
 *
 */
public class SaveDeviceMtInfo  implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String formId = request.getParameter("formId");
        if(StringUtils.isBlank(formId)){
          	formId = request.getParameter("formIds");
       	}
        String iframeId = request.getParameter("iframeId");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
        	//设备保养信息字段
        	String deviceSn = request.getParameter("paraMapObj.CD_DEVICE_SN"); //设备sn
			String deviceType = request.getParameter("CD_DEVICE_TYPE");	//设备类型
			String deviceClass = request.getParameter("CD_DEVICE_CLASS");//设备型号
			String mtEmp = request.getParameter("CD_CHARGE_MAN");//保养人id
			String mtEmps = request.getParameter("paraMapObj.CDM_MT_EMP");//保养人id
			String lastTime = request.getParameter("CD_MT_DATE");//最后保养时间
			String mtTime = request.getParameter("CDM_MT_TIME");//当前保养时间
			String mtLong = request.getParameter("paraMapObj.CDM_MT_LONG");//保养工时(H)
			String mtSpec = request.getParameter("paraMapObj.CDM_MT_SPACE");//保养间隔(D)
			String mtMemo = request.getParameter("CDM_MT_MEMO");//备注
			String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");//组织机构
			String selCount = request.getParameter("selCount");//
			String mtId = StringUtils.getUUID();//设备保养信息id
			TableDataMapExt deviceMtInfo = new TableDataMapExt(); //设备保养信息表
			deviceMtInfo.setTableName("T_CO_DEVICE_MT_INFO");
			CommMethod.addSysDefCol(deviceMtInfo.getColMap(), modelAction.getUser());
			deviceMtInfo.getColMap().put("ID", mtId);
			deviceMtInfo.getColMap().put("CDM_DEVICE_SN", deviceSn);
			deviceMtInfo.getColMap().put("CDM_DEVICE_TYPE", deviceType);
			deviceMtInfo.getColMap().put("CDM_DEVICE_CLASS", deviceClass);
			deviceMtInfo.getColMap().put("CDM_MT_EMP", mtEmps);
			deviceMtInfo.getColMap().put("CDM_LAST_TIME", sdf.parse(mtTime));
			deviceMtInfo.getColMap().put("CDM_MT_TIME", sdf.parse(mtTime));
			
			deviceMtInfo.getColMap().put("CDM_MT_LONG", Double.valueOf(mtLong));
			deviceMtInfo.getColMap().put("CDM_MT_SPACE", Double.valueOf(mtSpec));
			deviceMtInfo.getColMap().put("CDM_MT_MEMO", mtMemo);
			if(dataAuth!=null){
      				deviceMtInfo.getColMap().put("DATA_AUTH", dataAuth);
      			}
			
			modelService.save(deviceMtInfo);
			
			//更新设备的最后保养时间
			TableDataMapExt device = new TableDataMapExt(); //设备信息表
			List list = new ArrayList();
			device.setTableName("T_CO_DEVICE");
			device.setSqlWhere(" and CD_DEVICE_SN=? and DATA_AUTH=? ");
			list.add(deviceSn);
			list.add(dataAuth);
			device.setSqlWhereArgs(list);
			device.getColMap().put("CD_MT_DATE", sdf.parse(sdf.format(new Date())));
			modelService.edit(device);
			//获取项目类别
			String deviceItemType1 = request.getParameter("type1");  //保养项目
			//获取项目类别里面的记录条数
			int num1 = Integer.parseInt(request.getParameter("trCount1"));
			//记录数不为空时
			if(num1!=0){
				//循环信息条数并插入数据库 设备保养明细表
			    TableDataMapExt deviceMaintenance = new TableDataMapExt();
			    String deviceItemCode1 = null;
				String deviceItemName1 = null;
				String deviceItemClass1 = null;
				String deviceItemMaxValue1 = null;
				String deviceItemMinValue1 = null;
				String[] deviceItemReal1 = null;
				String deviceItemUnit1 = null;
				String deviceItemContent1 = null;
				 deviceItemReal1 = request.getParameterValues("deviceItemReal");
				for(int i=1;i<num1+1;i++){
					 deviceItemCode1 = request.getParameter("deviceItemCode1_"+i);
					 deviceItemName1 = request.getParameter("deviceItemName1_"+i);
					 deviceItemClass1 = request.getParameter("deviceItemClass1_"+i);
					 deviceItemMaxValue1 = request.getParameter("deviceitemMaxvalue1_"+i);
					 deviceItemMinValue1 = request.getParameter("deviceitemMinvalue1_"+i);
					
					 deviceItemUnit1 = request.getParameter("deviceItemUnit1_"+i);
					 deviceItemContent1 = request.getParameter("deviceItemContent1_"+i);
					 deviceMaintenance.setTableName("T_CO_DEVICE_MT_DETAIL"); //设备保养明细表
					 CommMethod.addSysDefCol(deviceMaintenance.getColMap(), modelAction.getUser());
					 deviceMaintenance.getColMap().put("ID", StringUtils.getUUID());
					 deviceMaintenance.getColMap().put("CDMI_ID", mtId);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_TYPE", deviceItemType1);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_CODE", deviceItemCode1);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_NAME", deviceItemName1);
					 deviceMaintenance.getColMap().put("CDMI_ITEM_CLASS", deviceItemClass1);
					 if (StringUtils.isNotBlank(deviceItemMaxValue1))
          {
					   deviceMaintenance.getColMap().put("CDMI_ITEM_MAXVALUE", Double.valueOf(deviceItemMaxValue1));
          }
					 if (StringUtils.isNotBlank(deviceItemMinValue1))
	          {
	             deviceMaintenance.getColMap().put("CDMI_ITEM_MINVALUE", Double.valueOf(deviceItemMinValue1));
	          }
					
					 deviceMaintenance.getColMap().put("CDMI_ITEM_REAL", Double.valueOf(deviceItemReal1[i-1]));
					 deviceMaintenance.getColMap().put("CDMI_ITEM_UNIT", deviceItemUnit1);
					 deviceMaintenance.getColMap().put("CDMI_MT_CONTENT", deviceItemContent1);
					 if(dataAuth!=null){
      						deviceMaintenance.getColMap().put("DATA_AUTH", dataAuth);
      					 }
					 
					 modelService.save(deviceMaintenance);
				}
			}
	//更换配件保存
	 String[] docNums = request.getParameterValues("DOC_NUM");// 领料单号
      String[] itemSns = request.getParameterValues("ITEM_SN");// 备件SN
      String[] itemCodes = request.getParameterValues("ITEM_CODE");// 配料料号
      String[] itemNums = request.getParameterValues("ITEM_NUM");// 配件数量
      String[] changeReasons = request.getParameterValues("CHANGE_REASON");// 更换原因
      String[] memos = request.getParameterValues("MEMO");// 备注
      if (null!=docNums && docNums.length>0)
      {
        TableDataMapExt deviceFitting = new TableDataMapExt(); // 设备备件更换信息表
        deviceFitting.setTableName("T_CO_DEVICE_FITTING"); // 设备备件更换信息表
        for (int i = 0; i < docNums.length; i++ )
        {
          CommMethod.addSysDefCol(deviceFitting.getColMap(), modelAction.getUser());
          if (dataAuth != null)
          {
            deviceFitting.getColMap().put("DATA_AUTH", dataAuth);
          }
          deviceFitting.getColMap().put("ID", StringUtils.getUUID());
          deviceFitting.getColMap().put("CDF_ID", mtId);// 保养/维修记录ID
          deviceFitting.getColMap().put("CDF_TYPE", "2");// 操作类型
          deviceFitting.getColMap().put("CDF_ITEM_LIST", docNums[i]);
          deviceFitting.getColMap().put("CDF_ITEM_SN", itemSns[i]);
          deviceFitting.getColMap().put("CDF_ITEM_CODE", itemCodes[i]);
          if (StringUtils.isNotBlank(itemNums[i]))
          {
            deviceFitting.getColMap().put("CDF_ITEM_NUM", Double.valueOf(itemNums[i]));
          }
          
          deviceFitting.getColMap().put("CDF_CHANGE_REASON", changeReasons[i]);
          deviceFitting.getColMap().put("CDF_MEMO", memos[i]);

          modelService.save(deviceFitting);
        }
      }
      
      
		/*	if(Integer.parseInt(selCount)!=0){
				Map map = modelService.getAddComm(request, modelAction.getCurrUser(),modelAction);
				for(Object key : map.keySet()){
					String tempCode = null;
					String tempCode1 = null;
					String itemList = null;
					String itemNum = null;
					String changeReason = null;
					String memo = null;
					TableDataMapExt deviceFitting = new TableDataMapExt(); //设备备件更换信息表
					deviceFitting.setTableName("T_CO_DEVICE_FITTING"); //设备备件更换信息表
					
					if (key.toString().equals("37706529238246b884d06623606e4320")) {
						JSONArray array = JSONArray.fromObject(map.get(key));
						for(int i=0;i<array.size();i++){
							tempCode = array.getJSONObject(i).get("CDF_ITEM_CODE").toString();//配件料号
							for (int j = i + 1; j < array.size(); j++) {
								tempCode1 = array.getJSONObject(j).get("CDF_ITEM_CODE").toString();
								if (tempCode1.equals(tempCode)) {
									return modelAction.alertParentInfo((modelAction.getText("配件料号不能相同")));
								}
							}
							itemList = array.getJSONObject(i).get("CDF_ITEM_LIST").toString();//领料单号
							itemNum = array.getJSONObject(i).get("CDF_ITEM_NUM").toString();//配件数量
							changeReason = array.getJSONObject(i).get("CDF_CHANGE_REASON").toString();//更换原因
							memo = array.getJSONObject(i).get("CDF_MEMO").toString();//备注
							CommMethod.addSysDefCol(deviceFitting.getColMap(), modelAction.getUser());
							deviceFitting.getColMap().put("ID", StringUtils.getUUID());
							deviceFitting.getColMap().put("CDF_ID", mtId);//保养/维修记录ID
							deviceFitting.getColMap().put("CDF_TYPE", "1");//操作类型
							deviceFitting.getColMap().put("CDF_ITEM_LIST", itemList);
							deviceFitting.getColMap().put("CDF_ITEM_CODE", tempCode);
							deviceFitting.getColMap().put("CDF_ITEM_NUM", itemNum);
							deviceFitting.getColMap().put("CDF_CHANGE_REASON", changeReason);
							deviceFitting.getColMap().put("CDF_MEMO", memo);
							if(dataAuth!=null){
      								deviceFitting.getColMap().put("DATA_AUTH", dataAuth);
      					 		}
							
							if(tempCode==""&&itemList==""&&itemNum==""&&changeReason==""&&memo==""){
								
							}else{
								if(itemNum!=""){
									if(tempCode!=""){
										modelService.save(deviceFitting);
									}
								}else{
									modelService.save(deviceFitting);
								}
							}
						}
					}
				}
			}*/
		}catch (NumberFormatException e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("格式转换错误"), e);
		} 
        catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("保养失败"), e);
		}
        //return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_ADD);
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保养成功"), "0");
	}

}
