package com.morelean.mcmes.materialtable;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

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
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class MaterialEImport implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private int defNum = 2;

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        List<Map<String, String>> resData = new ArrayList<Map<String, String>>();

        try {
            String device = request.getParameter("deviceArr");
            String modelCode = request.getParameter("modelCode");
            if (StringUtils.isBlank(device)) {
                return modelAction.alertParentInfo((modelAction.getText("请绑定设备")));
            }
            JSONArray deviceArr = JSONArray.fromObject(device);

            // ExcelOpt excelopt = new ExcelOpt();
            List<Map<String, String>> excelData = readExcel(modelAction, modelService);
            for (int i = 1; i <= 4; i++) {
                excelData.remove(0);
            }
            String sql = "select vr_value from t_sys_parameter_ini s where s.vr_class=? and  vr_value=? ";
            List<Map> sList = modelService.listDataSql(sql, new Object[]{"SMT0001", "1"});
            boolean bomFlag = false;
            if (sList != null && !sList.isEmpty()) {
                bomFlag = true;
            }

            // 料站明细数据从第6行开始
            for (Map map : excelData) {
                Object deviceSn = map.get("CMD_DEVICE_SN");// 取机台
                if (StringUtils.isBlank(deviceSn)) {
                    return modelAction.alertParentInfo((modelAction.getText("机台不能为空")));
                }
                String deviceSeq = checkDevice(deviceArr, deviceSn.toString());
                if (StringUtils.isEmpty(deviceSeq)) continue;
                map.put("CMD_DEVICE_SEQ", deviceSeq);
                Object CMD_TRACK = map.get("CMD_TRACK");// 轨道
                //  if (StringUtils.isBlank(CMD_TRACK))
                //  {
                //    return modelAction.alertParentInfo((modelAction.getText("轨道不能为空")));
                //  }
                Object CMD_TABLE_NO = map.get("CMD_TABLE_NO");// TABLE
                if (StringUtils.isBlank(CMD_TABLE_NO)) {
                    return modelAction.alertParentInfo((modelAction.getText("TABLE不能为空")));
                }
                Object CMD_LOADPOINT = map.get("CMD_LOADPOINT");// 料站
                if (StringUtils.isBlank(CMD_LOADPOINT)) {
                    return modelAction.alertParentInfo((modelAction.getText("料站不能为空")));
                }
                Object CMD_CHANEL_SN = map.get("CMD_CHANEL_SN");// 通道
                if (StringUtils.isBlank(CMD_CHANEL_SN)) {
                    return modelAction.alertParentInfo((modelAction.getText("通道不能为空")));
                }
                Object CMD_ITEM_CODE = map.get("CMD_ITEM_CODE");// 物料料号
                if (StringUtils.isBlank(CMD_ITEM_CODE)) {
                    return modelAction.alertParentInfo((modelAction.getText("物料编码不能为空")));
                }
                Object CMD_POINT_NUM = map.get("CMD_POINT_NUM");// 点数
                if (StringUtils.isBlank(CMD_POINT_NUM)) {
                    return modelAction.alertParentInfo((modelAction.getText("点数数量不能为空")));
                }
        /*double douNumber1=Double.parseDouble(CMD_POINT_NUM.toString());
        int i = (new Double(douNumber1)).intValue();
        String a = i+"";*/
                if (!StringUtils.isNumeric(CMD_POINT_NUM.toString())) {
                    return modelAction.alertParentInfo((modelAction.getText("点数数量只能为数字")));
                    //return modelAction.alertParentInfo((modelAction.getText(a)));
                }
                // Object CMD_FEEDER_SPEC = map.get("CMD_FEEDER_SPEC");// feeder规格
                Object CMD_TRY_FLAG = map.get("CMD_TRY_FLAG");// TRY盘物料
                if (StringUtils.isBlank(CMD_TRY_FLAG)) {
                    return modelAction.alertParentInfo((modelAction.getText("TRY盘物料不能为空")));
                }
                if (CMD_TRY_FLAG.toString().trim().equals("是")) {
                    CMD_TRY_FLAG = "Y";
                }
                if (CMD_TRY_FLAG.toString().trim().equals("否")) {
                    CMD_TRY_FLAG = "N";
                }
                map.put("CMD_TRY_FLAG", CMD_TRY_FLAG);
                if (bomFlag) {
                    sql = "select * from T_CO_BOM_DETAIL t " +
                            " left join T_CO_BOM t1 on t.CB_BOMID=t1.ID " +
                            " where t1.CB_ITEM_CODE=? and t.CBD_ITEM_CODE=? and t1.CB_DEFAULT=?";
                    sList = modelService.listDataSql(sql, new Object[]{modelCode, CMD_ITEM_CODE, "Y"});

                    if (sList != null && !sList.isEmpty()) {
                        map.put("CMD_BOM_FLAG", "Y");
                    } else {
                        map.put("CMD_BOM_FLAG", "N");
                    }
                }

                // Object CMD_MEMO = map.get("CMD_MEMO");//备注
                resData.add(map);
            }
            if (resData == null || resData.isEmpty()) {
                return modelAction.alertParentInfo((modelAction.getText("未找到对应设备的有效数据")));

            }

        } catch (Exception e) {
            log.error("", e);
            return modelAction.alertParentInfo((modelAction.getText("文件格式不正确")));
        }
        return addParentData(modelAction, CommMethod.bean2Json(resData));
        // return modelAction.ActionForward("/buss/msbg/materialTable/materialTableAdd.jsp");
    }

    private String checkDevice(JSONArray deviceArr, String machine) {
        Map<String, Object> dmap = new HashMap<String, Object>();
        for (int i = 0; i < deviceArr.size(); i++) {
            dmap = (Map<String, Object>) deviceArr.get(i);
            if (StringUtils.isNotBlank(machine)) {
                if (machine.equals(dmap.get("CD_DEVICE_SN")))
                    return StringUtils.toString(dmap.get("CAD_DEVICE_SEQUENCE"));
            }
        }
        return "";
     }

    public String addParentData(ModelAction modelAction, String jsonData) {
        StringBuffer content = new StringBuffer();
        content.append("<script>");
        //content.append("try{");
        content.append("window.parent.addParentData('");
        content.append(jsonData);
        content.append("');");
        //content.append("}catch(e){alert(\"");
        //content.append("ERROR");
        //content.append("\");}");
        content.append("</script>");
        modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
        return null;
    }

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
                    //读取每一行的具体数据  从第三行开始
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
                    //读取xrow 从第三行开始
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