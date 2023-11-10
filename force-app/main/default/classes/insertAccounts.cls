/***************************************************
@class 		insertAccounts
@brief 		Practice classes for the DML Statements from the Apex Reference Guide
@copyright	(c) 2023, Nayonna Purnell
****************************************************/


public class insertAccounts {
    
    /***************************************************
	@constructor insertAccounts
	@brief 		 Practice Method for the Insert Statement from the Apex Reference Guide
	@copyright	 (c) 2023, Nayonna Purnell
	****************************************************/
    
    public static void createNewAccounts()
    {
        Account newAcct = new Account(name = 'Acme');
        try {
            insert newAcct;
        } catch (DmlException e){
            //Process exception here
            System.debug('');
        }    
    }


	/***************************************************
	@constructor updateAccounts
	@brief 		 Practice Method for the Update Statement from the Apex Reference Guide
	@copyright	 (c) 2023, Nayonna Purnell
	****************************************************/   
    
    public static void updateBillingOnAccounts()
    {
        //To update an account via Apex, you have to first insert the account.
		Account acct = new Account();
    	insert acct; 
        
        //You then have to Query (search) for the account in the Salesforce database.
        //Then set the account Id found in the Query as the variable value that is equal to myAcct.
        Account myAcct = [Select Id, Name, BillingCity From Account Where Id =: acct.Id];
        myAcct.BillingCity = 'San Francisco';
        
        try{
            update myAcct;
        }catch(DmlException e){
            
        }
        
        
    }
    
    
    
    
    
    
    
}