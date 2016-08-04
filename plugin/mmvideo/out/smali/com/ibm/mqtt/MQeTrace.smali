.class public Lcom/ibm/mqtt/MQeTrace;
.super Ljava/lang/Object;


# static fields
.field public static final DEBUG:Z = false

.field public static final GROUP_ADAPTER_CALLING:J = 0x10L

.field public static final GROUP_ADAPTER_RETURNED:J = 0x20L

.field public static final GROUP_ADMINISTRATION:J = 0x4000L

.field public static final GROUP_API:J = 0x100000L

.field public static final GROUP_BRIDGE:J = 0x100L

.field public static final GROUP_CHANNEL_MANAGEMENT:J = 0x400L

.field public static final GROUP_COMMS_INCOMING:J = 0x40000L

.field public static final GROUP_COMMS_OUTGOING:J = 0x200L

.field public static final GROUP_ENTRY:J = 0x4L

.field public static final GROUP_ERROR:J = 0x1L

.field public static final GROUP_EXCEPTION:J = 0x8000L

.field public static final GROUP_EXIT:J = 0x8L

.field public static final GROUP_INFO:J = 0x200000L

.field public static final GROUP_JMS:J = 0x10000L

.field public static final GROUP_MASK_ALL:J = -0x1L

.field public static final GROUP_MASK_DEFAULT:J = -0x800001L

.field public static final GROUP_MASK_IBM_DEFINED:J = 0xffffffffffffL

.field public static final GROUP_MASK_NONE:J = 0x0L

.field public static final GROUP_MASK_USER_DEFINED:J = -0x1000000000000L

.field public static final GROUP_MESSAGE_STATE:J = 0x800L

.field public static final GROUP_MESSAGE_STORE:J = 0x2000L

.field public static final GROUP_MQSERIES:J = 0x800000L

.field public static final GROUP_QUEUE_MANAGER:J = 0x400000L

.field public static final GROUP_RULE_CALLING:J = 0x40L

.field public static final GROUP_RULE_RETURNED:J = 0x80L

.field public static final GROUP_SECURITY:J = 0x20000L

.field public static final GROUP_THREAD_CONTROL:J = 0x1000L

.field public static final GROUP_TRANSACTION:J = 0x80000L

.field public static final GROUP_USER_DEFINED_1:J = 0x1000000000000L

.field public static final GROUP_USER_DEFINED_2:J = 0x2000000000000L

.field public static final GROUP_USER_DEFINED_3:J = 0x4000000000000L

.field public static final GROUP_USER_DEFINED_4:J = 0x8000000000000L

.field public static final GROUP_WARNING:J = 0x2L

.field public static final TRACE_NUMBER_USER_DEFINED_MAX:S = 0x7fffs

.field public static final TRACE_NUMBER_USER_DEFINED_MIN:S = 0x1s

.field private static volatile filterMask:J

.field private static lock:Ljava/lang/String;

.field private static nullStr:Ljava/lang/String;

.field private static volatile traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

.field public static version:[S


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x4

    new-array v0, v0, [S

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ibm/mqtt/MQeTrace;->version:[S

    const/4 v0, 0x0

    sput-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    const-string v0, ""

    sput-object v0, Lcom/ibm/mqtt/MQeTrace;->lock:Ljava/lang/String;

    const-string v0, "<null>"

    sput-object v0, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    const-wide/32 v0, -0x800001

    sput-wide v0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

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

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFilter()J
    .locals 2

    sget-wide v0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    return-wide v0
.end method

.method public static getHandler()Lcom/ibm/mqtt/MQeTraceHandler;
    .locals 1

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    return-object v0
.end method

.method public static setFilter(J)V
    .locals 5

    sget-object v1, Lcom/ibm/mqtt/MQeTrace;->lock:Ljava/lang/String;

    monitor-enter v1

    const/4 v0, 0x0

    const/16 v2, -0x5334

    const-wide/32 v3, 0x100004

    :try_start_0
    invoke-static {v0, v2, v3, v4}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    sget-wide v2, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    sput-wide p0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    invoke-interface {v0, p0, p1}, Lcom/ibm/mqtt/MQeTraceHandler;->setFilter(J)V

    :cond_0
    const/4 v0, 0x0

    const/16 v2, -0x5335

    const-wide/32 v3, 0x100008

    invoke-static {v0, v2, v3, v4}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setHandler(Lcom/ibm/mqtt/MQeTraceHandler;)Lcom/ibm/mqtt/MQeTraceHandler;
    .locals 5

    sget-object v1, Lcom/ibm/mqtt/MQeTrace;->lock:Ljava/lang/String;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    sput-object p0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    sget-object v2, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    invoke-static {}, Lcom/ibm/mqtt/MQeTrace;->getFilter()J

    move-result-wide v3

    invoke-interface {v2, v3, v4}, Lcom/ibm/mqtt/MQeTraceHandler;->setFilter(J)V

    :cond_0
    if-eqz v0, :cond_1

    const-wide/16 v2, 0x0

    invoke-interface {v0, v2, v3}, Lcom/ibm/mqtt/MQeTraceHandler;->setFilter(J)V

    :cond_1
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static trace(Ljava/lang/Object;SJ)V
    .locals 4

    sget-wide v0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    and-long/2addr v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/ibm/mqtt/MQeTraceHandler;->traceMessage(Ljava/lang/Object;SJ)V

    :cond_0
    return-void
.end method

.method public static trace(Ljava/lang/Object;SJLjava/lang/Object;)V
    .locals 6

    sget-wide v0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    and-long/2addr v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    if-eqz v0, :cond_0

    if-nez p4, :cond_1

    sget-object v5, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_0
    move-object v1, p0

    move v2, p1

    move-wide v3, p2

    invoke-interface/range {v0 .. v5}, Lcom/ibm/mqtt/MQeTraceHandler;->traceMessage(Ljava/lang/Object;SJLjava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    move-object v5, p4

    goto :goto_0
.end method

.method public static trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    sget-wide v0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    and-long/2addr v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    if-eqz v0, :cond_0

    if-nez p4, :cond_2

    sget-object v5, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_0
    if-nez p5, :cond_1

    sget-object v6, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_1
    move-object v1, p0

    move v2, p1

    move-wide v3, p2

    invoke-interface/range {v0 .. v6}, Lcom/ibm/mqtt/MQeTraceHandler;->traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    move-object v6, p5

    goto :goto_1

    :cond_2
    move-object v5, p4

    goto :goto_0
.end method

.method public static trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 8

    sget-wide v0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    and-long/2addr v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    if-eqz v0, :cond_0

    if-nez p4, :cond_3

    sget-object v5, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_0
    if-nez p5, :cond_2

    sget-object v6, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_1
    if-nez p6, :cond_1

    sget-object v7, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_2
    move-object v1, p0

    move v2, p1

    move-wide v3, p2

    invoke-interface/range {v0 .. v7}, Lcom/ibm/mqtt/MQeTraceHandler;->traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    move-object v7, p6

    goto :goto_2

    :cond_2
    move-object v6, p5

    goto :goto_1

    :cond_3
    move-object v5, p4

    goto :goto_0
.end method

.method public static trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 9

    sget-wide v0, Lcom/ibm/mqtt/MQeTrace;->filterMask:J

    and-long/2addr v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ibm/mqtt/MQeTrace;->traceHandler:Lcom/ibm/mqtt/MQeTraceHandler;

    if-eqz v0, :cond_0

    if-nez p4, :cond_4

    sget-object v5, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_0
    if-nez p5, :cond_3

    sget-object v6, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_1
    if-nez p6, :cond_2

    sget-object v7, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_2
    if-nez p7, :cond_1

    sget-object v8, Lcom/ibm/mqtt/MQeTrace;->nullStr:Ljava/lang/String;

    :goto_3
    move-object v1, p0

    move v2, p1

    move-wide v3, p2

    invoke-interface/range {v0 .. v8}, Lcom/ibm/mqtt/MQeTraceHandler;->traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    move-object/from16 v8, p7

    goto :goto_3

    :cond_2
    move-object v7, p6

    goto :goto_2

    :cond_3
    move-object v6, p5

    goto :goto_1

    :cond_4
    move-object v5, p4

    goto :goto_0
.end method
