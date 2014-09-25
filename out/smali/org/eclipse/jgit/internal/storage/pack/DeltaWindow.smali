.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
.super Ljava/lang/Object;
.source "DeltaWindow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;,
        Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;
    }
.end annotation


# static fields
.field private static final NEXT_RES:Z = false

.field private static final NEXT_SRC:Z = true


# instance fields
.field private bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

.field private final bytesPerUnit:J

.field private bytesProcessed:J

.field private final config:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field private cur:I

.field private deflater:Ljava/util/zip/Deflater;

.field private deltaBuf:Ljava/lang/Object;

.field private final deltaCache:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

.field private deltaLen:I

.field private end:I

.field private loaded:J

.field private final maxDepth:I

.field private final maxMemory:J

.field private final monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

.field private final toSearch:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ProgressMonitor;J[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V
    .locals 4
    .parameter "pc"
    .parameter "dc"
    .parameter "or"
    .parameter "pm"
    .parameter "bpu"
    .parameter "in"
    .parameter "beginIndex"
    .parameter "endIndex"

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 100
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaCache:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    .line 101
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 102
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 103
    iput-wide p5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesPerUnit:J

    .line 104
    iput-object p7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->toSearch:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 105
    iput p8, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I

    .line 106
    iput p9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->end:I

    .line 108
    const-wide/16 v0, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v2}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchMemoryLimit()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getMaxDeltaDepth()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxDepth:I

    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchWindowSize()I

    move-result v0

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->createWindow(I)Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 111
    return-void
.end method

.method private buffer(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)[B
    .locals 5
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 404
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->buffer:[B

    .line 405
    .local v0, buf:[B
    if-nez v0, :cond_1

    .line 406
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->size()I

    move-result v1

    int-to-long v1, v1

    invoke-direct {p0, p1, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->checkLoadable(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;J)V

    .line 408
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v3, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-static {v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->buffer(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)[B

    move-result-object v0

    .line 409
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 410
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    array-length v3, v0

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    .line 411
    :cond_0
    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->buffer:[B

    .line 413
    :cond_1
    return-object v0
.end method

.method private cacheDelta(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 7
    .parameter "srcObj"
    .parameter "resObj"

    .prologue
    .line 351
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaCache:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    invoke-virtual {v4, v5, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->canCache(ILorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 353
    :try_start_0
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflateBound(I)I

    move-result v4

    new-array v2, v4, [B

    .line 354
    .local v2, zbuf:[B
    new-instance v3, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater()Ljava/util/zip/Deflater;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;-><init>(Ljava/util/zip/Deflater;[B)V

    .line 355
    .local v3, zs:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    instance-of v4, v4, [B

    if-eqz v4, :cond_1

    .line 356
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    check-cast v4, [B

    check-cast v4, [B

    const/4 v5, 0x0

    iget v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    invoke-virtual {v3, v4, v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->write([BII)V

    .line 359
    :goto_0
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    .line 360
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->finish()I

    move-result v1

    .line 362
    .local v1, len:I
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaCache:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    invoke-virtual {v4, v2, v1, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->cache([BII)Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    move-result-object v4

    invoke-virtual {p2, v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setCachedDelta(Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;)V

    .line 363
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    invoke-virtual {p2, v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setCachedSize(I)V

    .line 370
    .end local v1           #len:I
    .end local v2           #zbuf:[B
    .end local v3           #zs:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;
    :cond_0
    :goto_1
    return-void

    .line 358
    .restart local v2       #zbuf:[B
    .restart local v3       #zs:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    check-cast v4, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 364
    .end local v2           #zbuf:[B
    .end local v3           #zs:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;
    :catch_0
    move-exception v0

    .line 365
    .local v0, err:Ljava/io/IOException;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaCache:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->credit(I)V

    goto :goto_1

    .line 366
    .end local v0           #err:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 367
    .local v0, err:Ljava/lang/OutOfMemoryError;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaCache:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->credit(I)V

    goto :goto_1
.end method

.method private checkLoadable(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;J)V
    .locals 6
    .parameter "ent"
    .parameter "need"

    .prologue
    .line 417
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 427
    :cond_0
    return-void

    .line 420
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v0, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 421
    .local v0, n:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    :goto_0
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    add-long/2addr v3, p2

    cmp-long v1, v1, v3

    if-gez v1, :cond_0

    .line 422
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->clear(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)V

    .line 423
    if-ne v0, p1, :cond_2

    .line 424
    new-instance v1, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    add-long/2addr v4, p2

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;-><init>(JJ)V

    throw v1

    .line 421
    :cond_2
    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    goto :goto_0
.end method

.method private clear(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)V
    .locals 4
    .parameter "ent"

    .prologue
    .line 198
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->index:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

    if-eqz v0, :cond_1

    .line 199
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    iget-object v2, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->index:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->getIndexSize()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    .line 202
    :cond_0
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->set(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 203
    return-void

    .line 200
    :cond_1
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->buffer:[B

    if-eqz v0, :cond_0

    .line 201
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    iget-object v2, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->buffer:[B

    array-length v2, v2

    int-to-long v2, v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    goto :goto_0
.end method

.method private static deflateBound(I)I
    .locals 2
    .parameter "insz"

    .prologue
    .line 373
    add-int/lit8 v0, p0, 0x7

    shr-int/lit8 v0, v0, 0x3

    add-int/2addr v0, p0

    add-int/lit8 v1, p0, 0x3f

    shr-int/lit8 v1, v1, 0x6

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0xb

    return v0
.end method

.method private deflater()Ljava/util/zip/Deflater;
    .locals 2

    .prologue
    .line 430
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    if-nez v0, :cond_0

    .line 431
    new-instance v0, Ljava/util/zip/Deflater;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getCompressionLevel()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/zip/Deflater;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    .line 434
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    return-object v0

    .line 433
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    goto :goto_0
.end method

.method private delta(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)Z
    .locals 10
    .parameter "src"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 262
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->type()I

    move-result v8

    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-virtual {v9}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->type()I

    move-result v9

    if-eq v8, v9, :cond_0

    .line 263
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->keepInWindow()V

    .line 308
    :goto_0
    return v6

    .line 268
    :cond_0
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->size()I

    move-result v8

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->size()I

    move-result v9

    ushr-int/lit8 v9, v9, 0x4

    if-ge v8, v9, :cond_1

    move v6, v7

    .line 269
    goto :goto_0

    .line 271
    :cond_1
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaSizeLimit(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)I

    move-result v1

    .line 272
    .local v1, msz:I
    const/16 v8, 0x8

    if-gt v1, v8, :cond_2

    move v6, v7

    .line 273
    goto :goto_0

    .line 276
    :cond_2
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->size()I

    move-result v8

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->size()I

    move-result v9

    sub-int/2addr v8, v9

    if-le v8, v1, :cond_3

    move v6, v7

    .line 277
    goto :goto_0

    .line 281
    :cond_3
    :try_start_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->index(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/LargeObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 293
    .local v4, srcIndex:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    :try_start_1
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-direct {p0, v8}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->buffer(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)[B
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/LargeObjectException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v3

    .line 300
    .local v3, resBuf:[B
    const/16 v6, 0x2000

    if-gt v1, v6, :cond_6

    :try_start_2
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;-><init>(I)V

    .line 303
    .local v0, delta:Ljava/io/OutputStream;
    :goto_1
    invoke-virtual {v4, v0, v3, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->encode(Ljava/io/OutputStream;[BI)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 304
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->selectDeltaBase(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .end local v0           #delta:Ljava/io/OutputStream;
    :cond_4
    :goto_2
    move v6, v7

    .line 308
    goto :goto_0

    .line 282
    .end local v3           #resBuf:[B
    .end local v4           #srcIndex:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    :catch_0
    move-exception v5

    .local v5, tooBig:Lorg/eclipse/jgit/errors/LargeObjectException;
    move v6, v7

    .line 284
    goto :goto_0

    .line 285
    .end local v5           #tooBig:Lorg/eclipse/jgit/errors/LargeObjectException;
    :catch_1
    move-exception v2

    .line 286
    .local v2, notAvailable:Ljava/io/IOException;
    iget-object v6, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v6

    if-eqz v6, :cond_5

    move v6, v7

    .line 287
    goto :goto_0

    .line 288
    :cond_5
    throw v2

    .line 294
    .end local v2           #notAvailable:Ljava/io/IOException;
    .restart local v4       #srcIndex:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    :catch_2
    move-exception v5

    .line 296
    .restart local v5       #tooBig:Lorg/eclipse/jgit/errors/LargeObjectException;
    goto :goto_0

    .line 300
    .end local v5           #tooBig:Lorg/eclipse/jgit/errors/LargeObjectException;
    .restart local v3       #resBuf:[B
    :cond_6
    :try_start_3
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;-><init>(I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 305
    :catch_3
    move-exception v6

    goto :goto_2
.end method

.method private deltaSizeLimit(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)I
    .locals 4
    .parameter "src"

    .prologue
    .line 326
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    if-nez v2, :cond_0

    .line 329
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->size()I

    move-result v2

    ushr-int/lit8 v1, v2, 0x1

    .line 334
    .local v1, n:I
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxDepth:I

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->depth()I

    move-result v3

    sub-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxDepth:I

    div-int/2addr v2, v3

    .line 347
    :goto_0
    return v2

    .line 339
    .end local v1           #n:I
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->depth()I

    move-result v0

    .line 340
    .local v0, d:I
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    .line 347
    .restart local v1       #n:I
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxDepth:I

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->depth()I

    move-result v3

    sub-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxDepth:I

    sub-int/2addr v3, v0

    div-int/2addr v2, v3

    goto :goto_0
.end method

.method private static estimateIndexSize(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)J
    .locals 5
    .parameter "ent"

    .prologue
    .line 190
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->buffer:[B

    if-nez v1, :cond_0

    .line 191
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->estimateSize(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)J

    move-result-wide v1

    .line 194
    :goto_0
    return-wide v1

    .line 193
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->buffer:[B

    array-length v0, v1

    .line 194
    .local v0, len:I
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->estimateIndexSize(I)J

    move-result-wide v1

    int-to-long v3, v0

    sub-long/2addr v1, v3

    goto :goto_0
.end method

.method private static estimateSize(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)J
    .locals 2
    .parameter "ent"

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v0

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->estimateIndexSize(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private index(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    .locals 9
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 383
    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->index:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

    .line 384
    .local v1, idx:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    if-nez v1, :cond_1

    .line 385
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->estimateIndexSize(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)J

    move-result-wide v3

    invoke-direct {p0, p1, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->checkLoadable(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;J)V

    .line 388
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

    .end local v1           #idx:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->buffer(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)[B

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 395
    .restart local v1       #idx:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    .line 396
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->getIndexSize()J

    move-result-wide v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->getSourceSize()J

    move-result-wide v7

    sub-long/2addr v5, v7

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    .line 397
    :cond_0
    iput-object v1, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->index:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

    .line 399
    :cond_1
    return-object v1

    .line 389
    .end local v1           #idx:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    :catch_0
    move-exception v2

    .line 391
    .local v2, noMemory:Ljava/lang/OutOfMemoryError;
    new-instance v0, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;-><init>(Ljava/lang/OutOfMemoryError;)V

    .line 392
    .local v0, e:Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;
    iget-object v3, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 393
    throw v0
.end method

.method private keepInWindow()V
    .locals 1

    .prologue
    .line 377
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 378
    return-void
.end method

.method private searchInWindow()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 208
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v2, v4, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .local v2, src:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    if-eq v2, v4, :cond_0

    .line 209
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->empty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 220
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    if-nez v4, :cond_3

    .line 221
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->keepInWindow()V

    .line 257
    :goto_1
    return-void

    .line 211
    :cond_1
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->delta(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 208
    iget-object v2, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->prev:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    goto :goto_0

    .line 213
    :cond_2
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 214
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    goto :goto_1

    .line 227
    :cond_3
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v3, v4, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 228
    .local v3, srcObj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v1, v4, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 229
    .local v1, resObj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 235
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 242
    :goto_2
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaDepth()I

    move-result v4

    add-int/lit8 v0, v4, 0x1

    .line 243
    .local v0, depth:I
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDeltaDepth(I)V

    .line 244
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    .line 245
    invoke-direct {p0, v3, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cacheDelta(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 247
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxDepth:I

    if-ge v0, v4, :cond_4

    .line 251
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->makeNext(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)V

    .line 252
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v4, v4, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 255
    :cond_4
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 256
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    goto :goto_1

    .line 239
    .end local v0           #depth:I
    :cond_5
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_2
.end method

.method private selectDeltaBase(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;Ljava/io/OutputStream;)V
    .locals 4
    .parameter "src"
    .parameter "delta"

    .prologue
    .line 312
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bestBase:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 314
    instance-of v2, p2, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;

    if-eqz v2, :cond_0

    move-object v0, p2

    .line 315
    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;

    .line 316
    .local v0, a:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;
    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->buf:[B

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    .line 317
    iget v2, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    .line 323
    .end local v0           #a:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;
    :goto_0
    return-void

    :cond_0
    move-object v1, p2

    .line 319
    check-cast v1, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    .line 320
    .local v1, b:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaBuf:Ljava/lang/Object;

    .line 321
    invoke-virtual {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->length()J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deltaLen:I

    goto :goto_0
.end method


# virtual methods
.method declared-synchronized remaining()Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    .locals 9

    .prologue
    const/4 v6, 0x0

    .line 114
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->end:I

    .line 115
    .local v0, e:I
    iget v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-int v7, v0, v7

    ushr-int/lit8 v2, v7, 0x1

    .line 116
    .local v2, halfRemaining:I
    if-nez v2, :cond_1

    .line 136
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v6

    .line 119
    :cond_1
    sub-int v5, v0, v2

    .line 120
    .local v5, split:I
    :try_start_1
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->toSearch:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v7, v7, v5

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v1

    .line 123
    .local v1, h:I
    add-int/lit8 v3, v5, 0x1

    .local v3, n:I
    :goto_1
    if-ge v3, v0, :cond_3

    .line 124
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->toSearch:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v7, v7, v3

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v7

    if-eq v1, v7, :cond_2

    .line 125
    new-instance v6, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    invoke-direct {v6, v3, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;-><init>(II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 114
    .end local v0           #e:I
    .end local v1           #h:I
    .end local v2           #halfRemaining:I
    .end local v3           #n:I
    .end local v5           #split:I
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 123
    .restart local v0       #e:I
    .restart local v1       #h:I
    .restart local v2       #halfRemaining:I
    .restart local v3       #n:I
    .restart local v5       #split:I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 128
    :cond_3
    :try_start_2
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->toSearch:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    iget v8, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v7

    if-eq v1, v7, :cond_0

    .line 131
    add-int/lit8 v4, v5, -0x1

    .local v4, p:I
    :goto_2
    iget v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I

    if-ge v7, v4, :cond_0

    .line 132
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->toSearch:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    aget-object v7, v7, v4

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v7

    if-eq v1, v7, :cond_4

    .line 133
    new-instance v6, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    add-int/lit8 v7, v4, 0x1

    invoke-direct {v6, v7, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;-><init>(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 131
    :cond_4
    add-int/lit8 v4, v4, -0x1

    goto :goto_2
.end method

.method search()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    :goto_0
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 151
    :try_start_1
    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->end:I

    iget v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I

    if-gt v5, v6, :cond_1

    .line 152
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 180
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    if-eqz v5, :cond_0

    .line 181
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v5}, Ljava/util/zip/Deflater;->end()V

    .line 183
    :cond_0
    return-void

    .line 153
    :cond_1
    :try_start_2
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->toSearch:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    iget v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I

    aget-object v4, v5, v6

    .line 154
    .local v4, next:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 155
    :try_start_3
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_3

    .line 156
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->clear(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)V

    .line 157
    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->estimateSize(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)J

    move-result-wide v2

    .line 158
    .local v2, need:J
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v1, v5, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    .line 159
    .local v1, n:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    :goto_1
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->maxMemory:J

    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->loaded:J

    add-long/2addr v7, v2

    cmp-long v5, v5, v7

    if-gez v5, :cond_3

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    if-eq v1, v5, :cond_3

    .line 160
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->clear(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;)V

    .line 159
    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->next:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    .line 154
    .end local v1           #n:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;
    .end local v2           #need:J
    .end local v4           #next:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :catchall_0
    move-exception v5

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 180
    :catchall_1
    move-exception v5

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    if-eqz v6, :cond_2

    .line 181
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->end()V

    :cond_2
    throw v5

    .line 162
    .restart local v4       #next:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_3
    :try_start_6
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->set(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 164
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v5, v5, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->res:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;

    iget-object v5, v5, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindowEntry;->object:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->doNotAttemptDelta()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 168
    :cond_4
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->keepInWindow()V

    goto :goto_0

    .line 171
    :cond_5
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesPerUnit:J

    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesProcessed:J

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v9

    int-to-long v9, v9

    add-long/2addr v7, v9

    iput-wide v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesProcessed:J

    cmp-long v5, v5, v7

    if-gtz v5, :cond_6

    .line 172
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesProcessed:J

    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesPerUnit:J

    div-long/2addr v5, v7

    long-to-int v0, v5

    .line 173
    .local v0, d:I
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v5, v0}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 174
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesProcessed:J

    int-to-long v7, v0

    iget-wide v9, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesPerUnit:J

    mul-long/2addr v7, v9

    sub-long/2addr v5, v7

    iput-wide v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->bytesProcessed:J

    .line 176
    .end local v0           #d:I
    :cond_6
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->searchInWindow()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto/16 :goto_0
.end method

.method declared-synchronized tryStealWork(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)Z
    .locals 2
    .parameter "s"

    .prologue
    .line 140
    monitor-enter p0

    :try_start_0
    iget v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->cur:I

    if-le v0, v1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->end:I

    iget v1, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gt v0, v1, :cond_1

    .line 141
    :cond_0
    const/4 v0, 0x0

    .line 143
    :goto_0
    monitor-exit p0

    return v0

    .line 142
    :cond_1
    :try_start_1
    iget v0, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->end:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    const/4 v0, 0x1

    goto :goto_0

    .line 140
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
