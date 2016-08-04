.class public Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;
.super Ljava/lang/Object;
.source "SoftListActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/SoftListActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field public imagePre:Landroid/widget/ImageView;

.field public name:Landroid/widget/TextView;

.field public subname:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/webuid/mmVideo/SoftListActivity;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/SoftListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 536
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
