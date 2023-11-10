public without sharing class LeadProcessor implements Database.Batchable<sObject> {
    
    //Collect all Lead records in the org
    public Database.QueryLocator start(Database.BatchableContext dbc){
        
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }
    
    //Update All Lead records in the org with the LeadSource value of Dreamforce
    public void execute(Database.BatchableContext dbc, List<Lead> leads){
        for (Lead l : leads){
            l.LeadSource = 'Dreamforce';
        }
        update leads;
    }
    
    public void finish (Database.BatchableContext dbc){
        System.debug('Done');
    }
    
    
    
    
    /*global class s360_batchDocumentEmailWeekly implements 
Database.Batchable<sObject>{
  global String query = '';
  global Database.QueryLocator start(Database.BatchableContext bc) {
      query = 'select Id,Platform__c,Send_Revision_Email__c from Document__c 
      where Send_Revision_Email__c = true ';
      system.debug('>>>>' + query);
      return Database.getQueryLocator(query);
  }
  global void execute(Database.BatchableContext bc, List <Document__c> scope) {

  }
  global void finish(Database.BatchableContext bc) {

  } 
}*/

}