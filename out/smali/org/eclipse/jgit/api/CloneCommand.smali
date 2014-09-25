.class public Lorg/eclipse/jgit/api/CloneCommand;
.super Lorg/eclipse/jgit/api/TransportCommand;
.source "CloneCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/TransportCommand",
        "<",
        "Lorg/eclipse/jgit/api/CloneCommand;",
        "Lorg/eclipse/jgit/api/Git;",
        ">;"
    }
.end annotation


# instance fields
.field private bare:Z

.field private branch:Ljava/lang/String;

.field private branchesToClone:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private cloneAllBranches:Z

.field private cloneSubmodules:Z

.field private directory:Ljava/io/File;

.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private noCheckout:Z

.field private remote:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 109
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/api/TransportCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 91
    const-string v0, "origin"

    iput-object v0, p0, Lorg/eclipse/jgit/api/CloneCommand;->remote:Ljava/lang/String;

    .line 93
    const-string v0, "HEAD"

    iput-object v0, p0, Lorg/eclipse/jgit/api/CloneCommand;->branch:Ljava/lang/String;

    .line 95
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    iput-object v0, p0, Lorg/eclipse/jgit/api/CloneCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 110
    return-void
.end method

.method private addMergeConfig(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 6
    .parameter "clonedRepo"
    .parameter "head"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 291
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 292
    .local v1, branchName:Ljava/lang/String;
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    const-string v3, "branch"

    const-string v4, "remote"

    iget-object v5, p0, Lorg/eclipse/jgit/api/CloneCommand;->remote:Ljava/lang/String;

    invoke-virtual {v2, v3, v1, v4, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    const-string v3, "branch"

    const-string v4, "merge"

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v1, v4, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    const-string v3, "branch"

    const/4 v4, 0x0

    const-string v5, "autosetuprebase"

    invoke-virtual {v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 299
    .local v0, autosetupRebase:Ljava/lang/String;
    const-string v2, "always"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "remote"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 301
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    const-string v3, "branch"

    const-string v4, "rebase"

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v1, v4, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->setBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 304
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V

    .line 305
    return-void
.end method

.method private calculateRefSpecs(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .parameter "dst"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 182
    new-instance v3, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v3}, Lorg/eclipse/jgit/transport/RefSpec;-><init>()V

    .line 183
    .local v3, wcrs:Lorg/eclipse/jgit/transport/RefSpec;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/transport/RefSpec;->setForceUpdate(Z)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v3

    .line 184
    const-string v4, "refs/heads/*"

    invoke-virtual {v3, v4, p1}, Lorg/eclipse/jgit/transport/RefSpec;->setSourceDestination(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v3

    .line 185
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .local v2, specs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    iget-boolean v4, p0, Lorg/eclipse/jgit/api/CloneCommand;->cloneAllBranches:Z

    if-eqz v4, :cond_1

    .line 187
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    :cond_0
    return-object v2

    .line 188
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/api/CloneCommand;->branchesToClone:Ljava/util/Collection;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lorg/eclipse/jgit/api/CloneCommand;->branchesToClone:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 190
    iget-object v4, p0, Lorg/eclipse/jgit/api/CloneCommand;->branchesToClone:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 191
    .local v1, selectedRef:Ljava/lang/String;
    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/transport/RefSpec;->matchSource(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 192
    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private checkout(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/FetchResult;)V
    .locals 10
    .parameter "clonedRepo"
    .parameter "result"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 201
    const/4 v5, 0x0

    .line 202
    .local v5, head:Lorg/eclipse/jgit/lib/Ref;
    iget-object v8, p0, Lorg/eclipse/jgit/api/CloneCommand;->branch:Ljava/lang/String;

    const-string v9, "HEAD"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 203
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/api/CloneCommand;->findBranchToCheckout(Lorg/eclipse/jgit/transport/FetchResult;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    .line 204
    .local v4, foundBranch:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v4, :cond_0

    .line 205
    move-object v5, v4

    .line 207
    .end local v4           #foundBranch:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    if-nez v5, :cond_2

    .line 208
    iget-object v8, p0, Lorg/eclipse/jgit/api/CloneCommand;->branch:Ljava/lang/String;

    invoke-virtual {p2, v8}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 209
    if-nez v5, :cond_1

    .line 210
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "refs/heads/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/eclipse/jgit/api/CloneCommand;->branch:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p2, v8}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 211
    :cond_1
    if-nez v5, :cond_2

    .line 212
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "refs/tags/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/eclipse/jgit/api/CloneCommand;->branch:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p2, v8}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 215
    :cond_2
    if-eqz v5, :cond_3

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    if-nez v8, :cond_4

    .line 240
    :cond_3
    :goto_0
    return-void

    .line 218
    :cond_4
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "refs/heads/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 219
    const-string v8, "HEAD"

    invoke-virtual {p1, v8}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v6

    .line 220
    .local v6, newHead:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/RefUpdate;->disableRefLog()V

    .line 221
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 222
    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/api/CloneCommand;->addMergeConfig(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/Ref;)V

    .line 225
    .end local v6           #newHead:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_5
    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/api/CloneCommand;->parseCommit(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 227
    .local v1, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "refs/heads/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_6

    const/4 v3, 0x1

    .line 228
    .local v3, detached:Z
    :goto_1
    const-string v8, "HEAD"

    invoke-virtual {p1, v8, v3}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v7

    .line 229
    .local v7, u:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 230
    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 232
    iget-boolean v8, p0, Lorg/eclipse/jgit/api/CloneCommand;->bare:Z

    if-nez v8, :cond_3

    .line 233
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v2

    .line 234
    .local v2, dc:Lorg/eclipse/jgit/dircache/DirCache;
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v8

    invoke-direct {v0, p1, v2, v8}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 236
    .local v0, co:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 237
    iget-boolean v8, p0, Lorg/eclipse/jgit/api/CloneCommand;->cloneSubmodules:Z

    if-eqz v8, :cond_3

    .line 238
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/CloneCommand;->cloneSubmodules(Lorg/eclipse/jgit/lib/Repository;)V

    goto :goto_0

    .line 227
    .end local v0           #co:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v2           #dc:Lorg/eclipse/jgit/dircache/DirCache;
    .end local v3           #detached:Z
    .end local v7           #u:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_6
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private cloneSubmodules(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 5
    .parameter "clonedRepo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 244
    new-instance v0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/api/SubmoduleInitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 245
    .local v0, init:Lorg/eclipse/jgit/api/SubmoduleInitCommand;
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->call()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 264
    :cond_0
    return-void

    .line 248
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;

    invoke-direct {v2, p1}, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 249
    .local v2, update:Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/api/CloneCommand;->configure(Lorg/eclipse/jgit/api/TransportCommand;)Lorg/eclipse/jgit/api/GitCommand;

    .line 250
    iget-object v4, p0, Lorg/eclipse/jgit/api/CloneCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;

    .line 251
    invoke-virtual {v2}, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->call()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 252
    invoke-static {p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->forIndex(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    move-result-object v3

    .line 253
    .local v3, walk:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :cond_2
    :goto_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 254
    invoke-virtual {v3}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    .line 255
    .local v1, subRepo:Lorg/eclipse/jgit/lib/Repository;
    if-eqz v1, :cond_2

    .line 257
    :try_start_0
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/api/CloneCommand;->cloneSubmodules(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_0

    :catchall_0
    move-exception v4

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v4
.end method

.method private fetch(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/FetchResult;
    .locals 8
    .parameter "clonedRepo"
    .parameter "u"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;,
            Lorg/eclipse/jgit/api/errors/TransportException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 154
    new-instance v1, Lorg/eclipse/jgit/transport/RemoteConfig;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/api/CloneCommand;->remote:Ljava/lang/String;

    invoke-direct {v1, v5, v6}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 155
    .local v1, config:Lorg/eclipse/jgit/transport/RemoteConfig;
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/transport/RemoteConfig;->addURI(Lorg/eclipse/jgit/transport/URIish;)Z

    .line 157
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v5, p0, Lorg/eclipse/jgit/api/CloneCommand;->bare:Z

    if-eqz v5, :cond_0

    const-string v5, "refs/heads/"

    :goto_0
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "*"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 159
    .local v2, dst:Ljava/lang/String;
    new-instance v3, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v3}, Lorg/eclipse/jgit/transport/RefSpec;-><init>()V

    .line 160
    .local v3, refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/transport/RefSpec;->setForceUpdate(Z)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v3

    .line 161
    const-string v5, "refs/heads/*"

    invoke-virtual {v3, v5, v2}, Lorg/eclipse/jgit/transport/RefSpec;->setSourceDestination(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v3

    .line 163
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/transport/RemoteConfig;->addFetchRefSpec(Lorg/eclipse/jgit/transport/RefSpec;)Z

    .line 164
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/transport/RemoteConfig;->update(Lorg/eclipse/jgit/lib/Config;)V

    .line 166
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V

    .line 169
    new-instance v0, Lorg/eclipse/jgit/api/FetchCommand;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/api/FetchCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 170
    .local v0, command:Lorg/eclipse/jgit/api/FetchCommand;
    iget-object v5, p0, Lorg/eclipse/jgit/api/CloneCommand;->remote:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/api/FetchCommand;->setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/FetchCommand;

    .line 171
    iget-object v5, p0, Lorg/eclipse/jgit/api/CloneCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/api/FetchCommand;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/FetchCommand;

    .line 172
    sget-object v5, Lorg/eclipse/jgit/transport/TagOpt;->FETCH_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/api/FetchCommand;->setTagOpt(Lorg/eclipse/jgit/transport/TagOpt;)Lorg/eclipse/jgit/api/FetchCommand;

    .line 173
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/CloneCommand;->configure(Lorg/eclipse/jgit/api/TransportCommand;)Lorg/eclipse/jgit/api/GitCommand;

    .line 175
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/api/CloneCommand;->calculateRefSpecs(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 176
    .local v4, specs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/api/FetchCommand;->setRefSpecs(Ljava/util/List;)Lorg/eclipse/jgit/api/FetchCommand;

    .line 178
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/FetchCommand;->call()Lorg/eclipse/jgit/transport/FetchResult;

    move-result-object v5

    return-object v5

    .line 157
    .end local v0           #command:Lorg/eclipse/jgit/api/FetchCommand;
    .end local v2           #dst:Ljava/lang/String;
    .end local v3           #refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v4           #specs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "refs/remotes/"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method private findBranchToCheckout(Lorg/eclipse/jgit/transport/FetchResult;)Lorg/eclipse/jgit/lib/Ref;
    .locals 8
    .parameter "result"

    .prologue
    .line 267
    const-string v6, "HEAD"

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 268
    .local v2, idHEAD:Lorg/eclipse/jgit/lib/Ref;
    if-nez v2, :cond_1

    .line 269
    const/4 v3, 0x0

    .line 286
    :cond_0
    :goto_0
    return-object v3

    .line 271
    :cond_1
    const-string v6, "refs/heads/master"

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 273
    .local v3, master:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v3, :cond_2

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 276
    :cond_2
    const/4 v0, 0x0

    .line 277
    .local v0, foundBranch:Lorg/eclipse/jgit/lib/Ref;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRefs()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/Ref;

    .line 278
    .local v5, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    .line 279
    .local v4, n:Ljava/lang/String;
    const-string v6, "refs/heads/"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 281
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 282
    move-object v0, v5

    .end local v4           #n:Ljava/lang/String;
    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_4
    move-object v3, v0

    .line 286
    goto :goto_0
.end method

.method private init(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/lib/Repository;
    .locals 6
    .parameter "u"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-static {}, Lorg/eclipse/jgit/api/Git;->init()Lorg/eclipse/jgit/api/InitCommand;

    move-result-object v0

    .line 139
    .local v0, command:Lorg/eclipse/jgit/api/InitCommand;
    iget-boolean v1, p0, Lorg/eclipse/jgit/api/CloneCommand;->bare:Z

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/InitCommand;->setBare(Z)Lorg/eclipse/jgit/api/InitCommand;

    .line 140
    iget-object v1, p0, Lorg/eclipse/jgit/api/CloneCommand;->directory:Ljava/io/File;

    if-nez v1, :cond_0

    .line 141
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getHumanishName()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".git"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/eclipse/jgit/api/CloneCommand;->directory:Ljava/io/File;

    .line 142
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/CloneCommand;->directory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/api/CloneCommand;->directory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    array-length v1, v1

    if-eqz v1, :cond_1

    .line 143
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cloneNonEmptyDirectory:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/eclipse/jgit/api/CloneCommand;->directory:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 145
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/api/CloneCommand;->directory:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/InitCommand;->setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/InitCommand;

    .line 146
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/InitCommand;->call()Lorg/eclipse/jgit/api/Git;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/api/Git;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    return-object v1
.end method

.method private parseCommit(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3
    .parameter "clonedRepo"
    .parameter "ref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 310
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 313
    .local v1, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 315
    .local v0, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 317
    return-object v0

    .line 315
    .end local v0           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v2
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
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CloneCommand;->call()Lorg/eclipse/jgit/api/Git;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/Git;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/InvalidRemoteException;,
            Lorg/eclipse/jgit/api/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 123
    :try_start_0
    new-instance v4, Lorg/eclipse/jgit/transport/URIish;

    iget-object v5, p0, Lorg/eclipse/jgit/api/CloneCommand;->uri:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/lang/String;)V

    .line 124
    .local v4, u:Lorg/eclipse/jgit/transport/URIish;
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/api/CloneCommand;->init(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    .line 125
    .local v2, repository:Lorg/eclipse/jgit/lib/Repository;
    invoke-direct {p0, v2, v4}, Lorg/eclipse/jgit/api/CloneCommand;->fetch(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/FetchResult;

    move-result-object v3

    .line 126
    .local v3, result:Lorg/eclipse/jgit/transport/FetchResult;
    iget-boolean v5, p0, Lorg/eclipse/jgit/api/CloneCommand;->noCheckout:Z

    if-nez v5, :cond_0

    .line 127
    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/api/CloneCommand;->checkout(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/FetchResult;)V

    .line 128
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/api/Git;

    invoke-direct {v5, v2}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    return-object v5

    .line 129
    .end local v2           #repository:Lorg/eclipse/jgit/lib/Repository;
    .end local v3           #result:Lorg/eclipse/jgit/transport/FetchResult;
    .end local v4           #u:Lorg/eclipse/jgit/transport/URIish;
    :catch_0
    move-exception v1

    .line 130
    .local v1, ioe:Ljava/io/IOException;
    new-instance v5, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 131
    .end local v1           #ioe:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 132
    .local v0, e:Ljava/net/URISyntaxException;
    new-instance v5, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->invalidRemote:Ljava/lang/String;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lorg/eclipse/jgit/api/CloneCommand;->remote:Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/api/errors/InvalidRemoteException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public setBare(Z)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "bare"

    .prologue
    .line 351
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->bare:Z

    .line 352
    return-object p0
.end method

.method public setBranch(Ljava/lang/String;)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "branch"

    .prologue
    .line 378
    iput-object p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->branch:Ljava/lang/String;

    .line 379
    return-object p0
.end method

.method public setBranchesToClone(Ljava/util/Collection;)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/eclipse/jgit/api/CloneCommand;"
        }
    .end annotation

    .prologue
    .line 426
    .local p1, branchesToClone:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->branchesToClone:Ljava/util/Collection;

    .line 427
    return-object p0
.end method

.method public setCloneAllBranches(Z)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "cloneAllBranches"

    .prologue
    .line 403
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->cloneAllBranches:Z

    .line 404
    return-object p0
.end method

.method public setCloneSubmodules(Z)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "cloneSubmodules"

    .prologue
    .line 414
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->cloneSubmodules:Z

    .line 415
    return-object p0
.end method

.method public setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "directory"

    .prologue
    .line 341
    iput-object p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->directory:Ljava/io/File;

    .line 342
    return-object p0
.end method

.method public setNoCheckout(Z)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "noCheckout"

    .prologue
    .line 438
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->noCheckout:Z

    .line 439
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 392
    iput-object p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 393
    return-object p0
.end method

.method public setRemote(Ljava/lang/String;)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "remote"

    .prologue
    .line 366
    iput-object p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->remote:Ljava/lang/String;

    .line 367
    return-object p0
.end method

.method public setURI(Ljava/lang/String;)Lorg/eclipse/jgit/api/CloneCommand;
    .locals 0
    .parameter "uri"

    .prologue
    .line 326
    iput-object p1, p0, Lorg/eclipse/jgit/api/CloneCommand;->uri:Ljava/lang/String;

    .line 327
    return-object p0
.end method
