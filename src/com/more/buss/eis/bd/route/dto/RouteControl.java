package com.more.buss.eis.bd.route.dto;

/**
 * @Title 流程工序(线)DTO对象抽象类
 * @Description 〈功能详细描述〉
 * @ClassName RouteControl
 * @author Administrator
 * @version 1.0 developer 2017-12-5 created
 * @see RouteControl
 * @since 2017-12-5
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class RouteControl
{
  private String id;// 工序ID

  private String group_code;// 工序编码

  private String group_name;// 工序名

  private String upid;// 上级工序id

  private String nextid;// 下级工序id

  private String up_group_code;// 上级工序编码

  private String next_group_code;// 下级工序编码

  private String up_group_order;// 上级工序顺序

  private String next_group_order;// 下级工序顺序

  private String up_group_type;// 上级工序类型

  private String next_group_type;// 下级工序类型

  private String group_connection;// 关联关系

  public String getId()
  {
    return id;
  }

  public void setId(String id)
  {
    this.id = id;
  }

  public String getGroup_code()
  {
    return group_code;
  }

  public void setGroup_code(String group_code)
  {
    this.group_code = group_code;
  }

  public String getGroup_name()
  {
    return group_name;
  }

  public void setGroup_name(String group_name)
  {
    this.group_name = group_name;
  }

  public String getUpid()
  {
    return upid;
  }

  public void setUpid(String upid)
  {
    this.upid = upid;
  }

  public String getNextid()
  {
    return nextid;
  }

  public void setNextid(String nextid)
  {
    this.nextid = nextid;
  }

  public String getUp_group_code()
  {
    return up_group_code;
  }

  public void setUp_group_code(String up_group_code)
  {
    this.up_group_code = up_group_code;
  }

  public String getNext_group_code()
  {
    return next_group_code;
  }

  public void setNext_group_code(String next_group_code)
  {
    this.next_group_code = next_group_code;
  }

  public String getNext_group_order()
  {
    return next_group_order;
  }

  public void setNext_group_order(String next_group_order)
  {
    this.next_group_order = next_group_order;
  }

  public String getUp_group_type()
  {
    return up_group_type;
  }

  public void setUp_group_type(String up_group_type)
  {
    this.up_group_type = up_group_type;
  }

  public String getNext_group_type()
  {
    return next_group_type;
  }

  public void setNext_group_type(String next_group_type)
  {
    this.next_group_type = next_group_type;
  }

  public String getGroup_connection()
  {
    return group_connection;
  }

  public void setGroup_connection(String group_connection)
  {
    this.group_connection = group_connection;
  }

  public String getUp_group_order()
  {
    return up_group_order;
  }

  public void setUp_group_order(String up_group_order)
  {
    this.up_group_order = up_group_order;
  }

}
