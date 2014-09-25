.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
.super Ljava/lang/Object;
.source "DfsPackDescription.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
        ">;"
    }
.end annotation


# instance fields
.field private deltaCount:J

.field private extensions:I

.field private indexVersion:I

.field private lastModified:J

.field private objectCount:J

.field private final packName:Ljava/lang/String;

.field private packSource:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

.field private final repoDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

.field private final sizeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackExt;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;Ljava/lang/String;)V
    .locals 3
    .parameter "repoDesc"
    .parameter "name"

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->repoDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    .line 101
    const/16 v1, 0x2e

    invoke-virtual {p2, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 102
    .local v0, dot:I
    if-gez v0, :cond_0

    .end local p2
    :goto_0
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->packName:Ljava/lang/String;

    .line 103
    new-instance v1, Ljava/util/HashMap;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->values()[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-result-object v2

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->sizeMap:Ljava/util/Map;

    .line 104
    return-void

    .line 102
    .restart local p2
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method


# virtual methods
.method public addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V
    .locals 2
    .parameter "ext"

    .prologue
    .line 118
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->extensions:I

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v1

    or-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->extensions:I

    .line 119
    return-void
.end method

.method public clearPackStats()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 1

    .prologue
    .line 246
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    .line 247
    return-object p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    check-cast p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->compareTo(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;)I
    .locals 7
    .parameter "b"

    .prologue
    .line 293
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getPackSource()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    move-result-object v0

    .line 294
    .local v0, as:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getPackSource()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    move-result-object v1

    .line 295
    .local v1, bs:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 296
    iget v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->category:I

    iget v4, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->category:I

    sub-int v2, v3, v4

    .line 297
    .local v2, cmp:I
    if-eqz v2, :cond_0

    move v3, v2

    .line 309
    :goto_0
    return v3

    .line 302
    .end local v2           #cmp:I
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getLastModified()J

    move-result-wide v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getLastModified()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->signum(J)I

    move-result v2

    .line 303
    .restart local v2       #cmp:I
    if-eqz v2, :cond_1

    move v3, v2

    .line 304
    goto :goto_0

    .line 309
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getObjectCount()J

    move-result-wide v3

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getObjectCount()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->signum(J)I

    move-result v3

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "b"

    .prologue
    const/4 v1, 0x0

    .line 272
    instance-of v2, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 273
    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 274
    .local v0, desc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->packName:Ljava/lang/String;

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->packName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getRepositoryDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getRepositoryDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 277
    .end local v0           #desc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :cond_0
    return v1
.end method

.method public getDeltaCount()J
    .locals 2

    .prologue
    .line 209
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->deltaCount:J

    return-wide v0
.end method

.method public getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;
    .locals 2
    .parameter "ext"

    .prologue
    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->packName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)J
    .locals 3
    .parameter "ext"

    .prologue
    .line 188
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->sizeMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 189
    .local v0, size:Ljava/lang/Long;
    if-nez v0, :cond_0

    const-wide/16 v1, 0x0

    :goto_0
    return-wide v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    goto :goto_0
.end method

.method public getIndexVersion()I
    .locals 1

    .prologue
    .line 252
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->indexVersion:I

    return v0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 156
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->lastModified:J

    return-wide v0
.end method

.method public getObjectCount()J
    .locals 2

    .prologue
    .line 194
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->objectCount:J

    return-wide v0
.end method

.method public getPackSource()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->packSource:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    return-object v0
.end method

.method public getPackStats()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    return-object v0
.end method

.method public getRepositoryDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->repoDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    return-object v0
.end method

.method public hasFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Z
    .locals 2
    .parameter "ext"

    .prologue
    .line 127
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->extensions:I

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->packName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public setDeltaCount(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 2
    .parameter "cnt"

    .prologue
    .line 218
    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->deltaCount:J

    .line 219
    return-object p0
.end method

.method public setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 3
    .parameter "ext"
    .parameter "bytes"

    .prologue
    .line 178
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->sizeMap:Ljava/util/Map;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    return-object p0
.end method

.method public setIndexVersion(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 0
    .parameter "version"

    .prologue
    .line 261
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->indexVersion:I

    .line 262
    return-object p0
.end method

.method public setLastModified(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 0
    .parameter "timeMillis"

    .prologue
    .line 165
    iput-wide p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->lastModified:J

    .line 166
    return-object p0
.end method

.method public setObjectCount(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 2
    .parameter "cnt"

    .prologue
    .line 203
    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->objectCount:J

    .line 204
    return-object p0
.end method

.method public setPackSource(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 0
    .parameter "source"

    .prologue
    .line 150
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->packSource:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    .line 151
    return-object p0
.end method

.method setPackStats(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 3
    .parameter "stats"

    .prologue
    .line 233
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    .line 234
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->getTotalBytes()J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 235
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->getTotalObjects()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setObjectCount(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 236
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->getTotalDeltas()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setDeltaCount(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 237
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 314
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
