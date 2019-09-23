package com.morelean.aisino.basedata;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hsqldb.lib.StringUtil;

import com.more.fw.core.common.method.CommMethod;

/**
 * 操作Excel通用类
 *
 * @author development
 */
public class ExcelOperator {
    private final Log log = LogFactory.getLog(this.getClass());
    private HSSFWorkbook _workBook;
    public int pageSize = 80000;
    public Map<String, Map<String, String>> mHeadMap;

    public ExcelOperator(String FormId) {
        //this.headList = com.morelean.aisino.common.AisinoMethod.getInstance().getFormModelColFid(FormId);
        //this.headList=com.more.mes.other.common.method.CommonMethod631.getFormModelColFid(FormId);
    }

    public HSSFWorkbook getWorkBook() {
        return _workBook;
    }

    public ExcelOperator() {

    }


    public HSSFWorkbook convertToExcel(Map<String, List<Map>> mapList) {
        // 创建HSSFWorkbook对象(excel的文档对象)
        HSSFWorkbook wkb = new HSSFWorkbook();
        // = wkb.createSheet();
        // 字体样式
        // XSSFFont columnFont = wkb.createFont();
        // columnFont.setFontName("宋体");
        // columnFont.setFontHeightInPoints((short) 10);
        // columnFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // // 列头的样式
        // XSSFCellStyle columnHeadStyle = wkb.createCellStyle();
        // columnHeadStyle.setFont(columnFont);
        // columnHeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
        // columnHeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//
        // 上下居中
        // // columnHeadStyle.setLocked(true);
        // // columnHeadStyle.setWrapText(true);
        // columnHeadStyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色
        // columnHeadStyle.setBorderLeft((short) 1);// 边框的大小
        // columnHeadStyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色
        // columnHeadStyle.setBorderRight((short) 1);// 边框的大小
        // columnHeadStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); //
        // 设置单元格的边框为粗体
        // columnHeadStyle.setBottomBorderColor(HSSFColor.BLACK.index); //
        // 设置单元格的边框颜色
        // columnHeadStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        // columnHeadStyle.setFillBackgroundColor(HSSFColor.PALE_BLUE.index); //
        // 设置单元格的背景颜色．
        //
        // // 普通单元格样式
        // XSSFCellStyle columnStyle = wkb.createCellStyle();
        // columnStyle.setFont(columnFont);
        // columnStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 左右居中
        // columnStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);// 上下居中
        // columnStyle.setWrapText(true);
        // columnStyle.setLeftBorderColor(HSSFColor.BLACK.index);
        // columnStyle.setBorderLeft((short) 1);
        // columnStyle.setRightBorderColor(HSSFColor.BLACK.index);
        // columnStyle.setBorderRight((short) 1);
        // columnStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); //
        // 设置单元格的边框为粗体
        // columnStyle.setBottomBorderColor(HSSFColor.BLACK.index); //
        // 设置单元格的边框颜色．
        // columnStyle.setFillForegroundColor(HSSFColor.WHITE.index);//
        // 设置单元格的背景颜色．
        for (Map.Entry<String, List<Map>> entry : mapList.entrySet()) {
            //System.out.println(entry.getKey() + ":" + entry.getValue());
            HSSFSheet sheet = null;
            String tableName = entry.getKey();
            List<Map> resList = entry.getValue();
            int total_count = resList.size();
            for (int index = 0; index < total_count; index++) {
                Map<String, Object> map = resList.get(index);
                int s_index = index % pageSize;
                if (s_index == 0) {
                    sheet = wkb.createSheet(tableName);
                }
                HSSFRow row = sheet.createRow(s_index + 1);
                int i = 0;
                for (String s : map.keySet()) {
                    if (s_index == pageSize - 1 || index == total_count - 1) {
                        sheet.autoSizeColumn(i);
                    }
                    if (s_index == 0) {
                        HSSFRow hdrow = sheet.getRow(0);
                        if (hdrow == null) {
                            hdrow = sheet.createRow(0);
                        }
                        // hdrow.createCell(i).setCellStyle(columnHeadStyle);
                        hdrow.createCell(i).setCellValue(getColumnText(s, tableName));
                    }
                    // row.createCell(i).setCellStyle(columnStyle);
                    row.createCell(i).setCellValue(map.get(s) == null ? "" : map.get(s).toString());
                    i++;
                }
            }
        }


        _workBook = wkb;
        return wkb;
    }

    public void downLoadExcel(HttpServletResponse response, Map<String, List<Map>> resList) throws Exception {
        downLoadExcel(response, resList, "");
    }

    public void downLoadExcel(HttpServletResponse response, Map<String, List<Map>> resList, String fileName) throws Exception {
        try {
            fileName = StringUtil.isEmpty(fileName) ? "exportExcel" : fileName;
            convertToExcel(resList);
            OutputStream output = response.getOutputStream();
            response.reset();
            response.setHeader("Content-disposition",
                    "attachment; filename=" + java.net.URLEncoder.encode(fileName, "UTF-8") + ".xls");

            response.setContentType("application/msexcel");
            _workBook.write(output);
            output.close();

        } catch (IOException e) {
            log.error(e);
            throw new Exception(CommMethod.getText("导出异常") + ":" + e.getMessage());
        }
    }

    //获取表头描述
    private String getColumnText(String columnName, String tableName) {
        if (mHeadMap != null) {
            Map headMap = mHeadMap.get(tableName);
            if (headMap != null && headMap.size() > 0) {
                if (headMap.get(columnName) != null) {
                    return headMap.get(columnName).toString();
                }
            }
        }
        return columnName;
    }
}
