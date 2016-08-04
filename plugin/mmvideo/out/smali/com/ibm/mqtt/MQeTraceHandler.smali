.class public interface abstract Lcom/ibm/mqtt/MQeTraceHandler;
.super Ljava/lang/Object;


# static fields
.field public static final version:[S


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [S

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ibm/mqtt/MQeTraceHandler;->version:[S

    return-void

    nop

    :array_0
    .array-data 0x2
        0x2t 0x0t
        0x0t 0x0t
        0x0t 0x0t
        0x2t 0x0t
    .end array-data
.end method


# virtual methods
.method public abstract setFilter(J)V
.end method

.method public abstract traceMessage(Ljava/lang/Object;SJ)V
.end method

.method public abstract traceMessage(Ljava/lang/Object;SJLjava/lang/Object;)V
.end method

.method public abstract traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;)V
.end method

.method public abstract traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public abstract traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end method
