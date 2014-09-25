.class public final Lcom/googlecode/javaewah/BufferedRunningLengthWord;
.super Ljava/lang/Object;
.source "BufferedRunningLengthWord.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public NumberOfLiteralWords:I

.field public RunningBit:Z

.field public RunningLength:J

.field public literalwordoffset:I


# direct methods
.method public constructor <init>(J)V
    .locals 6
    .parameter "a"

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    iput v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    .line 26
    const/16 v2, 0x21

    ushr-long v2, p1, v2

    long-to-int v2, v2

    iput v2, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 27
    const-wide/16 v2, 0x1

    and-long/2addr v2, p1

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    move v0, v1

    :cond_0
    iput-boolean v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    .line 28
    ushr-long v0, p1, v1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javaewah/RunningLengthWord;)V
    .locals 2
    .parameter "rlw"

    .prologue
    .line 37
    iget-object v0, p1, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p1, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v0, v0, v1

    invoke-direct {p0, v0, v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;-><init>(J)V

    .line 38
    return-void
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah/BufferedRunningLengthWord;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 153
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    .line 154
    .local v0, answer:Lcom/googlecode/javaewah/BufferedRunningLengthWord;
    iget v1, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    iput v1, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    .line 155
    iget v1, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    iput v1, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 156
    iget-boolean v1, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    iput-boolean v1, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    .line 157
    iget-wide v1, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    iput-wide v1, v0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

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
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->clone()Lcom/googlecode/javaewah/BufferedRunningLengthWord;

    move-result-object v0

    return-object v0
.end method

.method public discardFirstWords(J)V
    .locals 2
    .parameter "x"

    .prologue
    .line 46
    iget-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    cmp-long v0, v0, p1

    if-ltz v0, :cond_0

    .line 47
    iget-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 54
    :goto_0
    return-void

    .line 50
    :cond_0
    iget-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    sub-long/2addr p1, v0

    .line 51
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 52
    iget v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    long-to-int v0, v0

    iput v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    .line 53
    iget v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v0, v0

    sub-long/2addr v0, p1

    long-to-int v0, v0

    iput v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    goto :goto_0
.end method

.method public getNumberOfLiteralWords()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    return v0
.end method

.method public getRunningBit()Z
    .locals 1

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    return v0
.end method

.method public getRunningLength()J
    .locals 2

    .prologue
    .line 80
    iget-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    return-wide v0
.end method

.method public reset(J)V
    .locals 7
    .parameter "a"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 89
    const/16 v0, 0x21

    ushr-long v3, p1, v0

    long-to-int v0, v3

    iput v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 90
    const-wide/16 v3, 0x1

    and-long/2addr v3, p1

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    .line 91
    ushr-long v0, p1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v0, v3

    long-to-int v0, v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 92
    iput v2, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->literalwordoffset:I

    .line 93
    return-void

    :cond_0
    move v0, v2

    .line 90
    goto :goto_0
.end method

.method public reset(Lcom/googlecode/javaewah/RunningLengthWord;)V
    .locals 2
    .parameter "rlw"

    .prologue
    .line 102
    iget-object v0, p1, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p1, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v0, v0, v1

    invoke-virtual {p0, v0, v1}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->reset(J)V

    .line 103
    return-void
.end method

.method public setNumberOfLiteralWords(I)V
    .locals 0
    .parameter "number"

    .prologue
    .line 111
    iput p1, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    .line 112
    return-void
.end method

.method public setRunningBit(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 120
    iput-boolean p1, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningBit:Z

    .line 121
    return-void
.end method

.method public setRunningLength(J)V
    .locals 0
    .parameter "number"

    .prologue
    .line 129
    iput-wide p1, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    .line 130
    return-void
.end method

.method public size()J
    .locals 4

    .prologue
    .line 138
    iget-wide v0, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->RunningLength:J

    iget v2, p0, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->NumberOfLiteralWords:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "running bit = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->getRunningBit()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " running length = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " number of lit. words "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedRunningLengthWord;->getNumberOfLiteralWords()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
