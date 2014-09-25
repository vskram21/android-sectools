.class public abstract Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;
.super Lorg/eclipse/jgit/merge/MergeStrategy;
.source "ThreeWayMergeStrategy.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/eclipse/jgit/merge/MergeStrategy;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/ThreeWayMerger;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/ThreeWayMerger;

    move-result-object v0

    return-object v0
.end method

.method public abstract newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/ThreeWayMerger;
.end method

.method public abstract newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/ThreeWayMerger;
.end method
