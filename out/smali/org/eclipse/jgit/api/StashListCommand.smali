.class public Lorg/eclipse/jgit/api/StashListCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "StashListCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Collection",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 77
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
    .line 68
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/StashListCommand;->call()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Collection;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/InvalidRefNameException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v9, 0x1

    .line 81
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/StashListCommand;->checkCallable()V

    .line 84
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/api/StashListCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v8, "refs/stash"

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v7

    if-nez v7, :cond_0

    .line 85
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 113
    :goto_0
    return-object v4

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, e:Ljava/io/IOException;
    new-instance v7, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->cannotRead:Ljava/lang/String;

    new-array v9, v9, [Ljava/lang/Object;

    const-string v10, "refs/stash"

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v0}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 91
    .end local v0           #e:Ljava/io/IOException;
    :cond_0
    new-instance v3, Lorg/eclipse/jgit/api/ReflogCommand;

    iget-object v7, p0, Lorg/eclipse/jgit/api/StashListCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v3, v7}, Lorg/eclipse/jgit/api/ReflogCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 92
    .local v3, refLog:Lorg/eclipse/jgit/api/ReflogCommand;
    const-string v7, "refs/stash"

    invoke-virtual {v3, v7}, Lorg/eclipse/jgit/api/ReflogCommand;->setRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/ReflogCommand;

    .line 93
    invoke-virtual {v3}, Lorg/eclipse/jgit/api/ReflogCommand;->call()Ljava/util/Collection;

    move-result-object v5

    .line 94
    .local v5, stashEntries:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 95
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    goto :goto_0

    .line 97
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v7

    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    .local v4, stashCommits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    new-instance v6, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v7, p0, Lorg/eclipse/jgit/api/StashListCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 100
    .local v6, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-virtual {v6, v9}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 102
    :try_start_1
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ReflogEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    .local v1, entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    :try_start_2
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/ReflogEntry;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 105
    :catch_1
    move-exception v0

    .line 106
    .restart local v0       #e:Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->cannotReadCommit:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/ReflogEntry;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    .end local v2           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v7

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    throw v7

    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_2
    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    goto/16 :goto_0
.end method
