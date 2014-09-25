.class public final Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
.super Ljava/lang/Object;
.source "IteratingBufferedRunningLengthWord32.java"

# interfaces
.implements Lcom/googlecode/javaewah32/IteratingRLW32;
.implements Ljava/lang/Cloneable;


# instance fields
.field private brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

.field private buffer:[I

.field private iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

.field private literalWordStartPosition:I


# direct methods
.method public constructor <init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 36
    invoke-static {p1}, Lcom/googlecode/javaewah32/EWAHIterator32;->getEWAHIterator(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V
    .locals 2
    .parameter "iterator"

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    .line 24
    new-instance v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/RunningLengthWord32;)V

    iput-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    .line 25
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v0

    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    .line 26
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->buffer:[I

    .line 27
    return-void
.end method

.method protected static discharge(Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;Lcom/googlecode/javaewah32/EWAHIterator32;Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 5
    .parameter "initialWord"
    .parameter "iterator"
    .parameter "container"

    .prologue
    .line 244
    move-object v1, p0

    .line 246
    .local v1, runningLengthWord:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;
    :goto_0
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->getRunningLength()I

    move-result v0

    .line 247
    .local v0, runningLength:I
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->getRunningBit()Z

    move-result v2

    invoke-interface {p2, v2, v0}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 249
    invoke-virtual {p1}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v2

    invoke-virtual {p1}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v3

    iget v4, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    add-int/2addr v3, v4

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v4

    invoke-interface {p2, v2, v3, v4}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfLiteralWords([III)V

    .line 252
    invoke-virtual {p1}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 256
    return-void

    .line 254
    :cond_0
    new-instance v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    .end local v1           #runningLengthWord:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;
    invoke-virtual {p1}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/RunningLengthWord32;)V

    .line 255
    .restart local v1       #runningLengthWord:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;
    goto :goto_0
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 262
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    .line 263
    .local v0, answer:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->clone()Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    .line 264
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->buffer:[I

    iput-object v1, v0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->buffer:[I

    .line 265
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->clone()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    .line 266
    iget v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    iput v1, v0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    .line 267
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
    .line 16
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->clone()Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    move-result-object v0

    return-object v0
.end method

.method public discardFirstWords(I)V
    .locals 3
    .parameter "x"

    .prologue
    .line 48
    :cond_0
    :goto_0
    if-lez p1, :cond_1

    .line 49
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    if-le v1, p1, :cond_2

    .line 50
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    sub-int/2addr v2, p1

    iput v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 68
    :cond_1
    return-void

    .line 53
    :cond_2
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    sub-int/2addr p1, v1

    .line 54
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    const/4 v2, 0x0

    iput v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 55
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    if-le p1, v1, :cond_4

    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v0, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 57
    .local v0, toDiscard:I
    :goto_1
    iget v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    .line 58
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    sub-int/2addr v2, v0

    iput v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 59
    sub-int/2addr p1, v0

    .line 60
    if-gtz p1, :cond_3

    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 61
    :cond_3
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 64
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-object v2, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->reset(Lcom/googlecode/javaewah32/RunningLengthWord32;)V

    .line 65
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v1

    iput v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    goto :goto_0

    .end local v0           #toDiscard:I
    :cond_4
    move v0, p1

    .line 55
    goto :goto_1
.end method

.method public discharge(Lcom/googlecode/javaewah32/BitmapStorage32;I)I
    .locals 4
    .parameter "container"
    .parameter "max"

    .prologue
    .line 76
    const/4 v0, 0x0

    .line 77
    .local v0, index:I
    :goto_0
    if-ge v0, p2, :cond_2

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 79
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v2

    .line 80
    .local v2, pl:I
    add-int v3, v0, v2

    if-le v3, p2, :cond_0

    .line 81
    sub-int v2, p2, v0

    .line 83
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v3

    invoke-interface {p1, v3, v2}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 84
    add-int/2addr v0, v2

    .line 85
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    .line 86
    .local v1, pd:I
    add-int v3, v1, v0

    if-le v3, p2, :cond_1

    .line 87
    sub-int v1, p2, v0

    .line 89
    :cond_1
    invoke-virtual {p0, v1, p1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->writeLiteralWords(ILcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 90
    add-int v3, v2, v1

    invoke-virtual {p0, v3}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 91
    add-int/2addr v0, v1

    .line 92
    goto :goto_0

    .line 93
    .end local v1           #pd:I
    .end local v2           #pl:I
    :cond_2
    return v0
.end method

.method public discharge(Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 3
    .parameter "container"

    .prologue
    .line 156
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    iget-object v2, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    .line 157
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-static {v0, v1, p1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;Lcom/googlecode/javaewah32/EWAHIterator32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 158
    return-void
.end method

.method public dischargeAsEmpty(Lcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 2
    .parameter "container"

    .prologue
    .line 144
    :goto_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 145
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 146
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    goto :goto_0

    .line 148
    :cond_0
    return-void
.end method

.method public dischargeNegated(Lcom/googlecode/javaewah32/BitmapStorage32;I)I
    .locals 4
    .parameter "container"
    .parameter "max"

    .prologue
    .line 103
    const/4 v0, 0x0

    .line 104
    .local v0, index:I
    :goto_0
    if-ge v0, p2, :cond_3

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 106
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v2

    .line 107
    .local v2, pl:I
    add-int v3, v0, v2

    if-le v3, p2, :cond_0

    .line 108
    sub-int v2, p2, v0

    .line 110
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x1

    :goto_1
    invoke-interface {p1, v3, v2}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 111
    add-int/2addr v0, v2

    .line 112
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    .line 113
    .local v1, pd:I
    add-int v3, v1, v0

    if-le v3, p2, :cond_1

    .line 114
    sub-int v1, p2, v0

    .line 116
    :cond_1
    invoke-virtual {p0, v1, p1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->writeNegatedLiteralWords(ILcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 117
    add-int v3, v2, v1

    invoke-virtual {p0, v3}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 118
    add-int/2addr v0, v1

    .line 119
    goto :goto_0

    .line 110
    .end local v1           #pd:I
    :cond_2
    const/4 v3, 0x0

    goto :goto_1

    .line 120
    .end local v2           #pl:I
    :cond_3
    return v0
.end method

.method public getLiteralWordAt(I)I
    .locals 2
    .parameter "index"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    add-int/2addr v1, p1

    aget v0, v0, v1

    return v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v0, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-boolean v0, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    return v0
.end method

.method public getRunningLength()I
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v0, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    return v0
.end method

.method public next()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 129
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iput v0, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 131
    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iput v0, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 136
    :goto_0
    return v0

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-object v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->reset(Lcom/googlecode/javaewah32/RunningLengthWord32;)V

    .line 135
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    .line 136
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->size()I

    move-result v0

    return v0
.end method

.method public writeLiteralWords(ILcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 2
    .parameter "numWords"
    .parameter "container"

    .prologue
    .line 216
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    invoke-interface {p2, v0, v1, p1}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfLiteralWords([III)V

    .line 217
    return-void
.end method

.method public writeNegatedLiteralWords(ILcom/googlecode/javaewah32/BitmapStorage32;)V
    .locals 2
    .parameter "numWords"
    .parameter "container"

    .prologue
    .line 226
    iget-object v0, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->literalWordStartPosition:I

    invoke-interface {p2, v0, v1, p1}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfNegatedLiteralWords([III)V

    .line 227
    return-void
.end method
