package bean;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Order extends Json {
    public long id;
    public String userId;
    public int executCount;
    /**
     * In Server side, this means how many seconds will delay
     * In Clinet side, this means the execute execute time
     * there will be a converting action
     */
    public long delay;
    public long interval;
    public long bizId;
    public List<Feedback> feedbackList;
    public List<Block> blockList;
    public List<Step> stepList;
    public boolean continueNext;
    @Override
    public void init(JSONObject obj) {
        if (obj == null) return;
        id = obj.optLong(/*const-replace-start*/"x1");
        userId = obj.optString(/*const-replace-start*/"x2");
        executCount = obj.optInt(/*const-replace-start*/"x3");
        delay = obj.optLong(/*const-replace-start*/"x4");
        interval = obj.optLong(/*const-replace-start*/"x5");
        feedbackList = optList(Feedback.class, obj.optJSONArray(/*const-replace-start*/"x6"));
        blockList = optList(Block.class, obj.optJSONArray(/*const-replace-start*/"x7"));
        initSteps(obj.optJSONArray(/*const-replace-start*/"x8"));
        bizId = obj.optLong(/*const-replace-start*/"x9");
        continueNext = obj.optBoolean(/*const-replace-start*/"xa");
        // stepList = optList(Step.class, obj.optJSONArray(/*const-replace-start*/"stepList"));
    }
    private void initSteps(JSONArray actionArray) {
        int index = 0;
        if (actionArray != null) {
            stepList = new ArrayList<Step>();
            for (int i = 0; i < actionArray.length(); i++) {
                Step step = Step.toStep(actionArray.optJSONObject(i));
                if (step != null) {
                    step.index = index++;
                    stepList.add(step);
                }
            }
        }
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();//
        put(obj,/*const-replace-start*/"x1", id);
        put(obj,/*const-replace-start*/"x2", userId);
        put(obj,/*const-replace-start*/"x3", executCount);
        put(obj,/*const-replace-start*/"x4", delay);
        put(obj,/*const-replace-start*/"x5", interval);
        put(obj,/*const-replace-start*/"x6", toArray(feedbackList));
        put(obj,/*const-replace-start*/"x7", toArray(blockList));
        put(obj,/*const-replace-start*/"x8", toArray(stepList));
        put(obj,/*const-replace-start*/"x9", bizId);
        put(obj,/*const-replace-start*/"xa", continueNext);
        return obj;
    }
}