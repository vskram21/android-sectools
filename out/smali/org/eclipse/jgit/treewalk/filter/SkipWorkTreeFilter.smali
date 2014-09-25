.class public Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "SkipWorkTreeFilter.java"


# instance fields
.field private final treeIdx:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .parameter "treeIdx"

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 69
    iput p1, p0, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;->treeIdx:I

    .line 70
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
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 89
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 5
    .parameter "walker"

    .prologue
    const/4 v2, 0x1

    .line 74
    iget v3, p0, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;->treeIdx:I

    const-class v4, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {p1, v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 75
    .local v1, i:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-nez v1, :cond_1

    .line 79
    :cond_0
    :goto_0
    return v2

    .line 78
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 79
    .local v0, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isSkipWorkTree()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x0

    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 84
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SkipWorkTree("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;->treeIdx:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
