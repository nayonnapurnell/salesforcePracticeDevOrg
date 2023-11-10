@isTest 
private class AccountProcessorTest {
    
    private static testMethod void countContatctsTest(){
        //Load Test Data
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<300; i++){
            accounts.add(new Account(Name='Test Account'+ i));
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        for(Account acc:accounts){
            contacts.add(new Contact(FirstName=acc.Name, LastName='TestContact', AccountId=acc.Id));
            accountIds.add(acc.Id);
        }
        
        insert contacts;
        
        ////Do the Test
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        
        Test.stopTest();
        
        //Check result
        
    }
}