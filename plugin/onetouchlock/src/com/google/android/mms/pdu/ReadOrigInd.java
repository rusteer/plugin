package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class ReadOrigInd extends GenericPdu {
    public ReadOrigInd() throws InvalidHeaderValueException {
        setMessageType(136);
    }
    ReadOrigInd(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public long getDate() {
        return mPduHeaders.getLongInteger(133);
    }
    @Override
    public EncodedStringValue getFrom() {
        return mPduHeaders.getEncodedStringValue(137);
    }
    public byte[] getMessageId() {
        return mPduHeaders.getTextString(139);
    }
    public int getReadStatus() {
        return mPduHeaders.getOctet(155);
    }
    public EncodedStringValue[] getTo() {
        return mPduHeaders.getEncodedStringValues(151);
    }
    public void setDate(long l) {
        mPduHeaders.setLongInteger(l, 133);
    }
    @Override
    public void setFrom(EncodedStringValue encodedstringvalue) {
        mPduHeaders.setEncodedStringValue(encodedstringvalue, 137);
    }
    public void setMessageId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 139);
    }
    public void setReadStatus(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 155);
    }
    public void setTo(EncodedStringValue aencodedstringvalue[]) {
        mPduHeaders.setEncodedStringValues(aencodedstringvalue, 151);
    }
}
