.class Lcom/googlecode/javaewah/BufferedAndIterator;
.super Ljava/lang/Object;
.source "IteratorAggregation.java"

# interfaces
.implements Lcom/googlecode/javaewah/CloneableIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/googlecode/javaewah/CloneableIterator",
        "<",
        "Lcom/googlecode/javaewah/EWAHIterator;",
        ">;"
    }
.end annotation


# instance fields
.field buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field buffersize:I

.field ll:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/googlecode/javaewah/IteratingRLW;",
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
            "Lcom/googlecode/javaewah/IteratingRLW;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 570
    .local p1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah/IteratingRLW;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 566
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 571
    iput-object p1, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    .line 572
    iput p2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffersize:I

    .line 574
    return-void
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah/BufferedAndIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 583
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/BufferedAndIterator;

    .line 584
    .local v0, answer:Lcom/googlecode/javaewah/BufferedAndIterator;
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clone()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 585
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedList;

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    .line 586
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/googlecode/javaewah/CloneableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 565
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedAndIterator;->clone()Lcom/googlecode/javaewah/BufferedAndIterator;

    move-result-object v0

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
    .line 565
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedAndIterator;->clone()Lcom/googlecode/javaewah/BufferedAndIterator;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 578
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

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

.method public next()Lcom/googlecode/javaewah/EWAHIterator;
    .locals 7

    .prologue
    .line 591
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clear()V

    .line 592
    iget-object v4, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffersize:I

    iget-object v3, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    mul-int v5, v2, v3

    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javaewah/IteratingRLW;

    iget-object v3, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/googlecode/javaewah/IteratingRLW;

    invoke-static {v4, v5, v2, v3}, Lcom/googlecode/javaewah/IteratorAggregation;->andToContainer(Lcom/googlecode/javaewah/BitmapStorage;ILcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/IteratingRLW;)V

    .line 594
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    const/4 v3, 0x2

    if-le v2, v3, :cond_0

    .line 595
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 596
    .local v0, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah/IteratingRLW;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 597
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 598
    new-instance v1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 599
    .local v1, tmpbuffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v2

    if-lez v2, :cond_0

    .line 600
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getIteratingRLW()Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javaewah/IteratingRLW;

    invoke-static {v1, v3, v2}, Lcom/googlecode/javaewah/IteratorAggregation;->andToContainer(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/IteratingRLW;)V

    .line 602
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v2, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->swap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 603
    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clear()V

    goto :goto_0

    .line 606
    .end local v0           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah/IteratingRLW;>;"
    .end local v1           #tmpbuffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_0
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 607
    .restart local v0       #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah/IteratingRLW;>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 608
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javaewah/IteratingRLW;

    invoke-interface {v2}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 609
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 613
    :cond_2
    iget-object v2, p0, Lcom/googlecode/javaewah/BufferedAndIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v2

    return-object v2
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 565
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedAndIterator;->next()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v0

    return-object v0
.end method
