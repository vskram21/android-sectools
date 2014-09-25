.class public Lorg/eclipse/jgit/revwalk/LIFORevQueue;
.super Lorg/eclipse/jgit/revwalk/BlockRevQueue;
.source "LIFORevQueue.java"


# instance fields
.field private head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;-><init>()V

    .line 59
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 0
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 64
    return-void
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 2
    .parameter "c"

    .prologue
    .line 67
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 68
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->canUnpop()Z

    move-result v1

    if-nez v1, :cond_1

    .line 69
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->newBlock()Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->resetToEnd()V

    .line 71
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    iput-object v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 72
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 74
    :cond_1
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->unpop(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 75
    return-void
.end method

.method anybodyHasFlag(I)Z
    .locals 3
    .parameter "f"

    .prologue
    .line 105
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :goto_0
    if-eqz v0, :cond_2

    .line 106
    iget v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .local v1, i:I
    :goto_1
    iget v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ge v1, v2, :cond_1

    .line 107
    iget-object v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v2, v2, v1

    iget v2, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v2, p1

    if-eqz v2, :cond_0

    .line 108
    const/4 v2, 0x1

    .line 110
    .end local v1           #i:I
    :goto_2
    return v2

    .line 106
    .restart local v1       #i:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 105
    :cond_1
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0

    .line 110
    .end local v1           #i:I
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->clear()V

    .line 93
    return-void
.end method

.method everbodyHasFlag(I)Z
    .locals 3
    .parameter "f"

    .prologue
    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :goto_0
    if-eqz v0, :cond_2

    .line 97
    iget v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .local v1, i:I
    :goto_1
    iget v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ge v1, v2, :cond_1

    .line 98
    iget-object v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v2, v2, v1

    iget v2, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v2, p1

    if-nez v2, :cond_0

    .line 99
    const/4 v2, 0x0

    .line 101
    .end local v1           #i:I
    :goto_2
    return v2

    .line 97
    .restart local v1       #i:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 96
    :cond_1
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0

    .line 101
    .end local v1           #i:I
    :cond_2
    const/4 v2, 0x1

    goto :goto_2
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3

    .prologue
    .line 78
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 79
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    if-nez v0, :cond_1

    .line 80
    const/4 v1, 0x0

    .line 87
    :cond_0
    :goto_0
    return-object v1

    .line 82
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->pop()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 83
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 84
    iget-object v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 85
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->freeBlock(Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;)V

    goto :goto_0
.end method

.method public bridge synthetic shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 114
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .local v2, s:Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .local v1, q:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :goto_0
    if-eqz v1, :cond_1

    .line 116
    iget v0, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .local v0, i:I
    :goto_1
    iget v3, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ge v0, v3, :cond_0

    .line 117
    iget-object v3, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v3, v3, v0

    invoke-static {v2, v3}, Lorg/eclipse/jgit/revwalk/LIFORevQueue;->describe(Ljava/lang/StringBuilder;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 116
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 115
    :cond_0
    iget-object v1, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0

    .line 119
    .end local v0           #i:I
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
