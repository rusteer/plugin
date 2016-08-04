.class final Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;
.super Ljava/lang/Object;
.source "PlayVideoActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PlayVideoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ButtonClickListener"
.end annotation


# instance fields
.field private pause:Z

.field final synthetic this$0:Lcom/webuid/mmVideo/PlayVideoActivity;


# direct methods
.method private constructor <init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 133
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/webuid/mmVideo/PlayVideoActivity;Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 133
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;-><init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    const/4 v1, 0x0

    .line 139
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 180
    :cond_0
    :goto_0
    return-void

    .line 143
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #calls: Lcom/webuid/mmVideo/PlayVideoActivity;->play()V
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$0(Lcom/webuid/mmVideo/PlayVideoActivity;)V

    goto :goto_0

    .line 146
    :pswitch_1
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 147
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 148
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->pause:Z

    goto :goto_0

    .line 150
    :cond_1
    iget-boolean v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->pause:Z

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 152
    iput-boolean v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->pause:Z

    goto :goto_0

    .line 158
    :pswitch_2
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 159
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    goto :goto_0

    .line 164
    :cond_2
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #calls: Lcom/webuid/mmVideo/PlayVideoActivity;->play()V
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$0(Lcom/webuid/mmVideo/PlayVideoActivity;)V

    goto :goto_0

    .line 169
    :pswitch_3
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 172
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 173
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    const/4 v1, 0x0

    #setter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$2(Lcom/webuid/mmVideo/PlayVideoActivity;Landroid/media/MediaPlayer;)V

    goto :goto_0

    .line 139
    nop

    :pswitch_data_0
    .packed-switch 0x7f060048
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
