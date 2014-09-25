.class public Lorg/eclipse/jgit/merge/StrategyOneSided;
.super Lorg/eclipse/jgit/merge/MergeStrategy;
.source "StrategyOneSided.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;
    }
.end annotation


# instance fields
.field private final strategyName:Ljava/lang/String;

.field private final treeIndex:I


# direct methods
.method protected constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter "name"
    .parameter "index"

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/eclipse/jgit/merge/MergeStrategy;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/eclipse/jgit/merge/StrategyOneSided;->strategyName:Ljava/lang/String;

    .line 74
    iput p2, p0, Lorg/eclipse/jgit/merge/StrategyOneSided;->treeIndex:I

    .line 75
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/eclipse/jgit/merge/StrategyOneSided;->strategyName:Ljava/lang/String;

    return-object v0
.end method

.method public newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;
    .locals 2
    .parameter "db"

    .prologue
    .line 84
    new-instance v0, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;

    iget v1, p0, Lorg/eclipse/jgit/merge/StrategyOneSided;->treeIndex:I

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;-><init>(Lorg/eclipse/jgit/lib/Repository;I)V

    return-object v0
.end method

.method public newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;
    .locals 2
    .parameter "db"
    .parameter "inCore"

    .prologue
    .line 89
    new-instance v0, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;

    iget v1, p0, Lorg/eclipse/jgit/merge/StrategyOneSided;->treeIndex:I

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/merge/StrategyOneSided$OneSide;-><init>(Lorg/eclipse/jgit/lib/Repository;I)V

    return-object v0
.end method
