package main.ui;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.Html;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.text.style.URLSpan;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;

public class RegisterReadActivity extends Activity implements OnClickListener {
    /** Called when the activity is first created. */
    private Button tryButton;
    private TextView xkxy_terms_of_service;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(biz.AR.layout.termservice_read_activity);
        // 使用按钮
        tryButton = (Button) findViewById(biz.AR.id.tryButton);
        tryButton.setOnClickListener(this);
        // 许可文本弹出框按钮
        xkxy_terms_of_service = (TextView) findViewById(biz.AR.id.xkxy_terms_of_service);
        xkxy_terms_of_service.setOnClickListener(this);
        // 加下划线
        String txt = xkxy_terms_of_service.getText().toString();
        txt = txt.replace("\n", "<br/>").replace("nbsp", "&nbsp;&nbsp;&nbsp;&nbsp;");
        txt = txt.replace("《", "<a href='termservice'>《");
        txt = txt.replace("》", "》</a>");
        txt = txt.replace("[", "<a href=''>【");
        txt = txt.replace("]", "】</a>");
        xkxy_terms_of_service.setText(Html.fromHtml("" + txt + ""));
        xkxy_terms_of_service.setMovementMethod(LinkMovementMethod.getInstance());
        CharSequence text = xkxy_terms_of_service.getText();
        if (text instanceof Spannable) {
            int end = text.length();
            Spannable sp = (Spannable) xkxy_terms_of_service.getText();
            URLSpan[] urls = sp.getSpans(0, end, URLSpan.class);
            SpannableStringBuilder style = new SpannableStringBuilder(text);
            style.clearSpans();//should clear old spans     
            for (URLSpan url : urls) {
                MyURLSpan myURLSpan = new MyURLSpan(url.getURL());
                style.setSpan(myURLSpan, sp.getSpanStart(url), sp.getSpanEnd(url), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            xkxy_terms_of_service.setText(style);
        }
    }
    private class MyURLSpan extends ClickableSpan {
        private String mUrl;
        MyURLSpan(String url) {
            mUrl = url;
        }
        @Override
        public void onClick(View widget) {
            if (mUrl.equalsIgnoreCase("")) ;//new FeedBackDialog(RegisterReadActivity.this).show();
            else {
                Intent intent = new Intent(RegisterReadActivity.this, TermService_Activity.class);
                startActivity(intent);
            }
        }
    }
    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case biz.AR.id.tryButton:// 进入按钮
            {
                try {
                    System.gc();
                    finish();
                } catch (Throwable e) {}
            }
                break;
        }
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) { // 按下的如果是BACK，同时没有重复
            this.setResult(2, null);
            System.gc();
            finish();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }
}
