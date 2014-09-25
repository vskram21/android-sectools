.class public final Lcom/googlecode/javaewah/BitCounter;
.super Ljava/lang/Object;
.source "BitCounter.java"

# interfaces
.implements Lcom/googlecode/javaewah/BitmapStorage;


# instance fields
.field private oneBits:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(J)V
    .locals 2
    .parameter "newdata"

    .prologue
    .line 25
    iget v0, p0, Lcom/googlecode/javaewah/BitCounter;->oneBits:I

    invoke-static {p1, p2}, Ljava/lang/Long;->bitCount(J)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/googlecode/javaewah/BitCounter;->oneBits:I

    .line 26
    return-void
.end method

.method public addStreamOfEmptyWords(ZJ)V
    .locals 4
    .parameter "v"
    .parameter "number"

    .prologue
    .line 57
    if-eqz p1, :cond_0

    .line 58
    iget v0, p0, Lcom/googlecode/javaewah/BitCounter;->oneBits:I

    int-to-long v0, v0

    const-wide/16 v2, 0x40

    mul-long/2addr v2, p2

    add-long/2addr v0, v2

    long-to-int v0, v0

    iput v0, p0, Lcom/googlecode/javaewah/BitCounter;->oneBits:I

    .line 60
    :cond_0
    return-void
.end method

.method public addStreamOfLiteralWords([JII)V
    .locals 3
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
    aget-wide v1, p1, v0

    invoke-virtual {p0, v1, v2}, Lcom/googlecode/javaewah/BitCounter;->add(J)V

    .line 41
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method public addStreamOfNegatedLiteralWords([JII)V
    .locals 5
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 76
    move v0, p2

    .local v0, i:I
    :goto_0
    add-int v1, p2, p3

    if-ge v0, v1, :cond_0

    .line 77
    aget-wide v1, p1, v0

    const-wide/16 v3, -0x1

    xor-long/2addr v1, v3

    invoke-virtual {p0, v1, v2}, Lcom/googlecode/javaewah/BitCounter;->add(J)V

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 79
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lcom/googlecode/javaewah/BitCounter;->oneBits:I

    return v0
.end method

.method public setSizeInBits(I)V
    .locals 0
    .parameter "bits"

    .prologue
    .line 102
    return-void
.end method
