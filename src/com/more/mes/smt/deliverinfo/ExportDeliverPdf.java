package com.more.mes.smt.deliverinfo;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.AcroFields;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfCopy;
import com.lowagie.text.pdf.PdfImportedPage;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfStamper;
import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 交付作业----导出pdf
 * @author Administrator
 *
 */
public class ExportDeliverPdf implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataId = request.getParameter("dataId");
		//根据id获取信息
		String sql = "select t.TWD_NO,t.TWD_UNIT,t.TWD_SCLH,t.TWD_CPXH," +
				"t.TWD_NUM,t.TWD_CONTENT,to_char(t.TWD_DELIVER_DATE,'yyyy-MM-dd') TWD_DELIVER_DATE," +
				"t.TWD_QUALITY_NO,t.TWD_MEMO " +
				"from T_WIP_DELIVER t where t.id=? ";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[]{dataId});
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("fill_11",list.get(0).get("TWD_NO"));
        //map.put("fill_12",list.get(0).get("TWD_DELIVER_DATE").toString().split("-")[0]);
        //map.put("fill_13",list.get(0).get("TWD_DELIVER_DATE").toString().split("-")[1]);
        //map.put("fill_14",list.get(0).get("TWD_DELIVER_DATE").toString().split("-")[2]);
        map.put("fill_1",list.get(0).get("TWD_UNIT"));
        map.put("fill_2",list.get(0).get("TWD_SCLH"));
        map.put("fill_3",list.get(0).get("TWD_CPXH"));
        //map.put("fill_4","12-5");
        map.put("fill_5",list.get(0).get("TWD_NUM"));
        map.put("fill_6",list.get(0).get("TWD_CONTENT"));
        map.put("fill_7",list.get(0).get("TWD_QUALITY_NO"));
        if(StringUtils.isNotBlank(list.get(0).get("TWD_MEMO"))){
        	map.put("fill_10",list.get(0).get("TWD_MEMO"));
        }else{
        	map.put("fill_10","");
        }
        
        Map<String,Object> o=new HashMap<String,Object>();
        o.put("datemap",map);
        pdfout(o,modelAction);
        Map<String,Object> map1=new HashMap<String,Object>();
        map1.put("newPath", "up_load/deliverExport.pdf");
        map1.put("name", list.get(0).get("TWD_NO"));
        modelAction.setAjaxMap(map1);
		return BaseActionSupport.AJAX;
	}
	
	// 利用模板生成pdf  
    @SuppressWarnings("unchecked")
	public static void pdfout(Map<String,Object> o,ModelAction modelAction) {
        // 模板路径  
        //String templatePath = "C:/testpdf126.pdf";
        // 生成的新文件路径  
        //String newPDFPath = "C:/testout1.pdf";
        // 模板路径  
        String templatePath = modelAction.getRequest().getSession().getServletContext().getRealPath(
    			"plf/template/deliver.pdf");
        // 生成的新文件路径  
        String newPDFPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
    			"up_load/deliverExport.pdf");
        File file = new File(newPDFPath);
    	if(file.exists()){ 
    		file.delete();
    	}
        PdfReader reader;
        FileOutputStream out;
        ByteArrayOutputStream bos;
        PdfStamper stamper;
        try {
            BaseFont bf = BaseFont.createFont("c://windows//fonts//simsun.ttc,1" , BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font FontChinese = new Font(bf, 5, Font.NORMAL);
            out = new FileOutputStream(newPDFPath);// 输出流
            reader = new PdfReader(templatePath);// 读取pdf模板  
            bos = new ByteArrayOutputStream();
            stamper = new PdfStamper(reader, bos);
            AcroFields form = stamper.getAcroFields();
            //文字类的内容处理
            Map<String,Object> datemap = (Map<String,Object>)o.get("datemap");
            form.addSubstitutionFont(bf);
            for(String key : datemap.keySet()){
                String value = datemap.get(key).toString();
                form.setField(key,value);
            }
            
            stamper.setFormFlattening(true);// 如果为false，生成的PDF文件可以编辑，如果为true，生成的PDF文件不可以编辑
            stamper.close();
            Document doc = new Document();
            Font font = new Font(bf, 32);
            PdfCopy copy = new PdfCopy(doc, out);
            doc.open();
            PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()), 1);
            copy.addPage(importPage);
            doc.close();

        } catch (IOException e) {
            System.out.println(e);
        } catch (DocumentException e) {
            System.out.println(e);
        }

    }

}
