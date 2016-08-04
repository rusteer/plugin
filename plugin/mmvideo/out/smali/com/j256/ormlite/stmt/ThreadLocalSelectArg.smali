.class public Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;
.super Lcom/j256/ormlite/stmt/BaseArgumentHolder;
.source "ThreadLocalSelectArg.java"

# interfaces
.implements Lcom/j256/ormlite/stmt/ArgumentHolder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/j256/ormlite/stmt/ThreadLocalSelectArg$ValueWrapper;
    }
.end annotation


# instance fields
.field private threadValue:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/j256/ormlite/stmt/ThreadLocalSelectArg$ValueWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;-><init>()V

    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->threadValue:Ljava/lang/ThreadLocal;

    .line 18
    return-void
.end method

.method public constructor <init>(Lcom/j256/ormlite/field/SqlType;Ljava/lang/Object;)V
    .locals 1
    .parameter "sqlType"
    .parameter "value"

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;-><init>(Lcom/j256/ormlite/field/SqlType;)V

    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->threadValue:Ljava/lang/ThreadLocal;

    .line 27
    invoke-virtual {p0, p2}, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->setValue(Ljava/lang/Object;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;-><init>()V

    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->threadValue:Ljava/lang/ThreadLocal;

    .line 31
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->setValue(Ljava/lang/Object;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .parameter "columnName"
    .parameter "value"

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;-><init>(Ljava/lang/String;)V

    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->threadValue:Ljava/lang/ThreadLocal;

    .line 22
    invoke-virtual {p0, p2}, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->setValue(Ljava/lang/Object;)V

    .line 23
    return-void
.end method


# virtual methods
.method protected getValue()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 36
    iget-object v1, p0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->threadValue:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg$ValueWrapper;

    .line 37
    .local v0, wrapper:Lcom/j256/ormlite/stmt/ThreadLocalSelectArg$ValueWrapper;
    if-nez v0, :cond_0

    .line 38
    const/4 v1, 0x0

    .line 40
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg$ValueWrapper;->value:Ljava/lang/Object;

    goto :goto_0
.end method

.method protected isValueSet()Z
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->threadValue:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 2
    .parameter "value"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg;->threadValue:Ljava/lang/ThreadLocal;

    new-instance v1, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg$ValueWrapper;

    invoke-direct {v1, p1}, Lcom/j256/ormlite/stmt/ThreadLocalSelectArg$ValueWrapper;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 47
    return-void
.end method
