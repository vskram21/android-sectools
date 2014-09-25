.class Lcom/googlecode/javaewah/BufferedORIterator;
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

.field hardbitmap:[J

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
.method constructor <init>(Ljava/util/LinkedList;I)V
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
    .line 476
    .local p1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah/IteratingRLW;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 471
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedORIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 477
    iput-object p1, p0, Lcom/googlecode/javaewah/BufferedORIterator;->ll:Ljava/util/LinkedList;

    .line 478
    new-array v0, p2, [J

    iput-object v0, p0, Lcom/googlecode/javaewah/BufferedORIterator;->hardbitmap:[J

    .line 479
    return-void
.end method


# virtual methods
.method public clone()Lcom/googlecode/javaewah/BufferedXORIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 483
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javaewah/BufferedXORIterator;

    .line 484
    .local v0, answer:Lcom/googlecode/javaewah/BufferedXORIterator;
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedORIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clone()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedXORIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 485
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedORIterator;->hardbitmap:[J

    invoke-virtual {v1}, [J->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedXORIterator;->hardbitmap:[J

    .line 486
    iget-object v1, p0, Lcom/googlecode/javaewah/BufferedORIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedList;

    iput-object v1, v0, Lcom/googlecode/javaewah/BufferedXORIterator;->ll:Ljava/util/LinkedList;

    .line 487
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
    .line 470
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedORIterator;->clone()Lcom/googlecode/javaewah/BufferedXORIterator;

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
    .line 470
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedORIterator;->clone()Lcom/googlecode/javaewah/BufferedXORIterator;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 492
    iget-object v0, p0, Lcom/googlecode/javaewah/BufferedORIterator;->ll:Ljava/util/LinkedList;

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
    .locals 11

    .prologue
    const-wide/16 v9, 0x0

    .line 497
    iget-object v6, p0, Lcom/googlecode/javaewah/BufferedORIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v6}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clear()V

    .line 498
    const-wide/16 v1, 0x0

    .line 499
    .local v1, effective:J
    iget-object v6, p0, Lcom/googlecode/javaewah/BufferedORIterator;->ll:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 500
    .local v3, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/googlecode/javaewah/IteratingRLW;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 501
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javaewah/IteratingRLW;

    .line 502
    .local v5, rlw:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v6

    cmp-long v6, v6, v9

    if-lez v6, :cond_1

    .line 503
    iget-object v6, p0, Lcom/googlecode/javaewah/BufferedORIterator;->hardbitmap:[J

    invoke-static {v6, v5}, Lcom/googlecode/javaewah/IteratorAggregation;->inplaceor([JLcom/googlecode/javaewah/IteratingRLW;)I

    move-result v0

    .line 504
    .local v0, eff:I
    int-to-long v6, v0

    cmp-long v6, v6, v1

    if-lez v6, :cond_0

    .line 505
    int-to-long v1, v0

    goto :goto_0

    .line 507
    .end local v0           #eff:I
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 509
    .end local v5           #rlw:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_2
    const/4 v4, 0x0

    .local v4, k:I
    :goto_1
    int-to-long v6, v4

    cmp-long v6, v6, v1

    if-gez v6, :cond_3

    .line 510
    iget-object v6, p0, Lcom/googlecode/javaewah/BufferedORIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    iget-object v7, p0, Lcom/googlecode/javaewah/BufferedORIterator;->hardbitmap:[J

    aget-wide v7, v7, v4

    invoke-virtual {v6, v7, v8}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->add(J)V

    .line 509
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 513
    :cond_3
    iget-object v6, p0, Lcom/googlecode/javaewah/BufferedORIterator;->hardbitmap:[J

    invoke-static {v6, v9, v10}, Ljava/util/Arrays;->fill([JJ)V

    .line 514
    iget-object v6, p0, Lcom/googlecode/javaewah/BufferedORIterator;->buffer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v6}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v6

    return-object v6
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 470
    invoke-virtual {p0}, Lcom/googlecode/javaewah/BufferedORIterator;->next()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v0

    return-object v0
.end method
