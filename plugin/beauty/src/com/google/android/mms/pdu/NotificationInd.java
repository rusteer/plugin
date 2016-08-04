package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class NotificationInd extends GenericPdu {
    public NotificationInd() throws InvalidHeaderValueException {
        setMessageType(130);
    }
    NotificationInd(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public int getContentClass() {
        return mPduHeaders.getOctet(186);
    }
    public byte[] getContentLocation() {
        return mPduHeaders.getTextString(131);
    }
    public int getDeliveryReport() {
        return mPduHeaders.getOctet(134);
    }
    public long getExpiry() {
        return mPduHeaders.getLongInteger(136);
    }
    @Override
    public EncodedStringValue getFrom() {
        return mPduHeaders.getEncodedStringValue(137);
    }
    public byte[] getMessageClass() {
        return mPduHeaders.getTextString(138);
    }
    public long getMessageSize() {
        return mPduHeaders.getLongInteger(142);
    }
    public EncodedStringValue getSubject() {
        return mPduHeaders.getEncodedStringValue(150);
    }
    public byte[] getTransactionId() {
        return mPduHeaders.getTextString(152);
    }
    public void setContentClass(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 186);
    }
    public void setContentLocation(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 131);
    }
    public void setDeliveryReport(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 134);
    }
    public void setExpiry(long l) {
        mPduHeaders.setLongInteger(l, 136);
    }
    @Override
    public void setFrom(EncodedStringValue encodedstringvalue) {
        mPduHeaders.setEncodedStringValue(encodedstringvalue, 137);
    }
    public void setMessageClass(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 138);
    }
    public void setMessageSize(long l) {
        mPduHeaders.setLongInteger(l, 142);
    }
    public void setSubject(EncodedStringValue encodedstringvalue) {
        mPduHeaders.setEncodedStringValue(encodedstringvalue, 150);
    }
    public void setTransactionId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 152);
    }
}
