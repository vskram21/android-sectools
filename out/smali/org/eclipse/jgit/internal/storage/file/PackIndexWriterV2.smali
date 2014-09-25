.class Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
.source "PackIndexWriterV2.java"


# static fields
.field private static final IS_OFFSET_64:I = -0x80000000

.field private static final MAX_OFFSET_32:I = 0x7fffffff


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .parameter "dst"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;-><init>(Ljava/io/OutputStream;)V

    .line 64
    return-void
.end method

.method private writeCRCs()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 83
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 84
    .local v1, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->tmp:[B

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getCRC()I

    move-result v3

    invoke-static {v2, v5, v3}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 85
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->out:Ljava/security/DigestOutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->tmp:[B

    const/4 v4, 0x4

    invoke-virtual {v2, v3, v5, v4}, Ljava/security/DigestOutputStream;->write([BII)V

    goto :goto_0

    .line 87
    .end local v1           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :cond_0
    return-void
.end method

.method private writeObjectNames()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 79
    .local v1, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->copyRawTo(Ljava/io/OutputStream;)V

    goto :goto_0

    .line 80
    .end local v1           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :cond_0
    return-void
.end method

.method private writeOffset32()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 90
    const/4 v3, 0x0

    .line 91
    .local v3, o64:I
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->entries:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 92
    .local v5, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v1

    .line 93
    .local v1, o:J
    const-wide/32 v6, 0x7fffffff

    cmp-long v6, v1, v6

    if-gtz v6, :cond_0

    .line 94
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->tmp:[B

    long-to-int v7, v1

    invoke-static {v6, v9, v7}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 97
    :goto_1
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->out:Ljava/security/DigestOutputStream;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->tmp:[B

    const/4 v8, 0x4

    invoke-virtual {v6, v7, v9, v8}, Ljava/security/DigestOutputStream;->write([BII)V

    goto :goto_0

    .line 96
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->tmp:[B

    const/high16 v7, -0x8000

    add-int/lit8 v4, v3, 0x1

    .end local v3           #o64:I
    .local v4, o64:I
    or-int/2addr v7, v3

    invoke-static {v6, v9, v7}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    move v3, v4

    .end local v4           #o64:I
    .restart local v3       #o64:I
    goto :goto_1

    .line 99
    .end local v1           #o:J
    .end local v5           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :cond_1
    return-void
.end method

.method private writeOffset64()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 102
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->entries:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/PackedObjectInfo;

    .line 103
    .local v3, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v1

    .line 104
    .local v1, o:J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v4, v1

    if-gez v4, :cond_0

    .line 105
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->tmp:[B

    invoke-static {v4, v7, v1, v2}, Lorg/eclipse/jgit/util/NB;->encodeInt64([BIJ)V

    .line 106
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->out:Ljava/security/DigestOutputStream;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->tmp:[B

    const/16 v6, 0x8

    invoke-virtual {v4, v5, v7, v6}, Ljava/security/DigestOutputStream;->write([BII)V

    goto :goto_0

    .line 109
    .end local v1           #o:J
    .end local v3           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :cond_1
    return-void
.end method


# virtual methods
.method protected writeImpl()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->writeTOC(I)V

    .line 69
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->writeFanOutTable()V

    .line 70
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->writeObjectNames()V

    .line 71
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->writeCRCs()V

    .line 72
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->writeOffset32()V

    .line 73
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->writeOffset64()V

    .line 74
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriterV2;->writeChecksumFooter()V

    .line 75
    return-void
.end method
