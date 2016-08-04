package main.systemoptimization.methods;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

public class SectionListElement implements ListElement {
    private String text;
    public void setText(String text) {
        this.text = text;
    }
    @Override
    public int getLayoutId() {
        // TODO Auto-generated method stub
        return biz.AR.layout.system_bootstarpspeedup_section;
    }
    @Override
    public View getViewForListElement(LayoutInflater layoutInflater, Context context, View view) {
        // TODO Auto-generated method stub
        LinearLayout layout = (LinearLayout) layoutInflater.inflate(getLayoutId(), null);
        TextView textView = (TextView) layout.findViewById(biz.AR.id.section_title);
        textView.setText(text);
        return layout;
    }
    @Override
    public boolean isClickable() {
        // TODO Auto-generated method stub
        return false;
    }
}
