.class public final Lcom/googlecode/javaewah32/RunningLengthWord32;
.super Ljava/lang/Object;
.source "RunningLengthWord32.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final largestliteralcount:I = 0x7fff

.field public static final largestrunninglengthcount:I = 0xffff

.field private static final literalbits:I = 0xf

.field private static final notrunninglengthplusrunningbit:I = -0x20000

.field private static final notshiftedlargestrunninglengthcount:I = -0x1ffff

.field public static final runninglengthbits:I = 0x10

.field private static final runninglengthplusrunningbit:I = 0x1ffff

.field private static final shiftedlargestrunninglengthcount:I = 0x1fffe


# instance fields
.field public parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

.field public position:I


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;I)V
    .locals 0
    .parameter "a"
    .parameter "p"

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 27
    iput p2, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    .line 28
    return-void
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah32/RunningLengthWord32;
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

    check-cast v0, Lcom/googlecode/javaewah32/RunningLengthWord32;

    .line 119
    .local v0, answer:Lcom/googlecode/javaewah32/RunningLengthWord32;
    iget-object v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iput-object v1, v0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 120
    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    iput v1, v0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

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
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/RunningLengthWord32;->clone()Lcom/googlecode/javaewah32/RunningLengthWord32;

    move-result-object v0

    return-object v0
.end method

.method public getNumberOfLiteralWords()I
    .locals 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v0, v0, v1

    ushr-int/lit8 v0, v0, 0x11

    return v0
.end method

.method public getRunningBit()Z
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v0, v0, v1

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRunningLength()I
    .locals 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v0, v0, v1

    ushr-int/lit8 v0, v0, 0x1

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method public setNumberOfLiteralWords(I)V
    .locals 5
    .parameter "number"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v2, v0, v1

    const/high16 v3, -0x2

    or-int/2addr v2, v3

    aput v2, v0, v1

    .line 66
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v2, v0, v1

    shl-int/lit8 v3, p1, 0x11

    const v4, 0x1ffff

    or-int/2addr v3, v4

    and-int/2addr v2, v3

    aput v2, v0, v1

    .line 68
    return-void
.end method

.method public setRunningBit(Z)V
    .locals 3
    .parameter "b"

    .prologue
    .line 77
    if-eqz p1, :cond_0

    .line 78
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v2, v0, v1

    or-int/lit8 v2, v2, 0x1

    aput v2, v0, v1

    .line 81
    :goto_0
    return-void

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v2, v0, v1

    and-int/lit8 v2, v2, -0x2

    aput v2, v0, v1

    goto :goto_0
.end method

.method public setRunningLength(I)V
    .locals 5
    .parameter "number"

    .prologue
    .line 90
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v2, v0, v1

    const v3, 0x1fffe

    or-int/2addr v2, v3

    aput v2, v0, v1

    .line 91
    iget-object v0, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->parent:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v0, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->buffer:[I

    iget v1, p0, Lcom/googlecode/javaewah32/RunningLengthWord32;->position:I

    aget v2, v0, v1

    shl-int/lit8 v3, p1, 0x1

    const v4, -0x1ffff

    or-int/2addr v3, v4

    and-int/2addr v2, v3

    aput v2, v0, v1

    .line 93
    return-void
.end method

.method public size()I
    .locals 2

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "running bit = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningBit()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " running length = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getRunningLength()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " number of lit. words "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javaewah32/RunningLengthWord32;->getNumberOfLiteralWords()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
