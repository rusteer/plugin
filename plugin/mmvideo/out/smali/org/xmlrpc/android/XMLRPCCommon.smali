.class Lorg/xmlrpc/android/XMLRPCCommon;
.super Ljava/lang/Object;
.source "XMLRPCCommon.java"


# instance fields
.field protected iXMLRPCSerializer:Lorg/xmlrpc/android/IXMLRPCSerializer;

.field protected serializer:Lorg/xmlpull/v1/XmlSerializer;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    iput-object v0, p0, Lorg/xmlrpc/android/XMLRPCCommon;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    .line 16
    new-instance v0, Lorg/xmlrpc/android/XMLRPCSerializer;

    invoke-direct {v0}, Lorg/xmlrpc/android/XMLRPCSerializer;-><init>()V

    iput-object v0, p0, Lorg/xmlrpc/android/XMLRPCCommon;->iXMLRPCSerializer:Lorg/xmlrpc/android/IXMLRPCSerializer;

    .line 17
    return-void
.end method


# virtual methods
.method protected serializeParams([Ljava/lang/Object;)V
    .locals 5
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 30
    if-eqz p1, :cond_0

    array-length v1, p1

    if-eqz v1, :cond_0

    .line 33
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCCommon;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "params"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 34
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_1

    .line 39
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCCommon;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "params"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 41
    .end local v0           #i:I
    :cond_0
    return-void

    .line 35
    .restart local v0       #i:I
    :cond_1
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCCommon;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "param"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v1

    const-string v2, "value"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 36
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCCommon;->iXMLRPCSerializer:Lorg/xmlrpc/android/IXMLRPCSerializer;

    iget-object v2, p0, Lorg/xmlrpc/android/XMLRPCCommon;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    aget-object v3, p1, v0

    invoke-interface {v1, v2, v3}, Lorg/xmlrpc/android/IXMLRPCSerializer;->serialize(Lorg/xmlpull/v1/XmlSerializer;Ljava/lang/Object;)V

    .line 37
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCCommon;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "value"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v1

    const-string v2, "param"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 34
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setSerializer(Lorg/xmlrpc/android/IXMLRPCSerializer;)V
    .locals 0
    .parameter "serializer"

    .prologue
    .line 26
    iput-object p1, p0, Lorg/xmlrpc/android/XMLRPCCommon;->iXMLRPCSerializer:Lorg/xmlrpc/android/IXMLRPCSerializer;

    .line 27
    return-void
.end method
