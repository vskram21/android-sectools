.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;
.super Ljava/io/OutputStream;
.source "DeltaWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ZipStream"
.end annotation


# instance fields
.field private final deflater:Ljava/util/zip/Deflater;

.field private outPtr:I

.field private final zbuf:[B


# direct methods
.method constructor <init>(Ljava/util/zip/Deflater;[B)V
    .locals 0
    .parameter "deflater"
    .parameter "zbuf"

    .prologue
    .line 444
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 445
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->deflater:Ljava/util/zip/Deflater;

    .line 446
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->zbuf:[B

    .line 447
    return-void
.end method


# virtual methods
.method finish()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 450
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->finish()V

    .line 452
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->zbuf:[B

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 453
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 455
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->deflater:Ljava/util/zip/Deflater;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->zbuf:[B

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->zbuf:[B

    array-length v4, v4

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    sub-int/2addr v4, v5

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v0

    .line 456
    .local v0, n:I
    if-nez v0, :cond_2

    .line 457
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->finished()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 458
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    return v1

    .line 459
    :cond_1
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 461
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    goto :goto_0
.end method

.method public write(I)V
    .locals 1
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 484
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public write([BII)V
    .locals 6
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 467
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1, p1, p2, p3}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 469
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->zbuf:[B

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 470
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 472
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->deflater:Ljava/util/zip/Deflater;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->zbuf:[B

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->zbuf:[B

    array-length v4, v4

    iget v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    sub-int/2addr v4, v5

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v0

    .line 473
    .local v0, n:I
    if-nez v0, :cond_2

    .line 474
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 480
    return-void

    .line 476
    :cond_1
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 478
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ZipStream;->outPtr:I

    goto :goto_0
.end method
