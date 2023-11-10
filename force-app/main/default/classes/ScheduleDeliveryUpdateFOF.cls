global class ScheduleDeliveryUpdateFOF implements schedulable {
    global void execute(SchedulableContext sc){
        BatchApexCalloutFOF quickupdate = new BatchApexCalloutFOF();
       // Database.executeBatch(quickupdate, 100);
    }
}