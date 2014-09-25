.class final Lcom/googlecode/javaewah/IntIteratorImpl;
.super Ljava/lang/Object;
.source "IntIteratorImpl.java"

# interfaces
.implements Lcom/googlecode/javaewah/IntIterator;


# instance fields
.field private final ewahBuffer:[J

.field private final ewahIter:Lcom/googlecode/javaewah/EWAHIterator;

.field private hasnext:Z

.field private literalPosition:I

.field private position:I

.field private runningLength:I

.field private word:J

.field private wordLength:I

.field private wordPosition:I


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah/EWAHIterator;)V
    .locals 1
    .parameter "ewahIter"

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->ewahIter:Lcom/googlecode/javaewah/EWAHIterator;

    .line 32
    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHIterator;->buffer()[J

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->ewahBuffer:[J

    .line 33
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IntIteratorImpl;->moveToNext()Z

    move-result v0

    iput-boolean v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->hasnext:Z

    .line 34
    return-void
.end method

.method private final literalHasNext()Z
    .locals 5

    .prologue
    const-wide/16 v3, 0x0

    .line 80
    :goto_0
    iget-wide v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->word:J

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->wordPosition:I

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->wordLength:I

    if-ge v0, v1, :cond_0

    .line 81
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->ewahBuffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->wordPosition:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->wordPosition:I

    aget-wide v0, v0, v1

    iput-wide v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->word:J

    .line 82
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->literalPosition:I

    .line 83
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    add-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    goto :goto_0

    .line 85
    :cond_0
    iget-wide v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->word:J

    cmp-long v0, v0, v3

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
    .line 76
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->runningLength:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private final setRunningLengthWord(Lcom/googlecode/javaewah/RunningLengthWord;)V
    .locals 2
    .parameter "rlw"

    .prologue
    .line 66
    invoke-virtual {p1}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v0

    long-to-int v0, v0

    mul-int/lit8 v0, v0, 0x40

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->runningLength:I

    .line 67
    invoke-virtual {p1}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->runningLength:I

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->ewahIter:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->literalWords()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->wordPosition:I

    .line 72
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->wordPosition:I

    invoke-virtual {p1}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->wordLength:I

    .line 73
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->hasnext:Z

    return v0
.end method

.method public final moveToNext()Z
    .locals 1

    .prologue
    .line 37
    :goto_0
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorImpl;->runningHasNext()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorImpl;->literalHasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 38
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->ewahIter:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    const/4 v0, 0x0

    .line 43
    :goto_1
    return v0

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->ewahIter:Lcom/googlecode/javaewah/EWAHIterator;

    invoke-virtual {v0}, Lcom/googlecode/javaewah/EWAHIterator;->next()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah/IntIteratorImpl;->setRunningLengthWord(Lcom/googlecode/javaewah/RunningLengthWord;)V

    goto :goto_0

    .line 43
    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public final next()I
    .locals 6

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorImpl;->runningHasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 55
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->position:I

    .line 61
    .local v0, answer:I
    :goto_0
    invoke-virtual {p0}, Lcom/googlecode/javaewah/IntIteratorImpl;->moveToNext()Z

    move-result v2

    iput-boolean v2, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->hasnext:Z

    .line 62
    return v0

    .line 57
    .end local v0           #answer:I
    :cond_0
    iget-wide v2, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->word:J

    invoke-static {v2, v3}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v1

    .line 58
    .local v1, bit:I
    iget-wide v2, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->word:J

    const-wide/16 v4, 0x1

    shl-long/2addr v4, v1

    xor-long/2addr v2, v4

    iput-wide v2, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->word:J

    .line 59
    iget v2, p0, Lcom/googlecode/javaewah/IntIteratorImpl;->literalPosition:I

    add-int v0, v2, v1

    .restart local v0       #answer:I
    goto :goto_0
.end method
