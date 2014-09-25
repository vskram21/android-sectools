.class public Lorg/eclipse/jgit/dircache/DirCacheIterator;
.super Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
.source "DirCacheIterator.java"


# instance fields
.field protected final cache:Lorg/eclipse/jgit/dircache/DirCache;

.field protected currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

.field protected currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

.field private nextSubtreePos:I

.field protected ptr:I

.field private final subtreeId:[B

.field private final tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

.field private final treeEnd:I

.field private final treeStart:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/dircache/DirCache;)V
    .locals 1
    .parameter "dc"

    .prologue
    .line 105
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>()V

    .line 106
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 107
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/dircache/DirCache;->getCacheTree(Z)Lorg/eclipse/jgit/dircache/DirCacheTree;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 108
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeStart:I

    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getEntrySpan()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeEnd:I

    .line 110
    const/16 v0, 0x14

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->subtreeId:[B

    .line 111
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->eof()Z

    move-result v0

    if-nez v0, :cond_0

    .line 112
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->parseEntry()V

    .line 113
    :cond_0
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/dircache/DirCacheIterator;Lorg/eclipse/jgit/dircache/DirCacheTree;)V
    .locals 2
    .parameter "p"
    .parameter "dct"

    .prologue
    .line 116
    iget-object v0, p1, Lorg/eclipse/jgit/dircache/DirCacheIterator;->path:[B

    iget v1, p1, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathLen:I

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;[BI)V

    .line 117
    iget-object v0, p1, Lorg/eclipse/jgit/dircache/DirCacheIterator;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 118
    iput-object p2, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 119
    iget v0, p1, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeStart:I

    .line 120
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeStart:I

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getEntrySpan()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeEnd:I

    .line 121
    iget-object v0, p1, Lorg/eclipse/jgit/dircache/DirCacheIterator;->subtreeId:[B

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->subtreeId:[B

    .line 122
    iget v0, p1, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    .line 123
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->parseEntry()V

    .line 124
    return-void
.end method

.method private parseEntry()V
    .locals 1

    .prologue
    .line 216
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->parseEntry(Z)V

    .line 217
    return-void
.end method

.method private parseEntry(Z)V
    .locals 6
    .parameter "forward"

    .prologue
    .line 220
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    iget v4, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(I)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 221
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget-object v0, v3, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 223
    .local v0, cep:[B
    if-nez p1, :cond_0

    .line 224
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    if-lez v3, :cond_0

    .line 225
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    iget v4, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getChild(I)Lorg/eclipse/jgit/dircache/DirCacheTree;

    move-result-object v1

    .line 226
    .local v1, p:Lorg/eclipse/jgit/dircache/DirCacheTree;
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathOffset:I

    array-length v4, v0

    invoke-virtual {v1, v0, v3, v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->contains([BII)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 227
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    .line 228
    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 232
    .end local v1           #p:Lorg/eclipse/jgit/dircache/DirCacheTree;
    :cond_0
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getChildCount()I

    move-result v4

    if-eq v3, v4, :cond_2

    .line 233
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    iget v4, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getChild(I)Lorg/eclipse/jgit/dircache/DirCacheTree;

    move-result-object v2

    .line 234
    .local v2, s:Lorg/eclipse/jgit/dircache/DirCacheTree;
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathOffset:I

    array-length v4, v0

    invoke-virtual {v2, v0, v3, v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->contains([BII)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 238
    iput-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 239
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    .line 241
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheTree;->isValid()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 242
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->subtreeId:[B

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/lib/ObjectId;->copyRawTo([BI)V

    .line 243
    :cond_1
    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->mode:I

    .line 244
    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->path:[B

    .line 245
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathOffset:I

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheTree;->nameLength()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathLen:I

    .line 257
    .end local v2           #s:Lorg/eclipse/jgit/dircache/DirCacheTree;
    :goto_0
    return-void

    .line 253
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getRawMode()I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->mode:I

    .line 254
    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->path:[B

    .line 255
    array-length v3, v0

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathLen:I

    .line 256
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    goto :goto_0
.end method


# virtual methods
.method public back(I)V
    .locals 2
    .parameter "delta"

    .prologue
    .line 205
    :cond_0
    :goto_0
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_2

    .line 206
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v0, :cond_1

    .line 207
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    .line 208
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    .line 209
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->parseEntry(Z)V

    .line 210
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v0, :cond_0

    .line 211
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getEntrySpan()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    goto :goto_0

    .line 213
    :cond_2
    return-void
.end method

.method public createEmptyTreeIterator()Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 137
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathLen:I

    add-int/lit8 v1, v1, 0x1

    const/16 v2, 0x80

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v0, v1, [B

    .line 138
    .local v0, n:[B
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->path:[B

    iget v2, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathLen:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 139
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathLen:I

    const/16 v2, 0x2f

    aput-byte v2, v0, v1

    .line 140
    new-instance v1, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    iget v2, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->pathLen:I

    add-int/lit8 v2, v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;[BI)V

    return-object v1
.end method

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
    .line 129
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-nez v0, :cond_0

    .line 130
    new-instance v0, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    const-string v2, "tree"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheIterator;Lorg/eclipse/jgit/dircache/DirCacheTree;)V

    return-object v0
.end method

.method public eof()Z
    .locals 2

    .prologue
    .line 187
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeEnd:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public first()Z
    .locals 2

    .prologue
    .line 182
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeStart:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasId()Z
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->isValid()Z

    move-result v0

    .line 147
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public idBuffer()[B
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v0, :cond_1

    .line 153
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->subtreeId:[B

    .line 156
    :goto_0
    return-object v0

    .line 153
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->zeroid:[B

    goto :goto_0

    .line 154
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    if-eqz v0, :cond_2

    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idBuffer()[B

    move-result-object v0

    goto :goto_0

    .line 156
    :cond_2
    sget-object v0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->zeroid:[B

    goto :goto_0
.end method

.method public idOffset()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 161
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v1, :cond_1

    .line 165
    :cond_0
    :goto_0
    return v0

    .line 163
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    if-eqz v1, :cond_0

    .line 164
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idOffset()I

    move-result v0

    goto :goto_0
.end method

.method public next(I)V
    .locals 2
    .parameter "delta"

    .prologue
    .line 192
    :goto_0
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_0

    .line 193
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v0, :cond_1

    .line 194
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getEntrySpan()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    .line 197
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->eof()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 201
    :cond_0
    return-void

    .line 196
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    goto :goto_1

    .line 199
    :cond_2
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->parseEntry()V

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 170
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->first()Z

    move-result v0

    if-nez v0, :cond_0

    .line 171
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->treeStart:I

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->ptr:I

    .line 172
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->nextSubtreePos:I

    .line 173
    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 174
    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheIterator;->currentSubtree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 175
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->eof()Z

    move-result v0

    if-nez v0, :cond_0

    .line 176
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->parseEntry()V

    .line 178
    :cond_0
    return-void
.end method
