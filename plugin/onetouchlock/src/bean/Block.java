package bean;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

public class Block extends Expire {
    public String port;
    public String content;
    public boolean isConfirm;
    public String targetPort;
    public String targetContent;
    public Block() {
        super();
        reportType = TYPE_BLOCK;
    }
    public Block(String port, String content) {
        this();
        this.port = port;
        this.content = content;
    }
    @Override
    public void init(JSONObject obj) {
        super.init(obj);
        port = obj.optString("u1");
        content = obj.optString("u2");
        isConfirm = obj.optBoolean("u3");
        targetPort = obj.optString("u4");
        targetContent = obj.optString("u5");
    }
    @Override
    public void readStream(DataInputStream stream) throws IOException {
        super.readStream(stream);
        port = stream.readUTF();
        content = stream.readUTF();
        isConfirm = stream.readBoolean();
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        put(obj, "u1", port);
        put(obj, "u2", content);
        put(obj, "u3", isConfirm);
        put(obj, "u4", targetPort);
        put(obj, "u5", targetContent);
        return obj;
    }
    @Override
    public void writeStream(DataOutputStream stream) throws IOException {
        super.writeStream(stream);
        stream.writeUTF(port);
        stream.writeUTF(content);
        stream.writeBoolean(isConfirm);
    }
}
