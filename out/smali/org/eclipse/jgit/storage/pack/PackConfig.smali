.class public Lorg/eclipse/jgit/storage/pack/PackConfig;
.super Ljava/lang/Object;
.source "PackConfig.java"


# static fields
.field public static final DEFAULT_BIG_FILE_THRESHOLD:I = 0x3200000

.field public static final DEFAULT_BUILD_BITMAPS:Z = true

.field public static final DEFAULT_DELTA_BASE_AS_OFFSET:Z = false

.field public static final DEFAULT_DELTA_CACHE_LIMIT:I = 0x64

.field public static final DEFAULT_DELTA_CACHE_SIZE:J = 0x3200000L

.field public static final DEFAULT_DELTA_COMPRESS:Z = true

.field public static final DEFAULT_DELTA_SEARCH_WINDOW_SIZE:I = 0xa

.field public static final DEFAULT_INDEX_VERSION:I = 0x2

.field public static final DEFAULT_MAX_DELTA_DEPTH:I = 0x32

.field public static final DEFAULT_REUSE_DELTAS:Z = true

.field public static final DEFAULT_REUSE_OBJECTS:Z = true


# instance fields
.field private bigFileThreshold:I

.field private buildBitmaps:Z

.field private compressionLevel:I

.field private cutDeltaChains:Z

.field private deltaBaseAsOffset:Z

.field private deltaCacheLimit:I

.field private deltaCacheSize:J

.field private deltaCompress:Z

.field private deltaSearchMemoryLimit:J

.field private deltaSearchWindowSize:I

.field private executor:Ljava/util/concurrent/Executor;

.field private indexVersion:I

.field private maxDeltaDepth:I

.field private reuseDeltas:Z

.field private reuseObjects:Z

.field private threads:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    .line 144
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    .line 146
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    .line 150
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    .line 152
    const/16 v0, 0x32

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    .line 154
    const/16 v0, 0xa

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    .line 158
    const-wide/32 v0, 0x3200000

    iput-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    .line 160
    const/16 v0, 0x64

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    .line 162
    const/high16 v0, 0x320

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    .line 168
    const/4 v0, 0x2

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    .line 170
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    .line 177
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 3
    .parameter "cfg"

    .prologue
    const/4 v2, 0x1

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    .line 144
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    .line 146
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    .line 150
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    .line 152
    const/16 v0, 0x32

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    .line 154
    const/16 v0, 0xa

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    .line 158
    const-wide/32 v0, 0x3200000

    iput-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    .line 160
    const/16 v0, 0x64

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    .line 162
    const/high16 v0, 0x320

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    .line 168
    const/4 v0, 0x2

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    .line 170
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    .line 200
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->fromConfig(Lorg/eclipse/jgit/lib/Config;)V

    .line 201
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 3
    .parameter "db"

    .prologue
    const/4 v2, 0x1

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    .line 144
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    .line 146
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    .line 150
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    .line 152
    const/16 v0, 0x32

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    .line 154
    const/16 v0, 0xa

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    .line 158
    const-wide/32 v0, 0x3200000

    iput-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    .line 160
    const/16 v0, 0x64

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    .line 162
    const/high16 v0, 0x320

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    .line 168
    const/4 v0, 0x2

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    .line 170
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    .line 188
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->fromConfig(Lorg/eclipse/jgit/lib/Config;)V

    .line 189
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/storage/pack/PackConfig;)V
    .locals 3
    .parameter "cfg"

    .prologue
    const/4 v2, 0x1

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    .line 144
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    .line 146
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    .line 150
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    .line 152
    const/16 v0, 0x32

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    .line 154
    const/16 v0, 0xa

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    .line 158
    const-wide/32 v0, 0x3200000

    iput-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    .line 160
    const/16 v0, 0x64

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    .line 162
    const/high16 v0, 0x320

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    .line 168
    const/4 v0, 0x2

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    .line 170
    iput-boolean v2, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    .line 210
    iget v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    .line 211
    iget-boolean v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    .line 212
    iget-boolean v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    .line 213
    iget-boolean v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    .line 214
    iget-boolean v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    .line 215
    iget v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    .line 216
    iget v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    .line 217
    iget-wide v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchMemoryLimit:J

    iput-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchMemoryLimit:J

    .line 218
    iget-wide v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    iput-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    .line 219
    iget v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    .line 220
    iget v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    .line 221
    iget v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->threads:I

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->threads:I

    .line 222
    iget-object v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->executor:Ljava/util/concurrent/Executor;

    iput-object v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->executor:Ljava/util/concurrent/Executor;

    .line 223
    iget v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    iput v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    .line 224
    iget-boolean v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    .line 225
    iget-boolean v0, p1, Lorg/eclipse/jgit/storage/pack/PackConfig;->cutDeltaChains:Z

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->cutDeltaChains:Z

    .line 226
    return-void
.end method


# virtual methods
.method public fromConfig(Lorg/eclipse/jgit/lib/Config;)V
    .locals 5
    .parameter "rc"

    .prologue
    .line 696
    const-string v0, "pack"

    const-string v1, "depth"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getMaxDeltaDepth()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setMaxDeltaDepth(I)V

    .line 697
    const-string v0, "pack"

    const-string v1, "window"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchWindowSize()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaSearchWindowSize(I)V

    .line 699
    const-string v0, "pack"

    const-string v1, "windowmemory"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchMemoryLimit()J

    move-result-wide v2

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaSearchMemoryLimit(J)V

    .line 701
    const-string v0, "pack"

    const-string v1, "deltacachesize"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaCacheSize()J

    move-result-wide v2

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaCacheSize(J)V

    .line 703
    const-string v0, "pack"

    const-string v1, "deltacachelimit"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaCacheLimit()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaCacheLimit(I)V

    .line 705
    const-string v0, "pack"

    const-string v1, "compression"

    const-string v2, "core"

    const-string v3, "compression"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getCompressionLevel()I

    move-result v4

    invoke-virtual {p1, v2, v3, v4}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setCompressionLevel(I)V

    .line 707
    const-string v0, "pack"

    const-string v1, "indexversion"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getIndexVersion()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setIndexVersion(I)V

    .line 708
    const-string v0, "core"

    const-string v1, "bigfilethreshold"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getBigFileThreshold()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setBigFileThreshold(I)V

    .line 710
    const-string v0, "pack"

    const-string v1, "threads"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getThreads()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setThreads(I)V

    .line 714
    const-string v0, "pack"

    const-string v1, "reusedeltas"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseDeltas()Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setReuseDeltas(Z)V

    .line 715
    const-string v0, "pack"

    const-string v1, "reuseobjects"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseObjects()Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setReuseObjects(Z)V

    .line 716
    const-string v0, "pack"

    const-string v1, "deltacompression"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isDeltaCompress()Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaCompress(Z)V

    .line 718
    const-string v0, "pack"

    const-string v1, "cutdeltachains"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getCutDeltaChains()Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setCutDeltaChains(Z)V

    .line 720
    const-string v0, "pack"

    const-string v1, "buildbitmaps"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isBuildBitmaps()Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setBuildBitmaps(Z)V

    .line 721
    return-void
.end method

.method public getBigFileThreshold()I
    .locals 1

    .prologue
    .line 537
    iget v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    return v0
.end method

.method public getCompressionLevel()I
    .locals 1

    .prologue
    .line 560
    iget v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    return v0
.end method

.method public getCutDeltaChains()Z
    .locals 1

    .prologue
    .line 385
    iget-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->cutDeltaChains:Z

    return v0
.end method

.method public getDeltaCacheLimit()I
    .locals 1

    .prologue
    .line 506
    iget v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    return v0
.end method

.method public getDeltaCacheSize()J
    .locals 2

    .prologue
    .line 477
    iget-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    return-wide v0
.end method

.method public getDeltaSearchMemoryLimit()J
    .locals 2

    .prologue
    .line 447
    iget-wide v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchMemoryLimit:J

    return-wide v0
.end method

.method public getDeltaSearchWindowSize()I
    .locals 1

    .prologue
    .line 416
    iget v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    return v0
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .prologue
    .line 611
    iget-object v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getIndexVersion()I
    .locals 1

    .prologue
    .line 640
    iget v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    return v0
.end method

.method public getMaxDeltaDepth()I
    .locals 1

    .prologue
    .line 360
    iget v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    return v0
.end method

.method public getThreads()I
    .locals 1

    .prologue
    .line 585
    iget v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->threads:I

    return v0
.end method

.method public isBuildBitmaps()Z
    .locals 1

    .prologue
    .line 667
    iget-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    return v0
.end method

.method public isDeltaBaseAsOffset()Z
    .locals 1

    .prologue
    .line 303
    iget-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    return v0
.end method

.method public isDeltaCompress()Z
    .locals 1

    .prologue
    .line 333
    iget-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    return v0
.end method

.method public isReuseDeltas()Z
    .locals 1

    .prologue
    .line 236
    iget-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    return v0
.end method

.method public isReuseObjects()Z
    .locals 1

    .prologue
    .line 269
    iget-boolean v0, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    return v0
.end method

.method public setBigFileThreshold(I)V
    .locals 0
    .parameter "bigFileThreshold"

    .prologue
    .line 549
    iput p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->bigFileThreshold:I

    .line 550
    return-void
.end method

.method public setBuildBitmaps(Z)V
    .locals 0
    .parameter "buildBitmaps"

    .prologue
    .line 683
    iput-boolean p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->buildBitmaps:Z

    .line 684
    return-void
.end method

.method public setCompressionLevel(I)V
    .locals 0
    .parameter "level"

    .prologue
    .line 573
    iput p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->compressionLevel:I

    .line 574
    return-void
.end method

.method public setCutDeltaChains(Z)V
    .locals 0
    .parameter "cut"

    .prologue
    .line 402
    iput-boolean p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->cutDeltaChains:Z

    .line 403
    return-void
.end method

.method public setDeltaBaseAsOffset(Z)V
    .locals 0
    .parameter "deltaBaseAsOffset"

    .prologue
    .line 320
    iput-boolean p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaBaseAsOffset:Z

    .line 321
    return-void
.end method

.method public setDeltaCacheLimit(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 522
    iput p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheLimit:I

    .line 523
    return-void
.end method

.method public setDeltaCacheSize(J)V
    .locals 0
    .parameter "size"

    .prologue
    .line 495
    iput-wide p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCacheSize:J

    .line 496
    return-void
.end method

.method public setDeltaCompress(Z)V
    .locals 0
    .parameter "deltaCompress"

    .prologue
    .line 347
    iput-boolean p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaCompress:Z

    .line 348
    return-void
.end method

.method public setDeltaSearchMemoryLimit(J)V
    .locals 0
    .parameter "memoryLimit"

    .prologue
    .line 461
    iput-wide p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchMemoryLimit:J

    .line 462
    return-void
.end method

.method public setDeltaSearchWindowSize(I)V
    .locals 1
    .parameter "objectCount"

    .prologue
    .line 428
    const/4 v0, 0x2

    if-gt p1, v0, :cond_0

    .line 429
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaCompress(Z)V

    .line 432
    :goto_0
    return-void

    .line 431
    :cond_0
    iput p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->deltaSearchWindowSize:I

    goto :goto_0
.end method

.method public setExecutor(Ljava/util/concurrent/Executor;)V
    .locals 0
    .parameter "executor"

    .prologue
    .line 627
    iput-object p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->executor:Ljava/util/concurrent/Executor;

    .line 628
    return-void
.end method

.method public setIndexVersion(I)V
    .locals 0
    .parameter "version"

    .prologue
    .line 654
    iput p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->indexVersion:I

    .line 655
    return-void
.end method

.method public setMaxDeltaDepth(I)V
    .locals 0
    .parameter "maxDeltaDepth"

    .prologue
    .line 375
    iput p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->maxDeltaDepth:I

    .line 376
    return-void
.end method

.method public setReuseDeltas(Z)V
    .locals 0
    .parameter "reuseDeltas"

    .prologue
    .line 257
    iput-boolean p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseDeltas:Z

    .line 258
    return-void
.end method

.method public setReuseObjects(Z)V
    .locals 0
    .parameter "reuseObjects"

    .prologue
    .line 286
    iput-boolean p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->reuseObjects:Z

    .line 287
    return-void
.end method

.method public setThreads(I)V
    .locals 0
    .parameter "threads"

    .prologue
    .line 606
    iput p1, p0, Lorg/eclipse/jgit/storage/pack/PackConfig;->threads:I

    .line 607
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 724
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 725
    .local v0, b:Ljava/lang/StringBuilder;
    const-string v1, "maxDeltaDepth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getMaxDeltaDepth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 726
    const-string v1, ", deltaSearchWindowSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchWindowSize()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 727
    const-string v1, ", deltaSearchMemoryLimit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchMemoryLimit()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 728
    const-string v1, ", deltaCacheSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaCacheSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 729
    const-string v1, ", deltaCacheLimit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaCacheLimit()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 730
    const-string v1, ", compressionLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getCompressionLevel()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 731
    const-string v1, ", indexVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getIndexVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 732
    const-string v1, ", bigFileThreshold="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getBigFileThreshold()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 733
    const-string v1, ", threads="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getThreads()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 734
    const-string v1, ", reuseDeltas="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseDeltas()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 735
    const-string v1, ", reuseObjects="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseObjects()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 736
    const-string v1, ", deltaCompress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isDeltaCompress()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 737
    const-string v1, ", buildBitmaps="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isBuildBitmaps()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 738
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
