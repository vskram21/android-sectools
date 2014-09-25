.class Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;
.super Ljava/lang/Object;
.source "DeltaIndexScanner.java"


# instance fields
.field final entries:[J

.field private entryCnt:I

.field final next:[I

.field final table:[I

.field final tableMask:I


# direct methods
.method constructor <init>([BI)V
    .locals 3
    .parameter "raw"
    .parameter "len"

    .prologue
    const/4 v2, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    rem-int/lit8 v1, p2, 0x10

    sub-int/2addr p2, v1

    .line 70
    div-int/lit8 v0, p2, 0x10

    .line 71
    .local v0, worstCaseBlockCnt:I
    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 72
    new-array v1, v2, [I

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->table:[I

    .line 73
    iput v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->tableMask:I

    .line 75
    new-array v1, v2, [J

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entries:[J

    .line 76
    new-array v1, v2, [I

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->next:[I

    .line 90
    :goto_0
    return-void

    .line 79
    :cond_0
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->tableSize(I)I

    move-result v1

    new-array v1, v1, [I

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->table:[I

    .line 80
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->table:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->tableMask:I

    .line 85
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [J

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entries:[J

    .line 86
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entries:[J

    array-length v1, v1

    new-array v1, v1, [I

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->next:[I

    .line 88
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->scan([BI)V

    goto :goto_0
.end method

.method private scan([BI)V
    .locals 12
    .parameter "raw"
    .parameter "end"

    .prologue
    const/16 v11, 0x20

    .line 98
    const/4 v3, 0x0

    .line 99
    .local v3, lastHash:I
    add-int/lit8 v4, p2, -0x10

    .line 101
    .local v4, ptr:I
    :cond_0
    invoke-static {p1, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->hashBlock([BI)I

    move-result v2

    .line 102
    .local v2, key:I
    iget v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->tableMask:I

    and-int v5, v2, v6

    .line 104
    .local v5, tIdx:I
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->table:[I

    aget v1, v6, v5

    .line 105
    .local v1, head:I
    if-eqz v1, :cond_1

    if-ne v3, v2, :cond_1

    .line 110
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entries:[J

    int-to-long v7, v2

    shl-long/2addr v7, v11

    int-to-long v9, v4

    or-long/2addr v7, v9

    aput-wide v7, v6, v1

    .line 118
    :goto_0
    move v3, v2

    .line 119
    add-int/lit8 v4, v4, -0x10

    .line 120
    if-gez v4, :cond_0

    .line 121
    return-void

    .line 112
    :cond_1
    iget v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entryCnt:I

    add-int/lit8 v0, v6, 0x1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entryCnt:I

    .line 113
    .local v0, eIdx:I
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entries:[J

    int-to-long v7, v2

    shl-long/2addr v7, v11

    int-to-long v9, v4

    or-long/2addr v7, v9

    aput-wide v7, v6, v0

    .line 114
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->next:[I

    aput v1, v6, v0

    .line 115
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->table:[I

    aput v0, v6, v5

    goto :goto_0
.end method

.method private static tableSize(I)I
    .locals 4
    .parameter "worstCaseBlockCnt"

    .prologue
    .line 124
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v2

    rsub-int/lit8 v0, v2, 0x20

    .line 125
    .local v0, shift:I
    const/4 v2, 0x1

    add-int/lit8 v3, v0, -0x1

    shl-int v1, v2, v3

    .line 126
    .local v1, sz:I
    if-ge v1, p0, :cond_0

    .line 127
    shl-int/lit8 v1, v1, 0x1

    .line 128
    :cond_0
    return v1
.end method
