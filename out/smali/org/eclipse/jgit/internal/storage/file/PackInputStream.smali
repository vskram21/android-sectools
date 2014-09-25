.class Lorg/eclipse/jgit/internal/storage/file/PackInputStream;
.super Ljava/io/InputStream;
.source "PackInputStream.java"


# instance fields
.field private final pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

.field private pos:J

.field private final wc:Lorg/eclipse/jgit/internal/storage/file/WindowCursor;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 0
    .parameter "pack"
    .parameter "pos"
    .parameter "wc"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 59
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->pos:J

    .line 60
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->wc:Lorg/eclipse/jgit/internal/storage/file/WindowCursor;

    .line 64
    invoke-virtual {p4, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 65
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->wc:Lorg/eclipse/jgit/internal/storage/file/WindowCursor;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->release()V

    .line 84
    return-void
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 76
    new-array v0, v2, [B

    .line 77
    .local v0, buf:[B
    invoke-virtual {p0, v0, v3, v2}, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->read([BII)I

    move-result v1

    .line 78
    .local v1, n:I
    if-ne v1, v2, :cond_0

    aget-byte v2, v0, v3

    and-int/lit16 v2, v2, 0xff

    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 8
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->wc:Lorg/eclipse/jgit/internal/storage/file/WindowCursor;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->pos:J

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->copy(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BII)I

    move-result v7

    .line 70
    .local v7, n:I
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->pos:J

    int-to-long v2, v7

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackInputStream;->pos:J

    .line 71
    return v7
.end method
