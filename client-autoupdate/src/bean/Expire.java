package bean;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

public class Expire extends Reportable {
    /**
     * In server side, this field means how long this block will expire
     * In client side, this field means the exact time of expire
     * 
     */
    public long expire;
    public Expire() {
        super();
    }
    @Override
    public void init(JSONObject obj) {
        super.init(obj);
        expire = obj.optLong("ooo9");
    }
    @Override
    public JSONObject toJson() throws JSONException {
        JSONObject obj = super.toJson();
        if (expire != 0) obj.put("ooo9", expire);
        return obj;
    }
    @Override
    public void readStream(DataInputStream stream) throws IOException {
        super.readStream(stream);
        expire = stream.readLong();
    }
    @Override
    public void writeStream(DataOutputStream stream) throws IOException {
        super.writeStream(stream);
        stream.writeLong(expire);
    }
}
