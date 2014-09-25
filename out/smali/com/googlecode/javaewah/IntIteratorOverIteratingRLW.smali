.class public Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;
.super Ljava/lang/Object;
.source "IntIteratorOverIteratingRLW.java"

# interfaces
.implements Lcom/googlecode/javaewah/IntIterator;


# instance fields
.field private hasnext:Z

.field private literalPosition:I

.field parent:Lcom/googlecode/javaewah/IteratingRLW;

.field private position:I

.field private runningLength:I

.field private word:J

.field private wordLength:I

.field private wordPosition:I


# direct methods
.method public constructor <init>(Lcom/googlecode/javaewah/IteratingRLW;)V
    .locals 1
    .parameter "p"

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->parent:Lcom/googlecode/javaewah/IteratingRLW;

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    .line 31
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->setupForCurrentRunningLengthWord()V

    .line 32
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->moveToNext()Z

    move-result v0

    iput-boolean v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->hasnext:Z

    .line 33
    return-void
.end method

.method private final literalHasNext()Z
    .locals 5

    .prologue
    const-wide/16 v3, 0x0

    .line 82
    :goto_0
    iget-wide v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->word:J

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->wordPosition:I

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->wordLength:I

    if-ge v0, v1, :cond_0

    .line 83
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->parent:Lcom/googlecode/javaewah/IteratingRLW;

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->wordPosition:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->wordPosition:I

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->word:J

    .line 84
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->literalPosition:I

    .line 85
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    add-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    goto :goto_0

    .line 87
    :cond_0
    iget-wide v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->word:J

    cmp-long v0, v0, v3

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private final moveToNext()Z
    .locals 1

    .prologue
    .line 39
    :goto_0
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->runningHasNext()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->literalHasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 40
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->parent:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->setupForCurrentRunningLengthWord()V

    goto :goto_0

    .line 42
    :cond_0
    const/4 v0, 0x0

    .line 44
    :goto_1
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method

.method private final runningHasNext()Z
    .locals 2

    .prologue
    .line 78
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->runningLength:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private final setupForCurrentRunningLengthWord()V
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->parent:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v0

    long-to-int v0, v0

    mul-int/lit8 v0, v0, 0x40

    iget v1, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->runningLength:I

    .line 70
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->parent:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->runningLength:I

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    .line 73
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->wordPosition:I

    .line 74
    iget-object v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->parent:Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->wordLength:I

    .line 75
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->hasnext:Z

    return v0
.end method

.method public final next()I
    .locals 6

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->runningHasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 56
    iget v0, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->position:I

    .line 62
    .local v0, answer:I
    :goto_0
    invoke-direct {p0}, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->moveToNext()Z

    move-result v2

    iput-boolean v2, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->hasnext:Z

    .line 63
    return v0

    .line 58
    .end local v0           #answer:I
    :cond_0
    iget-wide v2, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->word:J

    invoke-static {v2, v3}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v1

    .line 59
    .local v1, bit:I
    iget-wide v2, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->word:J

    const-wide/16 v4, 0x1

    shl-long/2addr v4, v1

    xor-long/2addr v2, v4

    iput-wide v2, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->word:J

    .line 60
    iget v2, p0, Lcom/googlecode/javaewah/IntIteratorOverIteratingRLW;->literalPosition:I

    add-int v0, v2, v1

    .restart local v0       #answer:I
    goto :goto_0
.end method
