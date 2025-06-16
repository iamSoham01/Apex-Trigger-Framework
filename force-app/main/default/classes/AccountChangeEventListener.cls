public class AccountChangeEventListener {

    // Event Listener Method – Automatically called when the event is fired
    @future
    public static void processEvents(List<Account_Change_Event__e> events) {
        for (Account_Change_Event__e event : events) {
            AccountChangeService.processEvent(event);
        }
    }
    
}
