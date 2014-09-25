.class public Lcom/googlecode/javaewah32/BufferedIterator32;
.super Ljava/lang/Object;
.source "BufferedIterator32.java"

# interfaces
.implements Lcom/googlecode/javaewah32/IteratingRLW32;
.implements Ljava/lang/Cloneable;


# instance fields
.field private brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

.field private buffer:[I

.field private iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

.field private literalWordStartPosition:I

.field private masteriterator:Lcom/googlecode/javaewah/CloneableIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javaewah/CloneableIterator",
            "<",
            "Lcom/googlecode/javaewah32/EWAHIterator32;",
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
            "Lcom/googlecode/javaewah32/EWAHIterator32;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, iterator:Lcom/googlecode/javaewah/CloneableIterator;,"Lcom/googlecode/javaewah/CloneableIterator<Lcom/googlecode/javaewah32/EWAHIterator32;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    .line 24
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 25
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/EWAHIterator32;

    iput-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    .line 26
    new-instance v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/RunningLengthWord32;)V

    iput-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    .line 27
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v0

    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->literalWordStartPosition:I

    .line 28
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->buffer:[I

    .line 30
    :cond_0
    return-void
.end method

.method private reload()Z
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    const/4 v0, 0x0

    .line 82
    :goto_0
    return v0

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/CloneableIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/EWAHIterator32;

    iput-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    .line 81
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->buffer()[I

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->buffer:[I

    .line 82
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah32/BufferedIterator32;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/BufferedIterator32;

    .line 139
    .local v0, answer:Lcom/googlecode/javaewah32/BufferedIterator32;
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->clone()Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    .line 140
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->buffer:[I

    iput-object v1, v0, Lcom/googlecode/javaewah32/BufferedIterator32;->buffer:[I

    .line 141
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->clone()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    .line 142
    iget v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->literalWordStartPosition:I

    iput v1, v0, Lcom/googlecode/javaewah32/BufferedIterator32;->literalWordStartPosition:I

    .line 143
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/CloneableIterator;->clone()Lcom/googlecode/javaewah/CloneableIterator;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/BufferedIterator32;->masteriterator:Lcom/googlecode/javaewah/CloneableIterator;

    .line 144
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
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/BufferedIterator32;->clone()Lcom/googlecode/javaewah32/BufferedIterator32;

    move-result-object v0

    return-object v0
.end method

.method public discardFirstWords(I)V
    .locals 3
    .parameter "x"

    .prologue
    .line 40
    :cond_0
    if-lez p1, :cond_1

    .line 41
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    if-le v1, p1, :cond_2

    .line 42
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    sub-int/2addr v2, p1

    iput v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 58
    :cond_1
    :goto_0
    return-void

    .line 45
    :cond_2
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    sub-int/2addr p1, v1

    .line 46
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    const/4 v2, 0x0

    iput v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 47
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v1, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    if-le p1, v1, :cond_4

    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v0, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 49
    .local v0, toDiscard:I
    :goto_1
    iget v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->literalWordStartPosition:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->literalWordStartPosition:I

    .line 50
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    sub-int/2addr v2, v0

    iput v2, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 51
    sub-int/2addr p1, v0

    .line 52
    if-gtz p1, :cond_3

    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 53
    :cond_3
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/BufferedIterator32;->next()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .end local v0           #toDiscard:I
    :cond_4
    move v0, p1

    .line 47
    goto :goto_1
.end method

.method public getLiteralWordAt(I)I
    .locals 2
    .parameter "index"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->literalWordStartPosition:I

    add-int/2addr v1, p1

    aget v0, v0, v1

    return v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v0, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-boolean v0, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    return v0
.end method

.method public getRunningLength()I
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget v0, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    return v0
.end method

.method public next()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 65
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 66
    invoke-direct {p0}, Lcom/googlecode/javaewah32/BufferedIterator32;->reload()Z

    move-result v1

    if-nez v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iput v0, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 68
    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iput v0, v1, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 74
    :goto_0
    return v0

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    iget-object v1, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHIterator32;->next()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->reset(Lcom/googlecode/javaewah32/RunningLengthWord32;)V

    .line 73
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->iterator:Lcom/googlecode/javaewah32/EWAHIterator32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHIterator32;->literalWords()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->literalWordStartPosition:I

    .line 74
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/googlecode/javaewah32/BufferedIterator32;->brlw:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->size()I

    move-result v0

    return v0
.end method
