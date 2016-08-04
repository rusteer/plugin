.class public Lcom/j256/ormlite/logger/LoggerFactory;
.super Ljava/lang/Object;
.source "LoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/j256/ormlite/logger/LoggerFactory$1;,
        Lcom/j256/ormlite/logger/LoggerFactory$LogType;
    }
.end annotation


# static fields
.field private static logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method private static findLogType()Lcom/j256/ormlite/logger/LoggerFactory$LogType;
    .locals 5

    .prologue
    .line 51
    invoke-static {}, Lcom/j256/ormlite/logger/LoggerFactory$LogType;->values()[Lcom/j256/ormlite/logger/LoggerFactory$LogType;

    move-result-object v0

    .local v0, arr$:[Lcom/j256/ormlite/logger/LoggerFactory$LogType;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 52
    .local v3, logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;
    invoke-virtual {v3}, Lcom/j256/ormlite/logger/LoggerFactory$LogType;->isAvailable()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 57
    .end local v3           #logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;
    :goto_1
    return-object v3

    .line 51
    .restart local v3       #logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 57
    .end local v3           #logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;
    :cond_1
    sget-object v3, Lcom/j256/ormlite/logger/LoggerFactory$LogType;->LOCAL:Lcom/j256/ormlite/logger/LoggerFactory$LogType;

    goto :goto_1
.end method

.method public static getLogger(Ljava/lang/Class;)Lcom/j256/ormlite/logger/Logger;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/j256/ormlite/logger/Logger;"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/j256/ormlite/logger/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/j256/ormlite/logger/Logger;

    move-result-object v0

    return-object v0
.end method

.method public static getLogger(Ljava/lang/String;)Lcom/j256/ormlite/logger/Logger;
    .locals 2
    .parameter "className"

    .prologue
    .line 31
    sget-object v0, Lcom/j256/ormlite/logger/LoggerFactory;->logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;

    if-nez v0, :cond_0

    .line 32
    invoke-static {}, Lcom/j256/ormlite/logger/LoggerFactory;->findLogType()Lcom/j256/ormlite/logger/LoggerFactory$LogType;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/logger/LoggerFactory;->logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;

    .line 34
    :cond_0
    new-instance v0, Lcom/j256/ormlite/logger/Logger;

    sget-object v1, Lcom/j256/ormlite/logger/LoggerFactory;->logType:Lcom/j256/ormlite/logger/LoggerFactory$LogType;

    invoke-virtual {v1, p0}, Lcom/j256/ormlite/logger/LoggerFactory$LogType;->createLog(Ljava/lang/String;)Lcom/j256/ormlite/logger/Log;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/j256/ormlite/logger/Logger;-><init>(Lcom/j256/ormlite/logger/Log;)V

    return-object v0
.end method

.method public static getSimpleClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "className"

    .prologue
    .line 39
    const-string v1, "\\."

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, parts:[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x1

    if-gt v1, v2, :cond_0

    .line 43
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object p0, v0, v1

    goto :goto_0
.end method
