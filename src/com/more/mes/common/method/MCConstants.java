package com.more.mes.common.method;

import com.more.fw.core.common.method.Constants;

/**
 * @Title MC常量类
 * @Description 〈功能详细描述〉
 * @ClassName MCConstants
 * @author csh
 * @version 1.0 developer 2018-4-8 created
 * @see MCConstants
 * @since 2018-4-8
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */

public class MCConstants
{
  /**
   * 成功返回值 OK
   **/
  public static final String SUCCESS_VAL = "OK";

  /**
   * 错误返回值 NG
   **/
  public static final String ERROR_VAL = "NG";

  /**
   * 向标签云同步标签模板接口地址
   **/
  public static final String TEMPLATE_LABEL_PATH = "http/interface.ms?model=TemplateSynchro&method=TemplateSynchroFunc";

  /**
   * 标签模版上传图片路径
   */
  public static final String TEMPLATE_IMG_PATH = Constants.SEPARATOR + "res" + Constants.SEPARATOR
                                                 + "updoc" + Constants.SEPARATOR + "buss"
                                                 + Constants.SEPARATOR + "ei"
                                                 + Constants.SEPARATOR + "morelabel"
                                                 + Constants.SEPARATOR + "template"
                                                 + Constants.SEPARATOR + "img"
                                                 + Constants.SEPARATOR;

  /**
   * 标签数据项图片存放目录
   */
  public static String DATAITEMPIC_PATH = Constants.SEPARATOR + "up_load" + Constants.SEPARATOR
                                          + "comm" + Constants.SEPARATOR + "dataItemPic"
                                          + Constants.SEPARATOR;

  /**
   * 访问标签数据项图片路径
   */
  public static String DATAITEMPIC_PATH_FW = "/up_load/comm/dataItemPic/";

  /**
   * windows系统换行符号
   */
  public static final String WINDOWS_ENTER = "\r\n";

  /**
   * 标签模版导出模版临时存放路径
   */
  public static final String TEMPLATE_INTERIL_PATH = "res" + Constants.SEPARATOR + "updoc"
                                                   + Constants.SEPARATOR + "buss"
                                                   + Constants.SEPARATOR + "ei"
                                                   + Constants.SEPARATOR + "morelabel"
                                                   + Constants.SEPARATOR + "template"
                                                   + Constants.SEPARATOR + "interim"
                                                   + Constants.SEPARATOR;
  
  /**
   * 云标签同步账号 （参数配置中项目编码）
   */
  public static final String LABBEL_LOGINNAME = "MES0006";

  /**
   * 云标签同步密码 （参数配置中项目编码）
   */
  public static final String LABBEL_PWD = "MES0007";
  
  /**
   * 向标签云同步标签模板接口地址前缀
   */
  public static final String TEMPLATE_LABEL_PATH_PREFIX = "MES0008";
  
}
