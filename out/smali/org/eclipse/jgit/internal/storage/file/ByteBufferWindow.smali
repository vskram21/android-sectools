.class final Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;
.super Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
.source "ByteBufferWindow.java"


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLjava/nio/ByteBuffer;)V
    .locals 1
    .parameter "pack"
    .parameter "o"
    .parameter "b"

    .prologue
    .line 65
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JI)V

    .line 66
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;->buffer:Ljava/nio/ByteBuffer;

    .line 67
    return-void
.end method


# virtual methods
.method protected copy(I[BII)I
    .locals 2
    .parameter "p"
    .parameter "b"
    .parameter "o"
    .parameter "n"

    .prologue
    .line 71
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 72
    .local v0, s:Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 73
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-static {v1, p4}, Ljava/lang/Math;->min(II)I

    move-result p4

    .line 74
    invoke-virtual {v0, p2, p3, p4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 75
    return p4
.end method

.method protected setInput(ILjava/util/zip/Inflater;)I
    .locals 5
    .parameter "pos"
    .parameter "inf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 98
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 99
    .local v0, s:Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 100
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    const/16 v3, 0x200

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    new-array v1, v2, [B

    .line 101
    .local v1, tmp:[B
    array-length v2, v1

    invoke-virtual {v0, v1, v4, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 102
    array-length v2, v1

    invoke-virtual {p2, v1, v4, v2}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 103
    array-length v2, v1

    return v2
.end method

.method write(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;JILjava/security/MessageDigest;)V
    .locals 6
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
    const/4 v5, 0x0

    .line 81
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 82
    .local v2, s:Ljava/nio/ByteBuffer;
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;->start:J

    sub-long v3, p2, v3

    long-to-int v3, v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 84
    :goto_0
    if-lez p4, :cond_1

    .line 85
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->getCopyBuffer()[B

    move-result-object v0

    .line 86
    .local v0, buf:[B
    array-length v3, v0

    invoke-static {p4, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 87
    .local v1, n:I
    invoke-virtual {v2, v0, v5, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 88
    invoke-virtual {p1, v0, v5, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    .line 89
    if-eqz p5, :cond_0

    .line 90
    invoke-virtual {p5, v0, v5, v1}, Ljava/security/MessageDigest;->update([BII)V

    .line 91
    :cond_0
    sub-int/2addr p4, v1

    .line 92
    goto :goto_0

    .line 93
    .end local v0           #buf:[B
    .end local v1           #n:I
    :cond_1
    return-void
.end method
