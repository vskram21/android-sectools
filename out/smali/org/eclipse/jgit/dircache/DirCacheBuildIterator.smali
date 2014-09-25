.class public Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;
.super Lorg/eclipse/jgit/dircache/DirCacheIterator;
.source "DirCacheBuildIterator.java"


# instance fields
.field private final builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/dircache/DirCacheTree;)V
    .locals 1
    .parameter "p"
    .parameter "dct"

    .prologue
    .line 104
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheIterator;Lorg/eclipse/jgit/dircache/DirCacheTree;)V

    .line 105
    iget-object v0, p1, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 106
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V
    .locals 1
    .parameter "dcb"

    .prologue
    .line 98
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->getDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    .line 99
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 100
    return-void
.end method


# virtual methods
.method public createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 3
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-nez v0, :cond_0

    .line 112
    new-instance v0, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    const-string v2, "tree"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/dircache/DirCacheTree;)V

    return-object v0
.end method

.method public skip()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->ptr:I

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getEntrySpan()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->keep(II)V

    .line 123
    :goto_0
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->next(I)V

    .line 124
    return-void

    .line 122
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->ptr:I

    invoke-virtual {v0, v1, v3}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->keep(II)V

    goto :goto_0
.end method

.method public stopWalk()V
    .locals 4

    .prologue
    .line 128
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->ptr:I

    .line 129
    .local v1, cur:I
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->getEntryCount()I

    move-result v0

    .line 130
    .local v0, cnt:I
    if-ge v1, v0, :cond_0

    .line 131
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    sub-int v3, v0, v1

    invoke-virtual {v2, v1, v3}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->keep(II)V

    .line 132
    :cond_0
    return-void
.end method
