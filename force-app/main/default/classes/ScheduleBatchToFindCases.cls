public class ScheduleBatchToFindCases implements Schedulable{
    public void execute(SchedulableContext ctx){
        BatchToFindCases batch = new BatchToFindCases();
       // Database.executeBatch(batch,100);
        
        //Cron Expression to test the Scheduler in Execute Anonymous Window
        //ScheduleBatchToFindCases scheduler = new ScheduleBatchToFindCases();
        //String cronExpression = '*/5 * * * *';
        //String jobId = System.schedule('Check Cases', cronExpression, scheduler);
        
    }

}