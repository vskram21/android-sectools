.class Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;
.super Lorg/eclipse/jgit/transport/BasePackPushConnection;
.source "TransportLocal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportLocal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ForkLocalPushConnection"
.end annotation


# instance fields
.field private errorReaderThread:Ljava/lang/Thread;

.field private receivePack:Ljava/lang/Process;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportLocal;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportLocal;)V
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 439
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    .line 440
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 442
    new-instance v0, Lorg/eclipse/jgit/util/io/MessageWriter;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/io/MessageWriter;-><init>()V

    .line 443
    .local v0, msg:Lorg/eclipse/jgit/util/io/MessageWriter;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->setMessageWriter(Ljava/io/Writer;)V

    .line 445
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportLocal;->getOptionReceivePack()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/transport/TransportLocal;->spawn(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    .line 447
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    .line 448
    .local v1, rpErr:Ljava/io/InputStream;
    new-instance v6, Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/MessageWriter;->getRawStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v6, v1, v7}, Lorg/eclipse/jgit/util/io/StreamCopyThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    iput-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->errorReaderThread:Ljava/lang/Thread;

    .line 449
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->errorReaderThread:Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 451
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 452
    .local v2, rpIn:Ljava/io/InputStream;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 454
    .local v4, rpOut:Ljava/io/OutputStream;
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 455
    .end local v2           #rpIn:Ljava/io/InputStream;
    .local v3, rpIn:Ljava/io/InputStream;
    new-instance v5, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v5, v4}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 457
    .end local v4           #rpOut:Ljava/io/OutputStream;
    .local v5, rpOut:Ljava/io/OutputStream;
    invoke-virtual {p0, v3, v5}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 458
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->readAdvertisedRefs()V

    .line 459
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 463
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->close()V

    .line 465
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    if-eqz v0, :cond_0

    .line 467
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 471
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    .line 475
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->errorReaderThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 477
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->errorReaderThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 481
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->errorReaderThread:Ljava/lang/Thread;

    .line 484
    :cond_1
    :goto_1
    return-void

    .line 468
    :catch_0
    move-exception v0

    .line 471
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->receivePack:Ljava/lang/Process;

    throw v0

    .line 478
    :catch_1
    move-exception v0

    .line 481
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->errorReaderThread:Ljava/lang/Thread;

    goto :goto_1

    :catchall_1
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;->errorReaderThread:Ljava/lang/Thread;

    throw v0
.end method
