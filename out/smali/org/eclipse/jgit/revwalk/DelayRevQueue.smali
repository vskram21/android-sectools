.class final Lorg/eclipse/jgit/revwalk/DelayRevQueue;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "DelayRevQueue.java"


# static fields
.field private static final OVER_SCAN:I = 0x6


# instance fields
.field private final delay:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

.field private final pending:Lorg/eclipse/jgit/revwalk/Generator;

.field private size:I


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 1
    .parameter "g"

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    .line 74
    new-instance v0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->delay:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    .line 75
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->size:I

    const/4 v2, 0x6

    if-ge v1, v2, :cond_0

    .line 86
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 87
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_1

    .line 93
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->delay:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 94
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_2

    .line 95
    const/4 v0, 0x0

    .line 97
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_1
    return-object v0

    .line 89
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->delay:Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 90
    iget v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->size:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->size:I

    goto :goto_0

    .line 96
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->size:I

    goto :goto_1
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DelayRevQueue;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v0

    return v0
.end method
