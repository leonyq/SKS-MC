package com.more.mes.smt.usermanager.employeetran;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 
 * @Title <修改保存员工列表>
 * @Description <修改保存员工列表> 
 * @ClassName UpdateSaveStranUserList
 * @auther MaoZhongHao
 * @version 1.0 deverloper 2018-03-26 created
 * @see UpdateSaveStranUserList
 * @since 2018-03-26
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class UpdateSaveStranUserList implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	/**
	 * 
	 * @Description: 修改保存员工列表 
	 * @param request
	 * @param modelAction
	 * @param modelService
	 * @return String
	 * @throws
	 */
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String tranCode = request.getParameter("paraMapObj.TRAN_CODE");
		String tranId = request.getParameter("paraMapObj.ID");
		String isCloseWin = request.getParameter("isCloseWin");//是否关闭窗口
		String formId = request.getParameter("formId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		// 判断培训编码是否已经存在
		String sqlString = "select T.TRAN_CODE " + " from T_USER_TRAN T where T.TRAN_CODE=? and T.DATA_AUTH=? and T.ID <>?";
		List list = modelService.listDataSql(sqlString, new Object[] {tranCode,dataAuth,tranId});
		if (list != null && !list.isEmpty()) {
			return modelAction.alertParentInfo((modelAction.getText("培训编号已经存在！")));
		}

		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// String tranDate =
			// request.getParameter("paraMapObj.TRAN_DATE");//培训日期
			//培训日期，培训编号和培训文件
			String tranUserId = request.getParameter("paraMapObj.TRAN_USER_ID");//培训讲师
			String tranName = request.getParameter("paraMapObj.TRAN_NAME");//培训主题
			String tranContent = request.getParameter("paraMapObj.TRAN_CONTENT");//培训内容
			String remark = request.getParameter("paraMapObj.REMARK");//备注

			Date tranDate = DateUtil.parseDate(StringUtils.toString(request.getParameter("paraMapObj.TRAN_DATE")), "yyyy-MM-dd");

			String userIds = request.getParameter("ids");//培训员工ID

			int tranCount = 0;
			if (userIds != null && userIds != "") {
				String[] ids = userIds.split(",");
				tranCount = ids.length;//培训员工数
			}
			
			TableDataMapExt itemMap = new TableDataMapExt();
            List<Object> sqlwList = new ArrayList<>();
			//保存培训信息到T_USER_TRAN表
			itemMap.setTableName("T_USER_TRAN");
			sqlwList.add(tranId);
			CommMethod.editSysDefCol(itemMap.getColMap(), modelAction.getUser());
			itemMap.setSqlWhere(" and ID=? ");
			itemMap.setSqlWhereArgs(sqlwList);
			itemMap.getColMap().put("TRAN_CODE", tranCode);//培训编码
			itemMap.getColMap().put("TRAN_DATE", tranDate);//培训日期
			itemMap.getColMap().put("TRAN_USER_ID", tranUserId);//培训讲师
			itemMap.getColMap().put("TRAN_NAME", tranName);//培训主题
			itemMap.getColMap().put("TRAN_CONTENT", tranContent);//培训内容
			itemMap.getColMap().put("REMARK", remark);//备注
			itemMap.getColMap().put("TRAN_COUNT", tranCount);//培训员工数

			String fileName = null;
			String realName = null;//文件原有名称
			String fileAddress = null;
			float fileSize = 0;
			FileInputStream fis = null;
			FileOutputStream fos = null;
			if (modelAction.getUpFile() != null) {
				realName = modelAction.getUpFileFileName();//文件名称
				fileName = realName.substring(realName.lastIndexOf(".") + 1);
				fileName = StringUtils.getUUID() + "." + fileName;//文件存放名称
				fileAddress = "tranFile";//文件存放路径
				String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"tranFile");
				fis = new FileInputStream(modelAction.getUpFile());
				fileSize = fis.available();//文件大小
				
				//上传文件到服务器
				File file = modelAction.getUpFile();
				File file1 = new File(realPath);
				//判断文件夹是否存在，不存在则创建
				if (!file1.exists() && !file1.isDirectory()) { 
					file1.mkdir();
				}
				//上传文件
				String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"tranFile"+Constants.SEPARATOR + fileName);
				fos = new FileOutputStream(realPath1);
				BufferedInputStream bf = new BufferedInputStream(new FileInputStream(file));
				byte[] bt = new byte[1024];
				int n = bf.read(bt);
				while (n != -1) {
					fos.write(bt, 0, n);
					fos.flush();
					n = bf.read(bt);
				}
			}

			//保存文件信息
			if (realName != null) {
				itemMap.getColMap().put("TRAN_FILE_NAME", realName);
				itemMap.getColMap().put("TRAN_FILE_REAL_NAME", fileName);
				itemMap.getColMap().put("TRAN_FILE_PATH", fileAddress);
				itemMap.getColMap().put("TRAN_FILE_SIZE", fileSize);
			}

			modelService.edit(itemMap);

			if (tranCount > 0) {
				String[] ids = userIds.split(",");
				//重置该培训关联的员工
				String resetSql = "delete " + " from T_USER_TRAN_USER T where T.TRAN_ID=?";
				if (tranId != null && tranId != "") {
					modelService.execSql(resetSql, new Object[] { tranId });
				}
			
				//保存培训员工信息到T_USER_TRAN_USER表
				for (int i = 0; i < ids.length; i++) {
				    	TableDataMapExt itemMap1 = new TableDataMapExt();
					itemMap1.getColMap().clear();
						itemMap1.setTableName("T_USER_TRAN_USER");
					CommMethod.addSysDefCol(itemMap1.getColMap(),modelAction.getUser());
				
				
					itemMap1.getColMap().put("TRAN_ID", tranId);
					itemMap1.getColMap().put("USER_ID",ids[i].substring(ids[i].lastIndexOf("_") + 1));
					modelService.save(itemMap1);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		
		return modelAction.reloadIframeByIds(iframeId,modelAction.getText("修改成功"), "0");
	}
	
}