package com.google.android.mms.pdu;
import com.google.android.mms.InvalidHeaderValueException;

public class RetrieveConf extends MultimediaMessagePdu {
    public RetrieveConf() throws InvalidHeaderValueException {
        setMessageType(132);
    }
    RetrieveConf(PduHeaders pduheaders) {
        super(pduheaders);
    }
    RetrieveConf(PduHeaders pduheaders, PduBody pdubody) {
        super(pduheaders, pdubody);
    }
    public void addCc(EncodedStringValue encodedstringvalue) {
        mPduHeaders.appendEncodedStringValue(encodedstringvalue, 130);
    }
    public EncodedStringValue[] getCc() {
        return mPduHeaders.getEncodedStringValues(130);
    }
    public byte[] getContentType() {
        return mPduHeaders.getTextString(132);
    }
    public int getDeliveryReport() {
        return mPduHeaders.getOctet(134);
    }
    @Override
    public EncodedStringValue getFrom() {
        return mPduHeaders.getEncodedStringValue(137);
    }
    public byte[] getMessageClass() {
        return mPduHeaders.getTextString(138);
    }
    public byte[] getMessageId() {
        return mPduHeaders.getTextString(139);
    }
    public int getReadReport() {
        return mPduHeaders.getOctet(144);
    }
    public int getRetrieveStatus() {
        return mPduHeaders.getOctet(153);
    }
    public EncodedStringValue getRetrieveText() {
        return mPduHeaders.getEncodedStringValue(154);
    }
    public byte[] getTransactionId() {
        return mPduHeaders.getTextString(152);
    }
    public void setContentType(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 132);
    }
    public void setDeliveryReport(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 134);
    }
    @Override
    public void setFrom(EncodedStringValue encodedstringvalue) {
        mPduHeaders.setEncodedStringValue(encodedstringvalue, 137);
    }
    public void setMessageClass(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 138);
    }
    public void setMessageId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 139);
    }
    public void setReadReport(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 144);
    }
    public void setRetrieveStatus(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 153);
    }
    public void setRetrieveText(EncodedStringValue encodedstringvalue) {
        mPduHeaders.setEncodedStringValue(encodedstringvalue, 154);
    }
    public void setTransactionId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 152);
    }
}
