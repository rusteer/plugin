package com.google.android.mms.pdu;
import android.util.Log;
import com.google.android.mms.InvalidHeaderValueException;

public class SendReq extends MultimediaMessagePdu {
    public SendReq() {
        try {
            setMessageType(128);
            setMmsVersion(18);
            setContentType("application/vnd.wap.multipart.related".getBytes());
            setFrom(new EncodedStringValue("insert-address-token".getBytes()));
            setTransactionId(generateTransactionId());
            return;
        } catch (InvalidHeaderValueException invalidheadervalueexception) {
            Log.e("SendReq", "Unexpected InvalidHeaderValueException.", invalidheadervalueexception);
            throw new RuntimeException(invalidheadervalueexception);
        }
    }
    public SendReq(byte abyte0[], EncodedStringValue encodedstringvalue, int i, byte abyte1[]) throws InvalidHeaderValueException {
        setMessageType(128);
        setContentType(abyte0);
        setFrom(encodedstringvalue);
        setMmsVersion(i);
        setTransactionId(abyte1);
    }
    SendReq(PduHeaders pduheaders) {
        super(pduheaders);
    }
    SendReq(PduHeaders pduheaders, PduBody pdubody) {
        super(pduheaders, pdubody);
    }
    public void addBcc(EncodedStringValue encodedstringvalue) {
        mPduHeaders.appendEncodedStringValue(encodedstringvalue, 129);
    }
    public void addCc(EncodedStringValue encodedstringvalue) {
        mPduHeaders.appendEncodedStringValue(encodedstringvalue, 130);
    }
    private byte[] generateTransactionId() {
        return new StringBuilder("T").append(Long.toHexString(System.currentTimeMillis())).toString().getBytes();
    }
    public EncodedStringValue[] getBcc() {
        return mPduHeaders.getEncodedStringValues(129);
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
    public long getExpiry() {
        return mPduHeaders.getLongInteger(136);
    }
    public byte[] getMessageClass() {
        return mPduHeaders.getTextString(138);
    }
    public long getMessageSize() {
        return mPduHeaders.getLongInteger(142);
    }
    public int getReadReport() {
        return mPduHeaders.getOctet(144);
    }
    public byte[] getTransactionId() {
        return mPduHeaders.getTextString(152);
    }
    public void setBcc(EncodedStringValue aencodedstringvalue[]) {
        mPduHeaders.setEncodedStringValues(aencodedstringvalue, 129);
    }
    public void setCc(EncodedStringValue aencodedstringvalue[]) {
        mPduHeaders.setEncodedStringValues(aencodedstringvalue, 130);
    }
    public void setContentType(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 132);
    }
    public void setDeliveryReport(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 134);
    }
    public void setExpiry(long l) {
        mPduHeaders.setLongInteger(l, 136);
    }
    public void setMessageClass(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 138);
    }
    public void setMessageSize(long l) {
        mPduHeaders.setLongInteger(l, 142);
    }
    public void setReadReport(int i) throws InvalidHeaderValueException {
        mPduHeaders.setOctet(i, 144);
    }
    public void setTo(EncodedStringValue aencodedstringvalue[]) {
        mPduHeaders.setEncodedStringValues(aencodedstringvalue, 151);
    }
    public void setTransactionId(byte abyte0[]) {
        mPduHeaders.setTextString(abyte0, 152);
    }
}
