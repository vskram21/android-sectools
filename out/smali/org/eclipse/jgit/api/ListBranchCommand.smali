.class public Lorg/eclipse/jgit/api/ListBranchCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ListBranchCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;
    }
.end annotation

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


# instance fields
.field private containsCommitish:Ljava/lang/String;

.field private listMode:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 102
    return-void
.end method

.method private filterRefs(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    .local p1, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->containsCommitish:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 153
    .end local p1           #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :goto_0
    return-object p1

    .line 142
    .restart local p1       #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 144
    .local v2, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v4, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->containsCommitish:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 145
    .local v1, resolved:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v1, :cond_1

    .line 146
    new-instance v3, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->containsCommitish:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    .end local v1           #resolved:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v3

    .line 149
    .restart local v1       #resolved:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    :try_start_1
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 150
    .local v0, containsCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-static {v0, v2, p1}, Lorg/eclipse/jgit/revwalk/RevWalkUtils;->findBranchesReachableFrom(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Collection;)Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object p1

    .line 153
    .end local p1           #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0
.end method

.method private getRefs(Ljava/lang/String;)Ljava/util/Collection;
    .locals 1
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    iget-object v0, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
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
    .line 77
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListBranchCommand;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 6
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
    .line 105
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListBranchCommand;->checkCallable()V

    .line 108
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v2, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v5, "HEAD"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 112
    .local v1, head:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "HEAD"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 113
    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 115
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->listMode:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    if-nez v4, :cond_1

    .line 116
    const-string v4, "refs/heads/"

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/api/ListBranchCommand;->getRefs(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 123
    :goto_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/api/ListBranchCommand;->filterRefs(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .local v3, resultRefs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v4, Lorg/eclipse/jgit/api/ListBranchCommand$1;

    invoke-direct {v4, p0}, Lorg/eclipse/jgit/api/ListBranchCommand$1;-><init>(Lorg/eclipse/jgit/api/ListBranchCommand;)V

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 133
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/api/ListBranchCommand;->setCallable(Z)V

    .line 134
    return-object v3

    .line 117
    .end local v3           #resultRefs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_1
    :try_start_1
    iget-object v4, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->listMode:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    sget-object v5, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->REMOTE:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    if-ne v4, v5, :cond_2

    .line 118
    const-string v4, "refs/remotes/"

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/api/ListBranchCommand;->getRefs(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 124
    .end local v1           #head:Lorg/eclipse/jgit/lib/Ref;
    .end local v2           #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :catch_0
    move-exception v0

    .line 125
    .local v0, e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 120
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #head:Lorg/eclipse/jgit/lib/Ref;
    .restart local v2       #refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_2
    :try_start_2
    const-string v4, "refs/heads/"

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/api/ListBranchCommand;->getRefs(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 121
    const-string v4, "refs/remotes/"

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/api/ListBranchCommand;->getRefs(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0
.end method

.method public setContains(Ljava/lang/String;)Lorg/eclipse/jgit/api/ListBranchCommand;
    .locals 0
    .parameter "containsCommitish"

    .prologue
    .line 179
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListBranchCommand;->checkCallable()V

    .line 180
    iput-object p1, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->containsCommitish:Ljava/lang/String;

    .line 181
    return-object p0
.end method

.method public setListMode(Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;)Lorg/eclipse/jgit/api/ListBranchCommand;
    .locals 0
    .parameter "listMode"

    .prologue
    .line 164
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListBranchCommand;->checkCallable()V

    .line 165
    iput-object p1, p0, Lorg/eclipse/jgit/api/ListBranchCommand;->listMode:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    .line 166
    return-object p0
.end method
