.class public Lorg/eclipse/jgit/api/SubmoduleInitCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "SubmoduleInitCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Collection",
        "<",
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
    .line 78
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->paths:Ljava/util/Collection;

    .line 80
    return-void
.end method


# virtual methods
.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleInitCommand;
    .locals 1
    .parameter "path"

    .prologue
    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->paths:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 91
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
    .line 70
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->call()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Collection;
    .locals 9
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
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->checkCallable()V

    .line 98
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v7}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->forIndex(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    move-result-object v2

    .line 99
    .local v2, generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    iget-object v7, p0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->paths:Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 100
    iget-object v7, p0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->paths:Ljava/util/Collection;

    invoke-static {v7}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v7

    invoke-virtual {v2, v7}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 101
    :cond_0
    iget-object v7, p0, Lorg/eclipse/jgit/api/SubmoduleInitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    .line 102
    .local v0, config:Lorg/eclipse/jgit/lib/StoredConfig;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v3, initialized:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    :goto_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 105
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getConfigUrl()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_1

    .line 108
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 111
    .local v4, path:Ljava/lang/String;
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRemoteUrl()Ljava/lang/String;

    move-result-object v6

    .line 112
    .local v6, url:Ljava/lang/String;
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getModulesUpdate()Ljava/lang/String;

    move-result-object v5

    .line 113
    .local v5, update:Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 114
    const-string v7, "submodule"

    const-string v8, "url"

    invoke-virtual {v0, v7, v4, v8, v6}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    :cond_2
    if-eqz v5, :cond_3

    .line 117
    const-string v7, "submodule"

    const-string v8, "update"

    invoke-virtual {v0, v7, v4, v8, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    :cond_3
    if-nez v6, :cond_4

    if-eqz v5, :cond_1

    .line 120
    :cond_4
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 126
    .end local v0           #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v2           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .end local v3           #initialized:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v4           #path:Ljava/lang/String;
    .end local v5           #update:Ljava/lang/String;
    .end local v6           #url:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 127
    .local v1, e:Ljava/io/IOException;
    new-instance v7, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 123
    .end local v1           #e:Ljava/io/IOException;
    .restart local v0       #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .restart local v2       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .restart local v3       #initialized:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_5
    :try_start_1
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_6

    .line 124
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_1 .. :try_end_1} :catch_1

    .line 125
    :cond_6
    return-object v3

    .line 128
    .end local v0           #config:Lorg/eclipse/jgit/lib/StoredConfig;
    .end local v2           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .end local v3           #initialized:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :catch_1
    move-exception v1

    .line 129
    .local v1, e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v7, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v1}, Lorg/eclipse/jgit/errors/ConfigInvalidException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method
