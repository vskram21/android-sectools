.class public final Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;
.super Ljava/lang/Object;
.source "BufferedRunningLengthWord32.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public NumberOfLiteralWords:I

.field public RunningBit:Z

.field public RunningLength:I

.field public literalwordoffset:I


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .parameter "a"

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    .line 26
    ushr-int/lit8 v1, p1, 0x11

    iput v1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 27
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    .line 28
    ushr-int/lit8 v0, p1, 0x1

    const v1, 0xffff

    and-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javaewah32/RunningLengthWord32;)V
    .locals 2
    .parameter "rlw"

    .prologue
    .line 37
    iget-object v0, p1, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p1, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v0, v0, v1

    invoke-direct {p0, v0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;-><init>(I)V

    .line 38
    return-void
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 153
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    .line 154
    .local v0, answer:Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;
    iget v1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    iput v1, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    .line 155
    iget v1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    iput v1, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 156
    iget-boolean v1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    iput-boolean v1, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    .line 157
    iget v1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    iput v1, v0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 158
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
    .line 18
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->clone()Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;

    move-result-object v0

    return-object v0
.end method

.method public discardFirstWords(I)V
    .locals 1
    .parameter "x"

    .prologue
    .line 46
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    if-lt v0, p1, :cond_0

    .line 47
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 54
    :goto_0
    return-void

    .line 50
    :cond_0
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    sub-int/2addr p1, v0

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 52
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    .line 53
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    goto :goto_0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    return v0
.end method

.method public getRunningLength()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    return v0
.end method

.method public reset(I)V
    .locals 3
    .parameter "a"

    .prologue
    const/4 v1, 0x0

    .line 89
    ushr-int/lit8 v0, p1, 0x11

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 90
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    .line 91
    ushr-int/lit8 v0, p1, 0x1

    const v2, 0xffff

    and-int/2addr v0, v2

    iput v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 92
    iput v1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->literalwordoffset:I

    .line 93
    return-void

    :cond_0
    move v0, v1

    .line 90
    goto :goto_0
.end method

.method public reset(Lcom/googlecode/javaewah32/RunningLengthWord32;)V
    .locals 2
    .parameter "rlw"

    .prologue
    .line 102
    iget-object v0, p1, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p1, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->reset(I)V

    .line 103
    return-void
.end method

.method public setNumberOfLiteralWords(I)V
    .locals 0
    .parameter "number"

    .prologue
    .line 111
    iput p1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    .line 112
    return-void
.end method

.method public setRunningBit(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 120
    iput-boolean p1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningBit:Z

    .line 121
    return-void
.end method

.method public setRunningLength(I)V
    .locals 0
    .parameter "number"

    .prologue
    .line 129
    iput p1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    .line 130
    return-void
.end method

.method public size()I
    .locals 2

    .prologue
    .line 138
    iget v0, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->RunningLength:I

    iget v1, p0, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->NumberOfLiteralWords:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "running bit = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->getRunningBit()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " running length = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->getRunningLength()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " number of lit. words "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/BufferedRunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
