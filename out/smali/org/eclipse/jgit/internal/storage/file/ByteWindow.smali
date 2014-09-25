.class abstract Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
.super Ljava/lang/Object;
.source "ByteWindow.java"


# instance fields
.field protected final end:J

.field protected final pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

.field protected final start:J


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JI)V
    .locals 4
    .parameter "p"
    .parameter "s"
    .parameter "n"

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 72
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->start:J

    .line 73
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->start:J

    int-to-long v2, p4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->end:J

    .line 74
    return-void
.end method


# virtual methods
.method final contains(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Z
    .locals 2
    .parameter "neededFile"
    .parameter "neededPos"

    .prologue
    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    if-ne v0, p1, :cond_0

    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->start:J

    cmp-long v0, v0, p2

    if-gtz v0, :cond_0

    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->end:J

    cmp-long v0, p2, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract copy(I[BII)I
.end method

.method final copy(J[BII)I
    .locals 2
    .parameter "pos"
    .parameter "dstbuf"
    .parameter "dstoff"
    .parameter "cnt"

    .prologue
    .line 102
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->start:J

    sub-long v0, p1, v0

    long-to-int v0, v0

    invoke-virtual {p0, v0, p3, p4, p5}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->copy(I[BII)I

    move-result v0

    return v0
.end method

.method protected abstract setInput(ILjava/util/zip/Inflater;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/DataFormatException;
        }
    .end annotation
.end method

.method final setInput(JLjava/util/zip/Inflater;)I
    .locals 2
    .parameter "pos"
    .parameter "inf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    .line 128
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->start:J

    sub-long v0, p1, v0

    long-to-int v0, v0

    invoke-virtual {p0, v0, p3}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->setInput(ILjava/util/zip/Inflater;)I

    move-result v0

    return v0
.end method

.method final size()I
    .locals 4

    .prologue
    .line 77
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->end:J

    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->start:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method abstract write(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;JILjava/security/MessageDigest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
