public class TriggerRecursionGuard {

    private static Set<String> triggeredObjects = new Set<String>();

    public static Boolean shouldRun(String objectName) {
        return !triggeredObjects.contains(objectName);
    }

    public static void markRun(String objectName) {
        triggeredObjects.add(objectName);
    }

    public static void reset() {
        triggeredObjects.clear();
    }
    
}
