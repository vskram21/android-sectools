.class public Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "NotIgnoredFilter.java"


# instance fields
.field private final index:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .parameter "workdirTreeIndex"

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 65
    iput p1, p0, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;->index:I

    .line 66
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
    .line 55
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 83
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 3
    .parameter "tw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;->index:I

    const-class v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {p1, v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 72
    .local v0, i:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NotIgnored("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/NotIgnoredFilter;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
