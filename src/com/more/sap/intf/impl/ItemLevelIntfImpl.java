package com.more.sap.intf.impl;

import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.sap.comm.RfcManager;
import com.more.sap.intf.ItemLevelIntf;
import com.more.sap.intf.comm.impl.SapCommIntfImpl;
import com.sap.conn.jco.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 物料层级接口实现类
 *
 * @author:phantomsaber
 * @version:2019/7/26 15:55
 * @email:phantomsaber@foxmail.com
 **/
public class ItemLevelIntfImpl extends SapCommIntfImpl implements ItemLevelIntf {
    @Override
    public void exec(String funcName, String syncItemCode) {

        /*-- version:2019/7/26 17:20 | desc:执行同步接口 --*/
        JCoFunction function = getFunction(funcName);
        RfcManager.execute(function);

        /*-- version:2019/7/26 17:20 | desc:接收接口返回参数 --*/
        JCoTable itOut = getTables("IT_OUT", function);

        /*-- version:2019/7/26 17:20 | desc:保存 --*/
        try {
            for (int i = 0; i < itOut.getNumRows(); i++) {
                itOut.setRow(i);
                saveItemLevel(getOutMap(itOut));
            }
            saveLog(getLogMap(function));
        } catch (Exception e) {
            saveLog(getLogMap(function, e));
        }
    }

    @Override
    public Boolean saveItemLevel(Map<String, String> paraMap) {
        Boolean flag = true;
        String levelCode = paraMap.get(getLevelCode());
        String levelNo = paraMap.get(getLevelNo());
        String levelDesc = paraMap.get(getLevelDesc());
        String levelEnd = paraMap.get(getLevelEnd());
        String levelDataOpt = paraMap.get(getLevelDataOpt());

        MsHTranMan hbtran = BussService.getHbTran();
        try {
            TableDataMapExt dataMapExt = new TableDataMapExt();
            dataMapExt.setTableName("T_CO_ITEM_LEVEL");

            if(levelCodeNotExist(levelCode)){
                dataMapExt.getColMap().put("ID", StringUtils.getUUID());
                dataMapExt.getColMap().put("DEPT_ID", "1");
                dataMapExt.getColMap().put("CREATE_USER", "2a60fc3ebc344a7eae9dea50bfcfc528");
                dataMapExt.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
                dataMapExt.getColMap().put("DATA_AUTH", "FA174AFF136D496A87B65443D22357E3");

                dataMapExt.getColMap().put("LEVEL_CODE", levelCode);
                dataMapExt.getColMap().put("LEVEL_NO", levelNo);
                dataMapExt.getColMap().put("LEVEL_DESC", levelDesc);
                dataMapExt.getColMap().put("LEVEL_END", levelEnd);
                dataMapExt.getColMap().put("LEVEL_DATA_OPT", levelDataOpt);

                CommMethod.getBaseService().save(dataMapExt);
            }else{
                dataMapExt.getColMap().put("ID", StringUtils.getUUID());
                dataMapExt.getColMap().put("DEPT_ID", "1");
                dataMapExt.getColMap().put("EDIT_USER", "2a60fc3ebc344a7eae9dea50bfcfc528");
                dataMapExt.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
                dataMapExt.getColMap().put("DATA_AUTH", "FA174AFF136D496A87B65443D22357E3");

                dataMapExt.getColMap().put("LEVEL_CODE", levelCode);
                dataMapExt.getColMap().put("LEVEL_NO", levelNo);
                dataMapExt.getColMap().put("LEVEL_DESC", levelDesc);
                dataMapExt.getColMap().put("LEVEL_END", levelEnd);
                dataMapExt.getColMap().put("LEVEL_DATA_OPT", levelDataOpt);

                dataMapExt.setSqlWhere(" AND LEVEL_CODE = ? ");
                List list = new ArrayList();
                list.add(levelCode);
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
    public Map<String,String> getOutMap(JCoTable itOut){
        Map<String, String> outMap = new HashMap<>();
        outMap.put(getLevelCode(), itOut.getString(getLevelCode()));
        outMap.put(getLevelNo(), itOut.getString(getLevelNo()));
        outMap.put(getLevelDesc(), itOut.getString(getLevelDesc()));
        outMap.put(getLevelEnd(),itOut.getString(getLevelEnd()));
        outMap.put(getLevelDataOpt(), itOut.getString(getLevelDataOpt()));
        return outMap;
    }

    @Override
    public Boolean levelCodeNotExist(String code) {
        Boolean flag = false;
        String sql = "SELECT * FROM T_CO_ITEM_LEVEL A WHERE 1=1 AND A.LEVEL_CODE = ? ";

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
