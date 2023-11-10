public class BatchToFindCases implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful{
    
    String query;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('Inside the Start statement');
        //Create query with ExternalIDs list to limit the scope
        query = 'Select Id, Name, External_ID__c, Service_Agent__c, Status__c from Delivery__c where External_ID__c in :ExternalIds ';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Case> caseList){
        
    }
    
    public void finish(Database.BatchableContext bc){
        //Verify the start of the process during runtime
        system.debug('Inside the Execute statement');
        System.debug('Executed');
    }
    
    private HttpResponse getCases(){
        //Callout Logic
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //Set timeout to 5 minutes to avoid read timed out error (only if it appears)
        request.setTimeout(300000);
        request.setEndpoint('callout:Apex_Rest_Services_Test/services/apexrest/retrieveDeliveries');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        return response;
    }
    
}