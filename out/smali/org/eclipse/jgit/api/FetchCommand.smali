.class public Lorg/eclipse/jgit/api/FetchCommand;
.super Lorg/eclipse/jgit/api/TransportCommand;
.source "FetchCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/TransportCommand",
        "<",
        "Lorg/eclipse/jgit/api/FetchCommand;",
        "Lorg/eclipse/jgit/transport/FetchResult;",
        ">;"
    }
.end annotation


# instance fields
.field private checkFetchedObjects:Z

.field private dryRun:Z

.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private refSpecs:Ljava/util/List;
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

.field private removeDeletedRefs:Ljava/lang/Boolean;

.field private tagOption:Lorg/eclipse/jgit/transport/TagOpt;

.field private thin:Z


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/TransportCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 78
    const-string v0, "origin"

    iput-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->remote:Ljava/lang/String;

    .line 82
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    iput-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->thin:Z

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->refSpecs:Ljava/util/List;

    .line 100
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->call()Lorg/eclipse/jgit/transport/FetchResult;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/transport/FetchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/InvalidRemoteException;,
            Lorg/eclipse/jgit/api/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 117
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 120
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v4, p0, Lorg/eclipse/jgit/api/FetchCommand;->remote:Ljava/lang/String;

    invoke-static {v3, v4}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/NoRemoteRepositoryException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v2

    .line 122
    .local v2, transport:Lorg/eclipse/jgit/transport/Transport;
    :try_start_1
    iget-boolean v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->checkFetchedObjects:Z

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/Transport;->setCheckFetchedObjects(Z)V

    .line 123
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->isRemoveDeletedRefs()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/Transport;->setRemoveDeletedRefs(Z)V

    .line 124
    iget-boolean v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->dryRun:Z

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/Transport;->setDryRun(Z)V

    .line 125
    iget-object v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->tagOption:Lorg/eclipse/jgit/transport/TagOpt;

    if-eqz v3, :cond_0

    .line 126
    iget-object v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->tagOption:Lorg/eclipse/jgit/transport/TagOpt;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/Transport;->setTagOpt(Lorg/eclipse/jgit/transport/TagOpt;)V

    .line 127
    :cond_0
    iget-boolean v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->thin:Z

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/Transport;->setFetchThin(Z)V

    .line 128
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/api/FetchCommand;->configure(Lorg/eclipse/jgit/transport/Transport;)Lorg/eclipse/jgit/api/GitCommand;

    .line 130
    iget-object v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    iget-object v4, p0, Lorg/eclipse/jgit/api/FetchCommand;->refSpecs:Ljava/util/List;

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/transport/Transport;->fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;)Lorg/eclipse/jgit/transport/FetchResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 133
    .local v1, result:Lorg/eclipse/jgit/transport/FetchResult;
    :try_start_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/Transport;->close()V

    return-object v1

    .end local v1           #result:Lorg/eclipse/jgit/transport/FetchResult;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/Transport;->close()V

    throw v3
    :try_end_2
    .catch Lorg/eclipse/jgit/errors/NoRemoteRepositoryException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_2 .. :try_end_2} :catch_3

    .line 135
    .end local v2           #transport:Lorg/eclipse/jgit/transport/Transport;
    :catch_0
    move-exception v0

    .line 136
    .local v0, e:Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->invalidRemote:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lorg/eclipse/jgit/api/FetchCommand;->remote:Ljava/lang/String;

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 138
    .end local v0           #e:Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
    :catch_1
    move-exception v0

    .line 139
    .local v0, e:Lorg/eclipse/jgit/errors/TransportException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/TransportException;

    invoke-virtual {v0}, Lorg/eclipse/jgit/errors/TransportException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 141
    .end local v0           #e:Lorg/eclipse/jgit/errors/TransportException;
    :catch_2
    move-exception v0

    .line 142
    .local v0, e:Ljava/net/URISyntaxException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->invalidRemote:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lorg/eclipse/jgit/api/FetchCommand;->remote:Ljava/lang/String;

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 144
    .end local v0           #e:Ljava/net/URISyntaxException;
    :catch_3
    move-exception v0

    .line 145
    .local v0, e:Lorg/eclipse/jgit/errors/NotSupportedException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfFetchCommand:Ljava/lang/String;

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getProgressMonitor()Lorg/eclipse/jgit/lib/ProgressMonitor;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

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
    .line 255
    iget-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->refSpecs:Ljava/util/List;

    return-object v0
.end method

.method public getRemote()Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->remote:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 178
    iget v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->timeout:I

    return v0
.end method

.method public isCheckFetchedObjects()Z
    .locals 1

    .prologue
    .line 185
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->checkFetchedObjects:Z

    return v0
.end method

.method public isDryRun()Z
    .locals 1

    .prologue
    .line 289
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->dryRun:Z

    return v0
.end method

.method public isRemoveDeletedRefs()Z
    .locals 5

    .prologue
    .line 204
    iget-object v2, p0, Lorg/eclipse/jgit/api/FetchCommand;->removeDeletedRefs:Ljava/lang/Boolean;

    if-eqz v2, :cond_0

    .line 205
    iget-object v2, p0, Lorg/eclipse/jgit/api/FetchCommand;->removeDeletedRefs:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 213
    :goto_0
    return v1

    .line 207
    :cond_0
    const/4 v1, 0x0

    .line 208
    .local v1, result:Z
    iget-object v2, p0, Lorg/eclipse/jgit/api/FetchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    .line 209
    .local v0, config:Lorg/eclipse/jgit/lib/StoredConfig;
    const-string v2, "fetch"

    const/4 v3, 0x0

    const-string v4, "prune"

    invoke-virtual {v0, v2, v3, v4, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->getBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    .line 211
    const-string v2, "remote"

    iget-object v3, p0, Lorg/eclipse/jgit/api/FetchCommand;->remote:Ljava/lang/String;

    const-string v4, "prune"

    invoke-virtual {v0, v2, v3, v4, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->getBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    .line 213
    goto :goto_0
.end method

.method public isThin()Z
    .locals 1

    .prologue
    .line 308
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->thin:Z

    return v0
.end method

.method public setCheckFetchedObjects(Z)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 0
    .parameter "checkFetchedObjects"

    .prologue
    .line 195
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 196
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/FetchCommand;->checkFetchedObjects:Z

    .line 197
    return-object p0
.end method

.method public setDryRun(Z)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 0
    .parameter "dryRun"

    .prologue
    .line 299
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 300
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/FetchCommand;->dryRun:Z

    .line 301
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 246
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 247
    iput-object p1, p0, Lorg/eclipse/jgit/api/FetchCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 248
    return-object p0
.end method

.method public setRefSpecs(Ljava/util/List;)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)",
            "Lorg/eclipse/jgit/api/FetchCommand;"
        }
    .end annotation

    .prologue
    .line 279
    .local p1, specs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 280
    iget-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 281
    iget-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 282
    return-object p0
.end method

.method public varargs setRefSpecs([Lorg/eclipse/jgit/transport/RefSpec;)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 5
    .parameter "specs"

    .prologue
    .line 265
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 266
    iget-object v4, p0, Lorg/eclipse/jgit/api/FetchCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 267
    move-object v0, p1

    .local v0, arr$:[Lorg/eclipse/jgit/transport/RefSpec;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 268
    .local v3, spec:Lorg/eclipse/jgit/transport/RefSpec;
    iget-object v4, p0, Lorg/eclipse/jgit/api/FetchCommand;->refSpecs:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 269
    .end local v3           #spec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_0
    return-object p0
.end method

.method public setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 0
    .parameter "remote"

    .prologue
    .line 162
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 163
    iput-object p1, p0, Lorg/eclipse/jgit/api/FetchCommand;->remote:Ljava/lang/String;

    .line 164
    return-object p0
.end method

.method public setRemoveDeletedRefs(Z)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 1
    .parameter "removeDeletedRefs"

    .prologue
    .line 224
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 225
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/FetchCommand;->removeDeletedRefs:Ljava/lang/Boolean;

    .line 226
    return-object p0
.end method

.method public setTagOpt(Lorg/eclipse/jgit/transport/TagOpt;)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 0
    .parameter "tagOpt"

    .prologue
    .line 332
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 333
    iput-object p1, p0, Lorg/eclipse/jgit/api/FetchCommand;->tagOption:Lorg/eclipse/jgit/transport/TagOpt;

    .line 334
    return-object p0
.end method

.method public setThin(Z)Lorg/eclipse/jgit/api/FetchCommand;
    .locals 0
    .parameter "thin"

    .prologue
    .line 320
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/FetchCommand;->checkCallable()V

    .line 321
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/FetchCommand;->thin:Z

    .line 322
    return-object p0
.end method
