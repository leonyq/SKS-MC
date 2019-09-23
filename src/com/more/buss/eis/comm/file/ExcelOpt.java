package com.more.buss.eis.comm.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.more.fw.core.dbo.model.service.ModelService;
//is_dels
public class ExcelOpt {
	

	@SuppressWarnings("deprecation")
	public List<Map<String, String>> readExcel(ModelAction modelaction, ModelService modelservice) {
		int totalrow,totalcells;
		File f;
		HSSFWorkbook wk;
		HSSFSheet sheet;
		HSSFRow row_zero,row;
		HSSFCell cell_zero,cell;
		XSSFWorkbook xwk;
		XSSFSheet xsheet;
		XSSFRow xrow_zero,xrow;
		XSSFCell xcell_zero,xcell;
		
		ArrayList<Map<String, String>> datalist= new ArrayList<Map<String, String>>();
		ArrayList<String> keylist = new ArrayList<String>();
		InputStream input = null;
		String key = new String();
		String value = new String();
		Map<String, String> map; 
 		f = modelaction.getUpFile();
 		String suffix = modelaction.getUpFileFileName();
 		int l =suffix.length();
 		String str = suffix.substring(suffix.lastIndexOf("."),l);		
		try {
			input = new FileInputStream(f);//将获取的文件转化为流
			if(str.equals(".xls")){//判断文件类型，当文件类型为。xls时
				wk = new HSSFWorkbook(input);
				for(int numsheet=0;numsheet<wk.getNumberOfSheets();numsheet++){
					sheet = wk.getSheetAt(numsheet);
					if(sheet == null){
						continue;
					}				
					totalrow = sheet.getLastRowNum();
					//读取第一行的key值
					row_zero = sheet.getRow(0);
					if(row_zero!=null){
	                totalcells = row_zero.getLastCellNum();
		                for(short c_0=0;c_0<totalcells;c_0++){
		                	cell_zero = row_zero.getCell(c_0);
		                	key = cell_zero.toString();//key
		                	keylist.add(key);
		                }
					}
					//读取每一行的具体数据  从第三行开始
		            for(int rowNum=2;rowNum<totalrow+1;rowNum++){
		            	map = new HashMap<String, String>();
		            	row = sheet.getRow(rowNum);
		            	if(row!=null){
		            		
		            		totalcells = row.getLastCellNum();
		            		//读取列 从第一列开始
		            		for(short c=0;c<totalcells;c++){
		            			cell = row.getCell(c);
		            			if(cell!=null){
		            				value = cell.toString();//value	
		            			}else{
		            				value = "null";
		            			}
		            			map.put(keylist.get(c), value);	
		            		}
		            		datalist.add(map);
		            	}	
		            }
				}	
			}else if(str.equals(".xlsx")){
				xwk = new XSSFWorkbook(input);
				for(int numsheet=0;numsheet<xwk.getNumberOfSheets();numsheet++){
					xsheet = xwk.getSheetAt(numsheet);
					if(xsheet == null){
						continue;
					}				
					totalrow = xsheet.getLastRowNum();
					//读取第一行的key值
					xrow_zero = xsheet.getRow(0);
					if(xrow_zero!=null){
	                totalcells = xrow_zero.getLastCellNum();
		                for(short c_0=0;c_0<totalcells;c_0++){
		                	xcell_zero = xrow_zero.getCell(c_0);
		                	key = xcell_zero.toString();//key
		                	keylist.add(key);
		                }
					}
					//读取xrow 从第三行开始
		            for(int rowNum=2;rowNum<totalrow+1;rowNum++){
		            	map = new HashMap<String, String>();
		            	xrow = xsheet.getRow(rowNum);
		            	if(xrow!=null){
		            		
		            		totalcells = xrow.getLastCellNum();
		            		//读取列 从第一列开始
		            		for(short c=0;c<totalcells;c++){
		            			xcell = xrow.getCell(c);
		            			if(xcell!=null){
		            				value = xcell.toString();//value	
		            			}else{
		            				value = "null";
		            			}
		            			map.put(keylist.get(c), value);	
		            		}
		            		datalist.add(map);
		            		
		            	}	
		            }
				}	
				
			}else{
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
