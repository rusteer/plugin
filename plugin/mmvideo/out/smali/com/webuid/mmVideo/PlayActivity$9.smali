.class Lcom/webuid/mmVideo/PlayActivity$9;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$9;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 266
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$9;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const-string v3, "backRecommend"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Lcom/webuid/mmVideo/PlayActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 267
    .local v1, preferences:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 268
    .local v0, edit:Landroid/content/SharedPreferences$Editor;
    const-string v2, "num"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 269
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 270
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$9;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/PlayActivity;->finish()V

    .line 271
    return-void
.end method
