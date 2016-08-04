.class public Lcom/webuid/mmVideo/DigitalClock;
.super Landroid/widget/DigitalClock;
.source "DigitalClock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;
    }
.end annotation


# static fields
.field private static final m12:Ljava/lang/String; = "h:mm aa"

.field private static final m24:Ljava/lang/String; = "k:mm"


# instance fields
.field mCalendar:Ljava/util/Calendar;

.field mFormat:Ljava/lang/String;

.field private mFormatChangeObserver:Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;

.field private mHandler:Landroid/os/Handler;

.field private mTicker:Ljava/lang/Runnable;

.field private mTickerStopped:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 35
    invoke-direct {p0, p1}, Landroid/widget/DigitalClock;-><init>(Landroid/content/Context;)V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTickerStopped:Z

    .line 36
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/DigitalClock;->initClock(Landroid/content/Context;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/DigitalClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTickerStopped:Z

    .line 41
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/DigitalClock;->initClock(Landroid/content/Context;)V

    .line 42
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/DigitalClock;)V
    .locals 0
    .parameter

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/webuid/mmVideo/DigitalClock;->setFormat()V

    return-void
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/DigitalClock;)Z
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTickerStopped:Z

    return v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/DigitalClock;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/DigitalClock;)Ljava/lang/Runnable;
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-object v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTicker:Ljava/lang/Runnable;

    return-object v0
.end method

.method private get24HourMode()Z
    .locals 1

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/webuid/mmVideo/DigitalClock;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private initClock(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 47
    .local v0, r:Landroid/content/res/Resources;
    iget-object v1, p0, Lcom/webuid/mmVideo/DigitalClock;->mCalendar:Ljava/util/Calendar;

    if-nez v1, :cond_0

    .line 48
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    iput-object v1, p0, Lcom/webuid/mmVideo/DigitalClock;->mCalendar:Ljava/util/Calendar;

    .line 51
    :cond_0
    new-instance v1, Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;-><init>(Lcom/webuid/mmVideo/DigitalClock;)V

    iput-object v1, p0, Lcom/webuid/mmVideo/DigitalClock;->mFormatChangeObserver:Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;

    .line 52
    invoke-virtual {p0}, Lcom/webuid/mmVideo/DigitalClock;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 53
    sget-object v2, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/webuid/mmVideo/DigitalClock;->mFormatChangeObserver:Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;

    .line 52
    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 55
    invoke-direct {p0}, Lcom/webuid/mmVideo/DigitalClock;->setFormat()V

    .line 56
    return-void
.end method

.method private setFormat()V
    .locals 1

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/webuid/mmVideo/DigitalClock;->get24HourMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    const-string v0, "k:mm"

    iput-object v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mFormat:Ljava/lang/String;

    .line 101
    :goto_0
    return-void

    .line 99
    :cond_0
    const-string v0, "k:mm"

    iput-object v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mFormat:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTickerStopped:Z

    .line 61
    invoke-super {p0}, Landroid/widget/DigitalClock;->onAttachedToWindow()V

    .line 62
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mHandler:Landroid/os/Handler;

    .line 67
    new-instance v0, Lcom/webuid/mmVideo/DigitalClock$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/DigitalClock$1;-><init>(Lcom/webuid/mmVideo/DigitalClock;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTicker:Ljava/lang/Runnable;

    .line 79
    iget-object v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTicker:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 80
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 84
    invoke-super {p0}, Landroid/widget/DigitalClock;->onDetachedFromWindow()V

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/DigitalClock;->mTickerStopped:Z

    .line 86
    return-void
.end method
