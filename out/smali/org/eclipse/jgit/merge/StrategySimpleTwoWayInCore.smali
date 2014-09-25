.class public Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore;
.super Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;
.source "StrategySimpleTwoWayInCore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;-><init>()V

    .line 74
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    const-string v0, "simple-two-way-in-core"

    return-object v0
.end method

.method public bridge synthetic newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/ThreeWayMerger;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore;->newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/ThreeWayMerger;

    move-result-object v0

    return-object v0
.end method

.method public newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/ThreeWayMerger;
    .locals 1
    .parameter "db"

    .prologue
    .line 83
    new-instance v0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/ThreeWayMerger;
    .locals 1
    .parameter "db"
    .parameter "inCore"

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/ThreeWayMerger;

    move-result-object v0

    return-object v0
.end method
