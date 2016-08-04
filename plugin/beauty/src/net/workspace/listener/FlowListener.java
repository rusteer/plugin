package net.workspace.listener;
import java.util.Map;

public interface FlowListener {
    void onFinished(Map<String, String> variables, String errorMsg);
}
