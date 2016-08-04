.class public Lcom/webuid/mmVideo/OfflineActivity$ViewHolder;
.super Ljava/lang/Object;
.source "OfflineActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/OfflineActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field public delBtn:Landroid/widget/TextView;

.field public starText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/webuid/mmVideo/OfflineActivity;

.field public timeText:Landroid/widget/TextView;

.field public title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/OfflineActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 658
    iput-object p1, p0, Lcom/webuid/mmVideo/OfflineActivity$ViewHolder;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
