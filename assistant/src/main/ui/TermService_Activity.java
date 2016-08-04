package main.ui;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.webkit.WebView;
import android.widget.Button;

public class TermService_Activity extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.termservicewebview);
        WebView wv = (WebView) findViewById(biz.AR.id.webView1);
        wv.getSettings().setJavaScriptEnabled(false);
        wv.setScrollBarStyle(0);
        //wv.loadUrl("http://6926688.com/And/termservice/xkxy.html");
        wv.loadUrl("file:///android_asset/term.html");
        Button btnButton = (Button) findViewById(biz.AR.id.tswv_OK);
        btnButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                System.gc();
                finish();
            }
        });
    }
}
