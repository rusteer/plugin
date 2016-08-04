.class Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;
.super Ljava/lang/Object;
.source "StatementExecutor.java"

# interfaces
.implements Lcom/j256/ormlite/stmt/GenericRowMapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/j256/ormlite/stmt/StatementExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UserObjectRowMapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<UO:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/j256/ormlite/stmt/GenericRowMapper",
        "<TUO;>;"
    }
.end annotation


# instance fields
.field private columnNames:[Ljava/lang/String;

.field private final mapper:Lcom/j256/ormlite/dao/RawRowMapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/RawRowMapper",
            "<TUO;>;"
        }
    .end annotation
.end field

.field private final stringRowMapper:Lcom/j256/ormlite/stmt/GenericRowMapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/stmt/GenericRowMapper",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/j256/ormlite/dao/RawRowMapper;Lcom/j256/ormlite/stmt/GenericRowMapper;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/RawRowMapper",
            "<TUO;>;",
            "Lcom/j256/ormlite/stmt/GenericRowMapper",
            "<[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 573
    .local p0, this:Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;,"Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper<TUO;>;"
    .local p1, mapper:Lcom/j256/ormlite/dao/RawRowMapper;,"Lcom/j256/ormlite/dao/RawRowMapper<TUO;>;"
    .local p2, stringMapper:Lcom/j256/ormlite/stmt/GenericRowMapper;,"Lcom/j256/ormlite/stmt/GenericRowMapper<[Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 574
    iput-object p1, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->mapper:Lcom/j256/ormlite/dao/RawRowMapper;

    .line 575
    iput-object p2, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->stringRowMapper:Lcom/j256/ormlite/stmt/GenericRowMapper;

    .line 576
    return-void
.end method

.method private getColumnNames(Lcom/j256/ormlite/support/DatabaseResults;)[Ljava/lang/String;
    .locals 1
    .parameter "results"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 584
    .local p0, this:Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;,"Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper<TUO;>;"
    iget-object v0, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->columnNames:[Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 585
    iget-object v0, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->columnNames:[Ljava/lang/String;

    .line 588
    :goto_0
    return-object v0

    .line 587
    :cond_0
    invoke-interface {p1}, Lcom/j256/ormlite/support/DatabaseResults;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->columnNames:[Ljava/lang/String;

    .line 588
    iget-object v0, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->columnNames:[Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public mapRow(Lcom/j256/ormlite/support/DatabaseResults;)Ljava/lang/Object;
    .locals 3
    .parameter "results"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/support/DatabaseResults;",
            ")TUO;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 579
    .local p0, this:Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;,"Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper<TUO;>;"
    iget-object v1, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->stringRowMapper:Lcom/j256/ormlite/stmt/GenericRowMapper;

    invoke-interface {v1, p1}, Lcom/j256/ormlite/stmt/GenericRowMapper;->mapRow(Lcom/j256/ormlite/support/DatabaseResults;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 580
    .local v0, stringResults:[Ljava/lang/String;
    iget-object v1, p0, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->mapper:Lcom/j256/ormlite/dao/RawRowMapper;

    invoke-direct {p0, p1}, Lcom/j256/ormlite/stmt/StatementExecutor$UserObjectRowMapper;->getColumnNames(Lcom/j256/ormlite/support/DatabaseResults;)[Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lcom/j256/ormlite/dao/RawRowMapper;->mapRow([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
