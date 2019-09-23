package com.more.mes.smt.labeltimer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.mes.common.method.MCConstants;
import com.more.mes.labelmanage.template.SynchroTemplateAction;

public class LabelManageTimer implements IJobx
{
  private final Log log = LogFactory.getLog(this.getClass());

  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  private Date inputTime = DateUtil.getCurDate();

  @Override
  public void exec(Args args)
  {
    // TODO Auto-generated method stub
    // 一天的毫秒数
    long daySpan = 24 * 60 * 60 * 1000;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date startTime;
    String dataAuth;
    try
    {

      String sql = "SELECT DISTINCT T1.DEPT_ID " + " FROM T_SYS_PARAMETER_INI T "
                   + " LEFT JOIN SY_USER T1 " + " ON T.VR_VALUE=T1.LOGIN_NAME "
                   + " WHERE T.VR_CLASS = ? ";
      Map map = modelService.queryForMap(sql, new Object[] {"MES0009"});
      dataAuth = StringUtils.toString(map.get("DEPT_ID"));
      startTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf.format(new Date()));

      Date nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdf2.format(new Date()));
      // if (startTime.getTime() == nowTime.getTime())
      // {
      SynchroTemplateAction templateAction = new SynchroTemplateAction();
      Map ajaxMap = new HashMap();
      ajaxMap = templateAction.synchroTemplate(dataAuth, modelService);
      // }
    }
    catch (ParseException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }
}
