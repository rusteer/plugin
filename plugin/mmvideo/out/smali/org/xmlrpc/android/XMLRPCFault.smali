.class public Lorg/xmlrpc/android/XMLRPCFault;
.super Lorg/xmlrpc/android/XMLRPCException;
.source "XMLRPCFault.java"


# static fields
.field private static final serialVersionUID:J = 0x4ec7337a83bbe967L


# instance fields
.field private faultCode:I

.field private faultString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .parameter "faultString"
    .parameter "faultCode"

    .prologue
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "XMLRPC Fault: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " [code "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/xmlrpc/android/XMLRPCException;-><init>(Ljava/lang/String;)V

    .line 13
    iput-object p1, p0, Lorg/xmlrpc/android/XMLRPCFault;->faultString:Ljava/lang/String;

    .line 14
    iput p2, p0, Lorg/xmlrpc/android/XMLRPCFault;->faultCode:I

    .line 15
    return-void
.end method


# virtual methods
.method public getFaultCode()I
    .locals 1

    .prologue
    .line 22
    iget v0, p0, Lorg/xmlrpc/android/XMLRPCFault;->faultCode:I

    return v0
.end method

.method public getFaultString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lorg/xmlrpc/android/XMLRPCFault;->faultString:Ljava/lang/String;

    return-object v0
.end method
