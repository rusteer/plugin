.class public Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;
.super Landroid/widget/BaseAdapter;
.source "FeedbackActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError",
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/FeedbackActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ListAdapter"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field final synthetic this$0:Lcom/webuid/mmVideo/FeedbackActivity;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/FeedbackActivity;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter "context"

    .prologue
    .line 345
    iput-object p1, p0, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    .line 344
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 343
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->context:Landroid/content/Context;

    .line 346
    iput-object p2, p0, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->context:Landroid/content/Context;

    .line 347
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/webuid/mmVideo/FeedbackActivity;->access$2(Lcom/webuid/mmVideo/FeedbackActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 358
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "id"

    .prologue
    .line 364
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 369
    if-nez p2, :cond_0

    .line 371
    iget-object v3, p0, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->context:Landroid/content/Context;

    const v4, 0x7f030002

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 373
    :cond_0
    const v3, 0x7f060004

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 374
    .local v2, txt_title:Landroid/widget/TextView;
    const v3, 0x7f060010

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 375
    .local v1, txt_content:Landroid/widget/TextView;
    const v3, 0x7f06000f

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 379
    .local v0, image_ok:Landroid/widget/ImageView;
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v3, "\u25cf"

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/webuid/mmVideo/FeedbackActivity;->access$2(Lcom/webuid/mmVideo/FeedbackActivity;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    const-string v5, "name"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 380
    iget-object v3, p0, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/webuid/mmVideo/FeedbackActivity;->access$2(Lcom/webuid/mmVideo/FeedbackActivity;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    const-string v4, "content"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    sget-object v3, Lcom/webuid/mmVideo/FeedbackActivity;->remaindType:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p1, :cond_1

    .line 382
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 384
    const v3, 0x7f020024

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 392
    :goto_0
    return-object p2

    .line 387
    :cond_1
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 388
    const v3, 0x7f020023

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method
