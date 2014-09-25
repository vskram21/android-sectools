.class public Lorg/eclipse/jgit/api/SubmoduleSyncCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "SubmoduleSyncCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
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


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->paths:Ljava/util/Collection;

    .line 82
    return-void
.end method


# virtual methods
.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleSyncCommand;
    .locals 1
    .parameter "path"

    .prologue
    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->paths:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 93
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
    .line 72
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->call()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->checkCallable()V

    .line 115
    :try_start_0
    iget-object v10, p0, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v10}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->forIndex(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    move-result-object v3

    .line 116
    .local v3, generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    iget-object v10, p0, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->paths:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_0

    .line 117
    iget-object v10, p0, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->paths:Ljava/util/Collection;

    invoke-static {v10}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v10

    invoke-virtual {v3, v10}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 118
    :cond_0
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 119
    .local v9, synced:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v10, p0, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v1

    .line 120
    .local v1, config:Lorg/eclipse/jgit/lib/StoredConfig;
    :cond_1
    :goto_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 121
    invoke-virtual {v3}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRemoteUrl()Ljava/lang/String;

    move-result-object v6

    .line 122
    .local v6, remoteUrl:Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 125
    invoke-virtual {v3}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, path:Ljava/lang/String;
    const-string v10, "submodule"

    const-string v11, "url"

    invoke-virtual {v1, v10, v4, v11, v6}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    invoke-interface {v9, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    invoke-virtual {v3}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRepository()Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v8

    .line 131
    .local v8, subRepo:Lorg/eclipse/jgit/lib/Repository;
    if-eqz v8, :cond_1

    .line 137
    :try_start_1
    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v7

    .line 140
    .local v7, subConfig:Lorg/eclipse/jgit/lib/StoredConfig;
    invoke-virtual {p0, v8}, Lorg/eclipse/jgit/api/SubmoduleSyncCommand;->getHeadBranch(Lorg/eclipse/jgit/lib/Repository;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, branch:Ljava/lang/String;
    const/4 v5, 0x0

    .line 142
    .local v5, remote:Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 143
    const-string v10, "branch"

    const-string v11, "remote"

    invoke-virtual {v7, v10, v0, v11}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 146
    :cond_2
    if-nez v5, :cond_3

    .line 147
    const-string v5, "origin"

    .line 149
    :cond_3
    const-string v10, "remote"

    const-string v11, "url"

    invoke-virtual {v7, v10, v5, v11, v6}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    :try_start_2
    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 159
    .end local v0           #branch:Ljava/lang/String;
    .end local v1           #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v3           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .end local v4           #path:Ljava/lang/String;
    .end local v5           #remote:Ljava/lang/String;
    .end local v6           #remoteUrl:Ljava/lang/String;
    .end local v7           #subConfig:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v8           #subRepo:Lorg/eclipse/jgit/lib/Repository;
    .end local v9           #synced:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    .line 160
    .local v2, e:Ljava/io/IOException;
    new-instance v10, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 153
    .end local v2           #e:Ljava/io/IOException;
    .restart local v1       #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .restart local v3       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .restart local v4       #path:Ljava/lang/String;
    .restart local v6       #remoteUrl:Ljava/lang/String;
    .restart local v8       #subRepo:Lorg/eclipse/jgit/lib/Repository;
    .restart local v9       #synced:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_0
    move-exception v10

    :try_start_3
    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v10
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_3 .. :try_end_3} :catch_1

    .line 161
    .end local v1           #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v3           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .end local v4           #path:Ljava/lang/String;
    .end local v6           #remoteUrl:Ljava/lang/String;
    .end local v8           #subRepo:Lorg/eclipse/jgit/lib/Repository;
    .end local v9           #synced:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_1
    move-exception v2

    .line 162
    .local v2, e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v10, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v2}, Lorg/eclipse/jgit/errors/ConfigInvalidException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 156
    .end local v2           #e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    .restart local v1       #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .restart local v3       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .restart local v9       #synced:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    :try_start_4
    invoke-interface {v9}, Ljava/util/Map;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_5

    .line 157
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_4 .. :try_end_4} :catch_1

    .line 158
    :cond_5
    return-object v9
.end method

.method protected getHeadBranch(Lorg/eclipse/jgit/lib/Repository;)Ljava/lang/String;
    .locals 2
    .parameter "subRepo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    const-string v1, "HEAD"

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 105
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 108
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
