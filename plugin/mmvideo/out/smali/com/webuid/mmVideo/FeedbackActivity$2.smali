.class Lcom/webuid/mmVideo/FeedbackActivity$2;
.super Landroid/os/Handler;
.source "FeedbackActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/FeedbackActivity;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/FeedbackActivity$2;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    .line 294
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 297
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 309
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 310
    return-void

    .line 300
    :pswitch_0
    iget-object v2, p0, Lcom/webuid/mmVideo/FeedbackActivity$2;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lcom/webuid/mmVideo/FeedbackActivity;->access$1(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->dismiss()V

    .line 301
    iget-object v2, p0, Lcom/webuid/mmVideo/FeedbackActivity$2;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/FeedbackActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "\u53cd\u9988\u63d0\u4ea4\u6210\u529f"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 302
    iget-object v2, p0, Lcom/webuid/mmVideo/FeedbackActivity$2;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    const v3, 0x7f06000a

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 303
    .local v1, content:Landroid/widget/EditText;
    iget-object v2, p0, Lcom/webuid/mmVideo/FeedbackActivity$2;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    const v3, 0x7f06000c

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 304
    .local v0, contact:Landroid/widget/EditText;
    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 297
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
