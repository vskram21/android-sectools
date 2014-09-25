.class public final Lcom/googlecode/javaewah/RunningLengthWord;
.super Ljava/lang/Object;
.source "RunningLengthWord.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final largestliteralcount:I = 0x7fffffff

.field public static final largestrunninglengthcount:J = 0xffffffffL

.field private static final literalbits:I = 0x1f

.field private static final notrunninglengthplusrunningbit:J = -0x200000000L

.field private static final notshiftedlargestrunninglengthcount:J = -0x1ffffffffL

.field public static final runninglengthbits:I = 0x20

.field private static final runninglengthplusrunningbit:J = 0x1ffffffffL

.field private static final shiftedlargestrunninglengthcount:J = 0x1fffffffeL


# instance fields
.field public parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field public position:I


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V
    .locals 0
    .parameter "a"
    .parameter "p"

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 27
    iput p2, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 28
    return-void
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah/RunningLengthWord;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/RunningLengthWord;

    .line 119
    .local v0, answer:Lcom/googlecode/javaewah/RunningLengthWord;
    iget-object v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iput-object v1, v0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 120
    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    iput v1, v0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    .line 121
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
    invoke-virtual {p0}, Lcom/googlecode/javaewah/RunningLengthWord;->clone()Lcom/googlecode/javaewah/RunningLengthWord;

    move-result-object v0

    return-object v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 3

    .prologue
    .line 36
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v0, v0, v1

    const/16 v2, 0x21

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public getRunningBit()Z
    .locals 4

    .prologue
    .line 45
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v0, v0, v1

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRunningLength()J
    .locals 4

    .prologue
    .line 54
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v0, v0, v1

    const/4 v2, 0x1

    ushr-long/2addr v0, v2

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public setNumberOfLiteralWords(J)V
    .locals 8
    .parameter "number"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v2, v0, v1

    const-wide v4, -0x200000000L

    or-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 66
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v2, v0, v1

    const/16 v4, 0x21

    shl-long v4, p1, v4

    const-wide v6, 0x1ffffffffL

    or-long/2addr v4, v6

    and-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 68
    return-void
.end method

.method public setRunningBit(Z)V
    .locals 6
    .parameter "b"

    .prologue
    .line 77
    if-eqz p1, :cond_0

    .line 78
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v2, v0, v1

    const-wide/16 v4, 0x1

    or-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 81
    :goto_0
    return-void

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v2, v0, v1

    const-wide/16 v4, -0x2

    and-long/2addr v2, v4

    aput-wide v2, v0, v1

    goto :goto_0
.end method

.method public setRunningLength(J)V
    .locals 8
    .parameter "number"

    .prologue
    .line 90
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v2, v0, v1

    const-wide v4, 0x1fffffffeL

    or-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 91
    iget-object v0, p0, Lcom/googlecode/javaewah/RunningLengthWord;->parent:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->buffer:[J

    iget v1, p0, Lcom/googlecode/javaewah/RunningLengthWord;->position:I

    aget-wide v2, v0, v1

    const/4 v4, 0x1

    shl-long v4, p1, v4

    const-wide v6, -0x1ffffffffL

    or-long/2addr v4, v6

    and-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 93
    return-void
.end method

.method public size()J
    .locals 4

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "running bit = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningBit()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " running length = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/RunningLengthWord;->getRunningLength()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " number of lit. words "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah/RunningLengthWord;->getNumberOfLiteralWords()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
