.class Lorg/eclipse/jgit/revwalk/TopoSortGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "TopoSortGenerator.java"


# static fields
.field private static final TOPO_DELAY:I = 0x20


# instance fields
.field private final outputType:I

.field private final pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 6
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 74
    new-instance v5, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v5}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    iput-object v5, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    .line 75
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v5

    or-int/lit8 v5, v5, 0x8

    iput v5, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->outputType:I

    .line 76
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/revwalk/Generator;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 78
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 79
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v1, :cond_0

    .line 85
    return-void

    .line 81
    :cond_0
    iget-object v0, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 82
    .local v4, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->inDegree:I

    add-int/lit8 v5, v5, 0x1

    iput v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->inDegree:I

    .line 81
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 83
    .end local v4           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 102
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v1, :cond_1

    .line 103
    const/4 v1, 0x0

    .line 126
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    return-object v1

    .line 105
    .restart local v1       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget v5, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->inDegree:I

    if-lez v5, :cond_2

    .line 109
    iget v5, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v5, v5, 0x20

    iput v5, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    goto :goto_0

    .line 116
    :cond_2
    iget-object v0, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 117
    .local v4, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->inDegree:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->inDegree:I

    if-nez v5, :cond_3

    iget v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v5, v5, 0x20

    if-eqz v5, :cond_3

    .line 122
    iget v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v5, v5, -0x21

    iput v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 123
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->unpop(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 116
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 89
    iget v0, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->outputType:I

    return v0
.end method

.method shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 1
    .parameter "q"

    .prologue
    .line 94
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;->pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 95
    return-void
.end method
