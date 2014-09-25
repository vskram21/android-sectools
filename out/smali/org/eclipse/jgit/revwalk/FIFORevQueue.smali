.class public Lorg/eclipse/jgit/revwalk/FIFORevQueue;
.super Lorg/eclipse/jgit/revwalk/BlockRevQueue;
.source "FIFORevQueue.java"


# instance fields
.field private head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

.field private tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;-><init>()V

    .line 60
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
    .line 64
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 65
    return-void
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 2
    .parameter "c"

    .prologue
    .line 68
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 69
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    if-nez v0, :cond_0

    .line 70
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->newBlock()Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    move-result-object v0

    .line 71
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 72
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 73
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 81
    :goto_0
    return-void

    .line 75
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->isFull()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 76
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->newBlock()Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    move-result-object v0

    .line 77
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    iput-object v0, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 78
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 80
    :cond_1
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0
.end method

.method anybodyHasFlag(I)Z
    .locals 3
    .parameter "f"

    .prologue
    .line 141
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :goto_0
    if-eqz v0, :cond_2

    .line 142
    iget v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .local v1, i:I
    :goto_1
    iget v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ge v1, v2, :cond_1

    .line 143
    iget-object v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v2, v2, v1

    iget v2, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v2, p1

    if-eqz v2, :cond_0

    .line 144
    const/4 v2, 0x1

    .line 146
    .end local v1           #i:I
    :goto_2
    return v2

    .line 142
    .restart local v1       #i:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 141
    :cond_1
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0

    .line 146
    .end local v1           #i:I
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 126
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 127
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->clear()V

    .line 129
    return-void
.end method

.method everbodyHasFlag(I)Z
    .locals 3
    .parameter "f"

    .prologue
    .line 132
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :goto_0
    if-eqz v0, :cond_2

    .line 133
    iget v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .local v1, i:I
    :goto_1
    iget v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ge v1, v2, :cond_1

    .line 134
    iget-object v2, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v2, v2, v1

    iget v2, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v2, p1

    if-nez v2, :cond_0

    .line 135
    const/4 v2, 0x0

    .line 137
    .end local v1           #i:I
    :goto_2
    return v2

    .line 133
    .restart local v1       #i:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 132
    :cond_1
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0

    .line 137
    .end local v1           #i:I
    :cond_2
    const/4 v2, 0x1

    goto :goto_2
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 111
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 112
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    if-nez v0, :cond_1

    move-object v1, v2

    .line 122
    :cond_0
    :goto_0
    return-object v1

    .line 115
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->pop()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 116
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 117
    iget-object v3, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 118
    iget-object v3, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    if-nez v3, :cond_2

    .line 119
    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 120
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->freeBlock(Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;)V

    goto :goto_0
.end method

.method removeFlag(I)V
    .locals 5
    .parameter "f"

    .prologue
    .line 150
    xor-int/lit8 v2, p1, -0x1

    .line 151
    .local v2, not_f:I
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :goto_0
    if-eqz v0, :cond_1

    .line 152
    iget v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .local v1, i:I
    :goto_1
    iget v3, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ge v1, v3, :cond_0

    .line 153
    iget-object v3, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v3, v3, v1

    iget v4, v3, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v4, v2

    iput v4, v3, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 152
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 151
    :cond_0
    iget-object v0, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0

    .line 155
    .end local v1           #i:I
    :cond_1
    return-void
.end method

.method public bridge synthetic shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 158
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .local v2, s:Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .local v1, q:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :goto_0
    if-eqz v1, :cond_1

    .line 160
    iget v0, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->headIndex:I

    .local v0, i:I
    :goto_1
    iget v3, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->tailIndex:I

    if-ge v0, v3, :cond_0

    .line 161
    iget-object v3, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->commits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v3, v3, v0

    invoke-static {v2, v3}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->describe(Ljava/lang/StringBuilder;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 160
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 159
    :cond_0
    iget-object v1, v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0

    .line 163
    .end local v0           #i:I
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public unpop(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 2
    .parameter "c"

    .prologue
    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 91
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    if-nez v0, :cond_0

    .line 92
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->newBlock()Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    move-result-object v0

    .line 93
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->resetToMiddle()V

    .line 94
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 95
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 96
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 108
    :goto_0
    return-void

    .line 98
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->canUnpop()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->unpop(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0

    .line 103
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->newBlock()Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->resetToEnd()V

    .line 105
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->unpop(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 106
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    iput-object v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 107
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->head:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    goto :goto_0
.end method
