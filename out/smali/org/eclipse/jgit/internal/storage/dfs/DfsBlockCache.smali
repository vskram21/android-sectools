.class public final Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
.super Ljava/lang/Object;
.source "DfsBlockCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;,
        Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    }
.end annotation


# static fields
.field private static volatile cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;


# instance fields
.field private final blockSize:I

.field private final blockSizeShift:I

.field private clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

.field private final clockLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private volatile liveBytes:J

.field private final loadLocks:[Ljava/util/concurrent/locks/ReentrantLock;

.field private final maxBytes:J

.field private final packCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            ">;"
        }
    .end annotation
.end field

.field private final packFiles:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            ">;"
        }
    .end annotation
.end field

.field private volatile statEvict:J

.field private final statHit:Ljava/util/concurrent/atomic/AtomicLong;

.field private final statMiss:Ljava/util/concurrent/atomic/AtomicLong;

.field private final table:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final tableSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 95
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;-><init>()V

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->reconfigure(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;)V

    .line 96
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;)V
    .locals 9
    .parameter "cfg"

    .prologue
    const/4 v8, 0x1

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize:I

    .line 177
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize:I

    if-ge v0, v8, :cond_0

    .line 178
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->tSizeMustBeGreaterOrEqual1:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize:I

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 181
    const/16 v0, 0x20

    new-array v0, v0, [Ljava/util/concurrent/locks/ReentrantLock;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->loadLocks:[Ljava/util/concurrent/locks/ReentrantLock;

    .line 182
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->loadLocks:[Ljava/util/concurrent/locks/ReentrantLock;

    array-length v0, v0

    if-ge v7, v0, :cond_1

    .line 183
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->loadLocks:[Ljava/util/concurrent/locks/ReentrantLock;

    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1, v8}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    aput-object v1, v0, v7

    .line 182
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 185
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize:I

    int-to-double v0, v0

    const-wide v2, 0x3fb999999999999aL

    mul-double/2addr v0, v2

    double-to-int v6, v0

    .line 186
    .local v6, eb:I
    const/16 v0, 0x40

    if-ge v0, v6, :cond_4

    .line 187
    const/16 v6, 0x40

    .line 190
    :cond_2
    :goto_1
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize:I

    if-ge v0, v6, :cond_3

    .line 191
    iget v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize:I

    .line 193
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->getBlockLimit()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->maxBytes:J

    .line 194
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->getBlockSize()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    .line 195
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    invoke-static {v0}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSizeShift:I

    .line 197
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0, v8}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 198
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-direct {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;-><init>()V

    const-wide/16 v2, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 199
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    iput-object v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 201
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0x10

    const/high16 v2, 0x3f40

    invoke-direct {v0, v1, v2, v8}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    .line 203
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packFiles:Ljava/util/Collection;

    .line 205
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statHit:Ljava/util/concurrent/atomic/AtomicLong;

    .line 206
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statMiss:Ljava/util/concurrent/atomic/AtomicLong;

    .line 207
    return-void

    .line 188
    :cond_4
    const/4 v0, 0x4

    if-ge v6, v0, :cond_2

    .line 189
    const/4 v6, 0x4

    goto :goto_1
.end method

.method private addToClock(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;I)V
    .locals 5
    .parameter "ref"
    .parameter "credit"

    .prologue
    .line 420
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 422
    if-eqz p2, :cond_0

    .line 423
    :try_start_0
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->liveBytes:J

    int-to-long v3, p2

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->liveBytes:J

    .line 424
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 425
    .local v0, ptr:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    iput-object v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 426
    iput-object p1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 427
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 429
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 431
    return-void

    .line 429
    .end local v0           #ptr:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method

.method private static clean(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    .locals 3
    .parameter "top"

    .prologue
    .line 517
    :goto_0
    if-eqz p0, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    if-nez v1, :cond_0

    .line 518
    iget-object p0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    goto :goto_0

    .line 519
    :cond_0
    if-nez p0, :cond_2

    .line 520
    const/4 p0, 0x0

    .line 522
    .end local p0
    .local v0, n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :cond_1
    :goto_1
    return-object p0

    .line 521
    .end local v0           #n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    .restart local p0
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clean(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    move-result-object v0

    .line 522
    .restart local v0       #n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    if-eq v0, v1, :cond_1

    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    invoke-direct {v1, v0, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;)V

    move-object p0, v1

    goto :goto_1
.end method

.method private creditSpace(I)V
    .locals 4
    .parameter "credit"

    .prologue
    .line 414
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 415
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->liveBytes:J

    int-to-long v2, p1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->liveBytes:J

    .line 416
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 417
    return-void
.end method

.method public static getInstance()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    .locals 1

    .prologue
    .line 123
    sget-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    return-object v0
.end method

.method private hash(IJ)I
    .locals 2
    .parameter "packHash"
    .parameter "off"

    .prologue
    .line 280
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSizeShift:I

    ushr-long v0, p2, v0

    long-to-int v0, v0

    add-int/2addr v0, p1

    return v0
.end method

.method private lockFor(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 3
    .parameter "pack"
    .parameter "position"

    .prologue
    .line 513
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->loadLocks:[Ljava/util/concurrent/locks/ReentrantLock;

    iget v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->hash:I

    invoke-direct {p0, v1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->hash(IJ)I

    move-result v1

    ushr-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->loadLocks:[Ljava/util/concurrent/locks/ReentrantLock;

    array-length v2, v2

    rem-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static reconfigure(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;)V
    .locals 7
    .parameter "cfg"

    .prologue
    .line 111
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;)V

    .line 112
    .local v1, nc:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    sget-object v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 113
    .local v2, oc:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    sput-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 115
    if-eqz v2, :cond_0

    .line 116
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getPackFiles()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 117
    .local v3, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    iget-object v4, v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    iget-object v4, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->cachedSize:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v5, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    goto :goto_0

    .line 119
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v3           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_0
    return-void
.end method

.method private reserveSpace(I)V
    .locals 9
    .parameter "reserve"

    .prologue
    .line 377
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 379
    :try_start_0
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->liveBytes:J

    int-to-long v7, p1

    add-long v2, v5, v7

    .line 380
    .local v2, live:J
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->maxBytes:J

    cmp-long v5, v5, v2

    if-gez v5, :cond_2

    .line 381
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 382
    .local v4, prev:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    iget-object v1, v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 384
    .local v1, hand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    :cond_0
    iget-boolean v5, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->hot:Z

    if-eqz v5, :cond_3

    .line 387
    const/4 v5, 0x0

    iput-boolean v5, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->hot:Z

    .line 388
    move-object v4, v1

    .line 389
    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 404
    :goto_0
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->maxBytes:J

    cmp-long v5, v5, v2

    if-ltz v5, :cond_0

    .line 405
    :cond_1
    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockHand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 407
    .end local v1           #hand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .end local v4           #prev:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    :cond_2
    iput-wide v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->liveBytes:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 409
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 411
    return-void

    .line 391
    .restart local v1       #hand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .restart local v4       #prev:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    :cond_3
    if-eq v4, v1, :cond_1

    .line 396
    move-object v0, v1

    .line 397
    .local v0, dead:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    :try_start_1
    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 398
    iput-object v1, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 399
    const/4 v5, 0x0

    iput-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 400
    const/4 v5, 0x0

    iput-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->value:Ljava/lang/Object;

    .line 401
    iget v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->size:I

    int-to-long v5, v5

    sub-long/2addr v2, v5

    .line 402
    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    iget-object v5, v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->cachedSize:Ljava/util/concurrent/atomic/AtomicLong;

    iget v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->size:I

    neg-int v6, v6

    int-to-long v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 403
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statEvict:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statEvict:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 409
    .end local v0           #dead:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .end local v1           #hand:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .end local v2           #live:J
    .end local v4           #prev:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clockLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v5
.end method

.method private scan(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/lang/Object;
    .locals 2
    .parameter "n"
    .parameter "pack"
    .parameter "position"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;",
            "J)TT;"
        }
    .end annotation

    .prologue
    .line 488
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->scanRef(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    move-result-object v0

    .line 489
    .local v0, r:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private scanRef(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .locals 4
    .parameter "n"
    .parameter "pack"
    .parameter "position"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;",
            "J)",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref",
            "<TT;>;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 494
    :goto_0
    if-eqz p1, :cond_2

    .line 495
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 496
    .local v0, r:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    if-ne v2, p2, :cond_1

    iget-wide v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->position:J

    cmp-long v2, v2, p3

    if-nez v2, :cond_1

    .line 497
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 499
    .end local v0           #r:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :goto_1
    return-object v0

    .restart local v0       #r:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :cond_0
    move-object v0, v1

    .line 497
    goto :goto_1

    .line 494
    :cond_1
    iget-object p1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    goto :goto_0

    .end local v0           #r:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :cond_2
    move-object v0, v1

    .line 499
    goto :goto_1
.end method

.method private slot(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)I
    .locals 2
    .parameter "pack"
    .parameter "position"

    .prologue
    .line 509
    iget v0, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->hash:I

    invoke-direct {p0, v0, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->hash(IJ)I

    move-result v0

    ushr-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->tableSize:I

    rem-int/2addr v0, v1

    return v0
.end method

.method private static tableSize(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;)I
    .locals 7
    .parameter "cfg"

    .prologue
    .line 288
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->getBlockSize()I

    move-result v2

    .line 289
    .local v2, wsz:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->getBlockLimit()J

    move-result-wide v0

    .line 290
    .local v0, limit:J
    if-gtz v2, :cond_0

    .line 291
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->invalidWindowSize:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 292
    :cond_0
    int-to-long v3, v2

    cmp-long v3, v0, v3

    if-gez v3, :cond_1

    .line 293
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->windowSizeMustBeLesserThanLimit:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 294
    :cond_1
    const-wide/16 v3, 0x5

    int-to-long v5, v2

    div-long v5, v0, v5

    mul-long/2addr v3, v5

    const-wide/16 v5, 0x2

    div-long/2addr v3, v5

    const-wide/32 v5, 0x7fffffff

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    return v3
.end method


# virtual methods
.method contains(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Z
    .locals 2
    .parameter "key"
    .parameter "position"

    .prologue
    .line 474
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->slot(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->scan(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method get(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/lang/Object;
    .locals 3
    .parameter "key"
    .parameter "position"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;",
            "J)TT;"
        }
    .end annotation

    .prologue
    .line 479
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->slot(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    invoke-direct {p0, v1, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->scan(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/lang/Object;

    move-result-object v0

    .line 480
    .local v0, val:Ljava/lang/Object;,"TT;"
    if-nez v0, :cond_0

    .line 481
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statMiss:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 484
    :goto_0
    return-object v0

    .line 483
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statHit:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    goto :goto_0
.end method

.method getBlockSize()I
    .locals 1

    .prologue
    .line 284
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    return v0
.end method

.method public getCurrentSize()J
    .locals 2

    .prologue
    .line 211
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->liveBytes:J

    return-wide v0
.end method

.method public getEvictions()J
    .locals 2

    .prologue
    .line 246
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statEvict:J

    return-wide v0
.end method

.method public getFillPercentage()J
    .locals 4

    .prologue
    .line 216
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getCurrentSize()J

    move-result-wide v0

    const-wide/16 v2, 0x64

    mul-long/2addr v0, v2

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->maxBytes:J

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getHitCount()J
    .locals 2

    .prologue
    .line 221
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statHit:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getHitRatio()J
    .locals 9

    .prologue
    const-wide/16 v6, 0x0

    .line 236
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statHit:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 237
    .local v0, hits:J
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statMiss:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    .line 238
    .local v2, miss:J
    add-long v4, v0, v2

    .line 239
    .local v4, total:J
    cmp-long v8, v4, v6

    if-nez v8, :cond_0

    .line 241
    :goto_0
    return-wide v6

    :cond_0
    const-wide/16 v6, 0x64

    mul-long/2addr v6, v0

    div-long/2addr v6, v4

    goto :goto_0
.end method

.method public getMissCount()J
    .locals 2

    .prologue
    .line 226
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statMiss:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method getOrCreate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .locals 4
    .parameter "dsc"
    .parameter "key"

    .prologue
    .line 263
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    monitor-enter v3

    .line 264
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 265
    .local v1, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    const/4 v1, 0x0

    .line 269
    :cond_0
    if-nez v1, :cond_2

    .line 270
    if-nez p2, :cond_1

    .line 271
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;-><init>()V

    .end local p2
    .local v0, key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;
    move-object p2, v0

    .line 272
    .end local v0           #key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;
    .restart local p2
    :cond_1
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .end local v1           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-direct {v1, p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;)V

    .line 273
    .restart local v1       #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    :cond_2
    monitor-exit v3

    return-object v1

    .line 276
    .end local v1           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method getOrLoad(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    .locals 17
    .parameter "pack"
    .parameter "position"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    move-wide/from16 v14, p2

    .line 313
    .local v14, requestedPosition:J
    invoke-virtual/range {p1 .. p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->alignToBlock(J)J

    move-result-wide p2

    .line 315
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 316
    .local v4, key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->slot(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)I

    move-result v16

    .line 317
    .local v16, slot:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    .line 318
    .local v10, e1:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-direct {v0, v10, v4, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->scan(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 319
    .local v8, v:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    if-eqz v8, :cond_0

    .line 320
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statHit:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-object v5, v8

    .line 372
    :goto_0
    return-object v5

    .line 324
    :cond_0
    move-object/from16 v0, p0

    iget v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->reserveSpace(I)V

    .line 325
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->lockFor(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v13

    .line 326
    .local v13, regionLock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v13}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 328
    :try_start_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    .line 329
    .local v11, e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    if-eq v11, v10, :cond_1

    .line 330
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-direct {v0, v11, v4, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->scan(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-object v8, v0

    .line 331
    if-eqz v8, :cond_1

    .line 332
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statHit:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 333
    move-object/from16 v0, p0

    iget v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->creditSpace(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 365
    invoke-virtual {v13}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move-object v5, v8

    goto :goto_0

    .line 338
    :cond_1
    :try_start_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->statMiss:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 339
    const/4 v9, 0x1

    .line 341
    .local v9, credit:Z
    :try_start_2
    invoke-virtual/range {p1 .. p4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readOneBlock(JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v8

    .line 342
    const/4 v9, 0x0

    .line 344
    if-eqz v9, :cond_2

    .line 345
    :try_start_3
    move-object/from16 v0, p0

    iget v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->creditSpace(I)V

    .line 347
    :cond_2
    iget-wide v5, v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    cmp-long v5, p2, v5

    if-eqz v5, :cond_3

    .line 349
    iget-wide v0, v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    move-wide/from16 p2, v0

    .line 350
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->slot(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)I

    move-result v16

    .line 351
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11           #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    check-cast v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    .line 354
    .restart local v11       #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :cond_3
    iget-object v5, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->cachedSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->size()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 355
    new-instance v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->size()I

    move-result v7

    move-wide/from16 v5, p2

    invoke-direct/range {v3 .. v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)V

    .line 356
    .local v3, ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;>;"
    const/4 v5, 0x1

    iput-boolean v5, v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->hot:Z

    .line 358
    :goto_1
    new-instance v12, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    invoke-static {v11}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clean(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    move-result-object v5

    invoke-direct {v12, v5, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;)V

    .line 359
    .local v12, n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move/from16 v0, v16

    invoke-virtual {v5, v0, v11, v12}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 363
    move-object/from16 v0, p0

    iget v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->size()I

    move-result v6

    sub-int/2addr v5, v6

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->addToClock(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 365
    invoke-virtual {v13}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 370
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-virtual {v8, v5, v14, v15}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->contains(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Z

    move-result v5

    if-eqz v5, :cond_6

    move-object v5, v8

    .line 371
    goto/16 :goto_0

    .line 344
    .end local v3           #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;>;"
    .end local v12           #n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :catchall_0
    move-exception v5

    if-eqz v9, :cond_4

    .line 345
    :try_start_4
    move-object/from16 v0, p0

    iget v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->blockSize:I

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->creditSpace(I)V

    :cond_4
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 365
    .end local v9           #credit:Z
    .end local v11           #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :catchall_1
    move-exception v5

    invoke-virtual {v13}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v5

    .line 361
    .restart local v3       #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;>;"
    .restart local v9       #credit:Z
    .restart local v11       #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    .restart local v12       #n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :cond_5
    :try_start_5
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11           #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    check-cast v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 362
    .restart local v11       #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    goto :goto_1

    .line 372
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v14, v15, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getOrLoad(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-result-object v5

    goto/16 :goto_0
.end method

.method public getPackFiles()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 256
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packFiles:Ljava/util/Collection;

    return-object v0
.end method

.method public getTotalRequestCount()J
    .locals 4

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getHitCount()J

    move-result-wide v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getMissCount()J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method put(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .locals 14
    .parameter "key"
    .parameter "pos"
    .parameter "size"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;",
            "JITT;)",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 438
    .local p5, v:Ljava/lang/Object;,"TT;"
    invoke-direct/range {p0 .. p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->slot(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)I

    move-result v13

    .line 439
    .local v13, slot:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v3, v13}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    .line 440
    .local v8, e1:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    move-wide/from16 v0, p2

    invoke-direct {p0, v8, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->scanRef(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    move-result-object v2

    .line 441
    .local v2, ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    if-eqz v2, :cond_0

    move-object v11, v2

    .line 470
    .end local v2           #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    .local v11, ref:Ljava/lang/Object;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :goto_0
    return-object v11

    .line 444
    .end local v11           #ref:Ljava/lang/Object;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    .restart local v2       #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :cond_0
    move/from16 v0, p4

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->reserveSpace(I)V

    .line 445
    invoke-direct/range {p0 .. p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->lockFor(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v12

    .line 446
    .local v12, regionLock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v12}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 448
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v3, v13}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    .line 449
    .local v9, e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    if-eq v9, v8, :cond_1

    .line 450
    move-wide/from16 v0, p2

    invoke-direct {p0, v9, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->scanRef(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    move-result-object v2

    .line 451
    if-eqz v2, :cond_1

    .line 452
    move/from16 v0, p4

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->creditSpace(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 468
    invoke-virtual {v12}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move-object v11, v2

    .restart local v11       #ref:Ljava/lang/Object;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    goto :goto_0

    .end local v11           #ref:Ljava/lang/Object;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :cond_1
    move-object v11, v2

    .line 457
    .end local v2           #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    .local v11, ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :try_start_1
    iget-object v3, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->cachedSize:Ljava/util/concurrent/atomic/AtomicLong;

    move/from16 v0, p4

    int-to-long v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 458
    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    move-object v3, p1

    move-wide/from16 v4, p2

    move/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v2 .. v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 459
    .end local v11           #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    .restart local v2       #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    const/4 v3, 0x1

    :try_start_2
    iput-boolean v3, v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->hot:Z

    .line 461
    :goto_1
    new-instance v10, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->clean(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    move-result-object v3

    invoke-direct {v10, v3, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;)V

    .line 462
    .local v10, n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v3, v13, v9, v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 466
    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->addToClock(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 468
    invoke-virtual {v12}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move-object v11, v2

    .line 470
    .local v11, ref:Ljava/lang/Object;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    goto :goto_0

    .line 464
    .end local v11           #ref:Ljava/lang/Object;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :cond_2
    :try_start_3
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v3, v13}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9           #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    check-cast v9, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 465
    .restart local v9       #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    goto :goto_1

    .line 468
    .end local v9           #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    .end local v10           #n:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    :catchall_0
    move-exception v3

    :goto_2
    invoke-virtual {v12}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v3

    .end local v2           #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    .restart local v9       #e2:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
    .local v11, ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    :catchall_1
    move-exception v3

    move-object v2, v11

    .end local v11           #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    .restart local v2       #ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    goto :goto_2
.end method

.method put(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;)V
    .locals 6
    .parameter "v"

    .prologue
    .line 434
    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    iget-wide v2, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->size()I

    move-result v4

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 435
    return-void
.end method

.method remove(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V
    .locals 3
    .parameter "pack"

    .prologue
    .line 503
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    monitor-enter v1

    .line 504
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->packCache:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    monitor-exit v1

    .line 506
    return-void

    .line 505
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
