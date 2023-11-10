public class SalesforceConnect {
    public static string getCasesFromSalesforceOrgB(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://amazing-appy-304211-dev-ed.lightning.force.com/apexrest/services/Cases');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response);
        
         while (response.getStatusCode() == 302) {
            request.setEndpoint(response.getHeader('Location'));
            response = new Http().send(request);
            List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Received the following animals:');
            for(Object result : results) {
                Map<String, Object> caseProps =  (Map<String, Object>)result;
                System.debug('CaseNumber: '+caseProps.get('CaseNumber')+' - Subject:' +caseProps.get('Subject'));
        }
        
        // If the request is successful, parse the JSON response.
    /*    if(response.getStatusCode() == 200) {
            List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Received the following animals:');
            for(Object result : results) {
                Map<String, Object> caseProps =  (Map<String, Object>)result;
                System.debug('CaseNumber: '+caseProps.get('CaseNumber')+' - Subject:' +caseProps.get('Subject'));
            }           
        } */
      
    }   
         return response.getBody();
}
}