.class Lcom/webuid/mmVideo/PlayActivity$5;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$5;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 165
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
    .line 178
    if-eqz p3, :cond_0

    .line 179
    const-string v1, "sound1"

    const-string v2, "--------------------------"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$5;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->soundBar:Landroid/widget/SeekBar;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$7(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/SeekBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 181
    .local v0, ScurrentPosition:I
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$5;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$8(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/AudioManager;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 185
    .end local v0           #ScurrentPosition:I
    :goto_0
    return-void

    .line 183
    :cond_0
    const-string v1, "sound2"

    const-string v2, "--------------------------"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 173
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 169
    return-void
.end method
