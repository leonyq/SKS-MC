package com.more.buss.eis.bd.route.dto;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
/**
 * 
 * @Title 流程工序DTO对象抽象类
 * @Description 流程工序DTO对象抽象类
 * @ClassName GroupControl
 * @author csh
 * @version 1.0 developer 2017-12-5 created
 * @see GroupControl
 * @since 2017-12-5
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class GroupControl
{
  private String id;// 当前id

  private List<String> nextIdLs;// 下级id

  private String code;// 当前编码

  private String order;// 工序顺序

  private String nextOrder;// 下个工序顺序

  private List<String> nextCodeLs;// 下级编码

  private List<String> nextCodeIdLs;// 下级编码

  private String type;// 类型

  private String start;// 是否开始工序

  private String end;// 是否结束工序

  private List<String> connection;// 连接关系

  private Set<GroupControl> nextList = new HashSet<GroupControl>();

  public Set<GroupControl> getNext(Set<GroupControl> historyList)
  {
    Set<GroupControl> result = new HashSet<GroupControl>();

    // 改动位置！！！！！！！！！！！！！！！
    if (nextList != null && nextList.size() != 0)
    {
      result.addAll(nextList);
    }

    if (historyList.contains(this))
    {
      result.add(this);
      return result;
    }
    else
    {
      if (nextList != null)
      {
        for (GroupControl next : nextList)
        {
          if (!"1".equals(next.getType()))
          {
            Set<GroupControl> historyLists = new HashSet<GroupControl>();
            historyList.add(this);
            historyLists.addAll(historyList);
            result.addAll(next.getNext(historyLists));
          }
          else
          {
            result.add(next);
          }
        }
      }
    }

    return result;

  }

  public String getId()
  {
    return id;
  }

  public void setId(String id)
  {
    this.id = id;
  }

  public List<String> getNextIdLs()
  {
    return nextIdLs;
  }

  public void setNextIdLs(List<String> nextIdLs)
  {
    this.nextIdLs = nextIdLs;
  }

  public String getCode()
  {
    return code;
  }

  public void setCode(String code)
  {
    this.code = code;
  }

  public String getOrder()
  {
    return order;
  }

  public void setOrder(String order)
  {
    this.order = order;
  }

  public String getNextOrder()
  {
    return nextOrder;
  }

  public void setNextOrder(String nextOrder)
  {
    this.nextOrder = nextOrder;
  }

  public List<String> getNextCodeLs()
  {
    return nextCodeLs;
  }

  public void setNextCodeLs(List<String> nextCodeLs)
  {
    this.nextCodeLs = nextCodeLs;
  }

  public List<String> getNextCodeIdLs()
  {
    return nextCodeIdLs;
  }

  public void setNextCodeIdLs(List<String> nextCodeIdLs)
  {
    this.nextCodeIdLs = nextCodeIdLs;
  }

  public String getType()
  {
    return type;
  }

  public void setType(String type)
  {
    this.type = type;
  }

  public String getStart()
  {
    return start;
  }

  public void setStart(String start)
  {
    this.start = start;
  }

  public List<String> getConnection()
  {
    return connection;
  }

  public void setConnection(List<String> connection)
  {
    this.connection = connection;
  }

  public Set<GroupControl> getNextList()
  {
    return nextList;
  }

  public void setNextList(Set<GroupControl> nextList)
  {
    this.nextList = nextList;
  }

  public String getEnd()
  {
    return end;
  }

  public void setEnd(String end)
  {
    this.end = end;
  }

}
