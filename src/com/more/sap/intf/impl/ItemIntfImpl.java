package com.more.sap.intf.impl;

import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.sap.comm.RfcManager;
import com.more.sap.intf.ItemIntf;
import com.more.sap.intf.comm.impl.SapCommIntfImpl;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 物料信息同步接口实现类
 *
 * @author:phantomsaber
 * @version:2019/7/25 9:33
 * @email:phantomsaber@foxmail.com
 **/
public class ItemIntfImpl extends SapCommIntfImpl implements ItemIntf {

    /**
     * 接口执行方法
     */
    @Override
    public void exec(String funcName,String syncItemCode) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = dateTimeFormat.format(new Date());
        Time curTime = new Time((new Date()).getTime());

        JCoFunction function = RfcManager.getFunction(funcName);

        /*-- version:2019/7/25 15:09 | desc:import --*/
        JCoParameterList importParameterList = function.getImportParameterList();
        importParameterList.setValue("IV_DATE", curDate);
        importParameterList.setValue("IV_TIME", curTime);

        /*-- version:2019/7/25 15:10 | desc:tables --*/
        JCoParameterList tableParameterList = function.getTableParameterList();

        JCoTable itOut = tableParameterList.getTable("IT_OUT");

        JCoTable itMatnr = tableParameterList.getTable("IT_MATNR");
        itMatnr.appendRow();
        itMatnr.setValue("SIGN", "I");
        itMatnr.setValue("OPTION", "CP");
        itMatnr.setValue("LOW", "*"+syncItemCode+"*");
        itMatnr.setValue("HIGH", "");

        tableParameterList.setValue("IT_MATNR", itMatnr);
        RfcManager.execute(function);

        JCoParameterList exportParameterList = function.getExportParameterList();
        String sflag = exportParameterList.getString("SFLAG");
        String message = exportParameterList.getString("MESSAGE");

        Map<String, String> logMap = new HashMap<>();
        logMap.put("DATA_AUTH", "");
        logMap.put("RL_FUNC_NAME", funcName);
        logMap.put("RL_FLAG", sflag);
        logMap.put("RL_MESSAGE", message);
        logMap.put("RL_IMPORT", importParameterList.toString());
        logMap.put("RL_EXPORT", exportParameterList.toString().replaceAll("-","").replaceAll("\\|",""));
        logMap.put("RL_CHANGING", "");
        logMap.put("RL_TABLES", tableParameterList.toString());
        logMap.put("RL_EXCEPTIONS", "");
        logMap.put("RL_SY_ERROR", "");

        try {
            if("Y".equalsIgnoreCase(sflag)){
                Map<String, String> outMap = new HashMap<>();
                for (int i = 0; i < itOut.getNumRows(); i++) {
                    itOut.setRow(i);
                    outMap.put(getItemCode(), itOut.getString(getItemCode()));
                    outMap.put(getItemName(), itOut.getString(getItemName()));
                    outMap.put(getStockCode(), itOut.getString(getStockCode()));
                    outMap.put(getColorCode(), itOut.getString(getColorCode()));
                    outMap.put(getLevelGroup(), itOut.getString(getLevelGroup()));
                    outMap.put(getUndefined2(), itOut.getString(getUndefined2()));
                    outMap.put(getGrossWeight(), itOut.getString(getGrossWeight()));
                    outMap.put(getNetWeight(), itOut.getString(getNetWeight()));
                    outMap.put(getWeightUnit(), itOut.getString(getWeightUnit()));
                    outMap.put(getBaseUnit(), itOut.getString(getBaseUnit()));
                    outMap.put(getIsDel(), itOut.getString(getIsDel()));
                    outMap.put(getIsConfigurable(), itOut.getString(getIsConfigurable()));

                    saveItem(outMap);
                }
                saveLog(logMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logMap.put("RL_SY_ERROR", e.getMessage());
            saveLog(logMap);
//            hbtran.rollback();
        }

    }

    /**
     * 保存物料信息
     * @param paraMap
     * @return
     */
    @Override
    public Boolean saveItem(Map<String, String> paraMap) {
        Boolean flag = true;

        /**
         * itemCode 物料号 MATNR
         */
        String itemCode = paraMap.get(getItemCode());

        /**
         * itemName 物料描述 MAKTX
         */
        String itemName = paraMap.get(getItemName());

        /**
         * stockCode 存货代码 ZSTOR
         */
        String stockCode = paraMap.get(getStockCode());

        /**
         * colorCode 调色号码 ZTONE
         */
        String colorCode = paraMap.get(getColorCode());

        /**
         * levelGroup 产品层级 PRDHA
         */
        String levelGroup = paraMap.get(getLevelGroup());

        /**
         * undefined2 预留2 ZRES2
         */
        String undifined2 = paraMap.get(getUndefined2());

        /**
         * grossWeight 毛重 BRGEW
         */
        String grossWeight = paraMap.get(getGrossWeight());

        /**
         * netWeight 净重 NTGEW
         */
        String netWeight = paraMap.get(getNetWeight());

        /**
         * weightUnit 重量单位 GEWEI
         */
        String weightUnit = paraMap.get(getWeightUnit());

        /**
         * baseUnit 基本单位 MEINS
         */
        String baseUnit = paraMap.get(getBaseUnit());

        /**
         * isDel X表示删除 LVORM
         */
        String isDel = paraMap.get(getIsDel());

        /**
         * isConfigurable 物料是否可配置 KZKFG
         */
        String isConfigurable = paraMap.get(getIsConfigurable());

        MsHTranMan hbtran = BussService.getHbTran();
        try {
            TableDataMapExt dataMapExt = new TableDataMapExt();
            dataMapExt.setTableName("T_CO_ITEM");

            itemCode = getItemCodeFormatZero(itemCode);
            if(itemNotExist(itemCode)){
                dataMapExt.getColMap().put("ID", StringUtils.getUUID());
                dataMapExt.getColMap().put("DEPT_ID", "1");
                dataMapExt.getColMap().put("CREATE_USER", "2a60fc3ebc344a7eae9dea50bfcfc528");
                dataMapExt.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
                dataMapExt.getColMap().put("DATA_AUTH", "FA174AFF136D496A87B65443D22357E3");

                dataMapExt.getColMap().put("CI_ITEM_CODE", getItemCodeFormatZero(itemCode));
                dataMapExt.getColMap().put("CI_ITEM_NAME", itemName);
                dataMapExt.getColMap().put("CI_ITEM_SPEC", itemName);
                dataMapExt.getColMap().put("CI_UNIT", baseUnit);
                dataMapExt.getColMap().put("CI_MEMO", itemName);
                dataMapExt.getColMap().put("CI_GROUP_ID", levelGroup);
                dataMapExt.getColMap().put("STOCK_CODE", stockCode);

                dataMapExt.getColMap().put("SAP_WEIGHT_UNIT", weightUnit);
                dataMapExt.getColMap().put("SAP_IS_DEL", isDel);
                dataMapExt.getColMap().put("SAP_BASE_UNIT", baseUnit);
                dataMapExt.getColMap().put("SAP_COLOR_CODE", colorCode);
                dataMapExt.getColMap().put("SAP_LEVEL_GROUP", levelGroup);
                dataMapExt.getColMap().put("SAP_GROSS_WEIGHT", grossWeight);
                dataMapExt.getColMap().put("SAP_NET_WEIGHT", netWeight);
                dataMapExt.getColMap().put("SAP_IS_CONFIG", isConfigurable);

                CommMethod.getBaseService().save(dataMapExt);
            }else{
                dataMapExt.getColMap().put("ID", StringUtils.getUUID());
                dataMapExt.getColMap().put("DEPT_ID", "1");
                dataMapExt.getColMap().put("EDIT_USER", "2a60fc3ebc344a7eae9dea50bfcfc528");
                dataMapExt.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
                dataMapExt.getColMap().put("DATA_AUTH", "FA174AFF136D496A87B65443D22357E3");

                dataMapExt.getColMap().put("CI_ITEM_CODE", itemCode);
                dataMapExt.getColMap().put("CI_ITEM_NAME", itemName);
                dataMapExt.getColMap().put("CI_ITEM_SPEC", itemName);
                dataMapExt.getColMap().put("CI_UNIT", baseUnit);
                dataMapExt.getColMap().put("CI_MEMO", itemName);
                dataMapExt.getColMap().put("CI_GROUP_ID", levelGroup);
                dataMapExt.getColMap().put("STOCK_CODE", stockCode);

                dataMapExt.getColMap().put("SAP_WEIGHT_UNIT", weightUnit);
                dataMapExt.getColMap().put("SAP_IS_DEL", isDel);
                dataMapExt.getColMap().put("SAP_BASE_UNIT", baseUnit);
                dataMapExt.getColMap().put("SAP_COLOR_CODE", colorCode);
                dataMapExt.getColMap().put("SAP_LEVEL_GROUP", levelGroup);
                dataMapExt.getColMap().put("SAP_GROSS_WEIGHT", grossWeight);
                dataMapExt.getColMap().put("SAP_NET_WEIGHT", netWeight);
                dataMapExt.getColMap().put("SAP_IS_CONFIG", isConfigurable);

                dataMapExt.setSqlWhere(" AND CI_ITEM_CODE = ? ");
                List list = new ArrayList();
                list.add(itemCode);
                dataMapExt.setSqlWhereArgs(list);
                CommMethod.getBaseService().edit(dataMapExt);
            }
            hbtran.commit();
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
            hbtran.rollback();
        }
        return flag;
    }

    @Override
    public Boolean itemNotExist(String code) {
        Boolean flag = false;
        String sql = "SELECT * FROM T_CO_ITEM A WHERE 1=1 AND A.CI_ITEM_CODE = ? ";

        try {
            int countSql = CommMethod.getBaseService().countSql(sql, new Object[]{code});
            flag = countSql <= 0;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }
}
