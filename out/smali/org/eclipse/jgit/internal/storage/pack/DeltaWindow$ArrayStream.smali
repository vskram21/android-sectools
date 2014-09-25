.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;
.super Ljava/io/OutputStream;
.source "DeltaWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ArrayStream"
.end annotation


# instance fields
.field final buf:[B

.field cnt:I


# direct methods
.method constructor <init>(I)V
    .locals 1
    .parameter "max"

    .prologue
    .line 492
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 493
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->buf:[B

    .line 494
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 3
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 498
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->buf:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 499
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 500
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->buf:[B

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 501
    return-void
.end method

.method public write([BII)V
    .locals 2
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 505
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->buf:[B

    array-length v0, v0

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    sub-int/2addr v0, v1

    if-le p3, v0, :cond_0

    .line 506
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 507
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->buf:[B

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 508
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow$ArrayStream;->cnt:I

    .line 509
    return-void
.end method
