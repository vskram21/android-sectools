.class final Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;
.super Ljava/lang/Object;
.source "DeltaBaseCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;,
        Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    }
.end annotation


# static fields
.field private static final MASK_BITS:I = 0x16

.field private static final TABLE_BITS:I = 0xa


# instance fields
.field private curByteCount:I

.field private lruHead:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

.field private lruTail:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

.field private maxByteCount:I

.field private final table:[Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V
    .locals 2
    .parameter "reader"

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->getOptions()Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    move-result-object v0

    .line 74
    .local v0, options:Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->getDeltaBaseCacheLimit()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->maxByteCount:I

    .line 75
    const/16 v1, 0x400

    new-array v1, v1, [Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->table:[Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 76
    return-void
.end method

.method private static hash(J)I
    .locals 1
    .parameter "position"

    .prologue
    .line 59
    long-to-int v0, p0

    shl-int/lit8 v0, v0, 0x16

    ushr-int/lit8 v0, v0, 0x16

    return v0
.end method

.method private moveToHead(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V
    .locals 1
    .parameter "e"

    .prologue
    .line 142
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->unlink(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V

    .line 143
    const/4 v0, 0x0

    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    iput-object p1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 149
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 150
    return-void

    .line 148
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    goto :goto_0
.end method

.method private releaseMemory()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 108
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->curByteCount:I

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->maxByteCount:I

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    if-eqz v2, :cond_1

    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 110
    .local v0, currOldest:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 112
    .local v1, nextOldest:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->curByteCount:I

    iget v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->size:I

    sub-int/2addr v2, v3

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->curByteCount:I

    .line 113
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->unlink(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V

    .line 114
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->removeFromTable(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V

    .line 116
    if-nez v1, :cond_0

    .line 117
    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 120
    :goto_1
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    goto :goto_0

    .line 119
    :cond_0
    iput-object v4, v1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    goto :goto_1

    .line 122
    .end local v0           #currOldest:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    .end local v1           #nextOldest:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    :cond_1
    return-void
.end method

.method private removeFromTable(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V
    .locals 4
    .parameter "e"

    .prologue
    .line 125
    iget-wide v2, p1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->offset:J

    invoke-static {v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->hash(J)I

    move-result v1

    .line 126
    .local v1, tableIdx:I
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->table:[Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    aget-object v0, v2, v1

    .line 128
    .local v0, p:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    if-ne v0, p1, :cond_2

    .line 129
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->table:[Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    iget-object v3, p1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    aput-object v3, v2, v1

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    :cond_2
    if-eqz v0, :cond_0

    .line 134
    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    if-ne v2, p1, :cond_1

    .line 135
    iget-object v2, p1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    iput-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    goto :goto_0
.end method

.method private unlink(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 153
    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 154
    .local v1, prev:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 156
    .local v0, next:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    if-eqz v1, :cond_0

    .line 157
    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 158
    :cond_0
    if-eqz v0, :cond_1

    .line 159
    iput-object v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 160
    :cond_1
    return-void
.end method


# virtual methods
.method get(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
    .locals 4
    .parameter "key"
    .parameter "position"

    .prologue
    .line 79
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->table:[Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    invoke-static {p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->hash(J)I

    move-result v3

    aget-object v1, v2, v3

    .line 80
    .local v1, e:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    :goto_0
    if-eqz v1, :cond_1

    .line 81
    iget-wide v2, v1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->offset:J

    cmp-long v2, v2, p2

    if-nez v2, :cond_0

    iget-object v2, v1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 82
    iget-object v2, v1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->data:Ljava/lang/ref/SoftReference;

    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;

    .line 83
    .local v0, buf:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
    if-eqz v0, :cond_0

    .line 84
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->moveToHead(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V

    .line 89
    .end local v0           #buf:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
    :goto_1
    return-object v0

    .line 80
    :cond_0
    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    goto :goto_0

    .line 89
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method put(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JI[B)V
    .locals 4
    .parameter "key"
    .parameter "offset"
    .parameter "objectType"
    .parameter "data"

    .prologue
    .line 93
    array-length v2, p5

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->maxByteCount:I

    if-le v2, v3, :cond_0

    .line 105
    :goto_0
    return-void

    .line 96
    :cond_0
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->curByteCount:I

    array-length v3, p5

    add-int/2addr v2, v3

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->curByteCount:I

    .line 97
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->releaseMemory()V

    .line 99
    invoke-static {p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->hash(J)I

    move-result v1

    .line 100
    .local v1, tableIdx:I
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    array-length v2, p5

    invoke-direct {v0, p1, p2, p3, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JI)V

    .line 101
    .local v0, e:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
    new-instance v2, Ljava/lang/ref/SoftReference;

    new-instance v3, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;

    invoke-direct {v3, p5, p4}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;-><init>([BI)V

    invoke-direct {v2, v3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->data:Ljava/lang/ref/SoftReference;

    .line 102
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->table:[Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    aget-object v2, v2, v1

    iput-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    .line 103
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->table:[Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

    aput-object v0, v2, v1

    .line 104
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->moveToHead(Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;)V

    goto :goto_0
.end method
