package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class GenericPdu {
    PduHeaders mPduHeaders;
    public GenericPdu() {
        mPduHeaders = null;
        mPduHeaders = new PduHeaders();
    }
    GenericPdu(PduHeaders pduheaders) {
        mPduHeaders = null;
        mPduHeaders = pduheaders;
    }
    public EncodedStringValue getFrom() {
        return mPduHeaders.getEncodedStringValue(137);
    }
    public int getMessageType() {
        return mPduHeaders.getOctet(140);
    }
    public int getMmsVersion() {
        return mPduHeaders.getOctet(141);
    }
    PduHeaders getPduHeaders() {
        return mPduHeaders;
    }
    public void setFrom(EncodedStringValue encodedstringvalue) {
        mPduHeaders.setEncodedStringValue(encodedstringvalue, 137);
    }
    public void setMessageType(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 140);
    }
    public void setMmsVersion(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 141);
    }
}
