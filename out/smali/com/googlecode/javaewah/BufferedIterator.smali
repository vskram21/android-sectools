.class public Lcom/googlecode/javaewah/BufferedIterator;
.super Ljava/lang/Object;
.source "BufferedIterator.java"

# interfaces
.implements Lcom/googlecode/javaewah/IteratingRLW;


# instance fields
.field private brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

.field private buffer:[J

.field private iterator:Lcom/googlecode/javaewah/EWAHIterator;

.field private literalWordStartPosition:I

.field private masteriterator:Lcom/googlecode/javaewah/CloneableIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javaewah/CloneableIterator",
            "<",
            "Lcom/googlecode/javaewah/EWAHIterator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/googlecode/javaewah/CloneableIterator;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/googlecode/javaewah/CloneableIterator",
            "<",
            "Lcom/googlecode/javaewah/EWAHIterator;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p1, iterator:Lcom/googlecode/javaewah/CloneableIterator;,"Lcom/googlecode/javaewah/CloneableIterator<Lcom/googlecode/javaewah/EWAHIterator;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/googlecode/javaewah/BufferedIterator;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    .line 22
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/EWAHIterator;

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    .line 24
    new-instance v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/RunningLengthWord;)V

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    .line 25
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v0

    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v1, v1, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->literalWordStartPosition:I

    .line 26
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->buffer:[J

    .line 28
    :cond_0
    return-void
.end method

.method private reload()Z
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    const/4 v0, 0x0

    .line 80
    :goto_0
    return v0

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/EWAHIterator;

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    .line 79
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->buffer:[J

    .line 80
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah/BufferedIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/BufferedIterator;

    .line 138
    .local v0, answer:Lcom/googlecode/javaewah/BufferedIterator;
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->clone()Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    .line 139
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->buffer:[J

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedIterator;->buffer:[J

    .line 140
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->clone()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    .line 141
    iget v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->literalWordStartPosition:I

    iput v1, v0, Lcom/googlecode/javaewah/BufferedIterator;->literalWordStartPosition:I

    .line 142
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/CloneableIterator;->clone()Lcom/googlecode/javaewah/CloneableIterator;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedIterator;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    .line 143
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
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedIterator;->clone()Lcom/googlecode/javaewah/BufferedIterator;

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
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedIterator;->clone()Lcom/googlecode/javaewah/BufferedIterator;

    move-result-object v0

    return-object v0
.end method

.method public discardFirstWords(J)V
    .locals 7
    .parameter "x"

    .prologue
    const-wide/16 v5, 0x0

    .line 38
    :cond_0
    cmp-long v2, p1, v5

    if-lez v2, :cond_1

    .line 39
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    cmp-long v2, v2, p1

    if-lez v2, :cond_2

    .line 40
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    sub-long/2addr v3, p1

    iput-wide v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 56
    :cond_1
    :goto_0
    return-void

    .line 43
    :cond_2
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    sub-long/2addr p1, v2

    .line 44
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iput-wide v5, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 45
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v2, v2

    cmp-long v2, p1, v2

    if-lez v2, :cond_4

    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v2, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v0, v2

    .line 47
    .local v0, toDiscard:J
    :goto_1
    iget v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->literalWordStartPosition:I

    int-to-long v2, v2

    add-long/2addr v2, v0

    long-to-int v2, v2

    iput v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->literalWordStartPosition:I

    .line 48
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v3, v3

    sub-long/2addr v3, v0

    long-to-int v3, v3

    iput v3, v2, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 49
    sub-long/2addr p1, v0

    .line 50
    cmp-long v2, p1, v5

    if-gtz v2, :cond_3

    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->size()J

    move-result-wide v2

    cmp-long v2, v2, v5

    if-nez v2, :cond_0

    .line 51
    :cond_3
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedIterator;->next()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .end local v0           #toDiscard:J
    :cond_4
    move-wide v0, p1

    .line 45
    goto :goto_1
.end method

.method public getLiteralWordAt(I)J
    .locals 2
    .parameter "index"

    .prologue
    .line 91
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->literalWordStartPosition:I

    add-int/2addr v1, p1

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget v0, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-boolean v0, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    return v0
.end method

.method public getRunningLength()J
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-wide v0, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    return-wide v0
.end method

.method public next()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 63
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 64
    invoke-direct {p0}, Lcom/googlecode/javaewah/BufferedIterator;->reload()Z

    move-result v1

    if-nez v1, :cond_0

    .line 65
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iput v0, v1, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 66
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 72
    :goto_0
    return v0

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->reset(Lcom/googlecode/javaewah/RunningLengthWord;)V

    .line 71
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->iterator:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->literalWordStartPosition:I

    .line 72
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public size()J
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedIterator;->brlw:Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->size()J

    move-result-wide v0

    return-wide v0
.end method
