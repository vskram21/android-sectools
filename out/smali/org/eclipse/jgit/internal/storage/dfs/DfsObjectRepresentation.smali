.class Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;
.super Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;
.source "DfsObjectRepresentation.java"


# instance fields
.field baseId:Lorg/eclipse/jgit/lib/ObjectId;

.field format:I

.field length:J

.field offset:J

.field final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V
    .locals 0
    .parameter "pack"

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 60
    return-void
.end method


# virtual methods
.method public getDeltaBase()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getFormat()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->format:I

    return v0
.end method

.method public getWeight()I
    .locals 4

    .prologue
    .line 69
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->length:J

    const-wide/32 v2, 0x7fffffff

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public wasDeltaAttempted()Z
    .locals 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getPackSource()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->GC:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
