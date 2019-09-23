package com.more.mes.smt.appmanage;

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
 * @Description APP-APP模块---导航配置---新增保存
 * @ClassName AddFuncInfo
 * @author ht
 */
public class AddNavigationInfos implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// TODO Auto-generated method stub
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		try {
			String tamMenuName = request.getParameter("paraMap1@0#TAM_MENU_NAME");

			if (StringUtils.isBlank(tamMenuName)) {
				map.put("returnMsg", "tamMenuName");
				CommMethod.mapToEscapeJs(map);
				modelAction.setAjaxMap(map);
				return BaseActionSupport.AJAX;
			}
			String sql = "SELECT TAM_MENU_NAME FROM T_APP_MENU WHERE TAM_MENU_NAME =?  AND DATA_AUTH=? ";
			int count = modelService.countSql(sql, new Object[] { tamMenuName, dataAuth });
			if (count != 0) {
				map.put("returnMsg", "tamMenuNames");
				CommMethod.mapToEscapeJs(map);
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
			String pictureName2 = null;
			String picturePath2 = null;
			String fileName2 = null;
			long pictureSize2 = 0;
			FileInputStream fis2 = null;
			FileOutputStream fos2 = null;
			// InputStream is = null;
			byte[] b2 = null;

			// 设备图片
			pictureName = request.getParameter("serverfileName1");
			pictureName2 = request.getParameter("serverfileName2");
			if (StringUtils.isNotBlank(pictureName)) {
				fileName = pictureName.substring(pictureName.lastIndexOf(".") + 1);
				fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
				picturePath = fileName; // 文件存放路径
				String realPath = modelAction.getRequest().getSession().getServletContext()
						.getRealPath("up_load" + Constants.SEPARATOR + "comm" + Constants.SEPARATOR + picturePath);
				String path = modelAction.getRequest().getSession().getServletContext()
						.getRealPath("buss" + Constants.SEPARATOR + "images" + Constants.SEPARATOR + "app");
				File file = new File(path + Constants.SEPARATOR + pictureName);
				pictureSize = file.length();
				if (pictureSize >= 102400) {
					map.put("returnMsg", "addSize");
					CommMethod.mapToEscapeJs(map);
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
			if (StringUtils.isNotBlank(pictureName2)) {
				fileName2 = pictureName2.substring(pictureName2.lastIndexOf(".") + 1);
				fileName2 = StringUtils.getUUID() + "." + fileName2; // 文件存放名称
				picturePath2 = fileName2; // 文件存放路径
				String realPath2 = modelAction.getRequest().getSession().getServletContext()
						.getRealPath("up_load" + Constants.SEPARATOR + "comm" + Constants.SEPARATOR + picturePath2);
				String path2 = modelAction.getRequest().getSession().getServletContext()
						.getRealPath("buss" + Constants.SEPARATOR + "images" + Constants.SEPARATOR + "app");
				File file2 = new File(path2 + Constants.SEPARATOR + pictureName2);
				pictureSize2 = file2.length();
				if (pictureSize2 >= 102400) {
					map.put("returnMsg", "addSize");
					CommMethod.mapToEscapeJs(map);
					modelAction.setAjaxMap(map);
					return BaseActionSupport.AJAX;
				}
				File savefile2 = new File(realPath2);
				byte[] bs2;
				try {
					if (!savefile2.getParentFile().exists())
						savefile2.getParentFile().mkdirs();
					FileCopyUtils.copy(file2, savefile2);
					bs2 = FileCopyUtils.copyToByteArray(file2);
				} catch (IOException e) {
					return modelAction.alertParentInfo(e.getMessage());
				}

			}

			TableDataMapExt device = new TableDataMapExt();
			device.setTableName("T_APP_MENU");
			CommMethod.addSysDefCol(device.getColMap(), modelAction.getUser());
			device.getColMap().put("TAM_MENU_NAME", tamMenuName);
			if (tamMenuName != null) {
				device.getColMap().put("TAM_MENU_PHOTO", "/buss/images/app/" + pictureName);
				device.getColMap().put("TAM_PHOTO_PATH", picturePath);
				device.getColMap().put("TAM_MENU_PHOTO2", "/buss/images/app/" + pictureName2);
				device.getColMap().put("TAM_PHOTO_PATH2", picturePath2);
			}
			modelService.save(device);
			String alertMsg1 = modelAction.getText("新增成功");
			map.put("alertMsg", (String) msgPopData(modelAction, alertMsg1).get("alertMsg"));
			map.put("title", (String) msgPopData(modelAction, alertMsg1).get("title"));
			map.put("width", (String) msgPopData(modelAction, alertMsg1).get("width"));
			map.put("height", (String) msgPopData(modelAction, alertMsg1).get("height"));
			map.put("time", (String) msgPopData(modelAction, alertMsg1).get("time"));
			map.put("returnMsg", "addSucc");

		} catch (Exception e) {
			log.error("导航配置", e);
			map.put("returnMsg", "addError");
		}
		CommMethod.mapToEscapeJs(map);
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

	@SuppressWarnings({ "unchecked" })
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
