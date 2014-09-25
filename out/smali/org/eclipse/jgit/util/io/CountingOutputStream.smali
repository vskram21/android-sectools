.class public Lorg/eclipse/jgit/util/io/CountingOutputStream;
.super Ljava/io/OutputStream;
.source "CountingOutputStream.java"


# instance fields
.field private cnt:J

.field private final out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .parameter "out"

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->out:Ljava/io/OutputStream;

    .line 62
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
    .line 88
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 89
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 84
    return-void
.end method

.method public getCount()J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->cnt:J

    return-wide v0
.end method

.method public write(I)V
    .locals 4
    .parameter "val"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 72
    iget-wide v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->cnt:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->cnt:J

    .line 73
    return-void
.end method

.method public write([BII)V
    .locals 4
    .parameter "buf"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 78
    iget-wide v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->cnt:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/CountingOutputStream;->cnt:J

    .line 79
    return-void
.end method
