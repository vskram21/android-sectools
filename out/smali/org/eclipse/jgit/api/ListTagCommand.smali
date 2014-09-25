.class public Lorg/eclipse/jgit/api/ListTagCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ListTagCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/List",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 72
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
    .line 65
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListTagCommand;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListTagCommand;->checkCallable()V

    .line 80
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v5, tags:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v4, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/api/ListTagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v4, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 83
    .local v4, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/ListTagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v6

    const-string v7, "refs/tags/"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 84
    .local v3, refList:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 85
    .local v2, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 87
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v3           #refList:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :catch_0
    move-exception v0

    .line 88
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    new-instance v6, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v6

    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v3       #refList:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_0
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 92
    new-instance v6, Lorg/eclipse/jgit/api/ListTagCommand$1;

    invoke-direct {v6, p0}, Lorg/eclipse/jgit/api/ListTagCommand$1;-><init>(Lorg/eclipse/jgit/api/ListTagCommand;)V

    invoke-static {v5, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 97
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lorg/eclipse/jgit/api/ListTagCommand;->setCallable(Z)V

    .line 98
    return-object v5
.end method
