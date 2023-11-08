//This trigger was created to understand and explain the Salesforce Trigger from the Trigger Handler framework

/*
The commands after insert, after update, before insert, before update are trigger events to perform DML operations
*/
trigger AccountTrigger on Account (after insert, after update, before insert, before update){

    /*
        This line of code creates an instance of the AccountTriggerHandler class and names it handler.
        The AccountTriggerHandler passes through an Instance of the Account Object with a Boolean of isExecuting and an Integer of size.
    */
    AccountTriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);

    /*
    isInsert is a Salesforce Context variable that is available for triggers and returns true if the trigger was fired due to an insert operation.
    https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_intro#:~:text=()%20API%20call.-,isInsert,%2C%20Apex%2C%20or%20the%20API.
    */

    if(Trigger.isInsert)
    {
        if(Trigger.isBefore)
        {
            handler.OnBeforeInsert(trigger.New);
        }
        else {
            handler.OnAfterInsert(trigger.New);
        }
        
    }




//End of the AccounTrigger
}
