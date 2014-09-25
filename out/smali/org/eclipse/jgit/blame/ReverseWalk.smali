.class final Lorg/eclipse/jgit/blame/ReverseWalk;
.super Lorg/eclipse/jgit/revwalk/RevWalk;
.source "ReverseWalk.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    }
.end annotation


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 58
    return-void
.end method


# virtual methods
.method protected createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "id"

    .prologue
    .line 73
    new-instance v0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    .line 64
    .local v0, c:Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    if-nez v0, :cond_1

    .line 65
    const/4 v0, 0x0

    .line 68
    .end local v0           #c:Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    :cond_0
    return-object v0

    .line 66
    .restart local v0       #c:Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    :cond_1
    const/4 v1, 0x0

    .local v1, pIdx:I
    :goto_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->getParentCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 67
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->addChild(Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;)V

    .line 66
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public bridge synthetic next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/ReverseWalk;->next()Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    move-result-object v0

    return-object v0
.end method
