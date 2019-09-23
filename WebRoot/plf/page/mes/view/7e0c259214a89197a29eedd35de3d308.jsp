/*
 * @File ProFuncDto.java
 * @Package com.more.fw.core.sysfa.usermessage.model
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author msad009
 * @date 2017-6-7 下午6:31:13
 * @version V1.0
 */

package com.more.fw.core.sysfa.usermessage.model;

import java.io.Serializable;
import java.util.List;

public class ProFuncDto implements Serializable
{
 
  public static final String IN_TYPE = "in";//输入类型
  public static final String OUT_TYPE = "out";//输出类型
  public static final String IN_OUT_TYPE = "inout";//输入输出类型
  
  public static final String TYPE_INT = "Integer";
  public static final String TYPE_STRING = "String";
  public static final String TYPE_LONG = "Long";
  public static final String TYPE_DOUBLE = "Double";
  public static final String TYPE_FLOAT = "Float";
  public static final String TYPE_Short = "Short";
  public static final String TYPE_BIGDECIMAL = "BigDecimal";
  public static final String TYPE_BOOLEAN = "Boolean";
  public static final String TYPE_TIMESTAMP = "Timestamp";//时间
  public static final String TYPE_TIME = "Time";
  public static final String TYPE_BLOB = "Blob";
  public static final String TYPE_CLOB = "Clob";
  /*
   * 存储过程、函数名称
   * */
  public String className;
  /*
   * 输入类型     in  inout
   * */
  public String[] inValType;
  /*
   * 输出类型     out inout
   * */
  public String[] outValType;
  /*
   * 输入值（in）、输入输出值（inout）
   * */
  public List<Object> valArgs;
  /*
   * 所属类型 varchar2 date int Blob。。。。
   * */
  public Object[] paramType;
  /*
   * 输入位置 如果有in 或者 inout需要记录位置的下标索引（从1开始）
   * */
  public int[] inPlace;
  /*
   * 输出位置 如果有out 或者 inout需要记录位置的下标索引（从1开始）
   * */
  public int[] outPlace;
  
  
  public String getClassName()
  {
    return className;
  }
  public void setClassName(String className)
  {
    this.className = className;
  }
  public List<Object> getValArgs()
  {
    return valArgs;
  }
  public void setValArgs(List<Object> valArgs)
  {
    this.valArgs = valArgs;
  }
  public Object[] getParamType()
  {
    return paramType;
  }
  public void setParamType(Object[] paramType)
  {
    this.paramType = paramType;
  }
  public int[] getInPlace()
  {
    return inPlace;
  }
  public void setInPlace(int[] inPlace)
  {
    this.inPlace = inPlace;
  }
  public int[] getOutPlace()
  {
    return outPlace;
  }
  public void setOutPlace(int[] outPlace)
  {
    this.outPlace = outPlace;
  }
  public String[] getInValType()
  {
    return inValType;
  }
  public void setInValType(String[] inValType)
  {
    this.inValType = inValType;
  }
  public String[] getOutValType()
  {
    return outValType;
  }
  public void setOutValType(String[] outValType)
  {
    this.outValType = outValType;
  }
  
}
