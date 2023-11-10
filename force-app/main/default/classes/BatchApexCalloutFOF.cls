global class BatchApexCalloutFOF  implements Schedulable{
    global void execute(SchedulableContext SC){ 
        //Code logic goes here..
    }
 }

/*
public class BatchApexCalloutFOF implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful{

public List<String> ExternalIDs = new List<String>();
public Map<String,String> UpdateDeliveryStatus = new map<String,String>();
String a;
String b;
String query;

//Constructor
public BatchApexCalloutFOF(){
//Callout Logic
Http http = new Http();
HttpRequest request = new HttpRequest();
//Set timeout to 1 minute to avoid read timed out error (only if it appears)
request.setTimeout(60000);
request.setEndpoint('callout:Apex_Rest_Services_Test/services/apexrest/retrieveDeliveries');
request.setMethod('GET');
HttpResponse response = http.send(request);
while (response.getStatusCode() == 302) {
request.setEndpoint(response.getHeader('Location'));
response = new Http().send(request);
}
// If the request is successful, parse the JSON response.
System.debug(response.getBody());
//JSON to get just the external IDs in a list, map to the respective delivery status
JSONParser parser = JSON.createParser(response.getBody());
while (parser.nextToken() != null){
if((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
if (parser.getText() == 'Id')
{
parser.nextToken();
a = parser.getText();
ExternalIDs.add(a);
}
else if (parser.getText() == 'Status__c'){
parser.nextToken();
b = parser.getText();
UpdateDeliveryStatus.put(a,b);
}
}
}
//Verify if the data comes through during runtime
System.debug('JSON External IDs list: ' + ExternalIds);
System.debug('The map:' + UpdateDeliveryStatus);

}

public Database.QueryLocator start(Database.BatchableContext BC){
system.debug('Inside the Start statement');
//Create query with ExternalIDs list to limit the scope
query = 'Select Id, Name, External_ID__c, Service_Agent__c, Status__c from Delivery__c where External_ID__c in :ExternalIds ';
return Database.getQueryLocator(query);
}



public void execute(Database.BatchableContext BC, List<Delivery__c> scope){
List<Delivery__c> delivs = new List<Delivery__c>();
//Verify the start of the process during runtime
system.debug('Inside the Execute statement');
System.debug('The map:' + UpdateDeliveryStatus);
//Loop through records in scope, batch-wise
for(Delivery__c s : scope){
System.debug('The current record in loop'+ s.External_ID__c);
s.Status__c = UpdateDeliveryStatus.get(s.External_ID__c);
delivs.add(s);
}
update delivs;
}
public void finish(Database.BatchableContext BC){
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setToAddresses(new String[] {'nayonna.purnell@slalom.com'});
mail.setReplyTo('nayonna.purnell@slalom.com');
mail.setSenderDisplayName('Batch Process');
mail.setSubject('Delivery Statuses updated successfully');
mail.setPlainTextBody('Batch Process has completed.');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}*/