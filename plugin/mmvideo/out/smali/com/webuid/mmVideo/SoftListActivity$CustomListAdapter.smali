.class public Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;
.super Landroid/widget/BaseAdapter;
.source "SoftListActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/SoftListActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CustomListAdapter"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field public imageManager:Lcom/webuid/mmVideo/ImageManager;

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

.field final synthetic this$0:Lcom/webuid/mmVideo/SoftListActivity;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/SoftListActivity;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 3
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
    .line 480
    .local p3, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 481
    iput-object p2, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->context:Landroid/content/Context;

    .line 482
    iput-object p3, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    .line 483
    new-instance v0, Lcom/webuid/mmVideo/ImageManager;

    const-wide/32 v1, 0x83d600

    invoke-direct {v0, p2, v1, v2}, Lcom/webuid/mmVideo/ImageManager;-><init>(Landroid/content/Context;J)V

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->imageManager:Lcom/webuid/mmVideo/ImageManager;

    .line 485
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 490
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 496
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 502
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 506
    const/4 v0, 0x0

    .line 509
    .local v0, holder:Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;
    if-nez p2, :cond_0

    .line 512
    new-instance v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;

    .end local v0           #holder:Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;
    iget-object v3, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-direct {v0, v3}, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    .line 513
    .restart local v0       #holder:Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;
    iget-object v3, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 514
    .local v2, mInflater:Landroid/view/LayoutInflater;
    const v3, 0x7f030014

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 515
    const v3, 0x7f060018

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->imagePre:Landroid/widget/ImageView;

    .line 516
    const v3, 0x7f060019

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->name:Landroid/widget/TextView;

    .line 517
    const v3, 0x7f060028

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->subname:Landroid/widget/TextView;

    .line 519
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 524
    .end local v2           #mInflater:Landroid/view/LayoutInflater;
    :goto_0
    iget-object v3, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    const-string v4, "image"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 525
    .local v1, imageUrl:Ljava/lang/String;
    iget-object v3, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->imagePre:Landroid/widget/ImageView;

    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 526
    iget-object v3, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->imagePre:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 527
    iget-object v3, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->imageManager:Lcom/webuid/mmVideo/ImageManager;

    iget-object v4, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->imagePre:Landroid/widget/ImageView;

    const v5, 0x7f020039

    invoke-virtual {v3, v1, v4, v5}, Lcom/webuid/mmVideo/ImageManager;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 529
    iget-object v4, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->name:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    const-string v5, "name"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 530
    iget-object v4, v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->subname:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    const-string v5, "content"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 532
    return-object p2

    .line 522
    .end local v1           #imageUrl:Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #holder:Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;
    check-cast v0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;

    .restart local v0       #holder:Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;
    goto :goto_0
.end method
