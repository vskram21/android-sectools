.class public Lorg/eclipse/jgit/util/io/TimeoutOutputStream;
.super Ljava/io/OutputStream;
.source "TimeoutOutputStream.java"


# instance fields
.field private final dst:Ljava/io/OutputStream;

.field private final myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

.field private timeout:I


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V
    .locals 0
    .parameter "destination"
    .parameter "timer"

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 72
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->dst:Ljava/io/OutputStream;

    .line 73
    iput-object p2, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 74
    return-void
.end method

.method private beginWrite()V
    .locals 2

    .prologue
    .line 146
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    iget v1, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->timeout:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/io/InterruptTimer;->begin(I)V

    .line 147
    return-void
.end method

.method private endWrite()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->myTimer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer;->end()V

    .line 151
    return-void
.end method

.method private writeTimedOut()Ljava/io/InterruptedIOException;
    .locals 5

    .prologue
    .line 154
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->writeTimedOut:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->timeout:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->beginWrite()V

    .line 137
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->dst:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    .line 143
    return-void

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, e:Ljava/io/InterruptedIOException;
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->writeTimedOut()Ljava/io/InterruptedIOException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    .end local v0           #e:Ljava/io/InterruptedIOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    throw v1
.end method

.method public flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->beginWrite()V

    .line 125
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->dst:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    .line 131
    return-void

    .line 126
    :catch_0
    move-exception v0

    .line 127
    .local v0, e:Ljava/io/InterruptedIOException;
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->writeTimedOut()Ljava/io/InterruptedIOException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    .end local v0           #e:Ljava/io/InterruptedIOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    throw v1
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->timeout:I

    return v0
.end method

.method public setTimeout(I)V
    .locals 5
    .parameter "millis"

    .prologue
    .line 86
    if-gez p1, :cond_0

    .line 87
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

    .line 89
    :cond_0
    iput p1, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->timeout:I

    .line 90
    return-void
.end method

.method public write(I)V
    .locals 2
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->beginWrite()V

    .line 96
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->dst:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    .line 102
    return-void

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, e:Ljava/io/InterruptedIOException;
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->writeTimedOut()Ljava/io/InterruptedIOException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    .end local v0           #e:Ljava/io/InterruptedIOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    throw v1
.end method

.method public write([B)V
    .locals 2
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->write([BII)V

    .line 107
    return-void
.end method

.method public write([BII)V
    .locals 2
    .parameter "buf"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->beginWrite()V

    .line 113
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->dst:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    .line 119
    return-void

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, e:Ljava/io/InterruptedIOException;
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->writeTimedOut()Ljava/io/InterruptedIOException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    .end local v0           #e:Ljava/io/InterruptedIOException;
    :catchall_0
    move-exception v1

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->endWrite()V

    throw v1
.end method
