.class public Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;
.super Lorg/eclipse/jgit/revwalk/RevWalk;
.source "DepthWalk.java"

# interfaces
.implements Lorg/eclipse/jgit/revwalk/DepthWalk;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/DepthWalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RevWalk"
.end annotation


# instance fields
.field private final REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final depth:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;I)V
    .locals 1
    .parameter "or"
    .parameter "depth"

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 115
    iput p2, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->depth:I

    .line 116
    const-string v0, "UNSHALLOW"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 117
    const-string v0, "REINTERESTING"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 118
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;I)V
    .locals 1
    .parameter "repo"
    .parameter "depth"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 103
    iput p2, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->depth:I

    .line 104
    const-string v0, "UNSHALLOW"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 105
    const-string v0, "REINTERESTING"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 106
    return-void
.end method


# virtual methods
.method protected createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "id"

    .prologue
    .line 138
    new-instance v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0
.end method

.method public getDepth()I
    .locals 1

    .prologue
    .line 142
    iget v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->depth:I

    return v0
.end method

.method public getReinterestingFlag()Lorg/eclipse/jgit/revwalk/RevFlag;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    return-object v0
.end method

.method public getUnshallowFlag()Lorg/eclipse/jgit/revwalk/RevFlag;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    return-object v0
.end method

.method public markRoot(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 2
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 132
    check-cast v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    const/4 v1, 0x0

    iput v1, v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    .line 133
    :cond_0
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 134
    return-void
.end method
