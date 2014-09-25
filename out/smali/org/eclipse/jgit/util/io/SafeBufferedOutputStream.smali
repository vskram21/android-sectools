.class public Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;
.super Ljava/io/BufferedOutputStream;
.source "SafeBufferedOutputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .parameter "out"

    .prologue
    .line 66
    invoke-direct {p0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 0
    .parameter "out"
    .parameter "size"

    .prologue
    .line 77
    invoke-direct {p0, p1, p2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 78
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    invoke-super {p0}, Ljava/io/BufferedOutputStream;->close()V

    .line 87
    return-void

    .line 85
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/io/BufferedOutputStream;->close()V

    throw v0
.end method
