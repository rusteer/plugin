package net.workspace.web.web;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.fasterxml.jackson.databind.ObjectMapper;

public class AbstractController {
    static final Logger LOGGER = LoggerFactory.getLogger("PluginLogger");
    protected ObjectMapper mapper = new ObjectMapper();
    protected final static int BUFFER_SIZE = 4096;
    protected JSONArray composeArray(JSONArray result, Object... array) throws Exception {
        if (result == null) result = new JSONArray();
        for (Object o : array) {
            result.put(o);
        }
        return result;
    }
    protected JSONArray composeArray(Object... array) throws Exception {
        return this.composeArray(null, array);
    }
}
