.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
.super Ljava/lang/Object;
.source "DfsBlock.java"


# instance fields
.field private final block:[B

.field final end:J

.field final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

.field final start:J


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J[B)V
    .locals 2
    .parameter "p"
    .parameter "pos"
    .parameter "buf"

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 68
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    .line 69
    array-length v0, p4

    int-to-long v0, v0

    add-long/2addr v0, p2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->end:J

    .line 70
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    .line 71
    return-void
.end method


# virtual methods
.method check(Ljava/util/zip/Inflater;[BJI)V
    .locals 3
    .parameter "inf"
    .parameter "tmp"
    .parameter "pos"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    sub-long v1, p3, v1

    long-to-int v1, v1

    invoke-virtual {p1, v0, v1, p5}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 121
    :cond_0
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p1, p2, v0, v1}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v0

    if-gtz v0, :cond_0

    .line 123
    return-void
.end method

.method contains(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Z
    .locals 2
    .parameter "want"
    .parameter "pos"

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    if-ne v0, p1, :cond_0

    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    cmp-long v0, v0, p2

    if-gtz v0, :cond_0

    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->end:J

    cmp-long v0, p2, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method copy(I[BII)I
    .locals 1
    .parameter "p"
    .parameter "b"
    .parameter "o"
    .parameter "n"

    .prologue
    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    array-length v0, v0

    sub-int/2addr v0, p1

    invoke-static {v0, p4}, Ljava/lang/Math;->min(II)I

    move-result p4

    .line 93
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    invoke-static {v0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 94
    return p4
.end method

.method copy(J[BII)I
    .locals 3
    .parameter "pos"
    .parameter "dstbuf"
    .parameter "dstoff"
    .parameter "cnt"

    .prologue
    .line 87
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    sub-long v1, p1, v1

    long-to-int v0, v1

    .line 88
    .local v0, ptr:I
    invoke-virtual {p0, v0, p3, p4, p5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->copy(I[BII)I

    move-result v1

    return v1
.end method

.method crc32(Ljava/util/zip/CRC32;JI)V
    .locals 3
    .parameter "out"
    .parameter "pos"
    .parameter "cnt"

    .prologue
    .line 103
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    sub-long v1, p2, v1

    long-to-int v0, v1

    .line 104
    .local v0, ptr:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    invoke-virtual {p1, v1, v0, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 105
    return-void
.end method

.method remaining(J)I
    .locals 3
    .parameter "pos"

    .prologue
    .line 78
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    sub-long v1, p1, v1

    long-to-int v0, v1

    .line 79
    .local v0, ptr:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    array-length v1, v1

    sub-int/2addr v1, v0

    return v1
.end method

.method setInput(Ljava/util/zip/Inflater;J)V
    .locals 3
    .parameter "inf"
    .parameter "pos"

    .prologue
    .line 98
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    sub-long v1, p2, v1

    long-to-int v0, v1

    .line 99
    .local v0, ptr:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    array-length v2, v2

    sub-int/2addr v2, v0

    invoke-virtual {p1, v1, v0, v2}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 100
    return-void
.end method

.method size()I
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    array-length v0, v0

    return v0
.end method

.method write(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;JILjava/security/MessageDigest;)V
    .locals 3
    .parameter "out"
    .parameter "pos"
    .parameter "cnt"
    .parameter "digest"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    sub-long v1, p2, v1

    long-to-int v0, v1

    .line 110
    .local v0, ptr:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    invoke-virtual {p1, v1, v0, p4}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    .line 111
    if-eqz p5, :cond_0

    .line 112
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->block:[B

    invoke-virtual {p5, v1, v0, p4}, Ljava/security/MessageDigest;->update([BII)V

    .line 113
    :cond_0
    return-void
.end method
