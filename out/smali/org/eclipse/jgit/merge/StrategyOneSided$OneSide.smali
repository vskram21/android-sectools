.class Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;
.super Lorg/eclipse/jgit/merge/Merger;
.source "StrategyOneSided.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/merge/StrategyOneSided;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OneSide"
.end annotation


# instance fields
.field private final treeIndex:I


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;I)V
    .locals 0
    .parameter "local"
    .parameter "index"

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/merge/Merger;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 97
    iput p2, p0, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;->treeIndex:I

    .line 98
    return-void
.end method


# virtual methods
.method public getBaseCommitId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 112
    const/4 v0, 0x0

    return-object v0
.end method

.method public getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    iget v1, p0, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;->treeIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method protected mergeImpl()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    iget v0, p0, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;->treeIndex:I

    iget-object v1, p0, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
