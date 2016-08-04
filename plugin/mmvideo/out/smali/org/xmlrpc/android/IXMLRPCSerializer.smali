.class public interface abstract Lorg/xmlrpc/android/IXMLRPCSerializer;
.super Ljava/lang/Object;
.source "IXMLRPCSerializer.java"


# static fields
.field public static final DATETIME_FORMAT:Ljava/lang/String; = "yyyyMMdd\'T\'HH:mm:ss"

.field public static final TAG_DATA:Ljava/lang/String; = "data"

.field public static final TAG_MEMBER:Ljava/lang/String; = "member"

.field public static final TAG_NAME:Ljava/lang/String; = "name"

.field public static final TAG_VALUE:Ljava/lang/String; = "value"

.field public static final TYPE_ARRAY:Ljava/lang/String; = "array"

.field public static final TYPE_BASE64:Ljava/lang/String; = "base64"

.field public static final TYPE_BOOLEAN:Ljava/lang/String; = "boolean"

.field public static final TYPE_DATE_TIME_ISO8601:Ljava/lang/String; = "dateTime.iso8601"

.field public static final TYPE_DOUBLE:Ljava/lang/String; = "double"

.field public static final TYPE_I4:Ljava/lang/String; = "i4"

.field public static final TYPE_I8:Ljava/lang/String; = "i8"

.field public static final TYPE_INT:Ljava/lang/String; = "int"

.field public static final TYPE_STRING:Ljava/lang/String; = "string"

.field public static final TYPE_STRUCT:Ljava/lang/String; = "struct"


# virtual methods
.method public abstract deserialize(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract serialize(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
