.class public Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;
.super Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
.source "EmptyTreeIterator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>()V

    .line 60
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V
    .locals 1
    .parameter "p"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    .line 64
    iget v0, p0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;->pathOffset:I

    iput v0, p0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;->pathLen:I

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;[BI)V
    .locals 1
    .parameter "p"
    .parameter "childPath"
    .parameter "childPathOffset"

    .prologue
    .line 85
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;[BI)V

    .line 86
    add-int/lit8 v0, p3, -0x1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;->pathLen:I

    .line 87
    return-void
.end method


# virtual methods
.method public back(I)V
    .locals 0
    .parameter "delta"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 138
    return-void
.end method

.method public createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 1
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    return-object v0
.end method

.method public eof()Z
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x1

    return v0
.end method

.method public first()Z
    .locals 1

    .prologue
    .line 122
    const/4 v0, 0x1

    return v0
.end method

.method public getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 102
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public hasId()Z
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method

.method public idBuffer()[B
    .locals 1

    .prologue
    .line 107
    sget-object v0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;->zeroid:[B

    return-object v0
.end method

.method public idOffset()I
    .locals 1

    .prologue
    .line 112
    const/4 v0, 0x0

    return v0
.end method

.method public next(I)V
    .locals 0
    .parameter "delta"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 133
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 118
    return-void
.end method

.method public stopWalk()V
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->stopWalk()V

    .line 144
    :cond_0
    return-void
.end method
