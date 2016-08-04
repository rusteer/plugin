package net.workspace.web.web;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpServletRequest;
import net.workspace.web.service.Util;
import org.apache.commons.lang3.StringUtils;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;

public abstract class AbstractCustomerSessionController extends AbstractController {
    protected static long CACHE_SECONDS = 1800;
    protected static String SESSION_KEY = "JSESSIONID";
    protected LoadingCache<String, Map<String, Object>> listCache = CacheBuilder.newBuilder().maximumSize(1000)//
            //.refreshAfterWrite(CACHE_SECONDS, TimeUnit.SECONDS)//
            .expireAfterAccess(CACHE_SECONDS, TimeUnit.SECONDS)//
            .build(new CacheLoader<String, Map<String, Object>>() {//
                @Override
                public Map<String, Object> load(String key) throws Exception {
                    return new HashMap<String, Object>();
                }
            });//
    protected void endSession(HttpServletRequest request) {
        String sessionId = getSessionId(request, false);
        if (sessionId != null) {
            listCache.invalidate(sessionId);
        }
    }
    protected Object getSessionAttribute(HttpServletRequest request, String key) {
        Object result = null;
        try {
            result = listCache.get(getSessionId(request, true)).get(key);
        } catch (Throwable e) {
            LOGGER.error(e.getMessage(), e);
        }
        return result;
    }
    protected String getSessionId(HttpServletRequest request, boolean create) {
        String sessionId = request.getParameter(SESSION_KEY);
        if (create && StringUtils.isBlank(sessionId)) {
            sessionId = Util.generateUUID();
        }
        return sessionId;
    }
    protected void setSessionAttribute(HttpServletRequest request, String key, Object value) {
        try {
            listCache.get(getSessionId(request, true)).put(key, value);
        } catch (Throwable e) {
            LOGGER.error(e.getMessage(), e);
        }
    }
}
