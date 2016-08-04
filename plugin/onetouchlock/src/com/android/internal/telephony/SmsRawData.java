package com.android.internal.telephony;
import android.os.Parcel;
import android.os.Parcelable;

/**
 * A parcelable holder class of byte[] for ISms aidl implementation
 */
public class SmsRawData implements Parcelable {
    byte[] data;
    //Static Methods
    public static final Parcelable.Creator<SmsRawData> CREATOR = new Parcelable.Creator<SmsRawData>() {
        @Override
        public SmsRawData createFromParcel(Parcel source) {
            int size;
            size = source.readInt();
            byte[] data = new byte[size];
            source.readByteArray(data);
            return new SmsRawData(data);
        }
        @Override
        public SmsRawData[] newArray(int size) {
            return new SmsRawData[size];
        }
    };
    // Constructor
    public SmsRawData(byte[] data) {
        this.data = data;
    }
    @Override
    public int describeContents() {
        return 0;
    }
    public byte[] getBytes() {
        return data;
    }
    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(data.length);
        dest.writeByteArray(data);
    }
}