.class Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;
.super Lorg/eclipse/jgit/transport/BasePackFetchConnection;
.source "TransportLocal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportLocal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ForkLocalFetchConnection"
.end annotation


# instance fields
.field private errorReaderThread:Ljava/lang/Thread;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportLocal;

.field private uploadPack:Ljava/lang/Process;


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
    .line 309
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    .line 310
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 312
    new-instance v0, Lorg/eclipse/jgit/util/io/MessageWriter;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/io/MessageWriter;-><init>()V

    .line 313
    .local v0, msg:Lorg/eclipse/jgit/util/io/MessageWriter;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->setMessageWriter(Ljava/io/Writer;)V

    .line 315
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportLocal;->getOptionUploadPack()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/transport/TransportLocal;->spawn(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    .line 317
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    .line 318
    .local v1, upErr:Ljava/io/InputStream;
    new-instance v6, Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/MessageWriter;->getRawStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v6, v1, v7}, Lorg/eclipse/jgit/util/io/StreamCopyThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    iput-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->errorReaderThread:Ljava/lang/Thread;

    .line 319
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->errorReaderThread:Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 321
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 322
    .local v2, upIn:Ljava/io/InputStream;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 324
    .local v4, upOut:Ljava/io/OutputStream;
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 325
    .end local v2           #upIn:Ljava/io/InputStream;
    .local v3, upIn:Ljava/io/InputStream;
    new-instance v5, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v5, v4}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 327
    .end local v4           #upOut:Ljava/io/OutputStream;
    .local v5, upOut:Ljava/io/OutputStream;
    invoke-virtual {p0, v3, v5}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 328
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->readAdvertisedRefs()V

    .line 329
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 333
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->close()V

    .line 335
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    if-eqz v0, :cond_0

    .line 337
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    .line 345
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->errorReaderThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 347
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->errorReaderThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 351
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->errorReaderThread:Ljava/lang/Thread;

    .line 354
    :cond_1
    :goto_1
    return-void

    .line 338
    :catch_0
    move-exception v0

    .line 341
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->uploadPack:Ljava/lang/Process;

    throw v0

    .line 348
    :catch_1
    move-exception v0

    .line 351
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->errorReaderThread:Ljava/lang/Thread;

    goto :goto_1

    :catchall_1
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;->errorReaderThread:Ljava/lang/Thread;

    throw v0
.end method
