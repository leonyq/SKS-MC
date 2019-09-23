package com.morelean.aisino.services.webservices.erpwss.erpwssimpl;

	import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

	import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

	import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.webservice.service.IWebService;
import com.morelean.aisino.common.Method;

	/**
	 * @ClassName:SyncAccountAliasInfo
	 * @Description: 账户别名信息接口实现类
	 * @author:mmz
	 * @version:1.0
	 * @see 
	 * @since 2018年4月5日下午7:17:06
	 * @Copyright: Copyright (c) 2018
	 * @Company: morelean
	 */
	public class SyncAccountAliasInfo implements IWebService {
		final Log log = LogFactory.getLog(this.getClass());
		private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");

		/*
		 * (non-Javadoc)
		 * 
		 * @see com.more.fw.webservice.service.IWebService#excute(java.lang.Object[]) 
		 * 
		 * @param objs 值对,获取方式objs[n];  参数 objs[0]String类型，xml格式。 例：<?xml version="1.0" encoding="utf-8"?><ACCOUNTS><ACCOUNT><ACCOUNT_ID>mmz_ac001</ACCOUNT_ID><ACCOUNT_ALIAS>账户别名</ACCOUNT_ALIAS><ACCOUNT_VALIDITY>19890101</ACCOUNT_VALIDITY><MEMO>无</MEMO><REMARK1></REMARK1><REMARK2></REMARK2><DATA_STATUS>1</DATA_STATUS></ACCOUNT><ACCOUNT><ACCOUNT_ID>mmz_ac002</ACCOUNT_ID><ACCOUNT_ALIAS>账户别名02</ACCOUNT_ALIAS><ACCOUNT_VALIDITY>19890101</ACCOUNT_VALIDITY><MEMO>无</MEMO><REMARK1></REMARK1><REMARK2></REMARK2><DATA_STATUS>1</DATA_STATUS></ACCOUNT></ACCOUNTS>
		 * 
		 * @return Map 操作成功 或者 失败：失败信息
		 */
		public Map<String, Object> excute(Object... objs) {
			SAXReader saxReader = new SAXReader();// XML解析者
			Map<String, Object> resmap = new HashMap<String, Object>();// 存返回数据
			List<Map<String, Object>> supList = new ArrayList<Map<String, Object>>();// 存储各个用户节点信息
			List<Map<String, Object>> validList = new ArrayList<Map<String, Object>>();// 存储用户节点中有效信息

			// 创建xml解析对象
			SAXReader reader = new SAXReader();
			// 定义一个文档
			Document document = null;
			boolean inx = true;// 操作依据 文档解析时，当false返回失败信息。 开始数据操作时，当 false进行更新操作
			// 将字符串转换为
			try {
				// 获取数据编码方式 encoding="  "?>
				if (null == objs || null == objs[0] || "".equals(objs[0])) {
					resmap.put("MSG", "数据信息为空");
					return resmap;
				}

				// 读取信息内容
				String xmlMsg = objs[0].toString();
				document = reader.read(new ByteArrayInputStream(xmlMsg.getBytes("UTF-8")));

				// 得到xml的根节点(message)
				Element root = document.getRootElement();
				// 定义子循环体的变量
				Element obj = null;
				Iterator elems = null;
				List<Element> WA_AREA_NAMEs = root.elements();
				for (Element WA_AREA_NAME : WA_AREA_NAMEs) {
					Map<String, Object> elemap = new HashMap<String, Object>();
					for (elems = WA_AREA_NAME.elementIterator(); elems.hasNext();) {// 遍历获得xml内容
						obj = (Element) elems.next();
						elemap.put(obj.getName(), obj.getText());// 标签名 和 数据

					}
					supList.add(elemap);
				}

			} catch (UnsupportedEncodingException | DocumentException e) {
				resmap.put("MSG", "FALSE:XML数据解析失败，请核实数据格式__" + e.getMessage());// "FALSE:XML数据解析失败，请核实数据格式"
				return resmap;
			}

			// 获取XML中有效信息并键入数据值图 validList中

		try {

			int i = 0;
			for (Map<String, Object> supmap : supList) {// 存入validList
				int index = 0;
				Map<String, Object> vMap = new HashMap<String, Object>();
				for (Entry<String, Object> m : supList.get(i++).entrySet()) {
					if ("DATA_STATUS".equals(m.getKey())) {
						if(!"".equals(m.getValue())){
							index = 1;
						}
						if ("-1".equals(m.getValue())) {
							index = -1;// 当次循环的数据不插入有效List中
							break;
						}
					}
					if ("ACCOUNT_ID".equals(m.getKey())) {// 账户别名ID
						vMap.put("ACCOUNT_ID", m.getValue());
					} else if ("ACCOUNT_ALIAS".equals(m.getKey())) {// 账户别名
						vMap.put("ACCOUNT_ALIAS", m.getValue());
					} else if ("ACCOUNT_VALIDITY".equals(m.getKey())) {// 有效期
						vMap.put("ACCOUNT_VALIDITY", getTime(m.getValue()));
					} else if ("MEMO".equals(m.getKey())) {// 备注
						vMap.put("REMARK", m.getValue());
					} else if ("DEPART_NO".equals(m.getKey())) {// 库存组织代码
						String auth = Method.getDeptId(m.getValue().toString());
						if (auth == null){
							resmap.put("MSG", "FALSE:组织机构代码【"+m.getValue()+"】错误");
							return resmap;
						}
						vMap.put("DATA_AUTH", auth);
						vMap.put("DEPT_ID", auth);
					}
				}
				
				if(index == 0 ){
					resmap.put("MSG", "FALSE:数据状态为空");
					return resmap;
				}
				
				if (index == 1) {// 信息状态为有效,在有效List中添加 Vmap
					// 非空判断
					if (!vMap.containsKey("ACCOUNT_ID") || "".equals(vMap.get("ACCOUNT_ID"))) {
						resmap.put("MSG", "FALSE:账户别名ID为空");
						return resmap;
					}
					if (!vMap.containsKey("ACCOUNT_ALIAS") || "".equals(vMap.get("ACCOUNT_ALIAS"))) {
						resmap.put("MSG", "FALSE:账户别名为空");
						return resmap;
					}
					if (!vMap.containsKey("ACCOUNT_VALIDITY") || "".equals(vMap.get("ACCOUNT_VALIDITY"))) {
						resmap.put("MSG", "FALSE:有效期为空");
						return resmap;
					}
					if (!vMap.containsKey("DATA_AUTH") || "".equals(vMap.get("DATA_AUTH"))) {
						resmap.put("MSG", "FALSE:库存组织代码为空");
						return resmap;
						
					}

					validList.add(vMap);// 添加信息
				}

			}
			// 开始进行数据更新或保存操作
			TableDataMapExt tdMap = new TableDataMapExt();// 数据操作类
			tdMap.setTableName("T_CO_ACCOUNT_ALIAS");// 设置表名
				int modifyinx = 0;
				int insertinx = 0;
				for (Map<String, Object> vmap : validList) {
					inx = true;
					tdMap.setColMap(vmap);// ***设置数据键值图****
					String sql = "select id from T_CO_ACCOUNT_ALIAS where ACCOUNT_ID =?";// 查询是否已存在
					List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
					list = modelService.listDataSql(sql, new Object[] { vmap.get("ACCOUNT_ID") });
					if (null != list && list.size() > 0 && list.get(0).containsKey("ID")) {// 存在
						inx = false;// 触发更新操作
					}
					if (inx) {// 添加
						vmap.put("id", StringUtils.getUUID());
						tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
						tdMap.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
						modelService.save(tdMap);
						resmap.put("INSERT", ++insertinx);
					} else {// 更新
						tdMap.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
						tdMap.setSqlWhere("  AND ACCOUNT_ID = ?");
						tdMap.getSqlWhereArgs().clear();// 集合插入时候 清除残留参数释放占用资源
						tdMap.getSqlWhereArgs().add(vmap.get("ACCOUNT_ID"));
						modelService.edit(tdMap);
						resmap.put("MODIFY", ++modifyinx);
					}
				}
			} catch (Exception e) {
				log.error(e);
				resmap.put("MSG", "FALSE:" + e.getMessage());// "FALSE:信息解析失败"
				return resmap;
			}

			resmap.put("MSG", "TRUE");// 数据有效且操作顺利完成
			return resmap;

		}

		
		// 转化时间
		private Date getTime(Object str) throws ParseException {
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");// 设置日期格式
			Date d = df.parse(str.toString());
			return d;
		}
	}
