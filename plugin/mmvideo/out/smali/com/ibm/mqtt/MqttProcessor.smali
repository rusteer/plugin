.class public interface abstract Lcom/ibm/mqtt/MqttProcessor;
.super Ljava/lang/Object;


# virtual methods
.method public abstract process(Lcom/ibm/mqtt/MqttConnack;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttConnect;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttDisconnect;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttPingreq;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttPingresp;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttPuback;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttPubcomp;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttPublish;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttPubrec;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttPubrel;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttSuback;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttSubscribe;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttUnsuback;)V
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttUnsubscribe;)V
.end method

.method public abstract supportTopicNameCompression()Z
.end method
