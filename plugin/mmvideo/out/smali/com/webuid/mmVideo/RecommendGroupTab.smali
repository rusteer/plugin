.class public Lcom/webuid/mmVideo/RecommendGroupTab;
.super Landroid/app/ActivityGroup;
.source "RecommendGroupTab.java"


# static fields
.field public static group:Landroid/app/ActivityGroup;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/ActivityGroup;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/webuid/mmVideo/RecommendGroupTab;->group:Landroid/app/ActivityGroup;

    invoke-virtual {v0}, Landroid/app/ActivityGroup;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/app/LocalActivityManager;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 40
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .parameter "savedInstanceState"

    .prologue
    .line 27
    invoke-super {p0, p1}, Landroid/app/ActivityGroup;->onCreate(Landroid/os/Bundle;)V

    .line 29
    sput-object p0, Lcom/webuid/mmVideo/RecommendGroupTab;->group:Landroid/app/ActivityGroup;

    .line 31
    return-void
.end method

.method protected onResume()V
    .locals 5

    .prologue
    .line 45
    invoke-super {p0}, Landroid/app/ActivityGroup;->onResume()V

    .line 50
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/webuid/mmVideo/UpdateListActivity;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 51
    const/high16 v4, 0x400

    invoke-virtual {v3, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 53
    .local v0, intent:Landroid/content/Intent;
    sget-object v3, Lcom/webuid/mmVideo/RecommendGroupTab;->group:Landroid/app/ActivityGroup;

    invoke-virtual {v3}, Landroid/app/ActivityGroup;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v3

    const-string v4, "UpdateListActivity"

    invoke-virtual {v3, v4, v0}, Landroid/app/LocalActivityManager;->startActivity(Ljava/lang/String;Landroid/content/Intent;)Landroid/view/Window;

    move-result-object v2

    .line 54
    .local v2, w:Landroid/view/Window;
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 56
    .local v1, view:Landroid/view/View;
    sget-object v3, Lcom/webuid/mmVideo/RecommendGroupTab;->group:Landroid/app/ActivityGroup;

    invoke-virtual {v3, v1}, Landroid/app/ActivityGroup;->setContentView(Landroid/view/View;)V

    .line 57
    return-void
.end method
