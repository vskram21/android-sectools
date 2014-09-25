.class public final Lorg/eclipse/jgit/revwalk/RevWalkUtils;
.super Ljava/lang/Object;
.source "RevWalkUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method public static count(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)I
    .locals 1
    .parameter "walk"
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-static {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevWalkUtils;->find(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public static find(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Ljava/util/List;
    .locals 4
    .parameter "walk"
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/RevWalk;",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 120
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 121
    if-eqz p2, :cond_0

    .line 122
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 124
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v1, commits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 126
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 127
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    return-object v1
.end method

.method public static findBranchesReachableFrom(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Collection;)Ljava/util/List;
    .locals 8
    .parameter "commit"
    .parameter "revWalk"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            "Lorg/eclipse/jgit/revwalk/RevWalk;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    .local p2, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object p0

    .line 157
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 158
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 160
    .local v5, result:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    const v0, 0x15180

    .line 162
    .local v0, SKEW:I
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 163
    .local v4, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v3

    .line 164
    .local v3, maybehead:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v6, v3, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v6, :cond_0

    move-object v1, v3

    .line 166
    check-cast v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 171
    .local v1, headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v6

    const v7, 0x15180

    add-int/2addr v6, v7

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v7

    if-lt v6, v7, :cond_0

    .line 174
    invoke-virtual {p1, p0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 175
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 177
    .end local v1           #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #maybehead:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v4           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return-object v5
.end method
