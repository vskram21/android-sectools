.class public final Lcom/googlecode/javaewah32/BitCounter32;
.super Ljava/lang/Object;
.source "BitCounter32.java"

# interfaces
.implements Lcom/googlecode/javaewah32/BitmapStorage32;


# instance fields
.field private oneBits:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 2
    .parameter "newdata"

    .prologue
    .line 27
    iget v0, p0, Lcom/googlecode/javaewah32/BitCounter32;->oneBits:I

    invoke-static {p1}, Ljava/lang/Integer;->bitCount(I)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/BitCounter32;->oneBits:I

    .line 28
    return-void
.end method

.method public addStreamOfEmptyWords(ZI)V
    .locals 2
    .parameter "v"
    .parameter "number"

    .prologue
    .line 57
    if-eqz p1, :cond_0

    .line 58
    iget v0, p0, Lcom/googlecode/javaewah32/BitCounter32;->oneBits:I

    mul-int/lit8 v1, p2, 0x20

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah32/BitCounter32;->oneBits:I

    .line 60
    :cond_0
    return-void
.end method

.method public addStreamOfLiteralWords([III)V
    .locals 2
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 41
    move v0, p2

    .local v0, i:I
    :goto_0
    add-int v1, p2, p3

    if-ge v0, v1, :cond_0

    .line 42
    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/googlecode/javaewah32/BitCounter32;->add(I)V

    .line 41
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method public addStreamOfNegatedLiteralWords([III)V
    .locals 2
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 73
    move v0, p2

    .local v0, i:I
    :goto_0
    add-int v1, p2, p3

    if-ge v0, v1, :cond_0

    .line 74
    aget v1, p1, v0

    xor-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/googlecode/javaewah32/BitCounter32;->add(I)V

    .line 73
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 76
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/googlecode/javaewah32/BitCounter32;->oneBits:I

    return v0
.end method

.method public setSizeInBits(I)V
    .locals 0
    .parameter "bits"

    .prologue
    .line 96
    return-void
.end method
