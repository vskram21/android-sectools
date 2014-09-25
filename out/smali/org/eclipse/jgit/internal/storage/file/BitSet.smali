.class final Lorg/eclipse/jgit/internal/storage/file/BitSet;
.super Ljava/lang/Object;
.source "BitSet.java"


# instance fields
.field private words:[J


# direct methods
.method constructor <init>(I)V
    .locals 1
    .parameter "initialCapacity"

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->block(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    .line 60
    return-void
.end method

.method private static final block(I)I
    .locals 1
    .parameter "position"

    .prologue
    .line 115
    shr-int/lit8 v0, p0, 0x6

    return v0
.end method

.method private static final mask(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 119
    const-wide/16 v0, 0x1

    shl-long/2addr v0, p0

    return-wide v0
.end method


# virtual methods
.method final clear()V
    .locals 3

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->fill([JJ)V

    .line 64
    return-void
.end method

.method final clear(I)V
    .locals 8
    .parameter "position"

    .prologue
    .line 77
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->block(I)I

    move-result v0

    .line 78
    .local v0, block:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 79
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    aget-wide v2, v1, v0

    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->mask(I)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    xor-long/2addr v4, v6

    and-long/2addr v2, v4

    aput-wide v2, v1, v0

    .line 80
    :cond_0
    return-void
.end method

.method final get(I)Z
    .locals 5
    .parameter "position"

    .prologue
    .line 83
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->block(I)I

    move-result v0

    .line 84
    .local v0, block:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    aget-wide v1, v1, v0

    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->mask(I)J

    move-result-wide v3

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method final set(I)V
    .locals 7
    .parameter "position"

    .prologue
    const/4 v4, 0x0

    .line 67
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->block(I)I

    move-result v0

    .line 68
    .local v0, block:I
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 69
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->block(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    new-array v1, v2, [J

    .line 70
    .local v1, buf:[J
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    array-length v3, v3

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    .line 73
    .end local v1           #buf:[J
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    aget-wide v3, v2, v0

    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/BitSet;->mask(I)J

    move-result-wide v5

    or-long/2addr v3, v5

    aput-wide v3, v2, v0

    .line 74
    return-void
.end method

.method final toEWAHCompressedBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 15

    .prologue
    const-wide/16 v13, 0x0

    .line 88
    new-instance v2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    array-length v10, v10

    invoke-direct {v2, v10}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>(I)V

    .line 90
    .local v2, compressed:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/4 v7, 0x0

    .line 91
    .local v7, runningEmptyWords:I
    const-wide/16 v4, 0x0

    .line 92
    .local v4, lastNonEmptyWord:J
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitSet;->words:[J

    .local v0, arr$:[J
    array-length v6, v0

    .local v6, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v6, :cond_3

    aget-wide v8, v0, v3

    .line 93
    .local v8, word:J
    cmp-long v10, v8, v13

    if-nez v10, :cond_0

    .line 94
    add-int/lit8 v7, v7, 0x1

    .line 92
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 98
    :cond_0
    cmp-long v10, v4, v13

    if-eqz v10, :cond_1

    .line 99
    invoke-virtual {v2, v4, v5}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->add(J)V

    .line 101
    :cond_1
    if-lez v7, :cond_2

    .line 102
    const/4 v10, 0x0

    int-to-long v11, v7

    invoke-virtual {v2, v10, v11, v12}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addStreamOfEmptyWords(ZJ)V

    .line 103
    const/4 v7, 0x0

    .line 106
    :cond_2
    move-wide v4, v8

    goto :goto_1

    .line 108
    .end local v8           #word:J
    :cond_3
    invoke-static {v4, v5}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v10

    rsub-int/lit8 v1, v10, 0x40

    .line 109
    .local v1, bitsThatMatter:I
    if-lez v1, :cond_4

    .line 110
    invoke-virtual {v2, v4, v5, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->add(JI)V

    .line 111
    :cond_4
    return-object v2
.end method
