.class public Lorg/xmlrpc/android/XMLRPCClient;
.super Lorg/xmlrpc/android/XMLRPCCommon;
.source "XMLRPCClient.java"


# instance fields
.field private client:Lorg/apache/http/client/HttpClient;

.field private httpParams:Lorg/apache/http/params/HttpParams;

.field private postMethod:Lorg/apache/http/client/methods/HttpPost;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "url"

    .prologue
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "http://mm.xizitu.com"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/net/URI;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "url"
    .parameter "username"
    .parameter "password"

    .prologue
    .line 134
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 3
    .parameter "uri"

    .prologue
    .line 82
    invoke-direct {p0}, Lorg/xmlrpc/android/XMLRPCCommon;-><init>()V

    .line 83
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/net/URI;)V

    iput-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->postMethod:Lorg/apache/http/client/methods/HttpPost;

    .line 84
    iget-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->postMethod:Lorg/apache/http/client/methods/HttpPost;

    const-string v1, "Content-Type"

    const-string v2, "text/xml"

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->postMethod:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpPost;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    iput-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->httpParams:Lorg/apache/http/params/HttpParams;

    .line 90
    iget-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->httpParams:Lorg/apache/http/params/HttpParams;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpProtocolParams;->setUseExpectContinue(Lorg/apache/http/params/HttpParams;Z)V

    .line 91
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    iput-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->client:Lorg/apache/http/client/HttpClient;

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "uri"
    .parameter "username"
    .parameter "password"

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/net/URI;)V

    .line 122
    iget-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->client:Lorg/apache/http/client/HttpClient;

    check-cast v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v0

    .line 123
    new-instance v1, Lorg/apache/http/auth/AuthScope;

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v3

    sget-object v4, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 124
    new-instance v2, Lorg/apache/http/auth/UsernamePasswordCredentials;

    invoke-direct {v2, p2, p3}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-interface {v0, v1, v2}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 110
    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/net/URI;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "url"
    .parameter "username"
    .parameter "password"

    .prologue
    .line 144
    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method private methodCall(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .parameter "method"
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

    .line 246
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 247
    .local v0, bodyWriter:Ljava/io/StringWriter;
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCClient;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v0}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V

    .line 248
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCClient;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v3, v3}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 249
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCClient;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "methodCall"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 251
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCClient;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "methodName"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v1

    const-string v2, "methodName"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 253
    invoke-virtual {p0, p2}, Lorg/xmlrpc/android/XMLRPCClient;->serializeParams([Ljava/lang/Object;)V

    .line 255
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCClient;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "methodCall"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 256
    iget-object v1, p0, Lorg/xmlrpc/android/XMLRPCClient;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 258
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public call(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter "method"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 269
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 281
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 282
    aput-object p2, v0, v1

    .line 284
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .parameter "p1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 297
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 298
    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    .line 300
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .parameter "p1"
    .parameter "p2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 314
    const/4 v1, 0x3

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 315
    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    .line 317
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 332
    const/4 v1, 0x4

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 333
    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    const/4 v1, 0x3

    aput-object p5, v0, v1

    .line 335
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"
    .parameter "p4"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 351
    const/4 v1, 0x5

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 352
    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    const/4 v1, 0x3

    aput-object p5, v0, v1

    const/4 v1, 0x4

    aput-object p6, v0, v1

    .line 354
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"
    .parameter "p4"
    .parameter "p5"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 371
    const/4 v1, 0x6

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 372
    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    const/4 v1, 0x3

    aput-object p5, v0, v1

    const/4 v1, 0x4

    aput-object p6, v0, v1

    const/4 v1, 0x5

    aput-object p7, v0, v1

    .line 374
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"
    .parameter "p4"
    .parameter "p5"
    .parameter "p6"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 392
    const/4 v1, 0x7

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 393
    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    const/4 v1, 0x3

    aput-object p5, v0, v1

    const/4 v1, 0x4

    aput-object p6, v0, v1

    const/4 v1, 0x5

    aput-object p7, v0, v1

    const/4 v1, 0x6

    aput-object p8, v0, v1

    .line 395
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public call(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "method"
    .parameter "p0"
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"
    .parameter "p4"
    .parameter "p5"
    .parameter "p6"
    .parameter "p7"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 414
    const/16 v1, 0x8

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 415
    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const/4 v1, 0x2

    aput-object p4, v0, v1

    const/4 v1, 0x3

    aput-object p5, v0, v1

    const/4 v1, 0x4

    aput-object p6, v0, v1

    const/4 v1, 0x5

    aput-object p7, v0, v1

    const/4 v1, 0x6

    aput-object p8, v0, v1

    const/4 v1, 0x7

    aput-object p9, v0, v1

    .line 417
    .local v0, params:[Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lorg/xmlrpc/android/XMLRPCClient;->callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public callEx(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 15
    .parameter "method"
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlrpc/android/XMLRPCException;
        }
    .end annotation

    .prologue
    .line 173
    :try_start_0
    invoke-direct/range {p0 .. p2}, Lorg/xmlrpc/android/XMLRPCClient;->methodCall(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, body:Ljava/lang/String;
    new-instance v2, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v2, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 177
    .local v2, entity:Lorg/apache/http/HttpEntity;
    iget-object v12, p0, Lorg/xmlrpc/android/XMLRPCClient;->postMethod:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v12, v2}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 181
    iget-object v12, p0, Lorg/xmlrpc/android/XMLRPCClient;->client:Lorg/apache/http/client/HttpClient;

    iget-object v13, p0, Lorg/xmlrpc/android/XMLRPCClient;->postMethod:Lorg/apache/http/client/methods/HttpPost;

    invoke-interface {v12, v13}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    .line 185
    .local v9, response:Lorg/apache/http/HttpResponse;
    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v12

    invoke-interface {v12}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v10

    .line 187
    .local v10, statusCode:I
    const/16 v12, 0xc8

    if-eq v10, v12, :cond_0

    .line 188
    new-instance v12, Lorg/xmlrpc/android/XMLRPCException;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "HTTP status code: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " != "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0xc8

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/xmlrpc/android/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 234
    .end local v0           #body:Ljava/lang/String;
    .end local v2           #entity:Lorg/apache/http/HttpEntity;
    .end local v9           #response:Lorg/apache/http/HttpResponse;
    .end local v10           #statusCode:I
    :catch_0
    move-exception v1

    .line 236
    .local v1, e:Lorg/xmlrpc/android/XMLRPCException;
    throw v1

    .line 194
    .end local v1           #e:Lorg/xmlrpc/android/XMLRPCException;
    .restart local v0       #body:Ljava/lang/String;
    .restart local v2       #entity:Lorg/apache/http/HttpEntity;
    .restart local v9       #response:Lorg/apache/http/HttpResponse;
    .restart local v10       #statusCode:I
    :cond_0
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v12

    invoke-virtual {v12}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v7

    .line 195
    .local v7, pullParser:Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    .line 196
    new-instance v8, Ljava/io/InputStreamReader;

    new-instance v12, Ljava/io/BufferedInputStream;

    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v13

    const v14, 0xc8000

    invoke-direct {v12, v13, v14}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {v8, v12}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 199
    .local v8, reader:Ljava/io/Reader;
    invoke-interface {v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 202
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 203
    const/4 v12, 0x2

    const/4 v13, 0x0

    const-string v14, "methodResponse"

    invoke-interface {v7, v12, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 205
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 206
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 207
    .local v11, tag:Ljava/lang/String;
    const-string v12, "params"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 209
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 210
    const/4 v12, 0x2

    const/4 v13, 0x0

    const-string v14, "param"

    invoke-interface {v7, v12, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 211
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 215
    iget-object v12, p0, Lorg/xmlrpc/android/XMLRPCClient;->iXMLRPCSerializer:Lorg/xmlrpc/android/IXMLRPCSerializer;

    invoke-interface {v12, v7}, Lorg/xmlrpc/android/IXMLRPCSerializer;->deserialize(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v6

    .line 216
    .local v6, obj:Ljava/lang/Object;
    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 217
    return-object v6

    .line 219
    .end local v6           #obj:Ljava/lang/Object;
    :cond_1
    const-string v12, "fault"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 221
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 225
    iget-object v12, p0, Lorg/xmlrpc/android/XMLRPCClient;->iXMLRPCSerializer:Lorg/xmlrpc/android/IXMLRPCSerializer;

    invoke-interface {v12, v7}, Lorg/xmlrpc/android/IXMLRPCSerializer;->deserialize(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 226
    .local v5, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v12, "faultString"

    invoke-interface {v5, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 227
    .local v4, faultString:Ljava/lang/String;
    const-string v12, "faultCode"

    invoke-interface {v5, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 228
    .local v3, faultCode:I
    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 229
    new-instance v12, Lorg/xmlrpc/android/XMLRPCFault;

    invoke-direct {v12, v4, v3}, Lorg/xmlrpc/android/XMLRPCFault;-><init>(Ljava/lang/String;I)V

    throw v12
    :try_end_1
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 237
    .end local v0           #body:Ljava/lang/String;
    .end local v2           #entity:Lorg/apache/http/HttpEntity;
    .end local v3           #faultCode:I
    .end local v4           #faultString:Ljava/lang/String;
    .end local v5           #map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7           #pullParser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v8           #reader:Ljava/io/Reader;
    .end local v9           #response:Lorg/apache/http/HttpResponse;
    .end local v10           #statusCode:I
    .end local v11           #tag:Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 238
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 240
    new-instance v12, Lorg/xmlrpc/android/XMLRPCException;

    invoke-direct {v12, v1}, Lorg/xmlrpc/android/XMLRPCException;-><init>(Ljava/lang/Exception;)V

    throw v12

    .line 231
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v0       #body:Ljava/lang/String;
    .restart local v2       #entity:Lorg/apache/http/HttpEntity;
    .restart local v7       #pullParser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v8       #reader:Ljava/io/Reader;
    .restart local v9       #response:Lorg/apache/http/HttpResponse;
    .restart local v10       #statusCode:I
    .restart local v11       #tag:Ljava/lang/String;
    :cond_2
    :try_start_2
    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 232
    new-instance v12, Lorg/xmlrpc/android/XMLRPCException;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Bad tag <"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "> in XMLRPC response - neither <params> nor <fault>"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/xmlrpc/android/XMLRPCException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_2
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
.end method

.method public setBasicAuthentication(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "username"
    .parameter "password"

    .prologue
    .line 153
    iget-object v0, p0, Lorg/xmlrpc/android/XMLRPCClient;->client:Lorg/apache/http/client/HttpClient;

    check-cast v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v0

    .line 154
    new-instance v1, Lorg/apache/http/auth/AuthScope;

    iget-object v2, p0, Lorg/xmlrpc/android/XMLRPCClient;->postMethod:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v2}, Lorg/apache/http/client/methods/HttpPost;->getURI()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/xmlrpc/android/XMLRPCClient;->postMethod:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v3}, Lorg/apache/http/client/methods/HttpPost;->getURI()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->getPort()I

    move-result v3

    .line 155
    sget-object v4, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    .line 154
    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 156
    new-instance v2, Lorg/apache/http/auth/UsernamePasswordCredentials;

    invoke-direct {v2, p1, p2}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    invoke-interface {v0, v1, v2}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 157
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
