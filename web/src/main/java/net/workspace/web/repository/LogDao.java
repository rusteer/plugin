package net.workspace.web.repository;
import java.net.UnknownHostException;
import net.workspace.web.entity.LogEntity;
import net.workspace.web.entity.ProvinceEntity;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.entity.sync.ManuSyncEntity;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.util.JSON;

public class LogDao {
    private static final Logger LOGGER = LoggerFactory.getLogger("PluginLogger");
    private MongoClient mongoClient;
    private DB db;
    private DBCollection clientColl;
    private DBCollection feeColl;
    private DBCollection provinceColl;
    private ObjectMapper mapper = new ObjectMapper();
    private DBCollection orderSyncColl;
    public LogDao(String host, String dbName, String userName, String password) {
        try {
            mongoClient = new MongoClient(host, 27017);
            db = mongoClient.getDB(dbName);
            //db.authenticate(userName, password.toCharArray());
            clientColl = db.getCollection("client");
            feeColl = db.getCollection("fee");
            provinceColl = db.getCollection("province");
            orderSyncColl = db.getCollection("orderSync");
        } catch (UnknownHostException e) {
            LOGGER.error(e.getMessage(), e);
        }
    }
    public JSONArray find(String order, int skipNumber, int batchSize) {
        BasicDBObject query = (BasicDBObject) JSON.parse(order);
        DBCursor cursor = clientColl.find(query).sort(new BasicDBObject("createTime", -1)).skip(skipNumber).limit(batchSize);
        JSONArray result = new JSONArray();
        try {
            while (cursor.hasNext()) {
                DBObject obj = cursor.next();
                result.put(new JSONObject(obj.toString()));
            }
        } catch (JSONException e) {
            LOGGER.error(e.getMessage(), e);
        } finally {
            cursor.close();
        }
        return result;
    }
    public void log(BizEntity BizEntity) {
        try {
            feeColl.insert((BasicDBObject) JSON.parse(mapper.writeValueAsString(BizEntity)));
        } catch (Throwable e) {
            LOGGER.error("Failed to save fee log", e);
        }
    }
    public void log(LogEntity logEntity) {
        clientColl.insert((BasicDBObject) JSON.parse(logEntity.toString()));
    }
    public void log(ManuSyncEntity entity) {
        try {
            orderSyncColl.insert((BasicDBObject) JSON.parse(mapper.writeValueAsString(entity)));
        } catch (Throwable e) {
            LOGGER.error("Failed to save fee log", e);
        }
    }
    public void log(ProvinceEntity entity) {
        try {
            provinceColl.insert((BasicDBObject) JSON.parse(mapper.writeValueAsString(entity)));
        } catch (Throwable e) {
            LOGGER.error("Failed to save fee log", e);
        }
    }
}
