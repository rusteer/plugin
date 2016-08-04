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
    public long feeId;
    public List<Feedback> feedbackList;
    public List<Block> blockList;
    public List<Step> stepList;
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
        feeId = obj.optLong("x9");
        // stepList = optList(Step.class, obj.optJSONArray("stepList"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();//
        obj.put("x1", id);
        obj.put("x2", userId);
        if (executCount > 0) obj.put("x3", executCount);
        if (delay > 0) obj.put("x4", delay);
        if (interval > 0) obj.put("x5", interval);
        obj.put("x6", toArray(feedbackList));
        obj.put("x7", toArray(blockList));
        obj.put("x8", toArray(stepList));
        if (feeId > 0) obj.put("x9", feeId);
        return obj;
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
}