.class Lcom/webuid/mmVideo/SettingActivity$OnItemListSelectedListener;
.super Ljava/lang/Object;
.source "SettingActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError",
        "WorldWriteableFiles"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/SettingActivity;
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
.field final synthetic this$0:Lcom/webuid/mmVideo/SettingActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/SettingActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 178
    iput-object p1, p0, Lcom/webuid/mmVideo/SettingActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter "arg1"
    .parameter "pos0"
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
    .line 181
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sput-object v2, Lcom/webuid/mmVideo/SettingActivity;->remaindType:Ljava/lang/Integer;

    .line 182
    iget-object v2, p0, Lcom/webuid/mmVideo/SettingActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    iget-object v2, v2, Lcom/webuid/mmVideo/SettingActivity;->adapter:Lcom/webuid/mmVideo/SettingActivity$ListAdapter;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;->notifyDataSetChanged()V

    .line 183
    iget-object v2, p0, Lcom/webuid/mmVideo/SettingActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/SettingActivity;

    const-string v3, "setting"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Lcom/webuid/mmVideo/SettingActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 185
    .local v1, preferences:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 187
    .local v0, edit:Landroid/content/SharedPreferences$Editor;
    const-string v2, "remaind"

    invoke-interface {v0, v2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 189
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 190
    return-void
.end method
