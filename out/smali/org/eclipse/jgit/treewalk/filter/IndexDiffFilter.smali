.class public Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "IndexDiffFilter.java"


# instance fields
.field private final dirCache:I

.field private final honorIgnores:Z

.field private final ignoredPaths:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final untrackedFolders:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final untrackedParentFolders:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final workingTree:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .parameter "dirCacheIndex"
    .parameter "workingTreeIndex"

    .prologue
    .line 107
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;-><init>(IIZ)V

    .line 108
    return-void
.end method

.method public constructor <init>(IIZ)V
    .locals 1
    .parameter "dirCacheIndex"
    .parameter "workingTreeIndex"
    .parameter "honorIgnores"

    .prologue
    .line 125
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 89
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->ignoredPaths:Ljava/util/Set;

    .line 91
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    .line 93
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedFolders:Ljava/util/LinkedList;

    .line 126
    iput p1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->dirCache:I

    .line 127
    iput p2, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->workingTree:I

    .line 128
    iput-boolean p3, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->honorIgnores:Z

    .line 129
    return-void
.end method

.method private copyUntrackedFolders(Ljava/lang/String;)V
    .locals 3
    .parameter "currentPath"

    .prologue
    .line 236
    const/4 v0, 0x0

    .line 237
    .local v0, pathToBeSaved:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 240
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #pathToBeSaved:Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .restart local v0       #pathToBeSaved:Ljava/lang/String;
    goto :goto_0

    .line 241
    :cond_0
    if-eqz v0, :cond_2

    .line 242
    :goto_1
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedFolders:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedFolders:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 244
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedFolders:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_1

    .line 245
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedFolders:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 247
    :cond_2
    return-void
.end method

.method private workingTree(Lorg/eclipse/jgit/treewalk/TreeWalk;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    .locals 2
    .parameter "tw"

    .prologue
    .line 250
    iget v0, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->workingTree:I

    const-class v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    return-object v0
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
    .line 82
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 262
    return-object p0
.end method

.method public getIgnoredPaths()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 280
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->ignoredPaths:Ljava/util/Set;

    return-object v0
.end method

.method public getUntrackedFolders()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 290
    new-instance v0, Ljava/util/LinkedList;

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedFolders:Ljava/util/LinkedList;

    invoke-direct {v0, v2}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 291
    .local v0, ret:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 292
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 293
    .local v1, toBeAdded:Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 294
    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_0

    .line 295
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 297
    .end local v1           #toBeAdded:Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 13
    .parameter "tw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v10, 0x1

    .line 134
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTreeCount()I

    move-result v0

    .line 135
    .local v0, cnt:I
    iget v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->workingTree:I

    invoke-virtual {p1, v11}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v8

    .line 136
    .local v8, wm:I
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->workingTree(Lorg/eclipse/jgit/treewalk/TreeWalk;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-result-object v7

    .line 137
    .local v7, wi:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    .line 139
    .local v5, path:Ljava/lang/String;
    iget v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->dirCache:I

    const-class v12, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {p1, v11, v12}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 140
    .local v2, di:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-eqz v2, :cond_1

    .line 141
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v1

    .line 142
    .local v1, dce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v1, :cond_1

    .line 143
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isAssumeValid()Z

    move-result v11

    if-eqz v11, :cond_1

    move v10, v9

    .line 223
    .end local v1           #dce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    :goto_0
    return v10

    .line 147
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isPostOrderTraversal()Z

    move-result v11

    if-nez v11, :cond_4

    .line 153
    sget-object v11, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v11, v8}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v11

    if-eqz v11, :cond_3

    iget-boolean v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->honorIgnores:Z

    if-eqz v11, :cond_2

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored()Z

    move-result v11

    if-nez v11, :cond_3

    .line 157
    :cond_2
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->copyUntrackedFolders(Ljava/lang/String;)V

    .line 159
    iget-object v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    invoke-virtual {v11, v5}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 166
    :cond_3
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    if-ge v4, v0, :cond_4

    .line 167
    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v6

    .line 168
    .local v6, rmode:I
    iget v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->workingTree:I

    if-eq v4, v11, :cond_6

    if-eqz v6, :cond_6

    sget-object v11, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v11, v6}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 170
    iget-object v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->untrackedParentFolders:Ljava/util/LinkedList;

    invoke-virtual {v11}, Ljava/util/LinkedList;->clear()V

    .line 178
    .end local v4           #i:I
    .end local v6           #rmode:I
    :cond_4
    if-eqz v8, :cond_0

    .line 184
    iget v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->dirCache:I

    invoke-virtual {p1, v11}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v3

    .line 185
    .local v3, dm:I
    if-nez v3, :cond_a

    .line 186
    iget-boolean v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->honorIgnores:Z

    if-eqz v11, :cond_0

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 187
    iget-object v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->ignoredPaths:Ljava/util/Set;

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryPathString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 188
    const/4 v4, 0x0

    .line 189
    .restart local v4       #i:I
    :goto_2
    if-ge v4, v0, :cond_8

    .line 190
    iget v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->dirCache:I

    if-eq v4, v11, :cond_5

    iget v11, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->workingTree:I

    if-ne v4, v11, :cond_7

    .line 189
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 166
    .end local v3           #dm:I
    .restart local v6       #rmode:I
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 192
    .end local v6           #rmode:I
    .restart local v3       #dm:I
    :cond_7
    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v11

    if-eqz v11, :cond_5

    .line 198
    :cond_8
    if-ne v4, v0, :cond_9

    :goto_3
    move v10, v9

    goto :goto_0

    :cond_9
    move v9, v10

    goto :goto_3

    .line 207
    .end local v4           #i:I
    :cond_a
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isSubtree()Z

    move-result v9

    if-nez v9, :cond_0

    .line 213
    const/4 v4, 0x0

    .restart local v4       #i:I
    :goto_4
    if-ge v4, v0, :cond_d

    .line 214
    iget v9, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->dirCache:I

    if-eq v4, v9, :cond_b

    iget v9, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->workingTree:I

    if-ne v4, v9, :cond_c

    .line 213
    :cond_b
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 216
    :cond_c
    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v9

    if-ne v9, v3, :cond_0

    iget v9, p0, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->dirCache:I

    invoke-virtual {p1, v4, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->idEqual(II)Z

    move-result v9

    if-nez v9, :cond_b

    goto/16 :goto_0

    .line 223
    :cond_d
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v9

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v11

    invoke-virtual {v7, v9, v10, v11}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v10

    goto/16 :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 257
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 267
    const-string v0, "INDEX_DIFF_FILTER"

    return-object v0
.end method
