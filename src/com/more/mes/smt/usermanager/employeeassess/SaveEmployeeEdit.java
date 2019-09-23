package com.more.mes.smt.usermanager.employeeassess;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

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

public class SaveEmployeeEdit implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String assessCode = request.getParameter("paraMapObj.ASSESS_CODE");
		String assessId = request.getParameter("paraMapObj.ID");
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formId = request.getParameter("formId");
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		// 判断考核编码
		String sql = "select T.ASSESS_CODE "
				+ " from T_USER_ASSESS T where T.ASSESS_CODE=? and T.DATA_AUTH=? and T.ID <>? ";
		List list = modelService.listDataSql(sql, new Object[] { assessCode,dataAuth,
				assessId });
		if (list != null && !list.isEmpty()) {
			return modelAction
					.alertParentInfo((modelAction.getText("考核编号已存在！")));
		}

		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			
			String assessDate = request.getParameter("paraMapObj.ASSESS_DATE");// 考核日期
		      String assessUserId = request.getParameter("paraMapObj.ASSESS_USER_ID");// 记录人
		      
		      String assessLevelBefore = request.getParameter("paraMapObj.ASSESS_LEVEL_B");// 考核前等级
		      String assessLevelafter = request.getParameter("paraMapObj.ASSESS_LEVEL_A");// 考核后等级
		      
		      String assessContent = request.getParameter("paraMapObj.ASSESS_CONTENT");//考核意见
		      String remark = request.getParameter("paraMapObj.REMARK");//备注
		      
		      String assessResult=request.getParameter("paraMapObj.ASSESS_RESULT");//考核结果
		    //  String assessFile=request.getParameter("paraMap1@0#ASSESS_FILE");//考核文件
		      
			String userIds = request.getParameter("ids");// 考核员工ID

			int assessCount = 0;
			if (userIds != null && userIds != "") {
				String[] ids = userIds.split(",");

				assessCount = ids.length;// 考核员工数

			}
			TableDataMapExt itemMap = new TableDataMapExt();
            List<Object> sqlwList = new ArrayList<>();
			// 保存考核信息到T_USER_ASSESS表
			itemMap.setTableName("T_USER_ASSESS");
			sqlwList.add(assessId);
			CommMethod
					.editSysDefCol(itemMap.getColMap(), modelAction.getUser());
			itemMap.setSqlWhere(" and ID=? ");
			itemMap.setSqlWhereArgs(sqlwList);
			itemMap.getColMap().put("ASSESS_CODE", assessCode);
		      itemMap.getColMap().put("ASSESS_DATE", sdf.parse(assessDate));
		      itemMap.getColMap().put("ASSESS_USER_ID", assessUserId);
		      itemMap.getColMap().put("ASSESS_LEVEL_B", assessLevelBefore);
		      itemMap.getColMap().put("ASSESS_LEVEL_A", assessLevelafter);
		      itemMap.getColMap().put("ASSESS_CONTENT", assessContent);
		      itemMap.getColMap().put("REMARK", remark);
		      itemMap.getColMap().put("ASSESS_RESULT",assessResult);
		     itemMap.getColMap().put("ASSESS_COUNT", assessCount);
		     itemMap.getColMap().put("DATA_AUTH", dataAuth);
		     
			String fileName = null;
			String realName = null; // 文件原有名称
			String fileAddress = null;
			float fileSize = 0;
			FileInputStream fis = null;
			FileOutputStream fos = null;
			if (modelAction.getUpFile() != null) {
				realName = modelAction.getUpFileFileName(); // 文件名称
				fileName = realName.substring(realName.lastIndexOf(".") + 1);
				fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
				fileAddress = "assessFile"; // 文件存放路径
				String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"assessFile");

				fis = new FileInputStream(modelAction.getUpFile());
				fileSize = fis.available(); // 文件大小
				// 上传文件到服务器
				File file = modelAction.getUpFile();
				File file1 = new File(realPath);
				if (!file1.exists() && !file1.isDirectory()) { // 判断文件夹是否存在，不存在则创建
					file1.mkdir();
				}
				// 上传文件
				String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"assessFile"+Constants.SEPARATOR + fileName);
				fos = new FileOutputStream(realPath1);
				BufferedInputStream bf = new BufferedInputStream(
						new FileInputStream(file));
				byte[] bt = new byte[1024];
				int n = bf.read(bt);
				while (n != -1) {
					fos.write(bt, 0, n);
					fos.flush();
					n = bf.read(bt);
				}
				fos.close();//关闭流
				fis.close();
			}

			// 保存文件信息
			if (realName != null) {
				itemMap.getColMap().put("ASSESS_FILE", realName);
				itemMap.getColMap().put("ASSESS_FILE_REAL_NAME", fileName);
				itemMap.getColMap().put("ASSESS_FILE_PATH", fileAddress);
				itemMap.getColMap().put("ASSESS_FILE_SIZE", fileSize);
			}

			modelService.edit(itemMap);

			if (assessCount > 0) {
				String[] ids = userIds.split(",");
				// 重置该考核关联的员工
				String resetSql = "delete "
						+ " from T_USER_ASSESS_USER T where T.ASSESS_ID=? and T.DATA_AUTH=? ";
				if (assessId != null && assessId != "") {
					modelService.execSql(resetSql, new Object[] { assessId ,dataAuth});
				}
				TableDataMapExt itemMap1 = new TableDataMapExt();
				// 保存考核员工信息到T_USER_ASSESS_USER表
				for (int i = 0; i < ids.length; i++) {

					itemMap.getColMap().clear();
					CommMethod.addSysDefCol(itemMap1.getColMap(),
							modelAction.getUser());
					itemMap.setTableName("T_USER_ASSESS_USER");
					CommMethod.addSysDefCol(itemMap.getColMap(),
							modelAction.getUser());
					itemMap.getColMap().put("ASSESS_ID", assessId);
					itemMap.getColMap().put("USER_ID",
							ids[i].substring(ids[i].lastIndexOf("_") + 1));
					modelService.save(itemMap);
				}
			}

		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("修改失败"), e);
		}
		return modelAction.reloadIframeByIds(iframeId,
				modelAction.getText("修改成功"), "0");
	}

}
