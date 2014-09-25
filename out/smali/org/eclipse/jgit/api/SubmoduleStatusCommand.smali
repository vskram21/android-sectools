.class public Lorg/eclipse/jgit/api/SubmoduleStatusCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "SubmoduleStatusCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Lorg/eclipse/jgit/submodule/SubmoduleStatus;",
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

    iput-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->paths:Ljava/util/Collection;

    .line 80
    return-void
.end method

.method private getStatus(Lorg/eclipse/jgit/submodule/SubmoduleWalk;)Lorg/eclipse/jgit/submodule/SubmoduleStatus;
    .locals 6
    .parameter "generator"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-virtual {p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 117
    .local v1, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 120
    .local v2, path:Ljava/lang/String;
    invoke-virtual {p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getModulesPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 121
    new-instance v4, Lorg/eclipse/jgit/submodule/SubmoduleStatus;

    sget-object v5, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->MISSING:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-direct {v4, v5, v2, v1}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;-><init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 152
    :goto_0
    return-object v4

    .line 124
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getConfigUrl()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 125
    new-instance v4, Lorg/eclipse/jgit/submodule/SubmoduleStatus;

    sget-object v5, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->UNINITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-direct {v4, v5, v2, v1}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;-><init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 129
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    .line 130
    .local v3, subRepo:Lorg/eclipse/jgit/lib/Repository;
    if-nez v3, :cond_2

    .line 131
    new-instance v4, Lorg/eclipse/jgit/submodule/SubmoduleStatus;

    sget-object v5, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->UNINITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-direct {v4, v5, v2, v1}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;-><init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 136
    :cond_2
    :try_start_0
    const-string v4, "HEAD"

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 138
    .local v0, headId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 142
    if-nez v0, :cond_3

    .line 143
    new-instance v4, Lorg/eclipse/jgit/submodule/SubmoduleStatus;

    sget-object v5, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->UNINITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-direct {v4, v5, v2, v1, v0}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;-><init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 138
    .end local v0           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v4

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v4

    .line 147
    .restart local v0       #headId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 148
    new-instance v4, Lorg/eclipse/jgit/submodule/SubmoduleStatus;

    sget-object v5, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->REV_CHECKED_OUT:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-direct {v4, v5, v2, v1, v0}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;-><init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 152
    :cond_4
    new-instance v4, Lorg/eclipse/jgit/submodule/SubmoduleStatus;

    sget-object v5, Lorg/eclipse/jgit/submodule/SubmoduleStatusType;->INITIALIZED:Lorg/eclipse/jgit/submodule/SubmoduleStatusType;

    invoke-direct {v4, v5, v2, v1, v0}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;-><init>(Lorg/eclipse/jgit/submodule/SubmoduleStatusType;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0
.end method


# virtual methods
.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleStatusCommand;
    .locals 1
    .parameter "path"

    .prologue
    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->paths:Ljava/util/Collection;

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
    .line 69
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->call()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/submodule/SubmoduleStatus;",
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
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->checkCallable()V

    .line 98
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->forIndex(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    move-result-object v1

    .line 99
    .local v1, generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    iget-object v4, p0, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->paths:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 100
    iget-object v4, p0, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->paths:Ljava/util/Collection;

    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 101
    :cond_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 102
    .local v3, statuses:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/submodule/SubmoduleStatus;>;"
    :goto_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 103
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/api/SubmoduleStatusCommand;->getStatus(Lorg/eclipse/jgit/submodule/SubmoduleWalk;)Lorg/eclipse/jgit/submodule/SubmoduleStatus;

    move-result-object v2

    .line 104
    .local v2, status:Lorg/eclipse/jgit/submodule/SubmoduleStatus;
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleStatus;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 107
    .end local v1           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .end local v2           #status:Lorg/eclipse/jgit/submodule/SubmoduleStatus;
    .end local v3           #statuses:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/submodule/SubmoduleStatus;>;"
    :catch_0
    move-exception v0

    .line 108
    .local v0, e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 109
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 110
    .local v0, e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Lorg/eclipse/jgit/errors/ConfigInvalidException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 106
    .end local v0           #e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    .restart local v1       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .restart local v3       #statuses:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/submodule/SubmoduleStatus;>;"
    :cond_1
    return-object v3
.end method
