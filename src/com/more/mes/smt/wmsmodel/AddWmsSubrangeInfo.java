package com.more.mes.smt.wmsmodel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 新增子区域保存
 * 
 * @author development
 */
public class AddWmsSubrangeInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			String wmsAreaSn = null;// 编码
			String wmsAreaName = request.getParameter("paraMap1@0#WA_AREA_NAME");// 名称
			String wmsAreaType = request.getParameter("WA_AREA_TYPE");// 类别
			String wmsSuperiorSn = request.getParameter("WA_SUPERIOR_SN");// 上级编码
			String wmsSotrageCapacity = request.getParameter("paraMap1@0#WA_STORAGE_CAPACITY");// 容量
			String wmsRelateOrderSet = request.getParameter("paraMap1@0#WA_RELATE_ORDERSET");// 关联指令集
			String wmsShelfSn = null;// 货架硬体编码
			String wmsShelfIp = request.getParameter("paraMap1@0#WA_SHELF_IP");// 货架服务IP
			String wmsStorageFlag = request.getParameter("paraMap1@0#WA_STORAGE_FLAG");// 仓库标识
			String wmsStorageType = request.getParameter("paraMap1@0#WA_STAROGE_TYPE");// 货架类别
			String wmsVolume = request.getParameter("paraMap1@0#WA_VOLUME");// 容积
			String wmsFace = request.getParameter("paraMap1@0#WA_FACE");// 面别
			String wmsMemo = request.getParameter("paraMap1@0#WA_MEMO");// 备注
			String storeyNo = request.getParameter("paraMap1@0#WA_STOREY_NO");// 流水层数
			String flowNum = request.getParameter("paraMap1@0#WA_FLOW_NUM");// 流水位数
			String str = null;
			int flowNums = 0;
			if (StringUtils.isNotBlank(flowNum)) {
				flowNums = Integer.parseInt(flowNum);
			}

			String tempSql = "select t.WA_BAD_FLAG from T_WMS_AREA t where t.WA_AREA_SN=? and t.DATA_AUTH=? ";
			List<Map<String, Object>> tempList = modelService.listDataSql(tempSql,
					new Object[] { wmsSuperiorSn, dataAuth });
			String wmsBadFlag = StringUtils.toString(tempList.get(0).get("WA_BAD_FLAG"));

			String addType = request.getParameter("paraMap1@0#WA_ADD_TYPE");// 新增方式
			if (addType.equals("1")) { // 个体
				wmsAreaSn = request.getParameter("paraMap1@0#WA_AREA_SN");// 编码
				wmsShelfSn = request.getParameter("paraMap1@0#WA_SHELF_SN");// 货架硬体编码
				String sql = "select t.WA_AREA_SN from T_WMS_AREA t where t.WA_AREA_SN=? and t.DATA_AUTH=? ";
				int count = modelService.countSql(sql, new Object[] { wmsAreaSn, dataAuth });
				if (count != 0) {
					return modelAction.alertParentInfo(modelAction.getText("编码已存在"));
				}
				if (wmsAreaType.equals("3")) { // 库位
					if (wmsStorageType.equals("1")) { // 如果为电子货架则校验货架硬体编码
						String querySql = "select t.WA_SHELF_SN from T_WMS_AREA t where t.WA_SHELF_SN=? and t.WA_SUPERIOR_SN=? and t.DATA_AUTH=? ";
						int count1 = modelService.countSql(querySql,
								new Object[] { wmsShelfSn, wmsSuperiorSn, dataAuth });
						if (count1 != 0) {
							return modelAction.alertParentInfo(modelAction.getText("货架硬体编码已存在"));
						}
					}
				}
				if (wmsAreaType.equals("3")) {
					String min = null;
					if (wmsAreaSn.length() > flowNums) {
						// 获取流水号
						str = wmsAreaSn.substring(wmsAreaSn.length() - flowNums, wmsAreaSn.length());
					} else {
						str = wmsAreaSn;
					}
				}
				// 插入仓库建模信息
				TableDataMapExt wms = new TableDataMapExt();
				wms.setTableName("T_WMS_AREA");
				CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
				wms.getColMap().put("WA_AREA_SN", wmsAreaSn);
				wms.getColMap().put("WA_AREA_NAME", wmsAreaName);
				wms.getColMap().put("WA_AREA_TYPE", wmsAreaType);
				wms.getColMap().put("WA_SUPERIOR_SN", wmsSuperiorSn);

				if (StringUtils.isNotBlank(wmsSotrageCapacity)) {
					wms.getColMap().put("WA_STORAGE_CAPACITY", Double.valueOf(wmsSotrageCapacity));
				}

				wms.getColMap().put("WA_RELATE_ORDERSET", wmsRelateOrderSet);
				wms.getColMap().put("WA_SHELF_SN", wmsShelfSn);
				wms.getColMap().put("WA_SHELF_IP", wmsShelfIp);
				wms.getColMap().put("WA_STORAGE_FLAG", wmsStorageFlag);
				wms.getColMap().put("WA_STAROGE_TYPE", wmsStorageType);
				if (StringUtils.isNotBlank(wmsVolume)) {
					wms.getColMap().put("WA_VOLUME", Double.valueOf(wmsVolume));
				}
				// wms.getColMap().put("WA_VOLUME", WA_VOLUME);
				wms.getColMap().put("WA_FACE", wmsFace);
				wms.getColMap().put("WA_MEMO", wmsMemo);
				wms.getColMap().put("WA_BAD_FLAG", wmsBadFlag);
				if (wmsAreaType.equals("3")) {

					wms.getColMap().put("WA_FLOW_NO", str);
					if (StringUtils.isNotBlank(flowNum)) {
						wms.getColMap().put("WA_FLOW_NUM", Double.valueOf(flowNum));
					}
					// wms.getColMap().put("WA_FLOW_NUM", flowNum);
					if (StringUtils.isNotBlank(storeyNo)) {
						wms.getColMap().put("WA_STOREY_NO", Double.valueOf(storeyNo));
					}
					// wms.getColMap().put("WA_STOREY_NO", storeyNo);
				}
				modelService.save(wms);
			} else if (addType.equals("2")) { // 批量
				String snPrefix = request.getParameter("paraMap1@0#WA_SN_PREFIX");// 编码前缀
				String startSn = request.getParameter("paraMap1@0#WA_START_SN");// 起始编码
				String shelfPrefix = request.getParameter("paraMap1@0#WA_SHELF_PREFIX");// 硬体编码前缀
				String startShelf = request.getParameter("paraMap1@0#WA_START_SHELF");// 硬体起始编码
				String snNum = request.getParameter("paraMap1@0#WA_SN_NUM");// 数量

				int startNum = Integer.parseInt(startSn);
				int sns = Integer.parseInt(snNum);
				int shelfNum = 0;

				if (startShelf != null && !startShelf.equals("")) {
					shelfNum = Integer.parseInt(startShelf);
				}
				String areaSn = null;
				String shelfSn = null;
				String zero = null;
				String iLen = null;
				int sNum = startNum + sns;
				for (int i = startNum; i < sNum; i++) {
					if (wmsAreaType.equals("3"))// && !startShelf.equals("")
					{// 库位情况下

						iLen = String.valueOf(i);
						if (iLen.length() <= flowNums) {
							zero = "";
							int min = flowNums - iLen.length();

							for (int j = 0; j < min; j++) {
								if (j == 0) {
									zero = "0";
								} else {
									zero = zero + "0";
								}

							}
							areaSn = snPrefix + zero + i;
						} else {
							areaSn = snPrefix + i;
						}
					} else {// 库区
						if (i < 10) { // 补0
							areaSn = snPrefix + "00" + i;

						} else if (i < 100) {
							areaSn = snPrefix + "0" + i;
						} else {
							areaSn = snPrefix + i;
						}
					}
					/*
					
					*/
					String sql = "select t.WA_AREA_SN from T_WMS_AREA t where t.WA_AREA_SN=? and t.DATA_AUTH=? ";
					int count = modelService.countSql(sql, new Object[] { areaSn, dataAuth });
					if (count != 0) {
						return modelAction.alertParentInfo(modelAction.getText("编码已存在"));
					}
				}
				if (wmsAreaType.equals("3"))// && !startShelf.equals("")
				{
					int shNum = shelfNum + sns;
					for (int i = shelfNum; i < shNum; i++) {

						iLen = String.valueOf(i);
						if (iLen.length() < flowNums) {
							zero = "";
							int min = flowNums - iLen.length();
							for (int j = 0; j < min; j++) {
								if (j == 0) {
									zero = "0";
								} else {
									zero = zero + "0";
								}
							}
							shelfSn = shelfPrefix + zero + i;
						} else {
							shelfSn = shelfPrefix + i;
						}
						/*
						 * if (i < 10) { // 补0 shelfSn = shelfPrefix + "00" + i; } else if (i < 100) {
						 * shelfSn = shelfPrefix + "0" + i; } else { shelfSn = shelfPrefix + i; }
						 */
						if (wmsAreaType.equals("3")) { // 库位
							if (wmsStorageType.equals("1")) { // 如果为电子货架则校验货架硬体编码
								String querySql = "select t.WA_SHELF_SN from T_WMS_AREA t where t.WA_SHELF_SN=? and t.WA_SUPERIOR_SN=? and t.DATA_AUTH=? ";
								int count1 = modelService.countSql(querySql,
										new Object[] { shelfSn, wmsSuperiorSn, dataAuth });
								if (count1 != 0) {
									return modelAction.alertParentInfo(modelAction.getText("货架硬体编码已存在"));
								}
							}
						}
					}
				}
				// 插入仓库建模信息
				TableDataMapExt wms = new TableDataMapExt();
				wms.setTableName("T_WMS_AREA");
				String areaName = null;
				List<String> list1 = new ArrayList<String>();
				List<String> list2 = new ArrayList<String>();
				List<String> list3 = new ArrayList<String>();
				List<String> list4 = new ArrayList<String>();
				int stNum = startNum + sns;
				for (int i = startNum; i < stNum; i++) {
					if (wmsAreaType.equals("3"))// && !startShelf.equals("")
					{
						// 补0
						iLen = String.valueOf(i);
						if (iLen.length() < flowNums) {
							zero = "";
							int min = flowNums - iLen.length();
							for (int j = 0; j < min; j++) {
								if (j == 0) {
									zero = "0";
								} else {
									zero = zero + "0";
								}
							}
							areaSn = snPrefix + zero + i;
							areaName = wmsAreaName + zero + i;
							shelfSn = shelfPrefix + zero + i;
							list4.add(zero + i);
						} else {
							areaSn = snPrefix + i;
							areaName = wmsAreaName + i;
							shelfSn = shelfPrefix + i;
							list4.add(String.valueOf(i));
						}
					} else {
						if (i < 10) { // 补0
							areaSn = snPrefix + "00" + i;
							areaName = wmsAreaName + "00" + i;
							shelfSn = shelfPrefix + "00" + i;
						} else if (i < 100) {
							areaSn = snPrefix + "0" + i;
							areaName = wmsAreaName + "0" + i;
							shelfSn = shelfPrefix + "0" + i;
						} else {
							areaSn = snPrefix + i;
							areaName = wmsAreaName + i;
							shelfSn = shelfPrefix + i;
						}
					}
					/*
					
					*/
					list1.add(areaSn);
					list2.add(areaName);

				}
				if (wmsAreaType.equals("3"))// && !startShelf.equals("")
				{
					int shNum = shelfNum + sns;
					for (int i = shelfNum; i < shNum; i++) {
						iLen = String.valueOf(i);
						if (iLen.length() < flowNums) {
							zero = "";
							int min = flowNums - iLen.length();
							for (int j = 0; j < min; j++) {
								if (j == 0) {
									zero = "0";
								} else {
									zero = zero + "0";
								}
							}
							shelfSn = shelfPrefix + zero + i;
						} else {
							shelfSn = shelfPrefix + i;
						}
						/*
						 * if (i < 10) { // 补0 shelfSn = shelfPrefix + "00" + i; } else if (i < 100) {
						 * shelfSn = shelfPrefix + "0" + i; } else { shelfSn = shelfPrefix + i; }
						 */
						list3.add(shelfSn);
					}
				}
				int num = list1.size();
				for (int i = 0; i < num; i++) {
					wms.getColMap().clear();
					CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
					wms.getColMap().put("WA_AREA_SN", list1.get(i));
					wms.getColMap().put("WA_AREA_NAME", list2.get(i));
					wms.getColMap().put("WA_AREA_TYPE", wmsAreaType);
					wms.getColMap().put("WA_SUPERIOR_SN", wmsSuperiorSn);
					if (StringUtils.isNotBlank(wmsSotrageCapacity)) {
						wms.getColMap().put("WA_STORAGE_CAPACITY", Double.valueOf(wmsSotrageCapacity));
					}

					wms.getColMap().put("WA_RELATE_ORDERSET", wmsRelateOrderSet);
					if (wmsAreaType.equals("3") && !startShelf.equals("")) {
						wms.getColMap().put("WA_SHELF_SN", list3.get(i));
					}
					if (wmsAreaType.equals("3"))// && !startShelf.equals("")
					{

						wms.getColMap().put("WA_FLOW_NO", list4.get(i));
						if (StringUtils.isNotBlank(flowNum)) {
							wms.getColMap().put("WA_FLOW_NUM", Double.valueOf(flowNum));
						}
						// wms.getColMap().put("WA_FLOW_NUM", flowNum);
						if (StringUtils.isNotBlank(storeyNo)) {
							wms.getColMap().put("WA_STOREY_NO", Double.valueOf(storeyNo));
						}

					}
					wms.getColMap().put("WA_SHELF_IP", wmsShelfIp);
					wms.getColMap().put("WA_STORAGE_FLAG", wmsStorageFlag);
					wms.getColMap().put("WA_STAROGE_TYPE", wmsStorageType);
					if (StringUtils.isNotBlank(wmsVolume)) {
						wms.getColMap().put("WA_VOLUME", Double.valueOf(wmsVolume));
					}

					wms.getColMap().put("WA_FACE", wmsFace);
					wms.getColMap().put("WA_MEMO", wmsMemo);
					wms.getColMap().put("WA_BAD_FLAG", wmsBadFlag);
					modelService.save(wms);
				}
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);

	}

}
