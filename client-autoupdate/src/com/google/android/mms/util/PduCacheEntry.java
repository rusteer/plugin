package com.google.android.mms.util;
import com.google.android.mms.pdu.GenericPdu;

public final class PduCacheEntry {
    private final int mMessageBox;
    private final GenericPdu mPdu;
    private final long mThreadId;
    public PduCacheEntry(GenericPdu genericpdu, int i, long l) {
        mPdu = genericpdu;
        mMessageBox = i;
        mThreadId = l;
    }
    public int getMessageBox() {
        return mMessageBox;
    }
    public GenericPdu getPdu() {
        return mPdu;
    }
    public long getThreadId() {
        return mThreadId;
    }
}
