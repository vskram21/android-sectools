.class final Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;
.super Lorg/eclipse/jgit/blame/Candidate;
.source "Candidate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/blame/Candidate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BlobCandidate"
.end annotation


# instance fields
.field description:Ljava/lang/String;

.field parent:Lorg/eclipse/jgit/blame/Candidate;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V
    .locals 1
    .parameter "name"
    .parameter "path"

    .prologue
    .line 403
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lorg/eclipse/jgit/blame/Candidate;-><init>(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    .line 404
    iput-object p1, p0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->description:Ljava/lang/String;

    .line 405
    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 0
    .parameter "flag"

    .prologue
    .line 435
    return-void
.end method

.method beginResult(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 0
    .parameter "rw"

    .prologue
    .line 410
    return-void
.end method

.method getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 3

    .prologue
    .line 450
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->description:Ljava/lang/String;

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method getNextCandidate(I)Lorg/eclipse/jgit/blame/Candidate;
    .locals 1
    .parameter "idx"

    .prologue
    .line 424
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->parent:Lorg/eclipse/jgit/blame/Candidate;

    return-object v0
.end method

.method getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "idx"

    .prologue
    .line 419
    const/4 v0, 0x0

    return-object v0
.end method

.method getParentCount()I
    .locals 1

    .prologue
    .line 414
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->parent:Lorg/eclipse/jgit/blame/Candidate;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getTime()I
    .locals 1

    .prologue
    .line 445
    const v0, 0x7fffffff

    return v0
.end method

.method has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z
    .locals 1
    .parameter "flag"

    .prologue
    .line 429
    const/4 v0, 0x1

    return v0
.end method

.method remove(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 0
    .parameter "flag"

    .prologue
    .line 441
    return-void
.end method
