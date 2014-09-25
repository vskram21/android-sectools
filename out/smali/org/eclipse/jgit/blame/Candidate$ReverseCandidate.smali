.class final Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;
.super Lorg/eclipse/jgit/blame/Candidate;
.source "Candidate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/blame/Candidate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ReverseCandidate"
.end annotation


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V
    .locals 0
    .parameter "commit"
    .parameter "path"

    .prologue
    .line 352
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/blame/Candidate;-><init>(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    .line 353
    return-void
.end method


# virtual methods
.method create(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/blame/Candidate;
    .locals 1
    .parameter "commit"
    .parameter "path"

    .prologue
    .line 373
    new-instance v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    check-cast p1, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    .end local p1
    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;-><init>(Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    return-object v0
.end method

.method getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "idx"

    .prologue
    .line 362
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    check-cast v0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->getChild(I)Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    move-result-object v0

    return-object v0
.end method

.method getParentCount()I
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    check-cast v0, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;->getChildCount()I

    move-result v0

    return v0
.end method

.method getTime()I
    .locals 1

    .prologue
    .line 368
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v0

    neg-int v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 378
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Reverse"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Lorg/eclipse/jgit/blame/Candidate;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
