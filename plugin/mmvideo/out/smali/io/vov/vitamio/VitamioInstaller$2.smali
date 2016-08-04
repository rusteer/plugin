.class final Lio/vov/vitamio/VitamioInstaller$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/vov/vitamio/VitamioInstaller;->buildInstallerDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic a:Lio/vov/vitamio/VitamioInstaller;

.field private final synthetic b:Landroid/widget/TextView;

.field private final synthetic c:Ljava/lang/String;


# direct methods
.method constructor <init>(Lio/vov/vitamio/VitamioInstaller;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lio/vov/vitamio/VitamioInstaller$2;->a:Lio/vov/vitamio/VitamioInstaller;

    iput-object p2, p0, Lio/vov/vitamio/VitamioInstaller$2;->b:Landroid/widget/TextView;

    iput-object p3, p0, Lio/vov/vitamio/VitamioInstaller$2;->c:Ljava/lang/String;

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6
    .parameter

    .prologue
    .line 167
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller$2;->b:Landroid/widget/TextView;

    const-string v1, "Downloading Vitamio from <a href=\"%s\">%s</a> ..., please restart this app when installation finished."

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lio/vov/vitamio/VitamioInstaller$2;->a:Lio/vov/vitamio/VitamioInstaller;

    invoke-static {v4}, Lio/vov/vitamio/VitamioInstaller;->a(Lio/vov/vitamio/VitamioInstaller;)Ljava/util/Map;

    move-result-object v4

    iget-object v5, p0, Lio/vov/vitamio/VitamioInstaller$2;->c:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lio/vov/vitamio/VitamioInstaller$2;->c:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller$2;->a:Lio/vov/vitamio/VitamioInstaller;

    invoke-static {v0}, Lio/vov/vitamio/VitamioInstaller;->b(Lio/vov/vitamio/VitamioInstaller;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller$2;->a:Lio/vov/vitamio/VitamioInstaller;

    invoke-static {v0}, Lio/vov/vitamio/VitamioInstaller;->a(Lio/vov/vitamio/VitamioInstaller;)Ljava/util/Map;

    move-result-object v0

    iget-object v4, p0, Lio/vov/vitamio/VitamioInstaller$2;->c:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 169
    return-void
.end method
