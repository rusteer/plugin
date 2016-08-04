.class public Lcom/webuid/mmVideo/ShareActivity;
.super Landroid/app/Activity;
.source "ShareActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 68
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 72
    const v3, 0x7f030012

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/ShareActivity;->setContentView(I)V

    .line 73
    const-string v3, "pos"

    const-string v4, "1"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    const v3, 0x7f060005

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/ShareActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 76
    .local v0, btn1:Landroid/widget/Button;
    const v3, 0x7f060006

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/ShareActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 78
    .local v1, btn2:Landroid/widget/Button;
    new-instance v3, Lcom/webuid/mmVideo/ShareActivity$1;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/ShareActivity$1;-><init>(Lcom/webuid/mmVideo/ShareActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    new-instance v3, Lcom/webuid/mmVideo/ShareActivity$2;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/ShareActivity$2;-><init>(Lcom/webuid/mmVideo/ShareActivity;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    const-string v3, "pos"

    const-string v4, "12"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    const v3, 0x7f060003

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/ShareActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 104
    .local v2, leftBtnImg:Landroid/widget/ImageView;
    new-instance v3, Lcom/webuid/mmVideo/ShareActivity$3;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/ShareActivity$3;-><init>(Lcom/webuid/mmVideo/ShareActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 124
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 125
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 126
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 113
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 114
    const-string v2, "backRecommend"

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/ShareActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 115
    .local v1, preferences:Landroid/content/SharedPreferences;
    const-string v2, "num"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 116
    .local v0, num:Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 117
    invoke-virtual {p0}, Lcom/webuid/mmVideo/ShareActivity;->finish()V

    .line 119
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 120
    return-void
.end method
