.class public Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "PlayActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PlayActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TouchGestureListener"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private seek:Landroid/widget/SeekBar;

.field final synthetic this$0:Lcom/webuid/mmVideo/PlayActivity;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/PlayActivity;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 717
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 714
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->mContext:Landroid/content/Context;

    .line 715
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->seek:Landroid/widget/SeekBar;

    .line 720
    iput-object p2, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->mContext:Landroid/content/Context;

    .line 721
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 727
    const/4 v0, 0x0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 764
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1
    .parameter "e1"
    .parameter "e2"
    .parameter "distanceX"
    .parameter "distanceY"

    .prologue
    .line 755
    const/4 v0, 0x0

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 734
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "e"

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 740
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->showControl:I
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$5(Lcom/webuid/mmVideo/PlayActivity;)I

    move-result v0

    if-nez v0, :cond_0

    .line 741
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const/4 v1, 0x1

    #setter for: Lcom/webuid/mmVideo/PlayActivity;->showControl:I
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->access$6(Lcom/webuid/mmVideo/PlayActivity;I)V

    .line 742
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->topLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->rightLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->bottomLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 747
    :goto_0
    return v2

    .line 744
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #setter for: Lcom/webuid/mmVideo/PlayActivity;->showControl:I
    invoke-static {v0, v2}, Lcom/webuid/mmVideo/PlayActivity;->access$6(Lcom/webuid/mmVideo/PlayActivity;I)V

    .line 745
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->topLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->rightLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->bottomLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method
