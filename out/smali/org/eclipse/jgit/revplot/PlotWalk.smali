.class public Lorg/eclipse/jgit/revplot/PlotWalk;
.super Lorg/eclipse/jgit/revwalk/RevWalk;
.source "PlotWalk.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;
    }
.end annotation


# instance fields
.field private reverseRefMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 92
    sget-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->TOPO:Lorg/eclipse/jgit/revwalk/RevSort;

    const/4 v1, 0x1

    invoke-super {p0, v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V

    .line 93
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getAllRefsByPeeledObjectId()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotWalk;->reverseRefMap:Ljava/util/Map;

    .line 94
    return-void
.end method

.method private getRefs(Lorg/eclipse/jgit/lib/AnyObjectId;)[Lorg/eclipse/jgit/lib/Ref;
    .locals 3
    .parameter "commitId"

    .prologue
    .line 139
    iget-object v2, p0, Lorg/eclipse/jgit/revplot/PlotWalk;->reverseRefMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 140
    .local v0, list:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    if-nez v0, :cond_0

    .line 141
    sget-object v1, Lorg/eclipse/jgit/revplot/PlotCommit;->NO_REFS:[Lorg/eclipse/jgit/lib/Ref;

    .line 145
    :goto_0
    return-object v1

    .line 143
    :cond_0
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    new-array v2, v2, [Lorg/eclipse/jgit/lib/Ref;

    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/eclipse/jgit/lib/Ref;

    .line 144
    .local v1, tags:[Lorg/eclipse/jgit/lib/Ref;
    new-instance v2, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/revplot/PlotWalk$PlotRefComparator;-><init>(Lorg/eclipse/jgit/revplot/PlotWalk;)V

    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    goto :goto_0
.end method


# virtual methods
.method public addAdditionalRefs(Ljava/lang/Iterable;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    .local p1, refs:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 106
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    iget-object v4, p0, Lorg/eclipse/jgit/revplot/PlotWalk;->reverseRefMap:Ljava/util/Map;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 107
    .local v2, set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    if-nez v2, :cond_0

    .line 108
    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    .line 113
    :goto_1
    iget-object v4, p0, Lorg/eclipse/jgit/revplot/PlotWalk;->reverseRefMap:Ljava/util/Map;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 110
    :cond_0
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 111
    .end local v2           #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    .local v3, set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-object v2, v3

    .end local v3           #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v2       #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    goto :goto_1

    .line 115
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v2           #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_1
    return-void
.end method

.method protected createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "id"

    .prologue
    .line 126
    new-instance v0, Lorg/eclipse/jgit/revplot/PlotCommit;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revplot/PlotCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 80
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotWalk;->reverseRefMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 82
    return-void
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 133
    .local v0, pc:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<*>;"
    if-eqz v0, :cond_0

    .line 134
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revplot/PlotWalk;->getRefs(Lorg/eclipse/jgit/lib/AnyObjectId;)[Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->refs:[Lorg/eclipse/jgit/lib/Ref;

    .line 135
    :cond_0
    return-object v0
.end method

.method public sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V
    .locals 2
    .parameter "s"
    .parameter "use"

    .prologue
    .line 119
    sget-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->TOPO:Lorg/eclipse/jgit/revwalk/RevSort;

    if-ne p1, v0, :cond_0

    if-nez p2, :cond_0

    .line 120
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->topologicalSortRequired:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V

    .line 122
    return-void
.end method
