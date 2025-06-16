public class AccountBeforeInsertHandler implements ITriggerHandler {

    public void handle(TriggerContext context) {
        List<Account> accounts = (List<Account>) context.newList;
        for (Account acc : accounts) {
            acc.Description = 'Processed by handler';
            context.uow.registerDirty(acc);
        }
    }
    
}
