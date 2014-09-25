.class public Lorg/eclipse/jgit/util/io/StreamCopyThread;
.super Ljava/lang/Thread;
.source "StreamCopyThread.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x400


# instance fields
.field private volatile done:Z

.field private final dst:Ljava/io/OutputStream;

.field private final src:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 2
    .parameter "i"
    .parameter "o"

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-StreamCopy"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->setName(Ljava/lang/String;)V

    .line 73
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->src:Ljava/io/InputStream;

    .line 74
    iput-object p2, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->dst:Ljava/io/OutputStream;

    .line 75
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->interrupt()V

    .line 86
    return-void
.end method

.method public halt()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 99
    :goto_0
    const-wide/16 v0, 0xfa

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->join(J)V

    .line 100
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->done:Z

    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->interrupt()V

    goto :goto_0

    .line 106
    :cond_0
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    .line 111
    const/16 v6, 0x400

    :try_start_0
    new-array v0, v6, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    .local v0, buf:[B
    const/4 v2, 0x0

    .line 115
    .local v2, interruptCounter:I
    :cond_0
    :goto_0
    if-lez v2, :cond_1

    .line 116
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->dst:Ljava/io/OutputStream;

    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V

    .line 117
    add-int/lit8 v2, v2, -0x1

    .line 120
    :cond_1
    iget-boolean v6, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->done:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v6, :cond_3

    .line 154
    :cond_2
    :goto_1
    :try_start_2
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->src:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6

    .line 159
    :goto_2
    :try_start_3
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->dst:Ljava/io/OutputStream;

    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    .line 164
    :goto_3
    return-void

    .line 125
    :cond_3
    :try_start_4
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->src:Ljava/io/InputStream;

    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    move-result v3

    .line 130
    .local v3, n:I
    if-ltz v3, :cond_2

    .line 133
    const/4 v5, 0x0

    .line 136
    .local v5, writeInterrupted:Z
    :goto_4
    :try_start_5
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->dst:Ljava/io/OutputStream;

    const/4 v7, 0x0

    invoke-virtual {v6, v0, v7, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/InterruptedIOException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 144
    if-eqz v5, :cond_0

    .line 145
    :try_start_6
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->interrupt()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_0

    .line 148
    .end local v3           #n:I
    .end local v5           #writeInterrupted:Z
    :catch_0
    move-exception v1

    .line 149
    .local v1, e:Ljava/io/IOException;
    goto :goto_1

    .line 126
    .end local v1           #e:Ljava/io/IOException;
    :catch_1
    move-exception v4

    .line 127
    .local v4, wakey:Ljava/io/InterruptedIOException;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 137
    .end local v4           #wakey:Ljava/io/InterruptedIOException;
    .restart local v3       #n:I
    .restart local v5       #writeInterrupted:Z
    :catch_2
    move-exception v4

    .line 138
    .restart local v4       #wakey:Ljava/io/InterruptedIOException;
    const/4 v5, 0x1

    .line 139
    goto :goto_4

    .line 153
    .end local v0           #buf:[B
    .end local v2           #interruptCounter:I
    .end local v3           #n:I
    .end local v4           #wakey:Ljava/io/InterruptedIOException;
    .end local v5           #writeInterrupted:Z
    :catchall_0
    move-exception v6

    .line 154
    :try_start_7
    iget-object v7, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->src:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 159
    :goto_5
    :try_start_8
    iget-object v7, p0, Lorg/eclipse/jgit/util/io/StreamCopyThread;->dst:Ljava/io/OutputStream;

    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3

    .line 162
    :goto_6
    throw v6

    .line 160
    :catch_3
    move-exception v7

    goto :goto_6

    .line 155
    :catch_4
    move-exception v7

    goto :goto_5

    .line 160
    .restart local v0       #buf:[B
    .restart local v2       #interruptCounter:I
    :catch_5
    move-exception v6

    goto :goto_3

    .line 155
    :catch_6
    move-exception v6

    goto :goto_2
.end method
