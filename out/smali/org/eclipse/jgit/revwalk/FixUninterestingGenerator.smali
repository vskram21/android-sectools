.class final Lorg/eclipse/jgit/revwalk/FixUninterestingGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "FixUninterestingGenerator.java"


# instance fields
.field private final pending:Lorg/eclipse/jgit/revwalk/Generator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/Generator;)V
    .locals 0
    .parameter "g"

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/FixUninterestingGenerator;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    .line 66
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FixUninterestingGenerator;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 78
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_1

    .line 79
    const/4 v0, 0x0

    .line 81
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_0
    return-object v0

    .line 80
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget v1, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_0

    goto :goto_0
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FixUninterestingGenerator;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v0

    return v0
.end method
