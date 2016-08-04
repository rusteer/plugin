.class public Lcom/webuid/mmVideo/entity/DownVideo;
.super Ljava/lang/Object;
.source "DownVideo.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation runtime Lcom/j256/ormlite/table/DatabaseTable;
    tableName = "downVideo"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x723ff3d25fc1ee8eL


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

.field private Path:Ljava/lang/String;
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

.field private finish:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field

.field private progress:I
    .annotation runtime Lcom/j256/ormlite/field/DatabaseField;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "Id"
    .parameter "Url"
    .parameter "Title"
    .parameter "Source"
    .parameter "Size"
    .parameter "Length"
    .parameter "Star"
    .parameter "Path"

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/entity/DownVideo;->setId(I)V

    invoke-virtual {p0, p2}, Lcom/webuid/mmVideo/entity/DownVideo;->setUrl(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Lcom/webuid/mmVideo/entity/DownVideo;->setTitle(Ljava/lang/String;)V

    invoke-virtual {p0, p4}, Lcom/webuid/mmVideo/entity/DownVideo;->setSource(Ljava/lang/String;)V

    invoke-virtual {p0, p5}, Lcom/webuid/mmVideo/entity/DownVideo;->setSize(Ljava/lang/String;)V

    invoke-virtual {p0, p6}, Lcom/webuid/mmVideo/entity/DownVideo;->setLength(Ljava/lang/String;)V

    invoke-virtual {p0, p7}, Lcom/webuid/mmVideo/entity/DownVideo;->setStar(Ljava/lang/String;)V

    invoke-virtual {p0, p8}, Lcom/webuid/mmVideo/entity/DownVideo;->setPath(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/entity/DownVideo;->setFinish(I)V

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/entity/DownVideo;->setProgress(I)V

    .line 47
    return-void
.end method


# virtual methods
.method public getFinish()I
    .locals 1

    .prologue
    .line 114
    iget v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->finish:I

    return v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Id:I

    return v0
.end method

.method public getLength()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Length:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Path:Ljava/lang/String;

    return-object v0
.end method

.method public getProgress()I
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->progress:I

    return v0
.end method

.method public getRecommend()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Recommend:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Size:Ljava/lang/String;

    return-object v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Source:Ljava/lang/String;

    return-object v0
.end method

.method public getStar()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Star:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Title:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Url:Ljava/lang/String;

    return-object v0
.end method

.method public setFinish(I)V
    .locals 0
    .parameter "finish"

    .prologue
    .line 118
    iput p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->finish:I

    .line 119
    return-void
.end method

.method public setId(I)V
    .locals 0
    .parameter "id"

    .prologue
    .line 54
    iput p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Id:I

    .line 55
    return-void
.end method

.method public setLength(Ljava/lang/String;)V
    .locals 0
    .parameter "length"

    .prologue
    .line 94
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Length:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .parameter "path"

    .prologue
    .line 134
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Path:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setProgress(I)V
    .locals 0
    .parameter "progress"

    .prologue
    .line 126
    iput p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->progress:I

    .line 127
    return-void
.end method

.method public setRecommend(Ljava/lang/String;)V
    .locals 0
    .parameter "recommend"

    .prologue
    .line 102
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Recommend:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setSize(Ljava/lang/String;)V
    .locals 0
    .parameter "size"

    .prologue
    .line 86
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Size:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 0
    .parameter "source"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Source:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setStar(Ljava/lang/String;)V
    .locals 0
    .parameter "star"

    .prologue
    .line 110
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Star:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 70
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Title:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .parameter "url"

    .prologue
    .line 62
    iput-object p1, p0, Lcom/webuid/mmVideo/entity/DownVideo;->Url:Ljava/lang/String;

    .line 63
    return-void
.end method
