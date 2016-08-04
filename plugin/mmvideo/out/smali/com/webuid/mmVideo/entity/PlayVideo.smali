.class public Lcom/webuid/mmVideo/entity/PlayVideo;
.super Ljava/lang/Object;
.source "PlayVideo.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "playVideo"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x78304b406d57334L


# instance fields
.field private Id:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
        generatedId = false
        unique = true
    .end annotation
.end field

.field private Length:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private Recommend:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private Size:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private Source:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private Star:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private Title:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private Url:Ljava/lang/String;
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "Id"
    .parameter "Url"
    .parameter "Title"
    .parameter "Source"
    .parameter "Size"
    .parameter "Length"
    .parameter "Star"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/entity/PlayVideo;->setId(I)V

    invoke-virtual {p0, p2}, Lcom/webuid/mmVideo/entity/PlayVideo;->setUrl(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Lcom/webuid/mmVideo/entity/PlayVideo;->setTitle(Ljava/lang/String;)V

    invoke-virtual {p0, p4}, Lcom/webuid/mmVideo/entity/PlayVideo;->setSource(Ljava/lang/String;)V

    invoke-virtual {p0, p5}, Lcom/webuid/mmVideo/entity/PlayVideo;->setSize(Ljava/lang/String;)V

    invoke-virtual {p0, p6}, Lcom/webuid/mmVideo/entity/PlayVideo;->setLength(Ljava/lang/String;)V

    invoke-virtual {p0, p7}, Lcom/webuid/mmVideo/entity/PlayVideo;->setStar(Ljava/lang/String;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getId()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Id:I

    return v0
.end method

.method public getLength()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Length:Ljava/lang/String;

    return-object v0
.end method

.method public getRecommend()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Recommend:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Size:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Source:Ljava/lang/String;

    return-object v0
.end method

.method public getStar()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Star:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Title:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Url:Ljava/lang/String;

    return-object v0
.end method

.method public setId(I)V
    .locals 0
    .parameter "id"

    .prologue
    .line 47
    iput p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Id:I

    .line 48
    return-void
.end method

.method public setLength(Ljava/lang/String;)V
    .locals 0
    .parameter "length"

    .prologue
    .line 87
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Length:Ljava/lang/String;

    .line 88
    return-void
.end method

.method public setRecommend(Ljava/lang/String;)V
    .locals 0
    .parameter "recommend"

    .prologue
    .line 95
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Recommend:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setSize(Ljava/lang/String;)V
    .locals 0
    .parameter "size"

    .prologue
    .line 79
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Size:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 0
    .parameter "source"

    .prologue
    .line 71
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Source:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setStar(Ljava/lang/String;)V
    .locals 0
    .parameter "star"

    .prologue
    .line 103
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Star:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 63
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Title:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .parameter "url"

    .prologue
    .line 55
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/PlayVideo;->Url:Ljava/lang/String;

    .line 56
    return-void
.end method
