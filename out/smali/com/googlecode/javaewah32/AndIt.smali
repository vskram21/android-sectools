.class Lcom/googlecode/javaewah32/AndIt;
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

.field buffersize:I

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
.method public constructor <init>(Ljava/util/LinkedList;I)V
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
    .line 556
    .local p1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 552
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 557
    iput-object p1, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    .line 558
    iput p2, p0, Lcom/googlecode/javaewah32/AndIt;->buffersize:I

    .line 559
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
    .line 551
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/AndIt;->clone()Lcom/googlecode/javaewah32/AndIt;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/googlecode/javaewah32/AndIt;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 568
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah32/AndIt;

    .line 569
    .local v0, answer:Lcom/googlecode/javaewah32/AndIt;
    iget-object v1, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clone()Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 570
    iget-object v1, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedList;

    iput-object v1, v0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    .line 571
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
    .line 551
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/AndIt;->clone()Lcom/googlecode/javaewah32/AndIt;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 563
    iget-object v0, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

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
    .line 576
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clear()V

    .line 577
    iget-object v4, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    iget v2, p0, Lcom/googlecode/javaewah32/AndIt;->buffersize:I

    iget-object v3, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    mul-int v5, v2, v3

    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javaewah32/IteratingRLW32;

    iget-object v3, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-static {v4, v5, v2, v3}, Lcom/googlecode/javaewah32/IteratorAggregation32;->andToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;ILcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/IteratingRLW32;)V

    .line 579
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    const/4 v3, 0x2

    if-le v2, v3, :cond_0

    .line 580
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 581
    .local v0, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 582
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 583
    new-instance v1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 584
    .local v1, tmpbuffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBytes()I

    move-result v2

    if-lez v2, :cond_0

    .line 585
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getIteratingRLW()Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-static {v1, v3, v2}, Lcom/googlecode/javaewah32/IteratorAggregation32;->andToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/IteratingRLW32;)V

    .line 587
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v2, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->swap(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 588
    invoke-virtual {v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clear()V

    goto :goto_0

    .line 591
    .end local v0           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    .end local v1           #tmpbuffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_0
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 592
    .restart local v0       #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 593
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-interface {v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 594
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 598
    :cond_2
    iget-object v2, p0, Lcom/googlecode/javaewah32/AndIt;->buffer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v2}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v2

    return-object v2
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 551
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/AndIt;->next()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v0

    return-object v0
.end method
