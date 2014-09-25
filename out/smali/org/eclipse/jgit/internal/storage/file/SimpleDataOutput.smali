.class Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;
.super Ljava/lang/Object;
.source "SimpleDataOutput.java"

# interfaces
.implements Ljava/io/DataOutput;


# instance fields
.field private final buf:[B

.field private final fd:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "fd"

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->buf:[B

    .line 64
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->fd:Ljava/io/OutputStream;

    .line 65
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 1
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public write([B)V
    .locals 1
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public write([BII)V
    .locals 1
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeBoolean(Z)V
    .locals 1
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeByte(I)V
    .locals 1
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes(Ljava/lang/String;)V
    .locals 1
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeChar(I)V
    .locals 1
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeChars(Ljava/lang/String;)V
    .locals 1
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeDouble(D)V
    .locals 1
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeFloat(F)V
    .locals 1
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public writeInt(I)V
    .locals 4
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->buf:[B

    invoke-static {v0, v3, p1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->fd:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->buf:[B

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 75
    return-void
.end method

.method public writeLong(J)V
    .locals 4
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 78
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->buf:[B

    invoke-static {v0, v3, p1, p2}, Lorg/eclipse/jgit/util/NB;->encodeInt64([BIJ)V

    .line 79
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->fd:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->buf:[B

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 80
    return-void
.end method

.method public writeShort(I)V
    .locals 4
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 68
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->buf:[B

    invoke-static {v0, v3, p1}, Lorg/eclipse/jgit/util/NB;->encodeInt16([BII)V

    .line 69
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->fd:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;->buf:[B

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 70
    return-void
.end method

.method public writeUTF(Ljava/lang/String;)V
    .locals 1
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
