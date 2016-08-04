package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class MultimediaMessagePdu extends GenericPdu {
    private PduBody mMessageBody;
    public MultimediaMessagePdu() {}
    MultimediaMessagePdu(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public MultimediaMessagePdu(PduHeaders pduheaders, PduBody pdubody) {
        super(pduheaders);
        mMessageBody = pdubody;
    }
    public void addTo(EncodedStringValue encodedstringvalue) {
        mPduHeaders.appendEncodedStringValue(encodedstringvalue, 151);
    }
    public PduBody getBody() {
        return mMessageBody;
    }
    public long getDate() {
        return mPduHeaders.getLongInteger(133);
    }
    public int getPriority() {
        return mPduHeaders.getOctet(143);
    }
    public EncodedStringValue getSubject() {
        return mPduHeaders.getEncodedStringValue(150);
    }
    public EncodedStringValue[] getTo() {
        return mPduHeaders.getEncodedStringValues(151);
    }
    public void setBody(PduBody pdubody) {
        mMessageBody = pdubody;
    }
    public void setDate(long l) {
        mPduHeaders.setLongInteger(l, 133);
    }
    public void setPriority(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 143);
    }
    public void setSubject(EncodedStringValue encodedstringvalue) {
        mPduHeaders.setEncodedStringValue(encodedstringvalue, 150);
    }
}
