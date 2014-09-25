.class public final Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
.super Ljava/lang/Object;
.source "IteratingBufferedRunningLengthWord.java"

# interfaces
.implements Lcom/googlecode/javaewah/IteratingRLW;
.implements Ljava/lang/Cloneable;


# instance fields
.field private brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

.field private buffer:[J

.field private iterator:Lcom/googlecode/javaewah/EWAHIterator;

.field private literalWordStartPosition:I


# direct methods
.method public constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 2
    .parameter "bitmap"

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {p1}, Lcom/googlecode/javaewah/EWAHIterator;->getEWAHIterator(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    .line 36
    new-instance v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/RunningLengthWord;)V

    iput-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    .line 37
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v0

    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v1, v1, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    .line 38
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->buffer:[J

    .line 39
    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javaewah/EWAHIterator;)V
    .locals 2
    .parameter "iterator"

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    .line 22
    new-instance v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/RunningLengthWord;)V

    iput-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    .line 23
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v0

    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v1, v1, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    .line 24
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->buffer:[J

    .line 25
    return-void
.end method

.method private static discharge(Lcom/googlecode/javaewah/BufferedRunningLengthWord;Lcom/googlecode/javaewah/EWAHIterator;Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 6
    .parameter "initialWord"
    .parameter "iterator"
    .parameter "container"

    .prologue
    .line 246
    move-object v2, p0

    .line 248
    .local v2, runningLengthWord:Lcom/googlecode/javaewah/BufferedRunningLengthWord;
    :goto_0
    invoke-virtual {v2}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v0

    .line 249
    .local v0, runningLength:J
    invoke-virtual {v2}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->getRunningBit()Z

    move-result v3

    invoke-interface {p2, v3, v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 251
    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v3

    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v4

    iget v5, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    add-int/2addr v4, v5

    invoke-virtual {v2}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v5

    invoke-interface {p2, v3, v4, v5}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfLiteralWords([JII)V

    .line 254
    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 258
    return-void

    .line 256
    :cond_0
    new-instance v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    .end local v2           #runningLengthWord:Lcom/googlecode/javaewah/BufferedRunningLengthWord;
    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/RunningLengthWord;)V

    .line 257
    .restart local v2       #runningLengthWord:Lcom/googlecode/javaewah/BufferedRunningLengthWord;
    goto :goto_0
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 263
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    .line 264
    .local v0, answer:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->clone()Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    .line 265
    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->buffer:[J

    iput-object v1, v0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->buffer:[J

    .line 266
    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->clone()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    .line 267
    iget v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    iput v1, v0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    .line 268
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/googlecode/javaewah/IteratingRLW;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->clone()Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-result-object v0

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
    .line 14
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->clone()Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-result-object v0

    return-object v0
.end method

.method public discardFirstWords(J)V
    .locals 7
    .parameter "x"

    .prologue
    const-wide/16 v5, 0x0

    .line 51
    :cond_0
    :goto_0
    cmp-long v2, p1, v5

    if-lez v2, :cond_1

    .line 52
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    cmp-long v2, v2, p1

    if-lez v2, :cond_2

    .line 53
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    sub-long/2addr v3, p1

    iput-wide v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 71
    :cond_1
    return-void

    .line 56
    :cond_2
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    sub-long/2addr p1, v2

    .line 57
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iput-wide v5, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 58
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v2, v2

    cmp-long v2, p1, v2

    if-lez v2, :cond_4

    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v0, v2

    .line 60
    .local v0, toDiscard:J
    :goto_1
    iget v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    int-to-long v2, v2

    add-long/2addr v2, v0

    long-to-int v2, v2

    iput v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    .line 61
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v3, v3

    sub-long/2addr v3, v0

    long-to-int v3, v3

    iput v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 62
    sub-long/2addr p1, v0

    .line 63
    cmp-long v2, p1, v5

    if-gtz v2, :cond_3

    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->size()J

    move-result-wide v2

    cmp-long v2, v2, v5

    if-nez v2, :cond_0

    .line 64
    :cond_3
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 67
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-object v3, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v3}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->reset(Lcom/googlecode/javaewah/RunningLengthWord;)V

    .line 68
    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v2

    iput v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    goto :goto_0

    .end local v0           #toDiscard:J
    :cond_4
    move-wide v0, p1

    .line 58
    goto :goto_1
.end method

.method public discharge(Lcom/googlecode/javaewah/BitmapStorage;J)J
    .locals 9
    .parameter "container"
    .parameter "max"

    .prologue
    .line 95
    const-wide/16 v0, 0x0

    .line 96
    .local v0, index:J
    :goto_0
    cmp-long v5, v0, p2

    if-gez v5, :cond_2

    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_2

    .line 98
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v3

    .line 99
    .local v3, pl:J
    add-long v5, v0, v3

    cmp-long v5, v5, p2

    if-lez v5, :cond_0

    .line 100
    sub-long v3, p2, v0

    .line 102
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v5

    invoke-interface {p1, v5, v3, v4}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 103
    add-long/2addr v0, v3

    .line 104
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v2

    .line 105
    .local v2, pd:I
    int-to-long v5, v2

    add-long/2addr v5, v0

    cmp-long v5, v5, p2

    if-lez v5, :cond_1

    .line 106
    sub-long v5, p2, v0

    long-to-int v2, v5

    .line 108
    :cond_1
    invoke-virtual {p0, v2, p1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->writeLiteralWords(ILcom/googlecode/javaewah/BitmapStorage;)V

    .line 109
    int-to-long v5, v2

    add-long/2addr v5, v3

    invoke-virtual {p0, v5, v6}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 110
    int-to-long v5, v2

    add-long/2addr v0, v5

    .line 111
    goto :goto_0

    .line 112
    .end local v2           #pd:I
    .end local v3           #pl:J
    :cond_2
    return-wide v0
.end method

.method public discharge(Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 3
    .parameter "container"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    iget-object v2, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    .line 162
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-static {v0, v1, p1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BufferedRunningLengthWord;Lcom/googlecode/javaewah/EWAHIterator;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 163
    return-void
.end method

.method public dischargeAsEmpty(Lcom/googlecode/javaewah/BitmapStorage;)V
    .locals 4
    .parameter "container"

    .prologue
    .line 148
    :goto_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 149
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 150
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    goto :goto_0

    .line 152
    :cond_0
    return-void
.end method

.method public dischargeNegated(Lcom/googlecode/javaewah/BitmapStorage;J)J
    .locals 9
    .parameter "container"
    .parameter "max"

    .prologue
    .line 122
    const-wide/16 v0, 0x0

    .line 123
    .local v0, index:J
    :goto_0
    cmp-long v5, v0, p2

    if-gez v5, :cond_3

    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_3

    .line 125
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v3

    .line 126
    .local v3, pl:J
    add-long v5, v0, v3

    cmp-long v5, v5, p2

    if-lez v5, :cond_0

    .line 127
    sub-long v3, p2, v0

    .line 129
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v5

    if-nez v5, :cond_2

    const/4 v5, 0x1

    :goto_1
    invoke-interface {p1, v5, v3, v4}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 130
    add-long/2addr v0, v3

    .line 131
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v2

    .line 132
    .local v2, pd:I
    int-to-long v5, v2

    add-long/2addr v5, v0

    cmp-long v5, v5, p2

    if-lez v5, :cond_1

    .line 133
    sub-long v5, p2, v0

    long-to-int v2, v5

    .line 135
    :cond_1
    invoke-virtual {p0, v2, p1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->writeNegatedLiteralWords(ILcom/googlecode/javaewah/BitmapStorage;)V

    .line 136
    int-to-long v5, v2

    add-long/2addr v5, v3

    invoke-virtual {p0, v5, v6}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 137
    int-to-long v5, v2

    add-long/2addr v0, v5

    .line 138
    goto :goto_0

    .line 129
    .end local v2           #pd:I
    :cond_2
    const/4 v5, 0x0

    goto :goto_1

    .line 139
    .end local v3           #pl:J
    :cond_3
    return-wide v0
.end method

.method public getLiteralWordAt(I)J
    .locals 2
    .parameter "index"

    .prologue
    .line 172
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    add-int/2addr v1, p1

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v0, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-boolean v0, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    return v0
.end method

.method public getRunningLength()J
    .locals 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v0, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    return-wide v0
.end method

.method public next()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 78
    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 79
    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iput v0, v1, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 80
    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 85
    :goto_0
    return v0

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-object v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->reset(Lcom/googlecode/javaewah/RunningLengthWord;)V

    .line 84
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    .line 85
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public size()J
    .locals 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method public writeLiteralWords(ILcom/googlecode/javaewah/BitmapStorage;)V
    .locals 2
    .parameter "numWords"
    .parameter "container"

    .prologue
    .line 221
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    invoke-interface {p2, v0, v1, p1}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfLiteralWords([JII)V

    .line 222
    return-void
.end method

.method public writeNegatedLiteralWords(ILcom/googlecode/javaewah/BitmapStorage;)V
    .locals 2
    .parameter "numWords"
    .parameter "container"

    .prologue
    .line 230
    iget-object v0, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->literalWordStartPosition:I

    invoke-interface {p2, v0, v1, p1}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfNegatedLiteralWords([JII)V

    .line 231
    return-void
.end method
