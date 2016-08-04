package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class AcknowledgeInd extends GenericPdu {
    public AcknowledgeInd(int i, byte abyte0[]) throws InvalidHeaderValueException {
        setMessageType(133);
        setMmsVersion(i);
        setTransactionId(abyte0);
    }
    AcknowledgeInd(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public int getReportAllowed() {
        return mPduHeaders.getOctet(145);
    }
    public byte[] getTransactionId() {
        return mPduHeaders.getTextString(152);
    }
    public void setReportAllowed(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 145);
    }
    public void setTransactionId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 152);
    }
}
