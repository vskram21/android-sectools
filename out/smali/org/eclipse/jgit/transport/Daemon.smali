.class public Lorg/eclipse/jgit/transport/Daemon;
.super Ljava/lang/Object;
.source "Daemon.java"


# static fields
.field private static final BACKLOG:I = 0x5

.field public static final DEFAULT_PORT:I = 0x24ca


# instance fields
.field private acceptThread:Ljava/lang/Thread;

.field private myAddress:Ljava/net/InetSocketAddress;

.field private packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field private final processors:Ljava/lang/ThreadGroup;

.field private volatile receivePackFactory:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory",
            "<",
            "Lorg/eclipse/jgit/transport/DaemonClient;",
            ">;"
        }
    .end annotation
.end field

.field private volatile repositoryResolver:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/transport/resolver/RepositoryResolver",
            "<",
            "Lorg/eclipse/jgit/transport/DaemonClient;",
            ">;"
        }
    .end annotation
.end field

.field private run:Z

.field private final services:[Lorg/eclipse/jgit/transport/DaemonService;

.field private timeout:I

.field private volatile uploadPackFactory:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/transport/resolver/UploadPackFactory",
            "<",
            "Lorg/eclipse/jgit/transport/DaemonClient;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/Daemon;-><init>(Ljava/net/InetSocketAddress;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Ljava/net/InetSocketAddress;)V
    .locals 5
    .parameter "addr"

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon;->myAddress:Ljava/net/InetSocketAddress;

    .line 108
    new-instance v0, Ljava/lang/ThreadGroup;

    const-string v1, "Git-Daemon"

    invoke-direct {v0, v1}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->processors:Ljava/lang/ThreadGroup;

    .line 110
    sget-object v0, Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;->NONE:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->repositoryResolver:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;

    .line 112
    new-instance v0, Lorg/eclipse/jgit/transport/Daemon$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/Daemon$1;-><init>(Lorg/eclipse/jgit/transport/Daemon;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->uploadPackFactory:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;

    .line 123
    new-instance v0, Lorg/eclipse/jgit/transport/Daemon$2;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/Daemon$2;-><init>(Lorg/eclipse/jgit/transport/Daemon;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->receivePackFactory:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;

    .line 142
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/transport/DaemonService;

    const/4 v1, 0x0

    new-instance v2, Lorg/eclipse/jgit/transport/Daemon$3;

    const-string v3, "upload-pack"

    const-string v4, "uploadpack"

    invoke-direct {v2, p0, v3, v4}, Lorg/eclipse/jgit/transport/Daemon$3;-><init>(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lorg/eclipse/jgit/transport/Daemon$4;

    const-string v3, "receive-pack"

    const-string v4, "receivepack"

    invoke-direct {v2, p0, v3, v4}, Lorg/eclipse/jgit/transport/Daemon$4;-><init>(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->services:[Lorg/eclipse/jgit/transport/DaemonService;

    .line 174
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/transport/Daemon;)Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;
    .locals 1
    .parameter "x0"

    .prologue
    .line 68
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->uploadPackFactory:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;

    return-object v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/Daemon;)Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;
    .locals 1
    .parameter "x0"

    .prologue
    .line 68
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->receivePackFactory:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/transport/Daemon;Ljava/net/Socket;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/Daemon;->startClient(Ljava/net/Socket;)V

    return-void
.end method

.method static synthetic access$302(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 68
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;

    return-object p1
.end method

.method private startClient(Ljava/net/Socket;)V
    .locals 7
    .parameter "s"

    .prologue
    .line 329
    new-instance v4, Lorg/eclipse/jgit/transport/DaemonClient;

    invoke-direct {v4, p0}, Lorg/eclipse/jgit/transport/DaemonClient;-><init>(Lorg/eclipse/jgit/transport/Daemon;)V

    .line 331
    .local v4, dc:Lorg/eclipse/jgit/transport/DaemonClient;
    invoke-virtual {p1}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v6

    .line 332
    .local v6, peer:Ljava/net/SocketAddress;
    instance-of v0, v6, Ljava/net/InetSocketAddress;

    if-eqz v0, :cond_0

    move-object v0, v6

    .line 333
    check-cast v0, Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/transport/DaemonClient;->setRemoteAddress(Ljava/net/InetAddress;)V

    .line 335
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/transport/Daemon$6;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/Daemon;->processors:Ljava/lang/ThreadGroup;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Git-Daemon-Client "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/transport/Daemon$6;-><init>(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/ThreadGroup;Ljava/lang/String;Lorg/eclipse/jgit/transport/DaemonClient;Ljava/net/Socket;)V

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/Daemon$6;->start()V

    .line 359
    return-void
.end method


# virtual methods
.method public declared-synchronized getAddress()Ljava/net/InetSocketAddress;
    .locals 1

    .prologue
    .line 178
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->myAddress:Ljava/net/InetSocketAddress;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getPackConfig()Lorg/eclipse/jgit/storage/pack/PackConfig;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    return-object v0
.end method

.method public declared-synchronized getService(Ljava/lang/String;)Lorg/eclipse/jgit/transport/DaemonService;
    .locals 6
    .parameter "name"

    .prologue
    .line 191
    monitor-enter p0

    :try_start_0
    const-string v4, "git-"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 192
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "git-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 193
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->services:[Lorg/eclipse/jgit/transport/DaemonService;

    .local v0, arr$:[Lorg/eclipse/jgit/transport/DaemonService;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 194
    .local v3, s:Lorg/eclipse/jgit/transport/DaemonService;
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/DaemonService;->getCommandName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_1

    .line 197
    .end local v3           #s:Lorg/eclipse/jgit/transport/DaemonService;
    :goto_1
    monitor-exit p0

    return-object v3

    .line 193
    .restart local v3       #s:Lorg/eclipse/jgit/transport/DaemonService;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 197
    .end local v3           #s:Lorg/eclipse/jgit/transport/DaemonService;
    :cond_2
    const/4 v3, 0x0

    goto :goto_1

    .line 191
    .end local v0           #arr$:[Lorg/eclipse/jgit/transport/DaemonService;
    .end local v1           #i$:I
    .end local v2           #len$:I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 202
    iget v0, p0, Lorg/eclipse/jgit/transport/Daemon;->timeout:I

    return v0
.end method

.method public declared-synchronized isRunning()Z
    .locals 1

    .prologue
    .line 317
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/Daemon;->run:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized matchService(Ljava/lang/String;)Lorg/eclipse/jgit/transport/DaemonService;
    .locals 5
    .parameter "cmd"

    .prologue
    .line 362
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->services:[Lorg/eclipse/jgit/transport/DaemonService;

    .local v0, arr$:[Lorg/eclipse/jgit/transport/DaemonService;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 363
    .local v1, d:Lorg/eclipse/jgit/transport/DaemonService;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/transport/DaemonService;->handles(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_0

    .line 366
    .end local v1           #d:Lorg/eclipse/jgit/transport/DaemonService;
    :goto_1
    monitor-exit p0

    return-object v1

    .line 362
    .restart local v1       #d:Lorg/eclipse/jgit/transport/DaemonService;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 366
    .end local v1           #d:Lorg/eclipse/jgit/transport/DaemonService;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 362
    .end local v0           #arr$:[Lorg/eclipse/jgit/transport/DaemonService;
    .end local v2           #i$:I
    .end local v3           #len$:I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method openRepository(Lorg/eclipse/jgit/transport/DaemonClient;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    .locals 4
    .parameter "client"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 374
    const/16 v2, 0x5c

    const/16 v3, 0x2f

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p2

    .line 378
    const-string v2, "/"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 394
    :goto_0
    return-object v1

    .line 382
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/Daemon;->repositoryResolver:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;

    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p1, v3}, Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;->open(Ljava/lang/Object;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/RepositoryNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    goto :goto_0

    .line 383
    :catch_0
    move-exception v0

    .line 386
    .local v0, e:Lorg/eclipse/jgit/errors/RepositoryNotFoundException;
    goto :goto_0

    .line 387
    .end local v0           #e:Lorg/eclipse/jgit/errors/RepositoryNotFoundException;
    :catch_1
    move-exception v0

    .line 390
    .local v0, e:Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
    goto :goto_0

    .line 391
    .end local v0           #e:Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
    :catch_2
    move-exception v0

    .line 394
    .local v0, e:Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;
    goto :goto_0
.end method

.method public setPackConfig(Lorg/eclipse/jgit/storage/pack/PackConfig;)V
    .locals 0
    .parameter "pc"

    .prologue
    .line 230
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 231
    return-void
.end method

.method public setReceivePackFactory(Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory",
            "<",
            "Lorg/eclipse/jgit/transport/DaemonClient;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 265
    .local p1, factory:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;,"Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory<Lorg/eclipse/jgit/transport/DaemonClient;>;"
    if-eqz p1, :cond_0

    .line 266
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon;->receivePackFactory:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;

    .line 269
    :goto_0
    return-void

    .line 268
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;->DISABLED:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->receivePackFactory:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;

    goto :goto_0
.end method

.method public setRepositoryResolver(Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/resolver/RepositoryResolver",
            "<",
            "Lorg/eclipse/jgit/transport/DaemonClient;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 240
    .local p1, resolver:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;,"Lorg/eclipse/jgit/transport/resolver/RepositoryResolver<Lorg/eclipse/jgit/transport/DaemonClient;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon;->repositoryResolver:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;

    .line 241
    return-void
.end method

.method public setTimeout(I)V
    .locals 0
    .parameter "seconds"

    .prologue
    .line 214
    iput p1, p0, Lorg/eclipse/jgit/transport/Daemon;->timeout:I

    .line 215
    return-void
.end method

.method public setUploadPackFactory(Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/resolver/UploadPackFactory",
            "<",
            "Lorg/eclipse/jgit/transport/DaemonClient;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 251
    .local p1, factory:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;,"Lorg/eclipse/jgit/transport/resolver/UploadPackFactory<Lorg/eclipse/jgit/transport/DaemonClient;>;"
    if-eqz p1, :cond_0

    .line 252
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon;->uploadPackFactory:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;

    .line 255
    :goto_0
    return-void

    .line 254
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;->DISABLED:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->uploadPackFactory:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;

    goto :goto_0
.end method

.method public declared-synchronized start()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 281
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->daemonAlreadyRunning:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 283
    :cond_0
    :try_start_1
    new-instance v0, Ljava/net/ServerSocket;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->myAddress:Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->myAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    move v2, v1

    :goto_0
    const/4 v3, 0x5

    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->myAddress:Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->myAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    :goto_1
    invoke-direct {v0, v2, v3, v1}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    .line 286
    .local v0, listenSock:Ljava/net/ServerSocket;
    invoke-virtual {v0}, Ljava/net/ServerSocket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v1

    check-cast v1, Ljava/net/InetSocketAddress;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->myAddress:Ljava/net/InetSocketAddress;

    .line 288
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/Daemon;->run:Z

    .line 289
    new-instance v1, Lorg/eclipse/jgit/transport/Daemon$5;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/Daemon;->processors:Ljava/lang/ThreadGroup;

    const-string v3, "Git-Daemon-Accept"

    invoke-direct {v1, p0, v2, v3, v0}, Lorg/eclipse/jgit/transport/Daemon$5;-><init>(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/ThreadGroup;Ljava/lang/String;Ljava/net/ServerSocket;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;

    .line 312
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 313
    monitor-exit p0

    return-void

    .line 283
    .end local v0           #listenSock:Ljava/net/ServerSocket;
    :cond_1
    const/4 v1, 0x0

    move v2, v1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public declared-synchronized stop()V
    .locals 1

    .prologue
    .line 322
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 323
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/Daemon;->run:Z

    .line 324
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 326
    :cond_0
    monitor-exit p0

    return-void

    .line 322
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
