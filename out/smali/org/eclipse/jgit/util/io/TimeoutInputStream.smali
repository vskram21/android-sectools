.class public Lorg/eclipse/jgit/util/io/TimeoutInputStream;
.super Ljava/io/FilterInputStream;
.source "TimeoutInputStream.java"


# instance fields
.field private final myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

.field private timeout:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V
    .locals 0
    .parameter "src"
    .parameter "timer"

    .prologue
    .line 71
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 72
    iput-object p2, p0, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 73
    return-void
.end method

.method private beginRead()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    iget v1, p0, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->timeout:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/io/InterruptTimer;->begin(I)V

    .line 134
    return-void
.end method

.method private endRead()V
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer;->end()V

    .line 138
    return-void
.end method

.method private readTimedOut()Ljava/io/InterruptedIOException;
    .locals 5

    .prologue
    .line 141
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->readTimedOut:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->timeout:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getTimeout()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->timeout:I

    return v0
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->beginRead()V

    .line 95
    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 99
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->endRead()V

    return v1

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, e:Ljava/io/InterruptedIOException;
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->readTimedOut()Ljava/io/InterruptedIOException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .end local v0           #e:Ljava/io/InterruptedIOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->endRead()V

    throw v1
.end method

.method public read([B)I
    .locals 2
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 2
    .parameter "buf"
    .parameter "off"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->beginRead()V

    .line 112
    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterInputStream;->read([BII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 116
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->endRead()V

    return v1

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, e:Ljava/io/InterruptedIOException;
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->readTimedOut()Ljava/io/InterruptedIOException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    .end local v0           #e:Ljava/io/InterruptedIOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->endRead()V

    throw v1
.end method

.method public setTimeout(I)V
    .locals 5
    .parameter "millis"

    .prologue
    .line 85
    if-gez p1, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidTimeout:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    iput p1, p0, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->timeout:I

    .line 89
    return-void
.end method

.method public skip(J)J
    .locals 3
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->beginRead()V

    .line 124
    invoke-super {p0, p1, p2}, Ljava/io/FilterInputStream;->skip(J)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    .line 128
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->endRead()V

    return-wide v1

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, e:Ljava/io/InterruptedIOException;
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->readTimedOut()Ljava/io/InterruptedIOException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    .end local v0           #e:Ljava/io/InterruptedIOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->endRead()V

    throw v1
.end method
