package com.more.mcmes.projectrel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.common.exception.BussException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.BussService;

public class excelImpProject1 implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private int defNum = 1;

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        List<Map<String, String>> resData = new ArrayList<Map<String, String>>();

        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try {
            // ExcelOpt excelopt = new ExcelOpt();
            List<Map<String, String>> excelData = readExcel(modelAction, modelService);
            boolean bomFlag = false;
            if (excelData.size() <= 0) {
                return modelAction.alertParentInfo("参数表格无数据,请重新导入");
            }


            // 读取数据
            for (Map map : excelData) {
                String packId = (String) map.get("包装单");
                String feedId = (String) map.get("制造单");
                //判断是否数据为空
                if (packId == null || feedId == null || packId == "" || feedId == "") {
                    throw new BussException(modelAction.getText("表格中包装单号" + packId + "对应的制造单号" + feedId + "某项数据有误或为空,请处理后重新导入"));
                }

                boolean selFlag = false;

                // 判断是否存在制造单
                String checkProSql = " SELECT * FROM T_PM_PROJECT_BASE WHERE 1=1 AND PROJECT_SORT='1' AND PROJECT_ID = ? ";

                // 判断是否存在包装单
                String checkPackSql = " SELECT * FROM T_PM_PROJECT_BASE WHERE 1=1 AND PROJECT_SORT='2' AND PROJECT_ID = ? ";

                int countProduct = modelService.countSql(checkProSql, new Object[]{feedId});
                int countPack = modelService.countSql(checkPackSql, new Object[]{packId});

                if(countProduct < 1){
                    if(packId == feedId | packId.equals(feedId) | feedId.equals(packId)){
                        selFlag = true;
                    }else{
                        throw new BussException(modelAction.getText("该制造单"+feedId+"不存在"));
                    }

                }else if(countPack < 1){
                    if(packId == feedId | packId.equals(feedId) | feedId.equals(packId)){
                        selFlag = true;
                    }else{
                        throw new BussException(modelAction.getText("该包装单"+packId+"不存在"));
                    }

                }else{
                    // 判断是否自制关联
                    selFlag = packId == feedId | packId.equals(feedId) | feedId.equals(packId);
                }

                //判断是否重复关联
                String relDuplicateSql = "SELECT * FROM T_PM_PROJECT_REL WHERE 1=1 AND PROJECT_ID =? AND REL_PROJECT_ID=?";

                int countRelDuplicateSql = modelService.countSql(relDuplicateSql, new Object[]{packId, feedId});

                if (countRelDuplicateSql > 0) {
                    throw new BussException(modelAction.getText("表格中包装单号" + packId + "及制造单号" + feedId + "该组工单已关联,请处理后重新导入"));
                }

                //数据导入导入数据库
                String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                // 增加关联单据信息表数据
                TableDataMapExt wms = new TableDataMapExt();
                wms.setTableName("T_PM_PROJECT_REL");
                CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
                wms.getColMap().put("ID", StringUtils.getUUID());
                wms.getColMap().put("PROJECT_ID", packId);
                wms.getColMap().put("REL_PROJECT_ID", feedId);
                wms.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());

                wms.getColMap().put("CREATE_USER", modelAction.getCurrUser().getId());
                wms.getColMap().put("CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
                wms.getColMap().put("EDIT_USER", modelAction.getCurrUser().getId());
                wms.getColMap().put("EDIT_TIME", sdf1.parse(sdf1.format(new Date())));
                if (dataAuth != null) {
                    wms.getColMap().put("DATA_AUTH", dataAuth);
                }
                modelService.save(wms);

                TableDataMapExt tdMap = new TableDataMapExt();
                tdMap.setTableName("T_PM_PROJECT_BASE");
                tdMap.getColMap().put("EDIT_TIME", sdf1.parse(sdf1.format(new Date())));
                tdMap.getColMap().put("EDIT_USER", modelAction.getCurrUser().getId());

                if (selFlag) {
                    tdMap.getColMap().put("IS_REL", "3");
                    tdMap.setSqlWhere("and PROJECT_ID= '" + packId + "' ");
                    modelService.edit(tdMap);
                } else {
                    if (packId != null) {
                        tdMap.getColMap().put("IS_REL", "1");
                        tdMap.setSqlWhere("and PROJECT_ID= '" + packId + "' ");
                        modelService.edit(tdMap);
                    }
                    if (feedId != null) {
                        tdMap.getColMap().put("IS_REL", "2");
                        tdMap.setSqlWhere("and PROJECT_ID= '" + feedId + "' ");
                        modelService.edit(tdMap);
                    }else{
                        throw new BussException(modelAction.getText("更新工单状态异常,制造单:" + feedId + "包装单:" + packId));
                    }
                }
            }

            // 修改关联条数
            for (Map map : excelData) {

                String packId1 = (String) map.get("包装单");
                String feedId1 = (String) map.get("制造单");
                String userId = modelAction.getCurrUser().getId();
                String updateSql2 = "UPDATE T_PM_PROJECT_BASE A " +
                        " SET A.EDIT_TIME=SYSDATE,A.EDIT_USER=?,A.REL_NUM=(select count(rel_project_id) from T_PM_PROJECT_REL where project_id=?) " +
                        " WHERE 1 = 1 AND A.PROJECT_ID = ? ";
                modelService.execSql(updateSql2, new Object[]{userId, packId1, packId1});

                String updateSql3 = "UPDATE T_PM_PROJECT_BASE A " +
                        " SET A.EDIT_TIME=SYSDATE,A.EDIT_USER=?, A.REL_NUM=(select count(project_id) from T_PM_PROJECT_REL where rel_project_id=?) " +
                        " WHERE 1 = 1 AND A.PROJECT_ID = ? ";
                modelService.execSql(updateSql3, new Object[]{userId, feedId1, feedId1});
            }
            hbtran.commit();
            String formId = request.getParameter("formIds");
            String iframeId = request.getParameter("iframeId");
            return modelAction.reloadIframeByIds(iframeId, modelAction.getText("工单关联成功"), "0");
        } catch (Exception e) {
            log.error("", e);
            hbtran.rollback();// 错误时，回滚数据
            return modelAction.alertParentInfo((modelAction.getText(e.getMessage())));
        }
    }


    /**
     * 读取excel数据
     */
    public List<Map<String, String>> readExcel(ModelAction modelaction, ModelService modelservice) {
        int totalrow, totalcells;
        File f;
        HSSFWorkbook wk;
        HSSFSheet sheet;
        HSSFRow row_zero, row;
        HSSFCell cell_zero, cell;
        XSSFWorkbook xwk;
        XSSFSheet xsheet;
        XSSFRow xrow_zero, xrow;
        XSSFCell xcell_zero, xcell;

        ArrayList<Map<String, String>> datalist = new ArrayList<Map<String, String>>();
        ArrayList<String> keylist = new ArrayList<String>();
        InputStream input = null;
        String key = new String();
        String value = new String();
        Map<String, String> map;
        f = modelaction.getUpFile();
        String suffix = modelaction.getUpFileFileName();
        int l = suffix.length();
        String str = suffix.substring(suffix.lastIndexOf("."), l);

        try {
            input = new FileInputStream(f);//将获取的文件转化为流
            if (str.equals(".xls")) {//判断文件类型，当文件类型为。xls时
                wk = new HSSFWorkbook(input);
                for (int numsheet = 0; numsheet < wk.getNumberOfSheets(); numsheet++) {
                    sheet = wk.getSheetAt(numsheet);
                    if (sheet == null) {
                        continue;
                    }
                    totalrow = sheet.getLastRowNum();
                    //读取第一行的key值
                    row_zero = sheet.getRow(0);
                    if (row_zero != null) {
                        totalcells = row_zero.getLastCellNum();
                        for (short c_0 = 0; c_0 < totalcells; c_0++) {
                            cell_zero = row_zero.getCell(c_0);
                            key = cell_zero.toString();//key
                            keylist.add(key);
                        }
                    }
                    //读取每一行的具体数据  从第一行开始
                    for (int rowNum = defNum; rowNum < totalrow + 1; rowNum++) {
                        map = new HashMap<String, String>();
                        row = sheet.getRow(rowNum);
                        if (row != null) {

                            totalcells = row.getLastCellNum();
                            //读取列 从第一列开始
                            for (short c = 0; c < totalcells; c++) {
                                cell = row.getCell(c);
                                if (cell != null) {
                                    cell.setCellType(cell.CELL_TYPE_STRING);
                                    value = cell.toString().replace("\n", "").replace("\r", "");//value
                                } else {
                                    value = "null";
                                }
                                map.put(keylist.get(c), value);
                            }
                            datalist.add(map);
                        }
                    }
                }
            } else if (str.equals(".xlsx")) {
                xwk = new XSSFWorkbook(input);
                for (int numsheet = 0; numsheet < xwk.getNumberOfSheets(); numsheet++) {
                    xsheet = xwk.getSheetAt(numsheet);
                    if (xsheet == null) {
                        continue;
                    }
                    totalrow = xsheet.getLastRowNum();
                    //读取第一行的key值
                    xrow_zero = xsheet.getRow(0);
                    if (xrow_zero != null) {
                        totalcells = xrow_zero.getLastCellNum();
                        for (short c_0 = 0; c_0 < totalcells; c_0++) {
                            xcell_zero = xrow_zero.getCell(c_0);
                            key = StringUtils.toString(xcell_zero);//key
                            keylist.add(key);
                        }
                    }
                    //读取xrow 从第行开始
                    for (int rowNum = defNum; rowNum < totalrow + 1; rowNum++) {
                        map = new HashMap<String, String>();
                        xrow = xsheet.getRow(rowNum);
                        if (xrow != null) {

                            totalcells = xrow.getLastCellNum();
                            //读取列 从第一列开始
                            for (short c = 0; c < totalcells; c++) {
                                xcell = xrow.getCell(c);
                                if (xcell != null) {

                                    xcell.setCellType(xcell.CELL_TYPE_STRING);
                                    value = xcell.toString().replace("\n", "").replace("\r", "");//value

                                    value = StringUtils.toString(xcell);//value

                                } else {
                                    value = "null";
                                }
                                map.put(keylist.get(c), value.trim());
                            }
                            datalist.add(map);

                        }
                    }
                }

            } else {
                throw new AppException("文件上传类型错误！");
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return datalist;
    }

}