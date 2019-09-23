package com.more.buss.xgglue.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 辅料报废保存
 * @author development
 *
 */
public class DiscardeSubXGService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");

    // String isCloseWin = request.getParameter("isCloseWin");//是否关闭窗口
    // String ID=StringUtils.getUUID();
    String infoId = request.getParameter("ID");
    String ctsTinSn = request.getParameter("CTS_TIN_SN2");// 锡膏胶水SN
    String ctsItemCode = request.getParameter("CTS_ITEM_CODE2");// 辅料料号
    String ctsSupplierCode = request.getParameter("CTS_SUPPLIER_CODE");// 供应商代码 前端是供应商名称
    String ctsLot = request.getParameter("CTS_LOT");// 生产批次 前段没有这个字段，要自己写
    String ctsScarpReason = request.getParameter("CTS_SCARP_REASON");// 报废原因
    String ctsScarpType = request.getParameter("CTS_SCARP_TYPE");// 报废类型 0/1/2
    String ctsScarpTime = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");// 报废时间
                                                                                            // 获取当前时间
    String ctiItemType = request.getParameter("CTI_ITEM_TYPE");
    String ctsScarpMan = CommMethod.getSessionUser().getId();// 操作员 这个应该是当前登录人获取
    // 前端的报废类型要存入T_CO_TIN_INFO CTI_TIN_STATUS 状态中
    String sqlScarp = "select CTS_SUPPLIER_CODE from T_CO_TIN_SCARP_INFO info where info.ID=?";// 查看报废表中是否存在这条数据
    List<String> list = modelService.listDataSql(sqlScarp, new Object[] {infoId});
    TableDataMapExt info = new TableDataMapExt();// 辅料信息表
    TableDataMapExt discarde = new TableDataMapExt();// 报废表
    TableDataMapExt oprate = new TableDataMapExt();// 辅料履历表
    //String sqlOpetare = "select CTO_ITEM_TYPE from T_CO_TIN_OPERATE_LOG operate where operate.CTO_TIN_SN=?";
    //List<String> list_log = modelService.listDataSql(sqlOpetare, new Object[] {ctsTinSn});
    // 插入数据
    List<Object> sqlWlist = new ArrayList<Object>();
    if (list!=null && !list.isEmpty())
    {// 数据库中有信息，则更新
      discarde.setTableName("T_CO_TIN_SCARP_INFO");

      //discarde.setSqlWhere(" and id='" + infoId + "'");
      discarde.setSqlWhere(" and ID= ? ");
      sqlWlist.add(infoId);
      discarde.setSqlWhereArgs(sqlWlist);
      
      discarde.getColMap().put("CTS_SCARP_MAN", ctsScarpMan);
      discarde.getColMap().put("CTS_SCARP_TIME",
        DateUtil.parseDate(ctsScarpTime, "yyyy-MM-dd HH:mm:ss"));
      discarde.getColMap().put("CTS_SCARP_REASON", ctsScarpReason);
      discarde.getColMap().put("CTS_SCARP_TYPE", ctsScarpType);
      if (dataAuth != null)
      {
        discarde.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
      }

      try
      {
        modelService.edit(discarde);
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("更新失败"), e);
      }

    }
    else
    {// 没有信息
      info.setTableName("T_CO_TIN_INFO");// 锡膏胶水表
      //info.setSqlWhere(" and ID='" + infoId + "'");
      
      info.setSqlWhere(" and ID= ? ");
      sqlWlist.add(infoId);
      info.setSqlWhereArgs(sqlWlist);
      
      info.getColMap().put("CTI_TIN_STATUS", "4");
      try
      {
        modelService.edit(info);// 更新辅料表
      }
      catch (Exception e)
      {
        log.error(e);
        throw new BussException(modelAction.getText("更新失败"), e);
      }
      // 插入报废信息
      if ("0".equals(ctiItemType) || "1".equals(ctiItemType))
      {// 判断辅料类型再插入 报废信息
        discarde.setTableName("T_CO_TIN_SCARP_INFO");
        CommMethod.addSysDefCol(discarde.getColMap(), modelAction.getUser());
        discarde.getColMap().put("ID", infoId);
        discarde.getColMap().put("CTS_TIN_SN", ctsTinSn);
        discarde.getColMap().put("CTS_ITEM_CODE", ctsItemCode);
        discarde.getColMap().put("CTS_SUPPLIER_CODE", ctsSupplierCode);
        discarde.getColMap().put("CTS_LOT", ctsLot);
        discarde.getColMap().put("CTS_SCARP_REASON", ctsScarpReason);
        discarde.getColMap().put("CTS_SCARP_TIME",
          DateUtil.parseDate(ctsScarpTime, "yyyy-MM-dd HH:mm:ss"));
        discarde.getColMap().put("CTS_SCARP_MAN", ctsScarpMan);
        discarde.getColMap().put("CTS_SCARP_TYPE", ctsScarpType);
        discarde.getColMap().put("CTS_ITEM_TYPE", ctiItemType);
        discarde.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
        try
        {
          modelService.save(discarde);// 保存到报废表中
        }
        catch (Exception e)
        {
          log.error(e);
          throw new BussException(modelAction.getText("增加失败"), e);
        }

      }
      try
      {
      	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        oprate.setTableName("T_CO_TIN_OPERATE_LOG");
        CommMethod.addSysDefCol(oprate.getColMap(), modelAction.getUser());
        oprate.getColMap().put("CTO_TIN_SN", ctsTinSn);
        oprate.getColMap().put("CTO_OPERATE_TYPE", "6");
        oprate.getColMap().put("CTO_OPERATE_TIME", sdf.parse(sdf.format(new Date())));
        oprate.getColMap().put("CTO_OPEATOR", ctsScarpMan);
        oprate.getColMap().put("CTO_TIN_CODEE", ctsItemCode);
        oprate.getColMap().put("CTO_ITEM_TYPE", ctiItemType);
          modelService.save(oprate);// 保存辅料履历表
      }
        catch (Exception e)
        {
          log.error(e);
          throw new BussException(modelAction.getText("增加失败"), e);
        }

    }

    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("报废成功"), isCloseWin);
    // return
    // modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_ADD);

    // return modelAction.reloadParent(modelAction.getText("增加成功"));
  }

}
