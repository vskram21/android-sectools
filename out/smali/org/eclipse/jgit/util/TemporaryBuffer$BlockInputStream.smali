.class Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;
.super Ljava/io/InputStream;
.source "TemporaryBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/TemporaryBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BlockInputStream"
.end annotation


# instance fields
.field private block:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

.field private blockIndex:I

.field private blockPos:I

.field private singleByteBuffer:[B

.field final synthetic this$0:Lorg/eclipse/jgit/util/TemporaryBuffer;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/TemporaryBuffer;)V
    .locals 2
    .parameter

    .prologue
    .line 534
    iput-object p1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->this$0:Lorg/eclipse/jgit/util/TemporaryBuffer;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 535
    #getter for: Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;
    invoke-static {p1}, Lorg/eclipse/jgit/util/TemporaryBuffer;->access$000(Lorg/eclipse/jgit/util/TemporaryBuffer;)Ljava/util/ArrayList;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    iput-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->block:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .line 536
    return-void
.end method

.method private nextBlock()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 585
    iget v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockIndex:I

    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->this$0:Lorg/eclipse/jgit/util/TemporaryBuffer;

    #getter for: Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;
    invoke-static {v2}, Lorg/eclipse/jgit/util/TemporaryBuffer;->access$000(Lorg/eclipse/jgit/util/TemporaryBuffer;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 586
    iget-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->this$0:Lorg/eclipse/jgit/util/TemporaryBuffer;

    #getter for: Lorg/eclipse/jgit/util/TemporaryBuffer;->blocks:Ljava/util/ArrayList;
    invoke-static {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->access$000(Lorg/eclipse/jgit/util/TemporaryBuffer;)Ljava/util/ArrayList;

    move-result-object v0

    iget v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockIndex:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    iput-object v0, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->block:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    .line 587
    iput v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    .line 588
    const/4 v0, 0x1

    .line 590
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 540
    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->singleByteBuffer:[B

    if-nez v1, :cond_0

    .line 541
    new-array v1, v2, [B

    iput-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->singleByteBuffer:[B

    .line 542
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->singleByteBuffer:[B

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->read([B)I

    move-result v0

    .line 543
    .local v0, n:I
    if-ne v0, v2, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->singleByteBuffer:[B

    const/4 v2, 0x0

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    :goto_0
    return v1

    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 4
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 565
    if-nez p3, :cond_1

    .line 566
    const/4 v1, 0x0

    .line 581
    :cond_0
    :goto_0
    return v1

    .line 567
    :cond_1
    const/4 v1, 0x0

    .line 568
    .local v1, copied:I
    :cond_2
    :goto_1
    if-lez p3, :cond_4

    .line 569
    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->block:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    iget v2, v2, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    iget v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    sub-int/2addr v2, v3

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 570
    .local v0, c:I
    if-lez v0, :cond_3

    .line 571
    iget-object v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->block:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    iget-object v2, v2, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->buffer:[B

    iget v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    invoke-static {v2, v3, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 572
    iget v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    .line 573
    add-int/2addr p2, v0

    .line 574
    sub-int/2addr p3, v0

    .line 575
    add-int/2addr v1, v0

    goto :goto_1

    .line 576
    :cond_3
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->nextBlock()Z

    move-result v2

    if-nez v2, :cond_2

    .line 581
    .end local v0           #c:I
    :cond_4
    if-gtz v1, :cond_0

    const/4 v1, -0x1

    goto :goto_0
.end method

.method public skip(J)J
    .locals 5
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 548
    const-wide/16 v1, 0x0

    .line 549
    .local v1, skipped:J
    :cond_0
    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v3, v3, p1

    if-gez v3, :cond_2

    .line 550
    iget-object v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->block:Lorg/eclipse/jgit/util/TemporaryBuffer$Block;

    iget v3, v3, Lorg/eclipse/jgit/util/TemporaryBuffer$Block;->count:I

    iget v4, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v0, v3

    .line 551
    .local v0, n:I
    if-lez v0, :cond_1

    .line 552
    iget v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->blockPos:I

    .line 553
    int-to-long v3, v0

    add-long/2addr v1, v3

    .line 554
    int-to-long v3, v0

    sub-long/2addr p1, v3

    goto :goto_0

    .line 555
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer$BlockInputStream;->nextBlock()Z

    move-result v3

    if-nez v3, :cond_0

    .line 560
    .end local v0           #n:I
    :cond_2
    return-wide v1
.end method
