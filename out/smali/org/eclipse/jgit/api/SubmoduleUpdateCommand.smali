.class public Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;
.super Lorg/eclipse/jgit/api/TransportCommand;
.source "SubmoduleUpdateCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/TransportCommand",
        "<",
        "Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;",
        "Ljava/util/Collection",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final paths:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private strategy:Lorg/eclipse/jgit/merge/MergeStrategy;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/TransportCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 88
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    iput-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->paths:Ljava/util/Collection;

    .line 96
    return-void
.end method


# virtual methods
.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;
    .locals 1
    .parameter "path"

    .prologue
    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->paths:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 121
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->call()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Collection;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/InvalidConfigurationException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/CheckoutConflictException;,
            Lorg/eclipse/jgit/api/errors/InvalidMergeHeadsException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;,
            Lorg/eclipse/jgit/api/errors/NoMessageException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->checkCallable()V

    .line 146
    :try_start_0
    iget-object v13, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v13}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->forIndex(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    move-result-object v4

    .line 147
    .local v4, generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    iget-object v13, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->paths:Ljava/util/Collection;

    invoke-interface {v13}, Ljava/util/Collection;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_0

    .line 148
    iget-object v13, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->paths:Ljava/util/Collection;

    invoke-static {v13}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v13

    invoke-virtual {v4, v13}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 149
    :cond_0
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v10, updated:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    :goto_0
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 152
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getModulesPath()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_1

    .line 155
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getConfigUrl()Ljava/lang/String;

    move-result-object v11

    .line 156
    .local v11, url:Ljava/lang/String;
    if-eqz v11, :cond_1

    .line 159
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v8

    .line 161
    .local v8, submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    if-nez v8, :cond_3

    .line 162
    invoke-static {}, Lorg/eclipse/jgit/api/Git;->cloneRepository()Lorg/eclipse/jgit/api/CloneCommand;

    move-result-object v0

    .line 163
    .local v0, clone:Lorg/eclipse/jgit/api/CloneCommand;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->configure(Lorg/eclipse/jgit/api/TransportCommand;)Lorg/eclipse/jgit/api/GitCommand;

    .line 164
    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/api/CloneCommand;->setURI(Ljava/lang/String;)Lorg/eclipse/jgit/api/CloneCommand;

    .line 165
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getDirectory()Ljava/io/File;

    move-result-object v13

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/api/CloneCommand;->setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/CloneCommand;

    .line 166
    iget-object v13, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    if-eqz v13, :cond_2

    .line 167
    iget-object v13, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/api/CloneCommand;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/CloneCommand;

    .line 168
    :cond_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/CloneCommand;->call()Lorg/eclipse/jgit/api/Git;

    move-result-object v13

    invoke-virtual {v13}, Lorg/eclipse/jgit/api/Git;->getRepository()Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v8

    .line 172
    .end local v0           #clone:Lorg/eclipse/jgit/api/CloneCommand;
    :cond_3
    :try_start_1
    new-instance v12, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v12, v8}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 173
    .local v12, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 176
    .local v2, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getConfigUpdate()Ljava/lang/String;

    move-result-object v9

    .line 177
    .local v9, update:Ljava/lang/String;
    const-string v13, "merge"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 178
    new-instance v5, Lorg/eclipse/jgit/api/MergeCommand;

    invoke-direct {v5, v8}, Lorg/eclipse/jgit/api/MergeCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 179
    .local v5, merge:Lorg/eclipse/jgit/api/MergeCommand;
    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/api/MergeCommand;->include(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/MergeCommand;

    .line 180
    iget-object v13, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual {v5, v13}, Lorg/eclipse/jgit/api/MergeCommand;->setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/MergeCommand;

    .line 181
    invoke-virtual {v5}, Lorg/eclipse/jgit/api/MergeCommand;->call()Lorg/eclipse/jgit/api/MergeResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    .end local v5           #merge:Lorg/eclipse/jgit/api/MergeCommand;
    :goto_1
    :try_start_2
    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 203
    invoke-virtual {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getPath()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 206
    .end local v2           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v4           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .end local v8           #submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    .end local v9           #update:Ljava/lang/String;
    .end local v10           #updated:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v11           #url:Ljava/lang/String;
    .end local v12           #walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catch_0
    move-exception v3

    .line 207
    .local v3, e:Ljava/io/IOException;
    new-instance v13, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 182
    .end local v3           #e:Ljava/io/IOException;
    .restart local v2       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v4       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .restart local v8       #submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    .restart local v9       #update:Ljava/lang/String;
    .restart local v10       #updated:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .restart local v11       #url:Ljava/lang/String;
    .restart local v12       #walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_4
    :try_start_3
    const-string v13, "rebase"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 183
    new-instance v6, Lorg/eclipse/jgit/api/RebaseCommand;

    invoke-direct {v6, v8}, Lorg/eclipse/jgit/api/RebaseCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 184
    .local v6, rebase:Lorg/eclipse/jgit/api/RebaseCommand;
    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/api/RebaseCommand;->setUpstream(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/RebaseCommand;

    .line 185
    iget-object v13, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual {v6, v13}, Lorg/eclipse/jgit/api/RebaseCommand;->setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/RebaseCommand;

    .line 186
    invoke-virtual {v6}, Lorg/eclipse/jgit/api/RebaseCommand;->call()Lorg/eclipse/jgit/api/RebaseResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 201
    .end local v2           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v6           #rebase:Lorg/eclipse/jgit/api/RebaseCommand;
    .end local v9           #update:Ljava/lang/String;
    .end local v12           #walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catchall_0
    move-exception v13

    :try_start_4
    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v13
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_4 .. :try_end_4} :catch_1

    .line 208
    .end local v4           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .end local v8           #submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    .end local v10           #updated:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v11           #url:Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 209
    .local v3, e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v13, Lorg/eclipse/jgit/api/errors/InvalidConfigurationException;

    invoke-virtual {v3}, Lorg/eclipse/jgit/errors/ConfigInvalidException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14, v3}, Lorg/eclipse/jgit/api/errors/InvalidConfigurationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 190
    .end local v3           #e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    .restart local v2       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v4       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .restart local v8       #submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    .restart local v9       #update:Ljava/lang/String;
    .restart local v10       #updated:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .restart local v11       #url:Ljava/lang/String;
    .restart local v12       #walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_5
    :try_start_5
    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v13

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v14

    invoke-direct {v1, v8, v13, v14}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 193
    .local v1, co:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 194
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 195
    const-string v13, "HEAD"

    const/4 v14, 0x1

    invoke-virtual {v8, v13, v14}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v7

    .line 197
    .local v7, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v7, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 198
    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 205
    .end local v1           #co:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v2           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v7           #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v8           #submoduleRepo:Lorg/eclipse/jgit/lib/Repository;
    .end local v9           #update:Ljava/lang/String;
    .end local v11           #url:Ljava/lang/String;
    .end local v12           #walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_6
    return-object v10
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 108
    iput-object p1, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 109
    return-object p0
.end method

.method public setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;
    .locals 0
    .parameter "strategy"

    .prologue
    .line 220
    iput-object p1, p0, Lorg/eclipse/jgit/api/SubmoduleUpdateCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 221
    return-object p0
.end method
