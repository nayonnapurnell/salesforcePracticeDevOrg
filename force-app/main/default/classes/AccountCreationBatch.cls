public class AccountCreationBatch implements Database.Batchable<sObject>{
 
    /*
    * Start:
    * Collects the records or objects to pass to the interface method "execute".
    This is the first method which is called when we execute a batch apex.
    It returns a Database.Query Locator object that contains the records passed to the job.
    */
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        String query = 'SELECT Id, Name FROM Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Account> records){
        // process each batch of records
    }    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
    
}