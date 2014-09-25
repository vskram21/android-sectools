.class public Lorg/eclipse/jgit/dircache/DirCacheEditor;
.super Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;
.source "DirCacheEditor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/dircache/DirCacheEditor$DeletePath;,
        Lorg/eclipse/jgit/dircache/DirCacheEditor$DeleteTree;,
        Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
    }
.end annotation


# static fields
.field private static final EDIT_CMP:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final edits:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 71
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEditor$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/dircache/DirCacheEditor$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->EDIT_CMP:Ljava/util/Comparator;

    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/dircache/DirCache;I)V
    .locals 1
    .parameter "dc"
    .parameter "ecnt"

    .prologue
    .line 91
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;-><init>(Lorg/eclipse/jgit/dircache/DirCache;I)V

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->edits:Ljava/util/List;

    .line 93
    return-void
.end method

.method private applyEdits()V
    .locals 14

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 128
    iget-object v11, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->edits:Ljava/util/List;

    sget-object v12, Lorg/eclipse/jgit/dircache/DirCacheEditor;->EDIT_CMP:Ljava/util/Comparator;

    invoke-static {v11, v12}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 130
    iget-object v11, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v11}, Lorg/eclipse/jgit/dircache/DirCache;->getEntryCount()I

    move-result v7

    .line 131
    .local v7, maxIdx:I
    const/4 v6, 0x0

    .line 132
    .local v6, lastIdx:I
    iget-object v11, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->edits:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;

    .line 133
    .local v1, e:Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
    iget-object v11, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    iget-object v12, v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    iget-object v13, v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    array-length v13, v13

    invoke-virtual {v11, v12, v13}, Lorg/eclipse/jgit/dircache/DirCache;->findEntry([BI)I

    move-result v2

    .line 134
    .local v2, eIdx:I
    if-gez v2, :cond_3

    move v8, v9

    .line 135
    .local v8, missing:Z
    :goto_1
    if-gez v2, :cond_1

    .line 136
    add-int/lit8 v11, v2, 0x1

    neg-int v2, v11

    .line 137
    :cond_1
    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v11

    sub-int v0, v11, v6

    .line 138
    .local v0, cnt:I
    if-lez v0, :cond_2

    .line 139
    invoke-virtual {p0, v6, v0}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->fastKeep(II)V

    .line 140
    :cond_2
    if-eqz v8, :cond_4

    move v6, v2

    .line 142
    :goto_2
    instance-of v11, v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$DeletePath;

    if-nez v11, :cond_0

    .line 144
    instance-of v11, v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$DeleteTree;

    if-eqz v11, :cond_5

    .line 145
    iget-object v11, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    iget-object v12, v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    iget-object v13, v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    array-length v13, v13

    invoke-virtual {v11, v12, v13, v2}, Lorg/eclipse/jgit/dircache/DirCache;->nextEntry([BII)I

    move-result v6

    .line 146
    goto :goto_0

    .end local v0           #cnt:I
    .end local v8           #missing:Z
    :cond_3
    move v8, v10

    .line 134
    goto :goto_1

    .line 140
    .restart local v0       #cnt:I
    .restart local v8       #missing:Z
    :cond_4
    iget-object v11, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v11, v2}, Lorg/eclipse/jgit/dircache/DirCache;->nextEntry(I)I

    move-result v6

    goto :goto_2

    .line 149
    :cond_5
    if-eqz v8, :cond_7

    .line 150
    new-instance v3, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget-object v11, v1, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->path:[B

    invoke-direct {v3, v11}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 151
    .local v3, ent:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->apply(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 152
    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getRawMode()I

    move-result v11

    if-nez v11, :cond_6

    .line 153
    new-instance v11, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->fileModeNotSetForPath:Ljava/lang/String;

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v9, v10

    invoke-static {v12, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v11, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 155
    :cond_6
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->fastAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_0

    .line 158
    .end local v3           #ent:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_7
    move v4, v2

    .local v4, i:I
    :goto_3
    if-ge v4, v6, :cond_0

    .line 159
    iget-object v11, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v11, v4}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(I)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v3

    .line 160
    .restart local v3       #ent:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;->apply(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 161
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->fastAdd(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 158
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 166
    .end local v0           #cnt:I
    .end local v1           #e:Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
    .end local v2           #eIdx:I
    .end local v3           #ent:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v4           #i:I
    .end local v8           #missing:Z
    :cond_8
    sub-int v0, v7, v6

    .line 167
    .restart local v0       #cnt:I
    if-lez v0, :cond_9

    .line 168
    invoke-virtual {p0, v6, v0}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->fastKeep(II)V

    .line 169
    :cond_9
    return-void
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;)V
    .locals 1
    .parameter "edit"

    .prologue
    .line 106
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->edits:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    return-void
.end method

.method public commit()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->edits:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 115
    const/4 v0, 0x1

    .line 117
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->commit()Z

    move-result v0

    goto :goto_0
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEditor;->edits:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->applyEdits()V

    .line 123
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->replace()V

    .line 125
    :cond_0
    return-void
.end method

.method public bridge synthetic getDirCache()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 1

    .prologue
    .line 70
    invoke-super {p0}, Lorg/eclipse/jgit/dircache/BaseDirCacheEditor;->getDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    return-object v0
.end method
