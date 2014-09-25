.class public final Lcom/googlecode/javaewah/EWAHIterator;
.super Ljava/lang/Object;
.source "EWAHIterator.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field pointer:I

.field rlw:Lcom/googlecode/javaewah/RunningLengthWord;

.field size:I


# direct methods
.method public constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V
    .locals 2
    .parameter "a"
    .parameter "sizeinwords"

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-direct {v0, p1, v1}, Lcom/googlecode/javaewah/RunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    iput-object v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 27
    iput p2, p0, Lcom/googlecode/javaewah/EWAHIterator;->size:I

    .line 28
    iput v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    .line 29
    return-void
.end method

.method public static getEWAHIterator(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHIterator;
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public buffer()[J
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget-object v0, v0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    return-object v0
.end method

.method public clone()Lcom/googlecode/javaewah/EWAHIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 82
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/EWAHIterator;

    .line 83
    .local v0, ans:Lcom/googlecode/javaewah/EWAHIterator;
    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/RunningLengthWord;->clone()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    .line 84
    iget v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->size:I

    iput v1, v0, Lcom/googlecode/javaewah/EWAHIterator;->size:I

    .line 85
    iget v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    iput v1, v0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    .line 86
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
    invoke-virtual {p0}, Lcom/googlecode/javaewah/EWAHIterator;->clone()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .locals 2

    .prologue
    .line 66
    iget v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    iget v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->size:I

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
    .line 57
    iget v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public next()Lcom/googlecode/javaewah/RunningLengthWord;
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    iget v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    iput v1, v0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 76
    iget v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    iget-object v1, p0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->pointer:I

    .line 77
    iget-object v0, p0, Lcom/googlecode/javaewah/EWAHIterator;->rlw:Lcom/googlecode/javaewah/RunningLengthWord;

    return-object v0
.end method
