public class TriggerContextUtils {

    public static TriggerOperationType getContext() {

        if (Trigger.isBefore && Trigger.isInsert) return TriggerOperationType.BEFORE_INSERT;
        if (Trigger.isBefore && Trigger.isUpdate) return TriggerOperationType.BEFORE_UPDATE;
        if (Trigger.isBefore && Trigger.isDelete) return TriggerOperationType.BEFORE_DELETE;
        if (Trigger.isAfter && Trigger.isInsert) return TriggerOperationType.AFTER_INSERT;
        if (Trigger.isAfter && Trigger.isUpdate) return TriggerOperationType.AFTER_UPDATE;
        if (Trigger.isAfter && Trigger.isDelete) return TriggerOperationType.AFTER_DELETE;

        // Ensure method always returns something — this is required
        throw new Exception('Unsupported or unhandled trigger context.');

    }
}
