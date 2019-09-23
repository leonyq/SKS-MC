package com.more.mes.smt.wmsmsdinfo.pg;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description MSD烘烤信息分頁
 * @ClassName DelParameter
 * @author WZY
 */
public class GetBakePage implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "rawtypes", "unchecked", "static-access" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		List<Map> lists = new ArrayList<Map>();
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = request.getParameter("DATA_AUTH");// 组织机构
		String wmiItemSn = request.getParameter("WMI_ITEM_SN").trim();// 物料sn
		String wmiItemCode = request.getParameter("WMI_ITEM_CODE").trim();// 物料料号
		String ciItemName = request.getParameter("CI_ITEM_NAME").trim();// 物料名称
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		String userId = modelAction.getUser().getId();
		try {

			String sql = "SELECT distinct  T1.ID,T1.DATA_AUTH,T1.WMI_ITEM_SN,T1.WMI_ITEM_CODE,T1.WMI_WORK_AREA,T1.WMI_BAKE_TIME,T1.WMI_BAKE_TOTAL,"
					+ " T1.WMI_BAKE_TIMES,T1.WMI_BAKE_LENGTH,T2.WSR_RULE_NAME,T1.WMI_BAKE_LIMIT,T2.WSR_BAKE_TIMES,T1.WMI_BAKE_TEMP,T1.WMI_BAKE_MAX as TIME_MAX,"
					+ " T2.WSR_BAKE_LIMIT,T4.CI_ITEM_NAME,T4.CI_ITEM_SPEC,T5.NAME,T6.WA_AREA_NAME"
					+ " FROM T_WMS_MSD_INFO T1";
			Map<String, String> sqlParaMap = new HashMap<String, String>();
			if (StringUtils.isNotBlank(dataAuth)) {
				sql += " LEFT JOIN T_WMS_MSD_RULE T2 ON T1.WMI_RULE_SN=T2.WSR_RULE_SN "
						+ "  and T2.DATA_AUTH =t1.DATA_AUTH  "
						+ " LEFT JOIN T_CO_ITEM T4 ON T1.WMI_ITEM_CODE=T4.CI_ITEM_CODE "
						+ "  and T4.DATA_AUTH =t1.DATA_AUTH " + " LEFT JOIN SY_DEPT T5 ON T5.ID=T1.DATA_AUTH"
						+ " LEFT JOIN T_WMS_AREA T6 ON T6.WA_AREA_SN = T1.WMI_WORK_AREA "
						+ "  and T6.DATA_AUTH =t1.DATA_AUTH "
						+ " where T1.WMI_STATUS='3'  and T1.DATA_AUTH =:dataAuth ";
				sqlParaMap.put("dataAuth", dataAuth);
				// sqlParaMap.put("dataAuth1", dataAuth);
				// sqlParaMap.put("dataAuth2", dataAuth);
				// sqlParaMap.put("dataAuth3", dataAuth);
			} else {

				sql += " LEFT JOIN T_WMS_MSD_RULE T2 ON T1.WMI_RULE_SN=T2.WSR_RULE_SN "
						+ " and t2.DATA_AUTH =t1.DATA_AUTH "
						+ " LEFT JOIN T_CO_ITEM T4 ON T1.WMI_ITEM_CODE=T4.CI_ITEM_CODE "
						+ "  and  t4.DATA_AUTH =t1.DATA_AUTH " + " LEFT JOIN SY_DEPT T5 ON T5.ID=T1.DATA_AUTH "
						+ " LEFT JOIN T_WMS_AREA T6 ON T6.WA_AREA_SN = T1.WMI_WORK_AREA "
						+ " AND T6.DATA_AUTH =t1.DATA_AUTH " + " where T1.WMI_STATUS='3'"
						+ "  and t1.DATA_AUTH in( select DEPT_ID from sy_data_auth where USER_ID=:userId1 ) ";

				sqlParaMap.put("userId1", userId);
				// sqlParaMap.put("userId2", userId);
				// sqlParaMap.put("userId3", userId);
				// sqlParaMap.put("userId5", userId);
			}
			if (StringUtils.isNotBlank(wmiItemSn)) {
				sql += " and T1.WMI_ITEM_SN LIKE '%' || :wmiItemSn || '%' ";
				sqlParaMap.put("wmiItemSn", wmiItemSn);
			}
			if (StringUtils.isNotBlank(wmiItemCode)) {
				sql += " and T1.WMI_ITEM_CODE =:wmiItemCode ";
				sqlParaMap.put("wmiItemCode", wmiItemCode);
			}
			if (StringUtils.isNotBlank(ciItemName)) {
				sql += " and T4.CI_ITEM_NAME LIKE '%' || :ciItemName || '%' ";
				sqlParaMap.put("ciItemName", ciItemName);
			}
			if (StringUtils.isNotBlank(begin)) {
				sql += " and T1.WMI_BAKE_TIME >=to_timestamp(:begin,'yyyy-mm-dd HH24:MI:ss')";
				sqlParaMap.put("begin", begin);

			}
			if (StringUtils.isNotBlank(end)) {
				sql += " and T1.WMI_BAKE_TIME <=to_timestamp(:end,'yyyy-mm-dd HH24:MI:ss')";
				sqlParaMap.put("end", end);
			}

			List<Map> list = modelService.listSql(sql, modelAction.getPage(), sqlParaMap, null, null);
			if (null != list && list.size() > 0) {
				int num = list.size();
				for (int i = 0; i < num; i++) {
					Map dataMap = list.get(i);
					SimpleDateFormat endData = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					if (null != dataMap.get("WMI_BAKE_TIME")) {

						if (null == dataMap.get("WMI_BAKE_LENGTH")) {
							dataMap.put("WMI_BAKE_LENGTH", 0);
						}

						Date timeDate = (Date) dataMap.get("WMI_BAKE_TIME");
						long TIME = timeDate.getTime();// 开始时间

						Double timeMax = Double.parseDouble(String.valueOf(dataMap.get("TIME_MAX")));// 标准烘烤上限

						long timeMaxS = (long) (timeMax * 3600 * 1000); // 标准烘烤上限

						long wmiBakeMax = timeMaxS + TIME;// 最大烘烤时间

						String dss = endData.format(wmiBakeMax);// 最大烘烤时间
						dataMap.put("WMI_BAKE_MAX", dss);

						Double date = Double.parseDouble(dataMap.get("WMI_BAKE_LENGTH").toString());
						long date2 = (long) (date * 3600 * 1000); // 标准时间

						long expectEndData = TIME + date2;

						String d = endData.format(expectEndData);// 预计结束时间

						dataMap.put("WMI_BAKE_EXPECTENDDATA", d);

						sql = "SELECT now() SYSDATE  FROM DUAL";
						Map map1 = modelService.queryForMap(sql);
						Date nowDate = (Date) map1.get("SYSDATE");
						long t = nowDate.getTime(); // DateUtil.getCurDate().getTime();// 当前时间

						Double bakeBaketimes = (double) t - TIME;

						Double bakeBaketime = bakeBaketimes / (1000 * 60 * 60);// 已烘烤市长

						BigDecimal bs = new BigDecimal(bakeBaketime);
						double f1 = bs.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

						dataMap.put("WMI_BAKE_BAKETIMES", f1);

						// Double ds = (double)(f1 - date);// 判断状态
						// 预计结束时间-系统时间>0
						String state;
						/*
						 * Double ds = (double)(f1 - date);// 判断状态 if (ds < 0) { state = "烘烤中"; } else
						 * if (0 <= ds && ds <= 5 / 60) { state = "烘烤完成"; } else { state = "烘烤超时"; }
						 */
						if (expectEndData - t > 0) {
							state = "烘烤中";
						} else if (expectEndData < t && t < wmiBakeMax) {
							// 预计结束时间<系统时间<最大烘烤时间
							state = "烘烤完成";
						} else {
							state = "烘烤超时";
						}
						dataMap.put("WMI_BAKE_STATE", state);
						if (null != dataMap.get("WMI_BAKE_TOTAL")) {
							Double dateq = Double.parseDouble(dataMap.get("WMI_BAKE_TOTAL").toString());

							// double TOTAL =f1+dateq.intValue();
							double TOTAL = f1 + dateq;// 累积烘烤时间
							BigDecimal bsS = new BigDecimal(TOTAL);
							double TOTALS = bsS.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							dataMap.put("WMI_BAKE_TOTAL", TOTALS);

						} else {

							Double TOTAL = f1; // 累积烘烤时间

							dataMap.put("WMI_BAKE_TOTAL", TOTAL);
						}
						String s = endData.format(TIME);
						dataMap.put("WMI_BAKE_TIME", s);

						lists.add(dataMap);
					} else {
						if (null == dataMap.get("WMI_BAKE_TIME")) {

							if (null == dataMap.get("WMI_BAKE_LENGTH")) {
								dataMap.put("WMI_BAKE_LENGTH", 0);
							}
							dataMap.put("WMI_BAKE_TIME", "");

							long TIME = 0;

							Double timeMax = Double.parseDouble(dataMap.get("TIME_MAX").toString());// 标准烘烤上限

							long timeMaxS = (long) (timeMax * 3600 * 1000); // 标准烘烤上限

							long wmiBakeMax = timeMaxS + TIME;// 最大烘烤时间

							String dss = endData.format(wmiBakeMax);// 最大烘烤时间
							dataMap.put("WMI_BAKE_MAX", dss);

							Double date = Double.parseDouble(dataMap.get("WMI_BAKE_LENGTH").toString());

							dataMap.put("WMI_BAKE_EXPECTENDDATA", "");

							sql = "SELECT now() SYSDATE  FROM DUAL";
							Map map1 = modelService.queryForMap(sql);
							Date nowDate = (Date) map1.get("SYSDATE");
							long t = nowDate.getTime(); // DateUtil.getCurDate().getTime();// 当前时间

							Double bakeBaketimes = (double) t - TIME;

							double bakeBaketime = bakeBaketimes / (1000 * 60 * 60);// 已烘烤市长

							BigDecimal bs = new BigDecimal(bakeBaketime);
							double f1 = bs.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

							dataMap.put("WMI_BAKE_BAKETIMES", f1);

							Double ds = f1 - date;// 判断状态

							String state = null;
							if (ds < 0) {
								state = "烘烤中";
							} else if (0 <= ds && ds <= 5 / 60) {
								state = "烘烤完成";
							} else if (ds > 5 / 60) {
								state = "烘烤超时";
							}
							dataMap.put("WMI_BAKE_STATE", state);
							if (null != dataMap.get("WMI_BAKE_TOTAL")) {
								Double dateq = Double.parseDouble(dataMap.get("WMI_BAKE_TOTAL").toString());

								// double TOTAL =f1+dateq.intValue();
								double TOTAL = f1 + dateq;// 累积烘烤时间
								BigDecimal bsS = new BigDecimal(TOTAL);
								double TOTALS = bsS.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								dataMap.put("WMI_BAKE_TOTAL", TOTALS);
							} else {

								double TOTAL = f1; // 累积烘烤时间

								dataMap.put("WMI_BAKE_TOTAL", TOTAL);
							}

							lists.add(dataMap);

						}

					}

				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(e);
		}
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listToEscapeJs(lists);
		modelAction.getAjaxPage().setDataList(lists);

		return modelAction.AJAX;
	}

}
