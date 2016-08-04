.class public Lio/vov/vitamio/VitamioInstaller;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException;,
        Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException;
    }
.end annotation


# static fields
.field public static final VITAMIO_PACKAGE_ARMV6:Ljava/lang/String; = "io.vov.vitamio.v6"

.field public static final VITAMIO_PACKAGE_ARMV6_VFP:Ljava/lang/String; = "io.vov.vitamio.v6vfp"

.field public static final VITAMIO_PACKAGE_ARMV7_NEON:Ljava/lang/String; = "io.vov.vitamio"

.field public static final VITAMIO_PACKAGE_ARMV7_VFPV3:Ljava/lang/String; = "io.vov.vitamio.v7vfpv3"

.field public static final VITAMIO_VERSION_CODE:I = 0x3

.field public static final VITAMIO_VERSION_NAME:Ljava/lang/String; = "1.0.6"

.field private static final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static b:I

.field private static c:Ljava/lang/String;


# instance fields
.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private e:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v2, 0x47

    const/16 v5, 0x46

    const/16 v4, 0x3d

    const/16 v3, 0x3c

    .line 61
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    .line 65
    invoke-static {}, Lio/vov/a/a;->a()I

    move-result v0

    .line 66
    and-int/lit8 v1, v0, 0x20

    if-lez v1, :cond_0

    .line 67
    sput v2, Lio/vov/vitamio/VitamioInstaller;->b:I

    .line 77
    :goto_0
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "io.vov.vitamio"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "io.vov.vitamio.v7vfpv3"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "io.vov.vitamio.v6vfp"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "io.vov.vitamio.v6"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    sget v1, Lio/vov/vitamio/VitamioInstaller;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lio/vov/vitamio/VitamioInstaller;->c:Ljava/lang/String;

    .line 39
    return-void

    .line 68
    :cond_0
    and-int/lit8 v1, v0, 0x10

    if-lez v1, :cond_1

    and-int/lit8 v1, v0, 0x8

    if-lez v1, :cond_1

    .line 69
    sput v5, Lio/vov/vitamio/VitamioInstaller;->b:I

    goto :goto_0

    .line 70
    :cond_1
    and-int/lit8 v1, v0, 0x4

    if-lez v1, :cond_2

    and-int/lit8 v1, v0, 0x2

    if-lez v1, :cond_2

    .line 71
    sput v4, Lio/vov/vitamio/VitamioInstaller;->b:I

    goto :goto_0

    .line 72
    :cond_2
    and-int/lit8 v0, v0, 0x2

    if-lez v0, :cond_3

    .line 73
    sput v3, Lio/vov/vitamio/VitamioInstaller;->b:I

    goto :goto_0

    .line 75
    :cond_3
    const/4 v0, -0x1

    sput v0, Lio/vov/vitamio/VitamioInstaller;->b:I

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "ctx"

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    .line 90
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    .line 91
    return-void
.end method

.method static synthetic a(Lio/vov/vitamio/VitamioInstaller;)Ljava/util/Map;
    .locals 1
    .parameter

    .prologue
    .line 85
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic b(Lio/vov/vitamio/VitamioInstaller;)Landroid/content/Context;
    .locals 1
    .parameter

    .prologue
    .line 86
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    return-object v0
.end method

.method public static checkVitamioInstallation(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException;,
            Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException;
        }
    .end annotation

    .prologue
    .line 246
    sget v0, Lio/vov/vitamio/VitamioInstaller;->b:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 247
    new-instance v0, Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException;

    invoke-direct {v0}, Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException;-><init>()V

    throw v0

    .line 249
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 250
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 262
    new-instance v0, Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException;

    invoke-direct {v0}, Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException;-><init>()V

    throw v0

    .line 250
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 251
    sget v0, Lio/vov/vitamio/VitamioInstaller;->b:I

    if-gt v3, v0, :cond_1

    .line 253
    :try_start_0
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/16 v4, 0x400

    invoke-virtual {v1, v0, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 254
    const-string v4, "Vitamio installation: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v0}, Landroid/content/pm/ApplicationInfo;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {v4, v5}, Lio/vov/a/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 255
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->a:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 256
    :catch_0
    move-exception v0

    .line 257
    const-string v3, "checkVitamioInstallation"

    invoke-static {v3, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getCompatiblePackage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 233
    sget-object v0, Lio/vov/vitamio/VitamioInstaller;->c:Ljava/lang/String;

    return-object v0
.end method

.method public static getLibraryPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException;,
            Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException;
        }
    .end annotation

    .prologue
    .line 274
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 275
    invoke-static {p0}, Lio/vov/vitamio/VitamioInstaller;->checkVitamioInstallation(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 276
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x8

    if-le v2, v3, :cond_2

    .line 278
    const/16 v2, 0x400

    :try_start_0
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 279
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 280
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "/"

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x2

    if-le v2, v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 285
    :cond_0
    :goto_1
    return-object v0

    .line 280
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "/"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 281
    :catch_0
    move-exception v0

    .line 282
    const-string v2, "getLibraryPath"

    invoke-static {v2, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 285
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "/data/data/"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/lib/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method


# virtual methods
.method public buildInstallerDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;
    .locals 9
    .parameter "title"
    .parameter "msg"
    .parameter "button"

    .prologue
    const/16 v8, 0x19

    const/16 v6, 0x14

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v7, -0x1

    .line 133
    invoke-static {p2}, Lio/vov/a/c;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p2, "Please install Vitamio plugin to play this media, it\'s free from sources below:"

    .line 134
    :cond_0
    invoke-static {p1}, Lio/vov/a/c;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "Install Vitamio"

    .line 135
    :cond_1
    invoke-static {p3}, Lio/vov/a/c;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p3, "Exit"

    .line 136
    :cond_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 137
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 138
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 139
    new-instance v1, Lio/vov/vitamio/VitamioInstaller$1;

    invoke-direct {v1}, Lio/vov/vitamio/VitamioInstaller$1;-><init>()V

    invoke-virtual {v0, p3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 143
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 144
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v2, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 145
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    .line 146
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 147
    const/16 v3, 0xa

    invoke-virtual {v2, v6, v3, v6, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 148
    const/16 v3, 0x31

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 149
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 150
    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 151
    new-instance v3, Landroid/widget/TextView;

    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 152
    invoke-virtual {v3, v5, v4, v5, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 153
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 154
    const v0, -0xff0100

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 155
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    const/high16 v0, 0x4190

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 157
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 159
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 178
    return-object v1

    .line 159
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 160
    new-instance v5, Landroid/widget/Button;

    iget-object v6, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 161
    invoke-virtual {v5, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 162
    const/high16 v6, -0x100

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextColor(I)V

    .line 163
    const/high16 v6, 0x4180

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextSize(F)V

    .line 164
    new-instance v6, Lio/vov/vitamio/VitamioInstaller$2;

    invoke-direct {v6, p0, v3, v0}, Lio/vov/vitamio/VitamioInstaller$2;-><init>(Lio/vov/vitamio/VitamioInstaller;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 172
    invoke-virtual {v5}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 173
    iput v7, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 174
    invoke-virtual {v5, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    const/16 v0, 0x32

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setHeight(I)V

    goto :goto_0
.end method

.method public buildNotCompatibleDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;
    .locals 5
    .parameter "title"
    .parameter "msg"
    .parameter "button"

    .prologue
    const/16 v4, 0x14

    .line 202
    invoke-static {p1}, Lio/vov/a/c;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "Not compatitle"

    .line 203
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    invoke-static {p2}, Lio/vov/a/c;->b(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p2, "Vitamio is not compatible with your device."

    .end local p2
    :cond_1
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, -0x1

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const v0, -0xff0100

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setLinkTextColor(I)V

    const/16 v0, 0xa

    const/16 v3, 0x19

    invoke-virtual {v2, v4, v0, v4, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v0, 0x4190

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 204
    invoke-static {p3}, Lio/vov/a/c;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p3, "Exit"

    .line 205
    :cond_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lio/vov/vitamio/VitamioInstaller;->e:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 206
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 207
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 208
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 209
    new-instance v1, Lio/vov/vitamio/VitamioInstaller$3;

    invoke-direct {v1}, Lio/vov/vitamio/VitamioInstaller$3;-><init>()V

    invoke-virtual {v0, p3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 213
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 209
    return-object v0
.end method

.method public clearSources()Lio/vov/vitamio/VitamioInstaller;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 111
    return-object p0
.end method

.method public fillDefaultSources()Lio/vov/vitamio/VitamioInstaller;
    .locals 4

    .prologue
    .line 94
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    const-string v1, "Android Market"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "market://details?id="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lio/vov/vitamio/VitamioInstaller;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    const-string v1, "Vitamio Website"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "http://d.vov.io/vitamio/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lio/vov/vitamio/VitamioInstaller;->b:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    return-object p0
.end method

.method public getSources()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    return-object v0
.end method

.method public putSource(Ljava/lang/String;Ljava/lang/String;)Lio/vov/vitamio/VitamioInstaller;
    .locals 1
    .parameter "title"
    .parameter "url"

    .prologue
    .line 100
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    iget-object v0, p0, Lio/vov/vitamio/VitamioInstaller;->d:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_0
    return-object p0
.end method

.method public showInstallerDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "title"
    .parameter "msg"
    .parameter "button"

    .prologue
    .line 122
    invoke-virtual {p0, p1, p2, p3}, Lio/vov/vitamio/VitamioInstaller;->buildInstallerDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 123
    return-void
.end method

.method public showNotCompatibleDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "title"
    .parameter "msg"
    .parameter "button"

    .prologue
    .line 190
    invoke-virtual {p0, p1, p2, p3}, Lio/vov/vitamio/VitamioInstaller;->buildNotCompatibleDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 191
    return-void
.end method
