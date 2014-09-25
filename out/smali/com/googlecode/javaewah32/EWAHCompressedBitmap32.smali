.class public final Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
.super Ljava/lang/Object;
.source "EWAHCompressedBitmap32.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Externalizable;
.implements Ljava/lang/Iterable;
.implements Lcom/googlecode/javaewah32/BitmapStorage32;
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
        "Lcom/googlecode/javaewah32/BitmapStorage32;",
        "Lcom/googlecode/javaewah/LogicalElement",
        "<",
        "Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;",
        ">;"
    }
.end annotation


# static fields
.field public static final adjustContainerSizeWhenAggregating:Z = true

.field static final defaultbuffersize:I = 0x4

.field public static final usetrailingzeros:Z = true

.field public static final wordinbits:I = 0x20


# instance fields
.field actualsizeinwords:I

.field buffer:[I

.field rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

.field sizeinbits:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1582
    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 1585
    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 1588
    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 1591
    iput v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 54
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 55
    new-instance v0, Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-direct {v0, p0, v1}, Lcom/googlecode/javaewah32/RunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    iput-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 56
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .parameter "buffersize"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1582
    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 1585
    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 1588
    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 1591
    iput v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 67
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 68
    new-instance v0, Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-direct {v0, p0, v1}, Lcom/googlecode/javaewah32/RunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    iput-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 69
    return-void
.end method

.method private addEmptyWord(Z)I
    .locals 5
    .parameter "v"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 116
    iget-object v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v4

    if-nez v4, :cond_1

    move v0, v2

    .line 117
    .local v0, noliteralword:Z
    :goto_0
    iget-object v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v1

    .line 118
    .local v1, runlen:I
    if-eqz v0, :cond_0

    if-nez v1, :cond_0

    .line 119
    iget-object v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v4, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 121
    :cond_0
    if-eqz v0, :cond_2

    iget-object v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v4

    if-ne v4, p1, :cond_2

    const v4, 0xffff

    if-ge v1, v4, :cond_2

    .line 123
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v2, v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 130
    :goto_1
    return v3

    .end local v0           #noliteralword:Z
    .end local v1           #runlen:I
    :cond_1
    move v0, v3

    .line 116
    goto :goto_0

    .line 126
    .restart local v0       #noliteralword:Z
    .restart local v1       #runlen:I
    :cond_2
    invoke-direct {p0, v3}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 127
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 128
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v3, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 129
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v3, v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    move v3, v2

    .line 130
    goto :goto_1
.end method

.method private addLiteralWord(I)I
    .locals 4
    .parameter "newdata"

    .prologue
    const/4 v1, 0x1

    .line 141
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v0

    .line 142
    .local v0, numbersofar:I
    const/16 v2, 0x7fff

    if-lt v0, v2, :cond_0

    .line 143
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 144
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 145
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, v1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setNumberOfLiteralWords(I)V

    .line 146
    invoke-direct {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 147
    const/4 v1, 0x2

    .line 151
    :goto_0
    return v1

    .line 149
    :cond_0
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setNumberOfLiteralWords(I)V

    .line 150
    invoke-direct {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    goto :goto_0
.end method

.method public static varargs and([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 7
    .parameter "bitmaps"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1392
    array-length v3, p0

    if-ne v3, v6, :cond_1

    aget-object v0, p0, v5

    .line 1402
    :cond_0
    :goto_0
    return-object v0

    .line 1393
    :cond_1
    array-length v3, p0

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    aget-object v3, p0, v5

    aget-object v4, p0, v6

    invoke-virtual {v3, v4}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v0

    goto :goto_0

    .line 1394
    :cond_2
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1395
    .local v0, answer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    new-instance v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1396
    .local v2, tmp:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    aget-object v3, p0, v5

    aget-object v4, p0, v6

    invoke-virtual {v3, v4, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1397
    const/4 v1, 0x2

    .local v1, k:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 1398
    aget-object v3, p0, v1

    invoke-virtual {v0, v3, v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1399
    invoke-virtual {v2, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->swap(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 1400
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clear()V

    .line 1397
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static varargs andCardinality([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I
    .locals 3
    .parameter "bitmaps"

    .prologue
    .line 1415
    array-length v1, p0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->cardinality()I

    move-result v1

    .line 1418
    :goto_0
    return v1

    .line 1416
    :cond_0
    new-instance v0, Lcom/googlecode/javaewah32/BitCounter32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/BitCounter32;-><init>()V

    .line 1417
    .local v0, counter:Lcom/googlecode/javaewah32/BitCounter32;
    invoke-static {v0, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 1418
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BitCounter32;->getCount()I

    move-result v1

    goto :goto_0
.end method

.method public static varargs andWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 7
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 1359
    array-length v3, p1

    if-ne v3, v5, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Need at least one bitmap"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1360
    :cond_0
    array-length v3, p1

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 1361
    aget-object v3, p1, v6

    aget-object v4, p1, v5

    invoke-virtual {v3, v4, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1373
    :goto_0
    return-void

    .line 1364
    :cond_1
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1365
    .local v0, answer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    new-instance v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1366
    .local v2, tmp:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    aget-object v3, p1, v6

    aget-object v4, p1, v5

    invoke-virtual {v3, v4, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1367
    const/4 v1, 0x2

    .local v1, k:I
    :goto_1
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_2

    .line 1368
    aget-object v3, p1, v1

    invoke-virtual {v0, v3, v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1369
    invoke-virtual {v2, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->swap(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 1370
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clear()V

    .line 1367
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1372
    :cond_2
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    aget-object v3, p1, v3

    invoke-virtual {v0, v3, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    goto :goto_0
.end method

.method public static varargs bitmapOf([I)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 5
    .parameter "setbits"

    .prologue
    .line 1433
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1434
    .local v0, a:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    move-object v1, p0

    .local v1, arr$:[I
    array-length v4, v1

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v4, :cond_0

    aget v3, v1, v2

    .line 1435
    .local v3, k:I
    invoke-virtual {v0, v3}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->set(I)Z

    .line 1434
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1436
    .end local v3           #k:I
    :cond_0
    return-object v0
.end method

.method private static extendEmptyBits(Lcom/googlecode/javaewah32/BitmapStorage32;II)V
    .locals 5
    .parameter "storage"
    .parameter "currentSize"
    .parameter "newSize"

    .prologue
    const/4 v3, 0x0

    .line 1455
    rem-int/lit8 v0, p1, 0x20

    .line 1456
    .local v0, currentLeftover:I
    rem-int/lit8 v1, p2, 0x20

    .line 1457
    .local v1, finalLeftover:I
    div-int/lit8 v2, p2, 0x20

    div-int/lit8 v4, p1, 0x20

    sub-int v4, v2, v4

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    add-int/2addr v4, v2

    if-eqz v0, :cond_1

    const/4 v2, -0x1

    :goto_1
    add-int/2addr v2, v4

    invoke-interface {p0, v3, v2}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 1460
    return-void

    :cond_0
    move v2, v3

    .line 1457
    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1
.end method

.method private fastaddStreamOfEmptyWords(ZI)V
    .locals 6
    .parameter "v"
    .parameter "number"

    .prologue
    const/4 v5, 0x0

    const v4, 0xffff

    .line 565
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v2

    if-eq v2, p1, :cond_2

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 566
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 574
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v0

    .line 575
    .local v0, runlen:I
    sub-int v2, v4, v0

    if-ge p2, v2, :cond_4

    move v1, p2

    .line 578
    .local v1, whatwecanadd:I
    :goto_1
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    add-int v3, v0, v1

    invoke-virtual {v2, v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 579
    sub-int/2addr p2, v1

    .line 580
    :goto_2
    if-lt p2, v4, :cond_5

    .line 581
    invoke-direct {p0, v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 582
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 583
    if-eqz p1, :cond_1

    .line 584
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 585
    :cond_1
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 586
    sub-int/2addr p2, v4

    goto :goto_2

    .line 567
    .end local v0           #runlen:I
    .end local v1           #whatwecanadd:I
    :cond_2
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v2

    if-eq v2, p1, :cond_0

    .line 569
    :cond_3
    invoke-direct {p0, v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 570
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 571
    if-eqz p1, :cond_0

    .line 572
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    goto :goto_0

    .line 575
    .restart local v0       #runlen:I
    :cond_4
    sub-int v1, v4, v0

    goto :goto_1

    .line 588
    .restart local v1       #whatwecanadd:I
    :cond_5
    if-lez p2, :cond_7

    .line 589
    invoke-direct {p0, v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 590
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 591
    if-eqz p1, :cond_6

    .line 592
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 593
    :cond_6
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 595
    :cond_7
    return-void
.end method

.method private negative_push_back([III)V
    .locals 5
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    const/4 v4, 0x0

    .line 746
    :goto_0
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v2, p3

    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v3, v3

    if-lt v2, v3, :cond_2

    .line 747
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 748
    .local v1, oldbuffer:[I
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v2, p3

    const v3, 0x8000

    if-ge v2, v3, :cond_0

    .line 749
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v2, p3

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 754
    :goto_1
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v3, v1

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 755
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v2, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iput-object v3, v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    goto :goto_0

    .line 750
    :cond_0
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v2, p3

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v3, p3

    if-ge v2, v3, :cond_1

    .line 751
    const v2, 0x7fffffff

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    goto :goto_1

    .line 753
    :cond_1
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v2, p3

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    goto :goto_1

    .line 757
    .end local v1           #oldbuffer:[I
    :cond_2
    const/4 v0, 0x0

    .local v0, k:I
    :goto_2
    if-ge v0, p3, :cond_3

    .line 758
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v3, v0

    add-int v4, p2, v0

    aget v4, p1, v4

    xor-int/lit8 v4, v4, -0x1

    aput v4, v2, v3

    .line 757
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 759
    :cond_3
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v2, p3

    iput v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 760
    return-void
.end method

.method public static varargs or([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 10
    .parameter "bitmaps"

    .prologue
    .line 1526
    array-length v6, p0

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    const/4 v6, 0x0

    aget-object v2, p0, v6

    .line 1534
    :goto_0
    return-object v2

    .line 1527
    :cond_0
    new-instance v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1528
    .local v2, container:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/4 v4, 0x0

    .line 1529
    .local v4, largestSize:I
    move-object v0, p0

    .local v0, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v5, :cond_1

    aget-object v1, v0, v3

    .line 1530
    .local v1, bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v6, v1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1529
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1532
    .end local v1           #bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_1
    int-to-double v6, v4

    const-wide/high16 v8, 0x3ff8

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-direct {v2, v6}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->reserve(I)Z

    .line 1533
    invoke-static {v2, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->orWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    goto :goto_0
.end method

.method public static varargs orCardinality([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I
    .locals 3
    .parameter "bitmaps"

    .prologue
    .line 1575
    array-length v1, p0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->cardinality()I

    move-result v1

    .line 1578
    :goto_0
    return v1

    .line 1576
    :cond_0
    new-instance v0, Lcom/googlecode/javaewah32/BitCounter32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/BitCounter32;-><init>()V

    .line 1577
    .local v0, counter:Lcom/googlecode/javaewah32/BitCounter32;
    invoke-static {v0, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->orWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 1578
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BitCounter32;->getCount()I

    move-result v1

    goto :goto_0
.end method

.method public static varargs orWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 9
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    .line 1470
    array-length v6, p1

    const/4 v7, 0x2

    if-ge v6, v7, :cond_0

    .line 1471
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "You should provide at least two bitmaps, provided "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    array-length v8, p1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1472
    :cond_0
    const/4 v5, 0x0

    .line 1473
    .local v5, size:I
    const/4 v4, 0x0

    .line 1474
    .local v4, sinbits:I
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 1475
    .local v1, b:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBytes()I

    move-result v6

    add-int/2addr v5, v6

    .line 1476
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v6

    if-ge v4, v6, :cond_1

    .line 1477
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v4

    .line 1474
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1479
    .end local v1           #b:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_2
    mul-int/lit8 v6, v5, 0x8

    if-le v6, v4, :cond_3

    .line 1480
    const/high16 v6, 0x1

    invoke-static {p0, v6, p1}, Lcom/googlecode/javaewah32/FastAggregation32;->bufferedorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 1484
    :goto_1
    return-void

    .line 1482
    :cond_3
    invoke-static {p0, p1}, Lcom/googlecode/javaewah32/FastAggregation32;->orToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    goto :goto_1
.end method

.method private push_back(I)V
    .locals 4
    .parameter "data"

    .prologue
    const/4 v3, 0x0

    .line 894
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 895
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 896
    .local v0, oldbuffer:[I
    array-length v1, v0

    const v2, 0x8000

    if-ge v1, v2, :cond_1

    .line 897
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 902
    :goto_0
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 903
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v1, v1, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iput-object v2, v1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 905
    .end local v0           #oldbuffer:[I
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    aput p1, v1, v2

    .line 906
    return-void

    .line 898
    .restart local v0       #oldbuffer:[I
    :cond_1
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    array-length v2, v0

    if-ge v1, v2, :cond_2

    .line 899
    const v1, 0x7fffffff

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    goto :goto_0

    .line 901
    :cond_2
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    goto :goto_0
.end method

.method private push_back([III)V
    .locals 4
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    const/4 v3, 0x0

    .line 919
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, p3

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v2, v2

    if-lt v1, v2, :cond_0

    .line 920
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 921
    .local v0, oldbuffer:[I
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, p3

    const v2, 0x8000

    if-ge v1, v2, :cond_1

    .line 922
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, p3

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 927
    :goto_0
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 928
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v1, v1, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iput-object v2, v1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 930
    .end local v0           #oldbuffer:[I
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 931
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, p3

    iput v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 932
    return-void

    .line 923
    .restart local v0       #oldbuffer:[I
    :cond_1
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, p3

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v2, p3

    if-ge v1, v2, :cond_2

    .line 924
    const v1, 0x7fffffff

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    goto :goto_0

    .line 926
    :cond_2
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, p3

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    goto :goto_0
.end method

.method private reserve(I)Z
    .locals 4
    .parameter "size"

    .prologue
    const/4 v1, 0x0

    .line 950
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v2, v2

    if-le p1, v2, :cond_0

    .line 951
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 952
    .local v0, oldbuffer:[I
    new-array v2, p1, [I

    iput-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 953
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v3, v0

    invoke-static {v0, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 954
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v1, v1, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iput-object v2, v1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 955
    const/4 v1, 0x1

    .line 957
    .end local v0           #oldbuffer:[I
    :cond_0
    return v1
.end method

.method public static varargs xor([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 10
    .parameter "bitmaps"

    .prologue
    .line 1554
    array-length v6, p0

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    const/4 v6, 0x0

    aget-object v2, p0, v6

    .line 1562
    :goto_0
    return-object v2

    .line 1555
    :cond_0
    new-instance v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1556
    .local v2, container:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/4 v4, 0x0

    .line 1557
    .local v4, largestSize:I
    move-object v0, p0

    .local v0, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v5, :cond_1

    aget-object v1, v0, v3

    .line 1558
    .local v1, bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v6, v1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1557
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1560
    .end local v1           #bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_1
    int-to-double v6, v4

    const-wide/high16 v8, 0x3ff8

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-direct {v2, v6}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->reserve(I)Z

    .line 1561
    invoke-static {v2, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->xorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    goto :goto_0
.end method

.method public static varargs xorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 9
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    .line 1494
    array-length v6, p1

    const/4 v7, 0x2

    if-ge v6, v7, :cond_0

    .line 1495
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "You should provide at least two bitmaps, provided "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    array-length v8, p1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1496
    :cond_0
    const/4 v5, 0x0

    .line 1497
    .local v5, size:I
    const/4 v4, 0x0

    .line 1498
    .local v4, sinbits:I
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 1499
    .local v1, b:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBytes()I

    move-result v6

    add-int/2addr v5, v6

    .line 1500
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v6

    if-ge v4, v6, :cond_1

    .line 1501
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v4

    .line 1498
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1503
    .end local v1           #b:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_2
    mul-int/lit8 v6, v5, 0x8

    if-le v6, v4, :cond_3

    .line 1504
    const/high16 v6, 0x1

    invoke-static {p0, v6, p1}, Lcom/googlecode/javaewah32/FastAggregation32;->bufferedxorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 1508
    :goto_1
    return-void

    .line 1506
    :cond_3
    invoke-static {p0, p1}, Lcom/googlecode/javaewah32/FastAggregation32;->xorToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    goto :goto_1
.end method


# virtual methods
.method public add(I)V
    .locals 1
    .parameter "newdata"

    .prologue
    .line 86
    const/16 v0, 0x20

    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->add(II)V

    .line 87
    return-void
.end method

.method public add(II)V
    .locals 1
    .parameter "newdata"
    .parameter "bitsthatmatter"

    .prologue
    .line 98
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 99
    if-nez p1, :cond_0

    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addEmptyWord(Z)I

    .line 106
    :goto_0
    return-void

    .line 101
    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    .line 102
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addEmptyWord(Z)I

    goto :goto_0

    .line 104
    :cond_1
    invoke-direct {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addLiteralWord(I)I

    goto :goto_0
.end method

.method public addStreamOfEmptyWords(ZI)V
    .locals 6
    .parameter "v"
    .parameter "number"

    .prologue
    const/4 v5, 0x0

    const v4, 0xffff

    .line 198
    if-nez p2, :cond_1

    .line 231
    :cond_0
    :goto_0
    return-void

    .line 200
    :cond_1
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    mul-int/lit8 v3, p2, 0x20

    add-int/2addr v2, v3

    iput v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 201
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v2

    if-eq v2, p1, :cond_4

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 202
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 210
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v0

    .line 211
    .local v0, runlen:I
    sub-int v2, v4, v0

    if-ge p2, v2, :cond_6

    move v1, p2

    .line 214
    .local v1, whatwecanadd:I
    :goto_2
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    add-int v3, v0, v1

    invoke-virtual {v2, v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 215
    sub-int/2addr p2, v1

    .line 216
    :goto_3
    if-lt p2, v4, :cond_7

    .line 217
    invoke-direct {p0, v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 218
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 219
    if-eqz p1, :cond_3

    .line 220
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 221
    :cond_3
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 222
    sub-int/2addr p2, v4

    goto :goto_3

    .line 203
    .end local v0           #runlen:I
    .end local v1           #whatwecanadd:I
    :cond_4
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v2

    if-eq v2, p1, :cond_2

    .line 205
    :cond_5
    invoke-direct {p0, v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 206
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 207
    if-eqz p1, :cond_2

    .line 208
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    goto :goto_1

    .line 211
    .restart local v0       #runlen:I
    :cond_6
    sub-int v1, v4, v0

    goto :goto_2

    .line 224
    .restart local v1       #whatwecanadd:I
    :cond_7
    if-lez p2, :cond_0

    .line 225
    invoke-direct {p0, v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 226
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 227
    if-eqz p1, :cond_8

    .line 228
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 229
    :cond_8
    iget-object v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v2, p2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    goto/16 :goto_0
.end method

.method public addStreamOfLiteralWords([III)V
    .locals 5
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 168
    move v1, p3

    .line 169
    .local v1, leftovernumber:I
    :cond_0
    :goto_0
    if-lez v1, :cond_2

    .line 170
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v0

    .line 171
    .local v0, NumberOfLiteralWords:I
    rsub-int v3, v0, 0x7fff

    if-ge v1, v3, :cond_1

    move v2, v1

    .line 175
    .local v2, whatwecanadd:I
    :goto_1
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    add-int v4, v0, v2

    invoke-virtual {v3, v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setNumberOfLiteralWords(I)V

    .line 177
    sub-int/2addr v1, v2

    .line 178
    invoke-direct {p0, p1, p2, v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back([III)V

    .line 179
    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    mul-int/lit8 v4, v2, 0x20

    add-int/2addr v3, v4

    iput v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 180
    if-lez v1, :cond_0

    .line 181
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 182
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    goto :goto_0

    .line 171
    .end local v2           #whatwecanadd:I
    :cond_1
    rsub-int v2, v0, 0x7fff

    goto :goto_1

    .line 185
    .end local v0           #NumberOfLiteralWords:I
    :cond_2
    return-void
.end method

.method public addStreamOfNegatedLiteralWords([III)V
    .locals 5
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 246
    move v1, p3

    .line 247
    .local v1, leftovernumber:I
    :cond_0
    :goto_0
    if-lez v1, :cond_2

    .line 248
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v0

    .line 249
    .local v0, NumberOfLiteralWords:I
    rsub-int v3, v0, 0x7fff

    if-ge v1, v3, :cond_1

    move v2, v1

    .line 253
    .local v2, whatwecanadd:I
    :goto_1
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    add-int v4, v0, v2

    invoke-virtual {v3, v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setNumberOfLiteralWords(I)V

    .line 255
    sub-int/2addr v1, v2

    .line 256
    invoke-direct {p0, p1, p2, v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->negative_push_back([III)V

    .line 257
    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    mul-int/lit8 v4, v2, 0x20

    add-int/2addr v3, v4

    iput v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 258
    if-lez v1, :cond_0

    .line 259
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->push_back(I)V

    .line 260
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    goto :goto_0

    .line 249
    .end local v2           #whatwecanadd:I
    :cond_1
    rsub-int v2, v0, 0x7fff

    goto :goto_1

    .line 263
    .end local v0           #NumberOfLiteralWords:I
    :cond_2
    return-void
.end method

.method public and(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 3
    .parameter "a"

    .prologue
    .line 281
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 282
    .local v0, container:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    if-le v1, v2, :cond_0

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    :goto_0
    invoke-direct {v0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->reserve(I)Z

    .line 285
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 286
    return-object v0

    .line 282
    :cond_0
    iget v1, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    goto :goto_0
.end method

.method public bridge synthetic and(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    check-cast p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v0

    return-object v0
.end method

.method public andCardinality(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 367
    new-instance v0, Lcom/googlecode/javaewah32/BitCounter32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/BitCounter32;-><init>()V

    .line 368
    .local v0, counter:Lcom/googlecode/javaewah32/BitCounter32;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 369
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BitCounter32;->getCount()I

    move-result v1

    return v1
.end method

.method public andNot(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 3
    .parameter "a"

    .prologue
    .line 388
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 389
    .local v0, container:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    if-le v1, v2, :cond_0

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    :goto_0
    invoke-direct {v0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->reserve(I)Z

    .line 392
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andNotToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 393
    return-object v0

    .line 389
    :cond_0
    iget v1, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    goto :goto_0
.end method

.method public bridge synthetic andNot(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    check-cast p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andNot(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v0

    return-object v0
.end method

.method public andNotCardinality(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 466
    new-instance v0, Lcom/googlecode/javaewah32/BitCounter32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/BitCounter32;-><init>()V

    .line 467
    .local v0, counter:Lcom/googlecode/javaewah32/BitCounter32;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andNotToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 468
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BitCounter32;->getCount()I

    move-result v1

    return v1
.end method

.method public andNotToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 15
    .parameter "a"
    .parameter "container"

    .prologue
    .line 408
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v1

    .line 409
    .local v1, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v5

    .line 410
    .local v5, j:Lcom/googlecode/javaewah32/EWAHIterator32;
    new-instance v11, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v11, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 411
    .local v11, rlwi:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    new-instance v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v12, v5}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 412
    .local v12, rlwj:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_0
    :goto_0
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_b

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_b

    .line 413
    :goto_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-gtz v13, :cond_1

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-lez v13, :cond_9

    .line 414
    :cond_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    if-ge v13, v14, :cond_4

    const/4 v2, 0x1

    .line 416
    .local v2, i_is_prey:Z
    :goto_2
    if-eqz v2, :cond_5

    move-object v9, v11

    .line 417
    .local v9, prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_3
    if-eqz v2, :cond_6

    move-object v8, v12

    .line 419
    .local v8, predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_4
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_2

    if-nez v2, :cond_3

    :cond_2
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v13

    if-nez v13, :cond_7

    if-nez v2, :cond_7

    .line 421
    :cond_3
    const/4 v13, 0x0

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 422
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v9, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 423
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 414
    .end local v2           #i_is_prey:Z
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_4
    const/4 v2, 0x0

    goto :goto_2

    .restart local v2       #i_is_prey:Z
    :cond_5
    move-object v9, v12

    .line 416
    goto :goto_3

    .restart local v9       #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_6
    move-object v8, v11

    .line 417
    goto :goto_4

    .line 424
    .restart local v8       #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_7
    if-eqz v2, :cond_8

    .line 425
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    move-object/from16 v0, p2

    invoke-virtual {v9, v0, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;I)I

    move-result v4

    .line 426
    .local v4, index:I
    const/4 v13, 0x0

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    sub-int/2addr v14, v4

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 428
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 430
    .end local v4           #index:I
    :cond_8
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    move-object/from16 v0, p2

    invoke-virtual {v9, v0, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->dischargeNegated(Lcom/googlecode/javaewah32/BitmapStorage32;I)I

    move-result v4

    .line 431
    .restart local v4       #index:I
    const/4 v13, 0x1

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    sub-int/2addr v14, v4

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 433
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto/16 :goto_1

    .line 436
    .end local v2           #i_is_prey:Z
    .end local v4           #index:I
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_9
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 438
    .local v7, nbre_literal:I
    if-lez v7, :cond_0

    .line 439
    const/4 v6, 0x0

    .local v6, k:I
    :goto_5
    if-ge v6, v7, :cond_a

    .line 440
    invoke-virtual {v11, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v13

    invoke-virtual {v12, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v14

    xor-int/lit8 v14, v14, -0x1

    and-int/2addr v13, v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 439
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 441
    :cond_a
    invoke-virtual {v11, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 442
    invoke-virtual {v12, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto/16 :goto_0

    .line 445
    .end local v6           #k:I
    .end local v7           #nbre_literal:I
    :cond_b
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_c

    const/4 v3, 0x1

    .line 446
    .local v3, i_remains:Z
    :goto_6
    if-eqz v3, :cond_d

    move-object v10, v11

    .line 447
    .local v10, remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_7
    if-eqz v3, :cond_e

    .line 448
    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 452
    :goto_8
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v13

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    .line 454
    return-void

    .line 445
    .end local v3           #i_remains:Z
    .end local v10           #remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_c
    const/4 v3, 0x0

    goto :goto_6

    .restart local v3       #i_remains:Z
    :cond_d
    move-object v10, v12

    .line 446
    goto :goto_7

    .line 450
    .restart local v10       #remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_e
    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->dischargeAsEmpty(Lcom/googlecode/javaewah32/BitmapStorage32;)V

    goto :goto_8
.end method

.method public andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 15
    .parameter "a"
    .parameter "container"

    .prologue
    .line 315
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v1

    .line 316
    .local v1, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v5

    .line 317
    .local v5, j:Lcom/googlecode/javaewah32/EWAHIterator32;
    new-instance v11, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v11, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 318
    .local v11, rlwi:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    new-instance v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v12, v5}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 319
    .local v12, rlwj:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_0
    :goto_0
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_8

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_8

    .line 320
    :goto_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-gtz v13, :cond_1

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-lez v13, :cond_6

    .line 321
    :cond_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    if-ge v13, v14, :cond_2

    const/4 v2, 0x1

    .line 323
    .local v2, i_is_prey:Z
    :goto_2
    if-eqz v2, :cond_3

    move-object v9, v11

    .line 325
    .local v9, prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_3
    if-eqz v2, :cond_4

    move-object v8, v12

    .line 327
    .local v8, predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_4
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v13

    if-nez v13, :cond_5

    .line 328
    const/4 v13, 0x0

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 329
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v9, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 330
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 321
    .end local v2           #i_is_prey:Z
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_2
    const/4 v2, 0x0

    goto :goto_2

    .restart local v2       #i_is_prey:Z
    :cond_3
    move-object v9, v12

    .line 323
    goto :goto_3

    .restart local v9       #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_4
    move-object v8, v11

    .line 325
    goto :goto_4

    .line 332
    .restart local v8       #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_5
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    move-object/from16 v0, p2

    invoke-virtual {v9, v0, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;I)I

    move-result v4

    .line 333
    .local v4, index:I
    const/4 v13, 0x0

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    sub-int/2addr v14, v4

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 335
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 338
    .end local v2           #i_is_prey:Z
    .end local v4           #index:I
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_6
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 340
    .local v7, nbre_literal:I
    if-lez v7, :cond_0

    .line 341
    const/4 v6, 0x0

    .local v6, k:I
    :goto_5
    if-ge v6, v7, :cond_7

    .line 342
    invoke-virtual {v11, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v13

    invoke-virtual {v12, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v14

    and-int/2addr v13, v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 341
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 343
    :cond_7
    invoke-virtual {v11, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 344
    invoke-virtual {v12, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto/16 :goto_0

    .line 348
    .end local v6           #k:I
    .end local v7           #nbre_literal:I
    :cond_8
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_9

    const/4 v3, 0x1

    .line 349
    .local v3, i_remains:Z
    :goto_6
    if-eqz v3, :cond_a

    move-object v10, v11

    .line 351
    .local v10, remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->dischargeAsEmpty(Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 352
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v13

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    .line 354
    return-void

    .line 348
    .end local v3           #i_remains:Z
    .end local v10           #remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_9
    const/4 v3, 0x0

    goto :goto_6

    .restart local v3       #i_remains:Z
    :cond_a
    move-object v10, v12

    .line 349
    goto :goto_7
.end method

.method public cardinality()I
    .locals 6

    .prologue
    .line 478
    const/4 v0, 0x0

    .line 479
    .local v0, counter:I
    new-instance v1, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v1, p0, v4}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    .line 481
    .local v1, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    :cond_0
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 482
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v3

    .line 483
    .local v3, localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 484
    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v4

    mul-int/lit8 v4, v4, 0x20

    add-int/2addr v0, v4

    .line 486
    :cond_1
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 487
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v4

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v5

    add-int/2addr v5, v2

    aget v4, v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->bitCount(I)I

    move-result v4

    add-int/2addr v0, v4

    .line 486
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 490
    .end local v2           #j:I
    .end local v3           #localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    :cond_2
    return v0
.end method

.method public clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 497
    iput v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 498
    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 499
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iput v1, v0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 502
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    aput v1, v0, v1

    .line 503
    return-void
.end method

.method public clone()Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 510
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 511
    .local v0, clone:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 512
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    iput v1, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 513
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    iput v1, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 514
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
    .line 47
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clone()Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Ljava/io/DataInput;)V
    .locals 3
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 526
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v1

    iput v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 527
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v1

    iput v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 528
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    array-length v1, v1

    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    if-ge v1, v2, :cond_0

    .line 529
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 531
    :cond_0
    const/4 v0, 0x0

    .local v0, k:I
    :goto_0
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    if-ge v0, v1, :cond_1

    .line 532
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v2

    aput v2, v1, v0

    .line 531
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 533
    :cond_1
    new-instance v1, Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    iput-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 534
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    const/4 v1, 0x0

    .line 543
    instance-of v2, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    if-eqz v2, :cond_0

    .line 545
    :try_start_0
    check-cast p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .end local p1
    new-instance v2, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;

    invoke-direct {v2}, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;-><init>()V

    invoke-virtual {p0, p1, v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->xorToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    :try_end_0
    .catch Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 546
    const/4 v1, 0x1

    .line 551
    :cond_0
    :goto_0
    return v1

    .line 547
    :catch_0
    move-exception v0

    .line 548
    .local v0, e:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;
    goto :goto_0
.end method

.method public get(I)Z
    .locals 7
    .parameter "i"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 997
    if-ltz p1, :cond_0

    iget v6, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-lt p1, v6, :cond_1

    .line 1015
    :cond_0
    :goto_0
    return v5

    .line 999
    :cond_1
    const/4 v0, 0x0

    .line 1000
    .local v0, WordChecked:I
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getIteratingRLW()Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v1

    .line 1001
    .local v1, j:Lcom/googlecode/javaewah32/IteratingRLW32;
    div-int/lit8 v3, p1, 0x20

    .line 1002
    .local v3, wordi:I
    :goto_1
    if-gt v0, v3, :cond_0

    .line 1003
    invoke-interface {v1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v6

    add-int/2addr v0, v6

    .line 1004
    if-ge v3, v0, :cond_2

    .line 1005
    invoke-interface {v1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v5

    goto :goto_0

    .line 1007
    :cond_2
    invoke-interface {v1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v6

    add-int/2addr v6, v0

    if-ge v3, v6, :cond_4

    .line 1008
    sub-int v6, v3, v0

    invoke-interface {v1, v6}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v2

    .line 1010
    .local v2, w:I
    shl-int v6, v4, p1

    and-int/2addr v6, v2

    if-eqz v6, :cond_3

    :goto_2
    move v5, v4

    goto :goto_0

    :cond_3
    move v4, v5

    goto :goto_2

    .line 1012
    .end local v2           #w:I
    :cond_4
    invoke-interface {v1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v6

    add-int/2addr v0, v6

    .line 1013
    invoke-interface {v1}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    goto :goto_1
.end method

.method public getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;
    .locals 2

    .prologue
    .line 604
    new-instance v0, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v0, p0, v1}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    return-object v0
.end method

.method public getIteratingRLW()Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 1

    .prologue
    .line 611
    new-instance v0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    return-object v0
.end method

.method public getPositions()Ljava/util/List;
    .locals 11
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
    .line 621
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 622
    .local v8, v:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v2, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v9, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v2, p0, v9}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    .line 624
    .local v2, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    const/4 v6, 0x0

    .line 625
    .local v6, pos:I
    :cond_0
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 626
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v4

    .line 627
    .local v4, localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 628
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v9

    if-ge v3, v9, :cond_3

    .line 629
    const/4 v0, 0x0

    .local v0, c:I
    move v7, v6

    .end local v6           #pos:I
    .local v7, pos:I
    :goto_1
    const/16 v9, 0x20

    if-ge v0, v9, :cond_1

    .line 630
    new-instance v9, Ljava/lang/Integer;

    add-int/lit8 v6, v7, 0x1

    .end local v7           #pos:I
    .restart local v6       #pos:I
    invoke-direct {v9, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 629
    add-int/lit8 v0, v0, 0x1

    move v7, v6

    .end local v6           #pos:I
    .restart local v7       #pos:I
    goto :goto_1

    .line 628
    :cond_1
    add-int/lit8 v3, v3, 0x1

    move v6, v7

    .end local v7           #pos:I
    .restart local v6       #pos:I
    goto :goto_0

    .line 633
    .end local v0           #c:I
    .end local v3           #j:I
    :cond_2
    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v9

    mul-int/lit8 v9, v9, 0x20

    add-int/2addr v6, v9

    .line 635
    :cond_3
    const/4 v3, 0x0

    .restart local v3       #j:I
    :goto_2
    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v9

    if-ge v3, v9, :cond_0

    .line 636
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v9

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v10

    add-int/2addr v10, v3

    aget v1, v9, v10

    .line 637
    .local v1, data:I
    :goto_3
    if-eqz v1, :cond_4

    .line 638
    invoke-static {v1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v5

    .line 639
    .local v5, ntz:I
    const/4 v9, 0x1

    shl-int/2addr v9, v5

    xor-int/2addr v1, v9

    .line 640
    new-instance v9, Ljava/lang/Integer;

    add-int v10, v5, v6

    invoke-direct {v9, v10}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 642
    .end local v5           #ntz:I
    :cond_4
    add-int/lit8 v6, v6, 0x20

    .line 635
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 645
    .end local v1           #data:I
    .end local v3           #j:I
    .end local v4           #localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    :cond_5
    :goto_4
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_6

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget v10, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-lt v9, v10, :cond_6

    .line 647
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_4

    .line 648
    :cond_6
    return-object v8
.end method

.method public hashCode()I
    .locals 7

    .prologue
    .line 658
    const/4 v3, 0x0

    .line 659
    .local v3, karprabin:I
    const/16 v0, 0x1f

    .line 660
    .local v0, B:I
    new-instance v1, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v1, p0, v4}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    .line 662
    .local v1, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    :cond_0
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 663
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 664
    iget-object v4, v1, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 665
    mul-int/lit8 v4, v3, 0x1f

    iget-object v5, v1, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v5}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v5

    add-int/2addr v4, v5

    add-int/2addr v3, v4

    .line 667
    :cond_1
    const/4 v2, 0x0

    .local v2, k:I
    :goto_0
    iget-object v4, v1, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 668
    mul-int/lit8 v4, v3, 0x1f

    iget-object v5, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v6

    add-int/2addr v6, v2

    aget v5, v5, v6

    add-int/2addr v4, v5

    add-int/2addr v3, v4

    .line 667
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 671
    .end local v2           #k:I
    :cond_2
    return v3
.end method

.method public intIterator()Lcom/googlecode/javaewah/IntIterator;
    .locals 3

    .prologue
    .line 702
    new-instance v0, Lcom/googlecode/javaewah32/IntIteratorImpl32;

    new-instance v1, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v1, p0, v2}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah32/IntIteratorImpl32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    return-object v0
.end method

.method public intersects(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Z
    .locals 3
    .parameter "a"

    .prologue
    .line 685
    new-instance v1, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;

    invoke-direct {v1}, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;-><init>()V

    .line 687
    .local v1, nevs:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;
    :try_start_0
    invoke-virtual {p0, p1, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->andToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    :try_end_0
    .catch Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 691
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 688
    :catch_0
    move-exception v0

    .line 689
    .local v0, nee:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;
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
    .line 714
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    return-object v0
.end method

.method public not()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    .line 772
    new-instance v0, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v0, p0, v4}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    .line 774
    .local v0, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 795
    :cond_0
    :goto_0
    return-void

    .line 777
    :cond_1
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v2

    .line 778
    .local v2, rlw1:Lcom/googlecode/javaewah32/RunningLengthWord32;
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v4

    if-nez v4, :cond_2

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {v2, v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningBit(Z)V

    .line 779
    const/4 v1, 0x0

    .local v1, j:I
    :goto_2
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 780
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v4

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v5

    add-int/2addr v5, v1

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v6

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v7

    add-int/2addr v7, v1

    aget v6, v6, v7

    xor-int/lit8 v6, v6, -0x1

    aput v6, v4, v5

    .line 779
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 778
    .end local v1           #j:I
    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 782
    .restart local v1       #j:I
    :cond_3
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 783
    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    rem-int/lit8 v3, v4, 0x20

    .line 784
    .local v3, usedbitsinlast:I
    if-eqz v3, :cond_0

    .line 787
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v4

    if-nez v4, :cond_4

    .line 788
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v4

    if-lez v4, :cond_0

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 789
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 790
    rsub-int/lit8 v4, v3, 0x20

    ushr-int v4, v8, v4

    invoke-direct {p0, v4}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addLiteralWord(I)I

    goto :goto_0

    .line 794
    :cond_4
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v4

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v5

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    aget v6, v4, v5

    rsub-int/lit8 v7, v3, 0x20

    ushr-int v7, v8, v7

    and-int/2addr v6, v7

    aput v6, v4, v5

    goto :goto_0
.end method

.method public bridge synthetic or(Ljava/lang/Object;)Lcom/googlecode/javaewah/LogicalElement;
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    check-cast p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->or(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v0

    return-object v0
.end method

.method public or(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 3
    .parameter "a"

    .prologue
    .line 818
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 819
    .local v0, container:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->reserve(I)Z

    .line 820
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->orToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 821
    return-object v0
.end method

.method public orCardinality(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 882
    new-instance v0, Lcom/googlecode/javaewah32/BitCounter32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/BitCounter32;-><init>()V

    .line 883
    .local v0, counter:Lcom/googlecode/javaewah32/BitCounter32;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->orToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 884
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BitCounter32;->getCount()I

    move-result v1

    return v1
.end method

.method public orToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 15
    .parameter "a"
    .parameter "container"

    .prologue
    .line 834
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v1

    .line 835
    .local v1, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v5

    .line 836
    .local v5, j:Lcom/googlecode/javaewah32/EWAHIterator32;
    new-instance v11, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v11, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 837
    .local v11, rlwi:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    new-instance v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v12, v5}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 838
    .local v12, rlwj:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_0
    :goto_0
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_8

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_8

    .line 839
    :goto_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-gtz v13, :cond_1

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-lez v13, :cond_6

    .line 840
    :cond_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    if-ge v13, v14, :cond_2

    const/4 v2, 0x1

    .line 842
    .local v2, i_is_prey:Z
    :goto_2
    if-eqz v2, :cond_3

    move-object v9, v11

    .line 844
    .local v9, prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_3
    if-eqz v2, :cond_4

    move-object v8, v12

    .line 846
    .local v8, predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_4
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_5

    .line 847
    const/4 v13, 0x1

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 848
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v9, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 849
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 840
    .end local v2           #i_is_prey:Z
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_2
    const/4 v2, 0x0

    goto :goto_2

    .restart local v2       #i_is_prey:Z
    :cond_3
    move-object v9, v12

    .line 842
    goto :goto_3

    .restart local v9       #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_4
    move-object v8, v11

    .line 844
    goto :goto_4

    .line 851
    .restart local v8       #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_5
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    move-object/from16 v0, p2

    invoke-virtual {v9, v0, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;I)I

    move-result v4

    .line 852
    .local v4, index:I
    const/4 v13, 0x0

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    sub-int/2addr v14, v4

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 854
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 857
    .end local v2           #i_is_prey:Z
    .end local v4           #index:I
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_6
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 859
    .local v7, nbre_literal:I
    if-lez v7, :cond_0

    .line 860
    const/4 v6, 0x0

    .local v6, k:I
    :goto_5
    if-ge v6, v7, :cond_7

    .line 861
    invoke-virtual {v11, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v13

    invoke-virtual {v12, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v14

    or-int/2addr v13, v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 860
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 863
    :cond_7
    invoke-virtual {v11, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 864
    invoke-virtual {v12, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto/16 :goto_0

    .line 867
    .end local v6           #k:I
    .end local v7           #nbre_literal:I
    :cond_8
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_9

    const/4 v3, 0x1

    .line 868
    .local v3, i_remains:Z
    :goto_6
    if-eqz v3, :cond_a

    move-object v10, v11

    .line 869
    .local v10, remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 870
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v13

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    .line 871
    return-void

    .line 867
    .end local v3           #i_remains:Z
    .end local v10           #remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_9
    const/4 v3, 0x0

    goto :goto_6

    .restart local v3       #i_remains:Z
    :cond_a
    move-object v10, v12

    .line 868
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
    .line 939
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->deserialize(Ljava/io/DataInput;)V

    .line 940
    return-void
.end method

.method public serialize(Ljava/io/DataOutput;)V
    .locals 2
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 969
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 970
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 971
    const/4 v0, 0x0

    .local v0, k:I
    :goto_0
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    if-ge v0, v1, :cond_0

    .line 972
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    aget v1, v1, v0

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 971
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 973
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 974
    return-void
.end method

.method public serializedSizeInBytes()I
    .locals 1

    .prologue
    .line 982
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBytes()I

    move-result v0

    add-int/lit8 v0, v0, 0xc

    return v0
.end method

.method public set(I)Z
    .locals 7
    .parameter "i"

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1031
    const v3, 0x7fffffdf

    if-gt p1, v3, :cond_0

    if-gez p1, :cond_1

    .line 1032
    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const-string v2, "Set values should be between 0 and 2147483615"

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1034
    :cond_1
    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-ge p1, v3, :cond_2

    .line 1059
    :goto_0
    return v1

    .line 1037
    :cond_2
    add-int/lit8 v3, p1, 0x20

    div-int/lit8 v3, v3, 0x20

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    add-int/lit8 v4, v4, 0x20

    add-int/lit8 v4, v4, -0x1

    div-int/lit8 v4, v4, 0x20

    sub-int v0, v3, v4

    .line 1039
    .local v0, dist:I
    add-int/lit8 v3, p1, 0x1

    iput v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 1040
    if-lez v0, :cond_4

    .line 1041
    if-le v0, v2, :cond_3

    .line 1042
    add-int/lit8 v3, v0, -0x1

    invoke-direct {p0, v1, v3}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->fastaddStreamOfEmptyWords(ZI)V

    .line 1043
    :cond_3
    rem-int/lit8 v1, p1, 0x20

    shl-int v1, v2, v1

    invoke-direct {p0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addLiteralWord(I)I

    move v1, v2

    .line 1044
    goto :goto_0

    .line 1046
    :cond_4
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v3

    if-nez v3, :cond_5

    .line 1047
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setRunningLength(I)V

    .line 1048
    rem-int/lit8 v1, p1, 0x20

    shl-int v1, v2, v1

    invoke-direct {p0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addLiteralWord(I)I

    move v1, v2

    .line 1049
    goto :goto_0

    .line 1051
    :cond_5
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    aget v5, v3, v4

    rem-int/lit8 v6, p1, 0x20

    shl-int v6, v2, v6

    or-int/2addr v5, v6

    aput v5, v3, v4

    .line 1052
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    aget v3, v3, v4

    const/4 v4, -0x1

    if-ne v3, v4, :cond_6

    .line 1053
    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v4, v4, -0x1

    aput v1, v3, v4

    .line 1054
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 1055
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v3}, Lcom/googlecode/javaewah32/RunningLengthWord32;->setNumberOfLiteralWords(I)V

    .line 1057
    invoke-direct {p0, v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addEmptyWord(Z)I

    :cond_6
    move v1, v2

    .line 1059
    goto :goto_0
.end method

.method public setSizeInBits(I)V
    .locals 3
    .parameter "size"

    .prologue
    .line 1068
    add-int/lit8 v0, p1, 0x20

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v0, v0, 0x20

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    add-int/lit8 v1, v1, 0x20

    add-int/lit8 v1, v1, -0x1

    div-int/lit8 v1, v1, 0x20

    if-eq v0, v1, :cond_0

    .line 1069
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "You can only reduce the size of the bitmap within the scope of the last word. To extend the bitmap, please call setSizeInbits(int,boolean): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1070
    :cond_0
    iput p1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 1071
    return-void
.end method

.method public setSizeInBits(IZ)Z
    .locals 2
    .parameter "size"
    .parameter "defaultvalue"

    .prologue
    .line 1087
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-ge p1, v0, :cond_0

    .line 1088
    const/4 v0, 0x0

    .line 1104
    :goto_0
    return v0

    .line 1089
    :cond_0
    if-nez p2, :cond_2

    .line 1090
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    invoke-static {p0, v0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->extendEmptyBits(Lcom/googlecode/javaewah32/BitmapStorage32;II)V

    .line 1103
    :cond_1
    iput p1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 1104
    const/4 v0, 0x1

    goto :goto_0

    .line 1093
    :cond_2
    :goto_1
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    rem-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-ge v0, p1, :cond_3

    .line 1094
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    invoke-virtual {p0, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->set(I)Z

    goto :goto_1

    .line 1096
    :cond_3
    div-int/lit8 v0, p1, 0x20

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    div-int/lit8 v1, v1, 0x20

    sub-int/2addr v0, v1

    invoke-virtual {p0, p2, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->addStreamOfEmptyWords(ZI)V

    .line 1099
    :goto_2
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-ge v0, p1, :cond_1

    .line 1100
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    invoke-virtual {p0, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->set(I)Z

    goto :goto_2
.end method

.method public sizeInBits()I
    .locals 1

    .prologue
    .line 1116
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    return v0
.end method

.method public sizeInBytes()I
    .locals 1

    .prologue
    .line 1127
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    mul-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public swap(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 6
    .parameter "other"

    .prologue
    .line 1227
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 1228
    .local v0, tmp:[I
    iget-object v4, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iput-object v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 1229
    iput-object v0, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 1231
    iget-object v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v1, v4, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 1232
    .local v1, tmp2:I
    iget-object v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v5, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v5, v5, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    iput v5, v4, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 1233
    iget-object v4, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iput v1, v4, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 1235
    iget v2, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 1236
    .local v2, tmp3:I
    iget v4, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    iput v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 1237
    iput v2, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    .line 1239
    iget v3, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 1240
    .local v3, tmp4:I
    iget v4, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    iput v4, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 1241
    iput v3, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 1242
    return-void
.end method

.method public toArray()[I
    .locals 15

    .prologue
    .line 1137
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->cardinality()I

    move-result v11

    new-array v0, v11, [I

    .line 1138
    .local v0, ans:[I
    const/4 v4, 0x0

    .line 1139
    .local v4, inanspos:I
    const/4 v9, 0x0

    .line 1140
    .local v9, pos:I
    new-instance v3, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v11, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v3, p0, v11}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    .line 1142
    .local v3, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    :cond_0
    invoke-virtual {v3}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1143
    invoke-virtual {v3}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v7

    .line 1144
    .local v7, localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    invoke-virtual {v7}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 1145
    const/4 v6, 0x0

    .local v6, j:I
    :goto_0
    invoke-virtual {v7}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v11

    if-ge v6, v11, :cond_3

    .line 1146
    const/4 v1, 0x0

    .local v1, c:I
    move v10, v9

    .end local v9           #pos:I
    .local v10, pos:I
    move v5, v4

    .end local v4           #inanspos:I
    .local v5, inanspos:I
    :goto_1
    const/16 v11, 0x20

    if-ge v1, v11, :cond_1

    .line 1147
    add-int/lit8 v4, v5, 0x1

    .end local v5           #inanspos:I
    .restart local v4       #inanspos:I
    add-int/lit8 v9, v10, 0x1

    .end local v10           #pos:I
    .restart local v9       #pos:I
    aput v10, v0, v5

    .line 1146
    add-int/lit8 v1, v1, 0x1

    move v10, v9

    .end local v9           #pos:I
    .restart local v10       #pos:I
    move v5, v4

    .end local v4           #inanspos:I
    .restart local v5       #inanspos:I
    goto :goto_1

    .line 1145
    :cond_1
    add-int/lit8 v6, v6, 0x1

    move v9, v10

    .end local v10           #pos:I
    .restart local v9       #pos:I
    move v4, v5

    .end local v5           #inanspos:I
    .restart local v4       #inanspos:I
    goto :goto_0

    .line 1151
    .end local v1           #c:I
    .end local v6           #j:I
    :cond_2
    invoke-virtual {v7}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v11

    mul-int/lit8 v11, v11, 0x20

    add-int/2addr v9, v11

    .line 1153
    :cond_3
    const/4 v6, 0x0

    .restart local v6       #j:I
    :goto_2
    invoke-virtual {v7}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v11

    if-ge v6, v11, :cond_0

    .line 1154
    invoke-virtual {v3}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v11

    invoke-virtual {v3}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v12

    add-int/2addr v12, v6

    aget v2, v11, v12

    .local v2, data:I
    move v5, v4

    .line 1162
    .end local v4           #inanspos:I
    .restart local v5       #inanspos:I
    :goto_3
    if-eqz v2, :cond_4

    .line 1163
    invoke-static {v2}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v8

    .line 1164
    .local v8, ntz:I
    int-to-long v11, v2

    const-wide/16 v13, 0x1

    shl-long/2addr v13, v8

    xor-long/2addr v11, v13

    long-to-int v2, v11

    .line 1165
    add-int/lit8 v4, v5, 0x1

    .end local v5           #inanspos:I
    .restart local v4       #inanspos:I
    add-int v11, v8, v9

    aput v11, v0, v5

    move v5, v4

    .line 1166
    .end local v4           #inanspos:I
    .restart local v5       #inanspos:I
    goto :goto_3

    .line 1167
    .end local v8           #ntz:I
    :cond_4
    add-int/lit8 v9, v9, 0x20

    .line 1153
    add-int/lit8 v6, v6, 0x1

    move v4, v5

    .end local v5           #inanspos:I
    .restart local v4       #inanspos:I
    goto :goto_2

    .line 1171
    .end local v2           #data:I
    .end local v6           #j:I
    .end local v7           #localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    :cond_5
    return-object v0
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 1181
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " EWAHCompressedBitmap, size in bits = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " size in words = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1183
    .local v0, ans:Ljava/lang/String;
    new-instance v2, Lcom/googlecode/javaewah32/EWAHIterator32;

    iget v5, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-direct {v2, p0, v5}, Lcom/googlecode/javaewah32/EWAHIterator32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    .line 1185
    .local v2, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    :cond_0
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1186
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v4

    .line 1187
    .local v4, localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1188
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " 1x11\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1192
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " dirties\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1193
    const/4 v3, 0x0

    .local v3, j:I
    :goto_1
    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 1194
    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v5

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v6

    add-int/2addr v6, v3

    aget v1, v5, v6

    .line 1195
    .local v1, data:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\t"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1193
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1190
    .end local v1           #data:I
    .end local v3           #j:I
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " 0x00\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1198
    .end local v4           #localrlw:Lcom/googlecode/javaewah32/RunningLengthWord32;
    :cond_2
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1208
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1209
    .local v0, answer:Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v1

    .line 1210
    .local v1, i:Lcom/googlecode/javaewah/IntIterator;
    const-string v2, "{"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1211
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1212
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 1213
    :cond_0
    :goto_0
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1214
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1215
    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1217
    :cond_1
    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1218
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public trim()V
    .locals 2

    .prologue
    .line 1248
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    .line 1249
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
    .line 1256
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->serialize(Ljava/io/DataOutput;)V

    .line 1257
    return-void
.end method

.method public xor(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 3
    .parameter "a"

    .prologue
    .line 1275
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 1276
    .local v0, container:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    iget v2, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->actualsizeinwords:I

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->reserve(I)Z

    .line 1277
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->xorToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1278
    return-object v0
.end method

.method public bridge synthetic xor(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    check-cast p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->xor(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v0

    return-object v0
.end method

.method public xorCardinality(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I
    .locals 2
    .parameter "a"

    .prologue
    .line 1343
    new-instance v0, Lcom/googlecode/javaewah32/BitCounter32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/BitCounter32;-><init>()V

    .line 1344
    .local v0, counter:Lcom/googlecode/javaewah32/BitCounter32;
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->xorToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1345
    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BitCounter32;->getCount()I

    move-result v1

    return v1
.end method

.method public xorToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 15
    .parameter "a"
    .parameter "container"

    .prologue
    .line 1295
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v1

    .line 1296
    .local v1, i:Lcom/googlecode/javaewah32/EWAHIterator32;
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v5

    .line 1297
    .local v5, j:Lcom/googlecode/javaewah32/EWAHIterator32;
    new-instance v11, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v11, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 1298
    .local v11, rlwi:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    new-instance v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v12, v5}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 1299
    .local v12, rlwj:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_0
    :goto_0
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_8

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_8

    .line 1300
    :goto_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-gtz v13, :cond_1

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    if-lez v13, :cond_6

    .line 1301
    :cond_1
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    if-ge v13, v14, :cond_2

    const/4 v2, 0x1

    .line 1303
    .local v2, i_is_prey:Z
    :goto_2
    if-eqz v2, :cond_3

    move-object v9, v11

    .line 1304
    .local v9, prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_3
    if-eqz v2, :cond_4

    move-object v8, v12

    .line 1306
    .local v8, predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_4
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v13

    if-nez v13, :cond_5

    .line 1307
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    move-object/from16 v0, p2

    invoke-virtual {v9, v0, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;I)I

    move-result v4

    .line 1308
    .local v4, index:I
    const/4 v13, 0x0

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    sub-int/2addr v14, v4

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 1310
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 1301
    .end local v2           #i_is_prey:Z
    .end local v4           #index:I
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_2
    const/4 v2, 0x0

    goto :goto_2

    .restart local v2       #i_is_prey:Z
    :cond_3
    move-object v9, v12

    .line 1303
    goto :goto_3

    .restart local v9       #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_4
    move-object v8, v11

    .line 1304
    goto :goto_4

    .line 1312
    .restart local v8       #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_5
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    move-object/from16 v0, p2

    invoke-virtual {v9, v0, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->dischargeNegated(Lcom/googlecode/javaewah32/BitmapStorage32;I)I

    move-result v4

    .line 1313
    .restart local v4       #index:I
    const/4 v13, 0x1

    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v14

    sub-int/2addr v14, v4

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 1315
    invoke-virtual {v8}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_1

    .line 1318
    .end local v2           #i_is_prey:Z
    .end local v4           #index:I
    .end local v8           #predator:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v9           #prey:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_6
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v13

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 1320
    .local v7, nbre_literal:I
    if-lez v7, :cond_0

    .line 1321
    const/4 v6, 0x0

    .local v6, k:I
    :goto_5
    if-ge v6, v7, :cond_7

    .line 1322
    invoke-virtual {v11, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v13

    invoke-virtual {v12, v6}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v14

    xor-int/2addr v13, v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 1321
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 1323
    :cond_7
    invoke-virtual {v11, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 1324
    invoke-virtual {v12, v7}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto/16 :goto_0

    .line 1327
    .end local v6           #k:I
    .end local v7           #nbre_literal:I
    :cond_8
    invoke-virtual {v11}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v13

    if-lez v13, :cond_9

    const/4 v3, 0x1

    .line 1328
    .local v3, i_remains:Z
    :goto_6
    if-eqz v3, :cond_a

    move-object v10, v11

    .line 1329
    .local v10, remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 1330
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v13

    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    .line 1331
    return-void

    .line 1327
    .end local v3           #i_remains:Z
    .end local v10           #remaining:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_9
    const/4 v3, 0x0

    goto :goto_6

    .restart local v3       #i_remains:Z
    :cond_a
    move-object v10, v12

    .line 1328
    goto :goto_7
.end method
