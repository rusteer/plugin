.class Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;
.super Landroid/database/ContentObserver;
.source "DigitalClock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/DigitalClock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FormatChangeObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/DigitalClock;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/DigitalClock;)V
    .locals 1
    .parameter

    .prologue
    .line 104
    iput-object p1, p0, Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    .line 105
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 106
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .parameter "selfChange"

    .prologue
    .line 110
    iget-object v0, p0, Lcom/webuid/mmVideo/DigitalClock$FormatChangeObserver;->this$0:Lcom/webuid/mmVideo/DigitalClock;

    #calls: Lcom/webuid/mmVideo/DigitalClock;->setFormat()V
    invoke-static {v0}, Lcom/webuid/mmVideo/DigitalClock;->access$0(Lcom/webuid/mmVideo/DigitalClock;)V

    .line 111
    return-void
.end method
