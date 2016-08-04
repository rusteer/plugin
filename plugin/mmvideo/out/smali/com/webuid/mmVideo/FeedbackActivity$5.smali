.class Lcom/webuid/mmVideo/FeedbackActivity$5;
.super Ljava/lang/Object;
.source "FeedbackActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/FeedbackActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/FeedbackActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/FeedbackActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/FeedbackActivity$5;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/FeedbackActivity$5;)Lcom/webuid/mmVideo/FeedbackActivity;
    .locals 1
    .parameter

    .prologue
    .line 123
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$5;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x0

    .line 126
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$5;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lcom/webuid/mmVideo/FeedbackActivity;->access$1(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 127
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$5;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lcom/webuid/mmVideo/FeedbackActivity;->access$1(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 128
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$5;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lcom/webuid/mmVideo/FeedbackActivity;->access$1(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 129
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/FeedbackActivity$5$1;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/FeedbackActivity$5$1;-><init>(Lcom/webuid/mmVideo/FeedbackActivity$5;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 152
    .local v0, thread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 153
    return-void
.end method
