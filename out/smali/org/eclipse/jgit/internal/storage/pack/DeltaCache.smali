.class Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;
.super Ljava/lang/Object;
.source "DeltaCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    }
.end annotation


# instance fields
.field private final entryLimit:I

.field private final queue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<[B>;"
        }
    .end annotation
.end field

.field private final size:J

.field private used:J


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/storage/pack/PackConfig;)V
    .locals 2
    .parameter "pc"

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaCacheSize()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->size:J

    .line 62
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaCacheLimit()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->entryLimit:I

    .line 63
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 64
    return-void
.end method

.method private checkForGarbageCollectedObjects()V
    .locals 5

    .prologue
    .line 124
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    .local v0, r:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    if-eqz v0, :cond_0

    .line 125
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    iget v3, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;->cost:I

    int-to-long v3, v3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    goto :goto_0

    .line 126
    :cond_0
    return-void
.end method


# virtual methods
.method cache([BII)Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    .locals 4
    .parameter "data"
    .parameter "actLen"
    .parameter "reservedSize"

    .prologue
    .line 100
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->resize([BI)[B

    move-result-object p1

    .line 106
    array-length v0, p1

    if-eq p3, v0, :cond_0

    .line 107
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    int-to-long v2, p3

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    .line 108
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    array-length v2, p1

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    .line 110
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;-><init>([BLjava/lang/ref/ReferenceQueue;)V

    return-object v0
.end method

.method canCache(ILorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Z
    .locals 10
    .parameter "length"
    .parameter "src"
    .parameter "res"

    .prologue
    const-wide/16 v8, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 69
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->size:J

    cmp-long v2, v8, v2

    if-gez v2, :cond_1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->size:J

    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    int-to-long v6, p1

    add-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 70
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->checkForGarbageCollectedObjects()V

    .line 71
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->size:J

    cmp-long v2, v8, v2

    if-gez v2, :cond_1

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->size:J

    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    int-to-long v6, p1

    add-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 89
    :cond_0
    :goto_0
    return v0

    .line 75
    :cond_1
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->entryLimit:I

    if-ge p1, v2, :cond_2

    .line 76
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    int-to-long v4, p1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    move v0, v1

    .line 77
    goto :goto_0

    .line 84
    :cond_2
    shr-int/lit8 v2, p1, 0xa

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v3

    shr-int/lit8 v3, v3, 0x14

    invoke-virtual {p3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v4

    shr-int/lit8 v4, v4, 0x15

    add-int/2addr v3, v4

    if-ge v2, v3, :cond_0

    .line 85
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    int-to-long v4, p1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    move v0, v1

    .line 86
    goto :goto_0
.end method

.method credit(I)V
    .locals 4
    .parameter "reservedSize"

    .prologue
    .line 93
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    int-to-long v2, p1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->used:J

    .line 94
    return-void
.end method

.method resize([BI)[B
    .locals 3
    .parameter "data"
    .parameter "actLen"

    .prologue
    const/4 v2, 0x0

    .line 114
    array-length v1, p1

    if-eq v1, p2, :cond_0

    .line 115
    new-array v0, p2, [B

    .line 116
    .local v0, nbuf:[B
    invoke-static {p1, v2, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 117
    move-object p1, v0

    .line 119
    .end local v0           #nbuf:[B
    :cond_0
    return-object p1
.end method
