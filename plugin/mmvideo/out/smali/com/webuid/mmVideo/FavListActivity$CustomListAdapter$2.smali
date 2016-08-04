.class Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;
.super Ljava/lang/Object;
.source "FavListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;->this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 316
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 317
    .local v1, pos:Ljava/lang/Integer;
    iget-object v3, p0, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;->this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/FavListActivity;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/FavListActivity;

    move-result-object v3

    #getter for: Lcom/webuid/mmVideo/FavListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity;->access$0(Lcom/webuid/mmVideo/FavListActivity;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 318
    .local v0, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Lcom/webuid/mmVideo/service/FavService;

    iget-object v3, p0, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;->this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/FavListActivity;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/FavListActivity;

    move-result-object v3

    #calls: Lcom/webuid/mmVideo/FavListActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity;->access$1(Lcom/webuid/mmVideo/FavListActivity;)Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/webuid/mmVideo/dao/DataHelper;->getFavDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/webuid/mmVideo/service/FavService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 320
    .local v2, pvService:Lcom/webuid/mmVideo/service/FavService;
    const-string v3, "id"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/service/FavService;->remove(I)I

    .line 321
    iget-object v3, p0, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;->this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/FavListActivity;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/FavListActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/webuid/mmVideo/FavListActivity;->getDataList()V

    .line 322
    iget-object v3, p0, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;->this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/FavListActivity;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/FavListActivity;

    move-result-object v3

    #getter for: Lcom/webuid/mmVideo/FavListActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity;->access$2(Lcom/webuid/mmVideo/FavListActivity;)Landroid/widget/ListView;

    move-result-object v3

    iget-object v4, p0, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;->this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/FavListActivity;
    invoke-static {v4}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/FavListActivity;

    move-result-object v4

    iget-object v4, v4, Lcom/webuid/mmVideo/FavListActivity;->adapter1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 323
    iget-object v3, p0, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter$2;->this$1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/FavListActivity;
    invoke-static {v3}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/FavListActivity;

    move-result-object v3

    iget-object v3, v3, Lcom/webuid/mmVideo/FavListActivity;->adapter1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 325
    return-void
.end method
