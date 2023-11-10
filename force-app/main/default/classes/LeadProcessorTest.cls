//Add the isTest annotation
//Make all test classes private
@isTest
private class LeadProcessorTest {   
    //Create the test method to load the test data    
    //Load test data
    @isTest
    private static void testBatchClass(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<200; i++){
            leads.add(new Lead(LastName='Purnell', Company='Salesforce'));
        }
        insert leads;    
        
        //Perform the test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);       
        Test.stopTest();
        
        //Check the result
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: At least 1 Lead record not updated correctly');
        
    }
}