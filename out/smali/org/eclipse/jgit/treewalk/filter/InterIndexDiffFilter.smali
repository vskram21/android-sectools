.class public final Lorg/eclipse/jgit/treewalk/filter/InterIndexDiffFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "InterIndexDiffFilter.java"


# static fields
.field public static final INSTANCE:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

.field private static final baseTree:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/InterIndexDiffFilter;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/filter/InterIndexDiffFilter;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/treewalk/filter/InterIndexDiffFilter;->INSTANCE:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

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
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/InterIndexDiffFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 98
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 11
    .parameter "walker"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 65
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTreeCount()I

    move-result v4

    .line 66
    .local v4, n:I
    if-ne v4, v7, :cond_1

    .line 88
    :cond_0
    :goto_0
    return v7

    .line 69
    :cond_1
    invoke-virtual {p1, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v3

    .line 70
    .local v3, m:I
    const/4 v2, 0x1

    .local v2, i:I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 71
    const-class v9, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {p1, v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 73
    .local v1, baseDirCache:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    const-class v9, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {p1, v2, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 75
    .local v6, newDirCache:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-eqz v1, :cond_2

    if-eqz v6, :cond_2

    .line 76
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 77
    .local v0, baseDci:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v5

    .line 78
    .local v5, newDci:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v0, :cond_2

    if-eqz v5, :cond_2

    .line 79
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isAssumeValid()Z

    move-result v9

    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isAssumeValid()Z

    move-result v10

    if-ne v9, v10, :cond_0

    .line 81
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isAssumeValid()Z

    move-result v9

    if-eqz v9, :cond_2

    move v7, v8

    .line 82
    goto :goto_0

    .line 85
    .end local v0           #baseDci:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v5           #newDci:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_2
    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v9

    if-ne v9, v3, :cond_0

    invoke-virtual {p1, v2, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->idEqual(II)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 70
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v1           #baseDirCache:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v6           #newDirCache:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    :cond_3
    move v7, v8

    .line 88
    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 93
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    const-string v0, "INTERINDEX_DIFF"

    return-object v0
.end method
