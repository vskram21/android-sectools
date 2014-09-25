.class final Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
.super Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
.source "ByteArrayWindow.java"


# instance fields
.field private final array:[B


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[B)V
    .locals 1
    .parameter "pack"
    .parameter "o"
    .parameter "b"

    .prologue
    .line 63
    array-length v0, p4

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JI)V

    .line 64
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    .line 65
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
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->start:J

    sub-long v1, p3, v1

    long-to-int v1, v1

    invoke-virtual {p1, v0, v1, p5}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 98
    :cond_0
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p1, p2, v0, v1}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v0

    if-gtz v0, :cond_0

    .line 100
    return-void
.end method

.method protected copy(I[BII)I
    .locals 1
    .parameter "p"
    .parameter "b"
    .parameter "o"
    .parameter "n"

    .prologue
    .line 69
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    array-length v0, v0

    sub-int/2addr v0, p1

    invoke-static {v0, p4}, Ljava/lang/Math;->min(II)I

    move-result p4

    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    invoke-static {v0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    return p4
.end method

.method crc32(Ljava/util/zip/CRC32;JI)V
    .locals 3
    .parameter "out"
    .parameter "pos"
    .parameter "cnt"

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->start:J

    sub-long v1, p2, v1

    long-to-int v1, v1

    invoke-virtual {p1, v0, v1, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 84
    return-void
.end method

.method protected setInput(ILjava/util/zip/Inflater;)I
    .locals 2
    .parameter "pos"
    .parameter "inf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    .line 77
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    array-length v1, v1

    sub-int v0, v1, p1

    .line 78
    .local v0, n:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    invoke-virtual {p2, v1, p1, v0}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 79
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
    .line 89
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->start:J

    sub-long v1, p2, v1

    long-to-int v0, v1

    .line 90
    .local v0, ptr:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    invoke-virtual {p1, v1, v0, p4}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    .line 91
    if-eqz p5, :cond_0

    .line 92
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->array:[B

    invoke-virtual {p5, v1, v0, p4}, Ljava/security/MessageDigest;->update([BII)V

    .line 93
    :cond_0
    return-void
.end method
