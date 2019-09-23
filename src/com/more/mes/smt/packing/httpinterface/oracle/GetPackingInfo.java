package com.more.mes.smt.packing.httpinterface.oracle;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.mes.smt.packing.service.oracle.PackingService;

import java.sql.Struct;
import java.util.List;

import javax.mail.Flags.Flag;

import javazoom.jl.decoder.Decoder.Params;

public class GetPackingInfo extends InterfaceLog implements IhttpServiceJosn 
{
	  /**
	   * 参数类
	   * @author Chaos
	   *
	   */
	  class Param
	  {
	      public String Flag=null; //执行标识
	      public Object Params=null; //参数
	      public Boolean DoWhere=false; //是否执行动态Where
	      public int DoType=-1; //执行类型（0-查询 1-新增 2-删除 3-修改 4-存储过程）
	  }
	
  /**
   * @Description: 方法描述
   * @param args
   * void
   * @throws 
   */
  public static void main(String[] args)
  {
    // TODO Auto-generated method stub

  }

  @Override
  public String exeFunc(HttpCoreService service)
  {
      try
      {
          // TODO Auto-generated method stub
    	  //获取参数
    	  Param doParam= ToParam(service);
    	  if(doParam.DoType==0)
    	  {
        	  if(!doParam.DoWhere) service.getDit().put("Result",PackingService.Exce(doParam.Flag, doParam.Params));
        	  else service.getDit().put("Result",PackingService.ExceWhere(doParam.Flag, doParam.Params));
    	  }
    	  else if(doParam.DoType==1){}
    	  else if(doParam.DoType==2){}
    	  else if(doParam.DoType==3)
    	  {
    		  if(!doParam.DoWhere) service.getDit().put("Result",PackingService.ExceSql(doParam.Flag, doParam.Params));
    	  }
    	  else if(doParam.DoType==4)
    	  {
    		  service.getDit().put("Result",PackingService.ExceProcedure(doParam.Flag, doParam.Params));
    	  }
    	  else 
    	  {
    		  service.getDit().put("Result", "doTypeError");		  
    	  }
    	  
    	  return null;
      }
      catch(Exception e)
      {
    	  
          service.getDit().put("Result", "interfaceExecError("+e.getMessage()+")");
          return null;
      }
  }
  
  //<editor-fold desc"get params">
  
  private Param ToParam(HttpCoreService service)
  {
	  Object[] varObjects=new Object[]
			  {
			  service.getDit().get("strFlag"),
			  service.getDit().get("params"),
			  service.getDit().get("doWhere"),
			  service.getDit().get("doType")
			  };
	  
	  Param obj=new Param();
	  obj.Flag=varObjects[0]!=null? String.valueOf(varObjects[0]):"";
	  obj.Params=varObjects[1];
	  obj.DoWhere= varObjects[2] != null;
	  obj.DoType=varObjects[3]!=null?Integer.parseInt(varObjects[3].toString()):-1;
	  return obj;
  }
  
  //</editor-fold>
  
}