.class Lcom/webuid/mmVideo/PlayVideoActivity$2;
.super Ljava/lang/Object;
.source "PlayVideoActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayVideoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayVideoActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$2;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4
    .parameter "seekBar"
    .parameter "progress"
    .parameter "fromUser"

    .prologue
    .line 101
    if-eqz p3, :cond_0

    .line 103
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$2;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->soundBar:Landroid/widget/SeekBar;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$3(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/SeekBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 104
    .local v0, ScurrentPosition:I
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$2;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$4(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/AudioManager;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 107
    .end local v0           #ScurrentPosition:I
    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 96
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 92
    return-void
.end method
