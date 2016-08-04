package main.callphone;
import java.util.ArrayList;
import java.util.List;
import main.block.NormalContacts;
import main.database.DatabaseAdapter;
import android.content.Context;

public class ContactManager {
    private List<NormalContacts> contactList;//通讯录数据
    private static ContactManager instance;
    private Context context;
    private ContactManager(Context mcontext) {
        context = mcontext;
        init();
    }
    public static ContactManager getInstance(Context mcontext) {
        if (instance == null) {
            instance = new ContactManager(mcontext);
        }
        return instance;
    }
    public void clear() {
        if (contactList != null) {
            contactList.clear();
            contactList = null;
        }
    }
    private void init() {
        DatabaseAdapter da = DatabaseAdapter.getInstance(context);
        contactList = da.readContacts();
    }
    public List<NormalContacts> getList() {
        if (contactList == null) {
            init();
        }
        List<NormalContacts> contactListTemp = new ArrayList<NormalContacts>();
        if (contactList != null) {
            for (NormalContacts info : contactList) {
                contactListTemp.add(info);
            }
        }
        return contactListTemp;
    }
}
