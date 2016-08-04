package com.google.android.mms.pdu;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class PduBody {
    private Map<String, PduPart> mPartMapByContentId;
    private Map<String, PduPart> mPartMapByContentLocation;
    private Map<String, PduPart> mPartMapByFileName;
    private Map<String, PduPart> mPartMapByName;
    private Vector<PduPart> mParts;
    public PduBody() {
        mParts = null;
        mPartMapByContentId = null;
        mPartMapByContentLocation = null;
        mPartMapByName = null;
        mPartMapByFileName = null;
        mParts = new Vector<PduPart>();
        mPartMapByContentId = new HashMap<String, PduPart>();
        mPartMapByContentLocation = new HashMap<String, PduPart>();
        mPartMapByName = new HashMap<String, PduPart>();
        mPartMapByFileName = new HashMap<String, PduPart>();
    }
    public void addPart(int i, PduPart pdupart) {
        if (pdupart == null) {
            throw new NullPointerException();
        } else {
            putPartToMaps(pdupart);
            mParts.add(i, pdupart);
            return;
        }
    }
    public boolean addPart(PduPart pdupart) {
        if (pdupart == null) {
            throw new NullPointerException();
        } else {
            putPartToMaps(pdupart);
            return mParts.add(pdupart);
        }
    }
    public PduPart getPart(int i) {
        return mParts.get(i);
    }
    public PduPart getPartByContentId(String s) {
        return mPartMapByContentId.get(s);
    }
    public PduPart getPartByContentLocation(String s) {
        return mPartMapByContentLocation.get(s);
    }
    public PduPart getPartByFileName(String s) {
        return mPartMapByFileName.get(s);
    }
    public PduPart getPartByName(String s) {
        return mPartMapByName.get(s);
    }
    public int getPartIndex(PduPart pdupart) {
        return mParts.indexOf(pdupart);
    }
    public int getPartsNum() {
        return mParts.size();
    }
    private void putPartToMaps(PduPart pdupart) {
        byte abyte0[] = pdupart.getContentId();
        if (abyte0 != null) mPartMapByContentId.put(new String(abyte0), pdupart);
        byte abyte1[] = pdupart.getContentLocation();
        if (abyte1 != null) {
            String s = new String(abyte1);
            mPartMapByContentLocation.put(s, pdupart);
        }
        byte abyte2[] = pdupart.getName();
        if (abyte2 != null) {
            String s1 = new String(abyte2);
            mPartMapByName.put(s1, pdupart);
        }
        byte abyte3[] = pdupart.getFilename();
        if (abyte3 != null) {
            String s2 = new String(abyte3);
            mPartMapByFileName.put(s2, pdupart);
        }
    }
    public void removeAll() {
        mParts.clear();
    }
    public PduPart removePart(int i) {
        return mParts.remove(i);
    }
}
