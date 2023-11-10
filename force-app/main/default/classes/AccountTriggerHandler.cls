/*
I have created the AccountTriggerHandler class as a class that processes the trigger events
*/
public with sharing class AccountTriggerHandler {
    
    //Boolean to determine if the Account Trigger is Executing
    private boolean m_isExecuting = false;
    
    public AccountTriggerHandler(boolean isExecuting)
    {
        m_isExecuting = isExecuting;
       
    }

    public void OnBeforeInsert(List<Account> newAccount)
    {
        system.debug('Account Trigger On Before Insert');
    }
    public void OnAfterInsert(List<Account> newAccount)
    {
        system.debug('Account Trigger on After Insert');
    }

}