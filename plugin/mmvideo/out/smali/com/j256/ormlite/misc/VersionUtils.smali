.class public Lcom/j256/ormlite/misc/VersionUtils;
.super Ljava/lang/Object;
.source "VersionUtils.java"


# static fields
.field private static final ANDROID_VERSION_FILE:Ljava/lang/String; = "/com/j256/ormlite/android/VERSION.txt"

.field private static final CORE_VERSION_FILE:Ljava/lang/String; = "/com/j256/ormlite/core/VERSION.txt"

.field private static final JDBC_VERSION_FILE:Ljava/lang/String; = "/com/j256/ormlite/jdbc/VERSION.txt"

.field private static androidVersionFile:Ljava/lang/String;

.field private static coreVersionFile:Ljava/lang/String;

.field private static jdbcVersionFile:Ljava/lang/String;

.field private static logger:Lcom/j256/ormlite/logger/Logger;

.field private static thrownOnErrors:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, "/com/j256/ormlite/core/VERSION.txt"

    sput-object v0, Lcom/j256/ormlite/misc/VersionUtils;->coreVersionFile:Ljava/lang/String;

    .line 24
    const-string v0, "/com/j256/ormlite/jdbc/VERSION.txt"

    sput-object v0, Lcom/j256/ormlite/misc/VersionUtils;->jdbcVersionFile:Ljava/lang/String;

    .line 25
    const-string v0, "/com/j256/ormlite/android/VERSION.txt"

    sput-object v0, Lcom/j256/ormlite/misc/VersionUtils;->androidVersionFile:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    sput-boolean v0, Lcom/j256/ormlite/misc/VersionUtils;->thrownOnErrors:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static final checkCoreVersusAndroidVersions()V
    .locals 4

    .prologue
    .line 45
    invoke-static {}, Lcom/j256/ormlite/misc/VersionUtils;->readCoreVersion()Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, core:Ljava/lang/String;
    invoke-static {}, Lcom/j256/ormlite/misc/VersionUtils;->readAndroidVersion()Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, android:Ljava/lang/String;
    const-string v2, "core"

    const-string v3, "android"

    invoke-static {v2, v1, v3, v0}, Lcom/j256/ormlite/misc/VersionUtils;->logVersionErrors(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public static final checkCoreVersusJdbcVersions()V
    .locals 4

    .prologue
    .line 36
    invoke-static {}, Lcom/j256/ormlite/misc/VersionUtils;->readCoreVersion()Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, core:Ljava/lang/String;
    invoke-static {}, Lcom/j256/ormlite/misc/VersionUtils;->readJdbcVersion()Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, jdbc:Ljava/lang/String;
    const-string v2, "core"

    const-string v3, "jdbc"

    invoke-static {v2, v0, v3, v1}, Lcom/j256/ormlite/misc/VersionUtils;->logVersionErrors(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method private static error(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6
    .parameter "th"
    .parameter "msg"
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 145
    invoke-static {}, Lcom/j256/ormlite/misc/VersionUtils;->getLogger()Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/j256/ormlite/logger/Logger;->error(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 146
    sget-boolean v0, Lcom/j256/ormlite/misc/VersionUtils;->thrownOnErrors:Z

    if-eqz v0, :cond_0

    .line 147
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "See error log for details: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 149
    :cond_0
    return-void
.end method

.method private static error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3
    .parameter "th"
    .parameter "msg"
    .parameter "args"

    .prologue
    .line 152
    invoke-static {}, Lcom/j256/ormlite/misc/VersionUtils;->getLogger()Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/j256/ormlite/logger/Logger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 153
    sget-boolean v0, Lcom/j256/ormlite/misc/VersionUtils;->thrownOnErrors:Z

    if-eqz v0, :cond_0

    .line 154
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "See error log for details:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_0
    return-void
.end method

.method private static getLogger()Lcom/j256/ormlite/logger/Logger;
    .locals 1

    .prologue
    .line 162
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->logger:Lcom/j256/ormlite/logger/Logger;

    if-nez v0, :cond_0

    .line 163
    const-class v0, Lcom/j256/ormlite/misc/VersionUtils;

    invoke-static {v0}, Lcom/j256/ormlite/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/misc/VersionUtils;->logger:Lcom/j256/ormlite/logger/Logger;

    .line 165
    :cond_0
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->logger:Lcom/j256/ormlite/logger/Logger;

    return-object v0
.end method

.method private static getVersionFromFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "file"

    .prologue
    const/4 v4, 0x0

    .line 118
    const-class v5, Lcom/j256/ormlite/misc/VersionUtils;

    invoke-virtual {v5, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 119
    .local v1, inputStream:Ljava/io/InputStream;
    if-nez v1, :cond_1

    .line 120
    const-string v5, "Could not find version file {}"

    invoke-static {v4, v5, p0, v4, v4}, Lcom/j256/ormlite/misc/VersionUtils;->error(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v3, v4

    .line 141
    :cond_0
    :goto_0
    return-object v3

    .line 123
    :cond_1
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 126
    .local v2, reader:Ljava/io/BufferedReader;
    :try_start_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 133
    .local v3, version:Ljava/lang/String;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 138
    :goto_1
    if-nez v3, :cond_0

    .line 139
    const-string v5, "No version specified in {}"

    invoke-static {v4, v5, p0, v4, v4}, Lcom/j256/ormlite/misc/VersionUtils;->error(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 127
    .end local v3           #version:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 129
    .local v0, e:Ljava/io/IOException;
    :try_start_2
    const-string v5, "Could not read version from {}"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v0, v5, p0, v6, v7}, Lcom/j256/ormlite/misc/VersionUtils;->error(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 133
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    :goto_2
    move-object v3, v4

    .line 136
    goto :goto_0

    .line 132
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 133
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 136
    :goto_3
    throw v4

    .line 134
    .restart local v3       #version:Ljava/lang/String;
    :catch_1
    move-exception v5

    goto :goto_1

    .end local v3           #version:Ljava/lang/String;
    .restart local v0       #e:Ljava/io/IOException;
    :catch_2
    move-exception v5

    goto :goto_2

    .end local v0           #e:Ljava/io/IOException;
    :catch_3
    move-exception v5

    goto :goto_3
.end method

.method private static logVersionErrors(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "label1"
    .parameter "version1"
    .parameter "label2"
    .parameter "version2"

    .prologue
    const/4 v3, 0x0

    .line 82
    if-nez p1, :cond_1

    .line 83
    if-eqz p3, :cond_0

    .line 84
    const-string v0, "Unknown version for {}, version for {} is \'{}\'"

    invoke-static {v3, v0, p0, p2, p3}, Lcom/j256/ormlite/misc/VersionUtils;->error(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 87
    :cond_1
    if-nez p3, :cond_2

    .line 88
    const-string v0, "Unknown version for {}, version for {} is \'{}\'"

    invoke-static {v3, v0, p2, p0, p1}, Lcom/j256/ormlite/misc/VersionUtils;->error(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 90
    const-string v0, "Mismatched versions: {} is \'{}\', while {} is \'{}\'"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    aput-object p2, v1, v2

    const/4 v2, 0x3

    aput-object p3, v1, v2

    invoke-static {v3, v0, v1}, Lcom/j256/ormlite/misc/VersionUtils;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static readAndroidVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->androidVersionFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/j256/ormlite/misc/VersionUtils;->getVersionFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readCoreVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->coreVersionFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/j256/ormlite/misc/VersionUtils;->getVersionFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readJdbcVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    sget-object v0, Lcom/j256/ormlite/misc/VersionUtils;->jdbcVersionFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/j256/ormlite/misc/VersionUtils;->getVersionFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static setAndroidVersionFile(Ljava/lang/String;)V
    .locals 0
    .parameter "androidVersionFile"

    .prologue
    .line 68
    sput-object p0, Lcom/j256/ormlite/misc/VersionUtils;->androidVersionFile:Ljava/lang/String;

    .line 69
    return-void
.end method

.method static setCoreVersionFile(Ljava/lang/String;)V
    .locals 0
    .parameter "coreVersionFile"

    .prologue
    .line 54
    sput-object p0, Lcom/j256/ormlite/misc/VersionUtils;->coreVersionFile:Ljava/lang/String;

    .line 55
    return-void
.end method

.method static setJdbcVersionFile(Ljava/lang/String;)V
    .locals 0
    .parameter "jdbcVersionFile"

    .prologue
    .line 61
    sput-object p0, Lcom/j256/ormlite/misc/VersionUtils;->jdbcVersionFile:Ljava/lang/String;

    .line 62
    return-void
.end method

.method static setThrownOnErrors(Z)V
    .locals 0
    .parameter "thrownOnErrors"

    .prologue
    .line 75
    sput-boolean p0, Lcom/j256/ormlite/misc/VersionUtils;->thrownOnErrors:Z

    .line 76
    return-void
.end method
