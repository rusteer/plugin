.class public interface abstract Lcom/ibm/mqtt/MqttPersistence;
.super Ljava/lang/Object;


# virtual methods
.method public abstract addReceivedMessage(I[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract addSentMessage(I[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract close()V
.end method

.method public abstract delReceivedMessage(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract delSentMessage(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract getAllReceivedMessages()[[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract getAllSentMessages()[[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract open(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract reset()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method

.method public abstract updSentMessage(I[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation
.end method
