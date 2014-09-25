.class public Lorg/eclipse/jgit/internal/storage/file/WindowCache;
.super Ljava/lang/Object;
.source "WindowCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/WindowCache$1;,
        Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;,
        Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;,
        Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    }
.end annotation


# static fields
.field private static volatile cache:Lorg/eclipse/jgit/internal/storage/file/WindowCache;

.field private static final rng:Ljava/util/Random;

.field private static volatile streamFileThreshold:I


# instance fields
.field private final clock:Ljava/util/concurrent/atomic/AtomicLong;

.field private final evictBatch:I

.field private final evictLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final locks:[Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

.field private final maxBytes:J

.field private final maxFiles:I

.field private final mmap:Z

.field private final openBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private final openFiles:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final queue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/ByteWindow;",
            ">;"
        }
    .end annotation
.end field

.field private final table:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final tableSize:I

.field private final windowSize:I

.field private final windowSizeShift:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 133
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->rng:Ljava/util/Random;

    .line 140
    new-instance v0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;

    invoke-direct {v0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;-><init>()V

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->reconfigure(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V

    .line 141
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V
    .locals 8
    .parameter "cfg"

    .prologue
    const/4 v7, 0x1

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    .line 232
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->lockCount(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)I

    move-result v2

    .line 233
    .local v2, lockCount:I
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    if-ge v3, v7, :cond_0

    .line 234
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->tSizeMustBeGreaterOrEqual1:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 235
    :cond_0
    if-ge v2, v7, :cond_1

    .line 236
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->lockCountMustBeGreaterOrEqual1:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 238
    :cond_1
    new-instance v3, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v3}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 239
    new-instance v3, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v4, 0x1

    invoke-direct {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clock:Ljava/util/concurrent/atomic/AtomicLong;

    .line 240
    new-instance v3, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    iget v4, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 241
    new-array v3, v2, [Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->locks:[Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    .line 242
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->locks:[Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 243
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->locks:[Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    new-instance v4, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;-><init>(Lorg/eclipse/jgit/internal/storage/file/WindowCache$1;)V

    aput-object v4, v3, v1

    .line 242
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 244
    :cond_2
    new-instance v3, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v3}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->evictLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 246
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    int-to-double v3, v3

    const-wide v5, 0x3fb999999999999aL

    mul-double/2addr v3, v5

    double-to-int v0, v3

    .line 247
    .local v0, eb:I
    const/16 v3, 0x40

    if-ge v3, v0, :cond_5

    .line 248
    const/16 v0, 0x40

    .line 251
    :cond_3
    :goto_1
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    if-ge v3, v0, :cond_4

    .line 252
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    .line 253
    :cond_4
    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->evictBatch:I

    .line 255
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitOpenFiles()I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->maxFiles:I

    .line 256
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitLimit()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->maxBytes:J

    .line 257
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->isPackedGitMMAP()Z

    move-result v3

    iput-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->mmap:Z

    .line 258
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitWindowSize()I

    move-result v3

    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->bits(I)I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSizeShift:I

    .line 259
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSizeShift:I

    shl-int v3, v7, v3

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSize:I

    .line 261
    new-instance v3, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openFiles:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 262
    new-instance v3, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 264
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->maxFiles:I

    if-ge v3, v7, :cond_6

    .line 265
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->openFilesMustBeAtLeast1:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 249
    :cond_5
    const/4 v3, 0x4

    if-ge v0, v3, :cond_3

    .line 250
    const/4 v0, 0x4

    goto :goto_1

    .line 266
    :cond_6
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->maxBytes:J

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSize:I

    int-to-long v5, v5

    cmp-long v3, v3, v5

    if-gez v3, :cond_7

    .line 267
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->windowSizeMustBeLesserThanLimit:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 268
    :cond_7
    return-void
.end method

.method private static final bits(I)I
    .locals 2
    .parameter "newSize"

    .prologue
    .line 126
    const/16 v0, 0x1000

    if-ge p0, v0, :cond_0

    .line 127
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidWindowSize:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->bitCount(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 129
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->windowSizeMustBePowerOf2:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v0

    return v0
.end method

.method private static clean(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .locals 3
    .parameter "top"

    .prologue
    .line 537
    :goto_0
    if-eqz p0, :cond_0

    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->dead:Z

    if-eqz v1, :cond_0

    .line 538
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->enqueue()Z

    .line 539
    iget-object p0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    goto :goto_0

    .line 541
    :cond_0
    if-nez p0, :cond_2

    .line 542
    const/4 p0, 0x0

    .line 544
    .end local p0
    .local v0, n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    :cond_1
    :goto_1
    return-object p0

    .line 543
    .end local v0           #n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .restart local p0
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clean(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    move-result-object v0

    .line 544
    .restart local v0       #n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    if-eq v0, v1, :cond_1

    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    invoke-direct {v1, v0, v2}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;-><init>(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V

    move-object p0, v1

    goto :goto_1
.end method

.method private clear(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V
    .locals 3
    .parameter "ref"

    .prologue
    .line 309
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openBytes:Ljava/util/concurrent/atomic/AtomicLong;

    iget v1, p1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->size:I

    neg-int v1, v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 310
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->close(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 311
    return-void
.end method

.method private close(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V
    .locals 1
    .parameter "pack"

    .prologue
    .line 314
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->endWindowCache()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openFiles:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 316
    :cond_0
    return-void
.end method

.method private createRef(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLorg/eclipse/jgit/internal/storage/file/ByteWindow;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    .locals 6
    .parameter "p"
    .parameter "o"
    .parameter "v"

    .prologue
    .line 303
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->queue:Ljava/lang/ref/ReferenceQueue;

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLorg/eclipse/jgit/internal/storage/file/ByteWindow;Ljava/lang/ref/ReferenceQueue;)V

    .line 304
    .local v0, ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openBytes:Ljava/util/concurrent/atomic/AtomicLong;

    iget v2, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->size:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 305
    return-object v0
.end method

.method private evict()V
    .locals 10

    .prologue
    .line 421
    :cond_0
    :goto_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->isFull()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 422
    sget-object v6, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->rng:Ljava/util/Random;

    iget v7, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    invoke-virtual {v6, v7}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    .line 423
    .local v4, ptr:I
    const/4 v3, 0x0

    .line 424
    .local v3, old:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    const/4 v5, 0x0

    .line 425
    .local v5, slot:I
    iget v6, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->evictBatch:I

    add-int/lit8 v0, v6, -0x1

    .local v0, b:I
    :goto_1
    if-ltz v0, :cond_6

    .line 426
    iget v6, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    if-gt v6, v4, :cond_1

    .line 427
    const/4 v4, 0x0

    .line 428
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v6, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .local v1, e:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    :goto_2
    if-eqz v1, :cond_5

    .line 429
    iget-boolean v6, v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->dead:Z

    if-eqz v6, :cond_3

    .line 428
    :cond_2
    :goto_3
    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    goto :goto_2

    .line 431
    :cond_3
    if-eqz v3, :cond_4

    iget-object v6, v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    iget-wide v6, v6, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->lastAccess:J

    iget-object v8, v3, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    iget-wide v8, v8, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->lastAccess:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_2

    .line 432
    :cond_4
    move-object v3, v1

    .line 433
    move v5, v4

    goto :goto_3

    .line 425
    :cond_5
    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 437
    .end local v1           #e:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    :cond_6
    if-eqz v3, :cond_0

    .line 438
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->kill()V

    .line 439
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->gc()V

    .line 440
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v6, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 441
    .local v2, e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clean(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    move-result-object v7

    invoke-virtual {v6, v5, v2, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    .line 444
    .end local v0           #b:I
    .end local v2           #e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v3           #old:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v4           #ptr:I
    .end local v5           #slot:I
    :cond_7
    return-void
.end method

.method private gc()V
    .locals 8

    .prologue
    .line 498
    :cond_0
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v5}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    .local v3, r:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    if-eqz v3, :cond_3

    .line 509
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->canClear()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 510
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clear(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V

    .line 512
    const/4 v1, 0x0

    .line 513
    .local v1, found:Z
    iget-object v5, v3, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    iget-wide v6, v3, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->position:J

    invoke-direct {p0, v5, v6, v7}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->slot(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)I

    move-result v4

    .line 514
    .local v4, s:I
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 515
    .local v0, e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    move-object v2, v0

    .local v2, n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    :goto_1
    if-eqz v2, :cond_1

    .line 516
    iget-object v5, v2, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    if-ne v5, v3, :cond_2

    .line 517
    const/4 v5, 0x1

    iput-boolean v5, v2, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->dead:Z

    .line 518
    const/4 v1, 0x1

    .line 522
    :cond_1
    if-eqz v1, :cond_0

    .line 523
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clean(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    move-result-object v6

    invoke-virtual {v5, v4, v0, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    .line 515
    :cond_2
    iget-object v2, v2, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    goto :goto_1

    .line 526
    .end local v0           #e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v1           #found:Z
    .end local v2           #n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v4           #s:I
    :cond_3
    return-void
.end method

.method static final get(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .locals 4
    .parameter "pack"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->cache:Lorg/eclipse/jgit/internal/storage/file/WindowCache;

    .line 179
    .local v0, c:Lorg/eclipse/jgit/internal/storage/file/WindowCache;
    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->toStart(J)J

    move-result-wide v2

    invoke-direct {v0, p0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->getOrLoad(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-result-object v1

    .line 180
    .local v1, r:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    sget-object v2, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->cache:Lorg/eclipse/jgit/internal/storage/file/WindowCache;

    if-eq v0, v2, :cond_0

    .line 186
    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->removeAll()V

    .line 188
    :cond_0
    return-object v1
.end method

.method static getInstance()Lorg/eclipse/jgit/internal/storage/file/WindowCache;
    .locals 1

    .prologue
    .line 173
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->cache:Lorg/eclipse/jgit/internal/storage/file/WindowCache;

    return-object v0
.end method

.method private getOrLoad(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .locals 9
    .parameter "pack"
    .parameter "position"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->slot(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)I

    move-result v4

    .line 355
    .local v4, slot:I
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v7, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 356
    .local v0, e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    invoke-direct {p0, v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->scan(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-result-object v5

    .line 357
    .local v5, v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    if-eqz v5, :cond_0

    move-object v6, v5

    .line 388
    .end local v5           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .local v6, v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    :goto_0
    return-object v6

    .line 360
    .end local v6           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .restart local v5       #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->lock(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    move-result-object v8

    monitor-enter v8

    .line 361
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v7, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 362
    .local v1, e2:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    if-eq v1, v0, :cond_1

    .line 363
    invoke-direct {p0, v1, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->scan(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-result-object v5

    .line 364
    if-eqz v5, :cond_1

    .line 365
    monitor-exit v8

    move-object v6, v5

    .end local v5           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .restart local v6       #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    goto :goto_0

    .line 368
    .end local v6           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .restart local v5       #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->load(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-result-object v5

    .line 369
    invoke-direct {p0, p1, p2, p3, v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->createRef(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLorg/eclipse/jgit/internal/storage/file/ByteWindow;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    move-result-object v3

    .line 370
    .local v3, ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->hit(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V

    .line 372
    :goto_1
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clean(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    move-result-object v7

    invoke-direct {v2, v7, v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;-><init>(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V

    .line 373
    .local v2, n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v7, v4, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 377
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->evictLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 381
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->gc()V

    .line 382
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->evict()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 384
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->evictLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :cond_2
    move-object v6, v5

    .line 388
    .end local v5           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .restart local v6       #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    goto :goto_0

    .line 375
    .end local v6           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .restart local v5       #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    :cond_3
    :try_start_2
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v7, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #e2:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 376
    .restart local v1       #e2:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    goto :goto_1

    .line 377
    .end local v1           #e2:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v2           #n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v3           #ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7

    .line 384
    .restart local v1       #e2:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .restart local v2       #n:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .restart local v3       #ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    :catchall_1
    move-exception v7

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->evictLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v7
.end method

.method static getStreamFileThreshold()I
    .locals 1

    .prologue
    .line 169
    sget v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->streamFileThreshold:I

    return v0
.end method

.method private hash(IJ)I
    .locals 2
    .parameter "packHash"
    .parameter "off"

    .prologue
    .line 279
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSizeShift:I

    ushr-long v0, p2, v0

    long-to-int v0, v0

    add-int/2addr v0, p1

    return v0
.end method

.method private hit(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V
    .locals 5
    .parameter "r"

    .prologue
    .line 415
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clock:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 416
    .local v0, c:J
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clock:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v3, 0x1

    add-long/2addr v3, v0

    invoke-virtual {v2, v0, v1, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 417
    iput-wide v0, p1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->lastAccess:J

    .line 418
    return-void
.end method

.method private isFull()Z
    .locals 4

    .prologue
    .line 319
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->maxFiles:I

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openFiles:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->maxBytes:J

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private load(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .locals 2
    .parameter "pack"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->beginWindowCache()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 285
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openFiles:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 287
    :cond_0
    :try_start_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->mmap:Z

    if-eqz v1, :cond_1

    .line 288
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSize:I

    invoke-virtual {p1, p2, p3, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->mmap(JI)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-result-object v1

    .line 289
    :goto_0
    return-object v1

    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSize:I

    invoke-virtual {p1, p2, p3, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->read(JI)Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    goto :goto_0

    .line 290
    :catch_0
    move-exception v0

    .line 291
    .local v0, e:Ljava/io/IOException;
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->close(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 292
    throw v0

    .line 293
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 294
    .local v0, e:Ljava/lang/RuntimeException;
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->close(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 295
    throw v0

    .line 296
    .end local v0           #e:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v0

    .line 297
    .local v0, e:Ljava/lang/Error;
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->close(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 298
    throw v0
.end method

.method private lock(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;
    .locals 3
    .parameter "pack"
    .parameter "position"

    .prologue
    .line 533
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->locks:[Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    iget v1, p1, Lorg/eclipse/jgit/internal/storage/file/PackFile;->hash:I

    invoke-direct {p0, v1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->hash(IJ)I

    move-result v1

    ushr-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->locks:[Lorg/eclipse/jgit/internal/storage/file/WindowCache$Lock;

    array-length v2, v2

    rem-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0
.end method

.method private static lockCount(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)I
    .locals 2
    .parameter "cfg"

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitOpenFiles()I

    move-result v0

    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method static final purge(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V
    .locals 1
    .parameter "pack"

    .prologue
    .line 192
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->cache:Lorg/eclipse/jgit/internal/storage/file/WindowCache;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->removeAll(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 193
    return-void
.end method

.method public static reconfigure(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V
    .locals 3
    .parameter "cfg"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 159
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;-><init>(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V

    .line 160
    .local v0, nc:Lorg/eclipse/jgit/internal/storage/file/WindowCache;
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->cache:Lorg/eclipse/jgit/internal/storage/file/WindowCache;

    .line 161
    .local v1, oc:Lorg/eclipse/jgit/internal/storage/file/WindowCache;
    if-eqz v1, :cond_0

    .line 162
    invoke-direct {v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->removeAll()V

    .line 163
    :cond_0
    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->cache:Lorg/eclipse/jgit/internal/storage/file/WindowCache;

    .line 164
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getStreamFileThreshold()I

    move-result v2

    sput v2, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->streamFileThreshold:I

    .line 165
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->reconfigure(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V

    .line 166
    return-void
.end method

.method private removeAll()V
    .locals 5

    .prologue
    .line 457
    const/4 v2, 0x0

    .local v2, s:I
    :goto_0
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    if-ge v2, v3, :cond_2

    .line 460
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 461
    .local v1, e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    move-object v0, v1

    .local v0, e:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    :goto_1
    if-eqz v0, :cond_1

    .line 462
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->kill()V

    .line 461
    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    goto :goto_1

    .line 463
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v1, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 457
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 465
    .end local v0           #e:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v1           #e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    :cond_2
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->gc()V

    .line 466
    return-void
.end method

.method private removeAll(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V
    .locals 6
    .parameter "pack"

    .prologue
    .line 480
    const/4 v3, 0x0

    .local v3, s:I
    :goto_0
    iget v4, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    if-ge v3, v4, :cond_4

    .line 481
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 482
    .local v1, e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    const/4 v2, 0x0

    .line 483
    .local v2, hasDead:Z
    move-object v0, v1

    .local v0, e:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    :goto_1
    if-eqz v0, :cond_2

    .line 484
    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    iget-object v4, v4, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    if-ne v4, p1, :cond_1

    .line 485
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->kill()V

    .line 486
    const/4 v2, 0x1

    .line 483
    :cond_0
    :goto_2
    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    goto :goto_1

    .line 487
    :cond_1
    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->dead:Z

    if-eqz v4, :cond_0

    .line 488
    const/4 v2, 0x1

    goto :goto_2

    .line 490
    :cond_2
    if-eqz v2, :cond_3

    .line 491
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->clean(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;)Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    move-result-object v5

    invoke-virtual {v4, v3, v1, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 480
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 493
    .end local v0           #e:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v1           #e1:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
    .end local v2           #hasDead:Z
    :cond_4
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->gc()V

    .line 494
    return-void
.end method

.method private scan(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .locals 4
    .parameter "n"
    .parameter "pack"
    .parameter "position"

    .prologue
    .line 392
    :goto_0
    if-eqz p1, :cond_1

    .line 393
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    .line 394
    .local v0, r:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    if-ne v2, p2, :cond_2

    iget-wide v2, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->position:J

    cmp-long v2, v2, p3

    if-nez v2, :cond_2

    .line 395
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    .line 396
    .local v1, v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    if-eqz v1, :cond_0

    .line 397
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->hit(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V

    .line 404
    .end local v0           #r:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    .end local v1           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    :goto_1
    return-object v1

    .line 400
    .restart local v0       #r:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    .restart local v1       #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->kill()V

    .line 404
    .end local v0           #r:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    .end local v1           #v:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 392
    .restart local v0       #r:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
    :cond_2
    iget-object p1, p1, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    goto :goto_0
.end method

.method private slot(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)I
    .locals 2
    .parameter "pack"
    .parameter "position"

    .prologue
    .line 529
    iget v0, p1, Lorg/eclipse/jgit/internal/storage/file/PackFile;->hash:I

    invoke-direct {p0, v0, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->hash(IJ)I

    move-result v0

    ushr-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->tableSize:I

    rem-int/2addr v0, v1

    return v0
.end method

.method private static tableSize(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)I
    .locals 7
    .parameter "cfg"

    .prologue
    .line 327
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitWindowSize()I

    move-result v2

    .line 328
    .local v2, wsz:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitLimit()J

    move-result-wide v0

    .line 329
    .local v0, limit:J
    if-gtz v2, :cond_0

    .line 330
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->invalidWindowSize:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 331
    :cond_0
    int-to-long v3, v2

    cmp-long v3, v0, v3

    if-gez v3, :cond_1

    .line 332
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->windowSizeMustBeLesserThanLimit:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 333
    :cond_1
    const-wide/16 v3, 0x5

    int-to-long v5, v2

    div-long v5, v0, v5

    mul-long/2addr v3, v5

    const-wide/16 v5, 0x2

    div-long/2addr v3, v5

    const-wide/32 v5, 0x77359400

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    return v3
.end method

.method private toStart(J)J
    .locals 3
    .parameter "offset"

    .prologue
    .line 323
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSizeShift:I

    ushr-long v0, p1, v0

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->windowSizeShift:I

    shl-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method getOpenBytes()J
    .locals 2

    .prologue
    .line 275
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method getOpenFiles()I
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->openFiles:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method
