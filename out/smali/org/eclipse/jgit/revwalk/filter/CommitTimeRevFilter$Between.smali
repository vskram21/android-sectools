.class Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;
.super Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;
.source "CommitTimeRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Between"
.end annotation


# instance fields
.field private final until:I


# direct methods
.method constructor <init>(JJ)V
    .locals 2
    .parameter "since"
    .parameter "until"

    .prologue
    .line 190
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;-><init>(J)V

    .line 191
    const-wide/16 v0, 0x3e8

    div-long v0, p3, v0

    long-to-int v0, v0

    iput v0, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;->until:I

    .line 192
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
    .line 186
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
    .line 198
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v0

    iget v1, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;->until:I

    if-gt v0, v1, :cond_0

    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v0

    iget v1, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;->when:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    const-wide/16 v4, 0x3e8

    .line 204
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

    iget v2, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;->when:I

    int-to-long v2, v2

    mul-long/2addr v2, v4

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    iget v2, p0, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter$Between;->until:I

    int-to-long v2, v2

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
