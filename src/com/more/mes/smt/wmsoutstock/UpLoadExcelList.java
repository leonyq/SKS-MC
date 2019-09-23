
package com.more.mes.smt.wmsoutstock;

import java.io.File;
import java.io.FileInputStream;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.OrFilter;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 数据仓储，销售发货页面，新增的导入功能，模板是航天自己的xml文件
 *
 */
public class UpLoadExcelList implements FuncService {
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
			File file = modelAction.getUpFile(); // 读取上传的文件
			FileInputStream fis = new FileInputStream(file);
			int length;
			String result = "";
			byte[] bytes = new byte[1024];
			while ((length = fis.read(bytes)) != -1) {
				result += new String(bytes, 0, length);// 将数据变为字符串输出
			}

			fis.close();// 关闭流
			Parser myParser;
			NodeList nodeList = null;
			myParser = Parser.createParser(result, "gbk");
			NodeFilter tableFilter = new NodeClassFilter(TableTag.class); // table的标志
			OrFilter lastFilter = new OrFilter();
			lastFilter.setPredicates(new NodeFilter[] { tableFilter });
			// 获取标签为table的节点列表
			nodeList = myParser.parse(lastFilter);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 时间格式转化24小时制
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String curtimeString = format.format(new Date());// 获取当前时间
			TableDataMapExt outStock = new TableDataMapExt();
			outStock.setTableName("T_WMS_OUTSTOCK_DOC");// 数据插入出库单表
			TableDataMapExt outStockItem = new TableDataMapExt();
			outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");// 数据插入出库详情
			String wodDocNum = "";// 出库单号
			String createMan = "";// 制单人
			int tableSize = nodeList.size();// 解析出来table节点的个数
			if (tableSize == 0) {
				return modelAction.alertParentInfo((modelAction.getText("模板格式不正确")));
			}
			for (int i = 0; i < tableSize; i++) {
				String wodDeliveryDate = null;// 出库日期
				String wodMemo = null;// 备注
				String custCode = null;// 客户名称
				String custAddress = null;// 收货地址
				if (i % 3 == 0) {// 对第一张表和第三张表插入出库单表
					if (nodeList.elementAt(i) instanceof TableTag) {
						TableTag tag = (TableTag) nodeList.elementAt(i); // 获取第i+1个table标签
						TableRow[] rows = tag.getRows(); // table中的每一行

						int tableerror = i / 3 + 1;// 判断属于第几张表，给出错误提示

						TableRow tr2 = rows[1]; // 读取第二行

						TableColumn[] td = tr2.getColumns(); // 第二行所有的单元格

						TableRow tr3 = rows[2]; // 读取第三行

						TableColumn[] td3 = tr3.getColumns(); // 第三行所有的单元格

						TableRow tr4 = rows[3]; // 读取第四行

						TableColumn[] td4 = tr4.getColumns(); // 第四行单元格

						TableRow tr5 = rows[4]; // 第五行

						TableColumn[] td5 = tr5.getColumns(); // 第五行单元格

						// 以下是对抓取的内容进行字符串的拼接
						String remark1 = td3[0].getStringText().substring(15, 19);
						String remark2 = td3[0].getStringText().substring(42, 59);

						String remark3 = td4[1].getStringText().substring(3);// 备注信息获取之后，字符串拼接
						wodDocNum = td[0].getStringText().substring(26); // 入库单号
						wodDeliveryDate = td[2].getStringText().substring(12);// 开单日期
						custCode = td4[0].getStringText().substring(42);// 客户名称
						custAddress = td5[1].getStringText();// 收货地址
						wodMemo = remark1 + ":" + remark2 + remark3;// 备注

						TableTag tag3 = (TableTag) nodeList.elementAt(i + 2); // 对第三张表做操作
						TableRow[] rows3 = tag3.getRows();

						TableRow man = rows3[0]; // 读取每行

						TableColumn[] man1 = man.getColumns(); // 获取单元格
						createMan = man1[3].getStringText().substring(11);// 开单人
						if (StringUtils.isBlank(wodDocNum)) {

							return modelAction.alertParentInfo(
									modelAction.getText("第") + tableerror + modelAction.getText("张表出库单号不能为空"));
						}
						if (StringUtils.isBlank(wodDeliveryDate)) {
							return modelAction.alertParentInfo(
									modelAction.getText("第") + tableerror + modelAction.getText("张表出库日期不能为空"));

						}
						if (StringUtils.isBlank(custCode)) {
							return modelAction.alertParentInfo(
									modelAction.getText("第") + tableerror + modelAction.getText("张表客户名称不能为空"));
						}
						if (StringUtils.isBlank(custAddress)) {
							return modelAction.alertParentInfo(
									modelAction.getText("第") + tableerror + modelAction.getText("张表客户地址不能为空"));
						}
						if (StringUtils.isBlank(createMan)) {

							return modelAction.alertParentInfo(
									modelAction.getText("第") + tableerror + modelAction.getText("张表开单人不能为空"));
						}

						// 将获取到的员工名和客户名转化为ID，存入数据库
						String sqlId = "select id from sy_user where name='" + createMan + "'";
						List<Map<String, String>> list = modelService.listDataSql(sqlId);
						if (list.isEmpty()) {
							return modelAction.alertParentInfo(
									modelAction.getText("第") + tableerror + modelAction.getText("张表开单人不存在"));
						}
						String id = list.get(0).get("id");// 如果不为空，获取开单人ID方便存到数据库

						// 获取客户的ID，存到数据库
						String sqlCode = "select cust_code from t_co_customer where CUSTOMER= ?";
						List<Map<String, String>> list2 = modelService.listDataSql(sqlCode);
						if (list2.isEmpty()) {
							return modelAction.alertParentInfo(
									modelAction.getText("第") + tableerror + modelAction.getText("个表格的客户名称错误，请修改再上传"));
						}
						String id2 = list2.get(0).get("cust_code");// 如果不为空，转化为ID

						// 获取数据之后，在插入之前，先判断订单是否已经存在，存在的话先删除在插入，相当于修改
						String sqlStatus = "select WOD_STATUS from T_WMS_OUTSTOCK_DOC where WOD_DOC_NUM='" + wodDocNum
								+ "' order by CREATE_TIME desc ";
						List<Map<String, String>> list3 = modelService.listDataSql(sqlStatus);
						if (!list3.isEmpty()) {
							String statusString = list3.get(0).get("WOD_STATUS");
							if (statusString.equals("1")) {
								String sqlDoc = "delete from T_WMS_OUTSTOCK_DOC where WOD_DOC_NUM=? ";
								modelService.execSql(sqlDoc, new Object[] { wodDocNum });
								String sqlItem = "delete from T_WMS_OUTSTOCK_ITEM where WOI_DOC_NUM=? ";
								modelService.execSql(sqlItem, new Object[] { wodDocNum });
							}
						}
						outStock.getColMap().clear();
						CommMethod.addSysDefCol(outStock.getColMap(), modelAction.getUser());
						outStock.getColMap().put("WOD_DOC_NUM", wodDocNum);// 入库单号
						outStock.getColMap().put("WOD_DOC_TYPE", "DJ11");// 单据类型
						outStock.getColMap().put("WOD_STATUS", "1");// 状态
						outStock.getColMap().put("WOD_CUST_CODE", id2);// 客户
						outStock.getColMap().put("CUST_ADDRESS", custAddress);// 收货地址
						outStock.getColMap().put("WOD_MEMO", wodMemo);
						outStock.getColMap().put("WOD_CREATE_MAN", id);// 开单人
						outStock.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(wodDeliveryDate));// 出库时间
						outStock.getColMap().put("WOD_CREATE_TIME", sdf1.parse(curtimeString));// 开单时间
						outStock.getColMap().put("CREATE_TIME", sdf1.parse(curtimeString));
						if (dataAuth != null) {
							outStock.getColMap().put("DATA_AUTH", dataAuth);
						}
						modelService.save(outStock);

					}
				}

				if (i % 3 == 1) {// 对第二个table做操作，每三个中的第二个
					if (nodeList.elementAt(i) instanceof TableTag) {
						TableTag tag = (TableTag) nodeList.elementAt(i);
						TableRow[] rows = tag.getRows();
						String WOI_ITEM_SEQ;// 获取项次
						String WOI_ITEM_CODE;// 物料料号
						String WOI_PLAN_NUM;// 计划数量
						String WOI_DELIVERY_DATE;// 出库日期
						String WOI_WH_CODE;// 仓库号
						String WOI_MEMO;// 备注
						for (int j = 1; j < rows.length; j++) {
							// 读取第每行
							TableRow tr = rows[j];
							// 第二行所有的单元格
							TableColumn[] td = tr.getColumns();
							// 获取单元格数据
							WOI_ITEM_SEQ = td[0].getStringText();
							WOI_ITEM_CODE = td[1].getStringText();
							WOI_PLAN_NUM = td[3].getStringText();
							WOI_DELIVERY_DATE = td[5].getStringText();
							WOI_WH_CODE = td[6].getStringText();
							WOI_MEMO = td[9].getStringText();
							if (!WOI_ITEM_CODE.equals("&nbsp")) {
								String sqlItemCode = "SELECT ID FROM T_CO_ITEM WHERE CI_ITEM_CODE= ?";
								List<Map<String, String>> list5 = modelService.listDataSql(sqlItemCode);
								if (list5.isEmpty()) {
									int taberros = (i + 2) / 3;
									return modelAction.alertParentInfo(
											modelAction.getText("第") + taberros + modelAction.getText("张表的第") + j
													+ modelAction.getText("行物料编码错误，请核实后重新上传"));
								}
								CommMethod.addSysDefCol(outStockItem.getColMap(), modelAction.getUser());
								outStockItem.getColMap().put("ID", StringUtils.getUUID());
								outStockItem.getColMap().put("WOI_CONNECT_DOC", wodDocNum);
								outStockItem.getColMap().put("WOI_DOC_NUM", wodDocNum);
								outStockItem.getColMap().put("WOI_STATUS", "1");
								outStockItem.getColMap().put("WOI_ITEM_SEQ", WOI_ITEM_SEQ);
								outStockItem.getColMap().put("WOI_ITEM_CODE", WOI_ITEM_CODE);
								outStockItem.getColMap().put("WOI_PLAN_NUM", WOI_PLAN_NUM);
								outStockItem.getColMap().put("WOI_DELIVERY_DATE", sdf2.parse(WOI_DELIVERY_DATE));
								outStockItem.getColMap().put("CREATE_TIME", sdf1.parse(curtimeString));
								outStockItem.getColMap().put("WOI_WH_CODE", WOI_WH_CODE);
								outStockItem.getColMap().put("WOI_MEMO", WOI_MEMO);
								if (dataAuth != null) {
									outStockItem.getColMap().put("DATA_AUTH", dataAuth);
								}
								modelService.save(outStockItem);
							}
						}
					}
				}
			}
		} catch (ParserException e) {
			throw new BussException(modelAction.getText("导入失败"), e);
		} catch (Exception e) {

			throw new BussException(modelAction.getText("导入失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("导入成功"), isCloseWin);
	}

	/*
	 * public static List<String> getSubUtil(String soap,String rgex){ List<String>
	 * list = new ArrayList<String>(); Pattern pattern = Pattern.compile(rgex);//
	 * 匹配的模式 Matcher m = pattern.matcher(soap); while (m.find()) { int i = 1;
	 * list.add(m.group(i)); i++; } return list; }
	 * 
	 * public static String getSubone (String soap,String rgex){
	 * 
	 * Pattern pattern = Pattern.compile(rgex);// 匹配的模式 Matcher m =
	 * pattern.matcher(soap); while (m.find()) { return m.group(1); } return null; }
	 */

}
