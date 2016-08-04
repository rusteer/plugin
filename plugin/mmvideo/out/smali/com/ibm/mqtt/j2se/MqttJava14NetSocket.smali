.class public Lcom/ibm/mqtt/j2se/MqttJava14NetSocket;
.super Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/net/Socket;-><init>()V

    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-direct {v0, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p0, v0, p3}, Lcom/ibm/mqtt/j2se/MqttJava14NetSocket;->connect(Ljava/net/SocketAddress;I)V

    return-void
.end method
