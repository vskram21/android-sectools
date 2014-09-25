.class abstract Lorg/eclipse/jgit/revwalk/BlockRevQueue;
.super Lorg/eclipse/jgit/revwalk/AbstractRevQueue;
.source "BlockRevQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;,
        Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;
    }
.end annotation


# instance fields
.field protected free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;-><init>()V

    .line 56
    new-instance v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    .line 57
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 2
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;-><init>()V

    .line 61
    new-instance v1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    invoke-direct {v1}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    .line 62
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->outputType:I

    .line 63
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/Generator;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 65
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 66
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_0

    .line 70
    return-void

    .line 68
    :cond_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0
.end method


# virtual methods
.method public shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 1
    .parameter "q"

    .prologue
    .line 87
    iget-object v0, p1, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue;->free:Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;

    .line 88
    return-void
.end method
