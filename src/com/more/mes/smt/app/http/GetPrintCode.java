/*
 * @File GetPrintCode.java
 * @Package com.more.mes.smt.app.http
 * @Copyinght Copyright (c) 2017
 * @Company morelean
 * @author hxh
 * @date 2017-10-09 下午15:29:59
 * @version V1.0
 */

package com.more.mes.smt.app.http;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

/**
 * @Title APP打印代码
 * @Description 〈功能详细描述〉
 * @ClassName GetPrintCode
 * @author hxh
 * @version 1.0 developer 2017-10-09 created
 * @see MonitorLineSetting
 * @since 2017-10-09
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */

public class GetPrintCode extends InterfaceLog implements IhttpServiceJosn
{

  /**
   * @param arg0
   * @param arg1
   * @return
   * @see com.more.fw.core.dbo.model.dao.BaseDao#find(java.lang.String, java.lang.Object[])
   */
  public List find(String arg0, Object... arg1)
  {
    // TODO Auto-generated method stub
    return null;
  }

  /**
   * @param arg0
   * @param arg1
   * @param arg2
   * @return
   * @see com.more.fw.core.dbo.model.dao.BaseDao#find(org.springframework.orm.hibernate3.HibernateTemplate,
   *      java.lang.String, java.lang.Object[])
   */
  public List find(HibernateTemplate arg0, String arg1, Object... arg2)
  {
    // TODO Auto-generated method stub
    return null;
  }

  /**
   * @param arg0
   * @return
   * @see com.more.fw.http.service.IhttpServiceJosn#exeFunc(com.more.fw.http.service.HttpCoreService)
   */
  @Override
  public String exeFunc(HttpCoreService service)
  {
    // TODO Auto-generated method stub
    StringBuffer sb = new StringBuffer();
    try
    {
      sb.append("zpBluetoothPrinter zpSDK = new zpBluetoothPrinter(this);\n")
      .append("zpBluetoothPrinter zpSDK = new zpBluetoothPrinter(this);\n")
      .append("zpSDK.connect(BDAddress);\n")
      .append("Resources res = getResources();\n")
      .append("InputStream is = res.openRawResource(R.drawable.abc);\n")
      .append("BitmapDrawable bmpDraw = new BitmapDrawable(is);\n")
      .append("Bitmap bmp = bmpDraw.getBitmap();\n")
      .append("zpSDK.pageSetup(560, 420);\n")
      .append("zpSDK.drawQrCode(5, 5, \"12345678901234567\", 0, 2, 0);\n")
      .append("zpSDK.drawText(200, 10 , \"QTY   15000\", 3, 0, 1, false, false);\n")
      .append("zpSDK.drawBarCode(150, 40, \"12345678901234567\", 128, false, 2, 35);\n")
      .append("zpSDK.drawText(500, 40 , \"0016\", 2, 0, 0, false, false);\n")
      .append("zpSDK.drawText(500, 65 , \"37\", 2, 0, 0, false, false);\n")
      .append("zpSDK.drawText(200, 80 , \"(1T)\", 1, 0, 0, false, false);\n")
      .append("zpSDK.drawText(205, 95 , \"B/N\", 1, 0, 0, false, false);\n")
      .append("zpSDK.drawText(280, 85 , \" 89E2619047\", 3, 0, 1, false, false);\n")
      .append("zpSDK.drawBarCode(150, 110, \"12345678901234567\", 128, false, 3, 40);\n")
      .append("zpSDK.drawText(10, 160 , \" (30P)\", 2, 0, 0, false, false);\n")
      .append("zpSDK.drawText(20, 185 , \" CTC\", 2, 0, 0, false, false);\n")
      .append("zpSDK.drawText(80, 185 , \" C\", 3, 0, 1, false , false);\n")
      .append("zpSDK.drawText(110, 160 , \" 0201\", 4, 0, 1, false, false);\n")
      .append("zpSDK.drawText(220, 185 , \" KR\", 3 , 0, 0, false, false);\n")
      .append("zpSDK.drawText(290, 160 , \"X5R\", 4, 0, 1, false, false);\n")
      .append("zpSDK.drawText(380, 185 , \"5BB\", 3, 0, 0, false, false);\n")
      .append("zpSDK.drawText(450, 160 , \"104\", 4, 0, 1, false, false);\n")
      .append("zpSDK.drawLine(5, 10, 240, 500, 240, true);\n")
      .append("zpSDK.print(0, 0);\n")
      .append("zpSDK.disconnect();\n");

      service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
      service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
      service.getResponse().setHeader("Access-Control-Allow-Headers", "*");
      JSONObject json = JSONObject.fromObject("{\"code\":\"aaaaaaaaaaaaaaaa\"}");

      return json.toString();

    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
      service.getDit().put("dataList", e);
      //throw new BussException(service.getText("监控参数" + optName + "失败"), e);
    }

    return null;
  }

}
