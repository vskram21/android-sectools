.class public abstract Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
.super Ljava/io/OutputStream;
.source "DfsOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$1;,
        Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 116
    return-void
.end method


# virtual methods
.method public blockSize()I
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public openInputStream(J)Ljava/io/InputStream;
    .locals 2
    .parameter "position"

    .prologue
    .line 113
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;JLorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$1;)V

    return-object v0
.end method

.method public abstract read(JLjava/nio/ByteBuffer;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public write(I)V
    .locals 3
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->write([B)V

    .line 79
    return-void
.end method

.method public abstract write([BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
