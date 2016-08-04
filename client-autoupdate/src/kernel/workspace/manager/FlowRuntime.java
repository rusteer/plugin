package kernel.workspace.manager;
import java.util.Map;
import kernel.workspace.listener.FlowListener;
import android.util.SparseArray;
import bean.Order;

public class FlowRuntime {
    public String errorCode;
    public String errorMsg;
    public boolean isPaySuccess;
    public Order order;
    public SparseArray<String> urlArray = new SparseArray<String>();
    public Map<String, String> variables;
    public FlowListener orderListener;
}
