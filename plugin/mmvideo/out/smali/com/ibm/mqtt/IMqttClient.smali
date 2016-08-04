.class public interface abstract Lcom/ibm/mqtt/IMqttClient;
.super Ljava/lang/Object;


# static fields
.field public static final LOCAL_ID:Ljava/lang/String; = "local://"

.field public static final TCP_ID:Ljava/lang/String; = "tcp://"


# virtual methods
.method public abstract connect(Ljava/lang/String;ZS)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttPersistenceException;,
            Lcom/ibm/mqtt/MqttBrokerUnavailableException;,
            Lcom/ibm/mqtt/MqttNotConnectedException;
        }
    .end annotation
.end method

.method public abstract connect(Ljava/lang/String;ZSLjava/lang/String;ILjava/lang/String;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttPersistenceException;,
            Lcom/ibm/mqtt/MqttBrokerUnavailableException;,
            Lcom/ibm/mqtt/MqttNotConnectedException;
        }
    .end annotation
.end method

.method public abstract disconnect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract getConnection()Ljava/lang/String;
.end method

.method public abstract getPersistence()Lcom/ibm/mqtt/MqttPersistence;
.end method

.method public abstract getRetry()I
.end method

.method public abstract isConnected()Z
.end method

.method public abstract outstanding(I)Z
.end method

.method public abstract ping()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation
.end method

.method public abstract publish(Ljava/lang/String;[BIZ)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttNotConnectedException;,
            Lcom/ibm/mqtt/MqttPersistenceException;,
            Lcom/ibm/mqtt/MqttException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract registerAdvancedHandler(Lcom/ibm/mqtt/MqttAdvancedCallback;)V
.end method

.method public abstract registerSimpleHandler(Lcom/ibm/mqtt/MqttSimpleCallback;)V
.end method

.method public abstract setRetry(I)V
.end method

.method public abstract startTrace()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation
.end method

.method public abstract stopTrace()V
.end method

.method public abstract subscribe([Ljava/lang/String;[I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttNotConnectedException;,
            Lcom/ibm/mqtt/MqttException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract terminate()V
.end method

.method public abstract unsubscribe([Ljava/lang/String;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttNotConnectedException;,
            Lcom/ibm/mqtt/MqttException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method
