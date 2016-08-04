.class public Lorg/xmlrpc/android/MethodCall;
.super Ljava/lang/Object;
.source "MethodCall.java"


# static fields
.field private static final TOPIC:I = 0x1


# instance fields
.field methodName:Ljava/lang/String;

.field params:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/xmlrpc/android/MethodCall;->params:Ljava/util/ArrayList;

    .line 5
    return-void
.end method


# virtual methods
.method public getMethodName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lorg/xmlrpc/android/MethodCall;->methodName:Ljava/lang/String;

    return-object v0
.end method

.method public getParams()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 14
    iget-object v0, p0, Lorg/xmlrpc/android/MethodCall;->params:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTopic()Ljava/lang/String;
    .locals 2

    .prologue
    .line 18
    iget-object v0, p0, Lorg/xmlrpc/android/MethodCall;->params:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method setMethodName(Ljava/lang/String;)V
    .locals 0
    .parameter "methodName"

    .prologue
    .line 12
    iput-object p1, p0, Lorg/xmlrpc/android/MethodCall;->methodName:Ljava/lang/String;

    return-void
.end method

.method setParams(Ljava/util/ArrayList;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p1, params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iput-object p1, p0, Lorg/xmlrpc/android/MethodCall;->params:Ljava/util/ArrayList;

    return-void
.end method
