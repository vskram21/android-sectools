.class final Lcom/googlecode/javaewah32/IntIteratorImpl32;
.super Ljava/lang/Object;
.source "IntIteratorImpl32.java"

# interfaces
.implements Lcom/googlecode/javaewah/IntIterator;


# instance fields
.field private final ewahBuffer:[I

.field private final ewahIter:Lcom/googlecode/javaewah32/EWAHIterator32;

.field private hasnext:Z

.field private literalPosition:I

.field private position:I

.field private runningLength:I

.field private word:I

.field private wordLength:I

.field private wordPosition:I


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V
    .locals 1
    .parameter "ewahIter"

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->ewahIter:Lcom/googlecode/javaewah32/EWAHIterator32;

    .line 34
    invoke-virtual {p1}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->ewahBuffer:[I

    .line 35
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IntIteratorImpl32;->moveToNext()Z

    move-result v0

    iput-boolean v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->hasnext:Z

    .line 36
    return-void
.end method

.method private final literalHasNext()Z
    .locals 3

    .prologue
    .line 83
    :goto_0
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->word:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->wordPosition:I

    iget v1, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->wordLength:I

    if-ge v0, v1, :cond_0

    .line 84
    iget-object v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->ewahBuffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->wordPosition:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->wordPosition:I

    aget v0, v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->word:I

    .line 85
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    iput v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->literalPosition:I

    .line 86
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    add-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    goto :goto_0

    .line 88
    :cond_0
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->word:I

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private final runningHasNext()Z
    .locals 2

    .prologue
    .line 79
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    iget v1, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->runningLength:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private final setRunningLengthWord(Lcom/googlecode/javaewah32/RunningLengthWord32;)V
    .locals 2
    .parameter "rlw"

    .prologue
    .line 68
    invoke-virtual {p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v0

    mul-int/lit8 v0, v0, 0x20

    iget v1, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->runningLength:I

    .line 70
    invoke-virtual {p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->runningLength:I

    iput v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->ewahIter:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->wordPosition:I

    .line 75
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->wordPosition:I

    invoke-virtual {p1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->wordLength:I

    .line 76
    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->hasnext:Z

    return v0
.end method

.method public final moveToNext()Z
    .locals 1

    .prologue
    .line 39
    :goto_0
    invoke-direct {p0}, Lcom/googlecode/javaewah32/IntIteratorImpl32;->runningHasNext()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/googlecode/javaewah32/IntIteratorImpl32;->literalHasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 40
    iget-object v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->ewahIter:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 41
    const/4 v0, 0x0

    .line 45
    :goto_1
    return v0

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->ewahIter:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah32/IntIteratorImpl32;->setRunningLengthWord(Lcom/googlecode/javaewah32/RunningLengthWord32;)V

    goto :goto_0

    .line 45
    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public final next()I
    .locals 6

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/googlecode/javaewah32/IntIteratorImpl32;->runningHasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 57
    iget v0, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->position:I

    .line 63
    .local v0, answer:I
    :goto_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/IntIteratorImpl32;->moveToNext()Z

    move-result v2

    iput-boolean v2, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->hasnext:Z

    .line 64
    return v0

    .line 59
    .end local v0           #answer:I
    :cond_0
    iget v2, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->word:I

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v1

    .line 60
    .local v1, bit:I
    iget v2, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->word:I

    int-to-long v2, v2

    const-wide/16 v4, 0x1

    shl-long/2addr v4, v1

    xor-long/2addr v2, v4

    long-to-int v2, v2

    iput v2, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->word:I

    .line 61
    iget v2, p0, Lcom/googlecode/javaewah32/IntIteratorImpl32;->literalPosition:I

    add-int v0, v2, v1

    .restart local v0       #answer:I
    goto :goto_0
.end method
