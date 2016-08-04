.class Lcom/webuid/mmVideo/PlayActivity$10;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$10;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 276
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$10;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const v2, 0x7f060053

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 277
    .local v0, btnBack:Landroid/widget/ImageButton;
    invoke-virtual {v0}, Landroid/widget/ImageButton;->performClick()Z

    .line 278
    return-void
.end method
