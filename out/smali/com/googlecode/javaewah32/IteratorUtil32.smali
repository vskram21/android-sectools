.class public Lcom/googlecode/javaewah32/IteratorUtil32;
.super Ljava/lang/Object;
.source "IteratorUtil32.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cardinality(Lcom/googlecode/javaewah32/IteratingRLW32;)I
    .locals 4
    .parameter "i"

    .prologue
    .line 73
    const/4 v0, 0x0

    .line 75
    .local v0, answer:I
    :cond_0
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v2

    mul-int/lit8 v2, v2, 0x20

    add-int/2addr v0, v2

    .line 76
    :cond_1
    const/4 v1, 0x0

    .local v1, k:I
    :goto_0
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 77
    invoke-interface {p0, v1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/lang/Long;->bitCount(J)I

    move-result v2

    add-int/2addr v0, v2

    .line 76
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 78
    :cond_2
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    move-result v2

    if-nez v2, :cond_0

    .line 80
    return v0
.end method

.method public static materialize(Lcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/BitmapStorage32;I)J
    .locals 6
    .parameter "i"
    .parameter "c"
    .parameter "Max"

    .prologue
    .line 104
    move v3, p2

    .line 106
    .local v3, origMax:I
    :cond_0
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v4

    if-lez v4, :cond_2

    .line 107
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    .line 108
    .local v0, L:I
    if-le v0, p2, :cond_1

    move v0, p2

    .line 109
    :cond_1
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v4

    invoke-interface {p1, v4, v0}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 110
    sub-int/2addr p2, v0

    .line 112
    .end local v0           #L:I
    :cond_2
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v4

    int-to-long v0, v4

    .line 113
    .local v0, L:J
    const/4 v2, 0x0

    .local v2, k:I
    :goto_0
    int-to-long v4, v2

    cmp-long v4, v4, v0

    if-gez v4, :cond_3

    .line 114
    invoke-interface {p0, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v4

    invoke-interface {p1, v4}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 113
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 115
    :cond_3
    if-lez p2, :cond_4

    .line 116
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    move-result v4

    if-nez v4, :cond_0

    .line 121
    :cond_4
    sub-int v4, v3, p2

    int-to-long v4, v4

    return-wide v4
.end method

.method public static materialize(Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 1
    .parameter "i"

    .prologue
    .line 130
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 131
    .local v0, ewah:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-static {p0, v0}, Lcom/googlecode/javaewah32/IteratorUtil32;->materialize(Lcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 132
    return-object v0
.end method

.method public static materialize(Lcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 3
    .parameter "i"
    .parameter "c"

    .prologue
    .line 58
    :cond_0
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v1

    if-lez v1, :cond_1

    .line 59
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v1

    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v2

    invoke-interface {p1, v1, v2}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 61
    :cond_1
    const/4 v0, 0x0

    .local v0, k:I
    :goto_0
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 62
    invoke-interface {p0, v0}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v1

    invoke-interface {p1, v1}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 63
    :cond_2
    invoke-interface {p0}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    move-result v1

    if-nez v1, :cond_0

    .line 66
    return-void
.end method

.method public static varargs toIterators([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)[Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 4
    .parameter "x"

    .prologue
    .line 89
    array-length v2, p0

    new-array v0, v2, [Lcom/googlecode/javaewah32/IteratingRLW32;

    .line 90
    .local v0, X:[Lcom/googlecode/javaewah32/IteratingRLW32;
    const/4 v1, 0x0

    .local v1, k:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 91
    new-instance v2, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    aput-object v2, v0, v1

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    :cond_0
    return-object v0
.end method

.method public static toSetBitsIntIterator(Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah/IntIterator;
    .locals 1
    .parameter "i"

    .prologue
    .line 23
    new-instance v0, Lcom/googlecode/javaewah32/IntIteratorOverIteratingRLW32;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah32/IntIteratorOverIteratingRLW32;-><init>(Lcom/googlecode/javaewah32/IteratingRLW32;)V

    return-object v0
.end method

.method public static toSetBitsIterator(Lcom/googlecode/javaewah32/IteratingRLW32;)Ljava/util/Iterator;
    .locals 1
    .parameter "i"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/googlecode/javaewah32/IteratingRLW32;",
            ")",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 31
    new-instance v0, Lcom/googlecode/javaewah32/IteratorUtil32$1;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah32/IteratorUtil32$1;-><init>(Lcom/googlecode/javaewah32/IteratingRLW32;)V

    return-object v0
.end method
