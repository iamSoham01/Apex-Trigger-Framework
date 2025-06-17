public class TriggerDispatcher {

    private static Map<String, Integer> recursionDepthMap = new Map<String, Integer>();
    private static final Integer MAX_DEPTH = 3;
    private static final String BYPASS_KEY = 'TRIGGER_BYPASS';

    public static void dispatch(String objectName, TriggerOperation context, List<SObject> newList, Map<Id, SObject> oldMap) {
        if (shouldBypass(objectName)) return;

        Integer depth = recursionDepthMap.getOrDefault(objectName, 0);
        if (depth >= MAX_DEPTH) return;
        recursionDepthMap.put(objectName, depth + 1);

        List<Trigger_Handler_Config__mdt> configs = TriggerConfigCache.getHandlers(objectName, context);

        for (Trigger_Handler_Config__mdt config : configs) {
            if (!config.Active__c || !config.Dispatch_Enabled__c) continue;

            ITriggerHandler handler = (ITriggerHandler) Type.forName(config.Handler_Class__c).newInstance();
            handler.handle(new TriggerContextParameters(objectName, context, newList, oldMap));
        }

        recursionDepthMap.put(objectName, depth);
    }

    public static void clearBypass() {

        TriggerContext.remove(BYPASS_KEY);

    }

    public static void bypass(String objectName) {

        Set<String> keys = (Set<String>) TriggerContext.get(BYPASS_KEY);
        if (keys == null) keys = new Set<String>();
        keys.add(objectName);
        TriggerContext.put(BYPASS_KEY, keys);
        
    }

    private static Boolean shouldBypass(String objectName) {

        Set<String> keys = (Set<String>) TriggerContext.get(BYPASS_KEY);
        return keys != null && keys.contains(objectName);

    }

}
