.class public Lorg/eclipse/jgit/util/io/TeeInputStream;
.super Ljava/io/InputStream;
.source "TeeInputStream.java"


# instance fields
.field private dst:Ljava/io/OutputStream;

.field private skipBuffer:[B

.field private src:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0
    .parameter "src"
    .parameter "dst"

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 80
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->src:Ljava/io/InputStream;

    .line 81
    iput-object p2, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->dst:Ljava/io/OutputStream;

    .line 82
    return-void
.end method

.method private skipBuffer()[B
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->skipBuffer:[B

    if-nez v0, :cond_0

    .line 132
    const/16 v0, 0x800

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->skipBuffer:[B

    .line 133
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->skipBuffer:[B

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TeeInputStream;->skipBuffer()[B

    move-result-object v0

    .line 121
    .local v0, b:[B
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->src:Ljava/io/InputStream;

    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 122
    .local v1, n:I
    if-gtz v1, :cond_0

    .line 126
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->dst:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 127
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->src:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 128
    return-void

    .line 124
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->dst:Ljava/io/OutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TeeInputStream;->skipBuffer()[B

    move-result-object v0

    .line 87
    .local v0, b:[B
    invoke-virtual {p0, v0, v2, v3}, Lorg/eclipse/jgit/util/io/TeeInputStream;->read([BII)I

    move-result v1

    .line 88
    .local v1, n:I
    if-ne v1, v3, :cond_0

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method public read([BII)I
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
    .line 109
    if-nez p3, :cond_1

    .line 110
    const/4 v0, 0x0

    .line 115
    :cond_0
    :goto_0
    return v0

    .line 112
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->src:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 113
    .local v0, n:I
    if-lez v0, :cond_0

    .line 114
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->dst:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public skip(J)J
    .locals 10
    .parameter "count"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 93
    const-wide/16 v4, 0x0

    .line 94
    .local v4, skipped:J
    move-wide v1, p1

    .line 95
    .local v1, cnt:J
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TeeInputStream;->skipBuffer()[B

    move-result-object v0

    .line 96
    .local v0, b:[B
    :goto_0
    const-wide/16 v6, 0x0

    cmp-long v6, v6, v1

    if-gez v6, :cond_0

    .line 97
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->src:Ljava/io/InputStream;

    array-length v7, v0

    int-to-long v7, v7

    invoke-static {v7, v8, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v7, v7

    invoke-virtual {v6, v0, v9, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 98
    .local v3, n:I
    if-gtz v3, :cond_1

    .line 104
    .end local v3           #n:I
    :cond_0
    return-wide v4

    .line 100
    .restart local v3       #n:I
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/TeeInputStream;->dst:Ljava/io/OutputStream;

    invoke-virtual {v6, v0, v9, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 101
    int-to-long v6, v3

    add-long/2addr v4, v6

    .line 102
    int-to-long v6, v3

    sub-long/2addr v1, v6

    .line 103
    goto :goto_0
.end method
