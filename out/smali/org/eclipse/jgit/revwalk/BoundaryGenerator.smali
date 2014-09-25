.class Lorg/eclipse/jgit/revwalk/BoundaryGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "BoundaryGenerator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;
    }
.end annotation


# static fields
.field static final UNINTERESTING:I = 0x4


# instance fields
.field g:Lorg/eclipse/jgit/revwalk/Generator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 1
    .parameter "w"
    .parameter "s"

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 58
    new-instance v0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;

    invoke-direct {v0, p0, p1, p2}, Lorg/eclipse/jgit/revwalk/BoundaryGenerator$InitialGenerator;-><init>(Lorg/eclipse/jgit/revwalk/BoundaryGenerator;Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/Generator;)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator;->g:Lorg/eclipse/jgit/revwalk/Generator;

    .line 59
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator;->g:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator;->g:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v0

    or-int/lit8 v0, v0, 0x10

    return v0
.end method

.method shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V
    .locals 1
    .parameter "q"

    .prologue
    .line 68
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BoundaryGenerator;->g:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/Generator;->shareFreeList(Lorg/eclipse/jgit/revwalk/BlockRevQueue;)V

    .line 69
    return-void
.end method
