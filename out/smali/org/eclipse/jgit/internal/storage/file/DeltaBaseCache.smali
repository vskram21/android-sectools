.class Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;
.super Ljava/lang/Object;
.source "DeltaBaseCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$1;,
        Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;,
        Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    }
.end annotation


# static fields
.field private static final CACHE_SZ:I = 0x400

.field private static final DEAD:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile defaultMaxByteCount:I


# instance fields
.field private final cache:[Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

.field private lruHead:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

.field private lruTail:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

.field private final maxByteCount:I

.field private openByteCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 72
    new-instance v0, Ljava/lang/ref/SoftReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->DEAD:Ljava/lang/ref/SoftReference;

    .line 73
    new-instance v0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;

    invoke-direct {v0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;-><init>()V

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->reconfigure(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V

    .line 74
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    sget v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->defaultMaxByteCount:I

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->maxByteCount:I

    .line 82
    const/16 v0, 0x400

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->cache:[Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 83
    return-void
.end method

.method static synthetic access$100()Ljava/lang/ref/SoftReference;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->DEAD:Ljava/lang/ref/SoftReference;

    return-object v0
.end method

.method private clearEntry(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 160
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->openByteCount:I

    iget v1, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->sz:I

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->openByteCount:I

    .line 161
    const/4 v0, 0x0

    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->provider:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 162
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->DEAD:Ljava/lang/ref/SoftReference;

    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->data:Ljava/lang/ref/SoftReference;

    .line 163
    const/4 v0, 0x0

    iput v0, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->sz:I

    .line 164
    return-void
.end method

.method private static hash(J)I
    .locals 1
    .parameter "position"

    .prologue
    .line 56
    long-to-int v0, p0

    shl-int/lit8 v0, v0, 0x16

    ushr-int/lit8 v0, v0, 0x16

    return v0
.end method

.method private moveToHead(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V
    .locals 1
    .parameter "e"

    .prologue
    .line 140
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->unlink(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V

    .line 141
    const/4 v0, 0x0

    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    iput-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 143
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    iput-object p1, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 147
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 148
    return-void

    .line 146
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    goto :goto_0
.end method

.method static reconfigure(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V
    .locals 1
    .parameter "cfg"

    .prologue
    .line 77
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getDeltaBaseCacheLimit()I

    move-result v0

    sput v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->defaultMaxByteCount:I

    .line 78
    return-void
.end method

.method private releaseMemory()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 123
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->openByteCount:I

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->maxByteCount:I

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    if-eqz v2, :cond_1

    .line 124
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 125
    .local v0, currOldest:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 127
    .local v1, nextOldest:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->clearEntry(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V

    .line 128
    iput-object v4, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 129
    iput-object v4, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 131
    if-nez v1, :cond_0

    .line 132
    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruHead:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 135
    :goto_1
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->lruTail:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    goto :goto_0

    .line 134
    :cond_0
    iput-object v4, v1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    goto :goto_1

    .line 137
    .end local v0           #currOldest:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    .end local v1           #nextOldest:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    :cond_1
    return-void
.end method

.method private unlink(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 151
    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 152
    .local v1, prev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 153
    .local v0, next:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    if-eqz v1, :cond_0

    .line 154
    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruNext:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 155
    :cond_0
    if-eqz v0, :cond_1

    .line 156
    iput-object v1, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->lruPrev:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .line 157
    :cond_1
    return-void
.end method


# virtual methods
.method get(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;
    .locals 5
    .parameter "pack"
    .parameter "position"

    .prologue
    const/4 v2, 0x0

    .line 86
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->cache:[Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    invoke-static {p2, p3}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->hash(J)I

    move-result v4

    aget-object v1, v3, v4

    .line 87
    .local v1, e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    if-nez v1, :cond_0

    move-object v0, v2

    .line 96
    :goto_0
    return-object v0

    .line 89
    :cond_0
    iget-object v3, v1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->provider:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    if-ne v3, p1, :cond_1

    iget-wide v3, v1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->position:J

    cmp-long v3, v3, p2

    if-nez v3, :cond_1

    .line 90
    iget-object v3, v1, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->data:Ljava/lang/ref/SoftReference;

    invoke-virtual {v3}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;

    .line 91
    .local v0, buf:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;
    if-eqz v0, :cond_1

    .line 92
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->moveToHead(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V

    goto :goto_0

    .end local v0           #buf:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;
    :cond_1
    move-object v0, v2

    .line 96
    goto :goto_0
.end method

.method store(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BI)V
    .locals 3
    .parameter "pack"
    .parameter "position"
    .parameter "data"
    .parameter "objectType"

    .prologue
    .line 101
    array-length v1, p4

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->maxByteCount:I

    if-le v1, v2, :cond_0

    .line 120
    :goto_0
    return-void

    .line 104
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->cache:[Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    invoke-static {p2, p3}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->hash(J)I

    move-result v2

    aget-object v0, v1, v2

    .line 105
    .local v0, e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    if-nez v0, :cond_1

    .line 106
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    .end local v0           #e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;-><init>(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$1;)V

    .line 107
    .restart local v0       #e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->cache:[Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;

    invoke-static {p2, p3}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->hash(J)I

    move-result v2

    aput-object v0, v1, v2

    .line 112
    :goto_1
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->openByteCount:I

    array-length v2, p4

    add-int/2addr v1, v2

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->openByteCount:I

    .line 113
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->releaseMemory()V

    .line 115
    iput-object p1, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->provider:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 116
    iput-wide p2, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->position:J

    .line 117
    array-length v1, p4

    iput v1, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->sz:I

    .line 118
    new-instance v1, Ljava/lang/ref/SoftReference;

    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;

    invoke-direct {v2, p4, p5}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;-><init>([BI)V

    invoke-direct {v1, v2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;->data:Ljava/lang/ref/SoftReference;

    .line 119
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->moveToHead(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V

    goto :goto_0

    .line 109
    :cond_1
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->clearEntry(Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Slot;)V

    goto :goto_1
.end method
