.class Lorg/eclipse/jgit/transport/PackParser$InflaterStream;
.super Ljava/io/InputStream;
.source "PackParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PackParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InflaterStream"
.end annotation


# instance fields
.field private actualSize:J

.field private expectedSize:J

.field private final inf:Ljava/util/zip/Inflater;

.field private p:I

.field private final skipBuffer:[B

.field private src:Lorg/eclipse/jgit/transport/PackParser$Source;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/PackParser;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/PackParser;)V
    .locals 1
    .parameter

    .prologue
    .line 1612
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 1613
    invoke-static {}, Lorg/eclipse/jgit/lib/InflaterCache;->get()Ljava/util/zip/Inflater;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    .line 1614
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->skipBuffer:[B

    .line 1615
    return-void
.end method


# virtual methods
.method public close()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1690
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->skipBuffer:[B

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iget-wide v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->actualSize:J

    iget-wide v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->expectedSize:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    .line 1691
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->packfileCorruptionDetected:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->wrongDecompressedLength:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1696
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->bAvail:I
    invoke-static {v1}, Lorg/eclipse/jgit/transport/PackParser;->access$200(Lorg/eclipse/jgit/transport/PackParser;)I

    move-result v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v2

    sub-int v0, v1, v2

    .line 1697
    .local v0, used:I
    if-lez v0, :cond_2

    .line 1698
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->src:Lorg/eclipse/jgit/transport/PackParser$Source;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->buf:[B
    invoke-static {v3}, Lorg/eclipse/jgit/transport/PackParser;->access$100(Lorg/eclipse/jgit/transport/PackParser;)[B

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->p:I

    invoke-virtual {v1, v2, v3, v4, v0}, Lorg/eclipse/jgit/transport/PackParser;->onObjectData(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    .line 1699
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #calls: Lorg/eclipse/jgit/transport/PackParser;->use(I)V
    invoke-static {v1, v0}, Lorg/eclipse/jgit/transport/PackParser;->access$300(Lorg/eclipse/jgit/transport/PackParser;I)V

    .line 1702
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v1}, Ljava/util/zip/Inflater;->reset()V

    .line 1703
    return-void
.end method

.method open(Lorg/eclipse/jgit/transport/PackParser$Source;J)V
    .locals 4
    .parameter "source"
    .parameter "inflatedSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1623
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->src:Lorg/eclipse/jgit/transport/PackParser$Source;

    .line 1624
    iput-wide p2, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->expectedSize:J

    .line 1625
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->actualSize:J

    .line 1627
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->src:Lorg/eclipse/jgit/transport/PackParser$Source;

    const/4 v2, 0x1

    #calls: Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I
    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/transport/PackParser;->access$000(Lorg/eclipse/jgit/transport/PackParser;Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->p:I

    .line 1628
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->buf:[B
    invoke-static {v1}, Lorg/eclipse/jgit/transport/PackParser;->access$100(Lorg/eclipse/jgit/transport/PackParser;)[B

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->p:I

    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->bAvail:I
    invoke-static {v3}, Lorg/eclipse/jgit/transport/PackParser;->access$200(Lorg/eclipse/jgit/transport/PackParser;)I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 1629
    return-void
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1646
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->skipBuffer:[B

    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->read([BII)I

    move-result v0

    .line 1647
    .local v0, n:I
    if-ne v0, v3, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->skipBuffer:[B

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 10
    .parameter "dst"
    .parameter "pos"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 1653
    const/4 v1, 0x0

    .line 1654
    .local v1, n:I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 1655
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    add-int v4, p2, v1

    sub-int v5, p3, v1

    invoke-virtual {v3, p1, v4, v5}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v2

    .line 1656
    .local v2, r:I
    if-nez v2, :cond_3

    .line 1657
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->finished()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1676
    .end local v2           #r:I
    :cond_0
    iget-wide v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->actualSize:J

    int-to-long v5, v1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->actualSize:J

    .line 1677
    if-lez v1, :cond_4

    .end local v1           #n:I
    :goto_1
    return v1

    .line 1659
    .restart local v1       #n:I
    .restart local v2       #r:I
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v3}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1660
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->src:Lorg/eclipse/jgit/transport/PackParser$Source;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->buf:[B
    invoke-static {v5}, Lorg/eclipse/jgit/transport/PackParser;->access$100(Lorg/eclipse/jgit/transport/PackParser;)[B

    move-result-object v5

    iget v6, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->p:I

    iget-object v7, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->bAvail:I
    invoke-static {v7}, Lorg/eclipse/jgit/transport/PackParser;->access$200(Lorg/eclipse/jgit/transport/PackParser;)I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Lorg/eclipse/jgit/transport/PackParser;->onObjectData(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V

    .line 1661
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->bAvail:I
    invoke-static {v4}, Lorg/eclipse/jgit/transport/PackParser;->access$200(Lorg/eclipse/jgit/transport/PackParser;)I

    move-result v4

    #calls: Lorg/eclipse/jgit/transport/PackParser;->use(I)V
    invoke-static {v3, v4}, Lorg/eclipse/jgit/transport/PackParser;->access$300(Lorg/eclipse/jgit/transport/PackParser;I)V

    .line 1663
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->src:Lorg/eclipse/jgit/transport/PackParser$Source;

    const/4 v5, 0x1

    #calls: Lorg/eclipse/jgit/transport/PackParser;->fill(Lorg/eclipse/jgit/transport/PackParser$Source;I)I
    invoke-static {v3, v4, v5}, Lorg/eclipse/jgit/transport/PackParser;->access$000(Lorg/eclipse/jgit/transport/PackParser;Lorg/eclipse/jgit/transport/PackParser$Source;I)I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->p:I

    .line 1664
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->buf:[B
    invoke-static {v4}, Lorg/eclipse/jgit/transport/PackParser;->access$100(Lorg/eclipse/jgit/transport/PackParser;)[B

    move-result-object v4

    iget v5, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->p:I

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->this$0:Lorg/eclipse/jgit/transport/PackParser;

    #getter for: Lorg/eclipse/jgit/transport/PackParser;->bAvail:I
    invoke-static {v6}, Lorg/eclipse/jgit/transport/PackParser;->access$200(Lorg/eclipse/jgit/transport/PackParser;)I

    move-result v6

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/zip/Inflater;->setInput([BII)V
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1678
    .end local v2           #r:I
    :catch_0
    move-exception v0

    .line 1679
    .local v0, dfe:Ljava/util/zip/DataFormatException;
    new-instance v3, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->packfileCorruptionDetected:Ljava/lang/String;

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/zip/DataFormatException;->getMessage()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1666
    .end local v0           #dfe:Ljava/util/zip/DataFormatException;
    .restart local v2       #r:I
    :cond_2
    :try_start_1
    new-instance v3, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->packfileCorruptionDetected:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->unknownZlibError:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1673
    :cond_3
    add-int/2addr v1, v2

    goto/16 :goto_0

    .line 1677
    .end local v2           #r:I
    :cond_4
    const/4 v1, -0x1

    goto/16 :goto_1
.end method

.method release()V
    .locals 1

    .prologue
    .line 1618
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->reset()V

    .line 1619
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->inf:Ljava/util/zip/Inflater;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/InflaterCache;->release(Ljava/util/zip/Inflater;)V

    .line 1620
    return-void
.end method

.method public skip(J)J
    .locals 8
    .parameter "toSkip"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1633
    const-wide/16 v1, 0x0

    .line 1634
    .local v1, n:J
    :goto_0
    cmp-long v4, v1, p1

    if-gez v4, :cond_0

    .line 1635
    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->skipBuffer:[B

    array-length v4, v4

    int-to-long v4, v4

    sub-long v6, p1, v1

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    .line 1636
    .local v0, cnt:I
    iget-object v4, p0, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->skipBuffer:[B

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5, v0}, Lorg/eclipse/jgit/transport/PackParser$InflaterStream;->read([BII)I

    move-result v3

    .line 1637
    .local v3, r:I
    if-gtz v3, :cond_1

    .line 1641
    .end local v0           #cnt:I
    .end local v3           #r:I
    :cond_0
    return-wide v1

    .line 1639
    .restart local v0       #cnt:I
    .restart local v3       #r:I
    :cond_1
    int-to-long v4, v3

    add-long/2addr v1, v4

    .line 1640
    goto :goto_0
.end method
