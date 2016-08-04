package net.workspace.http;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;
import net.workspace.biz.BIZ;
import net.workspace.util.Constant;
import net.workspace.util.ParseKsy;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.entity.HttpEntityWrapper;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.protocol.HttpContext;

public class GzipHttpClient extends DefaultHttpClient {
    /**
     * Accept-Encoding
     */
    private static String HEADER_ACCEPT_ENCODING = ParseKsy.decode("1a444877d99552ea5f5d55ac8e30d9bd");
    /**
     * "gzip"
     */
    private static final String ENCODING_GZIP = ParseKsy.decode("0f747cfee745764d1ac97b6a2a348b73");
    private void init() {
        addRequestInterceptor(new HttpRequestInterceptor() {
            @Override
            public void process(HttpRequest request, HttpContext context) {
                if (!request.containsHeader(HEADER_ACCEPT_ENCODING)) request.addHeader(HEADER_ACCEPT_ENCODING, ENCODING_GZIP);
            }
        });
        addResponseInterceptor(new HttpResponseInterceptor() {
            @Override
            public void process(HttpResponse response, HttpContext context) {
                HttpEntity entity = response.getEntity();
                Header encoding = entity.getContentEncoding();
                if (encoding != null) {
                    HeaderElement elements[] = encoding.getElements();
                    int length = elements.length;
                    for (int i = 0; i < length; i++) {
                        HeaderElement element = elements[i];
                        if (element.getName().equalsIgnoreCase(ENCODING_GZIP)) {
                            response.setEntity(new GzipWrapper(response.getEntity()));
                            break;
                        }
                    }
                }
            }
        });
        getParams().setParameter(Constant.CONNECTION_TIMEOUT, BIZ.HTTP_TIME_OUT * 1000);
        getParams().setParameter(Constant.SOCKET_TIMEOUT, BIZ.HTTP_TIME_OUT * 1000);
    }
    public GzipHttpClient() {
        super();
        init();
    }
    public GzipHttpClient(BasicHttpParams basicHttpParams) {
        super(basicHttpParams);
        init();
    }
    public class GzipWrapper extends HttpEntityWrapper {
        public GzipWrapper(HttpEntity wrapped) {
            super(wrapped);
        }
        @Override
        public InputStream getContent() throws IOException {
            return new GZIPInputStream(wrappedEntity.getContent());
        }
        @Override
        public long getContentLength() {
            return -1L;
        }
    }
}
