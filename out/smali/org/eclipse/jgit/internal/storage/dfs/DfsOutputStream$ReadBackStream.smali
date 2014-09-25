.class Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;
.super Ljava/io/InputStream;
.source "DfsOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadBackStream"
.end annotation


# instance fields
.field private final buf:Ljava/nio/ByteBuffer;

.field private position:J

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;J)V
    .locals 3
    .parameter
    .parameter "position"

    .prologue
    .line 120
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 121
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->blockSize()I

    move-result v0

    .line 122
    .local v0, bs:I
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->position:J

    .line 123
    if-lez v0, :cond_0

    .end local v0           #bs:I
    :goto_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    .line 124
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 125
    return-void

    .line 123
    .restart local v0       #bs:I
    :cond_0
    const/16 v0, 0x2000

    goto :goto_0
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;JLorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 116
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;J)V

    return-void
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

    .line 153
    new-array v0, v2, [B

    .line 154
    .local v0, b:[B
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->read([B)I

    move-result v1

    .line 155
    .local v1, n:I
    if-ne v1, v2, :cond_0

    const/4 v2, 0x0

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 7
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    const/4 v0, 0x0

    .line 130
    .local v0, cnt:I
    :goto_0
    if-lez p3, :cond_0

    .line 131
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-nez v3, :cond_3

    .line 132
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 133
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->position:J

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4, v5, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->read(JLjava/nio/ByteBuffer;)I

    move-result v2

    .line 134
    .local v2, nr:I
    if-gez v2, :cond_2

    .line 135
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 147
    .end local v2           #nr:I
    :cond_0
    if-nez v0, :cond_1

    if-lez p3, :cond_1

    const/4 v0, -0x1

    .line 148
    .end local v0           #cnt:I
    :cond_1
    return v0

    .line 138
    .restart local v0       #cnt:I
    .restart local v2       #nr:I
    :cond_2
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->position:J

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->position:J

    .line 139
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 141
    .end local v2           #nr:I
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 142
    .local v1, n:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream$ReadBackStream;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, p1, p2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 143
    add-int/2addr p2, v1

    .line 144
    sub-int/2addr p3, v1

    .line 145
    add-int/2addr v0, v1

    .line 146
    goto :goto_0
.end method
