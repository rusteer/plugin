.class public Lcom/webuid/mmVideo/DBManager;
.super Ljava/lang/Object;
.source "DBManager.java"


# static fields
.field public static final DB_NAME:Ljava/lang/String; = "bus.db"

.field public static final DB_PATH:Ljava/lang/String; = null

.field public static final PACKAGE_NAME:Ljava/lang/String; = "com.webuid.mmVideo"


# instance fields
.field private final BUFFER_SIZE:I

.field private context:Landroid/content/Context;

.field private database:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "/data"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 20
    const-string v1, "com.webuid.mmVideo"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/DBManager;->DB_PATH:Ljava/lang/String;

    .line 14
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const v0, 0x61a80

    iput v0, p0, Lcom/webuid/mmVideo/DBManager;->BUFFER_SIZE:I

    .line 26
    iput-object p1, p0, Lcom/webuid/mmVideo/DBManager;->context:Landroid/content/Context;

    .line 27
    return-void
.end method

.method private openDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 8
    .parameter "dbfile"

    .prologue
    const/4 v2, 0x0

    .line 35
    :try_start_0
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 37
    iget-object v6, p0, Lcom/webuid/mmVideo/DBManager;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 38
    const/high16 v7, 0x7f05

    .line 37
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v5

    .line 39
    .local v5, is:Ljava/io/InputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 40
    .local v4, fos:Ljava/io/FileOutputStream;
    const v6, 0x61a80

    new-array v0, v6, [B

    .line 41
    .local v0, buffer:[B
    const/4 v1, 0x0

    .line 42
    .local v1, count:I
    :goto_0
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-gtz v1, :cond_1

    .line 45
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 46
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 49
    .end local v0           #buffer:[B
    .end local v1           #count:I
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v5           #is:Ljava/io/InputStream;
    :cond_0
    const/4 v6, 0x0

    .line 48
    invoke-static {p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 58
    :goto_1
    return-object v2

    .line 43
    .restart local v0       #buffer:[B
    .restart local v1       #count:I
    .restart local v4       #fos:Ljava/io/FileOutputStream;
    .restart local v5       #is:Ljava/io/InputStream;
    :cond_1
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 51
    .end local v0           #buffer:[B
    .end local v1           #count:I
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v5           #is:Ljava/io/InputStream;
    :catch_0
    move-exception v3

    .line 52
    .local v3, e:Ljava/io/FileNotFoundException;
    const-string v6, "Database"

    const-string v7, "File not found"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 54
    .end local v3           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v3

    .line 55
    .local v3, e:Ljava/io/IOException;
    const-string v6, "Database"

    const-string v7, "IO exception"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public closeDatabase()V
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/webuid/mmVideo/DBManager;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 63
    return-void
.end method

.method public openDatabase()V
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/webuid/mmVideo/DBManager;->DB_PATH:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "bus.db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/DBManager;->openDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/webuid/mmVideo/DBManager;->database:Landroid/database/sqlite/SQLiteDatabase;

    .line 31
    return-void
.end method
