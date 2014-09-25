.class Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$After;
.super Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;
.source "CommitTimeRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "After"
.end annotation


# direct methods
.method constructor <init>(J)V
    .locals 0
    .parameter "ts"

    .prologue
    .line 163
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;-><init>(J)V

    .line 164
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 2
    .parameter "walker"
    .parameter "cmit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/StopWalkException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v0

    iget v1, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$After;->when:I

    if-ge v0, v1, :cond_0

    .line 175
    sget-object v0, Lorg/eclipse/jgit/errors/StopWalkException;->INSTANCE:Lorg/eclipse/jgit/errors/StopWalkException;

    throw v0

    .line 176
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    iget v2, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$After;->when:I

    int-to-long v2, v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
