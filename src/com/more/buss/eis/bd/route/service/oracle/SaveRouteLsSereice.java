package com.more.buss.eis.bd.route.service.oracle;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.buss.eis.bd.route.dto.GroupControl;
import com.more.buss.eis.bd.route.dto.RouteControl;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @Title 保存新增流程信息
 * @Description 〈功能详细描述〉
 * @ClassName SaveRouteLsSereice
 * @author csh
 * @version 1.0 developer 2017-12-4 created
 * @see SaveRouteLsSereice
 * @since 2017-12-4
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class SaveRouteLsSereice implements FuncService {
	/**
	 * @param modelAction  modelAction
	 * @param modelService modelService
	 * @return String
	 * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction,
	 *      com.more.fw.core.dbo.model.service.ModelService)
	 */
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		HttpServletRequest hsr = modelAction.getRequest();
		String flag = hsr.getParameter("flag");
		String dataInfo = hsr.getParameter("DATA_INFO");
		String route_count = hsr.getParameter("ROUTE_COUNT");
		String crRouteStep = hsr.getParameter("CR_ROUTE_STEP");
		String crRouteId = hsr.getParameter("CR_ROUTE_ID"); // 流程编码
		String crRouteName = hsr.getParameter("CR_ROUTE_NAME");
		String crMoOutput = hsr.getParameter("CR_MO_OUTPUT");
		String crMoOutputOrder = hsr.getParameter("CR_MO_OUTPUT_ORDER");
		String crMoInput = hsr.getParameter("CR_MO_INPUT");
		String crMoInputOrder = hsr.getParameter("CR_MO_INPUT_ORDER");
		String crRouteFlag = hsr.getParameter("CR_ROUTE_FLAG");
		String crPoInput = hsr.getParameter("CR_PO_INPUT");
		String crPoInputOrder = hsr.getParameter("CR_PO_INPUT_ORDER");
		String crPoOutput = hsr.getParameter("CR_PO_OUTPUT");
		String crPoOutputOrder = hsr.getParameter("CR_PO_OUTPUT_ORDER");
		String crItemGroup = hsr.getParameter("CR_ITEM_GROUP");
		String crItemGroupOrder = hsr.getParameter("CR_ITEM_GROUP_ORDER");
		String crFqcGroup = hsr.getParameter("CR_FQC_GROUP");
		String crFqcGroupOrder = hsr.getParameter("CR_FQC_GROUP_ORDER");
		String crIpqcGroup = hsr.getParameter("CR_IPQC_GROUP");
		String crIpqcGroupOrder = hsr.getParameter("CR_IPQC_GROUP_ORDER");

		String crAgingBeginGroup = hsr.getParameter("CR_AGING_BEGIN_GROUP");
		String crAgingBeginGroupOrder = hsr.getParameter("CR_AGING_BEGIN_GROUP_ORDER");

		String crAgingEendGroup = hsr.getParameter("CR_AGING_END_GROUP");
		String crAgingEendGroupOrder = hsr.getParameter("CR_AGING_END_GROUP_ORDER");
		String auth = hsr.getSession().getAttribute("mcDataAuth").toString();
		String data_auth = hsr.getParameter("data_auth");
		String userId = CommMethod.getSessionUser().getId();
		List<Object> groupList = null;
		Map ajaxMap = new HashMap<String, Object>();
		String startFalg = null;
		List<RouteControl> rclist = null;
		RouteControl routeControl = null;
		Map<String, GroupControl> gcMap = null;
		GroupControl groupControl = null;
		List<String> nidLs = null;
		List<String> ncodeLs = null;
		List<String> nconLs = null;

		try {
			// 校验流程编码是否已存在
			int count = 0;
			String dataId = null;
			String sql = "SELECT CR_ROUTE_ID AS COUNT FROM T_CO_ROUTE T WHERE T.CR_ROUTE_ID= ? and t.data_auth=? ";
			if (flag.equals("edit")) {
				dataId = hsr.getParameter("dataId");
				crRouteId = hsr.getParameter("routeCode");
				sql = sql + " and t.id != ?";
				count = modelService.countSql(sql, new Object[] { crRouteId, auth, dataId });
			} else {
				count = modelService.countSql(sql, new Object[] { crRouteId, auth });
			}

			if (count > 0) {
				ajaxMap.put("res", "error");
				ajaxMap.put("msg", modelAction.getText("流程编码已存在"));
				return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
			}
			if (StringUtils.isNotBlank(dataInfo)) {
				JSONObject obj = JSONObject.fromObject(dataInfo);
				JSONArray imgArray = obj.getJSONArray("imgNode");
				JSONArray lineArray = obj.getJSONArray("line");
				int imgSize = imgArray.size();
				int lineSize = lineArray.size();
				Map imgMap = null; // 存放工序map
				Map lineMap = null; // 存放连接线map
				String groupUUId = null; // 当前工序的UUID
				String groupType = null; // 当前工序的类型
				String groupStart = null; // 当前工序是否为开始工序
				String groupEnd = null; // 当前工序是否为结束工序
				String groupOrder = null; // 当前工序的顺序
				String lineUUId = null; // （上级）当前工序的UUID
				String upUUId = null; // （上级）当前工序的UUID
				String nextUUId = null; // 下级工序的UUID
				String upGroupCode = null; // 上级工序的ID
				String nextGroupCode = null; // 下级工序的ID
				String connection = null; // 工序间的连接关系
				String upGroupType = null; // 工序类型
				String nextGroupType = null; // (下个)工序类型
				String upOrder = null; // 工序顺序
				String nextOrder = null; // (下个)工序顺序
				String startGroup = null; // 开始工序
				String endGroup = null; // 结束工序
				String startGroupOrder = null; // 开始工序
				String endGroupOrder = null; // 结束工序
				int startProcedure = 0; // 是否开始工序（1是，0是否）以及个数
				int endProcedure = 0; // 是否结束工序（1是0否）以及个数
				int endGroupfalg = 0;
				String routeControlId = null;
				TableDataMapExt routeControlExt = null;
				Map routeMap = null;
				Map<String, String> orderMap = new HashMap<String, String>();

				if (flag.equals("edit")) {
					// 删除流程信息
					TableDataMapExt routeExt = new TableDataMapExt();
					routeExt.setTableName("T_CO_ROUTE");
					routeExt.setSqlWhere(" and ID = ? ");
					routeExt.getSqlWhereArgs().add(dataId);
					modelService.del(routeExt);
					// 删除流程统计设置信息
					TableDataMapExt routeCountExt = new TableDataMapExt();
					routeCountExt.setTableName("T_CO_ROUTE_COUNT");
					routeCountExt.setSqlWhere(" and CR_ROUTE_ID = ? and data_auth=? ");
					routeCountExt.getSqlWhereArgs().add(crRouteId);
					routeCountExt.getSqlWhereArgs().add(auth);
					modelService.del(routeCountExt);
					// 删除流程工序管控
					TableDataMapExt delrouteControlExt = new TableDataMapExt();
					delrouteControlExt.setTableName("T_CO_ROUTE_CONTROL");
					delrouteControlExt.setSqlWhere(" and CR_ROUTE_ID = ? and data_auth=?  ");
					delrouteControlExt.getSqlWhereArgs().add(crRouteId);
					delrouteControlExt.getSqlWhereArgs().add(auth);
					modelService.del(delrouteControlExt);
				}

				// 对线循环
				rclist = new ArrayList<RouteControl>(); // list封装所有连接线信息
				for (int i = 0; i < lineSize; i++) {
					lineMap = (Map) lineArray.get(i);
					lineUUId = StringUtils.toString(lineMap.get("uuid"));
					upUUId = StringUtils.toString(lineMap.get("nodeAUuid"));
					nextUUId = StringUtils.toString(lineMap.get("nodeZUuid"));
					upGroupCode = StringUtils.toString(lineMap.get("nodeAGroupCode"));
					nextGroupCode = StringUtils.toString(lineMap.get("nodeZGroupCode"));
					connection = StringUtils.toString(lineMap.get("text"));
					if (connection.length() > 10) {
						ajaxMap.put("res", "error");
						ajaxMap.put("msg", modelAction.getText("关联关系超出字符长度"));
						return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
					}
					routeControl = new RouteControl();
					routeControl.setId(lineUUId);
					routeControl.setUpid(upUUId);
					routeControl.setNextid(nextUUId);
					routeControl.setUp_group_code(upGroupCode);
					routeControl.setNext_group_code(nextGroupCode);
					routeControl.setGroup_connection(connection);
					for (int j = 0; j < imgSize; j++) {
						imgMap = (Map) imgArray.get(j);
						if (imgMap.get("uuid").equals(upUUId)) {
							// 获取（上个）工序的类型
							upGroupType = StringUtils.toString(imgMap.get("processType"));
							// 获取上个工序的顺序
							upOrder = StringUtils.toString(imgMap.get("sequence"));
						}
						if (imgMap.get("uuid").equals(nextUUId)) {
							// 获取下个工序的顺序
							nextOrder = StringUtils.toString(imgMap.get("sequence"));
							// 获取（下个）工序的类型
							nextGroupType = StringUtils.toString(imgMap.get("processType"));
						}
					}
					routeControl.setUp_group_type(upGroupType);
					routeControl.setNext_group_type(upGroupType);
					routeControl.setUp_group_order(upOrder);
					routeControl.setNext_group_order(nextOrder);
					rclist.add(routeControl);
				}

				gcMap = new HashMap<String, GroupControl>(); // map封装所有工序对象
				for (int i = 0; i < imgSize; i++) {
					imgMap = (Map) imgArray.get(i);
					orderMap.put(StringUtils.toString(imgMap.get("uuid")),
							StringUtils.toString(imgMap.get("sequence")));
					if ("1".equals(StringUtils.toString(imgMap.get("startProcedure")))) // 是否开始工序（1是，0是否）
					{
						startGroup = StringUtils.toString(imgMap.get("groupCode"));
						startGroupOrder = StringUtils.toString(imgMap.get("sequence"));
						startProcedure++;
					}
					if ("1".equals(StringUtils.toString(imgMap.get("endProcedure")))) // 是否结束工序（1是0否）
					{
						endGroup = StringUtils.toString(imgMap.get("groupCode"));
						endGroupOrder = StringUtils.toString(imgMap.get("sequence"));
						endProcedure++;
					}
					groupUUId = StringUtils.toString(imgMap.get("uuid"));
					groupType = StringUtils.toString(imgMap.get("processType"));
					groupStart = StringUtils.toString(imgMap.get("startProcedure"));
					groupEnd = StringUtils.toString(imgMap.get("endProcedure"));
					groupOrder = StringUtils.toString(imgMap.get("sequence"));
					groupControl = new GroupControl();
					groupControl.setId(groupUUId);
					groupControl.setType(groupType);
					groupControl.setStart(groupStart);
					groupControl.setEnd(groupEnd);
					groupControl.setOrder(groupOrder);
					gcMap.put(groupUUId, groupControl);
				}
				int rclistSize = rclist.size();
				for (Object gcKey : gcMap.keySet()) {
					GroupControl control = gcMap.get(gcKey);
					nidLs = new ArrayList<String>(); // 存放工序的下级工序的UUID
					ncodeLs = new ArrayList<String>(); // 存放工序的下级工序的工序编码
					nconLs = new ArrayList<String>(); // 存放工序与下级工序的关联关系
					for (int i = 0; i < rclistSize; i++) {
						if (rclist.get(i).getUpid().equals(control.getId())) // 线的上级UUID与工序的UUID是否相等
						{
							control.setCode(rclist.get(i).getUp_group_code());
							nidLs.add(rclist.get(i).getNextid());
							ncodeLs.add(rclist.get(i).getNext_group_code());
							nconLs.add(rclist.get(i).getGroup_connection());

							control.setNextIdLs(nidLs);
							control.setNextCodeIdLs(nidLs);
							control.setNextCodeLs(ncodeLs);
							control.setConnection(nconLs);
						} else {
							endGroupfalg++;
						}
					}
					if (endGroupfalg == rclistSize) // 当线的上级UUID与工序的UUID全部都不相等时，该工序为结束工序
					{
						for (int i = 0; i < rclistSize; i++) {
							if (rclist.get(i).getNextid().equals(control.getId())) // 工序为结束工序时，工序编码为线的下级工序编码
							{
								control.setCode(rclist.get(i).getNext_group_code());
							}
						}
					}
					endGroupfalg = 0;
				}

				GroupControl upControl = null;
				GroupControl nextControl = null;
				for (RouteControl control : rclist) {
					upControl = gcMap.get(control.getUpid());
					nextControl = gcMap.get(control.getNextid());
					upControl.getNextList().add(nextControl);
				}

				for (GroupControl control : gcMap.values()) {
					if (control.getNextCodeLs() != null) {
						int cNum = control.getNextCodeLs().size();
						for (int i = 0; i < cNum; i++) {
							routeControlId = StringUtils.getUUID();
							routeControlExt = new TableDataMapExt();
							routeMap = routeControlExt.getColMap();
							routeControlExt.setTableName("T_CO_ROUTE_CONTROL");
							CommMethod.addSysDefCol(routeMap, modelAction.getUser());
							routeMap.put("ID", routeControlId);
							routeMap.put("CR_ROUTE_ID", crRouteId);
							routeMap.put("CRC_GROUP_CODE", control.getCode());
							routeMap.put("CRC_NEXT_GROUP", control.getNextCodeLs().get(i));
							routeMap.put("CRC_CONNECTION", control.getConnection().get(i).trim());
							routeMap.put("CRC_GROUP_TYPE", control.getType());

							if (StringUtils.isNotBlank(control.getOrder())) {
								routeMap.put("CRC_STEP_SEQU", Integer.parseInt(control.getOrder()));
							}

							if (StringUtils.isNotBlank(orderMap.get(control.getNextCodeIdLs().get(i)))) {
								routeMap.put("CRC_NEXT_SEQ",
										Integer.parseInt(orderMap.get(control.getNextCodeIdLs().get(i))));
							}

							routeMap.put("DATA_AUTH", auth);

							if (!control.getCode().equals(control.getNextCodeLs().get(i))) {
								modelService.save(routeControlExt);
							}

						}
					} else {
						routeControlId = StringUtils.getUUID();
						routeControlExt = new TableDataMapExt();
						routeMap = routeControlExt.getColMap();
						routeControlExt.setTableName("T_CO_ROUTE_CONTROL");
						CommMethod.addSysDefCol(routeMap, modelAction.getUser());
						routeMap.put("ID", routeControlId);
						routeMap.put("CR_ROUTE_ID", crRouteId);
						routeMap.put("CRC_GROUP_CODE", control.getCode());
						routeMap.put("CRC_NEXT_GROUP", "");
						routeMap.put("CRC_CONNECTION", "");
						routeMap.put("CRC_GROUP_TYPE", control.getType());
						if (StringUtils.isNotBlank(control.getOrder())) {
							routeMap.put("CRC_STEP_SEQU", Integer.parseInt(control.getOrder()));
						}
						// routeMap.put("CRC_NEXT_SEQ", "");
						routeMap.put("DATA_AUTH", auth);
						modelService.save(routeControlExt);
					}

					Set<GroupControl> historyLists = new HashSet<GroupControl>();
					Set<GroupControl> groupControls = control.getNext(historyLists);
					for (GroupControl control_s : groupControls) {
						if (control_s.getNextCodeLs() != null) {
							int cNum = control_s.getNextCodeLs().size();
							for (int i = 0; i < cNum; i++) {
								if (!"1".equals(control_s.getType())) {
									routeControlId = StringUtils.getUUID();
									routeControlExt = new TableDataMapExt();
									routeMap = routeControlExt.getColMap();
									routeControlExt.setTableName("T_CO_ROUTE_CONTROL");
									CommMethod.addSysDefCol(routeMap, modelAction.getUser());
									routeMap.put("ID", routeControlId);
									routeMap.put("CR_ROUTE_ID", crRouteId);
									routeMap.put("CRC_GROUP_CODE", control.getCode());
									routeMap.put("CRC_NEXT_GROUP", control_s.getNextCodeLs().get(i));
									routeMap.put("CRC_CONNECTION", control_s.getConnection().get(i).trim());
									routeMap.put("CRC_GROUP_TYPE", control.getType());
									if (StringUtils.isNotBlank(control.getOrder())) {
										routeMap.put("CRC_STEP_SEQU",
												Integer.parseInt(String.valueOf(control.getOrder())));
									}
									if (StringUtils.isNotBlank(orderMap.get(control_s.getNextCodeIdLs().get(i)))) {
										routeMap.put("CRC_NEXT_SEQ", Integer.parseInt(
												String.valueOf(orderMap.get(control_s.getNextCodeIdLs().get(i)))));
									}

									routeMap.put("DATA_AUTH", auth);
									if (!control.getCode().equals(control_s.getNextCodeLs().get(i))) {
										modelService.save(routeControlExt);
									}
								}
							}

						}
					}
				}

				if (0 == startProcedure) {
					ajaxMap.put("res", "error");
					ajaxMap.put("msg", modelAction.getText("请选择一个工序作为开始工序"));
					return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
				} else if (startProcedure > 1) {
					ajaxMap.put("res", "error");
					ajaxMap.put("msg", modelAction.getText("存在多个开始工序"));
					return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
				}
				if (0 == endProcedure) {
					ajaxMap.put("res", "error");
					ajaxMap.put("msg", modelAction.getText("请选择一个工序作为结束工序"));
					return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
				} else if (endProcedure > 1) {
					ajaxMap.put("res", "error");
					ajaxMap.put("msg", modelAction.getText("存在多个结束工序"));
					return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
				}

				// 流程统计设置表
				String crcoStartSeq = null;
				String crcoEndSeq = null;
				Map routeCountMap = null;
				String routeCountId = null;
				TableDataMapExt routeCountExt = null;
				JSONArray routeCountArray = JSONArray.fromObject(route_count);
				int routeCountSize = routeCountArray.size();
				for (int i = 0; i < routeCountSize; i++) {
					routeCountMap = (Map) routeCountArray.get(i);
					routeCountId = StringUtils.getUUID();
					routeCountExt = new TableDataMapExt();
					routeMap = routeCountExt.getColMap();
					routeCountExt.setTableName("T_CO_ROUTE_COUNT");
					CommMethod.addSysDefCol(routeMap, modelAction.getUser());
					routeMap.put("ID", routeCountId);
					routeMap.put("CR_ROUTE_ID", crRouteId);
					routeMap.put("CRCO_STEP", routeCountMap.get("CrcoStecCount"));
					routeMap.put("CRCO_START_GROUP", routeCountMap.get("CrcoStartGroupCount"));
					if (StringUtils.isNotBlank(routeCountMap.get("CrcoStartGroupOrder"))) {
						routeMap.put("CRCO_START_SEQ",
								Integer.parseInt(String.valueOf(routeCountMap.get("CrcoStartGroupOrder"))));
					}
					if (StringUtils.isNotBlank(routeCountMap.get("CrcoEndGroupOrder"))) {
						routeMap.put("CRCO_END_SEQ",
								Integer.parseInt(String.valueOf(routeCountMap.get("CrcoEndGroupOrder"))));
					}

					routeMap.put("CRCO_END_GROUP", routeCountMap.get("CrcoEndGroupCount"));

					routeMap.put("DATA_AUTH", auth);
					modelService.save(routeCountExt);

				}

				// 流程信息
				TableDataMapExt routetd = new TableDataMapExt();
				routeMap = routetd.getColMap();
				String routeId = StringUtils.getUUID();
				Date date = DateUtil.getCurDate();
				routetd.setTableName("T_CO_ROUTE");
				CommMethod.addSysDefCol(routeMap, modelAction.getUser());
				routeMap.put("ID", routeId);
				routeMap.put("CR_ROUTE_ID", crRouteId);
				routeMap.put("CR_ROUTE_NAME", crRouteName);
				routeMap.put("CR_ROUTE_STEP", crRouteStep);
				routeMap.put("CR_BLOCKS_MSG", dataInfo);
				routeMap.put("DATA_AUTH", data_auth);
				routeMap.put("CREATE_USER", userId);
				routeMap.put("CREATE_TIME", date);
				routeMap.put("CR_MO_OUTPUT", crMoOutput);
				if (StringUtils.isNotBlank(crMoOutputOrder)) {
					routeMap.put("CR_MO_OUTPUT_SEQ", Integer.parseInt(crMoOutputOrder));
				}

				routeMap.put("CR_MO_INPUT", crMoInput);
				if (StringUtils.isNotBlank(crMoInputOrder)) {
					routeMap.put("CR_MO_INPUT_SEQ", Integer.parseInt(crMoInputOrder));
				}

				routeMap.put("CR_PO_OUTPUT", crPoOutput);
				if (StringUtils.isNotBlank(crPoOutputOrder)) {
					routeMap.put("CR_PO_OUTPUT_SEQ", Integer.parseInt(crPoOutputOrder));
				}

				routeMap.put("CR_PO_INPUT", crPoInput);
				if (StringUtils.isNotBlank(crPoInputOrder)) {
					routeMap.put("CR_PO_INPUT_SEQ", Integer.parseInt(crPoInputOrder));
				}

				routeMap.put("CR_ITEM_GROUP", crItemGroup);
				if (StringUtils.isNotBlank(crItemGroupOrder)) {
					routeMap.put("CR_ITEM_SEQ", Integer.parseInt(crItemGroupOrder));
				}

				routeMap.put("CR_FQC_GROUP", crFqcGroup);
				if (StringUtils.isNotBlank(crFqcGroupOrder)) {
					routeMap.put("CR_FQC_SEQ", Integer.parseInt(crFqcGroupOrder));
				}

				routeMap.put("CR_IPQC_GROUP", crIpqcGroup);
				if (StringUtils.isNotBlank(crIpqcGroupOrder)) {
					routeMap.put("CR_IPQC_SEQ", Integer.parseInt(crIpqcGroupOrder));
				}

				routeMap.put("CR_START_GROUP", startGroup);
				if (StringUtils.isNotBlank(startGroupOrder)) {
					routeMap.put("CR_START_SEQ", Integer.parseInt(startGroupOrder));
				}

				routeMap.put("CR_END_GROUP", endGroup);
				if (StringUtils.isNotBlank(endGroupOrder)) {
					routeMap.put("CR_END_SEQ", Integer.parseInt(endGroupOrder));
				}

				routeMap.put("CR_ROUTE_FLAG", crRouteFlag);

				routeMap.put("CR_AGING_BEGIN_GROUP", crAgingBeginGroup);
				if (StringUtils.isNotBlank(crAgingBeginGroupOrder)) {
					routeMap.put("CR_AGING_BEGIN_SEQ", Integer.parseInt(crAgingBeginGroupOrder));
				}

				routeMap.put("CR_AGING_END_GROUP", crAgingEendGroup);
				if (StringUtils.isNotBlank(crAgingEendGroupOrder)) {
					routeMap.put("CR_AGING_END_SEQ", Integer.parseInt(crAgingEendGroupOrder));
				}
				routeMap.put("DATA_AUTH", auth);
				if (flag.equals("edit")) {
					String creatUser = hsr.getParameter("CREATE_USER");
					Long creatTime = StringUtils.toLong(hsr.getParameter("CREATE_TIME"));
					if (StringUtils.isNotBlank(creatUser)) {
						routeMap.put("CREATE_USER", creatUser);
					}
					if (StringUtils.isNotBlank(creatTime)) {
						Date creatDate = new Date(creatTime);
						routeMap.put("CREATE_TIME", creatDate);
					}
					routeMap.put("EDIT_USER", userId);
					routeMap.put("EDIT_TIME", date);
				}
				modelService.save(routetd);

			} else {
				ajaxMap.put("res", "error");
				ajaxMap.put("msg", modelAction.getText("流程工序不能为空"));
				return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("保存流程信息失败"), e);
			/*
			 * ajaxMap.put("res", "error"); ajaxMap.put("msg",
			 * modelAction.getText("保存流程信息失败")); return
			 * modelAction.outJson(CommMethod.bean2Json(ajaxMap),
			 * Constants.CHARACTER_ENCODING_UTF_8);
			 */
		}
		return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
	}

}
