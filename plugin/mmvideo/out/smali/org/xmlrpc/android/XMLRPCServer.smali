.class public Lorg/xmlrpc/android/XMLRPCServer;
.super Lorg/xmlrpc/android/XMLRPCCommon;
.source "XMLRPCServer.java"


# static fields
.field private static final NEWLINES:Ljava/lang/String; = "\n\n"

.field private static final RESPONSE:Ljava/lang/String; = "HTTP/1.1 200 OK\nConnection: close\nContent-Type: text/xml\nContent-Length: "


# instance fields
.field private iXMLRPCSerializer:Lorg/xmlrpc/android/XMLRPCSerializer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/xmlrpc/android/XMLRPCCommon;-><init>()V

    .line 30
    new-instance v0, Lorg/xmlrpc/android/XMLRPCSerializer;

    invoke-direct {v0}, Lorg/xmlrpc/android/XMLRPCSerializer;-><init>()V

    iput-object v0, p0, Lorg/xmlrpc/android/XMLRPCServer;->iXMLRPCSerializer:Lorg/xmlrpc/android/XMLRPCSerializer;

    .line 31
    return-void
.end method

.method private methodResponse([Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 98
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 99
    .local v0, bodyWriter:Ljava/io/StringWriter;
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCServer;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v0}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V

    .line 100
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCServer;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v3, v3}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 101
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCServer;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "methodResponse"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 103
    invoke-virtual {p0, p1}, Lorg/xmlrpc/android/XMLRPCServer;->serializeParams([Ljava/lang/Object;)V

    .line 105
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCServer;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "methodResponse"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 106
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCServer;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 108
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public readMethodCall(Ljava/net/Socket;)Lorg/xmlrpc/android/MethodCall;
    .locals 8
    .parameter "socket"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 35
    new-instance v1, Lorg/xmlrpc/android/MethodCall;

    invoke-direct {v1}, Lorg/xmlrpc/android/MethodCall;-><init>()V

    .line 36
    .local v1, methodCall:Lorg/xmlrpc/android/MethodCall;
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 38
    .local v0, inputStream:Ljava/io/InputStream;
    invoke-virtual {p0, v0}, Lorg/xmlrpc/android/XMLRPCServer;->xmlPullParserFromSocket(Ljava/io/InputStream;)Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v3

    .line 40
    .local v3, pullParser:Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 41
    const-string v4, "methodCall"

    invoke-interface {v3, v7, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 42
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 43
    const-string v4, "methodName"

    invoke-interface {v3, v7, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 45
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/xmlrpc/android/MethodCall;->setMethodName(Ljava/lang/String;)V

    .line 47
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 48
    const-string v4, "params"

    invoke-interface {v3, v7, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 49
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 53
    :cond_0
    const-string v4, "param"

    invoke-interface {v3, v7, v6, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 56
    iget-object v4, p0, Lorg/xmlrpc/android/XMLRPCServer;->iXMLRPCSerializer:Lorg/xmlrpc/android/XMLRPCSerializer;

    invoke-virtual {v4, v3}, Lorg/xmlrpc/android/XMLRPCSerializer;->deserialize(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v2

    .line 57
    .local v2, param:Ljava/lang/Object;
    iget-object v4, v1, Lorg/xmlrpc/android/MethodCall;->params:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 60
    const/4 v4, 0x3

    const-string v5, "param"

    invoke-interface {v3, v4, v6, v5}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 63
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "params"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 51
    if-eqz v4, :cond_0

    .line 65
    return-object v1
.end method

.method public respond(Ljava/net/Socket;[Ljava/lang/Object;)V
    .locals 6
    .parameter "socket"
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0, p2}, Lorg/xmlrpc/android/XMLRPCServer;->methodResponse([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, content:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "HTTP/1.1 200 OK\nConnection: close\nContent-Type: text/xml\nContent-Length: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 88
    .local v2, response:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 89
    .local v1, outputStream:Ljava/io/OutputStream;
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 90
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 91
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 92
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 93
    const-string v3, "XMLRPC"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "response:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    return-void
.end method

.method public bridge synthetic setSerializer(Lorg/xmlrpc/android/IXMLRPCSerializer;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lorg/xmlrpc/android/XMLRPCCommon;->setSerializer(Lorg/xmlrpc/android/IXMLRPCSerializer;)V

    return-void
.end method

.method xmlPullParserFromSocket(Ljava/io/InputStream;)Lorg/xmlpull/v1/XmlPullParser;
    .locals 8
    .parameter "socketInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 70
    const-string v5, ""

    .line 71
    .local v5, xmlRpcText:Ljava/lang/String;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 72
    .local v0, br:Ljava/io/BufferedReader;
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, line:Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-gtz v6, :cond_0

    .line 73
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->ready()Z

    move-result v6

    if-nez v6, :cond_2

    .line 77
    new-instance v1, Ljava/io/ByteArrayInputStream;

    const-string v6, "UTF-8"

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 78
    .local v1, inputStream:Ljava/io/InputStream;
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v6

    invoke-virtual {v6}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v3

    .line 79
    .local v3, pullParser:Lorg/xmlpull/v1/XmlPullParser;
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 80
    .local v4, streamReader:Ljava/io/Reader;
    invoke-interface {v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 81
    return-object v3

    .line 74
    .end local v1           #inputStream:Ljava/io/InputStream;
    .end local v3           #pullParser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v4           #streamReader:Ljava/io/Reader;
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method
