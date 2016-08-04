package bean;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

public class Feedback extends Expire {
    public int type;
    public int timeout;
    public String port;
    public String content;
    public Block block;
    public Feedback() {
        super();
        reportType = TYPE_FEEDBACK;
    }
    @Override
    public void init(JSONObject obj) {
        super.init(obj);
        type = obj.optInt("v2");
        timeout = obj.optInt("v3");
        port = obj.optString("v4");
        content = obj.optString("v5");
        block = optObj(Block.class, obj.optJSONObject("v6"));
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();//
        if (type > 0) obj.put("v2", type);
        if (timeout > 0) obj.put("v3", timeout);
        obj.put("v4", port);
        obj.put("v5", content);
        obj.put("v6", toJson(block));
        return obj;
    }
    @Override
    public void readStream(DataInputStream stream) throws IOException {
        super.readStream(stream);
        port = stream.readUTF();
        content = stream.readUTF();
        type = stream.readInt();
        timeout = stream.readInt();
        block = new Block();
        block.readStream(stream);
    }
    @Override
    public void writeStream(DataOutputStream stream) throws IOException {
        super.writeStream(stream);
        stream.writeUTF(port);
        stream.writeUTF(content);
        stream.writeInt(type);
        stream.writeInt(timeout);
        if (block == null) block = new Block();
        block.writeStream(stream);
    }
}
