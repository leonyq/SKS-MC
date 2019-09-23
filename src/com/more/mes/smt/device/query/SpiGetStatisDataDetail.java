package com.more.mes.smt.device.query;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.lang.StringUtils;

/**
 * 获取SPI测试统计详情数据
 *
 * @author development
 */
public class SpiGetStatisDataDetail implements FuncService {

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String moNumber = request.getParameter("mo_number");
        String inspectatBegin = request.getParameter("inspectat_begin");
        String inspectatEnd = request.getParameter("inspectat_end");
        String areaName = request.getParameter("area_name");
        String programName = request.getParameter("program_name");
        String result = request.getParameter("result");
        Map<String, Object> paraMap = new HashMap<String, Object>();
        String sql = "SELECT ID FROM T_DEVICE_SPI_RESULT WHERE 1=1 ";

        String where = "";
        if (!StringUtils.isBlank(moNumber)) {
            where += " AND MO_NUMBER= :MO_NUMBER ";
            paraMap.put("MO_NUMBER", moNumber);
        }
        if (!StringUtils.isBlank(inspectatBegin) && !StringUtils.isBlank(inspectatEnd)) {
            where += " AND INSPECTAT >=TO_DATE( :INSPECTAT_BEGIN ,'yyyy-mm-dd hh24:mi:ss') AND INSPECTAT<=TO_DATE( :INSPECTAT_END ,'yyyy-mm-dd hh24:mi:ss')";
            paraMap.put("INSPECTAT_BEGIN", inspectatBegin);
            paraMap.put("INSPECTAT_END", inspectatEnd);
        }
        if (!StringUtils.isBlank(areaName)) {
            where += " AND AREA_NAME= :AREA_NAME ";
            paraMap.put("AREA_NAME", areaName);
        }
        if (!StringUtils.isBlank(programName)) {
            where += " AND PROGRAMNAME= :PROGRAMNAME ";
            paraMap.put("PROGRAMNAME", programName);
        }
        if (!StringUtils.isBlank(result)) {
            where += " AND RESULTINFILENAME= :RESULTINFILENAME ";
            paraMap.put("RESULTINFILENAME", result);
        }
        sql = sql + where;
        String exeSql = "WITH T1 AS\n" +
                    " (SELECT NVL(AVG(CASE\n" +
                    "                   WHEN AREA_RESULT <> '-' THEN\n" +
                    "                    AREA_VALUE\n" +
                    "                   ELSE\n" +
                    "                    NULL\n" +
                    "                 END),\n" +
                    "             0) AREA_AVG,\n" +
                    "         NVL(AVG(CASE\n" +
                    "                   WHEN HEIGHT_RESULT <> '-' THEN\n" +
                    "                    HEIGHT_VALUE\n" +
                    "                   ELSE\n" +
                    "                    NULL\n" +
                    "                 END),\n" +
                    "             0) HEIGHT_AVG,\n" +
                    "         NVL(AVG(CASE\n" +
                    "                   WHEN VOLUME_RESULT <> '-' THEN\n" +
                    "                    VOLUME_VALUE\n" +
                    "                   ELSE\n" +
                    "                    NULL\n" +
                    "                 END),\n" +
                    "             0) VOLUME_AVG,\n" +
                    "         NVL(AVG(CASE\n" +
                    "                   WHEN NOPASTE_RESULT <> '-' THEN\n" +
                    "                    NOPASTE_VALUE\n" +
                    "                   ELSE\n" +
                    "                    NULL\n" +
                    "                 END),\n" +
                    "             0) NOPASTE_AVG,\n" +
                    "         NVL(AVG(CASE\n" +
                    "                   WHEN SHARP2D_RESULT <> '-' THEN\n" +
                    "                    SHARP2D_VALUE\n" +
                    "                   ELSE\n" +
                    "                    NULL\n" +
                    "                 END),\n" +
                    "             0) SHARP2D_AVG,\n" +
                    "         NVL(AVG(CASE\n" +
                    "                   WHEN SHARP3D_RESULT <> '-' THEN\n" +
                    "                    SHARP3D_VALUE\n" +
                    "                   ELSE\n" +
                    "                    NULL\n" +
                    "                 END),\n" +
                    "             0) SHARP3D_AVG\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)),\n" +
                    "T2 AS\n" +
                    " (SELECT NVL(MAX(AREA_NGLOWERLIMIT), 0) AREA_NGLOWERLIMIT,\n" +
                    "         NVL(MAX(AREA_NGUPPERLIMIT), 0) AREA_NGUPPERLIMIT,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN AREA_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) AREA_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN AREA_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) AREA_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN AREA_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) AREA_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SQRT(SUM(POWER(AREA_VALUE - AREA_AVG, 2)) /\n" +
                    "                  (SUM(CASE\n" +
                    "                         WHEN AREA_RESULT <> '-' THEN\n" +
                    "                          1\n" +
                    "                         ELSE\n" +
                    "                          0\n" +
                    "                       END) - 1)),\n" +
                    "             0) AREA_SIGMA,\n" +
                    "         NVL(AVG(AREA_AVG), 0) AREA_AVG,\n" +
                    "         NVL(MAX(AREA_WARNLOWERLIMIT), 0) AREA_WARNLOWERLIMIT,\n" +
                    "         NVL(MAX(AREA_WARNUPPERLIMIT), 0) AREA_WARNUPPERLIMIT,\n" +
                    "         \n" +
                    "         NVL(MAX(HEIGHT_NGLOWERLIMIT), 0) HEIGHT_NGLOWERLIMIT,\n" +
                    "         NVL(MAX(HEIGHT_NGUPPERLIMIT), 0) HEIGHT_NGUPPERLIMIT,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN HEIGHT_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) HEIGHT_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN HEIGHT_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) HEIGHT_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN HEIGHT_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) HEIGHT_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SQRT(SUM(POWER(HEIGHT_VALUE - HEIGHT_AVG, 2)) /\n" +
                    "                  (SUM(CASE\n" +
                    "                         WHEN HEIGHT_RESULT <> '-' THEN\n" +
                    "                          1\n" +
                    "                         ELSE\n" +
                    "                          0\n" +
                    "                       END) - 1)),\n" +
                    "             0) HEIGHT_SIGMA,\n" +
                    "         NVL(AVG(HEIGHT_AVG), 0) HEIGHT_AVG,\n" +
                    "         NVL(MAX(HEIGHT_WARNLOWERLIMIT), 0) HEIGHT_WARNLOWERLIMIT,\n" +
                    "         NVL(MAX(HEIGHT_WARNUPPERLIMIT), 0) HEIGHT_WARNUPPERLIMIT,\n" +
                    "         \n" +
                    "         NVL(MAX(VOLUME_NGLOWERLIMIT), 0) VOLUME_NGLOWERLIMIT,\n" +
                    "         NVL(MAX(VOLUME_NGUPPERLIMIT), 0) VOLUME_NGUPPERLIMIT,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN VOLUME_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) VOLUME_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN VOLUME_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) VOLUME_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN VOLUME_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) VOLUME_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SQRT(SUM(POWER(VOLUME_VALUE - VOLUME_AVG, 2)) /\n" +
                    "                  (SUM(CASE\n" +
                    "                         WHEN VOLUME_RESULT <> '-' THEN\n" +
                    "                          1\n" +
                    "                         ELSE\n" +
                    "                          0\n" +
                    "                       END) - 1)),\n" +
                    "             0) VOLUME_SIGMA,\n" +
                    "         NVL(AVG(VOLUME_AVG), 0) VOLUME_AVG,\n" +
                    "         NVL(MAX(VOLUME_WARNLOWERLIMIT), 0) VOLUME_WARNLOWERLIMIT,\n" +
                    "         NVL(MAX(VOLUME_WARNUPPERLIMIT), 0) VOLUME_WARNUPPERLIMIT,\n" +
                    "         \n" +
                    "         NVL(MAX(NOPASTE_NGUPPERLIMIT), 0) NOPASTE_NGUPPERLIMIT,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN NOPASTE_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) NOPASTE_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN NOPASTE_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) NOPASTE_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN NOPASTE_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) NOPASTE_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SQRT(SUM(POWER(NOPASTE_VALUE - NOPASTE_AVG, 2)) /\n" +
                    "                  (SUM(CASE\n" +
                    "                         WHEN NOPASTE_RESULT <> '-' THEN\n" +
                    "                          1\n" +
                    "                         ELSE\n" +
                    "                          0\n" +
                    "                       END) - 1)),\n" +
                    "             0) NOPASTE_SIGMA,\n" +
                    "         NVL(AVG(NOPASTE_AVG), 0) NOPASTE_AVG,\n" +
                    "         NVL(MAX(NOPASTE_WARNUPPERLIMIT), 0) NOPASTE_WARNUPPERLIMIT,\n" +
                    "         \n" +
                    "         NVL(MAX(SHARP2D_NGUPPERLIMIT), 0) SHARP2D_NGUPPERLIMIT,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN SHARP2D_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) SHARP2D_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN SHARP2D_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) SHARP2D_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN SHARP2D_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) SHARP2D_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SQRT(SUM(POWER(SHARP2D_VALUE - SHARP2D_AVG, 2)) /\n" +
                    "                  (SUM(CASE\n" +
                    "                         WHEN SHARP2D_RESULT <> '-' THEN\n" +
                    "                          1\n" +
                    "                         ELSE\n" +
                    "                          0\n" +
                    "                       END) - 1)),\n" +
                    "             0) SHARP2D_SIGMA,\n" +
                    "         NVL(AVG(SHARP2D_AVG), 0) SHARP2D_AVG,\n" +
                    "         \n" +
                    "         NVL(MAX(SHARP3D_NGUPPERLIMIT), 0) SHARP3D_NGUPPERLIMIT,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN SHARP3D_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) SHARP3D_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN SHARP3D_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) SHARP3D_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN SHARP3D_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) SHARP3D_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SQRT(SUM(POWER(SHARP3D_VALUE - SHARP3D_AVG, 2)) /\n" +
                    "                  (SUM(CASE\n" +
                    "                         WHEN SHARP3D_RESULT <> '-' THEN\n" +
                    "                          1\n" +
                    "                         ELSE\n" +
                    "                          0\n" +
                    "                       END) - 1)),\n" +
                    "             0) SHARP3D_SIGMA,\n" +
                    "         NVL(AVG(SHARP3D_AVG), 0) SHARP3D_AVG,\n" +
                    "         \n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN VOLUME_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) CROSS_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN VOLUME_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) CROSS_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN VOLUME_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) CROSS_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN RISE_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) RISE_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN RISE_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) RISE_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN RISE_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) RISE_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN OFFSETY_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) OFFSETY_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN OFFSETY_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) OFFSETY_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN OFFSETY_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) OFFSETY_OK_NUM,\n" +
                    "         \n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN OFFSETX_RESULT = 'NG' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) OFFSETX_NG_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN OFFSETX_RESULT = 'WN' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) OFFSETX_WN_NUM,\n" +
                    "         NVL(SUM(CASE\n" +
                    "                   WHEN OFFSETX_RESULT = 'OK' THEN\n" +
                    "                    1\n" +
                    "                   ELSE\n" +
                    "                    0\n" +
                    "                 END),\n" +
                    "             0) OFFSETX_OK_NUM\n" +
                    "  \n" +
                    "    FROM T1\n" +
                    "    JOIN T_DEVICE_SPI_RESULT_LIST\n" +
                    "      ON 1 = 1\n" +
                    "   WHERE RESULT_ID IN (?)),\n" +
                    "T3 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '[' || TO_CHAR(AREA_VALUE, 'fm9990.0') || ',' || COUNT(1) || ']' || ',' WELLFORMED) ORDER BY AREA_VALUE)\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' AREA_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND AREA_RESULT <> '-'\n" +
                    "   GROUP BY AREA_VALUE),\n" +
                    "T4 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '[' || TO_CHAR(VOLUME_VALUE, 'fm9990.0') || ',' || COUNT(1) || ']' || ',' WELLFORMED) ORDER BY VOLUME_VALUE)\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' VOLUME_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND VOLUME_RESULT <> '-'\n" +
                    "   GROUP BY VOLUME_VALUE),\n" +
                    "T5 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '[' || TO_CHAR(HEIGHT_VALUE, 'fm9990.0') || ',' || COUNT(1) || ']' || ',' WELLFORMED) ORDER BY HEIGHT_VALUE)\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' HEIGHT_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND HEIGHT_RESULT <> '-'\n" +
                    "   GROUP BY HEIGHT_VALUE),\n" +
                    "T6 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '[' || TO_CHAR(NOPASTE_VALUE, 'fm9990.0') || ',' || COUNT(1) || ']' || ',' WELLFORMED) ORDER BY NOPASTE_VALUE)\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' NOPASTE_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND NOPASTE_RESULT <> '-'\n" +
                    "   GROUP BY NOPASTE_VALUE),\n" +
                    "T7 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT TO_CHAR(CROSS_VALUE, 'fm9990.0') || ',' WELLFORMED))\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' CROSS_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND CROSS_RESULT <> '-'),\n" +
                    "T8 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT TO_CHAR(RISE_VALUE, 'fm9990.0') || ',' WELLFORMED))\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' RISE_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND RISE_RESULT <> '-'),\n" +
                    "T9 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '\\' || BRIDGE || '\\' || ',' WELLFORMED))\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' BRIDGE\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND BRIDGE <> '-'),\n" +
                    "T10 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '[' || OFFSETX_VALUE || ',' || OFFSETY_VALUE || ',''' || (CASE\n" +
                    "                        WHEN OFFSETX_RESULT = 'NG' OR OFFSETY_RESULT = 'NG' THEN\n" +
                    "                         'NG'\n" +
                    "                        WHEN OFFSETX_RESULT = 'WN' OR OFFSETY_RESULT = 'WN' THEN\n" +
                    "                         'WN'\n" +
                    "                        ELSE\n" +
                    "                         'OK'\n" +
                    "                      END) || '''' || ']' || ',' WELLFORMED)).GETCLOBVAL(),\n" +
                    "                      ',') || ']' OFFSET_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND OFFSETY_RESULT <> '-'\n" +
                    "     AND OFFSETX_RESULT <> '-'),\n" +
                    "T11 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '[' || TO_CHAR(SHARP2D_VALUE, 'fm9990.0') || ',' || COUNT(1) || ']' || ',' WELLFORMED) ORDER BY SHARP2D_VALUE)\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' SHARP2D_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND SHARP2D_RESULT <> '-'\n" +
                    "   GROUP BY SHARP2D_VALUE),\n" +
                    "T12 AS\n" +
                    " (SELECT '[' || RTRIM(XMLAGG(XMLPARSE(CONTENT '[' || TO_CHAR(SHARP3D_VALUE, 'fm9990.0') || ',' || COUNT(1) || ']' || ',' WELLFORMED) ORDER BY SHARP3D_VALUE)\n" +
                    "                      .GETCLOBVAL(),\n" +
                    "                      ',') || ']' SHARP3D_VALUE_JSON\n" +
                    "    FROM T_DEVICE_SPI_RESULT_LIST\n" +
                    "   WHERE RESULT_ID IN (?)\n" +
                    "     AND SHARP3D_RESULT <> '-'\n" +
                    "   GROUP BY SHARP3D_VALUE),\n" +
                    "T_TOTAL AS\n" +
                    " (SELECT * FROM T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)\n" +
                    "SELECT T_TOTAL.*,\n" +
                    "       (AREA_NGUPPERLIMIT - AREA_NGLOWERLIMIT) / (6 * AREA_SIGMA) AREA_CP,\n" +
                    "       LEAST(AREA_NGUPPERLIMIT - AREA_AVG, AREA_AVG - AREA_NGLOWERLIMIT) /\n" +
                    "       (3 * AREA_SIGMA) AREA_CPK,\n" +
                    "       (HEIGHT_NGUPPERLIMIT - HEIGHT_NGLOWERLIMIT) / (6 * HEIGHT_SIGMA) HEIGHT_CP,\n" +
                    "       LEAST(HEIGHT_NGUPPERLIMIT - HEIGHT_AVG,\n" +
                    "             HEIGHT_AVG - HEIGHT_NGLOWERLIMIT) / (3 * HEIGHT_SIGMA) HEIGHT_CPK,\n" +
                    "       (VOLUME_NGUPPERLIMIT - VOLUME_NGLOWERLIMIT) / (6 * VOLUME_SIGMA) VOLUME_CP,\n" +
                    "       LEAST(VOLUME_NGUPPERLIMIT - VOLUME_AVG,\n" +
                    "             VOLUME_AVG - VOLUME_NGLOWERLIMIT) / (3 * VOLUME_SIGMA) VOLUME_CPK,\n" +
                    "       CASE\n" +
                    "         WHEN NOPASTE_SIGMA > 0 THEN\n" +
                    "          (NOPASTE_NGUPPERLIMIT - 0) / (6 * NOPASTE_SIGMA)\n" +
                    "         ELSE\n" +
                    "          0\n" +
                    "       END NOPASTE_CP,\n" +
                    "       CASE\n" +
                    "         WHEN NOPASTE_SIGMA > 0 THEN\n" +
                    "          LEAST(NOPASTE_NGUPPERLIMIT - NOPASTE_AVG, NOPASTE_AVG - 0) /\n" +
                    "          (3 * NOPASTE_SIGMA)\n" +
                    "         ELSE\n" +
                    "          0\n" +
                    "       END NOPASTE_CPK,\n" +
                    "       CASE\n" +
                    "         WHEN SHARP2D_SIGMA > 0 THEN\n" +
                    "          (SHARP2D_NGUPPERLIMIT - 0) / (6 * SHARP2D_SIGMA)\n" +
                    "         ELSE\n" +
                    "          0\n" +
                    "       END SHARP2D_CP,\n" +
                    "       CASE\n" +
                    "         WHEN SHARP2D_SIGMA > 0 THEN\n" +
                    "          LEAST(SHARP2D_NGUPPERLIMIT - SHARP2D_AVG, SHARP2D_AVG - 0) /\n" +
                    "          (3 * SHARP2D_SIGMA)\n" +
                    "         ELSE\n" +
                    "          0\n" +
                    "       END SHARP2D_CPK,\n" +
                    "       CASE\n" +
                    "         WHEN SHARP3D_SIGMA > 0 THEN\n" +
                    "          (SHARP3D_NGUPPERLIMIT - 0) / (6 * SHARP3D_SIGMA)\n" +
                    "         ELSE\n" +
                    "          0\n" +
                    "       END SHARP3D_CP,\n" +
                    "       CASE\n" +
                    "         WHEN SHARP3D_SIGMA > 0 THEN\n" +
                    "          LEAST(SHARP3D_NGUPPERLIMIT - SHARP3D_AVG, SHARP3D_AVG - 0) /\n" +
                    "          (3 * SHARP3D_SIGMA)\n" +
                    "         ELSE\n" +
                    "          0\n" +
                    "       END SHARP3D_CPK,\n" +
                    "       AREA_NG_NUM + AREA_WN_NUM + AREA_OK_NUM AREA_TOTAL_NUM,\n" +
                    "       HEIGHT_NG_NUM + HEIGHT_WN_NUM + HEIGHT_OK_NUM HEIGHT_TOTAL_NUM,\n" +
                    "       VOLUME_NG_NUM + VOLUME_WN_NUM + VOLUME_OK_NUM VOLUME_TOTAL_NUM,\n" +
                    "       NOPASTE_NG_NUM + NOPASTE_WN_NUM + NOPASTE_OK_NUM NOPASTE_TOTAL_NUM,\n" +
                    "       SHARP2D_NG_NUM + SHARP2D_WN_NUM + SHARP2D_OK_NUM SHARP2D_TOTAL_NUM,\n" +
                    "       SHARP3D_NG_NUM + SHARP3D_WN_NUM + SHARP3D_OK_NUM SHARP3D_TOTAL_NUM,\n" +
                    "       CROSS_NG_NUM + CROSS_WN_NUM + CROSS_OK_NUM CROSS_TOTAL_NUM,\n" +
                    "       RISE_NG_NUM + RISE_WN_NUM + RISE_OK_NUM RISE_TOTAL_NUM,\n" +
                    "       OFFSETY_NG_NUM + OFFSETY_WN_NUM + OFFSETY_OK_NUM OFFSETY_TOTAL_NUM,\n" +
                    "       OFFSETX_NG_NUM + OFFSETX_WN_NUM + OFFSETX_OK_NUM OFFSETX_TOTAL_NUM\n" +
                    "  FROM T_TOTAL\n";
        exeSql= exeSql.replace("?", sql);
        List<Map> mList = modelService.listSql(exeSql, modelAction.getPage(), paraMap,
        	      "", null);
        //List<Map<String, Object>> mList = modelService.listDataSql(exe_sql);
        modelAction.setAjaxList(mList);
        return BaseActionSupport.AJAX;
    }

}
