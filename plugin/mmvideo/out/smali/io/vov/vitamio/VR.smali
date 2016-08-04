.class public Lio/vov/vitamio/VR;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/vov/vitamio/VR$drawable;,
        Lio/vov/vitamio/VR$id;,
        Lio/vov/vitamio/VR$layout;,
        Lio/vov/vitamio/VR$string;
    }
.end annotation


# static fields
.field private static a:Ljava/lang/String;

.field private static b:Landroid/content/res/Resources;

.field private static c:Z

.field private static d:Landroid/content/Context;

.field private static e:Landroid/view/LayoutInflater;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    sput-boolean v0, Lio/vov/vitamio/VR;->c:Z

    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 105
    sget-object v0, Lio/vov/vitamio/VR;->b:Landroid/content/res/Resources;

    sget-object v1, Lio/vov/vitamio/VR;->a:Ljava/lang/String;

    invoke-virtual {v0, p1, p0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .parameter "id"

    .prologue
    .line 73
    sget-object v0, Lio/vov/vitamio/VR;->b:Landroid/content/res/Resources;

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public static getString(I)Ljava/lang/String;
    .locals 1
    .parameter "id"

    .prologue
    .line 77
    sget-object v0, Lio/vov/vitamio/VR;->b:Landroid/content/res/Resources;

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .parameter "id"
    .parameter "root"

    .prologue
    .line 69
    sget-object v0, Lio/vov/vitamio/VR;->e:Landroid/view/LayoutInflater;

    invoke-virtual {v0, p0, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException;,
            Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException;,
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 52
    sget-boolean v0, Lio/vov/vitamio/VR;->c:Z

    if-eqz v0, :cond_0

    .line 66
    :goto_0
    return-void

    .line 55
    :cond_0
    invoke-static {p0}, Lio/vov/vitamio/VitamioInstaller;->checkVitamioInstallation(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/vov/vitamio/VR;->a:Ljava/lang/String;

    .line 56
    sget-object v0, Lio/vov/vitamio/VR;->a:Ljava/lang/String;

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    .line 57
    sput-object v0, Lio/vov/vitamio/VR;->d:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sput-object v0, Lio/vov/vitamio/VR;->b:Landroid/content/res/Resources;

    .line 58
    sget-object v0, Lio/vov/vitamio/VR;->d:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    sput-object v0, Lio/vov/vitamio/VR;->e:Landroid/view/LayoutInflater;

    .line 60
    const-string v0, "layout"

    const-string v1, "media_controller"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$layout;->media_controller:I

    .line 61
    const-string v0, "id"

    const-string v1, "mediacontroller_progress"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$id;->mediacontroller_progress:I

    const-string v0, "id"

    const-string v1, "pause"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$id;->pause:I

    const-string v0, "id"

    const-string v1, "time"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$id;->time:I

    const-string v0, "id"

    const-string v1, "time_current"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$id;->time_current:I

    const-string v0, "id"

    const-string v1, "file_name"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$id;->file_name:I

    .line 62
    const-string v0, "drawable"

    const-string v1, "pause_button"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$drawable;->pause_button:I

    const-string v0, "drawable"

    const-string v1, "play_button"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$drawable;->play_button:I

    .line 63
    const-string v0, "string"

    const-string v1, "VideoView_error_button"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$string;->VideoView_error_button:I

    const-string v0, "string"

    const-string v1, "VideoView_error_text_invalid_progressive_playback"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$string;->VideoView_error_text_invalid_progressive_playback:I

    const-string v0, "string"

    const-string v1, "VideoView_error_text_unknown"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$string;->VideoView_error_text_unknown:I

    const-string v0, "string"

    const-string v1, "VideoView_error_title"

    invoke-static {v0, v1}, Lio/vov/vitamio/VR;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lio/vov/vitamio/VR$string;->VideoView_error_title:I

    .line 65
    const/4 v0, 0x1

    sput-boolean v0, Lio/vov/vitamio/VR;->c:Z

    goto/16 :goto_0
.end method
