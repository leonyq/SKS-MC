package com.more.mes.smt.wmslockstockinfo.oracle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 齐套库存---齐套库存信息分页
 * 
 * @author development
 */
public class AjaxPageComStockInfo implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String itemCode = modelAction.getParaMap().get("itemCode");
		String projectId = modelAction.getParaMap().get("projectId");
		String itemStatus = modelAction.getParaMap().get("itemStatus");
		String badFlag = modelAction.getParaMap().get("badFlag");
		String searchSql = ""; // 查询条件

		if (StringUtils.isNotBlank(itemStatus)) {
			if ("1".equals(itemStatus)) {
				// 齐套
				searchSql += " AND AA.ITEM_STATUS='1' ";
			} else {
				// 未齐套
				searchSql += " AND AA.ITEM_STATUS='2' ";
			}
		}
		Map<String, String> sqlParaMap = new HashMap<String, String>();
		sqlParaMap.put("DATA_AUTH", dataAuth);
		String moSql = "";
		if (StringUtils.isNotBlank(projectId)) {
			String[] projectIdStrs = projectId.split(",");
			String tempStr = "";
			int length = projectIdStrs.length;
			for (int i = 0; i < length; i++) {
				// tempStr += projectIdStrs[i] + "','";
				if (i == 0) {
					tempStr = ":moNumber" + i;
				} else {
					tempStr = tempStr + "," + ":moNumber" + i;
				}
				sqlParaMap.put("moNumber" + i, projectIdStrs[i]);
			}
			moSql += " AND T.PM_MO_NUMBER IN (" + tempStr + ")";
		}
		String bSql = "";
		if (!"Y".equals(badFlag)) {
			bSql += " AND B.WSI_ITEM_FLAG='1'";
		}

		/*
		 * String sql =
		 * "SELECT DISTINCT T.DATA_AUTH DATA_AUTH,   T.PM_MO_NUMBER PROJECT_ID,  \r\n" +
		 * "                        T1.CBD_ITEM_CODE ITEM_CODE,   T2.CI_ITEM_NAME ITEM_NAME,  \r\n"
		 * +
		 * "                        T2.CI_ITEM_SPEC ITEM_SPEC,   T.PM_TARGET_QTY,   T1.CBD_ITEM_NUM,  \r\n"
		 * +
		 * "                        NVL(T1.CBD_ITEM_NUM, 0) * NVL(T.PM_TARGET_QTY, 0) TOTAL_NUM,  \r\n"
		 * +
		 * "                        NVL(T3.WSI_ITEM_NUM, 0) ITEM_NUM,   T4.ITEM_STATUS,  \r\n"
		 * +
		 * "                        T4.COMPLETE_NUM,   NVL(T3.TOTAL_ITEM_NUM, 0) TOTAL_ITEM_NUM  \r\n"
		 * + "                        FROM T_PM_MO_BASE T   \r\n" +
		 * "                        LEFT JOIN T_PM_PROJECT_DETAIL T1  \r\n" +
		 * "                        ON T.PM_PROJECT_ID = T1.PROJECT_ID AND T1.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                        LEFT JOIN T_CO_ITEM T2  \r\n" +
		 * "                        ON T1.CBD_ITEM_CODE = T2.CI_ITEM_CODE AND T2.DATA_AUTH=:DATA_AUTH \r\n"
		 * +
		 * "                        LEFT JOIN (SELECT I.WSI_ITEM_CODE,   I.WSI_ITEM_NUM,  \r\n"
		 * +
		 * "                        NVL(I.TOTAL_ITEM_NUM, 0) TOTAL_ITEM_NUM   FROM (SELECT M.WSI_ITEM_CODE,  \r\n"
		 * + "                        NVL(M.WSI_ITEM_NUM, 0) TOTAL_ITEM_NUM,  \r\n" +
		 * "                        NVL(M.WSI_ITEM_NUM, 0) - NVL(J.WLD_LOCK_NUM, 0) WSI_ITEM_NUM  \r\n"
		 * +
		 * "                        FROM (SELECT A.WSI_ITEM_CODE,   SUM(A.WSI_ITEM_NUM) WSI_ITEM_NUM  \r\n"
		 * +
		 * "                        FROM T_WMS_STOCK_INFO A   WHERE (A.WSI_STOCK_FLAG = '2' OR  \r\n"
		 * +
		 * "                        A.WSI_STOCK_FLAG = '6')   AND A.WSI_INSPECT_FLAG = 'Y' AND A.DATA_AUTH=:DATA_AUTH  \r\n"
		 * +
		 * "                        AND A.WSI_FREEZE_FLAG = 'N'   GROUP BY A.WSI_ITEM_CODE) M  \r\n"
		 * +
		 * "                        LEFT JOIN (SELECT G.WLD_ITEM_CODE,   SUM(G.WLD_LOCK_NUM) WLD_LOCK_NUM  \r\n"
		 * + "                        FROM T_WMS_LOCKSTOCK_DETAIL G   \r\n" +
		 * "                        LEFT JOIN T_WMS_LOCKSTOCK_DOC H  \r\n" +
		 * "                        ON G.WLD_LOCK_DOC = H.WLD_LOCK_DOC   \r\n" +
		 * "                        AND H.WLD_LOCK_STATUS = '1'  AND H.DATA_AUTH=:DATA_AUTH\r\n"
		 * +
		 * "                        WHERE G.WLD_LOCK_STATUS = '1' AND G.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                        GROUP BY G.WLD_ITEM_CODE) J  \r\n" +
		 * "                        ON M.WSI_ITEM_CODE = J.WLD_ITEM_CODE) I  \r\n" +
		 * "                        LEFT JOIN T_WMS_LOCKSTOCK_DETAIL G  \r\n" +
		 * "                        ON I.WSI_ITEM_CODE = G.WLD_ITEM_CODE AND G.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                        LEFT JOIN T_WMS_LOCKSTOCK_DOC H  \r\n" +
		 * "                        ON G.WLD_LOCK_DOC = H.WLD_LOCK_DOC   AND H.WLD_LOCK_STATUS = '2'\r\n"
		 * + "                        AND H.DATA_AUTH=:DATA_AUTH ) T3  \r\n" +
		 * "                        ON T1.CBD_ITEM_CODE = T3.WSI_ITEM_CODE  \r\n" +
		 * "                        LEFT JOIN (SELECT DISTINCT R.PM_MO_NUMBER,   S.WSI_ITEM_NUM ITEM_NUM,  \r\n"
		 * +
		 * "                        CASE   WHEN NVL(S.WSI_ITEM_NUM, 0) = 0 THEN   '2'  \r\n"
		 * +
		 * "                        WHEN NVL(S.WSI_ITEM_NUM, 0) >=   NVL(U.CBD_ITEM_NUM, 0) *  \r\n"
		 * +
		 * "                        NVL(R.PM_TARGET_QTY, 0) THEN   '1'   ELSE   '2'  \r\n"
		 * +
		 * "                        END ITEM_STATUS,   CASE   WHEN NVL(S.WSI_ITEM_NUM, 0) = 0 THEN  \r\n"
		 * +
		 * "                         0   WHEN NVL(S.WSI_ITEM_NUM, 0) >=   NVL(U.CBD_ITEM_NUM, 0) *  \r\n"
		 * +
		 * "                        NVL(R.PM_TARGET_QTY, 0) THEN   R.PM_TARGET_QTY   ELSE  \r\n"
		 * +
		 * "                        ROUND(S.WSI_ITEM_NUM / U.CBD_ITEM_NUM)   END COMPLETE_NUM  \r\n"
		 * +
		 * "                        FROM (SELECT K.PM_MO_NUMBER,   L.WSI_ITEM_CODE,  \r\n"
		 * + "                        NVL(L.WSI_ITEM_NUM, 0) WSI_ITEM_NUM,  \r\n" +
		 * "                        RANK() OVER(PARTITION BY K.PM_MO_NUMBER ORDER BY NVL(L.WSI_ITEM_NUM, 0)) RN  \r\n"
		 * + "                        FROM T_PM_MO_BASE K   \r\n" +
		 * "                        LEFT JOIN T_PM_PROJECT_DETAIL Q  \r\n" +
		 * "                        ON Q.PROJECT_ID = K.PM_PROJECT_ID  AND Q.DATA_AUTH=:DATA_AUTH\r\n"
		 * + "                        LEFT JOIN (SELECT F.WSI_ITEM_CODE,  \r\n" +
		 * "                        NVL(F.WSI_ITEM_NUM, 0) WSI_ITEM_NUM   FROM (SELECT D.WSI_ITEM_CODE,  \r\n"
		 * +
		 * "                        NVL(D.WSI_ITEM_NUM, 0) -   NVL(E.WLD_LOCK_NUM, 0) WSI_ITEM_NUM  \r\n"
		 * +
		 * "                        FROM (SELECT A.WSI_ITEM_CODE,   SUM(A.WSI_ITEM_NUM) WSI_ITEM_NUM  \r\n"
		 * +
		 * "                        FROM T_WMS_STOCK_INFO A   WHERE (A.WSI_STOCK_FLAG = '2' OR  \r\n"
		 * +
		 * "                        A.WSI_STOCK_FLAG = '6')   AND A.WSI_INSPECT_FLAG = 'Y'  \r\n"
		 * +
		 * "                        AND A.WSI_FREEZE_FLAG = 'N' AND A.DATA_AUTH=:DATA_AUTH  GROUP BY A.WSI_ITEM_CODE) D  \r\n"
		 * +
		 * "                        LEFT JOIN (SELECT B.WLD_ITEM_CODE,   SUM(B.WLD_LOCK_NUM) WLD_LOCK_NUM  \r\n"
		 * + "                        FROM T_WMS_LOCKSTOCK_DETAIL B   \r\n" +
		 * "                        LEFT JOIN T_WMS_LOCKSTOCK_DOC C  \r\n" +
		 * "                        ON B.WLD_LOCK_DOC = C.WLD_LOCK_DOC AND C.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                        AND C.WLD_LOCK_STATUS = '1'  \r\n" +
		 * "                        WHERE B.WLD_LOCK_STATUS = '1' AND B.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                        GROUP BY B.WLD_ITEM_CODE) E  \r\n" +
		 * "                        ON D.WSI_ITEM_CODE =   E.WLD_ITEM_CODE) F) L  \r\n"
		 * +
		 * "                        ON Q.CBD_ITEM_CODE = L.WSI_ITEM_CODE WHERE K.DATA_AUTH=:DATA_AUTH ) S  \r\n"
		 * + "                        LEFT JOIN T_PM_MO_BASE R  \r\n" +
		 * "                        ON R.PM_MO_NUMBER = S.PM_MO_NUMBER  AND R.DATA_AUTH=:DATA_AUTH\r\n"
		 * + "                        LEFT JOIN T_PM_PROJECT_DETAIL U  \r\n" +
		 * "                        ON R.PM_PROJECT_ID = U.PROJECT_ID AND U.DATA_AUTH=:DATA_AUTH \r\n"
		 * +
		 * "                        AND S.WSI_ITEM_CODE = U.CBD_ITEM_CODE   WHERE RN = 1) T4  \r\n"
		 * +
		 * "                        ON T4.PM_MO_NUMBER = T.PM_MO_NUMBER   WHERE T1.CBD_ITEM_NUM IS NOT NULL  \r\n"
		 * +
		 * "                        AND (T.PM_MO_NUMBER, T1.CBD_ITEM_CODE) NOT IN  \r\n"
		 * + "                        (SELECT T5.WLD_PROJECT_ID, L.WLD_ITEM_CODE  \r\n"
		 * + "                        FROM T_WMS_LOCKSTOCK_DETAIL L   \r\n" +
		 * "                        LEFT JOIN T_WMS_LOCKSTOCK_DOC T5  \r\n" +
		 * "                        ON L.wld_lock_doc = T5.WLD_LOCK_DOC AND T5.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                        WHERE L.WLD_LOCK_STATUS = '1' \r\n" +
		 * "                        AND L.DATA_AUTH=:DATA_AUTH )  \r\n" +
		 * "                        AND 1 = 1  AND T.DATA_AUTH=:DATA_AUTH     ";
		 * 
		 * if ("Y".equals(badFlag)) { // 20180620 CSJ 不包括不良品仓的数据 sql =
		 * "SELECT DISTINCT T.DATA_AUTH DATA_AUTH,   T.PM_MO_NUMBER PROJECT_ID,  \r\n" +
		 * "                     T1.CBD_ITEM_CODE ITEM_CODE,   T2.CI_ITEM_NAME ITEM_NAME,  \r\n"
		 * +
		 * "                     T2.CI_ITEM_SPEC ITEM_SPEC,   T.PM_TARGET_QTY,   T1.CBD_ITEM_NUM,  \r\n"
		 * +
		 * "                     NVL(T1.CBD_ITEM_NUM, 0) * NVL(T.PM_TARGET_QTY, 0) TOTAL_NUM,  \r\n"
		 * +
		 * "                     NVL(T3.WSI_ITEM_NUM, 0) ITEM_NUM,   T4.ITEM_STATUS,   T4.COMPLETE_NUM,  \r\n"
		 * +
		 * "                     NVL(T3.TOTAL_ITEM_NUM, 0) TOTAL_ITEM_NUM   FROM T_PM_MO_BASE T  \r\n"
		 * + "                     LEFT JOIN T_PM_PROJECT_DETAIL T1   \r\n" +
		 * "                     ON T.PM_PROJECT_ID = T1.PROJECT_ID AND T1.DATA_AUTH=:DATA_AUTH \r\n"
		 * + "                     LEFT JOIN T_CO_ITEM T2   \r\n" +
		 * "                     ON T1.CBD_ITEM_CODE = T2.CI_ITEM_CODE AND T2.DATA_AUTH=:DATA_AUTH \r\n"
		 * +
		 * "                     LEFT JOIN (SELECT I.WSI_ITEM_CODE,   I.WSI_ITEM_NUM,  \r\n"
		 * +
		 * "                     NVL(I.TOTAL_ITEM_NUM, 0) TOTAL_ITEM_NUM   FROM (SELECT M.WSI_ITEM_CODE,  \r\n"
		 * + "                     NVL(M.WSI_ITEM_NUM, 0) TOTAL_ITEM_NUM,  \r\n" +
		 * "                     NVL(M.WSI_ITEM_NUM, 0) - NVL(J.WLD_LOCK_NUM, 0) WSI_ITEM_NUM  \r\n"
		 * +
		 * "                     FROM (SELECT A.WSI_ITEM_CODE,SUM(A.WSI_ITEM_NUM) WSI_ITEM_NUM  \r\n"
		 * + "                     FROM T_WMS_STOCK_INFO A   \r\n" +
		 * "                     LEFT JOIN T_WMS_AREA A1  \r\n" +
		 * "                     ON A.WSI_WH_CODE = A1.WA_AREA_SN AND A1.DATA_AUTH=:DATA_AUTH  \r\n"
		 * +
		 * "                     WHERE (A.WSI_STOCK_FLAG = '2' OR A.WSI_STOCK_FLAG = '6')   \r\n"
		 * +
		 * "                     AND A.WSI_INSPECT_FLAG = 'Y' AND A.WSI_FREEZE_FLAG = 'N'   \r\n"
		 * +
		 * "                     AND A1.WA_BAD_FLAG = 'N' AND A.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                     GROUP BY A.WSI_ITEM_CODE) M   \r\n" +
		 * "                     LEFT JOIN (SELECT G.WLD_ITEM_CODE,  \r\n" +
		 * "                     SUM(G.WLD_LOCK_NUM) WLD_LOCK_NUM   \r\n" +
		 * "                     FROM T_WMS_LOCKSTOCK_DETAIL G  \r\n" +
		 * "                     LEFT JOIN T_WMS_LOCKSTOCK_DOC H   \r\n" +
		 * "                     ON G.WLD_LOCK_DOC = H.WLD_LOCK_DOC AND H.DATA_AUTH=:DATA_AUTH \r\n"
		 * + "                     AND H.WLD_LOCK_STATUS = '1'   \r\n" +
		 * "                     WHERE G.WLD_LOCK_STATUS = '1'  \r\n" +
		 * "                     AND G.DATA_AUTH=:DATA_AUTH  \r\n" +
		 * "                     GROUP BY G.WLD_ITEM_CODE) J   ON M.WSI_ITEM_CODE = J.WLD_ITEM_CODE) I  \r\n"
		 * + "                     LEFT JOIN T_WMS_LOCKSTOCK_DETAIL G   \r\n" +
		 * "                     ON I.WSI_ITEM_CODE = G.WLD_ITEM_CODE AND G.DATA_AUTH=:DATA_AUTH \r\n"
		 * + "                     LEFT JOIN T_WMS_LOCKSTOCK_DOC H   \r\n" +
		 * "                     ON G.WLD_LOCK_DOC = H.WLD_LOCK_DOC AND H.DATA_AUTH=:DATA_AUTH\r\n"
		 * + "                     AND H.WLD_LOCK_STATUS = '2') T3   \r\n" +
		 * "                     ON T1.CBD_ITEM_CODE = T3.WSI_ITEM_CODE  \r\n" +
		 * "                     LEFT JOIN (SELECT DISTINCT R.PM_MO_NUMBER,   S.WSI_ITEM_NUM ITEM_NUM,  \r\n"
		 * +
		 * "                     CASE   WHEN NVL(S.WSI_ITEM_NUM, 0) = 0 THEN   '2'  \r\n"
		 * +
		 * "                     WHEN NVL(S.WSI_ITEM_NUM, 0) >=   NVL(U.CBD_ITEM_NUM, 0) *  \r\n"
		 * + "                     NVL(R.PM_TARGET_QTY, 0) THEN  '1'   ELSE   '2'  \r\n"
		 * +
		 * "                     END ITEM_STATUS,   CASE   WHEN NVL(S.WSI_ITEM_NUM, 0) = 0 THEN   0  \r\n"
		 * +
		 * "                     WHEN NVL(S.WSI_ITEM_NUM, 0) >=   NVL(U.CBD_ITEM_NUM, 0) *  \r\n"
		 * +
		 * "                     NVL(R.PM_TARGET_QTY, 0) THEN   R.PM_TARGET_QTY   ELSE  \r\n"
		 * +
		 * "                     ROUND(S.WSI_ITEM_NUM / U.CBD_ITEM_NUM)   END COMPLETE_NUM  \r\n"
		 * +
		 * "                     FROM (SELECT K.PM_MO_NUMBER,   L.WSI_ITEM_CODE,  \r\n"
		 * + "                     NVL(L.WSI_ITEM_NUM, 0) WSI_ITEM_NUM,  \r\n" +
		 * "                     RANK() OVER(PARTITION BY K.PM_MO_NUMBER ORDER BY NVL(L.WSI_ITEM_NUM, 0)) RN  \r\n"
		 * + "                     FROM T_PM_MO_BASE K   \r\n" +
		 * "                     LEFT JOIN T_PM_PROJECT_DETAIL Q  \r\n" +
		 * "                     ON Q.PROJECT_ID = K.PM_PROJECT_ID AND Q.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                     LEFT JOIN (SELECT F.WSI_ITEM_CODE,  \r\n" +
		 * "                     NVL(F.WSI_ITEM_NUM, 0) WSI_ITEM_NUM   \r\n" +
		 * "                     FROM (SELECT D.WSI_ITEM_CODE,  \r\n" +
		 * "                     NVL(D.WSI_ITEM_NUM, 0) -   NVL(E.WLD_LOCK_NUM, 0) WSI_ITEM_NUM  \r\n"
		 * +
		 * "                     FROM (SELECT A.WSI_ITEM_CODE,   SUM(A.WSI_ITEM_NUM) WSI_ITEM_NUM  \r\n"
		 * + "                     FROM T_WMS_STOCK_INFO A   \r\n" +
		 * "                     LEFT JOIN T_WMS_AREA A1 \r\n" +
		 * "                     ON A.WSI_WH_CODE =A1.WA_AREA_SN AND A1.DATA_AUTH=:DATA_AUTH \r\n"
		 * +
		 * "                     WHERE (A.WSI_STOCK_FLAG = '2' OR A.WSI_STOCK_FLAG = '6')   \r\n"
		 * +
		 * "                     AND A.WSI_INSPECT_FLAG = 'Y' AND A.WSI_FREEZE_FLAG = 'N'   \r\n"
		 * +
		 * "                     AND A1.WA_BAD_FLAG = 'N' AND A.DATA_AUTH=:DATA_AUTH \r\n"
		 * + "                     GROUP BY A.WSI_ITEM_CODE) D   \r\n" +
		 * "                     LEFT JOIN (SELECT B.WLD_ITEM_CODE,SUM(B.WLD_LOCK_NUM) WLD_LOCK_NUM   \r\n"
		 * + "                     FROM T_WMS_LOCKSTOCK_DETAIL B  \r\n" +
		 * "                     LEFT JOIN T_WMS_LOCKSTOCK_DOC C   \r\n" +
		 * "                     ON B.WLD_LOCK_DOC = C.WLD_LOCK_DOC AND C.DATA_AUTH=:DATA_AUTH \r\n"
		 * + "                     AND C.WLD_LOCK_STATUS = '1'   \r\n" +
		 * "                     WHERE B.WLD_LOCK_STATUS = '1' AND B.DATA_AUTH=:DATA_AUTH  \r\n"
		 * +
		 * "                     GROUP BY B.WLD_ITEM_CODE) E   ON D.WSI_ITEM_CODE = E.WLD_ITEM_CODE) F) L    \r\n"
		 * +
		 * "                     ON Q.CBD_ITEM_CODE = L.WSI_ITEM_CODE WHERE K.DATA_AUTH=:DATA_AUTH) S  \r\n"
		 * + "                     LEFT JOIN T_PM_MO_BASE R   \r\n" +
		 * "                     ON R.PM_MO_NUMBER = S.PM_MO_NUMBER AND R.DATA_AUTH=:DATA_AUTH \r\n"
		 * + "                     LEFT JOIN T_PM_PROJECT_DETAIL U  \r\n" +
		 * "                     ON R.PM_PROJECT_ID = U.PROJECT_ID AND S.WSI_ITEM_CODE = U.CBD_ITEM_CODE \r\n"
		 * + "                     AND U.DATA_AUTH=:DATA_AUTH   \r\n" +
		 * "                     WHERE RN = 1  ) T4  \r\n" +
		 * "                     ON T4.PM_MO_NUMBER = T.PM_MO_NUMBER   \r\n" +
		 * "                     LEFT JOIN T_WMS_STOCK_INFO T5  \r\n" +
		 * "                     ON T1.CBD_ITEM_CODE = T5.WSI_ITEM_CODE AND T5.DATA_AUTH=:DATA_AUTH  \r\n"
		 * + "                     LEFT JOIN T_WMS_AREA T6  \r\n" +
		 * "                     ON T5.WSI_WH_CODE = T6.WA_AREA_SN AND T6.DATA_AUTH=:DATA_AUTH   \r\n"
		 * + "                     WHERE T1.CBD_ITEM_NUM IS NOT NULL  \r\n" +
		 * "                     AND (T.PM_MO_NUMBER, T1.CBD_ITEM_CODE) NOT IN  \r\n" +
		 * "                     (SELECT T5.WLD_PROJECT_ID, L.WLD_ITEM_CODE   \r\n" +
		 * "                     FROM T_WMS_LOCKSTOCK_DETAIL L  \r\n" +
		 * "                     LEFT JOIN T_WMS_LOCKSTOCK_DOC T5   \r\n" +
		 * "                     ON L.WLD_LOCK_DOC = T5.WLD_LOCK_DOC  AND T5.DATA_AUTH=:DATA_AUTH\r\n"
		 * +
		 * "                     WHERE L.WLD_LOCK_STATUS = '1' AND L.DATA_AUTH=:DATA_AUTH )    \r\n"
		 * +
		 * "                     AND T6.WA_BAD_FLAG = 'N' AND T.DATA_AUTH=:DATA_AUTH    "
		 * ; }
		 */
		String sql = " SELECT E.*, \r\n" + "CASE WHEN E.GNUM>=E.NEEDNUM\r\n" + "   THEN '1'\r\n" + " ELSE '2'\r\n"
				+ "END ITEM_STATUS,\r\n" + "CASE WHEN E.GNUM>=E.NEEDNUM\r\n" + "   THEN E.NEEDNUM\r\n"
				+ " ELSE FLOOR(E.GNUM/E.CBD_ITEM_NUM)\r\n" + "END COMPLETE_NUM\r\n"
				+ "FROM(SELECT C.*,(SELECT C.WSI_ITEM_NUM-NVL((SUM(D.WLD_LOCK_NUM)+SUM(D.WLD_PICK_NUM)),0) FROM T_WMS_LOCKSTOCK_DETAIL D \r\n"
				+ "WHERE D.WLD_ITEM_CODE=C.CBD_ITEM_CODE AND D.DATA_AUTH=C.DATA_AUTH AND D.WLD_LOCK_STATUS='1'\r\n"
				+ "GROUP BY D.WLD_ITEM_CODE) GNUM\r\n" + " FROM(SELECT A.*,SUM(B.WSI_ITEM_NUM) WSI_ITEM_NUM FROM(\r\n"
				+ "SELECT T.DATA_AUTH,T.PM_MO_NUMBER,T1.CBD_ITEM_CODE,T2.CI_ITEM_NAME,T2.CI_ITEM_SPEC,\r\n"
				+ "T1.CBD_ITEM_NUM,T.PM_TARGET_QTY*T1.CBD_ITEM_NUM NEEDNUM FROM T_PM_MO_BASE T\r\n"
				+ "LEFT JOIN T_PM_PROJECT_DETAIL T1 ON T1.PROJECT_ID=T.PM_PROJECT_ID AND T1.DATA_AUTH=T.DATA_AUTH\r\n"
				+ "LEFT JOIN T_CO_ITEM T2 ON T2.CI_ITEM_CODE=T1.CBD_ITEM_CODE AND T2.DATA_AUTH=T1.DATA_AUTH\r\n"
				+ "WHERE T.DATA_AUTH=:DATA_AUTH " + moSql + " AND T1.CBD_ITEM_CODE IS NOT NULL\r\n" + ") A \r\n"
				+ "LEFT JOIN T_WMS_STOCK_INFO B ON B.WSI_ITEM_CODE=A.CBD_ITEM_CODE AND B.DATA_AUTH=A.DATA_AUTH\r\n"
				+ "AND (B.WSI_STOCK_FLAG = '2' OR B.WSI_STOCK_FLAG = '6')    \r\n" + bSql
				+ " AND B.WSI_INSPECT_FLAG = 'Y' AND B.WSI_FREEZE_FLAG = 'N'\r\n"
				+ "GROUP BY A.DATA_AUTH,A.PM_MO_NUMBER,A.CBD_ITEM_CODE,A.CI_ITEM_NAME,A.CI_ITEM_SPEC,A.CBD_ITEM_NUM,A.NEEDNUM,B.WSI_ITEM_CODE\r\n"
				+ ") C\r\n" + ")E  ";
		String querySql = " select * from(" + sql + ") aa WHERE 1=1 " + searchSql;
		List itemList = modelService.listSql(querySql, modelAction.getPage(), sqlParaMap, null, null);
		modelAction.setAjaxPage(modelAction.getPage());
		CommMethod.listMapToEscapeJs(itemList);
		modelAction.getAjaxPage().setDataList(itemList);
		return BaseActionSupport.AJAX;
	}

}
