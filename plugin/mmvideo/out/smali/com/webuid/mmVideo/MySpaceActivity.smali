.class public Lcom/webuid/mmVideo/MySpaceActivity;
.super Landroid/app/Activity;
.source "MySpaceActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;
    }
.end annotation


# instance fields
.field private dataList:Ljava/util/ArrayList;
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

.field private mListView:Landroid/widget/ListView;

.field touchTime:J

.field waitTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    .line 177
    const-wide/16 v0, 0x7d0

    iput-wide v0, p0, Lcom/webuid/mmVideo/MySpaceActivity;->waitTime:J

    .line 178
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/webuid/mmVideo/MySpaceActivity;->touchTime:J

    .line 30
    return-void
.end method

.method private buildListView()V
    .locals 13

    .prologue
    const/4 v12, 0x2

    .line 75
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 76
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "image"

    const v2, 0x7f020030

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const-string v1, "name"

    const-string v2, "\u64ad\u653e\u8bb0\u5f55"

    invoke-virtual {v6, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 80
    .local v7, map2:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "image"

    const v2, 0x7f020031

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v7, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    const-string v1, "name"

    const-string v2, "\u6211\u7684\u6536\u85cf"

    invoke-virtual {v7, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 84
    .local v8, map3:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "image"

    const v2, 0x7f020032

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string v1, "name"

    const-string v2, "\u624b\u673a\u5fc5\u5907\u8f6f\u4ef6"

    invoke-virtual {v8, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 88
    .local v9, map4:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "image"

    const v2, 0x7f020033

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v9, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string v1, "name"

    const-string v2, "\u5e94\u7528\u8bbe\u7f6e"

    invoke-virtual {v9, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 92
    .local v10, map5:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "image"

    const v2, 0x7f020034

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v10, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v1, "name"

    const-string v2, "\u5e2e\u52a9\u53cd\u9988"

    invoke-virtual {v10, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 96
    .local v11, map6:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "image"

    const v2, 0x7f020035

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const-string v1, "name"

    const-string v2, "\u597d\u53cb\u5206\u4eab"

    invoke-virtual {v11, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    new-instance v0, Landroid/widget/SimpleAdapter;

    iget-object v2, p0, Lcom/webuid/mmVideo/MySpaceActivity;->dataList:Ljava/util/ArrayList;

    .line 100
    const v3, 0x7f030007

    new-array v4, v12, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "image"

    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-string v5, "name"

    aput-object v5, v4, v1

    .line 101
    new-array v5, v12, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    .line 99
    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 102
    .local v0, simAdapter:Landroid/widget/SimpleAdapter;
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 104
    return-void

    .line 101
    nop

    :array_0
    .array-data 0x4
        0x18t 0x0t 0x6t 0x7ft
        0x19t 0x0t 0x6t 0x7ft
    .end array-data
.end method


# virtual methods
.method public onBackPressed()V
    .locals 6

    .prologue
    .line 182
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 183
    .local v0, currentTime:J
    iget-wide v2, p0, Lcom/webuid/mmVideo/MySpaceActivity;->touchTime:J

    sub-long v2, v0, v2

    iget-wide v4, p0, Lcom/webuid/mmVideo/MySpaceActivity;->waitTime:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 185
    const-string v2, "\u518d\u6309\u4e00\u6b21\u9000\u51fa"

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/MySpaceActivity;->setToast(Ljava/lang/String;)V

    .line 186
    iput-wide v0, p0, Lcom/webuid/mmVideo/MySpaceActivity;->touchTime:J

    .line 190
    :goto_0
    return-void

    .line 188
    :cond_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/MySpaceActivity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 36
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const v2, 0x7f030006

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/MySpaceActivity;->setContentView(I)V

    .line 39
    const v2, 0x7f060005

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/MySpaceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 40
    .local v0, btn1:Landroid/widget/Button;
    const v2, 0x7f060006

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/MySpaceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 41
    .local v1, btn2:Landroid/widget/Button;
    new-instance v2, Lcom/webuid/mmVideo/MySpaceActivity$1;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/MySpaceActivity$1;-><init>(Lcom/webuid/mmVideo/MySpaceActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    new-instance v2, Lcom/webuid/mmVideo/MySpaceActivity$2;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/MySpaceActivity$2;-><init>(Lcom/webuid/mmVideo/MySpaceActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    const v2, 0x7f060007

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/MySpaceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/MySpaceActivity;->mListView:Landroid/widget/ListView;

    .line 70
    invoke-direct {p0}, Lcom/webuid/mmVideo/MySpaceActivity;->buildListView()V

    .line 71
    iget-object v2, p0, Lcom/webuid/mmVideo/MySpaceActivity;->mListView:Landroid/widget/ListView;

    new-instance v3, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;-><init>(Lcom/webuid/mmVideo/MySpaceActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 72
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/webuid/mmVideo/MySpaceActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0b0008

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 151
    const/4 v0, 0x1

    return v0
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 173
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 174
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 175
    return-void
.end method

.method protected onResume()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 158
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 159
    const-string v3, "backRecommend"

    invoke-virtual {p0, v3, v5}, Lcom/webuid/mmVideo/MySpaceActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 160
    .local v2, preferences:Landroid/content/SharedPreferences;
    const-string v3, "num"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 161
    .local v1, num:Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 162
    sget-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v3, v5}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 163
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 164
    .local v0, edit:Landroid/content/SharedPreferences$Editor;
    const-string v3, "num"

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 165
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 167
    .end local v0           #edit:Landroid/content/SharedPreferences$Editor;
    :cond_0
    const-string v3, "Recommend"

    const-string v4, "onResume"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 169
    return-void
.end method

.method public setToast(Ljava/lang/String;)V
    .locals 6
    .parameter "text"

    .prologue
    .line 192
    invoke-virtual {p0}, Lcom/webuid/mmVideo/MySpaceActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030028

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 193
    .local v2, toastRoot:Landroid/view/View;
    const v3, 0x7f060004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 194
    .local v0, title:Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    new-instance v1, Landroid/widget/Toast;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/MySpaceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 196
    .local v1, toast:Landroid/widget/Toast;
    invoke-virtual {v1, v2}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 197
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/Toast;->setDuration(I)V

    .line 198
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 200
    return-void
.end method
