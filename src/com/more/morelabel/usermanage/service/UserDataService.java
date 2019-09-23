package com.more.morelabel.usermanage.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * @Title 用户数据服务类
 * @Description 〈功能详细描述〉
 * @ClassName UserDataService
 * @author csh
 * @version 1.0 developer 2017-10-19 created
 * @see UserDataService
 * @since 2017-10-19
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class UserDataService
{
  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  /**
   * @Description: 获取全部用户数据
   * @return List
   * @throws
   */
  public List getUserList()
  {
    String sql = "select t.* from sy_user t"; // 查询用户信息
    List list = modelService.listSql(sql, null, null, null, null);
    return list;
  }

  /**
   * @Description: 根据组织机构及查询条件查询用户信息
   * @param dataAuth
   * @return List
   * @throws
   */
  public List getListUserDA(Map map, PaginationImpl impl)
  {

    String deptId = (String)map.get("deptId");
    String mobile = (String)map.get("mobile");
    String name = (String)map.get("name");
    String enable = (String)map.get("enable");
    String sql = "SELECT T.* FROM SY_USER T WHERE T.SUPPLIER_FLAG = 'N' AND T.DEPT_ID IN (SELECT T1.ID FROM SY_DEPT T1 START WITH T1.ID='"
                 + deptId + "' CONNECT BY T1.UP_ID=PRIOR T1.ID) ";
    if (StringUtils.isNotBlank(mobile))
    {
      sql = sql + "AND T.LOGIN_NAME like '%" + mobile + "%' ";
    }
    if (StringUtils.isNotBlank(name))
    {
      sql = sql + "AND T.NAME like '%" + name + "%' ";
    }
    if (StringUtils.isNotBlank(enable))
    {
      sql = sql + "AND T.ENABLE = '" + enable + "' ";
    }
    List list = modelService.listSql(sql, impl, null, "ORDER BY T.ENABLE DESC,T.LOGIN_NAME", null);

    return list;
  }

  /**
   * @Description: 根据id获取用户信息
   * @param id
   * @returna List
   * @throws
   */
  public List getIdforUser(String id)
  {
    String sql = "select t.* from sy_user t where t.id = ?"; // 查询用户信息
    List list = modelService.listDataSql(sql, new Object[] {id});
    return list;
  }

  /**
   * @Description: 根据用户登录名修改用户密码
   * @return List
   * @throws
   */
  public void upUserPwd(String pwd, Date date, String loginName)
  {
    String upSql = "update sy_user set PW = ?,EDIT_PW_TIME = ? where LOGIN_NAME= ? ";
    modelService.execSql(upSql, new Object[] {pwd, date, loginName});
  }

  /**
   * @Description: 根据用户Id修改用户密码
   * @param pwd
   * @param date
   * @param loginName
   *          void
   * @throws
   */
  public void upUserPwdInId(String pwd, Date date, String id)
  {
    String upSql = "update sy_user set PW = ?,EDIT_PW_TIME = ? where ID= ? ";
    modelService.execSql(upSql, new Object[] {pwd, date, id});
  }

  /**
   * @Description: 根据手机号查询用户id
   * @param phoneNumber
   *          List
   * @throws
   */
  public List getPhoneNumber(String phoneNumber)
  {
    String sql = "select id from SY_USER where MOBILE = ?";
    List dataList = modelService.listDataSql(sql, new Object[] {phoneNumber});

    return dataList;
  }

  /**
   * @Description: 判断用户登录名是否已存在
   * @param loginNmae
   * @return int
   * @throws
   */
  public int getCountUser(String loginNmae)
  {
    String userSql = "select t.LOGIN_NAME from SY_USER t where t.LOGIN_NAME=?";
    int count = modelService.execSql(userSql, new Object[] {loginNmae});
    return count;
  }

  /**
   * @Description: 根据用户登录名查询数据
   * @param loginName
   *          List
   * @throws
   */
  public List getUserListByMobile(String phone)
  {
    String sql = "select * from SY_USER where MOBILE = ?";
    List dataList = modelService.listDataSql(sql, new Object[] {phone});
    return dataList;
  }

  /**
   * @Description: 获取当前登录人下，用户的角色信息
   * @param thisUserId
   * @param userId
   * @return List
   * @throws
   */
  public List getUserRoleList(String userId, String dataAuth)
  {
    String sql = "SELECT T.ROLE_ID,T1.NAME,T1.REMARK FROM SY_USER_ROLE T LEFT JOIN SY_ROLE T1 ON T1.ID = T.ROLE_ID WHERE T.USER_ID = ? AND T1.DATA_AUTH IN (SELECT T2.ID FROM SY_DEPT T2 START WITH T2.ID= ? CONNECT BY T2.UP_ID=PRIOR T2.ID) ";
    List dataList = modelService.listDataSql(sql, new Object[] {userId, dataAuth});
    return dataList;
  }
  
  /**
   * @Description: 判断手机号是否已存在
   * @return int
   * @throws
   */
  public int getCountSupplierPhone(String id, String phone)
  {
    int count;
    String sql = "SELECT T.LOGIN_NAME FROM SY_USER T WHERE T.LOGIN_NAME=? OR T.MOBILE = ?";
    if (StringUtils.isNotBlank(id))
    {
      sql = sql + " AND T.ID != ?";
      count = modelService.execSql(sql, new Object[] {phone, phone, id});
    }else{
      count = modelService.execSql(sql, new Object[] {phone, phone});
    }
    return count;
  }
  
  /**
   * @Description: 判断邮箱是否已存在
   * @return int
   * @throws
   */
  public int getCountSupplierEmail(String id, String email)
  {
    int count;
    String sql = "SELECT T.EMAIL FROM SY_USER T WHERE T.EMAIL=?";
    if (StringUtils.isNotBlank(id))
    {
      sql = sql + " AND T.ID != ?";
      count = modelService.execSql(sql, new Object[] {email, id});
    }else{
      count = modelService.execSql(sql, new Object[] {email});
    }
    return count;
  }
  
}
