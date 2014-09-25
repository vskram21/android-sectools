.class public Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
.super Ljava/lang/Object;
.source "PackWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Statistics"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    }
.end annotation


# instance fields
.field deltaSearchNonEdgeObjects:I

.field deltasFound:I

.field depth:I

.field interestingObjects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

.field reusedDeltas:J

.field reusedObjects:J

.field reusedPacks:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/CachedPack;",
            ">;"
        }
    .end annotation
.end field

.field thinPackBytes:J

.field timeCompressing:J

.field timeCounting:J

.field timeSearchingForReuse:J

.field timeSearchingForSizes:J

.field timeWriting:J

.field totalBytes:J

.field totalDeltas:J

.field totalObjects:J

.field uninterestingObjects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 2079
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2185
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    .line 2186
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    const/4 v1, 0x1

    new-instance v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    invoke-direct {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;-><init>()V

    aput-object v2, v0, v1

    .line 2187
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    const/4 v1, 0x2

    new-instance v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    invoke-direct {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;-><init>()V

    aput-object v2, v0, v1

    .line 2188
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    const/4 v1, 0x3

    new-instance v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    invoke-direct {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;-><init>()V

    aput-object v2, v0, v1

    .line 2189
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    const/4 v1, 0x4

    new-instance v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    invoke-direct {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;-><init>()V

    aput-object v2, v0, v1

    .line 2190
    return-void
.end method


# virtual methods
.method public byObjectType(I)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    .locals 1
    .parameter "typeCode"

    .prologue
    .line 2295
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getDeltaSearchNonEdgeObjects()I
    .locals 1

    .prologue
    .line 2223
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->deltaSearchNonEdgeObjects:I

    return v0
.end method

.method public getDeltasFound()I
    .locals 1

    .prologue
    .line 2232
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->deltasFound:I

    return v0
.end method

.method public getDepth()I
    .locals 1

    .prologue
    .line 2305
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->depth:I

    return v0
.end method

.method public getInterestingObjects()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2198
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->interestingObjects:Ljava/util/Set;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 5

    .prologue
    .line 2375
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->packWriterStatistics:Ljava/lang/String;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalObjects:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalDeltas:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedObjects:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedDeltas:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReusedDeltas()J
    .locals 2

    .prologue
    .line 2266
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedDeltas:J

    return-wide v0
.end method

.method public getReusedObjects()J
    .locals 2

    .prologue
    .line 2256
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedObjects:J

    return-wide v0
.end method

.method public getReusedPacks()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/CachedPack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2215
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedPacks:Ljava/util/Collection;

    return-object v0
.end method

.method public getThinPackBytes()J
    .locals 2

    .prologue
    .line 2286
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->thinPackBytes:J

    return-wide v0
.end method

.method public getTimeCompressing()J
    .locals 2

    .prologue
    .line 2343
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeCompressing:J

    return-wide v0
.end method

.method public getTimeCounting()J
    .locals 2

    .prologue
    .line 2314
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeCounting:J

    return-wide v0
.end method

.method public getTimeSearchingForReuse()J
    .locals 2

    .prologue
    .line 2323
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeSearchingForReuse:J

    return-wide v0
.end method

.method public getTimeSearchingForSizes()J
    .locals 2

    .prologue
    .line 2333
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeSearchingForSizes:J

    return-wide v0
.end method

.method public getTimeTotal()J
    .locals 4

    .prologue
    .line 2358
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeCounting:J

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeSearchingForReuse:J

    add-long/2addr v0, v2

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeSearchingForSizes:J

    add-long/2addr v0, v2

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeCompressing:J

    add-long/2addr v0, v2

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeWriting:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getTimeWriting()J
    .locals 2

    .prologue
    .line 2353
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeWriting:J

    return-wide v0
.end method

.method public getTotalBytes()J
    .locals 2

    .prologue
    .line 2274
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalBytes:J

    return-wide v0
.end method

.method public getTotalDeltas()J
    .locals 2

    .prologue
    .line 2248
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalDeltas:J

    return-wide v0
.end method

.method public getTotalObjects()J
    .locals 2

    .prologue
    .line 2240
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalObjects:J

    return-wide v0
.end method

.method public getTransferRate()D
    .locals 6

    .prologue
    .line 2370
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->getTotalBytes()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->getTimeWriting()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L

    div-double/2addr v2, v4

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public getUninterestingObjects()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2207
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->uninterestingObjects:Ljava/util/Set;

    return-object v0
.end method

.method public isShallow()Z
    .locals 1

    .prologue
    .line 2300
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->depth:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
