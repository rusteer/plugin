.class Lcom/webuid/mmVideo/PlayListActivity$3;
.super Ljava/lang/Object;
.source "PlayListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayListActivity;->setMainView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayListActivity$3;->this$0:Lcom/webuid/mmVideo/PlayListActivity;

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 160
    const-string v2, "onClick"

    const-string v3, "btn1"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 162
    .local v1, it:Landroid/content/Intent;
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity$3;->this$0:Lcom/webuid/mmVideo/PlayListActivity;

    const-class v3, Lcom/webuid/mmVideo/UpdateListActivity;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 163
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 164
    .local v0, bundle:Landroid/os/Bundle;
    const-string v2, "search_type"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 165
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 166
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity$3;->this$0:Lcom/webuid/mmVideo/PlayListActivity;

    invoke-virtual {v2, v1}, Lcom/webuid/mmVideo/PlayListActivity;->startActivity(Landroid/content/Intent;)V

    .line 167
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity$3;->this$0:Lcom/webuid/mmVideo/PlayListActivity;

    const v3, 0x7f040002

    const v4, 0x7f040003

    invoke-virtual {v2, v3, v4}, Lcom/webuid/mmVideo/PlayListActivity;->overridePendingTransition(II)V

    .line 168
    return-void
.end method
