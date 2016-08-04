.class public Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/ibm/mqtt/MqttAdapter;


# static fields
.field static class$java$net$Socket:Ljava/lang/Class;


# instance fields
.field private s:Ljava/net/Socket;

.field private useShutdownMethods:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->useShutdownMethods:Z

    :try_start_0
    sget-object v0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->class$java$net$Socket:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string v0, "java.net.Socket"

    invoke-static {v0}, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->class$java$net$Socket:Ljava/lang/Class;

    :goto_0
    const-string v1, "shutdownInput"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->useShutdownMethods:Z

    :goto_1
    return-void

    :cond_0
    sget-object v0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->class$java$net$Socket:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    :cond_0
    return-void
.end method

.method public closeInputStream()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->useShutdownMethods:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->shutdownInput()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_0
.end method

.method public closeOutputStream()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    const/4 v1, 0x1

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Ljava/net/Socket;->setSoLinger(ZI)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-boolean v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->useShutdownMethods:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->shutdownOutput()V

    :goto_1
    return-void

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    goto :goto_0
.end method

.method public setConnection(Ljava/lang/String;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v5, 0x6

    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-ge v0, v5, :cond_0

    const/16 v0, 0x40

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    :cond_0
    :try_start_0
    new-instance v1, Lcom/ibm/mqtt/j2se/MqttJava14NetSocket;

    const/4 v2, 0x6

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit16 v4, p2, 0x3e8

    invoke-direct {v1, v2, v3, v4}, Lcom/ibm/mqtt/j2se/MqttJava14NetSocket;-><init>(Ljava/lang/String;II)V

    iput-object v1, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    if-lez p2, :cond_1

    add-int/lit8 v0, p2, 0xf

    mul-int/lit16 v0, v0, 0x3e8

    iget-object v1, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    invoke-virtual {v1, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    :cond_1
    return-void

    :catch_0
    move-exception v1

    new-instance v1, Ljava/net/Socket;

    invoke-virtual {p1, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {v1, v2, v0}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/ibm/mqtt/j2se/MqttJavaNetSocket;->s:Ljava/net/Socket;

    goto :goto_0
.end method
