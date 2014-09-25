.class Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;
.super Lorg/eclipse/jgit/transport/BasePackPushConnection;
.source "TransportLocal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportLocal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InternalLocalPushConnection"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportLocal;

.field private worker:Ljava/lang/Thread;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportLocal;)V
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 360
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    .line 361
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 365
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/RepositoryBuilder;-><init>()V

    #getter for: Lorg/eclipse/jgit/transport/TransportLocal;->remoteGitDir:Ljava/io/File;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/TransportLocal;->access$000(Lorg/eclipse/jgit/transport/TransportLocal;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->build()Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 376
    .local v4, dst:Lorg/eclipse/jgit/lib/Repository;
    :try_start_1
    new-instance v8, Ljava/io/PipedInputStream;

    invoke-direct {v8}, Ljava/io/PipedInputStream;-><init>()V

    .line 377
    .local v8, in_r:Ljava/io/PipedInputStream;
    new-instance v6, Ljava/io/PipedOutputStream;

    invoke-direct {v6, v8}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    .line 379
    .local v6, in_w:Ljava/io/PipedOutputStream;
    new-instance v5, Ljava/io/PipedInputStream;

    invoke-direct {v5}, Ljava/io/PipedInputStream;-><init>()V

    .line 380
    .local v5, out_r:Ljava/io/PipedInputStream;
    new-instance v9, Ljava/io/PipedOutputStream;

    invoke-direct {v9, v5}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 386
    .local v9, out_w:Ljava/io/PipedOutputStream;
    new-instance v0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;

    const-string v2, "JGit-Receive-Pack"

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;-><init>(Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;Ljava/lang/String;Lorg/eclipse/jgit/transport/TransportLocal;Lorg/eclipse/jgit/lib/Repository;Ljava/io/PipedInputStream;Ljava/io/PipedOutputStream;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->worker:Ljava/lang/Thread;

    .line 412
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->worker:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 414
    invoke-virtual {p0, v8, v9}, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 415
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->readAdvertisedRefs()V

    .line 416
    return-void

    .line 366
    .end local v4           #dst:Lorg/eclipse/jgit/lib/Repository;
    .end local v5           #out_r:Ljava/io/PipedInputStream;
    .end local v6           #in_w:Ljava/io/PipedOutputStream;
    .end local v8           #in_r:Ljava/io/PipedInputStream;
    .end local v9           #out_w:Ljava/io/PipedOutputStream;
    :catch_0
    move-exception v7

    .line 367
    .local v7, err:Ljava/io/IOException;
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->notAGitDirectory:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v0

    .line 381
    .end local v7           #err:Ljava/io/IOException;
    .restart local v4       #dst:Lorg/eclipse/jgit/lib/Repository;
    :catch_1
    move-exception v7

    .line 382
    .restart local v7       #err:Ljava/io/IOException;
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 383
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotConnectPipes:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v7}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 420
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->close()V

    .line 422
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->worker:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 424
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->worker:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 428
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->worker:Ljava/lang/Thread;

    .line 431
    :cond_0
    :goto_0
    return-void

    .line 425
    :catch_0
    move-exception v0

    .line 428
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->worker:Ljava/lang/Thread;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->worker:Ljava/lang/Thread;

    throw v0
.end method
