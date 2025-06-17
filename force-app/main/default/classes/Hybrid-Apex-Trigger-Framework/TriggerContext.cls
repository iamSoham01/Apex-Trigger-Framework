public class TriggerContext {

    private static Map<String, Object> state = new Map<String, Object>();

    public static void put(String key, Object value) {
        state.put(key, value);
    }

    public static Object get(String key) {
        return state.get(key);
    }

    public static void remove(String key) {
        state.remove(key);
    }

    public static void clear() {
        state.clear();
    }
    
}
