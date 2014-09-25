.class public abstract Lorg/eclipse/jgit/util/io/LimitedInputStream;
.super Ljava/io/FilterInputStream;
.source "LimitedInputStream.java"


# instance fields
.field private left:J

.field protected final limit:J

.field private mark:J


# direct methods
.method protected constructor <init>(Ljava/io/InputStream;J)V
    .locals 2
    .parameter "in"
    .parameter "limit"

    .prologue
    .line 76
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 67
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->mark:J

    .line 77
    iput-wide p2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    .line 78
    iput-wide p2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->limit:J

    .line 79
    return-void
.end method


# virtual methods
.method public available()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    int-to-long v0, v0

    iget-wide v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method protected abstract limitExceeded()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public declared-synchronized mark(I)V
    .locals 2
    .parameter "readLimit"

    .prologue
    .line 89
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 90
    iget-wide v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->mark:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    monitor-exit p0

    return-void

    .line 89
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 95
    iget-wide v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    .line 96
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    .line 105
    :cond_0
    :goto_0
    return v0

    .line 99
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/LimitedInputStream;->limitExceeded()V

    .line 102
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 103
    .local v0, result:I
    if-eq v0, v1, :cond_0

    .line 104
    iget-wide v1, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    goto :goto_0
.end method

.method public read([BII)I
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
    const/4 v1, -0x1

    .line 110
    iget-wide v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    .line 111
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    .line 121
    :cond_0
    :goto_0
    return v0

    .line 114
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/LimitedInputStream;->limitExceeded()V

    .line 117
    :cond_2
    int-to-long v2, p3

    iget-wide v4, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    .line 118
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 119
    .local v0, result:I
    if-eq v0, v1, :cond_0

    .line 120
    iget-wide v1, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    int-to-long v3, v0

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    goto :goto_0
.end method

.method public declared-synchronized reset()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-nez v0, :cond_0

    .line 127
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mark not supported"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 129
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->mark:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 130
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mark not set"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 133
    iget-wide v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->mark:J

    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    monitor-exit p0

    return-void
.end method

.method public skip(J)J
    .locals 4
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-wide v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    .line 139
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 140
    .local v0, skipped:J
    iget-wide v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    sub-long/2addr v2, v0

    iput-wide v2, p0, Lorg/eclipse/jgit/util/io/LimitedInputStream;->left:J

    .line 141
    return-wide v0
.end method
