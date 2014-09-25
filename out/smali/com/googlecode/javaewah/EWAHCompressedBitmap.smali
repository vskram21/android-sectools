.class public final Lcom/googlecode/javaewah/EWAHCompressedBitmap;
.super Ljava/lang/Object;
.source "EWAHCompressedBitmap.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Externalizable;
.implements Ljava/lang/Iterable;
.implements Lcom/googlecode/javaewah/BitmapStorage;
.implements Lcom/googlecode/javaewah/LogicalElement;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Externalizable;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/lang/Integer;",
        ">;",
        "Lcom/googlecode/javaewah/BitmapStorage;",
        "Lcom/googlecode/javaewah/LogicalElement",
        "<",
        "Lcom/googlecode/javaewah/EWAHCompressedBitmap;",
        ">;"
    }
.end annotation


# static fields
.field public static final adjustContainerSizeWhenAggregating:Z = true

.field static final defaultbuffersize:I = 0x4

.field public static final usetrailingzeros:Z = true

.field public static final wordinbits:I = 0x40


# instance fields
.field actualsizeinwords:I

.field buffer:[J

.field rlw:Lcom/googlecode/javaewah/RunningLengthWord;

.field sizeinbits:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1605
    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 1608
    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 1611
    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 1614
    iput v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 84
    const/4 v0, 0x4

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 85
    new-instance v0, Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-direct {v0, p0, v1}, Lcom/googlecode/javaewah/RunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    iput-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 86
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .parameter "buffersize"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1605
    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 1608
    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 1611
    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 1614
    iput v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 97
    new-array v0, p1, [J

    iput-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 98
    new-instance v0, Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-direct {v0, p0, v1}, Lcom/googlecode/javaewah/RunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    iput-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 99
    return-void
.end method

.method private addEmptyWord(Z)V
    .locals 9
    .parameter "v"

    .prologue
    const-wide/16 v7, 0x1

    const-wide/16 v5, 0x0

    .line 145
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v3

    if-nez v3, :cond_1

    const/4 v0, 0x1

    .line 146
    .local v0, noliteralword:Z
    :goto_0
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v1

    .line 147
    .local v1, runlen:J
    if-eqz v0, :cond_0

    cmp-long v3, v1, v5

    if-nez v3, :cond_0

    .line 148
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 150
    :cond_0
    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v3

    if-ne v3, p1, :cond_2

    const-wide v3, 0xffffffffL

    cmp-long v3, v1, v3

    if-gez v3, :cond_2

    .line 152
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    add-long v4, v1, v7

    invoke-virtual {v3, v4, v5}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 159
    :goto_1
    return-void

    .line 145
    .end local v0           #noliteralword:Z
    .end local v1           #runlen:J
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 155
    .restart local v0       #noliteralword:Z
    .restart local v1       #runlen:J
    :cond_2
    invoke-direct {p0, v5, v6}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 156
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 157
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 158
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3, v7, v8}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    goto :goto_1
.end method

.method private addLiteralWord(J)V
    .locals 4
    .parameter "newdata"

    .prologue
    .line 169
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v0

    .line 170
    .local v0, numbersofar:I
    const v1, 0x7fffffff

    if-lt v0, v1, :cond_0

    .line 171
    const-wide/16 v1, 0x0

    invoke-direct {p0, v1, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 172
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 173
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    const-wide/16 v2, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javaewah/RunningLengthWord;->setNumberOfLiteralWords(J)V

    .line 174
    invoke-direct {p0, p1, p2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 176
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    add-int/lit8 v2, v0, 0x1

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javaewah/RunningLengthWord;->setNumberOfLiteralWords(J)V

    .line 177
    invoke-direct {p0, p1, p2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 178
    return-void
.end method

.method public static varargs and([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 7
    .parameter "bitmaps"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1411
    array-length v3, p0

    if-ne v3, v6, :cond_1

    aget-object v0, p0, v5

    .line 1421
    :cond_0
    :goto_0
    return-object v0

    .line 1412
    :cond_1
    array-length v3, p0

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    aget-object v3, p0, v5

    aget-object v4, p0, v6

    invoke-virtual {v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_0

    .line 1413
    :cond_2
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1414
    .local v0, answer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    new-instance v2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1415
    .local v2, tmp:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    aget-object v3, p0, v5

    aget-object v4, p0, v6

    invoke-virtual {v3, v4, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1416
    const/4 v1, 0x2

    .local v1, k:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 1417
    aget-object v3, p0, v1

    invoke-virtual {v0, v3, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1418
    invoke-virtual {v2, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->swap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 1419
    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clear()V

    .line 1416
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static varargs andCardinality([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 3
    .parameter "bitmaps"

    .prologue
    .line 1435
    array-length v1, p0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->cardinality()I

    move-result v1

    .line 1438
    :goto_0
    return v1

    .line 1436
    :cond_0
    new-instance v0, Lcom/googlecode/javaewah/BitCounter;

    invoke-direct {v0}, Lcom/googlecode/javaewah/BitCounter;-><init>()V

    .line 1437
    .local v0, counter:Lcom/googlecode/javaewah/BitCounter;
    invoke-static {v0, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 1438
    invoke-virtual {v0}, Lcom/googlecode/javaewah/BitCounter;->getCount()I

    move-result v1

    goto :goto_0
.end method

.method public static varargs andWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 7
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 1378
    array-length v3, p1

    if-ne v3, v5, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Need at least one bitmap"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1379
    :cond_0
    array-length v3, p1

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 1380
    aget-object v3, p1, v6

    aget-object v4, p1, v5

    invoke-virtual {v3, v4, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1392
    :goto_0
    return-void

    .line 1383
    :cond_1
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1384
    .local v0, answer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    new-instance v2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1385
    .local v2, tmp:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    aget-object v3, p1, v6

    aget-object v4, p1, v5

    invoke-virtual {v3, v4, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1386
    const/4 v1, 0x2

    .local v1, k:I
    :goto_1
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_2

    .line 1387
    aget-object v3, p1, v1

    invoke-virtual {v0, v3, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1388
    invoke-virtual {v2, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->swap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 1389
    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clear()V

    .line 1386
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1391
    :cond_2
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    aget-object v3, p1, v3

    invoke-virtual {v0, v3, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    goto :goto_0
.end method

.method public static varargs bitmapOf([I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 5
    .parameter "setbits"

    .prologue
    .line 1452
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1453
    .local v0, a:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    move-object v1, p0

    .local v1, arr$:[I
    array-length v4, v1

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v4, :cond_0

    aget v3, v1, v2

    .line 1454
    .local v3, k:I
    invoke-virtual {v0, v3}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    .line 1453
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1455
    .end local v3           #k:I
    :cond_0
    return-object v0
.end method

.method private static extendEmptyBits(Lcom/googlecode/javaewah/BitmapStorage;II)V
    .locals 6
    .parameter "storage"
    .parameter "currentSize"
    .parameter "newSize"

    .prologue
    const/4 v3, 0x0

    .line 1475
    rem-int/lit8 v0, p1, 0x40

    .line 1476
    .local v0, currentLeftover:I
    rem-int/lit8 v1, p2, 0x40

    .line 1477
    .local v1, finalLeftover:I
    div-int/lit8 v2, p2, 0x40

    div-int/lit8 v4, p1, 0x40

    sub-int v4, v2, v4

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    add-int/2addr v4, v2

    if-eqz v0, :cond_1

    const/4 v2, -0x1

    :goto_1
    add-int/2addr v2, v4

    int-to-long v4, v2

    invoke-interface {p0, v3, v4, v5}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 1480
    return-void

    :cond_0
    move v2, v3

    .line 1477
    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1
.end method

.method private fastaddStreamOfEmptyWords(ZJ)V
    .locals 11
    .parameter "v"
    .parameter "number"

    .prologue
    const-wide v9, 0xffffffffL

    const-wide/16 v7, 0x0

    .line 577
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    if-eq v4, p1, :cond_2

    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->size()J

    move-result-wide v4

    cmp-long v4, v4, v7

    if-nez v4, :cond_2

    .line 578
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 587
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v0

    .line 588
    .local v0, runlen:J
    sub-long v4, v9, v0

    cmp-long v4, p2, v4

    if-gez v4, :cond_4

    move-wide v2, p2

    .line 590
    .local v2, whatwecanadd:J
    :goto_1
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    add-long v5, v0, v2

    invoke-virtual {v4, v5, v6}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 591
    sub-long/2addr p2, v2

    .line 593
    :goto_2
    cmp-long v4, p2, v9

    if-ltz v4, :cond_5

    .line 594
    invoke-direct {p0, v7, v8}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 595
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v5, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 596
    if-eqz p1, :cond_1

    .line 597
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 598
    :cond_1
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, v9, v10}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 599
    sub-long/2addr p2, v9

    goto :goto_2

    .line 579
    .end local v0           #runlen:J
    .end local v2           #whatwecanadd:J
    :cond_2
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v4

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    if-eq v4, p1, :cond_0

    .line 581
    :cond_3
    invoke-direct {p0, v7, v8}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 582
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v5, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 583
    if-eqz p1, :cond_0

    .line 584
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    goto :goto_0

    .line 588
    .restart local v0       #runlen:J
    :cond_4
    sub-long v2, v9, v0

    goto :goto_1

    .line 601
    .restart local v2       #whatwecanadd:J
    :cond_5
    cmp-long v4, p2, v7

    if-lez v4, :cond_7

    .line 602
    invoke-direct {p0, v7, v8}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 603
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v5, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 604
    if-eqz p1, :cond_6

    .line 605
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 606
    :cond_6
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p2, p3}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 608
    :cond_7
    return-void
.end method

.method private negative_push_back([JII)V
    .locals 8
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    const/4 v4, 0x0

    .line 760
    :goto_0
    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v2, p3

    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v3, v3

    if-lt v2, v3, :cond_2

    .line 761
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 762
    .local v1, oldbuffer:[J
    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v2, p3

    const v3, 0x8000

    if-ge v2, v3, :cond_0

    .line 763
    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v2, p3

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [J

    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 768
    :goto_1
    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v3, v1

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 769
    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v2, v2, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iput-object v3, v2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    goto :goto_0

    .line 764
    :cond_0
    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v2, p3

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v3, p3

    if-ge v2, v3, :cond_1

    .line 765
    const v2, 0x7fffffff

    new-array v2, v2, [J

    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    goto :goto_1

    .line 767
    :cond_1
    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v2, p3

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    new-array v2, v2, [J

    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    goto :goto_1

    .line 771
    .end local v1           #oldbuffer:[J
    :cond_2
    const/4 v0, 0x0

    .local v0, k:I
    :goto_2
    if-ge v0, p3, :cond_3

    .line 772
    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v3, v0

    add-int v4, p2, v0

    aget-wide v4, p1, v4

    const-wide/16 v6, -0x1

    xor-long/2addr v4, v6

    aput-wide v4, v2, v3

    .line 771
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 773
    :cond_3
    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v2, p3

    iput v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 774
    return-void
.end method

.method public static varargs or([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 10
    .parameter "bitmaps"

    .prologue
    .line 1549
    array-length v6, p0

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    .line 1550
    const/4 v6, 0x0

    aget-object v2, p0, v6

    .line 1558
    :goto_0
    return-object v2

    .line 1551
    :cond_0
    new-instance v2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1552
    .local v2, container:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/4 v4, 0x0

    .line 1553
    .local v4, largestSize:I
    move-object v0, p0

    .local v0, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v5, :cond_1

    aget-object v1, v0, v3

    .line 1554
    .local v1, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v6, v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1553
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1556
    .end local v1           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_1
    int-to-double v6, v4

    const-wide/high16 v8, 0x3ff8

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-direct {v2, v6}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->reserve(I)Z

    .line 1557
    invoke-static {v2, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->orWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_0
.end method

.method public static varargs orCardinality([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 3
    .parameter "bitmaps"

    .prologue
    .line 1598
    array-length v1, p0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->cardinality()I

    move-result v1

    .line 1601
    :goto_0
    return v1

    .line 1599
    :cond_0
    new-instance v0, Lcom/googlecode/javaewah/BitCounter;

    invoke-direct {v0}, Lcom/googlecode/javaewah/BitCounter;-><init>()V

    .line 1600
    .local v0, counter:Lcom/googlecode/javaewah/BitCounter;
    invoke-static {v0, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->orWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 1601
    invoke-virtual {v0}, Lcom/googlecode/javaewah/BitCounter;->getCount()I

    move-result v1

    goto :goto_0
.end method

.method public static varargs orWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 11
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    .line 1492
    array-length v8, p1

    const/4 v9, 0x2

    if-ge v8, v9, :cond_0

    .line 1493
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "You should provide at least two bitmaps, provided "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    array-length v10, p1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1494
    :cond_0
    const-wide/16 v6, 0x0

    .line 1495
    .local v6, size:J
    const-wide/16 v4, 0x0

    .line 1496
    .local v4, sinbits:J
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 1497
    .local v1, b:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v8

    int-to-long v8, v8

    add-long/2addr v6, v8

    .line 1498
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v8

    int-to-long v8, v8

    cmp-long v8, v4, v8

    if-gez v8, :cond_1

    .line 1499
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v8

    int-to-long v4, v8

    .line 1496
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1501
    .end local v1           #b:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_2
    const-wide/16 v8, 0x8

    mul-long/2addr v8, v6

    cmp-long v8, v8, v4

    if-lez v8, :cond_3

    .line 1502
    const/high16 v8, 0x1

    invoke-static {p0, v8, p1}, Lcom/googlecode/javaewah/FastAggregation;->bufferedorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 1506
    :goto_1
    return-void

    .line 1504
    :cond_3
    invoke-static {p0, p1}, Lcom/googlecode/javaewah/FastAggregation;->orToContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_1
.end method

.method private push_back(J)V
    .locals 4
    .parameter "data"

    .prologue
    const/4 v3, 0x0

    .line 912
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 913
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 914
    .local v0, oldbuffer:[J
    array-length v1, v0

    const v2, 0x8000

    if-ge v1, v2, :cond_1

    .line 915
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 920
    :goto_0
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 921
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v1, v1, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iput-object v2, v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 923
    .end local v0           #oldbuffer:[J
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    aput-wide p1, v1, v2

    .line 924
    return-void

    .line 916
    .restart local v0       #oldbuffer:[J
    :cond_1
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    array-length v2, v0

    if-ge v1, v2, :cond_2

    .line 917
    const v1, 0x7fffffff

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    goto :goto_0

    .line 919
    :cond_2
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    goto :goto_0
.end method

.method private push_back([JII)V
    .locals 4
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    const/4 v3, 0x0

    .line 937
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, p3

    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v2, v2

    if-lt v1, v2, :cond_0

    .line 938
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 939
    .local v0, oldbuffer:[J
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, p3

    const v2, 0x8000

    if-ge v1, v2, :cond_1

    .line 940
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, p3

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 945
    :goto_0
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 946
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v1, v1, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iput-object v2, v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 948
    .end local v0           #oldbuffer:[J
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 949
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, p3

    iput v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 950
    return-void

    .line 941
    .restart local v0       #oldbuffer:[J
    :cond_1
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, p3

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v2, p3

    if-ge v1, v2, :cond_2

    .line 942
    const v1, 0x7fffffff

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    goto :goto_0

    .line 944
    :cond_2
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, p3

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    goto :goto_0
.end method

.method private reserve(I)Z
    .locals 4
    .parameter "size"

    .prologue
    const/4 v1, 0x0

    .line 968
    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v2, v2

    if-le p1, v2, :cond_0

    .line 969
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 970
    .local v0, oldbuffer:[J
    new-array v2, p1, [J

    iput-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 971
    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v3, v0

    invoke-static {v0, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 972
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v1, v1, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iput-object v2, v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 973
    const/4 v1, 0x1

    .line 975
    .end local v0           #oldbuffer:[J
    :cond_0
    return v1
.end method

.method public static varargs xor([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 10
    .parameter "bitmaps"

    .prologue
    .line 1575
    array-length v6, p0

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    .line 1576
    const/4 v6, 0x0

    aget-object v2, p0, v6

    .line 1584
    :goto_0
    return-object v2

    .line 1577
    :cond_0
    new-instance v2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1578
    .local v2, container:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/4 v4, 0x0

    .line 1579
    .local v4, largestSize:I
    move-object v0, p0

    .local v0, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v5, :cond_1

    aget-object v1, v0, v3

    .line 1580
    .local v1, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v6, v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1579
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1582
    .end local v1           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_1
    int-to-double v6, v4

    const-wide/high16 v8, 0x3ff8

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-direct {v2, v6}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->reserve(I)Z

    .line 1583
    invoke-static {v2, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_0
.end method

.method public static varargs xorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 11
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    .line 1518
    array-length v8, p1

    const/4 v9, 0x2

    if-ge v8, v9, :cond_0

    .line 1519
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "You should provide at least two bitmaps, provided "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    array-length v10, p1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1520
    :cond_0
    const-wide/16 v6, 0x0

    .line 1521
    .local v6, size:J
    const-wide/16 v4, 0x0

    .line 1522
    .local v4, sinbits:J
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 1523
    .local v1, b:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v8

    int-to-long v8, v8

    add-long/2addr v6, v8

    .line 1524
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v8

    int-to-long v8, v8

    cmp-long v8, v4, v8

    if-gez v8, :cond_1

    .line 1525
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v8

    int-to-long v4, v8

    .line 1522
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1527
    .end local v1           #b:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_2
    const-wide/16 v8, 0x8

    mul-long/2addr v8, v6

    cmp-long v8, v8, v4

    if-lez v8, :cond_3

    .line 1528
    const/high16 v8, 0x1

    invoke-static {p0, v8, p1}, Lcom/googlecode/javaewah/FastAggregation;->bufferedxorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 1532
    :goto_1
    return-void

    .line 1530
    :cond_3
    invoke-static {p0, p1}, Lcom/googlecode/javaewah/FastAggregation;->xorToContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    goto :goto_1
.end method


# virtual methods
.method public add(J)V
    .locals 1
    .parameter "newdata"

    .prologue
    .line 116
    const/16 v0, 0x40

    invoke-virtual {p0, p1, p2, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->add(JI)V

    .line 117
    return-void
.end method

.method public add(JI)V
    .locals 2
    .parameter "newdata"
    .parameter "bitsthatmatter"

    .prologue
    .line 128
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 129
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 130
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addEmptyWord(Z)V

    .line 136
    :goto_0
    return-void

    .line 131
    :cond_0
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_1

    .line 132
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addEmptyWord(Z)V

    goto :goto_0

    .line 134
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addLiteralWord(J)V

    goto :goto_0
.end method

.method public addStreamOfEmptyWords(ZJ)V
    .locals 12
    .parameter "v"
    .parameter "number"

    .prologue
    const-wide v10, 0xffffffffL

    const-wide/16 v8, 0x0

    .line 222
    cmp-long v4, p2, v8

    if-nez v4, :cond_1

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 224
    :cond_1
    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    int-to-long v4, v4

    const-wide/16 v6, 0x40

    mul-long/2addr v6, p2

    add-long/2addr v4, v6

    long-to-int v4, v4

    iput v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 225
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    if-eq v4, p1, :cond_4

    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->size()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-nez v4, :cond_4

    .line 226
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 234
    :cond_2
    :goto_1
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v0

    .line 235
    .local v0, runlen:J
    sub-long v4, v10, v0

    cmp-long v4, p2, v4

    if-gez v4, :cond_6

    move-wide v2, p2

    .line 237
    .local v2, whatwecanadd:J
    :goto_2
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    add-long v5, v0, v2

    invoke-virtual {v4, v5, v6}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 238
    sub-long/2addr p2, v2

    .line 239
    :goto_3
    cmp-long v4, p2, v10

    if-ltz v4, :cond_7

    .line 240
    invoke-direct {p0, v8, v9}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 241
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v5, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 242
    if-eqz p1, :cond_3

    .line 243
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 244
    :cond_3
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, v10, v11}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 245
    sub-long/2addr p2, v10

    goto :goto_3

    .line 227
    .end local v0           #runlen:J
    .end local v2           #whatwecanadd:J
    :cond_4
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v4

    if-nez v4, :cond_5

    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    if-eq v4, p1, :cond_2

    .line 229
    :cond_5
    invoke-direct {p0, v8, v9}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 230
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v5, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 231
    if-eqz p1, :cond_2

    .line 232
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    goto :goto_1

    .line 235
    .restart local v0       #runlen:J
    :cond_6
    sub-long v2, v10, v0

    goto :goto_2

    .line 247
    .restart local v2       #whatwecanadd:J
    :cond_7
    cmp-long v4, p2, v8

    if-lez v4, :cond_0

    .line 248
    invoke-direct {p0, v8, v9}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 249
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v5, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 250
    if-eqz p1, :cond_8

    .line 251
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 252
    :cond_8
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4, p2, p3}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    goto/16 :goto_0
.end method

.method public addStreamOfLiteralWords([JII)V
    .locals 7
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    const v6, 0x7fffffff

    .line 194
    move v1, p3

    .line 195
    .local v1, leftovernumber:I
    :cond_0
    :goto_0
    if-lez v1, :cond_2

    .line 196
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v0

    .line 197
    .local v0, NumberOfLiteralWords:I
    sub-int v3, v6, v0

    if-ge v1, v3, :cond_1

    move v2, v1

    .line 200
    .local v2, whatwecanadd:I
    :goto_1
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    add-int v4, v0, v2

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lcom/googlecode/javaewah/RunningLengthWord;->setNumberOfLiteralWords(J)V

    .line 201
    sub-int/2addr v1, v2

    .line 202
    invoke-direct {p0, p1, p2, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back([JII)V

    .line 203
    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    mul-int/lit8 v4, v2, 0x40

    add-int/2addr v3, v4

    iput v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 204
    if-lez v1, :cond_0

    .line 205
    const-wide/16 v3, 0x0

    invoke-direct {p0, v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 206
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    goto :goto_0

    .line 197
    .end local v2           #whatwecanadd:I
    :cond_1
    sub-int v2, v6, v0

    goto :goto_1

    .line 209
    .end local v0           #NumberOfLiteralWords:I
    :cond_2
    return-void
.end method

.method public addStreamOfNegatedLiteralWords([JII)V
    .locals 7
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    const v6, 0x7fffffff

    .line 269
    move v1, p3

    .line 270
    .local v1, leftovernumber:I
    :cond_0
    :goto_0
    if-lez v1, :cond_2

    .line 271
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v0

    .line 272
    .local v0, NumberOfLiteralWords:I
    sub-int v3, v6, v0

    if-ge v1, v3, :cond_1

    move v2, v1

    .line 276
    .local v2, whatwecanadd:I
    :goto_1
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    add-int v4, v0, v2

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lcom/googlecode/javaewah/RunningLengthWord;->setNumberOfLiteralWords(J)V

    .line 278
    sub-int/2addr v1, v2

    .line 279
    invoke-direct {p0, p1, p2, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->negative_push_back([JII)V

    .line 280
    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    mul-int/lit8 v4, v2, 0x40

    add-int/2addr v3, v4

    iput v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 281
    if-lez v1, :cond_0

    .line 282
    const-wide/16 v3, 0x0

    invoke-direct {p0, v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->push_back(J)V

    .line 283
    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    goto :goto_0

    .line 272
    .end local v2           #whatwecanadd:I
    :cond_1
    sub-int v2, v6, v0

    goto :goto_1

    .line 286
    .end local v0           #NumberOfLiteralWords:I
    :cond_2
    return-void
.end method

.method public and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 3
    .parameter "a"

    .prologue
    .line 305
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 306
    .local v0, container:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    if-le v1, v2, :cond_0

    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    :goto_0
    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->reserve(I)Z

    .line 309
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 310
    return-object v0

    .line 306
    :cond_0
    iget v1, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    goto :goto_0
.end method

.method public bridge synthetic and(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    check-cast p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public andCardinality(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 377
    new-instance v0, Lcom/googlecode/javaewah/BitCounter;

    invoke-direct {v0}, Lcom/googlecode/javaewah/BitCounter;-><init>()V

    .line 378
    .local v0, counter:Lcom/googlecode/javaewah/BitCounter;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 379
    invoke-virtual {v0}, Lcom/googlecode/javaewah/BitCounter;->getCount()I

    move-result v1

    return v1
.end method

.method public andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 3
    .parameter "a"

    .prologue
    .line 398
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 399
    .local v0, container:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    if-le v1, v2, :cond_0

    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    :goto_0
    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->reserve(I)Z

    .line 402
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andNotToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 403
    return-object v0

    .line 399
    :cond_0
    iget v1, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    goto :goto_0
.end method

.method public bridge synthetic andNot(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    check-cast p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andNot(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public andNotCardinality(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 478
    new-instance v0, Lcom/googlecode/javaewah/BitCounter;

    invoke-direct {v0}, Lcom/googlecode/javaewah/BitCounter;-><init>()V

    .line 479
    .local v0, counter:Lcom/googlecode/javaewah/BitCounter;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andNotToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 480
    invoke-virtual {v0}, Lcom/googlecode/javaewah/BitCounter;->getCount()I

    move-result v1

    return v1
.end method

.method public andNotToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 23
    .parameter "a"
    .parameter "container"

    .prologue
    .line 420
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v4

    .line 421
    .local v4, i:Lcom/googlecode/javaewah/EWAHIterator;
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v9

    .line 422
    .local v9, j:Lcom/googlecode/javaewah/EWAHIterator;
    new-instance v15, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v15, v4}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 423
    .local v15, rlwi:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    new-instance v16, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-object/from16 v0, v16

    invoke-direct {v0, v9}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 424
    .local v16, rlwj:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_0
    :goto_0
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_b

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_b

    .line 425
    :goto_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-gtz v17, :cond_1

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_9

    .line 426
    :cond_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v19

    cmp-long v17, v17, v19

    if-gez v17, :cond_4

    const/4 v5, 0x1

    .line 428
    .local v5, i_is_prey:Z
    :goto_2
    if-eqz v5, :cond_5

    move-object v13, v15

    .line 429
    .local v13, prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_3
    if-eqz v5, :cond_6

    move-object/from16 v12, v16

    .line 431
    .local v12, predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_4
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_2

    if-nez v5, :cond_3

    :cond_2
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v17

    if-nez v17, :cond_7

    if-nez v5, :cond_7

    .line 433
    :cond_3
    const/16 v17, 0x0

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 434
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v13, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 435
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto :goto_1

    .line 426
    .end local v5           #i_is_prey:Z
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    .restart local v5       #i_is_prey:Z
    :cond_5
    move-object/from16 v13, v16

    .line 428
    goto :goto_3

    .restart local v13       #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_6
    move-object v12, v15

    .line 429
    goto :goto_4

    .line 436
    .restart local v12       #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_7
    if-eqz v5, :cond_8

    .line 437
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-virtual {v13, v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;J)J

    move-result-wide v7

    .line 438
    .local v7, index:J
    const/16 v17, 0x0

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    sub-long v18, v18, v7

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 440
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_1

    .line 442
    .end local v7           #index:J
    :cond_8
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-virtual {v13, v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->dischargeNegated(Lcom/googlecode/javaewah/BitmapStorage;J)J

    move-result-wide v7

    .line 443
    .restart local v7       #index:J
    const/16 v17, 0x1

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    sub-long v18, v18, v7

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 445
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_1

    .line 448
    .end local v5           #i_is_prey:Z
    .end local v7           #index:J
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_9
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 450
    .local v11, nbre_literal:I
    if-lez v11, :cond_0

    .line 451
    const/4 v10, 0x0

    .local v10, k:I
    :goto_5
    if-ge v10, v11, :cond_a

    .line 452
    invoke-virtual {v15, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v17

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v19

    const-wide/16 v21, -0x1

    xor-long v19, v19, v21

    and-long v17, v17, v19

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-interface {v0, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 451
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 453
    :cond_a
    int-to-long v0, v11

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    invoke-virtual {v15, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 454
    int-to-long v0, v11

    move-wide/from16 v17, v0

    invoke-virtual/range {v16 .. v18}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_0

    .line 457
    .end local v10           #k:I
    .end local v11           #nbre_literal:I
    :cond_b
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_c

    const/4 v6, 0x1

    .line 458
    .local v6, i_remains:Z
    :goto_6
    if-eqz v6, :cond_d

    move-object v14, v15

    .line 459
    .local v14, remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_7
    if-eqz v6, :cond_e

    .line 460
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 464
    :goto_8
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v17

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v17

    move-object/from16 v0, p2

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    .line 465
    return-void

    .line 457
    .end local v6           #i_remains:Z
    .end local v14           #remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_c
    const/4 v6, 0x0

    goto :goto_6

    .restart local v6       #i_remains:Z
    :cond_d
    move-object/from16 v14, v16

    .line 458
    goto :goto_7

    .line 462
    .restart local v14       #remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_e
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->dischargeAsEmpty(Lcom/googlecode/javaewah/BitmapStorage;)V

    goto :goto_8
.end method

.method public andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 21
    .parameter "a"
    .parameter "container"

    .prologue
    .line 326
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v4

    .line 327
    .local v4, i:Lcom/googlecode/javaewah/EWAHIterator;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v9

    .line 328
    .local v9, j:Lcom/googlecode/javaewah/EWAHIterator;
    new-instance v15, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v15, v4}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 329
    .local v15, rlwi:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    new-instance v16, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-object/from16 v0, v16

    invoke-direct {v0, v9}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 330
    .local v16, rlwj:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_0
    :goto_0
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_8

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_8

    .line 331
    :goto_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-gtz v17, :cond_1

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_6

    .line 332
    :cond_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v19

    cmp-long v17, v17, v19

    if-gez v17, :cond_2

    const/4 v5, 0x1

    .line 334
    .local v5, i_is_prey:Z
    :goto_2
    if-eqz v5, :cond_3

    move-object v13, v15

    .line 335
    .local v13, prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_3
    if-eqz v5, :cond_4

    move-object/from16 v12, v16

    .line 337
    .local v12, predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_4
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v17

    if-nez v17, :cond_5

    .line 338
    const/16 v17, 0x0

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 339
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v13, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 340
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto :goto_1

    .line 332
    .end local v5           #i_is_prey:Z
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_2
    const/4 v5, 0x0

    goto :goto_2

    .restart local v5       #i_is_prey:Z
    :cond_3
    move-object/from16 v13, v16

    .line 334
    goto :goto_3

    .restart local v13       #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_4
    move-object v12, v15

    .line 335
    goto :goto_4

    .line 342
    .restart local v12       #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_5
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-virtual {v13, v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;J)J

    move-result-wide v7

    .line 343
    .local v7, index:J
    const/16 v17, 0x0

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    sub-long v18, v18, v7

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 345
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto :goto_1

    .line 348
    .end local v5           #i_is_prey:Z
    .end local v7           #index:J
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_6
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 350
    .local v11, nbre_literal:I
    if-lez v11, :cond_0

    .line 351
    const/4 v10, 0x0

    .local v10, k:I
    :goto_5
    if-ge v10, v11, :cond_7

    .line 352
    invoke-virtual {v15, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v17

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v19

    and-long v17, v17, v19

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-interface {v0, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 351
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 353
    :cond_7
    int-to-long v0, v11

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    invoke-virtual {v15, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 354
    int-to-long v0, v11

    move-wide/from16 v17, v0

    invoke-virtual/range {v16 .. v18}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_0

    .line 358
    .end local v10           #k:I
    .end local v11           #nbre_literal:I
    :cond_8
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_9

    const/4 v6, 0x1

    .line 359
    .local v6, i_remains:Z
    :goto_6
    if-eqz v6, :cond_a

    move-object v14, v15

    .line 360
    .local v14, remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->dischargeAsEmpty(Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 361
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v17

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v17

    move-object/from16 v0, p2

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    .line 363
    return-void

    .line 358
    .end local v6           #i_remains:Z
    .end local v14           #remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_9
    const/4 v6, 0x0

    goto :goto_6

    .restart local v6       #i_remains:Z
    :cond_a
    move-object/from16 v14, v16

    .line 359
    goto :goto_7
.end method

.method public cardinality()I
    .locals 10

    .prologue
    .line 490
    const/4 v0, 0x0

    .line 491
    .local v0, counter:I
    new-instance v1, Lcom/googlecode/javaewah/EWAHIterator;

    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-direct {v1, p0, v4}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 492
    .local v1, i:Lcom/googlecode/javaewah/EWAHIterator;
    :cond_0
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 493
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v3

    .line 494
    .local v3, localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 495
    int-to-long v4, v0

    const-wide/16 v6, 0x40

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v8

    mul-long/2addr v6, v8

    add-long/2addr v4, v6

    long-to-int v0, v4

    .line 497
    :cond_1
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 498
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v4

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v5

    add-int/2addr v5, v2

    aget-wide v4, v4, v5

    invoke-static {v4, v5}, Ljava/lang/Long;->bitCount(J)I

    move-result v4

    add-int/2addr v0, v4

    .line 497
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 501
    .end local v2           #j:I
    .end local v3           #localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    :cond_2
    return v0
.end method

.method public clear()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 508
    iput v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 509
    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 510
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iput v3, v0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 513
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    const-wide/16 v1, 0x0

    aput-wide v1, v0, v3

    .line 514
    return-void
.end method

.method public clone()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 521
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 522
    .local v0, clone:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    invoke-virtual {v1}, [J->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    iput-object v1, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 523
    new-instance v1, Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v2, v2, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    invoke-direct {v1, v0, v2}, Lcom/googlecode/javaewah/RunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    iput-object v1, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 524
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    iput v1, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 525
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    iput v1, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 526
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clone()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Ljava/io/DataInput;)V
    .locals 4
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 538
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v1

    iput v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 539
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v1

    iput v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 540
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    array-length v1, v1

    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    if-ge v1, v2, :cond_0

    .line 541
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 543
    :cond_0
    const/4 v0, 0x0

    .local v0, k:I
    :goto_0
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    if-ge v0, v1, :cond_1

    .line 544
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    invoke-interface {p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 543
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 545
    :cond_1
    new-instance v1, Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/googlecode/javaewah/RunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    iput-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 546
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    const/4 v1, 0x0

    .line 555
    instance-of v2, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    if-eqz v2, :cond_0

    .line 557
    :try_start_0
    check-cast p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p1
    new-instance v2, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;

    invoke-direct {v2}, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;-><init>()V

    invoke-virtual {p0, p1, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xorToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V
    :try_end_0
    .catch Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 558
    const/4 v1, 0x1

    .line 563
    :cond_0
    :goto_0
    return v1

    .line 559
    :catch_0
    move-exception v0

    .line 560
    .local v0, e:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;
    goto :goto_0
.end method

.method public get(I)Z
    .locals 10
    .parameter "i"

    .prologue
    const/4 v5, 0x0

    .line 1016
    if-ltz p1, :cond_0

    iget v6, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-lt p1, v6, :cond_1

    .line 1033
    :cond_0
    :goto_0
    return v5

    .line 1018
    :cond_1
    const/4 v0, 0x0

    .line 1019
    .local v0, WordChecked:I
    invoke-virtual {p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getIteratingRLW()Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v1

    .line 1020
    .local v1, j:Lcom/googlecode/javaewah/IteratingRLW;
    div-int/lit8 v4, p1, 0x40

    .line 1021
    .local v4, wordi:I
    :goto_1
    if-gt v0, v4, :cond_0

    .line 1022
    int-to-long v6, v0

    invoke-interface {v1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    add-long/2addr v6, v8

    long-to-int v0, v6

    .line 1023
    if-ge v4, v0, :cond_2

    .line 1024
    invoke-interface {v1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v5

    goto :goto_0

    .line 1026
    :cond_2
    invoke-interface {v1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v6

    add-int/2addr v6, v0

    if-ge v4, v6, :cond_3

    .line 1027
    sub-int v6, v4, v0

    invoke-interface {v1, v6}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v2

    .line 1028
    .local v2, w:J
    const-wide/16 v6, 0x1

    shl-long/2addr v6, p1

    and-long/2addr v6, v2

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-eqz v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    .line 1030
    .end local v2           #w:J
    :cond_3
    invoke-interface {v1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v6

    add-int/2addr v0, v6

    .line 1031
    invoke-interface {v1}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    goto :goto_1
.end method

.method public getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;
    .locals 2

    .prologue
    .line 617
    new-instance v0, Lcom/googlecode/javaewah/EWAHIterator;

    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-direct {v0, p0, v1}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    return-object v0
.end method

.method public getIteratingRLW()Lcom/googlecode/javaewah/IteratingRLW;
    .locals 1

    .prologue
    .line 624
    new-instance v0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    return-object v0
.end method

.method public getPositions()Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 633
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 634
    .local v10, v:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v4, Lcom/googlecode/javaewah/EWAHIterator;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v11}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 635
    .local v4, i:Lcom/googlecode/javaewah/EWAHIterator;
    const/4 v8, 0x0

    .line 636
    .local v8, pos:I
    :cond_0
    invoke-virtual {v4}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 637
    invoke-virtual {v4}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v6

    .line 638
    .local v6, localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    invoke-virtual {v6}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 639
    const/4 v5, 0x0

    .local v5, j:I
    :goto_0
    int-to-long v11, v5

    invoke-virtual {v6}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v13

    cmp-long v11, v11, v13

    if-gez v11, :cond_3

    .line 640
    const/4 v1, 0x0

    .local v1, c:I
    move v9, v8

    .end local v8           #pos:I
    .local v9, pos:I
    :goto_1
    const/16 v11, 0x40

    if-ge v1, v11, :cond_1

    .line 641
    new-instance v11, Ljava/lang/Integer;

    add-int/lit8 v8, v9, 0x1

    .end local v9           #pos:I
    .restart local v8       #pos:I
    invoke-direct {v11, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 640
    add-int/lit8 v1, v1, 0x1

    move v9, v8

    .end local v8           #pos:I
    .restart local v9       #pos:I
    goto :goto_1

    .line 639
    :cond_1
    add-int/lit8 v5, v5, 0x1

    move v8, v9

    .end local v9           #pos:I
    .restart local v8       #pos:I
    goto :goto_0

    .line 644
    .end local v1           #c:I
    .end local v5           #j:I
    :cond_2
    int-to-long v11, v8

    const-wide/16 v13, 0x40

    invoke-virtual {v6}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v15

    mul-long/2addr v13, v15

    add-long/2addr v11, v13

    long-to-int v8, v11

    .line 646
    :cond_3
    const/4 v5, 0x0

    .restart local v5       #j:I
    :goto_2
    invoke-virtual {v6}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v11

    if-ge v5, v11, :cond_0

    .line 647
    invoke-virtual {v4}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v11

    invoke-virtual {v4}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v12

    add-int/2addr v12, v5

    aget-wide v2, v11, v12

    .line 648
    .local v2, data:J
    :goto_3
    const-wide/16 v11, 0x0

    cmp-long v11, v2, v11

    if-eqz v11, :cond_4

    .line 649
    invoke-static {v2, v3}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v7

    .line 650
    .local v7, ntz:I
    const-wide/16 v11, 0x1

    shl-long/2addr v11, v7

    xor-long/2addr v2, v11

    .line 651
    new-instance v11, Ljava/lang/Integer;

    add-int v12, v7, v8

    invoke-direct {v11, v12}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 653
    .end local v7           #ntz:I
    :cond_4
    add-int/lit8 v8, v8, 0x40

    .line 646
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 656
    .end local v2           #data:J
    .end local v5           #j:I
    .end local v6           #localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    :cond_5
    :goto_4
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_6

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    move-object/from16 v0, p0

    iget v12, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-lt v11, v12, :cond_6

    .line 658
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_4

    .line 659
    :cond_6
    return-object v10
.end method

.method public hashCode()I
    .locals 13

    .prologue
    const-wide v11, 0xffffffffL

    const/16 v10, 0x20

    .line 669
    const/4 v3, 0x0

    .line 670
    .local v3, karprabin:I
    const/16 v0, 0x1f

    .line 671
    .local v0, B:I
    new-instance v1, Lcom/googlecode/javaewah/EWAHIterator;

    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-direct {v1, p0, v4}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 672
    .local v1, i:Lcom/googlecode/javaewah/EWAHIterator;
    :cond_0
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 673
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    .line 674
    iget-object v4, v1, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 675
    int-to-long v4, v3

    mul-int/lit8 v6, v3, 0x1f

    int-to-long v6, v6

    iget-object v8, v1, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v8}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v8

    and-long/2addr v8, v11

    add-long/2addr v6, v8

    add-long/2addr v4, v6

    long-to-int v3, v4

    .line 677
    int-to-long v4, v3

    mul-int/lit8 v6, v3, 0x1f

    int-to-long v6, v6

    iget-object v8, v1, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v8}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v8

    ushr-long/2addr v8, v10

    add-long/2addr v6, v8

    add-long/2addr v4, v6

    long-to-int v3, v4

    .line 679
    :cond_1
    const/4 v2, 0x0

    .local v2, k:I
    :goto_0
    iget-object v4, v1, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v4}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 680
    int-to-long v4, v3

    mul-int/lit8 v6, v3, 0x1f

    int-to-long v6, v6

    iget-object v8, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v9

    add-int/2addr v9, v2

    aget-wide v8, v8, v9

    and-long/2addr v8, v11

    add-long/2addr v6, v8

    add-long/2addr v4, v6

    long-to-int v3, v4

    .line 681
    int-to-long v4, v3

    mul-int/lit8 v6, v3, 0x1f

    int-to-long v6, v6

    iget-object v8, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v9

    add-int/2addr v9, v2

    aget-wide v8, v8, v9

    ushr-long/2addr v8, v10

    add-long/2addr v6, v8

    add-long/2addr v4, v6

    long-to-int v3, v4

    .line 679
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 684
    .end local v2           #k:I
    :cond_2
    return v3
.end method

.method public intIterator()Lcom/googlecode/javaewah/IntIterator;
    .locals 3

    .prologue
    .line 716
    new-instance v0, Lcom/googlecode/javaewah/IntIteratorImpl;

    new-instance v1, Lcom/googlecode/javaewah/EWAHIterator;

    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-direct {v1, p0, v2}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/IntIteratorImpl;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    return-object v0
.end method

.method public intersects(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Z
    .locals 3
    .parameter "a"

    .prologue
    .line 699
    new-instance v1, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;

    invoke-direct {v1}, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;-><init>()V

    .line 701
    .local v1, nevs:Lcom/googlecode/javaewah/NonEmptyVirtualStorage;
    :try_start_0
    invoke-virtual {p0, p1, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->andToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V
    :try_end_0
    .catch Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 705
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 702
    :catch_0
    move-exception v0

    .line 703
    .local v0, nee:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 728
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap$1;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap$1;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    return-object v0
.end method

.method public not()V
    .locals 11

    .prologue
    const-wide/16 v9, -0x1

    .line 786
    new-instance v0, Lcom/googlecode/javaewah/EWAHIterator;

    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-direct {v0, p0, v4}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 787
    .local v0, i:Lcom/googlecode/javaewah/EWAHIterator;
    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 810
    :cond_0
    :goto_0
    return-void

    .line 791
    :cond_1
    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v2

    .line 792
    .local v2, rlw1:Lcom/googlecode/javaewah/RunningLengthWord;
    invoke-virtual {v2}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    if-nez v4, :cond_2

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {v2, v4}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningBit(Z)V

    .line 793
    const/4 v1, 0x0

    .local v1, j:I
    :goto_2
    invoke-virtual {v2}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 794
    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v4

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v5

    add-int/2addr v5, v1

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v6

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v7

    add-int/2addr v7, v1

    aget-wide v6, v6, v7

    xor-long/2addr v6, v9

    aput-wide v6, v4, v5

    .line 793
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 792
    .end local v1           #j:I
    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 797
    .restart local v1       #j:I
    :cond_3
    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 798
    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    rem-int/lit8 v3, v4, 0x40

    .line 799
    .local v3, usedbitsinlast:I
    if-eqz v3, :cond_0

    .line 802
    invoke-virtual {v2}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v4

    if-nez v4, :cond_4

    .line 803
    invoke-virtual {v2}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    invoke-virtual {v2}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 804
    invoke-virtual {v2}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 805
    rsub-int/lit8 v4, v3, 0x40

    ushr-long v4, v9, v4

    invoke-direct {p0, v4, v5}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addLiteralWord(J)V

    goto :goto_0

    .line 809
    :cond_4
    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v4

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v5

    invoke-virtual {v2}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    aget-wide v6, v4, v5

    rsub-int/lit8 v8, v3, 0x40

    ushr-long v8, v9, v8

    and-long/2addr v6, v8

    aput-wide v6, v4, v5

    goto :goto_0
.end method

.method public or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 3
    .parameter "a"

    .prologue
    .line 831
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 832
    .local v0, container:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->reserve(I)Z

    .line 833
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->orToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 834
    return-object v0
.end method

.method public bridge synthetic or(Ljava/lang/Object;)Lcom/googlecode/javaewah/LogicalElement;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    check-cast p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public orCardinality(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 900
    new-instance v0, Lcom/googlecode/javaewah/BitCounter;

    invoke-direct {v0}, Lcom/googlecode/javaewah/BitCounter;-><init>()V

    .line 901
    .local v0, counter:Lcom/googlecode/javaewah/BitCounter;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->orToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 902
    invoke-virtual {v0}, Lcom/googlecode/javaewah/BitCounter;->getCount()I

    move-result v1

    return v1
.end method

.method public orToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 21
    .parameter "a"
    .parameter "container"

    .prologue
    .line 850
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v4

    .line 851
    .local v4, i:Lcom/googlecode/javaewah/EWAHIterator;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v9

    .line 852
    .local v9, j:Lcom/googlecode/javaewah/EWAHIterator;
    new-instance v15, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v15, v4}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 853
    .local v15, rlwi:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    new-instance v16, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-object/from16 v0, v16

    invoke-direct {v0, v9}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 854
    .local v16, rlwj:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_0
    :goto_0
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_8

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_8

    .line 855
    :goto_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-gtz v17, :cond_1

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_6

    .line 856
    :cond_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v19

    cmp-long v17, v17, v19

    if-gez v17, :cond_2

    const/4 v5, 0x1

    .line 858
    .local v5, i_is_prey:Z
    :goto_2
    if-eqz v5, :cond_3

    move-object v13, v15

    .line 860
    .local v13, prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_3
    if-eqz v5, :cond_4

    move-object/from16 v12, v16

    .line 862
    .local v12, predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_4
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_5

    .line 863
    const/16 v17, 0x1

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 864
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v13, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 865
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto :goto_1

    .line 856
    .end local v5           #i_is_prey:Z
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_2
    const/4 v5, 0x0

    goto :goto_2

    .restart local v5       #i_is_prey:Z
    :cond_3
    move-object/from16 v13, v16

    .line 858
    goto :goto_3

    .restart local v13       #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_4
    move-object v12, v15

    .line 860
    goto :goto_4

    .line 867
    .restart local v12       #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_5
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-virtual {v13, v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;J)J

    move-result-wide v7

    .line 868
    .local v7, index:J
    const/16 v17, 0x0

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    sub-long v18, v18, v7

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 870
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_1

    .line 873
    .end local v5           #i_is_prey:Z
    .end local v7           #index:J
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_6
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 875
    .local v11, nbre_literal:I
    if-lez v11, :cond_0

    .line 876
    const/4 v10, 0x0

    .local v10, k:I
    :goto_5
    if-ge v10, v11, :cond_7

    .line 877
    invoke-virtual {v15, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v17

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v19

    or-long v17, v17, v19

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-interface {v0, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 876
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 879
    :cond_7
    int-to-long v0, v11

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    invoke-virtual {v15, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 880
    int-to-long v0, v11

    move-wide/from16 v17, v0

    invoke-virtual/range {v16 .. v18}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_0

    .line 883
    .end local v10           #k:I
    .end local v11           #nbre_literal:I
    :cond_8
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_9

    const/4 v6, 0x1

    .line 884
    .local v6, i_remains:Z
    :goto_6
    if-eqz v6, :cond_a

    move-object v14, v15

    .line 885
    .local v14, remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 886
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v17

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v17

    move-object/from16 v0, p2

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    .line 887
    return-void

    .line 883
    .end local v6           #i_remains:Z
    .end local v14           #remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_9
    const/4 v6, 0x0

    goto :goto_6

    .restart local v6       #i_remains:Z
    :cond_a
    move-object/from16 v14, v16

    .line 884
    goto :goto_7
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 0
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 957
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->deserialize(Ljava/io/DataInput;)V

    .line 958
    return-void
.end method

.method public serialize(Ljava/io/DataOutput;)V
    .locals 3
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 987
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 988
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 989
    const/4 v0, 0x0

    .local v0, k:I
    :goto_0
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    if-ge v0, v1, :cond_0

    .line 990
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    aget-wide v1, v1, v0

    invoke-interface {p1, v1, v2}, Ljava/io/DataOutput;->writeLong(J)V

    .line 989
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 991
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v1, v1, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 992
    return-void
.end method

.method public serializedSizeInBytes()I
    .locals 1

    .prologue
    .line 1000
    invoke-virtual {p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v0

    add-int/lit8 v0, v0, 0xc

    return v0
.end method

.method public set(I)Z
    .locals 9
    .parameter "i"

    .prologue
    const/4 v1, 0x0

    const-wide/16 v7, 0x1

    const/4 v2, 0x1

    .line 1048
    const v3, 0x7fffffbf

    if-gt p1, v3, :cond_0

    if-gez p1, :cond_1

    .line 1049
    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const-string v2, "Set values should be between 0 and 2147483583"

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1051
    :cond_1
    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-ge p1, v3, :cond_2

    .line 1076
    :goto_0
    return v1

    .line 1054
    :cond_2
    add-int/lit8 v3, p1, 0x40

    div-int/lit8 v3, v3, 0x40

    iget v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    add-int/lit8 v4, v4, 0x40

    add-int/lit8 v4, v4, -0x1

    div-int/lit8 v4, v4, 0x40

    sub-int v0, v3, v4

    .line 1056
    .local v0, dist:I
    add-int/lit8 v3, p1, 0x1

    iput v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 1057
    if-lez v0, :cond_4

    .line 1058
    if-le v0, v2, :cond_3

    .line 1059
    add-int/lit8 v3, v0, -0x1

    int-to-long v3, v3

    invoke-direct {p0, v1, v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->fastaddStreamOfEmptyWords(ZJ)V

    .line 1060
    :cond_3
    rem-int/lit8 v1, p1, 0x40

    shl-long v3, v7, v1

    invoke-direct {p0, v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addLiteralWord(J)V

    move v1, v2

    .line 1061
    goto :goto_0

    .line 1063
    :cond_4
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v1

    if-nez v1, :cond_5

    .line 1064
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v3

    sub-long/2addr v3, v7

    invoke-virtual {v1, v3, v4}, Lcom/googlecode/javaewah/RunningLengthWord;->setRunningLength(J)V

    .line 1065
    rem-int/lit8 v1, p1, 0x40

    shl-long v3, v7, v1

    invoke-direct {p0, v3, v4}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addLiteralWord(J)V

    move v1, v2

    .line 1066
    goto :goto_0

    .line 1068
    :cond_5
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    aget-wide v4, v1, v3

    rem-int/lit8 v6, p1, 0x40

    shl-long v6, v7, v6

    or-long/2addr v4, v6

    aput-wide v4, v1, v3

    .line 1069
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    aget-wide v3, v1, v3

    const-wide/16 v5, -0x1

    cmp-long v1, v3, v5

    if-nez v1, :cond_6

    .line 1070
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    const-wide/16 v4, 0x0

    aput-wide v4, v1, v3

    .line 1071
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 1072
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    int-to-long v3, v3

    invoke-virtual {v1, v3, v4}, Lcom/googlecode/javaewah/RunningLengthWord;->setNumberOfLiteralWords(J)V

    .line 1074
    invoke-direct {p0, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addEmptyWord(Z)V

    :cond_6
    move v1, v2

    .line 1076
    goto/16 :goto_0
.end method

.method public setSizeInBits(I)V
    .locals 2
    .parameter "size"

    .prologue
    .line 1086
    add-int/lit8 v0, p1, 0x40

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v0, v0, 0x40

    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    add-int/lit8 v1, v1, 0x40

    add-int/lit8 v1, v1, -0x1

    div-int/lit8 v1, v1, 0x40

    if-eq v0, v1, :cond_0

    .line 1087
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "You can only reduce the size of the bitmap within the scope of the last word. To extend the bitmap, please call setSizeInbits(int,boolean)."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1088
    :cond_0
    iput p1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 1089
    return-void
.end method

.method public setSizeInBits(IZ)Z
    .locals 2
    .parameter "size"
    .parameter "defaultvalue"

    .prologue
    .line 1105
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-ge p1, v0, :cond_0

    .line 1106
    const/4 v0, 0x0

    .line 1122
    :goto_0
    return v0

    .line 1107
    :cond_0
    if-nez p2, :cond_2

    .line 1108
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    invoke-static {p0, v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->extendEmptyBits(Lcom/googlecode/javaewah/BitmapStorage;II)V

    .line 1121
    :cond_1
    iput p1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 1122
    const/4 v0, 0x1

    goto :goto_0

    .line 1111
    :cond_2
    :goto_1
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    rem-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-ge v0, p1, :cond_3

    .line 1112
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    invoke-virtual {p0, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    goto :goto_1

    .line 1114
    :cond_3
    div-int/lit8 v0, p1, 0x40

    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    div-int/lit8 v1, v1, 0x40

    sub-int/2addr v0, v1

    int-to-long v0, v0

    invoke-virtual {p0, p2, v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->addStreamOfEmptyWords(ZJ)V

    .line 1117
    :goto_2
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-ge v0, p1, :cond_1

    .line 1118
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    invoke-virtual {p0, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    goto :goto_2
.end method

.method public sizeInBits()I
    .locals 1

    .prologue
    .line 1134
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    return v0
.end method

.method public sizeInBytes()I
    .locals 1

    .prologue
    .line 1145
    iget v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    mul-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public swap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 6
    .parameter "other"

    .prologue
    .line 1242
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 1243
    .local v0, tmp:[J
    iget-object v4, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iput-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 1244
    iput-object v0, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 1247
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v1, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 1248
    .local v1, tmp2:I
    iget-object v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v5, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v5, v5, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    iput v5, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 1249
    iget-object v4, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iput v1, v4, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 1251
    iget v2, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 1252
    .local v2, tmp3:I
    iget v4, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    iput v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 1253
    iput v2, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    .line 1255
    iget v3, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 1256
    .local v3, tmp4:I
    iget v4, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    iput v4, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 1257
    iput v3, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 1258
    return-void
.end method

.method public toArray()[I
    .locals 19

    .prologue
    .line 1155
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->cardinality()I

    move-result v13

    new-array v1, v13, [I

    .line 1156
    .local v1, ans:[I
    const/4 v6, 0x0

    .line 1157
    .local v6, inanspos:I
    const/4 v11, 0x0

    .line 1158
    .local v11, pos:I
    new-instance v5, Lcom/googlecode/javaewah/EWAHIterator;

    move-object/from16 v0, p0

    iget v13, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v13}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 1159
    .local v5, i:Lcom/googlecode/javaewah/EWAHIterator;
    :cond_0
    invoke-virtual {v5}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    .line 1160
    invoke-virtual {v5}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v9

    .line 1161
    .local v9, localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    invoke-virtual {v9}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 1162
    const/4 v8, 0x0

    .local v8, j:I
    :goto_0
    int-to-long v13, v8

    invoke-virtual {v9}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v15

    cmp-long v13, v13, v15

    if-gez v13, :cond_3

    .line 1163
    const/4 v2, 0x0

    .local v2, c:I
    move v12, v11

    .end local v11           #pos:I
    .local v12, pos:I
    move v7, v6

    .end local v6           #inanspos:I
    .local v7, inanspos:I
    :goto_1
    const/16 v13, 0x40

    if-ge v2, v13, :cond_1

    .line 1164
    add-int/lit8 v6, v7, 0x1

    .end local v7           #inanspos:I
    .restart local v6       #inanspos:I
    add-int/lit8 v11, v12, 0x1

    .end local v12           #pos:I
    .restart local v11       #pos:I
    aput v12, v1, v7

    .line 1163
    add-int/lit8 v2, v2, 0x1

    move v12, v11

    .end local v11           #pos:I
    .restart local v12       #pos:I
    move v7, v6

    .end local v6           #inanspos:I
    .restart local v7       #inanspos:I
    goto :goto_1

    .line 1162
    :cond_1
    add-int/lit8 v8, v8, 0x1

    move v11, v12

    .end local v12           #pos:I
    .restart local v11       #pos:I
    move v6, v7

    .end local v7           #inanspos:I
    .restart local v6       #inanspos:I
    goto :goto_0

    .line 1168
    .end local v2           #c:I
    .end local v8           #j:I
    :cond_2
    int-to-long v13, v11

    const-wide/16 v15, 0x40

    invoke-virtual {v9}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v17

    mul-long v15, v15, v17

    add-long/2addr v13, v15

    long-to-int v11, v13

    .line 1170
    :cond_3
    const/4 v8, 0x0

    .restart local v8       #j:I
    :goto_2
    invoke-virtual {v9}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v13

    if-ge v8, v13, :cond_0

    .line 1171
    invoke-virtual {v5}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v13

    invoke-virtual {v5}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v14

    add-int/2addr v14, v8

    aget-wide v3, v13, v14

    .local v3, data:J
    move v7, v6

    .line 1179
    .end local v6           #inanspos:I
    .restart local v7       #inanspos:I
    :goto_3
    const-wide/16 v13, 0x0

    cmp-long v13, v3, v13

    if-eqz v13, :cond_4

    .line 1180
    invoke-static {v3, v4}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v10

    .line 1181
    .local v10, ntz:I
    const-wide/16 v13, 0x1

    shl-long/2addr v13, v10

    xor-long/2addr v3, v13

    .line 1182
    add-int/lit8 v6, v7, 0x1

    .end local v7           #inanspos:I
    .restart local v6       #inanspos:I
    add-int v13, v10, v11

    aput v13, v1, v7

    move v7, v6

    .line 1183
    .end local v6           #inanspos:I
    .restart local v7       #inanspos:I
    goto :goto_3

    .line 1184
    .end local v10           #ntz:I
    :cond_4
    add-int/lit8 v11, v11, 0x40

    .line 1170
    add-int/lit8 v8, v8, 0x1

    move v6, v7

    .end local v7           #inanspos:I
    .restart local v6       #inanspos:I
    goto :goto_2

    .line 1188
    .end local v3           #data:J
    .end local v8           #j:I
    .end local v9           #localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    :cond_5
    return-object v1
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 9

    .prologue
    .line 1198
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " EWAHCompressedBitmap, size in bits = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " size in words = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1200
    .local v0, ans:Ljava/lang/String;
    new-instance v3, Lcom/googlecode/javaewah/EWAHIterator;

    iget v6, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-direct {v3, p0, v6}, Lcom/googlecode/javaewah/EWAHIterator;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 1201
    .local v3, i:Lcom/googlecode/javaewah/EWAHIterator;
    :cond_0
    invoke-virtual {v3}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1202
    invoke-virtual {v3}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v5

    .line 1203
    .local v5, localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    invoke-virtual {v5}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1204
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " 1x11\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1208
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " dirties\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1209
    const/4 v4, 0x0

    .local v4, j:I
    :goto_1
    invoke-virtual {v5}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v6

    if-ge v4, v6, :cond_0

    .line 1210
    invoke-virtual {v3}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v6

    invoke-virtual {v3}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v7

    add-int/2addr v7, v4

    aget-wide v1, v6, v7

    .line 1211
    .local v1, data:J
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\t"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1209
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1206
    .end local v1           #data:J
    .end local v4           #j:I
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " 0x00\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1214
    .end local v5           #localrlw:Lcom/googlecode/javaewah/RunningLengthWord;
    :cond_2
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1224
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1225
    .local v0, answer:Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v1

    .line 1226
    .local v1, i:Lcom/googlecode/javaewah/IntIterator;
    const-string v2, "{"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1227
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1228
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 1229
    :cond_0
    :goto_0
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1230
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1231
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1233
    :cond_1
    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1234
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public trim()V
    .locals 2

    .prologue
    .line 1265
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    .line 1266
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 0
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1273
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->serialize(Ljava/io/DataOutput;)V

    .line 1274
    return-void
.end method

.method public xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 3
    .parameter "a"

    .prologue
    .line 1292
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 1293
    .local v0, container:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v1, p0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->actualsizeinwords:I

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->reserve(I)Z

    .line 1294
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xorToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1295
    return-object v0
.end method

.method public bridge synthetic xor(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    check-cast p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    return-object v0
.end method

.method public xorCardinality(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 1361
    new-instance v0, Lcom/googlecode/javaewah/BitCounter;

    invoke-direct {v0}, Lcom/googlecode/javaewah/BitCounter;-><init>()V

    .line 1362
    .local v0, counter:Lcom/googlecode/javaewah/BitCounter;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xorToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1363
    invoke-virtual {v0}, Lcom/googlecode/javaewah/BitCounter;->getCount()I

    move-result v1

    return v1
.end method

.method public xorToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 21
    .parameter "a"
    .parameter "container"

    .prologue
    .line 1312
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v4

    .line 1313
    .local v4, i:Lcom/googlecode/javaewah/EWAHIterator;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v9

    .line 1314
    .local v9, j:Lcom/googlecode/javaewah/EWAHIterator;
    new-instance v15, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v15, v4}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 1315
    .local v15, rlwi:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    new-instance v16, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-object/from16 v0, v16

    invoke-direct {v0, v9}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    .line 1316
    .local v16, rlwj:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_0
    :goto_0
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_8

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_8

    .line 1317
    :goto_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-gtz v17, :cond_1

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_6

    .line 1318
    :cond_1
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v19

    cmp-long v17, v17, v19

    if-gez v17, :cond_2

    const/4 v5, 0x1

    .line 1320
    .local v5, i_is_prey:Z
    :goto_2
    if-eqz v5, :cond_3

    move-object v13, v15

    .line 1321
    .local v13, prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_3
    if-eqz v5, :cond_4

    move-object/from16 v12, v16

    .line 1323
    .local v12, predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_4
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v17

    if-nez v17, :cond_5

    .line 1324
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-virtual {v13, v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;J)J

    move-result-wide v7

    .line 1325
    .local v7, index:J
    const/16 v17, 0x0

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    sub-long v18, v18, v7

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 1327
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto :goto_1

    .line 1318
    .end local v5           #i_is_prey:Z
    .end local v7           #index:J
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_2
    const/4 v5, 0x0

    goto :goto_2

    .restart local v5       #i_is_prey:Z
    :cond_3
    move-object/from16 v13, v16

    .line 1320
    goto :goto_3

    .restart local v13       #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_4
    move-object v12, v15

    .line 1321
    goto :goto_4

    .line 1329
    .restart local v12       #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_5
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-virtual {v13, v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->dischargeNegated(Lcom/googlecode/javaewah/BitmapStorage;J)J

    move-result-wide v7

    .line 1330
    .restart local v7       #index:J
    const/16 v17, 0x1

    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v18

    sub-long v18, v18, v7

    move-object/from16 v0, p2

    move/from16 v1, v17

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 1332
    invoke-virtual {v12}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v12, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_1

    .line 1335
    .end local v5           #i_is_prey:Z
    .end local v7           #index:J
    .end local v12           #predator:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v13           #prey:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_6
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v17

    invoke-virtual/range {v16 .. v16}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 1337
    .local v11, nbre_literal:I
    if-lez v11, :cond_0

    .line 1338
    const/4 v10, 0x0

    .local v10, k:I
    :goto_5
    if-ge v10, v11, :cond_7

    .line 1339
    invoke-virtual {v15, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v17

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v19

    xor-long v17, v17, v19

    move-object/from16 v0, p2

    move-wide/from16 v1, v17

    invoke-interface {v0, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 1338
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 1340
    :cond_7
    int-to-long v0, v11

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    invoke-virtual {v15, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 1341
    int-to-long v0, v11

    move-wide/from16 v17, v0

    invoke-virtual/range {v16 .. v18}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto/16 :goto_0

    .line 1344
    .end local v10           #k:I
    .end local v11           #nbre_literal:I
    :cond_8
    invoke-virtual {v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-lez v17, :cond_9

    const/4 v6, 0x1

    .line 1345
    .local v6, i_remains:Z
    :goto_6
    if-eqz v6, :cond_a

    move-object v14, v15

    .line 1346
    .local v14, remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 1347
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v17

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v17

    move-object/from16 v0, p2

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    .line 1348
    return-void

    .line 1344
    .end local v6           #i_remains:Z
    .end local v14           #remaining:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_9
    const/4 v6, 0x0

    goto :goto_6

    .restart local v6       #i_remains:Z
    :cond_a
    move-object/from16 v14, v16

    .line 1345
    goto :goto_7
.end method
