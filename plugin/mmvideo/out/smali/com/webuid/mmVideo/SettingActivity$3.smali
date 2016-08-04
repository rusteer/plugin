.class Lcom/webuid/mmVideo/SettingActivity$3;
.super Ljava/lang/Object;
.source "SettingActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/SettingActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/SettingActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/SettingActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/SettingActivity$3;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 133
    iget-object v0, p0, Lcom/webuid/mmVideo/SettingActivity$3;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/SettingActivity;->finish()V

    .line 134
    return-void
.end method
