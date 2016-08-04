.class Lcom/webuid/mmVideo/HomeActivity$3;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/HomeActivity;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/HomeActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/HomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/HomeActivity$3;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabChanged(Ljava/lang/String;)V
    .locals 6
    .parameter "arg0"

    .prologue
    const v5, 0x7f06005b

    .line 117
    const-string v3, "Changed"

    const-string v4, "Changed"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    sget-object v3, Lcom/webuid/mmVideo/Tabdb$listValue;->mTabClassArray:[Ljava/lang/Class;

    array-length v0, v3

    .line 119
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v0, :cond_0

    .line 124
    iget-object v3, p0, Lcom/webuid/mmVideo/HomeActivity$3;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/HomeActivity;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v3

    sget-object v4, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v4}, Landroid/widget/TabHost;->getCurrentTab()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 125
    .local v2, iv:Landroid/widget/ImageView;
    iget-object v3, p0, Lcom/webuid/mmVideo/HomeActivity$3;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget-object v4, Lcom/webuid/mmVideo/Tabdb$listValue;->mImageViewArraySel:[I

    sget-object v5, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v5}, Landroid/widget/TabHost;->getCurrentTab()I

    move-result v5

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 126
    const-string v3, "******Changed Tan number ... "

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v5}, Landroid/widget/TabHost;->getCurrentTab()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    return-void

    .line 121
    .end local v2           #iv:Landroid/widget/ImageView;
    :cond_0
    iget-object v3, p0, Lcom/webuid/mmVideo/HomeActivity$3;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/HomeActivity;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 122
    .restart local v2       #iv:Landroid/widget/ImageView;
    iget-object v3, p0, Lcom/webuid/mmVideo/HomeActivity$3;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget-object v4, Lcom/webuid/mmVideo/Tabdb$listValue;->mImageViewArray:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
