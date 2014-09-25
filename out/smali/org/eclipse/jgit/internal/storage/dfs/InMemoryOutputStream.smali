.class Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;
.super Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
.source "InMemoryOutputStream.java"


# instance fields
.field private data:[B

.field private final dst:Ljava/io/ByteArrayOutputStream;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;-><init>()V

    .line 50
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->dst:Ljava/io/ByteArrayOutputStream;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->flush()V

    .line 84
    return-void
.end method

.method public flush()V
    .locals 0

    .prologue
    .line 79
    return-void
.end method

.method getData()[B
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->data:[B

    if-nez v0, :cond_0

    .line 72
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->dst:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->data:[B

    .line 73
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->data:[B

    return-object v0
.end method

.method public read(JLjava/nio/ByteBuffer;)I
    .locals 5
    .parameter "position"
    .parameter "buf"

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->getData()[B

    move-result-object v0

    .line 63
    .local v0, d:[B
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    array-length v3, v0

    long-to-int v4, p1

    sub-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 64
    .local v1, n:I
    if-gtz v1, :cond_0

    .line 65
    const/4 v1, -0x1

    .line 67
    .end local v1           #n:I
    :goto_0
    return v1

    .line 66
    .restart local v1       #n:I
    :cond_0
    long-to-int v2, p1

    invoke-virtual {p3, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method public write([BII)V
    .locals 1
    .parameter "buf"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->data:[B

    .line 57
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryOutputStream;->dst:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 58
    return-void
.end method
