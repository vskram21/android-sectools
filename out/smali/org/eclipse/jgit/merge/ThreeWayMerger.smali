.class public abstract Lorg/eclipse/jgit/merge/ThreeWayMerger;
.super Lorg/eclipse/jgit/merge/Merger;
.source "ThreeWayMerger.java"


# instance fields
.field private baseCommitId:Lorg/eclipse/jgit/lib/ObjectId;

.field private baseTree:Lorg/eclipse/jgit/revwalk/RevTree;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "local"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/merge/Merger;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 73
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;Z)V
    .locals 0
    .parameter "local"
    .parameter "inCore"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/merge/ThreeWayMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 85
    return-void
.end method


# virtual methods
.method public getBaseCommitId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseCommitId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public varargs merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 2
    .parameter "tips"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    array-length v0, p1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 113
    const/4 v0, 0x0

    .line 114
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lorg/eclipse/jgit/merge/Merger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    goto :goto_0
.end method

.method protected mergeBase()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseTree:Lorg/eclipse/jgit/revwalk/RevTree;

    if-eqz v1, :cond_0

    .line 131
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseTree:Lorg/eclipse/jgit/revwalk/RevTree;

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/merge/ThreeWayMerger;->openTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    .line 140
    :goto_0
    return-object v1

    .line 132
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseCommitId:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseCommitId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 135
    .local v0, baseCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_1
    if-nez v0, :cond_2

    .line 136
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseCommitId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 137
    new-instance v1, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    invoke-direct {v1}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>()V

    goto :goto_0

    .line 132
    .end local v0           #baseCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-object v2, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jgit/merge/ThreeWayMerger;->getBaseCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    goto :goto_1

    .line 139
    .restart local v0       #baseCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseCommitId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 140
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/merge/ThreeWayMerger;->openTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    goto :goto_0
.end method

.method public setBase(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    if-eqz p1, :cond_0

    .line 104
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseTree:Lorg/eclipse/jgit/revwalk/RevTree;

    .line 108
    :goto_0
    return-void

    .line 106
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/merge/ThreeWayMerger;->baseTree:Lorg/eclipse/jgit/revwalk/RevTree;

    goto :goto_0
.end method
