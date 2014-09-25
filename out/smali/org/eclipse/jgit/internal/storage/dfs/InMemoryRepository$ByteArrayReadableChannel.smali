.class Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;
.super Ljava/lang/Object;
.source "InMemoryRepository.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArrayReadableChannel"
.end annotation


# instance fields
.field private final data:[B

.field private open:Z

.field private position:I


# direct methods
.method constructor <init>([B)V
    .locals 1
    .parameter "buf"

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->open:Z

    .line 145
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->data:[B

    .line 146
    return-void
.end method


# virtual methods
.method public blockSize()I
    .locals 1

    .prologue
    .line 178
    const/4 v0, 0x0

    return v0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 158
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->open:Z

    .line 159
    return-void
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 162
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->open:Z

    return v0
.end method

.method public position()J
    .locals 2

    .prologue
    .line 166
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->position:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public position(J)V
    .locals 1
    .parameter "newPosition"

    .prologue
    .line 170
    long-to-int v0, p1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->position:I

    .line 171
    return-void
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 4
    .parameter "dst"

    .prologue
    .line 149
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->data:[B

    array-length v2, v2

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->position:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 150
    .local v0, n:I
    if-nez v0, :cond_0

    .line 151
    const/4 v0, -0x1

    .line 154
    .end local v0           #n:I
    :goto_0
    return v0

    .line 152
    .restart local v0       #n:I
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->data:[B

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->position:I

    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 153
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->position:I

    goto :goto_0
.end method

.method public size()J
    .locals 2

    .prologue
    .line 174
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;->data:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method
