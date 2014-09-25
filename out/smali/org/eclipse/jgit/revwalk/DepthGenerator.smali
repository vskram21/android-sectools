.class Lorg/eclipse/jgit/revwalk/DepthGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "DepthGenerator.java"


# instance fields
.field private final REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final depth:I

.field private final pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

.field private final walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/DepthWalk;Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 2
    .parameter "w"
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 90
    new-instance v1, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    move-object v1, p1

    .line 91
    check-cast v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 93
    invoke-interface {p1}, Lorg/eclipse/jgit/revwalk/DepthWalk;->getDepth()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->depth:I

    .line 94
    invoke-interface {p1}, Lorg/eclipse/jgit/revwalk/DepthWalk;->getUnshallowFlag()Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 95
    invoke-interface {p1}, Lorg/eclipse/jgit/revwalk/DepthWalk;->getReinterestingFlag()Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 97
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/revwalk/Generator;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 102
    :cond_0
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 103
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_1

    .line 108
    return-void

    :cond_1
    move-object v1, v0

    .line 105
    check-cast v1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->getDepth()I

    move-result v1

    if-nez v1, :cond_0

    .line 106
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    :cond_0
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v8}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    .line 129
    .local v1, c:Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
    if-nez v1, :cond_1

    .line 130
    const/4 v1, 0x0

    .line 173
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
    :goto_0
    return-object v1

    .line 132
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
    :cond_1
    iget v8, v1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->flags:I

    and-int/lit8 v8, v8, 0x1

    if-nez v8, :cond_2

    .line 133
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 135
    :cond_2
    iget v8, v1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    add-int/lit8 v5, v8, 0x1

    .line 137
    .local v5, newDepth:I
    iget-object v0, v1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_6

    aget-object v6, v0, v3

    .local v6, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object v2, v6

    .line 138
    check-cast v2, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    .line 144
    .local v2, dp:Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
    iget v8, v2, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_3

    .line 145
    iput v5, v2, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    .line 149
    iget v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->depth:I

    if-gt v5, v8, :cond_3

    .line 150
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v8, v6}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 157
    :cond_3
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v8

    if-nez v8, :cond_4

    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 158
    :cond_4
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v6, v8}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 159
    iget v8, v6, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v8, v8, -0x5

    iput v8, v6, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 137
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 164
    .end local v2           #dp:Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
    .end local v6           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_6
    iget v8, v1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    iget v9, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->depth:I

    if-gt v8, v9, :cond_8

    const/4 v7, 0x1

    .line 169
    .local v7, produce:Z
    :goto_2
    iget v8, v1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->flags:I

    and-int/lit8 v8, v8, 0x4

    if-eqz v8, :cond_7

    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 170
    const/4 v7, 0x0

    .line 172
    :cond_7
    if-eqz v7, :cond_0

    goto :goto_0

    .line 164
    .end local v7           #produce:Z
    :cond_8
    const/4 v7, 0x0

    goto :goto_2
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->outputType()I

    move-result v0

    or-int/lit8 v0, v0, 0x10

    return v0
.end method

.method shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 1
    .parameter "q"

    .prologue
    .line 117
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 118
    return-void
.end method
