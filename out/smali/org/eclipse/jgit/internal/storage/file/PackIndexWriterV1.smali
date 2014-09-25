.class Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
.source "PackIndexWriterV1.java"


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .parameter "dst"

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;-><init>(Ljava/io/OutputStream;)V

    .line 69
    return-void
.end method

.method static canStore(Lorg/eclipse/jgit/transport/PackedObjectInfo;)Z
    .locals 5
    .parameter "oe"

    .prologue
    const/4 v0, 0x1

    .line 64
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v1

    ushr-long/2addr v1, v0

    const-wide/32 v3, 0x7fffffff

    cmp-long v1, v1, v3

    if-gez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected writeImpl()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->writeFanOutTable()V

    .line 75
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 76
    .local v1, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->canStore(Lorg/eclipse/jgit/transport/PackedObjectInfo;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 77
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packTooLargeForIndexVersion1:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 78
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->tmp:[B

    const/4 v3, 0x0

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v2, v3, v4}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 79
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->tmp:[B

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->copyRawTo([BI)V

    .line 80
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->tmp:[B

    invoke-virtual {v2, v3}, Ljava/security/DigestOutputStream;->write([B)V

    goto :goto_0

    .line 83
    .end local v1           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV1;->writeChecksumFooter()V

    .line 84
    return-void
.end method
