package com.more.mes.common.method;
import java.awt.Color;  
import java.awt.Font;  
import java.awt.FontMetrics;  
import java.awt.Graphics;  
import java.awt.image.BufferedImage;  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.OutputStream;  
import java.util.ArrayList;  
import java.util.Calendar;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;  
import java.util.Map;
import org.jbarcode.JBarcode;  
import org.jbarcode.JBarcodeFactory;  
import org.jbarcode.encode.CodabarEncoder;
import org.jbarcode.encode.Code11Encoder;
import org.jbarcode.encode.Code128Encoder;  
import org.jbarcode.encode.Code39Encoder;
import org.jbarcode.encode.Code39ExtEncoder;
import org.jbarcode.encode.EAN13Encoder;
import org.jbarcode.encode.EAN8Encoder;
import org.jbarcode.encode.InvalidAtributeException;  
import org.jbarcode.encode.MSIPlesseyEncoder;
import org.jbarcode.encode.Standard2of5Encoder;
import org.jbarcode.encode.UPCAEncoder;
import org.jbarcode.encode.UPCEEncoder;
import org.jbarcode.paint.BaseLineTextPainter;
import org.jbarcode.paint.EAN13TextPainter;
import org.jbarcode.paint.EAN8TextPainter;
import org.jbarcode.paint.HeightCodedPainter;
import org.jbarcode.paint.TextPainter;  
import org.jbarcode.paint.UPCATextPainter;
import org.jbarcode.paint.UPCETextPainter;
import org.jbarcode.paint.WideRatioCodedPainter;
import org.jbarcode.paint.WidthCodedPainter;
import org.jbarcode.util.ImageUtil;  
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
/**
 * Description:码制类生成
 * Company: morelean
 * @author hzp
 * @date 2018年5月18日
 * @version 1.0
 */   
    public class JbarcodeUtil {    
        
        //设置条形码高度    
        private static final int BARCODE_HEIGHT = 40;    
        //设置条形码默认分辨率    
        private static final int BARCODE_DPI = ImageUtil.DEFAULT_DPI;    
        //设置条形码字体样式    
        private static final String FONT_FAMILY = "console";    
        //设置条形码字体大小    
        private static final int FONT_SIZE = 15; 
        //设置二维码宽度
       
        //设置条形码文本    
        public static String TEXT = "";    
        //创建jbarcode    
        private static JBarcode jbc = null;   
        
        private static int resultStatus=100;
        
        private static String resultMessage="生成码制成功";
            
        static JBarcode getJBarcode(String codeType) throws InvalidAtributeException {    
        	 jbc = JBarcodeFactory.getInstance().createCode128();   
             jbc.setEncoder(Code128Encoder.getInstance());    
             jbc.setTextPainter(CustomTextPainter.getInstance());    
             jbc.setBarHeight(BARCODE_HEIGHT);    
             jbc.setXDimension(Double.valueOf(0.8).doubleValue());  
             jbc.setShowText(true);    
        return jbc;    
        }    
        
        /**  
         * @descript:生成条形码文件  
         * @param message  条形码内容  
         * @param file   生成文件  
         */    
        public static void createBarcode(String message, File file,String text) {    
            try {    
                FileOutputStream fos = new FileOutputStream(file);    
                //createBarcode(message, fos,text);    
                fos.close();    
            } catch (IOException e) {    
                throw new RuntimeException(e);    
            }    
        }    
        /**
         * 生成条形码方法 
         * @param listData：要生成的数据
         * @param saveUrl：保存的url
         * @return Map:(status:结果状态 100 生成条形码成功 400 生成错误,message:返回信息 result 返回图片路径 )
         */
        public static Map<String, Object> createBarcodeValue(List<Map<String, Object>> listData,String saveUrl,String relativeUrl){
        	Map<String, Object> resultInfoMap=new HashMap<String, Object>();
        	List<Map<String, Object>> listResult=new ArrayList<Map<String, Object>>();//返回的数据
        	if(listData!=null &&listData.size()>0){
        		/**
        		 * 解析数据，生成条形码
        		 */
        		for(int i=0;i<listData.size();i++){
        			Map<String, Object> resultMap=new HashMap<String,Object>();
        			Map<String, Object> map=listData.get(i);
        			String message=map.get("value").toString();
        			long  random=(long)(Math.random()*10000000)+10000000;
        			long timeUrl=Calendar.getInstance().getTimeInMillis();
        			String imgUrl=saveUrl+timeUrl+""+random+".png";//生成条形码存放路径
        			relativeUrl=relativeUrl+timeUrl+""+random+".png";//生成条形码存放路径
        			File file=new File(imgUrl);
        			try {
                		if((!file.exists())&&map.get("codeType")!=null){
                			file.createNewFile();
                			 String codeType= map.get("codeType").toString();
                			 int qrcodeWidth = 100; //二维码默认宽度
	           			     int qrcodeHeight = 100; //二维码默认高度
	           			     if(map.get("width")!=null){
	           					qrcodeWidth=Integer.parseInt(map.get("width").toString());
	           			     }
	           			     if(map.get("height")!=null){
	           					qrcodeHeight=Integer.parseInt(map.get("height").toString());
	           			     }
	           			     resultMap=addTwoDimensionalCode(message,qrcodeWidth,qrcodeHeight,imgUrl,relativeUrl,codeType,map.get("codeId").toString());
	           			     listResult.add(resultMap);
                		}
                		
        			} catch (Exception e) {
        				resultInfoMap.put("status", resultStatus);
        				resultInfoMap.put("message", resultMessage);
        				resultInfoMap.put("result", listResult);
        				return resultInfoMap;
        				
        			}
        		}
        		
        	}else{
        		
        	}
        	resultInfoMap.put("status", resultStatus);
        	resultInfoMap.put("message", "生成码值成功");
			resultInfoMap.put("result", listResult);
        	return resultInfoMap;
        	
        }

    /**
         * @descript:生成条形码并写入指定输出流  
         * @param message   条形码内容  
         * @param os   输出流  
         */    
        public static void createBarcode(String message, OutputStream os,String text,String codeType) {    
            try {    
                //设置条形码文本  
            	
                TEXT=text;  
                jbc=addCodeType(codeType);
                BufferedImage image = jbc.createBarcode(message);    
                ImageUtil.encodeAndWrite(image, ImageUtil.PNG, os, BARCODE_DPI, BARCODE_DPI);    
                os.flush();
            } catch (Exception e) {    
                throw new RuntimeException(e);    
            }    
        }    
        
        /**  
         * 静态内部类  
         * 自定义的 TextPainter， 允许定义字体，大小，文本等  
         * 参考底层实现：BaseLineTextPainter.getInstance()  
         */    
        protected static class CustomTextPainter implements TextPainter {    
           private static CustomTextPainter instance =new CustomTextPainter();    
           public static CustomTextPainter getInstance() {    
                return instance;    
           }    
           public void paintText(BufferedImage barCodeImage, String text, int width) {    
                //绘图    
                Graphics g2d = barCodeImage.getGraphics();    
                //创建字体    
                Font font = new Font(FONT_FAMILY, Font.PLAIN, FONT_SIZE * width);    
                g2d.setFont(font);    
                FontMetrics fm = g2d.getFontMetrics();    
                int height = fm.getHeight();    
                int center = (barCodeImage.getWidth() - fm.stringWidth(text)) / 2;    
                g2d.setColor(Color.WHITE);    
                g2d.fillRect(0, 0, barCodeImage.getWidth(), barCodeImage.getHeight() * 1 / 20);    
                g2d.fillRect(0, barCodeImage.getHeight() - (height * 9 / 10), barCodeImage.getWidth(), (height * 9 / 10));    
                g2d.setColor(Color.BLACK);    
                //绘制文本    
                g2d.drawString(TEXT, 0, 145);    
                //绘制条形码    
                g2d.drawString(text, center, barCodeImage.getHeight() - (height / 10) - 2); 
               
            }    
        }    
        /**
         * 添加码制度
         * @param value 码制
         * @return 
         * @throws InvalidAtributeException 
         */
        public static JBarcode addCodeType(String value) throws InvalidAtributeException{
        	switch (value) {
			case "code11":
				 jbc=JBarcodeFactory.getInstance().createCode11();
	             jbc.setEncoder(Code11Encoder.getInstance()); 
	             jbc.setTextPainter(CustomTextPainter.getInstance());  
	            break;
			case "code93":
				 jbc=JBarcodeFactory.getInstance().createCode39();
	             jbc.setEncoder(Code39ExtEncoder.getInstance()); 
	             jbc.setTextPainter(CustomTextPainter.getInstance());  
	            break;
			case "code128":
				 jbc=JBarcodeFactory.getInstance().createCode128();
	             jbc.setEncoder(Code128Encoder.getInstance()); 
	             jbc.setTextPainter(CustomTextPainter.getInstance());  
	            break;
			case "code39":
				jbc=JBarcodeFactory.getInstance().createCode39();
				jbc.setEncoder(Code39Encoder.getInstance());
				jbc.setPainter(WideRatioCodedPainter.getInstance());
				jbc.setTextPainter(BaseLineTextPainter.getInstance());
				break;
			case "EAN8":
				jbc=JBarcodeFactory.getInstance().createEAN8();
				jbc.setEncoder(EAN8Encoder.getInstance());
				jbc.setPainter(WidthCodedPainter.getInstance());
				jbc.setTextPainter(EAN8TextPainter.getInstance());
				break;
	            
			case "EAN13":
				jbc=JBarcodeFactory.getInstance().createEAN13();
				jbc.setEncoder(EAN13Encoder.getInstance());
				jbc.setPainter(WidthCodedPainter.getInstance());
				jbc.setTextPainter(EAN13TextPainter.getInstance());
				break;
			case "UPCA":
				jbc=JBarcodeFactory.getInstance().createUPCA();
				jbc.setEncoder(UPCAEncoder.getInstance());
				jbc.setPainter(WidthCodedPainter.getInstance());
				jbc.setTextPainter(UPCATextPainter.getInstance());
				break;
	        case "UPCE":
				jbc=JBarcodeFactory.getInstance().createUPCE();
				jbc.setEncoder(UPCEEncoder.getInstance());
				jbc.setTextPainter(UPCETextPainter.getInstance());
				jbc.setPainter(WidthCodedPainter.getInstance());
				break;
			case "Codabar":
				jbc=JBarcodeFactory.getInstance().createCodabar();
				jbc.setEncoder(CodabarEncoder.getInstance());
				jbc.setPainter(WideRatioCodedPainter.getInstance());
				jbc.setTextPainter(BaseLineTextPainter.getInstance());
				
	            break;
			case "MSIPlessey":
				jbc=JBarcodeFactory.getInstance().createMSIPlessey();
				jbc.setEncoder(MSIPlesseyEncoder.getInstance());
		        jbc.setPainter(WidthCodedPainter.getInstance());
		        jbc.setTextPainter(BaseLineTextPainter.getInstance());
		        break;
			case "Standard2of5":
				jbc=JBarcodeFactory.getInstance().createStandard2of5();
				jbc.setEncoder(Standard2of5Encoder.getInstance());
		        jbc.setPainter(WideRatioCodedPainter.getInstance());
		        jbc.setTextPainter(BaseLineTextPainter.getInstance());
		        break;    
			case "Interleaved2of5":
				jbc=JBarcodeFactory.getInstance().createInterleaved2of5();
				jbc.setEncoder(Standard2of5Encoder.getInstance());
		        jbc.setPainter(WideRatioCodedPainter.getInstance());
		        jbc.setTextPainter(BaseLineTextPainter.getInstance());
		        break; 
			case "PostNet":
				jbc=JBarcodeFactory.getInstance().createPostNet();
				jbc.setPainter(HeightCodedPainter.getInstance());
				jbc.setTextPainter(BaseLineTextPainter.getInstance());
				break;  
	        default:
				jbc=JBarcodeFactory.getInstance().createCode128();
	            jbc.setEncoder(Code128Encoder.getInstance()); 
	            jbc.setTextPainter(CustomTextPainter.getInstance());  
				break;
			}
        	 
        	try {
        		jbc.setWideRatio(Double.valueOf(1).doubleValue());// 设置宽度比率
				jbc.setXDimension(Double.valueOf(1).doubleValue());
			} catch (InvalidAtributeException e) {
				e.printStackTrace();
			} // 设置尺寸，大小 密集程度 
        	jbc.setBarHeight(BARCODE_HEIGHT);    
            jbc.setXDimension(Double.valueOf(0.8).doubleValue());  
            jbc.setShowText(true);    
            return jbc;
        }
        /**
         * 添加二维码
         * @param text :文本内容
         * @param width ：宽度
         * @param height:高度
         * @param fileUrl:文件路径
         * @param codeType:条形码类型
         * @param imgId：图片id
         *@return Map imgId:图片id width:图片宽度 height:图片高度; fileUrl:图片路径
		 */
        public static HashMap<String, Object> addTwoDimensionalCode(String text,int width,int height,String fileUrl,String relativeUrl,String codeType,String imgId){
        	  HashMap< String, Object> resultMap=new HashMap<String, Object>();
        	  String format = "png";
        	  Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();  
              hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
              codeType=codeType.toLowerCase();
              if(codeType.contains("128")){
            	  codeType="code128";
              }
              /**
               * 根据codeType设置编码格式
               */
            try {
				BitMatrix bitMatrix = null;
				switch (codeType) {
				case "code39":
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.CODE_39, width, height,hints);
		            break;
				case "code93":
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.CODE_93, width, height,hints);
		            break;
				case "code128":
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.CODE_128, width, height,hints);
		            break;
				case "EAN8":
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.EAN_8, width, height,hints);
		            break;
				case "EAN13":
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.EAN_13, width, height,hints);
		            break;    
				case "UPC_A":
				bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.UPC_A, width, height,hints);
	            	break;  
				case "UPC_E":
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.UPC_E, width, height,hints);
		            break; 
				case "qrcode":
					if(width>height){
						width=height;
					}else{
						height=width;
					}
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height,hints);
		            break;
				case "pdf47":
					bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.PDF_417, width, height,hints);
		            break;
				 default:
					 bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.CODE_128, width, height,hints);	
					break;
				}
				File outputFile = new File(fileUrl); 
				MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);//文件写入地址 
				resultMap.put("imgId", imgId);
				resultMap.put("width", bitMatrix.getWidth());
				resultMap.put("height", bitMatrix.getHeight());
				resultMap.put("fileUrl", relativeUrl);
				resultMap.put("value", text);
				return resultMap;
			} catch (Exception e) {
				e.printStackTrace();
				resultMap.put("imgId", imgId);
				resultMap.put("width", 0);
				resultMap.put("height", 0);
				resultMap.put("fileUrl", relativeUrl);
				resultMap.put("value", text);
				resultStatus=400;
				resultMessage="生成码制失败";
			}
			return resultMap; 
            
         
            
              
        }
        
    }    