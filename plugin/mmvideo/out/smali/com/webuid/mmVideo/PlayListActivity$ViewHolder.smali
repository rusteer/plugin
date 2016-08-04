.class public Lcom/webuid/mmVideo/PlayListActivity$ViewHolder;
.super Ljava/lang/Object;
.source "PlayListActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PlayListActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field public delBtn:Landroid/widget/TextView;

.field public sizeText:Landroid/widget/TextView;

.field public starText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/webuid/mmVideo/PlayListActivity;

.field public timeText:Landroid/widget/TextView;

.field public title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/PlayListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 309
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayListActivity$ViewHolder;->this$0:Lcom/webuid/mmVideo/PlayListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
