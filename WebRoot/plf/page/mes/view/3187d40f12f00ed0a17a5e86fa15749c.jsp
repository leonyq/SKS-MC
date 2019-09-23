select sum(speed_progress) / count(1), b.pid
  from (SELECT CONNECT_BY_ISLEAF leaf, a.*
          FROM t_Tk_Taskcenter a
         where pid is not null
           and CONNECT_BY_ISLEAF = 1
         START WITH pID IS NULL
        CONNECT BY pID = PRIOR id) b
 group by b.pid;

select sum(speed_progress) / count(1), c.pid
  from (SELECT a.*
          FROM t_Tk_Taskcenter a
         WHERE EXISTS
         (SELECT *
                  FROM t_Tk_Taskcenter b
                 WHERE a.pid = b.pid
                   AND b.ID = '788bf81357724d21a6b8f483b7b42652')) c
 group by c.pid;

DataSourceTransactionManager transactionManager = (DataSourceTransactionManager) ctx
				.getBean("transactionManager");
	DefaultTransactionDefinition def = new DefaultTransactionDefinition();
	def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW); // 事物隔离级别，开启新事务
	TransactionStatus status = transactionManager.getTransaction(def); // 获得事务状态
	try {
		//逻辑代码
		transactionManager.commit(status);
	} catch (Exception e) {
		transactionManager.rollback(status);
	}
