.class abstract Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;
.super Ljava/lang/Object;
.source "BaseDirCacheEditor.java"


# instance fields
.field protected cache:Lorg/eclipse/jgit/dircache/DirCache;

.field protected entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

.field protected entryCnt:I


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/dircache/DirCache;I)V
    .locals 1
    .parameter "dc"
    .parameter "ecnt"

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 85
    new-array v0, p2, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 86
    return-void
.end method


# virtual methods
.method public commit()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->finish()V

    .line 198
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->write()V

    .line 199
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->commit()Z

    move-result v0

    return v0
.end method

.method protected fastAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 4
    .parameter "newEntry"

    .prologue
    const/4 v3, 0x0

    .line 108
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    array-length v1, v1

    iget v2, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    if-ne v1, v2, :cond_0

    .line 109
    iget v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    add-int/lit8 v1, v1, 0x10

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x2

    new-array v0, v1, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 110
    .local v0, n:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v2, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    iput-object v0, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 113
    .end local v0           #n:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v2, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    aput-object p1, v1, v2

    .line 114
    return-void
.end method

.method protected fastKeep(II)V
    .locals 6
    .parameter "pos"
    .parameter "cnt"

    .prologue
    const/4 v5, 0x0

    .line 137
    iget v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    add-int/2addr v3, p2

    iget-object v4, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    array-length v4, v4

    if-le v3, v4, :cond_0

    .line 138
    iget v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    add-int/lit8 v3, v3, 0x10

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v0, v3, 0x2

    .line 139
    .local v0, m1:I
    iget v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    add-int v1, v3, p2

    .line 140
    .local v1, m2:I
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v2, v3, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 141
    .local v2, n:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v4, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    iput-object v2, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 145
    .end local v0           #m1:I
    .end local v1           #m2:I
    .end local v2           #n:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    iget-object v4, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v5, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    invoke-virtual {v3, p1, v4, v5, p2}, Lorg/eclipse/jgit/dircache/DirCache;->toArray(I[Lorg/eclipse/jgit/dircache/DirCacheEntry;II)V

    .line 146
    iget v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    add-int/2addr v3, p2

    iput v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    .line 147
    return-void
.end method

.method public abstract finish()V
.end method

.method public getDirCache()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    return-object v0
.end method

.method protected replace()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 171
    iget v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    array-length v2, v2

    div-int/lit8 v2, v2, 0x2

    if-ge v1, v2, :cond_0

    .line 172
    iget v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    new-array v0, v1, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 173
    .local v0, n:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v2, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 174
    iput-object v0, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 176
    .end local v0           #n:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v3, p0, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->entryCnt:I

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCache;->replace([Lorg/eclipse/jgit/dircache/DirCacheEntry;I)V

    .line 177
    return-void
.end method
