package com.more.mes.smt.performance.xray;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * @ClassName:OverStation
 * @Description: X-Ray 过站
 * @author:mmz
 * @version:1.0
 * @see
 * @since 2018年3月22日下午2:19:27
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class OverStation implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String resMsg;
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = request.getParameter("_DATA_AUTH");
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		 String auth = request.getSession().getAttribute("mcDataAuth").toString();
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			String xrayWokeStation = request.getParameter("paraMap1@0#XRAY_WORK_STATION");// 工作中心
			String xrayProjectId = request.getParameter("XRAY_PROJECT_ID");// 工单
			String xrayMoNumber = request.getParameter("XRAY_MO_NUMBER");// 制令单
			String xrayModelCode = request.getParameter("XRAY_MODEL_CODE");// 机种
			String xraySn = request.getParameter("paraMap1@0#XRAY_SN");// 产品SN
			String xrayFlag = request.getParameter("paraMap1@0#XRAY_FLAG");// 检验结果
			String userId = CommMethod.getSessionUser().getName();// 检验人
			String xrayMemo = request.getParameter("paraMap1@0#XRAY_MEMO");//#mc_ap#mc_b内容#mc_a/p#mc_b
			if(xrayMemo.length()>0&&xrayMemo.contains("#mc_ap#mc_b")){
				xrayMemo = xrayMemo.substring(xrayMemo.indexOf("#mc_ap#mc_b"), xrayMemo.lastIndexOf("#mc_a/p#mc_b")).substring("#mc_ap#mc_b".length());
				if(xrayMemo.contains("#mc_a/p#mc_b")) {
					xrayMemo = xrayMemo.substring(0, xrayMemo.lastIndexOf("#mc_a/p#mc_b"));
				}
			}
			String cecCode = request.getParameter("CEC_CODE");// 
			java.util.Date CHECK_TIME = DateUtil.getCurDate();

			// 获得不良信息
			String sql = "SELECT t.xray_cec_code , t.xray_cec_point FROM T_WIP_XRAY_CEC t  where XRAY_MO_NUMBER = ? " +
					" and DATA_AUTH=? ";
			List<Map<String, Object>> list = new ArrayList();
			list = modelService.listDataSql(sql, new Object[] { xraySn,auth});// 不良信息

			List<Object> bill = new ArrayList();// 输入过站信息

			// 生成输入信息
			String mSn = xraySn;
			String mMoNumber = xrayMoNumber;// 制令单
			String mWorkStationid = xrayWokeStation;// 工作中心
			StringBuffer mEcStr = new StringBuffer();// 不良代码 --为空会怎样？
			StringBuffer mPointStr = new StringBuffer();// 不良点位
			StringBuffer mOuntStr = new StringBuffer();  //不良点数    String.valueOf(list.size());// --不对
			int i = 0;
			for (Map l : list) {
				if (++i != 1) {
					mEcStr.append("|" + l.get("xray_cec_code"));
				//	M_POINT_STR.append("|" + l.get("xray_cec_point"));
				//	M_OUNT_STAR.append("|" + "1" );
				} else {
					mEcStr.append("|" +l.get("xray_cec_code"));
				//	M_POINT_STR.append(l.get("xray_cec_point"));
				//	M_OUNT_STAR.append("1");
				}

			}
			if(cecCode!=null&&cecCode!="") {
				xrayFlag="1";
			}else{
			    xrayFlag="0";
			}
			String mNgNum = xrayFlag;// 不良产品数 --输入0的话标识产品合格？
			String mEmp = CommMethod.getSessionUser().getLoginName();// 员工号
			String mFlag = xrayFlag;// 标志，1表示不良产品数为1 ---0表示？
			String flowcode = "";// 流程码
			String res = "";

			// 生成清单
			bill.add(auth);
			bill.add(mSn);
			bill.add(xrayMoNumber);
			bill.add(mWorkStationid);
/**			bill.add(M_EC_STR.length()>0 ? M_EC_STR.toString():"0");
*			bill.add(M_POINT_STR.length()>0 ? M_POINT_STR.toString():"0");// M_POINT_STR.toString()
*		bill.add(M_OUNT_STAR.length()>0 ? M_OUNT_STAR.toString():"0");
**/	
			bill.add(mEcStr.toString());
			bill.add(mPointStr.toString());// M_POINT_STR.toString()
			bill.add( mOuntStr.toString());
			bill.add(mNgNum);//
			bill.add(mEmp);
			bill.add(mFlag);// M_FLAG
			bill.add(flowcode);
			bill.add(res);

			/*
			 * //文件存储 String fileName = null; String realName = null; //文件原有名称 String
			 * fileAddress = null; float fileSize = 0; FileInputStream fis = null;
			 * FileOutputStream fos = null; if (modelAction.getUpFile() != null){
			 * realName = modelAction.getUpFileFileName(); // 文件名称 fileName =
			 * realName.substring(realName.lastIndexOf(".") + 1); fileName =
			 * StringUtils.getUUID() + "." + fileName; //文件存放名称 fileAddress = "xray";
			 * //文件存放路径 String realPath =
			 * modelAction.getRequest().getSession().getServletContext().getRealPath(
			 * "up_load/comm/xray"); fis = new
			 * FileInputStream(modelAction.getUpFile()); fileSize = fis.available();
			 * // 文件大小 //上传文件到服务器 File file = modelAction.getUpFile();//富文本？ File
			 * file1 = new File(realPath); if(!file1.exists() &&
			 * !file1.isDirectory()){ //判断文件夹是否存在，不存在则创建 file1.mkdir(); } //上传文件
			 * String realPath1 =
			 * modelAction.getRequest().getSession().getServletContext().getRealPath(
			 * "up_load/comm/problemReport/" + fileName); fos = new
			 * FileOutputStream(realPath1); BufferedInputStream bf = new
			 * BufferedInputStream(new FileInputStream(file)); byte[] bt = new
			 * byte[1024]; int n = bf.read(bt); while (n != -1) { fos.write(bt, 0, n);
			 * fos.flush(); n = bf.read(bt); } }
			 */// 过站
			resMsg = saveInfo(bill, modelService);

			/* 生成XRay检验单 */
			TableDataMapExt pro = new TableDataMapExt();
			pro.setTableName("T_WIP_XRAY_INFO");
			// CommMethod.addSysDefCol(pro.getColMap(), modelAction.getUser());
			pro.getColMap().put("ID", StringUtils.getUUID());
			pro.getColMap().put("XRAY_CHECK_TIME", CHECK_TIME);
			pro.getColMap().put("XRAY_EMP", userId);
			pro.getColMap().put("XRAY_FLAG", xrayFlag);
			pro.getColMap().put("XRAY_MODEL_CODE", xrayModelCode);
			pro.getColMap().put("XRAY_MO_NUMBER	", xrayMoNumber);
			pro.getColMap().put("XRAY_PROJECT_ID", xrayProjectId);
			pro.getColMap().put("XRAY_SN", xraySn);
			pro.getColMap().put("XRAY_WORK_STATION", xrayWokeStation);
			pro.getColMap().put("XRAY_MEMO", xrayMemo);
			pro.getColMap().put("DATA_AUTH", auth);
			/*
			 * 这里 存文件名就点击查看时候能看到 富文本信息吗 realName 还是 realPath if(realName != null){
			 * pro.getColMap().put("XRAY_MEMO", realName);
			 * pro.getColMap().put("CPR_HAPPEN_FILESAVENAME", fileName);
			 * pro.getColMap().put("CPR_HAPPEN_FILEPATH", fileAddress);
			 * pro.getColMap().put("CPR_HAPPEN_FILESIZE", fileSize); }
			 */
			modelService.save(pro);
			
			if(xrayFlag.equals("1")) {//NG修改tracking表的状态
				List<Object> sqlList = new ArrayList<Object>();
				TableDataMapExt trackTable = new TableDataMapExt();
				CommMethod.editSysDefCol(trackTable, modelAction.getUser());
				trackTable.setTableName("T_WIP_TRACKING");
				trackTable.setSqlWhere(" and WT_MO_NUMBER =? and WT_SN = ? and DATA_AUTH = ? ");
				sqlList.add(xrayMoNumber);
				sqlList.add(xraySn);
				sqlList.add(auth);
				trackTable.setSqlWhereArgs(sqlList);
				trackTable.getColMap().put("WT_ERROR_FLAG", "1");
				modelService.edit(trackTable);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("过站失败"), e);
		}
		String[] hitMsg= resMsg.split(":");
		
		isCloseWin="1";
		if(hitMsg[0].equals("OK")){
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText(hitMsg[0]), isCloseWin);
		}else{
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText(hitMsg[1].split("##")[0]), isCloseWin);
			
		}
		}

	@SuppressWarnings("unchecked")
	public String saveInfo(List<Object> bill, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3, 4, 5, 6, 7, 8, 9,10 };
		int[] outplace = { 5, 6, 7,8, 11,12 };
		List<Object> outType = new ArrayList<Object>();
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_SAVE_SN_INFO");// 过站
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(bill.subList(0, 10));// 存储过程中输入的参数
		pf.setTotalLen(12);// 总个数
		pf.setOutValType(outType);// 输出的参数
		
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		String res1 = (String) relist.get(5);
		return res1;
	}

}
