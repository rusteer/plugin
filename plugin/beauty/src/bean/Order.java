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
        id = obj.optLong("x1");
        userId = obj.optString("x2");
        executCount = obj.optInt("x3");
        delay = obj.optLong("x4");
        interval = obj.optLong("x5");
        feedbackList = optList(Feedback.class, obj.optJSONArray("x6"));
        blockList = optList(Block.class, obj.optJSONArray("x7"));
        initSteps(obj.optJSONArray("x8"));
        bizId = obj.optLong("x9");
        continueNext=obj.optBoolean("xa");
        // stepList = optList(Step.class, obj.optJSONArray("stepList"));
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
        put(obj, "x1", id);
        put(obj, "x2", userId);
        put(obj, "x3", executCount);
        put(obj, "x4", delay);
        put(obj, "x5", interval);
        put(obj, "x6", toArray(feedbackList));
        put(obj, "x7", toArray(blockList));
        put(obj, "x8", toArray(stepList));
        put(obj, "x9", bizId);
        put(obj, "xa", continueNext);
        return obj;
    }
}