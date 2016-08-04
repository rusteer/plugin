.class Lcom/webuid/mmVideo/DigitalClock$1;
.super Ljava/lang/Object;
.source "DigitalClock.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/DigitalClock;->onAttachedToWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/DigitalClock;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/DigitalClock;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const-wide/16 v7, 0x3e8

    .line 69
    iget-object v4, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    #getter for: Lcom/webuid/mmVideo/DigitalClock;->mTickerStopped:Z
    invoke-static {v4}, Lcom/webuid/mmVideo/DigitalClock;->access$1(Lcom/webuid/mmVideo/DigitalClock;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 77
    :goto_0
    return-void

    .line 71
    :cond_0
    iget-object v4, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    iget-object v4, v4, Lcom/webuid/mmVideo/DigitalClock;->mCalendar:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 72
    iget-object v4, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    iget-object v5, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    iget-object v5, v5, Lcom/webuid/mmVideo/DigitalClock;->mFormat:Ljava/lang/String;

    iget-object v6, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    iget-object v6, v6, Lcom/webuid/mmVideo/DigitalClock;->mCalendar:Ljava/util/Calendar;

    invoke-static {v5, v6}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/webuid/mmVideo/DigitalClock;->setText(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v4, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    invoke-virtual {v4}, Lcom/webuid/mmVideo/DigitalClock;->invalidate()V

    .line 74
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 75
    .local v2, now:J
    rem-long v4, v2, v7

    sub-long v4, v7, v4

    add-long v0, v2, v4

    .line 76
    .local v0, next:J
    iget-object v4, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    #getter for: Lcom/webuid/mmVideo/DigitalClock;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/webuid/mmVideo/DigitalClock;->access$2(Lcom/webuid/mmVideo/DigitalClock;)Landroid/os/Handler;

    move-result-object v4

    iget-object v5, p0, Lcom/webuid/mmVideo/DigitalClock$1;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    #getter for: Lcom/webuid/mmVideo/DigitalClock;->mTicker:Ljava/lang/Runnable;
    invoke-static {v5}, Lcom/webuid/mmVideo/DigitalClock;->access$3(Lcom/webuid/mmVideo/DigitalClock;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-virtual {v4, v5, v0, v1}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
