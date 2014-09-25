.class public final Lcom/googlecode/javaewah32/EWAHIterator32;
.super Ljava/lang/Object;
.source "EWAHIterator32.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field pointer:I

.field rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

.field size:I


# direct methods
.method public constructor <init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V
    .locals 2
    .parameter "a"
    .parameter "sizeinwords"

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-direct {v0, p1, v1}, Lcom/googlecode/javaewah32/RunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V

    iput-object v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 27
    iput p2, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->size:I

    .line 28
    iput v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    .line 29
    return-void
.end method

.method public static getEWAHIterator(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHIterator32;
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public buffer()[I
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    return-object v0
.end method

.method public clone()Lcom/googlecode/javaewah32/EWAHIterator32;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/EWAHIterator32;

    .line 82
    .local v0, ans:Lcom/googlecode/javaewah32/EWAHIterator32;
    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->clone()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 83
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->size:I

    iput v1, v0, Lcom/googlecode/javaewah32/EWAHIterator32;->size:I

    .line 84
    iget v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    iput v1, v0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    .line 85
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
    .line 17
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHIterator32;->clone()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .locals 2

    .prologue
    .line 65
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->size:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public literalWords()I
    .locals 2

    .prologue
    .line 56
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public next()Lcom/googlecode/javaewah32/RunningLengthWord32;
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    iget v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    iput v1, v0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 75
    iget v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->pointer:I

    .line 76
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHIterator32;->rlw:Lcom/googlecode/javaewah32/RunningLengthWord32;

    return-object v0
.end method
