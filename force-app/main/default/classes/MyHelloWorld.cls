/******************************************************
@class MyHelloWorld
@brief Adding an Apex Class using the Apex Developer Guide
@copyright  (c) 2023, Nayonna Purnell
******************************************************/





public class MyHelloWorld {

    public static void applyDiscount(Book__c[] books)
    {
        for(Book__c  b: books)
        {
            b.Price__c *= 0.9;
        }

    }
}