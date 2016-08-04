package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class DeliveryInd extends GenericPdu {
    public DeliveryInd() throws InvalidHeaderValueException {
        setMessageType(134);
    }
    DeliveryInd(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public long getDate() {
        return mPduHeaders.getLongInteger(133);
    }
    public byte[] getMessageId() {
        return mPduHeaders.getTextString(139);
    }
    public int getStatus() {
        return mPduHeaders.getOctet(149);
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
    public void setStatus(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 149);
    }
    public void setTo(EncodedStringValue aencodedstringvalue[]) {
        mPduHeaders.setEncodedStringValues(aencodedstringvalue, 151);
    }
}
