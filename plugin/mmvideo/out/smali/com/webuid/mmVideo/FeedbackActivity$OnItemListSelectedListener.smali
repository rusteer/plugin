.class Lcom/webuid/mmVideo/FeedbackActivity$OnItemListSelectedListener;
.super Ljava/lang/Object;
.source "FeedbackActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/FeedbackActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OnItemListSelectedListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/FeedbackActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/FeedbackActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 332
    iput-object p1, p0, Lcom/webuid/mmVideo/FeedbackActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .parameter
    .parameter "arg1"
    .parameter "pos0"
    .parameter "arg3"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 335
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/FeedbackActivity;->remaindType:Ljava/lang/Integer;

    .line 336
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/FeedbackActivity;->adapter:Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->notifyDataSetChanged()V

    .line 337
    return-void
.end method
