.class Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "BoundaryGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/BoundaryGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InitialGenerator"
.end annotation


# static fields
.field private static final DUPLICATE:I = 0x10

.field private static final PARSED:I = 0x1


# instance fields
.field private final held:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

.field private final source:Lorg/eclipse/jgit/revwalk/Generator;

.field final synthetic this$0:Lorg/eclipse/jgit/revwalk/BoundaryGenerator;

.field private final walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/BoundaryGenerator;Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 2
    .parameter
    .parameter "w"
    .parameter "s"

    .prologue
    .line 88
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->this$0:Lorg/eclipse/jgit/revwalk/BoundaryGenerator;

    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 89
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 90
    new-instance v0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->held:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    .line 91
    iput-object p3, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->held:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/Generator;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 93
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 109
    .local v2, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v2, :cond_2

    .line 110
    iget-object v0, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v5, v0, v3

    .line 111
    .local v5, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v6, v5, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v6, v6, 0x4

    if-eqz v6, :cond_0

    .line 112
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->held:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v6, v5}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 110
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .end local v5           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    move-object v6, v2

    .line 131
    .end local v0           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #i$:I
    .end local v4           #len$:I
    :goto_1
    return-object v6

    .line 116
    :cond_2
    new-instance v1, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    .line 117
    .local v1, boundary:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->held:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 119
    :cond_3
    :goto_2
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->held:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 120
    if-nez v2, :cond_4

    .line 129
    const/16 v6, 0x10

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->removeFlag(I)V

    .line 130
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->this$0:Lorg/eclipse/jgit/revwalk/BoundaryGenerator;

    iput-object v1, v6, Lorg/eclipse/jgit/revwalk/BoundaryGenerator;->g:Lorg/eclipse/jgit/revwalk/Generator;

    .line 131
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v6

    goto :goto_1

    .line 122
    :cond_4
    iget v6, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v6, v6, 0x10

    if-nez v6, :cond_3

    .line 124
    iget v6, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v6, v6, 0x1

    if-nez v6, :cond_5

    .line 125
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2, v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 126
    :cond_5
    iget v6, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v6, v6, 0x10

    iput v6, v2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 127
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_2
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->source:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v0

    return v0
.end method

.method shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 1
    .parameter "q"

    .prologue
    .line 102
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;->held:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 103
    return-void
.end method
