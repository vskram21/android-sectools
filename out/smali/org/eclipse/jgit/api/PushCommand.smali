.class public Lorg/eclipse/jgit/api/PushCommand;
.super Lorg/eclipse/jgit/api/TransportCommand;
.source "PushCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/TransportCommand",
        "<",
        "Lorg/eclipse/jgit/api/PushCommand;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/transport/PushResult;",
        ">;>;"
    }
.end annotation


# instance fields
.field private dryRun:Z

.field private force:Z

.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private out:Ljava/io/OutputStream;

.field private receivePack:Ljava/lang/String;

.field private final refSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation
.end field

.field private remote:Ljava/lang/String;

.field private thin:Z


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/TransportCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 82
    const-string v0, "origin"

    iput-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->remote:Ljava/lang/String;

    .line 86
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    iput-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 88
    const-string v0, "git-receive-pack"

    iput-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->receivePack:Ljava/lang/String;

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/PushCommand;->thin:Z

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    .line 104
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 4
    .parameter "nameOrSpec"

    .prologue
    .line 335
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_1

    .line 336
    iget-object v2, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    new-instance v3, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v3, p1}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    :cond_0
    :goto_0
    return-object p0

    .line 340
    :cond_1
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/PushCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 346
    .local v1, src:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_0

    .line 347
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/api/PushCommand;->add(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/PushCommand;

    goto :goto_0

    .line 341
    .end local v1           #src:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v0

    .line 342
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfPushCommand:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public add(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 3
    .parameter "ref"

    .prologue
    .line 321
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    new-instance v1, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    return-object p0
.end method

.method public call()Ljava/lang/Iterable;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/transport/PushResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/InvalidRemoteException;,
            Lorg/eclipse/jgit/api/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x1

    .line 122
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 124
    new-instance v5, Ljava/util/ArrayList;

    const/4 v10, 0x3

    invoke-direct {v5, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 127
    .local v5, pushResults:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/transport/PushResult;>;"
    :try_start_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 128
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteConfig;

    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v10

    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->getRemote()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v10, v11}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 130
    .local v0, config:Lorg/eclipse/jgit/transport/RemoteConfig;
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getPushRefSpecs()Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 132
    .end local v0           #config:Lorg/eclipse/jgit/transport/RemoteConfig;
    :cond_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 133
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v11, "HEAD"

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 134
    .local v2, head:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v2, :cond_1

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 135
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    new-instance v11, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v12

    invoke-interface {v12}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .end local v2           #head:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    iget-boolean v10, p0, Lorg/eclipse/jgit/api/PushCommand;->force:Z

    if-eqz v10, :cond_2

    .line 139
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ge v3, v10, :cond_2

    .line 140
    iget-object v11, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/transport/RefSpec;

    const/4 v12, 0x1

    invoke-virtual {v10, v12}, Lorg/eclipse/jgit/transport/RefSpec;->setForceUpdate(Z)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v10

    invoke-interface {v11, v3, v10}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 139
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 144
    .end local v3           #i:I
    :cond_2
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v11, p0, Lorg/eclipse/jgit/api/PushCommand;->remote:Ljava/lang/String;

    sget-object v12, Lorg/eclipse/jgit/transport/Transport$Operation;->PUSH:Lorg/eclipse/jgit/transport/Transport$Operation;

    invoke-static {v10, v11, v12}, Lorg/eclipse/jgit/transport/Transport;->openAll(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;

    move-result-object v9

    .line 145
    .local v9, transports:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/Transport;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/eclipse/jgit/transport/Transport;

    .line 146
    .local v8, transport:Lorg/eclipse/jgit/transport/Transport;
    iget-boolean v10, p0, Lorg/eclipse/jgit/api/PushCommand;->thin:Z

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/transport/Transport;->setPushThin(Z)V

    .line 147
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->receivePack:Ljava/lang/String;

    if-eqz v10, :cond_3

    .line 148
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->receivePack:Ljava/lang/String;

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/transport/Transport;->setOptionReceivePack(Ljava/lang/String;)V

    .line 149
    :cond_3
    iget-boolean v10, p0, Lorg/eclipse/jgit/api/PushCommand;->dryRun:Z

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/transport/Transport;->setDryRun(Z)V

    .line 150
    invoke-virtual {p0, v8}, Lorg/eclipse/jgit/api/PushCommand;->configure(Lorg/eclipse/jgit/transport/Transport;)Lorg/eclipse/jgit/api/GitCommand;

    .line 152
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/transport/Transport;->findRemoteRefUpdatesFor(Ljava/util/Collection;)Ljava/util/Collection;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    move-result-object v7

    .line 156
    .local v7, toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    :try_start_1
    iget-object v10, p0, Lorg/eclipse/jgit/api/PushCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    iget-object v11, p0, Lorg/eclipse/jgit/api/PushCommand;->out:Ljava/io/OutputStream;

    invoke-virtual {v8, v10, v7, v11}, Lorg/eclipse/jgit/transport/Transport;->push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/io/OutputStream;)Lorg/eclipse/jgit/transport/PushResult;

    move-result-object v6

    .line 157
    .local v6, result:Lorg/eclipse/jgit/transport/PushResult;
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_1 .. :try_end_1} :catch_1

    .line 163
    :try_start_2
    invoke-virtual {v8}, Lorg/eclipse/jgit/transport/Transport;->close()V
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_1

    .line 167
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v6           #result:Lorg/eclipse/jgit/transport/PushResult;
    .end local v7           #toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    .end local v8           #transport:Lorg/eclipse/jgit/transport/Transport;
    .end local v9           #transports:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/Transport;>;"
    :catch_0
    move-exception v1

    .line 168
    .local v1, e:Ljava/net/URISyntaxException;
    new-instance v10, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->invalidRemote:Ljava/lang/String;

    new-array v12, v13, [Ljava/lang/Object;

    const/4 v13, 0x0

    iget-object v14, p0, Lorg/eclipse/jgit/api/PushCommand;->remote:Ljava/lang/String;

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 159
    .end local v1           #e:Ljava/net/URISyntaxException;
    .restart local v4       #i$:Ljava/util/Iterator;
    .restart local v7       #toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    .restart local v8       #transport:Lorg/eclipse/jgit/transport/Transport;
    .restart local v9       #transports:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/Transport;>;"
    :catch_1
    move-exception v1

    .line 160
    .local v1, e:Lorg/eclipse/jgit/errors/TransportException;
    :try_start_3
    new-instance v10, Lorg/eclipse/jgit/api/errors/TransportException;

    invoke-virtual {v1}, Lorg/eclipse/jgit/errors/TransportException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v1}, Lorg/eclipse/jgit/api/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 163
    .end local v1           #e:Lorg/eclipse/jgit/errors/TransportException;
    :catchall_0
    move-exception v10

    :try_start_4
    invoke-virtual {v8}, Lorg/eclipse/jgit/transport/Transport;->close()V

    throw v10
    :try_end_4
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 170
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v7           #toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    .end local v8           #transport:Lorg/eclipse/jgit/transport/Transport;
    .end local v9           #transports:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/Transport;>;"
    :catch_2
    move-exception v1

    .line 171
    .restart local v1       #e:Lorg/eclipse/jgit/errors/TransportException;
    new-instance v10, Lorg/eclipse/jgit/api/errors/TransportException;

    invoke-virtual {v1}, Lorg/eclipse/jgit/errors/TransportException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v1}, Lorg/eclipse/jgit/api/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 173
    .end local v1           #e:Lorg/eclipse/jgit/errors/TransportException;
    :catch_3
    move-exception v1

    .line 174
    .local v1, e:Lorg/eclipse/jgit/errors/NotSupportedException;
    new-instance v10, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfPushCommand:Ljava/lang/String;

    invoke-direct {v10, v11, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 177
    .end local v1           #e:Lorg/eclipse/jgit/errors/NotSupportedException;
    :catch_4
    move-exception v1

    .line 178
    .local v1, e:Ljava/io/IOException;
    new-instance v10, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfPushCommand:Ljava/lang/String;

    invoke-direct {v10, v11, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 183
    .end local v1           #e:Ljava/io/IOException;
    .restart local v4       #i$:Ljava/util/Iterator;
    .restart local v9       #transports:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/Transport;>;"
    :cond_4
    return-object v5
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->call()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public getProgressMonitor()Lorg/eclipse/jgit/lib/ProgressMonitor;
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    return-object v0
.end method

.method public getReceivePack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 228
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->receivePack:Ljava/lang/String;

    return-object v0
.end method

.method public getRefSpecs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 264
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    return-object v0
.end method

.method public getRemote()Ljava/lang/String;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->remote:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 235
    iget v0, p0, Lorg/eclipse/jgit/api/PushCommand;->timeout:I

    return v0
.end method

.method public isDryRun()Z
    .locals 1

    .prologue
    .line 356
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/PushCommand;->dryRun:Z

    return v0
.end method

.method public isForce()Z
    .locals 1

    .prologue
    .line 396
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/PushCommand;->force:Z

    return v0
.end method

.method public isThin()Z
    .locals 1

    .prologue
    .line 375
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/PushCommand;->thin:Z

    return v0
.end method

.method public setDryRun(Z)Lorg/eclipse/jgit/api/PushCommand;
    .locals 0
    .parameter "dryRun"

    .prologue
    .line 366
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 367
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/PushCommand;->dryRun:Z

    .line 368
    return-object p0
.end method

.method public setForce(Z)Lorg/eclipse/jgit/api/PushCommand;
    .locals 0
    .parameter "force"

    .prologue
    .line 406
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 407
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/PushCommand;->force:Z

    .line 408
    return-object p0
.end method

.method public setOutputStream(Ljava/io/OutputStream;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 0
    .parameter "out"

    .prologue
    .line 419
    iput-object p1, p0, Lorg/eclipse/jgit/api/PushCommand;->out:Ljava/io/OutputStream;

    .line 420
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 255
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 256
    iput-object p1, p0, Lorg/eclipse/jgit/api/PushCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 257
    return-object p0
.end method

.method public setPushAll()Lorg/eclipse/jgit/api/PushCommand;
    .locals 2

    .prologue
    .line 299
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    sget-object v1, Lorg/eclipse/jgit/transport/Transport;->REFSPEC_PUSH_ALL:Lorg/eclipse/jgit/transport/RefSpec;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    return-object p0
.end method

.method public setPushTags()Lorg/eclipse/jgit/api/PushCommand;
    .locals 2

    .prologue
    .line 309
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    sget-object v1, Lorg/eclipse/jgit/transport/Transport;->REFSPEC_TAGS:Lorg/eclipse/jgit/transport/RefSpec;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    return-object p0
.end method

.method public setReceivePack(Ljava/lang/String;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 0
    .parameter "receivePack"

    .prologue
    .line 219
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 220
    iput-object p1, p0, Lorg/eclipse/jgit/api/PushCommand;->receivePack:Ljava/lang/String;

    .line 221
    return-object p0
.end method

.method public setRefSpecs(Ljava/util/List;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)",
            "Lorg/eclipse/jgit/api/PushCommand;"
        }
    .end annotation

    .prologue
    .line 287
    .local p1, specs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 288
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 289
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 290
    return-object p0
.end method

.method public varargs setRefSpecs([Lorg/eclipse/jgit/transport/RefSpec;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 1
    .parameter "specs"

    .prologue
    .line 274
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 275
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 276
    iget-object v0, p0, Lorg/eclipse/jgit/api/PushCommand;->refSpecs:Ljava/util/List;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 277
    return-object p0
.end method

.method public setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/PushCommand;
    .locals 0
    .parameter "remote"

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 198
    iput-object p1, p0, Lorg/eclipse/jgit/api/PushCommand;->remote:Ljava/lang/String;

    .line 199
    return-object p0
.end method

.method public setThin(Z)Lorg/eclipse/jgit/api/PushCommand;
    .locals 0
    .parameter "thin"

    .prologue
    .line 387
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/PushCommand;->checkCallable()V

    .line 388
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/PushCommand;->thin:Z

    .line 389
    return-object p0
.end method
