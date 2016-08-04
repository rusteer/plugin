package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class ReadRecInd extends GenericPdu {
    public ReadRecInd(EncodedStringValue encodedstringvalue, byte abyte0[], int i, int j, EncodedStringValue aencodedstringvalue[]) throws InvalidHeaderValueException {
        setMessageType(135);
        setFrom(encodedstringvalue);
        setMessageId(abyte0);
        setMmsVersion(i);
        setTo(aencodedstringvalue);
        setReadStatus(j);
    }
    ReadRecInd(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public long getDate() {
        return mPduHeaders.getLongInteger(133);
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
