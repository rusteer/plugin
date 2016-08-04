.class public Lcom/webuid/mmVideo/SettingActivity$ListAdapter;
.super Landroid/widget/BaseAdapter;
.source "SettingActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError",
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/SettingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ListAdapter"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field final synthetic this$0:Lcom/webuid/mmVideo/SettingActivity;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/SettingActivity;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter "context"

    .prologue
    .line 198
    iput-object p1, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    .line 197
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 196
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->context:Landroid/content/Context;

    .line 199
    iput-object p2, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->context:Landroid/content/Context;

    .line 200
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    #getter for: Lcom/webuid/mmVideo/SettingActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/webuid/mmVideo/SettingActivity;->access$0(Lcom/webuid/mmVideo/SettingActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 211
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "id"

    .prologue
    .line 217
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 222
    if-nez p2, :cond_0

    .line 224
    iget-object v2, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->context:Landroid/content/Context;

    const v3, 0x7f030011

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 226
    :cond_0
    const v2, 0x7f060004

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 227
    .local v1, txt_title:Landroid/widget/TextView;
    const v2, 0x7f06000f

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 231
    .local v0, image_ok:Landroid/widget/ImageView;
    iget-object v2, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    #getter for: Lcom/webuid/mmVideo/SettingActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/webuid/mmVideo/SettingActivity;->access$0(Lcom/webuid/mmVideo/SettingActivity;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v3, "name"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    sget-object v2, Lcom/webuid/mmVideo/SettingActivity;->remaindType:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p1, :cond_1

    .line 233
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 234
    iget-object v2, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/SettingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070003

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 240
    :goto_0
    return-object p2

    .line 236
    :cond_1
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 237
    iget-object v2, p0, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/SettingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070004

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0
.end method
