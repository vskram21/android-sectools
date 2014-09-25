.class Lcom/googlecode/javaewah32/XORIt;
.super Ljava/lang/Object;
.source "IteratorAggregation32.java"

# interfaces
.implements Lcom/googlecode/javaewah/CloneableIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/googlecode/javaewah/CloneableIterator",
        "<",
        "Lcom/googlecode/javaewah32/EWAHIterator32;",
        ">;"
    }
.end annotation


# instance fields
.field buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

.field hardbitmap:[I

.field ll:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/googlecode/javaewah32/IteratingRLW32;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/LinkedList;I)V
    .locals 1
    .parameter
    .parameter "bufsize"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/googlecode/javaewah32/IteratingRLW32;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 510
    .local p1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 506
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah32/XORIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 511
    iput-object p1, p0, Lcom/googlecode/javaewah32/XORIt;->ll:Ljava/util/LinkedList;

    .line 512
    new-array v0, p2, [I

    iput-object v0, p0, Lcom/googlecode/javaewah32/XORIt;->hardbitmap:[I

    .line 514
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/googlecode/javaewah/CloneableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 505
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/XORIt;->clone()Lcom/googlecode/javaewah32/XORIt;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/googlecode/javaewah32/XORIt;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 518
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/XORIt;

    .line 519
    .local v0, answer:Lcom/googlecode/javaewah32/XORIt;
    iget-object v1, p0, Lcom/googlecode/javaewah32/XORIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clone()Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/XORIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 520
    iget-object v1, p0, Lcom/googlecode/javaewah32/XORIt;->hardbitmap:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lcom/googlecode/javaewah32/XORIt;->hardbitmap:[I

    .line 521
    iget-object v1, p0, Lcom/googlecode/javaewah32/XORIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedList;

    iput-object v1, v0, Lcom/googlecode/javaewah32/XORIt;->ll:Ljava/util/LinkedList;

    .line 522
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
    .line 505
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/XORIt;->clone()Lcom/googlecode/javaewah32/XORIt;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 527
    iget-object v0, p0, Lcom/googlecode/javaewah32/XORIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Lcom/googlecode/javaewah32/EWAHIterator32;
    .locals 7

    .prologue
    .line 532
    iget-object v5, p0, Lcom/googlecode/javaewah32/XORIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clear()V

    .line 533
    const/4 v1, 0x0

    .line 534
    .local v1, effective:I
    iget-object v5, p0, Lcom/googlecode/javaewah32/XORIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 535
    .local v2, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 536
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/googlecode/javaewah32/IteratingRLW32;

    .line 537
    .local v4, rlw:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 538
    iget-object v5, p0, Lcom/googlecode/javaewah32/XORIt;->hardbitmap:[I

    invoke-static {v5, v4}, Lcom/googlecode/javaewah32/IteratorAggregation32;->inplacexor([ILcom/googlecode/javaewah32/IteratingRLW32;)I

    move-result v0

    .line 539
    .local v0, eff:I
    if-le v0, v1, :cond_0

    .line 540
    move v1, v0

    goto :goto_0

    .line 542
    .end local v0           #eff:I
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 544
    .end local v4           #rlw:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_2
    const/4 v3, 0x0

    .local v3, k:I
    :goto_1
    if-ge v3, v1, :cond_3

    .line 545
    iget-object v5, p0, Lcom/googlecode/javaewah32/XORIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget-object v6, p0, Lcom/googlecode/javaewah32/XORIt;->hardbitmap:[I

    aget v6, v6, v3

    invoke-virtual {v5, v6}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->add(I)V

    .line 544
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 546
    :cond_3
    iget-object v5, p0, Lcom/googlecode/javaewah32/XORIt;->hardbitmap:[I

    const/4 v6, 0x0

    invoke-static {v5, v6}, Ljava/util/Arrays;->fill([II)V

    .line 547
    iget-object v5, p0, Lcom/googlecode/javaewah32/XORIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v5}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v5

    return-object v5
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 505
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/XORIt;->next()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v0

    return-object v0
.end method
