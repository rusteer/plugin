package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class SendConf extends GenericPdu {
    public SendConf() throws InvalidHeaderValueException {
        setMessageType(129);
    }
    SendConf(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public byte[] getMessageId() {
        return mPduHeaders.getTextString(139);
    }
    public int getResponseStatus() {
        return mPduHeaders.getOctet(146);
    }
    public byte[] getTransactionId() {
        return mPduHeaders.getTextString(152);
    }
    public void setMessageId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 139);
    }
    public void setResponseStatus(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 146);
    }
    public void setTransactionId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 152);
    }
}
