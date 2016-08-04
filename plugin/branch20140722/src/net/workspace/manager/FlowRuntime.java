package net.workspace.manager;
import java.util.Map;
import net.workspace.bean.Order;
import net.workspace.listener.FlowListener;
import android.util.SparseArray;

public class FlowRuntime {
    public String errorCode;
    public String errorMsg;
    public boolean isPaySuccess;
    public Order order;
    public SparseArray<String> urlArray = new SparseArray<String>();
    public Map<String, String> variables;
    public FlowListener orderListener;
}
