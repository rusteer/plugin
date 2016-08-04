package com.google.android.mms;
public class MmsException extends Exception {
    private static final long serialVersionUID = 0x9a5e9715137241b2L;
    public MmsException() {}
    public MmsException(String s) {
        super(s);
    }
    public MmsException(String s, Throwable throwable) {
        super(s, throwable);
    }
    public MmsException(Throwable throwable) {
        super(throwable);
    }
}
