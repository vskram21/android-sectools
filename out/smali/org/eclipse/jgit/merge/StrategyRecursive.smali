.class public Lorg/eclipse/jgit/merge/StrategyRecursive;
.super Lorg/eclipse/jgit/merge/StrategyResolve;
.source "StrategyRecursive.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/eclipse/jgit/merge/StrategyResolve;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string v0, "recursive"

    return-object v0
.end method

.method public bridge synthetic newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/merge/StrategyRecursive;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/ThreeWayMerger;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 53
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/merge/StrategyRecursive;->newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/ThreeWayMerger;

    move-result-object v0

    return-object v0
.end method

.method public newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/ThreeWayMerger;
    .locals 2
    .parameter "db"

    .prologue
    .line 57
    new-instance v0, Lorg/eclipse/jgit/merge/RecursiveMerger;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/merge/RecursiveMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;Z)V

    return-object v0
.end method

.method public newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/ThreeWayMerger;
    .locals 1
    .parameter "db"
    .parameter "inCore"

    .prologue
    .line 62
    new-instance v0, Lorg/eclipse/jgit/merge/RecursiveMerger;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/merge/RecursiveMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;Z)V

    return-object v0
.end method
