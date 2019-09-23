package com.more.morelabel.usermanage.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.login.model.CheckUser;
import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.common.method.ConstantsMc;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtilsMc;
import com.more.fw.core.cs.utils.MD5Util;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.auth.model.DataAuthDto;


/**
 * @Title PDA登录类
 * @Description 〈功能详细描述〉
 * @ClassName UserLoginPdaService
 * @author hxh
 * @version 1.0 developer 2019-03-09 created
 * @see UserDataService
 * @since 2019-03-09
 * @Copyright: Copyright (c) 2019
 * @Company: morelean
 */
public class UserLoginPdaService{
	
	private final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
    
	public CheckUser checkUser(String loginUserName,String pwd) {
		CheckUser checkUser = new CheckUser();
		checkUser.setResult(false);
		try {
			if(StringUtilsMc.isNotBlank(loginUserName) && StringUtilsMc.isNotBlank(pwd)) {
/*				String sql = 
						"select a.id,\n" +
								"       a.login_name,\n" + 
								"       a.name,\n" + 
								"       a.dept_id,\n" + 
								"       a.phone,\n" + 
								"       a.mobile,\n" + 
								"       a.weixin,\n" + 
								"       a.email,\n" + 
								"       a.user_type,\n" + 
								"       a.photo,\n" + 
								"       a.fingerprint,\n" + 
								"       a.edit_pw_time,\n" + 
								"       a.photo_name photoName,\n" + 
								"       a.english_name,\n" + 
								"       a.emp_sup_code,\n" + 
								"       a.emp_cust_code,\n" + 
								"       a.us_time_zone,\n" + 
								"       a.wx_user_id,\n" + 
								"       a.ding_user_id,\n" + 
								"       a.init_login,\n" + 
								"       a.data_auth,\n" + 
								"       b.name deptName,\n" + 
								"       b.partition_code partitionCode\n" + 
								"  from sy_user a\n" + 
								"  left join sy_dept b\n" + 
								"    on a.dept_id = b.id\n" + 
								" where a.enable = ?\n" + 
								"   and a.login_name = ?";*/
				String sql = "select a.*," + 
						"       a.photo_name photoName,\n" + 
						"       b.name deptName,\n" + 
						"       b.partition_code partitionCode\n" + 
						"  from sy_user a\n" + 
						"  left join sy_dept b\n" + 
						"    on a.dept_id = b.id\n" + 
						" where a.enable = '1' " + 
						"   and a.login_name = ?";
				List<UserDto> list = modelService.listDataSql(sql, new Object[] {loginUserName}, new UserDto());
				
				if(list != null && !list.isEmpty()) {
					UserDto userDto = list.get(0);
					MD5Util md5Util = new MD5Util();
					String userPwd = md5Util.encrypt(pwd, userDto.getEditPwTime(), userDto.getId());
					
					if(StringUtilsMc.isNotBlank(userPwd) && userPwd.equals(userDto.getPw())) {
						//获取当前用户的权限
						String sql2 = "select id,user_id,dept_id from sy_data_auth where user_id=?";
						List<DataAuthDto> daList = modelService.listDataSql(sql, new Object[] {userDto.getId()}, new DataAuthDto());
						userDto.setDaList(daList);
						checkUser.setUserDto(userDto);
						checkUser.setResult(true);
						checkUser.setMsg("success");
					}else {
						checkUser.setMsg(CommMethodMc.getText("登录密码")+" "+CommMethodMc.getText("不正确"));
					}
					
				}else {
					checkUser.setMsg(CommMethodMc.getText("登录用户")+" "+CommMethodMc.getText("不存在"));
				}
				
			}else {
				checkUser.setMsg(CommMethodMc.getText("用户和密码")+" "+CommMethodMc.getText("都不能为空"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return checkUser;
	}
	
}
