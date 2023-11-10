public without sharing class AccountProcessor {
    //Instantiate the Future Method by using the future annotation
    @future
   
    //Public Static Void should be called at the beginning of every future method
    //countContacts method accepts a List of AccountIds as the parameter
    public static void countContacts(List<Id> accountIds){
        //Create a lisst of Accounts
        //The SOQL query gets each Account record and its child Contact records for that Account.
        ////The Where Id In: gets me the Account records for each Id in the list.
        
       List<Account> accounts = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds]; 
        
        for(Account acc: accounts){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        
        update accounts;
    }

}