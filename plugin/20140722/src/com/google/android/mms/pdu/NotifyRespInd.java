package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class NotifyRespInd extends GenericPdu {
    public NotifyRespInd(int i, byte abyte0[], int j) throws InvalidHeaderValueException {
        setMessageType(131);
        setMmsVersion(i);
        setTransactionId(abyte0);
        setStatus(j);
    }
    NotifyRespInd(PduHeaders pduheaders) {
        super(pduheaders);
    }
    public int getReportAllowed() {
        return mPduHeaders.getOctet(145);
    }
    public int getStatus() {
        return mPduHeaders.getOctet(149);
    }
    public byte[] getTransactionId() {
        return mPduHeaders.getTextString(152);
    }
    public void setReportAllowed(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 145);
    }
    public void setStatus(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 149);
    }
    public void setTransactionId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 152);
    }
}
