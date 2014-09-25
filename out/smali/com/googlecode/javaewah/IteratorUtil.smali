.class public Lcom/googlecode/javaewah/IteratorUtil;
.super Ljava/lang/Object;
.source "IteratorUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cardinality(Lcom/googlecode/javaewah/IteratingRLW;)I
    .locals 8
    .parameter "i"

    .prologue
    .line 71
    const/4 v0, 0x0

    .line 73
    .local v0, answer:I
    :cond_0
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v2

    if-eqz v2, :cond_1

    int-to-long v2, v0

    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v4

    const-wide/16 v6, 0x40

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    long-to-int v0, v2

    .line 74
    :cond_1
    const/4 v1, 0x0

    .local v1, k:I
    :goto_0
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 75
    invoke-interface {p0, v1}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->bitCount(J)I

    move-result v2

    add-int/2addr v0, v2

    .line 74
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 76
    :cond_2
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v2

    if-nez v2, :cond_0

    .line 78
    return v0
.end method

.method public static materialize(Lcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/BitmapStorage;J)J
    .locals 9
    .parameter "i"
    .parameter "c"
    .parameter "Max"

    .prologue
    const-wide/16 v7, 0x0

    .line 101
    move-wide v3, p2

    .line 103
    .local v3, origMax:J
    :cond_0
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v5

    cmp-long v5, v5, v7

    if-lez v5, :cond_2

    .line 104
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v0

    .line 105
    .local v0, L:J
    cmp-long v5, v0, p2

    if-lez v5, :cond_1

    move-wide v0, p2

    .line 106
    :cond_1
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v5

    invoke-interface {p1, v5, v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 107
    sub-long/2addr p2, v0

    .line 109
    .end local v0           #L:J
    :cond_2
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v5

    int-to-long v0, v5

    .line 110
    .restart local v0       #L:J
    const/4 v2, 0x0

    .local v2, k:I
    :goto_0
    int-to-long v5, v2

    cmp-long v5, v5, v0

    if-gez v5, :cond_3

    .line 111
    invoke-interface {p0, v2}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v5

    invoke-interface {p1, v5, v6}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 110
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 112
    :cond_3
    cmp-long v5, p2, v7

    if-lez v5, :cond_4

    .line 113
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v5

    if-nez v5, :cond_0

    .line 118
    :cond_4
    sub-long v5, v3, p2

    return-wide v5
.end method

.method public static materialize(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "i"

    .prologue
    .line 127
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 128
    .local v0, ewah:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {p0, v0}, Lcom/googlecode/javaewah/IteratorUtil;->materialize(Lcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 129
    return-object v0
.end method

.method public static materialize(Lcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 5
    .parameter "i"
    .parameter "c"

    .prologue
    .line 56
    :cond_0
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    .line 57
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v1

    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 59
    :cond_1
    const/4 v0, 0x0

    .local v0, k:I
    :goto_0
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 60
    invoke-interface {p0, v0}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v1

    invoke-interface {p1, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 61
    :cond_2
    invoke-interface {p0}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v1

    if-nez v1, :cond_0

    .line 64
    return-void
.end method

.method public static varargs toIterators([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)[Lcom/googlecode/javaewah/IteratingRLW;
    .locals 4
    .parameter "x"

    .prologue
    .line 86
    array-length v2, p0

    new-array v0, v2, [Lcom/googlecode/javaewah/IteratingRLW;

    .line 87
    .local v0, X:[Lcom/googlecode/javaewah/IteratingRLW;
    const/4 v1, 0x0

    .local v1, k:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 88
    new-instance v2, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    aput-object v2, v0, v1

    .line 87
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 90
    :cond_0
    return-object v0
.end method

.method public static toSetBitsIntIterator(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IntIterator;
    .locals 1
    .parameter "i"

    .prologue
    .line 20
    new-instance v0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;-><init>(Lcom/googlecode/javaewah/IteratingRLW;)V

    return-object v0
.end method

.method public static toSetBitsIterator(Lcom/googlecode/javaewah/IteratingRLW;)Ljava/util/Iterator;
    .locals 1
    .parameter "i"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/googlecode/javaewah/IteratingRLW;",
            ")",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    new-instance v0, Lcom/googlecode/javaewah/IteratorUtil$1;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah/IteratorUtil$1;-><init>(Lcom/googlecode/javaewah/IteratingRLW;)V

    return-object v0
.end method
