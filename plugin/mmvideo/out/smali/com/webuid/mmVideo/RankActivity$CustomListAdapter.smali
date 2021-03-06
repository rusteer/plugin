.class public Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;
.super Landroid/widget/BaseAdapter;
.source "RankActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/RankActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CustomListAdapter"
.end annotation


# instance fields
.field private asyncImageLoader:Lcom/webuid/mmVideo/AsyncImageLoader;

.field private context:Landroid/content/Context;

.field private list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/webuid/mmVideo/RankActivity;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/RankActivity;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 545
    .local p3, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iput-object p1, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/RankActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 546
    iput-object p2, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->context:Landroid/content/Context;

    .line 547
    iput-object p3, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    .line 548
    new-instance v0, Lcom/webuid/mmVideo/AsyncImageLoader;

    invoke-direct {v0}, Lcom/webuid/mmVideo/AsyncImageLoader;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->asyncImageLoader:Lcom/webuid/mmVideo/AsyncImageLoader;

    .line 549
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 554
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 560
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 566
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 570
    const/4 v0, 0x0

    .line 573
    .local v0, holder:Lcom/webuid/mmVideo/RankActivity$ViewHolder;
    if-nez p2, :cond_0

    .line 576
    new-instance v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;

    .end local v0           #holder:Lcom/webuid/mmVideo/RankActivity$ViewHolder;
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/RankActivity;

    invoke-direct {v0, v2}, Lcom/webuid/mmVideo/RankActivity$ViewHolder;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    .line 577
    .restart local v0       #holder:Lcom/webuid/mmVideo/RankActivity$ViewHolder;
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 578
    .local v1, mInflater:Landroid/view/LayoutInflater;
    const v2, 0x7f03000f

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 579
    const v2, 0x7f060009

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->title:Landroid/widget/TextView;

    .line 580
    const v2, 0x7f06000b

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->starText:Landroid/widget/TextView;

    .line 581
    const v2, 0x7f06000e

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->timeText:Landroid/widget/TextView;

    .line 582
    const v2, 0x7f06001e

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->sizeText:Landroid/widget/TextView;

    .line 583
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 588
    .end local v1           #mInflater:Landroid/view/LayoutInflater;
    :goto_0
    iget-object v3, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v4, "title"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 589
    iget-object v3, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->starText:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v5, "star"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\u661f"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 590
    iget-object v3, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->timeText:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v5, "length"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\u5206"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 591
    iget-object v3, v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;->sizeText:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v5, "size"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "M"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 592
    return-object p2

    .line 586
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #holder:Lcom/webuid/mmVideo/RankActivity$ViewHolder;
    check-cast v0, Lcom/webuid/mmVideo/RankActivity$ViewHolder;

    .restart local v0       #holder:Lcom/webuid/mmVideo/RankActivity$ViewHolder;
    goto/16 :goto_0
.end method
