.class Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;
.super Ljava/lang/Object;
.source "MySpaceActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/MySpaceActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OnItemListSelectedListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/MySpaceActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/MySpaceActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 106
    iput-object p1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter "arg1"
    .parameter "pos"
    .parameter "arg3"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const v4, 0x7f040003

    const v3, 0x7f040002

    .line 109
    if-nez p3, :cond_1

    .line 111
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 112
    .local v0, it:Landroid/content/Intent;
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    const-class v2, Lcom/webuid/mmVideo/PlayListActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 116
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v0}, Lcom/webuid/mmVideo/MySpaceActivity;->startActivity(Landroid/content/Intent;)V

    .line 117
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v3, v4}, Lcom/webuid/mmVideo/MySpaceActivity;->overridePendingTransition(II)V

    .line 144
    .end local v0           #it:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 118
    :cond_1
    const/4 v1, 0x1

    if-ne p3, v1, :cond_2

    .line 119
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 120
    .restart local v0       #it:Landroid/content/Intent;
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    const-class v2, Lcom/webuid/mmVideo/FavListActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 121
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v0}, Lcom/webuid/mmVideo/MySpaceActivity;->startActivity(Landroid/content/Intent;)V

    .line 122
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v3, v4}, Lcom/webuid/mmVideo/MySpaceActivity;->overridePendingTransition(II)V

    goto :goto_0

    .line 123
    .end local v0           #it:Landroid/content/Intent;
    :cond_2
    const/4 v1, 0x2

    if-ne p3, v1, :cond_3

    .line 124
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 125
    .restart local v0       #it:Landroid/content/Intent;
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    const-class v2, Lcom/webuid/mmVideo/SoftListActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 126
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v0}, Lcom/webuid/mmVideo/MySpaceActivity;->startActivity(Landroid/content/Intent;)V

    .line 127
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v3, v4}, Lcom/webuid/mmVideo/MySpaceActivity;->overridePendingTransition(II)V

    goto :goto_0

    .line 128
    .end local v0           #it:Landroid/content/Intent;
    :cond_3
    const/4 v1, 0x3

    if-ne p3, v1, :cond_4

    .line 129
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 130
    .restart local v0       #it:Landroid/content/Intent;
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    const-class v2, Lcom/webuid/mmVideo/SettingActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 131
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v0}, Lcom/webuid/mmVideo/MySpaceActivity;->startActivity(Landroid/content/Intent;)V

    .line 132
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v3, v4}, Lcom/webuid/mmVideo/MySpaceActivity;->overridePendingTransition(II)V

    goto :goto_0

    .line 133
    .end local v0           #it:Landroid/content/Intent;
    :cond_4
    const/4 v1, 0x4

    if-ne p3, v1, :cond_5

    .line 134
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 135
    .restart local v0       #it:Landroid/content/Intent;
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    const-class v2, Lcom/webuid/mmVideo/FeedbackActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 136
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v0}, Lcom/webuid/mmVideo/MySpaceActivity;->startActivity(Landroid/content/Intent;)V

    .line 137
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v3, v4}, Lcom/webuid/mmVideo/MySpaceActivity;->overridePendingTransition(II)V

    goto :goto_0

    .line 138
    .end local v0           #it:Landroid/content/Intent;
    :cond_5
    const/4 v1, 0x5

    if-ne p3, v1, :cond_0

    .line 139
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 140
    .restart local v0       #it:Landroid/content/Intent;
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    const-class v2, Lcom/webuid/mmVideo/ShareActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 141
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v0}, Lcom/webuid/mmVideo/MySpaceActivity;->startActivity(Landroid/content/Intent;)V

    .line 142
    iget-object v1, p0, Lcom/webuid/mmVideo/MySpaceActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/MySpaceActivity;

    invoke-virtual {v1, v3, v4}, Lcom/webuid/mmVideo/MySpaceActivity;->overridePendingTransition(II)V

    goto/16 :goto_0
.end method
