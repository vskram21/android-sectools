.class final Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;
.super Ljava/lang/Object;
.source "InflatingBitSet.java"


# static fields
.field private static final EMPTY:[J


# instance fields
.field private final bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private inflated:[J

.field private iterator:Lcom/googlecode/javaewah/IntIterator;

.field private nextPosition:I

.field private final sizeInBits:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    new-array v0, v0, [J

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->EMPTY:[J

    return-void
.end method

.method constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 67
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->EMPTY:[J

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;[J)V

    .line 68
    return-void
.end method

.method private constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;[J)V
    .locals 1
    .parameter "orBitmap"
    .parameter "inflated"

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    .line 71
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 72
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->sizeInBits:I

    .line 74
    return-void
.end method

.method private static final block(I)I
    .locals 1
    .parameter "position"

    .prologue
    .line 132
    shr-int/lit8 v0, p0, 0x6

    return v0
.end method

.method private final get(I)Z
    .locals 5
    .parameter "position"

    .prologue
    .line 127
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->block(I)I

    move-result v0

    .line 128
    .local v0, b:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    aget-wide v1, v1, v0

    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->mask(I)J

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

.method private final isEmpty()Z
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->sizeInBits:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static final mask(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 136
    const-wide/16 v0, 0x1

    shl-long/2addr v0, p0

    return-wide v0
.end method


# virtual methods
.method final andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;
    .locals 2
    .parameter "other"

    .prologue
    .line 150
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v1, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    move-object p0, v0

    goto :goto_0
.end method

.method final contains(I)Z
    .locals 13
    .parameter "position"

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->get(I)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 84
    const/4 v9, 0x1

    .line 123
    :goto_0
    return v9

    .line 85
    :cond_0
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    if-le p1, v9, :cond_1

    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->sizeInBits:I

    if-lt p1, v9, :cond_3

    .line 86
    :cond_1
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    if-ne p1, v9, :cond_2

    const/4 v9, 0x1

    goto :goto_0

    :cond_2
    const/4 v9, 0x0

    goto :goto_0

    .line 88
    :cond_3
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->iterator:Lcom/googlecode/javaewah/IntIterator;

    if-nez v9, :cond_8

    .line 89
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v9}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v9

    iput-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->iterator:Lcom/googlecode/javaewah/IntIterator;

    .line 90
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->iterator:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v9}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 91
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->iterator:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v9}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v9

    iput v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    .line 97
    :cond_4
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->block(I)I

    move-result v5

    .line 98
    .local v5, positionBlock:I
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    array-length v9, v9

    if-lt v5, v9, :cond_5

    .line 99
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->sizeInBits:I

    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->block(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    new-array v6, v9, [J

    .line 100
    .local v6, tmp:[J
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    array-length v12, v12

    invoke-static {v9, v10, v6, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    .line 104
    .end local v6           #tmp:[J
    :cond_5
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->block(I)I

    move-result v1

    .line 105
    .local v1, block:I
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->mask(I)J

    move-result-wide v7

    .line 106
    .local v7, word:J
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    invoke-static {v9, p1}, Ljava/lang/Math;->max(II)I

    move-result v9

    or-int/lit8 v2, v9, 0x3f

    .line 107
    .local v2, end:I
    :goto_1
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->iterator:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v9}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 108
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->iterator:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v9}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v9

    iput v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    .line 109
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    if-ge v2, v9, :cond_9

    .line 122
    :cond_6
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    aput-wide v7, v9, v1

    .line 123
    if-ne v1, v5, :cond_b

    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->mask(I)J

    move-result-wide v9

    and-long/2addr v9, v7

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-eqz v9, :cond_b

    const/4 v9, 0x1

    goto/16 :goto_0

    .line 93
    .end local v1           #block:I
    .end local v2           #end:I
    .end local v5           #positionBlock:I
    .end local v7           #word:J
    :cond_7
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 94
    :cond_8
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->iterator:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v9}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_4

    .line 95
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 112
    .restart local v1       #block:I
    .restart local v2       #end:I
    .restart local v5       #positionBlock:I
    .restart local v7       #word:J
    :cond_9
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->block(I)I

    move-result v0

    .line 113
    .local v0, b:I
    iget v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    invoke-static {v9}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->mask(I)J

    move-result-wide v3

    .line 114
    .local v3, m:J
    if-ne v1, v0, :cond_a

    .line 115
    or-long/2addr v7, v3

    goto :goto_1

    .line 117
    :cond_a
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    aput-wide v7, v9, v1

    .line 118
    move v1, v0

    .line 119
    move-wide v7, v3

    goto :goto_1

    .line 123
    .end local v0           #b:I
    .end local v3           #m:J
    :cond_b
    const/4 v9, 0x0

    goto/16 :goto_0
.end method

.method final getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method final maybeContains(I)Z
    .locals 2
    .parameter "position"

    .prologue
    const/4 v0, 0x1

    .line 77
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->get(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->nextPosition:I

    if-gt v1, p1, :cond_2

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->sizeInBits:I

    if-lt p1, v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;
    .locals 3
    .parameter "other"

    .prologue
    .line 144
    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v0

    if-nez v0, :cond_0

    .line 146
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v1, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->inflated:[J

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;[J)V

    move-object p0, v0

    goto :goto_0
.end method

.method final xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;
    .locals 2
    .parameter "other"

    .prologue
    .line 156
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v0

    if-nez v0, :cond_0

    .line 161
    .end local p0
    :goto_0
    return-object p0

    .line 159
    .restart local p0
    :cond_0
    new-instance p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    .end local p0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_0

    .line 161
    .restart local p0
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v1, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/InflatingBitSet;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    move-object p0, v0

    goto :goto_0
.end method
