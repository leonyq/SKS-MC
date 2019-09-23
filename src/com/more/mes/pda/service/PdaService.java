package com.more.mes.pda.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class PdaService {

	/**
     * ModelService
     */
    private static final ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
    
    /**
     * Logger
     */
    private static final Log log = LogFactory.getLog("PdaService");
    
    /**
     * 获取PDA设置信息
     * @param setingType
     * @return
     */
    public static Map getPdaSetting(String setingType){
    	try{
    		switch(setingType){
    		    case "stockinfo":
    			    return pdaSettingStockInfo();
    			default:
    				break;
    		}
    		return null;
    	}
    	catch(Exception ex){
    		log.error("GetPdaSetting:",ex);
    		return null;
    	}
    }
    
    /**
     * PDA设置信息：物料查询
     * @return
     */
    public static Map pdaSettingStockInfo(){
    	try{
    		Map returnMap=new HashMap();
    		returnMap.put("序号", new HashMap(){{
    			put("width","50");
    			put("visiable","true");
    		}});
    		returnMap.put("品号", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("数量", new HashMap(){{
    			put("width","50");
    			put("visiable","true");
    		}});
    		returnMap.put("条码", new HashMap(){{
    			put("width","200");
    			put("visiable","true");
    		}});
    		returnMap.put("一级容器", new HashMap(){{
    			put("width","200");
    			put("visiable","true");
    		}});
    		returnMap.put("二级容器", new HashMap(){{
    			put("width","200");
    			put("visiable","true");
    		}});
    		returnMap.put("三级容器", new HashMap(){{
    			put("width","200");
    			put("visiable","true");
    		}});
    		returnMap.put("四级容器", new HashMap(){{
    			put("width","200");
    			put("visiable","true");
    		}});
    		returnMap.put("仓库SN", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("库位", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("库位名称", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("品质", new HashMap(){{
    			put("width","50");
    			put("visiable","true");
    		}});
    		returnMap.put("退料", new HashMap(){{
    			put("width","50");
    			put("visiable","true");
    		}});
    		returnMap.put("失效期", new HashMap(){{
    			put("width","120");
    			put("visiable","true");
    		}});
    		returnMap.put("供应商", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("生产日期", new HashMap(){{
    			put("width","120");
    			put("visiable","true");
    		}});
    		returnMap.put("解冻状态", new HashMap(){{
    			put("width","50");
    			put("visiable","true");
    		}});
    		returnMap.put("检测状态", new HashMap(){{
    			put("width","50");
    			put("visiable","true");
    		}});
    		returnMap.put("入库时间", new HashMap(){{
    			put("width","120");
    			put("visiable","true");
    		}});
    		returnMap.put("入库人", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("机构代码", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("库存状态", new HashMap(){{
    			put("width","50");
    			put("visiable","true");
    		}});
    		returnMap.put("工单号", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("订单号", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("批次", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("品名", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		returnMap.put("规格", new HashMap(){{
    			put("width","100");
    			put("visiable","true");
    		}});
    		return returnMap;
    	}
    	catch(Exception ex){
    		log.error("pdaSettingStockInfo:",ex);
    		return null;
    	}
    }
    
    /**
     * Map 转  Json
     * @param map
     * @return
     */
    public static String MapToJson(Map dataMap)
    {
 	   try
 	   {
 		   JSONArray json = JSONArray.fromObject(dataMap);
 		   return json.toString();
 	   }
 	   catch(Exception ex)
 	   {
 		   log.info("MapToJson:"+ex.toString());
 		   return null;
 	   }
    }
}
