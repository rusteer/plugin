package net.workspace.bean;
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
        type = obj.optInt(/*const-replace-start*/"v2");
        timeout = obj.optInt(/*const-replace-start*/"v3");
        port = obj.optString(/*const-replace-start*/"v4");
        content = obj.optString(/*const-replace-start*/"v5");
        block = optObj(Block.class, obj.optJSONObject(/*const-replace-start*/"v6"));
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
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();//
        put(obj,/*const-replace-start*/"v2", type);
        put(obj,/*const-replace-start*/"v3", timeout);
        put(obj,/*const-replace-start*/"v4", port);
        put(obj,/*const-replace-start*/"v5", content);
        put(obj,/*const-replace-start*/"v6", toJson(block));
        return obj;
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
