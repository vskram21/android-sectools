.class public Lorg/eclipse/jgit/dircache/DirCacheBuilder;
.super Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;
.source "DirCacheBuilder.java"


# instance fields
.field private sorted:Z


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/dircache/DirCache;I)V
    .locals 0
    .parameter "dc"
    .parameter "ecnt"

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;-><init>(Lorg/eclipse/jgit/dircache/DirCache;I)V

    .line 86
    return-void
.end method

.method private static bad(Lorg/eclipse/jgit/dircache/DirCacheEntry;Ljava/lang/String;)Ljava/lang/IllegalStateException;
    .locals 3
    .parameter "a"
    .parameter "msg"

    .prologue
    .line 247
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private beforeAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 7
    .parameter "newEntry"

    .prologue
    const/4 v6, 0x0

    .line 197
    iget-boolean v4, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->sorted:Z

    if-eqz v4, :cond_0

    iget v4, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entryCnt:I

    if-lez v4, :cond_0

    .line 198
    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v5, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entryCnt:I

    add-int/lit8 v5, v5, -0x1

    aget-object v2, v4, v5

    .line 199
    .local v2, lastEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-static {v2, p1}, Lorg/eclipse/jgit/dircache/DirCache;->cmp(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v0

    .line 200
    .local v0, cr:I
    if-lez v0, :cond_1

    .line 205
    iput-boolean v6, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->sorted:Z

    .line 220
    .end local v0           #cr:I
    .end local v2           #lastEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    :goto_0
    return-void

    .line 206
    .restart local v0       #cr:I
    .restart local v2       #lastEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_1
    if-nez v0, :cond_0

    .line 210
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v3

    .line 211
    .local v3, peStage:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v1

    .line 212
    .local v1, dceStage:I
    if-ne v3, v1, :cond_2

    .line 213
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->duplicateStagesNotAllowed:Ljava/lang/String;

    invoke-static {p1, v4}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->bad(Lorg/eclipse/jgit/dircache/DirCacheEntry;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object v4

    throw v4

    .line 214
    :cond_2
    if-eqz v3, :cond_3

    if-nez v1, :cond_4

    .line 215
    :cond_3
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->mixedStagesNotAllowed:Ljava/lang/String;

    invoke-static {p1, v4}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->bad(Lorg/eclipse/jgit/dircache/DirCacheEntry;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object v4

    throw v4

    .line 216
    :cond_4
    if-le v3, v1, :cond_0

    .line 217
    iput-boolean v6, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->sorted:Z

    goto :goto_0
.end method

.method private resort()V
    .locals 10

    .prologue
    .line 223
    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    const/4 v7, 0x0

    iget v8, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entryCnt:I

    sget-object v9, Lorg/eclipse/jgit/dircache/DirCache;->ENT_CMP:Ljava/util/Comparator;

    invoke-static {v6, v7, v8, v9}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 225
    const/4 v3, 0x1

    .local v3, entryIdx:I
    :goto_0
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entryCnt:I

    if-ge v3, v6, :cond_3

    .line 226
    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    add-int/lit8 v7, v3, -0x1

    aget-object v4, v6, v7

    .line 227
    .local v4, pe:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v0, v6, v3

    .line 228
    .local v0, ce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-static {v4, v0}, Lorg/eclipse/jgit/dircache/DirCache;->cmp(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v2

    .line 229
    .local v2, cr:I
    if-nez v2, :cond_2

    .line 233
    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v5

    .line 234
    .local v5, peStage:I
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v1

    .line 235
    .local v1, ceStage:I
    if-ne v5, v1, :cond_0

    .line 236
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->duplicateStagesNotAllowed:Ljava/lang/String;

    invoke-static {v0, v6}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->bad(Lorg/eclipse/jgit/dircache/DirCacheEntry;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object v6

    throw v6

    .line 237
    :cond_0
    if-eqz v5, :cond_1

    if-nez v1, :cond_2

    .line 238
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->mixedStagesNotAllowed:Ljava/lang/String;

    invoke-static {v0, v6}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->bad(Lorg/eclipse/jgit/dircache/DirCacheEntry;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object v6

    throw v6

    .line 225
    .end local v1           #ceStage:I
    .end local v5           #peStage:I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 242
    .end local v0           #ce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v2           #cr:I
    .end local v4           #pe:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_3
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->sorted:Z

    .line 243
    return-void
.end method

.method private toEntry(ILorg/eclipse/jgit/treewalk/TreeWalk;)Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 4
    .parameter "stage"
    .parameter "tw"

    .prologue
    const/4 v3, 0x0

    .line 181
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v2

    invoke-direct {v0, v2, p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([BI)V

    .line 184
    .local v0, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    const-class v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {p2, v3, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    .line 185
    .local v1, i:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    invoke-virtual {p2, v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 186
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectIdFromRaw([BI)V

    .line 187
    return-object v0
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 5
    .parameter "newEntry"

    .prologue
    .line 104
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getRawMode()I

    move-result v0

    if-nez v0, :cond_0

    .line 105
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->fileModeNotSetForPath:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->beforeAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 108
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->fastAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 109
    return-void
.end method

.method public addTree([BILorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 4
    .parameter "pathPrefix"
    .parameter "stage"
    .parameter "reader"
    .parameter "tree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    new-instance v1, Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-direct {v1, p3}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 168
    .local v1, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    new-instance v2, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {p4}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v2, p1, p3, v3}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>([BLorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 170
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 171
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 172
    invoke-direct {p0, p2, v1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->toEntry(ILorg/eclipse/jgit/treewalk/TreeWalk;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 173
    .local v0, newEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->beforeAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 174
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->fastAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 175
    :goto_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 176
    invoke-direct {p0, p2, v1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->toEntry(ILorg/eclipse/jgit/treewalk/TreeWalk;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->fastAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_0

    .line 178
    .end local v0           #newEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    return-void
.end method

.method public bridge synthetic commit()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-super {p0}, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->commit()Z

    move-result v0

    return v0
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 191
    iget-boolean v0, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->sorted:Z

    if-nez v0, :cond_0

    .line 192
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->resort()V

    .line 193
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->replace()V

    .line 194
    return-void
.end method

.method public bridge synthetic getDirCache()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 1

    .prologue
    .line 72
    invoke-super {p0}, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->getDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    return-object v0
.end method

.method public keep(II)V
    .locals 1
    .parameter "pos"
    .parameter "cnt"

    .prologue
    .line 132
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(I)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->beforeAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 133
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->fastKeep(II)V

    .line 134
    return-void
.end method
