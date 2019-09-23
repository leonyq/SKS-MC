package com.more.mes.parameterconfig;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.FileCopyUtils;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 参数配置-系统功能-修改-保存数据
 * 
 * @author Administrator
 *
 */
public class EditFuncInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		try {

			String cfiFuncModel = request.getParameter("paraMapObj.CFI_FUNC_MODEL").trim();

			String cfiFuncName = request.getParameter("paraMapObj.CFI_FUNC_NAME").trim();

			String cfiFuncMemo = request.getParameter("paraMapObj.CFI_FUNC_MEMO").trim();

			String dataId = request.getParameter("selId");

			if (StringUtils.isBlank(cfiFuncModel)) {
				map.put("returnMsg", "nullModel");
				modelAction.setAjaxMap(map);
				return BaseActionSupport.AJAX;
			}
			if (StringUtils.isBlank(cfiFuncName)) {
				map.put("returnMsg", "nullName");
				modelAction.setAjaxMap(map);
				return BaseActionSupport.AJAX;
			}

			String sql = "select * from T_CO_FUNC_INFO where CFI_FUNC_SN=?";

			String cfiFuncNames = new String(request.getParameter("paraMapObj.CFI_FUNC_NAME").getBytes(), "utf-8");
			int nameLength = cfiFuncNames.getBytes().length;
			if (nameLength > 50) {
				map.put("returnMsg", "nameLength");
				modelAction.setAjaxMap(map);
				return BaseActionSupport.AJAX;
			}
			String cfiFuncMemos = new String(request.getParameter("paraMapObj.CFI_FUNC_MEMO").getBytes(), "utf-8");
			int memoLength = cfiFuncMemos.getBytes().length;
			if (memoLength > 500) {
				map.put("returnMsg", "memoLength");
				modelAction.setAjaxMap(map);
				return BaseActionSupport.AJAX;
			}

			String pictureName = null;
			String picturePath = null;
			String fileName = null;
			long pictureSize = 0;
			FileInputStream fis = null;
			FileOutputStream fos = null;
			// InputStream is = null;
			byte[] b = null;
			// 设备图片
			if (modelAction.getUpFile() != null) {
				pictureName = modelAction.getUpFileFileName(); // 图片名称
				fileName = pictureName.substring(pictureName.lastIndexOf(".") + 1);
				fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
				picturePath = fileName; // 文件存放路径
				String realPath = modelAction.getRequest().getSession().getServletContext()
						.getRealPath("up_load" + Constants.SEPARATOR + "comm" + Constants.SEPARATOR + picturePath);
				fis = new FileInputStream(modelAction.getUpFile());
				// is = new modelAction.getUpFile()
				pictureSize = fis.available(); // 图片大小

				if (pictureSize >= 102400) {
					map.put("returnMsg", "addSize");
					modelAction.setAjaxMap(map);
					return BaseActionSupport.AJAX;
				}

				b = FileCopyUtils.copyToByteArray(fis);

				File file = modelAction.getUpFile();
				fos = new FileOutputStream(realPath);
				BufferedInputStream bf = new BufferedInputStream(new FileInputStream(file));
				byte[] bt = new byte[1024];
				int n = bf.read(bt);
				while (n != -1) {
					fos.write(bt, 0, n);
					fos.flush();
					n = bf.read(bt);
				}

			}
			if (StringUtils.isBlank(pictureName)) {
				pictureName = request.getParameter("serverfileName1");
				if (StringUtils.isNotBlank(pictureName)) {
					fileName = pictureName.substring(pictureName.lastIndexOf(".") + 1);
					fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
					picturePath = fileName; // 文件存放路径
					String realPath = modelAction.getRequest().getSession().getServletContext()
							.getRealPath("up_load" + Constants.SEPARATOR + "comm" + Constants.SEPARATOR + picturePath);
					String path = modelAction.getRequest().getSession().getServletContext()
							.getRealPath("buss" + Constants.SEPARATOR + "images" + Constants.SEPARATOR + "count");
					File file = new File(path + Constants.SEPARATOR + pictureName);
					pictureSize = file.length();
					if (pictureSize >= 102400) {
						map.put("returnMsg", "addSize");
						modelAction.setAjaxMap(map);
						return BaseActionSupport.AJAX;
					}
					File savefile = new File(realPath);
					byte[] bs;
					try {
						if (!savefile.getParentFile().exists())
							savefile.getParentFile().mkdirs();
						FileCopyUtils.copy(file, savefile);
						bs = FileCopyUtils.copyToByteArray(file);
					} catch (IOException e) {
						return modelAction.alertParentInfo(e.getMessage());
					}

				}
			}
			TableDataMapExt device = new TableDataMapExt();
			device.setTableName("T_CO_FUNC_INFO");
			CommMethod.editSysDefCol(device.getColMap(), modelAction.getUser());
			device.setSqlWhere(" and ID='" + dataId + "'");
			device.getColMap().put("CFI_FUNC_MODEL", cfiFuncModel);
			device.getColMap().put("CFI_FUNC_NAME", cfiFuncName);
			device.getColMap().put("CFI_FUNC_MEMO", cfiFuncMemo);

			if (StringUtils.isNotBlank(pictureName)) {
				device.getColMap().put("CFI_PHOTO", fileName);
				device.getColMap().put("CFI_PATH", picturePath);
			}

			// device.getColMap().put("ID", uuid);
			modelService.edit(device);

			String alertMsg1 = modelAction.getText("修改成功");
			map.put("alertMsg", (String) msgPopData(modelAction, alertMsg1).get("alertMsg"));
			map.put("title", (String) msgPopData(modelAction, alertMsg1).get("title"));
			map.put("width", (String) msgPopData(modelAction, alertMsg1).get("width"));
			map.put("height", (String) msgPopData(modelAction, alertMsg1).get("height"));
			map.put("time", (String) msgPopData(modelAction, alertMsg1).get("time"));
			map.put("returnMsg", "addSucc");

		} catch (Exception e) {
			// TODO: handle exception
			log.error("系统功能", e);
			map.put("returnMsg", "addError");
		}
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

	@SuppressWarnings({ "unchecked", "unused" })
	private Map msgPopData(ModelAction modelAction, String alertMsg) {
		Map map = new HashMap<String, Object>();
		String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
		title = modelAction.getText(title);
		String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
		String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
		String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
		map.put("title", title);
		map.put("width", width);
		map.put("height", height);
		map.put("time", time);
		map.put("alertMsg", alertMsg);
		return map;
	}

}
