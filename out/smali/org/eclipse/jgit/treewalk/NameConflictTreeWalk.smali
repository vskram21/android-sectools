.class public Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;
.super Lorg/eclipse/jgit/treewalk/TreeWalk;
.source "NameConflictTreeWalk.java"


# static fields
.field private static final TREE_MODE:I


# instance fields
.field private dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

.field private fastMinHasMatch:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v0

    sput v0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->TREE_MODE:I

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 0
    .parameter "or"

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 110
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 99
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 100
    return-void
.end method

.method private combineDF(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 8
    .parameter "minRef"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 248
    const/4 v5, 0x0

    .line 249
    .local v5, treeMatch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_4

    aget-object v4, v0, v2

    .line 250
    .local v4, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v6, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eq v6, p1, :cond_0

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 249
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 254
    :cond_1
    sget v6, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->TREE_MODE:I

    invoke-virtual {v4, p1, v6}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;I)I

    move-result v1

    .line 255
    .local v1, cmp:I
    if-gez v1, :cond_2

    .line 258
    iget v6, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    .line 259
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    .line 260
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 261
    iget v6, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->back(I)V

    .line 262
    iput v7, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    goto :goto_1

    .line 265
    :cond_2
    if-nez v1, :cond_3

    .line 268
    iput-object p1, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 269
    move-object v5, v4

    .line 270
    goto :goto_1

    .line 274
    :cond_3
    iget v6, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    if-eqz v6, :cond_0

    .line 275
    iget v6, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->back(I)V

    .line 276
    iput v7, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    goto :goto_1

    .line 283
    .end local v1           #cmp:I
    .end local v4           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_4
    if-eqz v5, :cond_8

    .line 288
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v3, v0

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v3, :cond_6

    aget-object v4, v0, v2

    .line 289
    .restart local v4       #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v6, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v6, p1, :cond_5

    .line 290
    iput-object v5, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 288
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 292
    .end local v4           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_6
    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-nez v6, :cond_7

    .line 293
    iput-object v5, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 298
    .end local v5           #treeMatch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_7
    :goto_3
    return-object v5

    .restart local v5       #treeMatch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_8
    move-object v5, p1

    goto :goto_3
.end method

.method private fastMin()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 137
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMinHasMatch:Z

    .line 139
    const/4 v2, 0x0

    .line 140
    .local v2, i:I
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v4, v8, v2

    .line 141
    .local v4, minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_0
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v8

    if-eqz v8, :cond_0

    add-int/lit8 v2, v2, 0x1

    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v8, v8

    if-ge v2, v8, :cond_0

    .line 142
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v4, v8, v2

    goto :goto_0

    .line 143
    :cond_0
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v8

    if-eqz v8, :cond_1

    move-object v5, v4

    .line 196
    .end local v4           #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .local v5, minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_1
    return-object v5

    .line 146
    .end local v5           #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v4       #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    const/4 v1, 0x0

    .line 147
    .local v1, hasConflict:Z
    iput-object v4, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 148
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v8, v8

    if-ge v2, v8, :cond_9

    .line 149
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v7, v8, v2

    .line 150
    .local v7, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v8

    if-nez v8, :cond_2

    .line 153
    invoke-virtual {v7, v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    move-result v0

    .line 154
    .local v0, cmp:I
    if-gez v0, :cond_4

    .line 155
    iget-boolean v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMinHasMatch:Z

    if-eqz v8, :cond_3

    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-static {v7}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-nez v8, :cond_3

    invoke-static {v4, v7}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->nameEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 161
    iput-object v4, v7, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 162
    const/4 v1, 0x1

    goto :goto_2

    .line 164
    :cond_3
    iput-boolean v9, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMinHasMatch:Z

    .line 165
    iput-object v7, v7, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 166
    move-object v4, v7

    goto :goto_2

    .line 168
    :cond_4
    if-nez v0, :cond_5

    .line 171
    iput-object v4, v7, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_2

    .line 172
    :cond_5
    iget-boolean v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMinHasMatch:Z

    if-eqz v8, :cond_8

    invoke-static {v7}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-nez v8, :cond_8

    invoke-static {v7, v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->nameEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 182
    const/4 v3, 0x0

    .local v3, k:I
    :goto_3
    if-ge v3, v2, :cond_7

    .line 183
    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v6, v8, v3

    .line 184
    .local v6, p:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v8, v6, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v8, v4, :cond_6

    .line 185
    iput-object v7, v6, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 182
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 187
    .end local v6           #p:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_7
    iput-object v7, v7, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 188
    move-object v4, v7

    .line 189
    const/4 v1, 0x1

    goto :goto_2

    .line 191
    .end local v3           #k:I
    :cond_8
    iput-boolean v9, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMinHasMatch:Z

    goto :goto_2

    .line 194
    .end local v0           #cmp:I
    .end local v7           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_9
    if-eqz v1, :cond_a

    iget-boolean v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMinHasMatch:Z

    if-eqz v8, :cond_a

    iget-object v8, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-nez v8, :cond_a

    .line 195
    iput-object v4, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    :cond_a
    move-object v5, v4

    .line 196
    .end local v4           #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v5       #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    goto :goto_1
.end method

.method private static isTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z
    .locals 2
    .parameter "p"

    .prologue
    .line 205
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    return v0
.end method

.method private static nameEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 201
    sget v0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->TREE_MODE:I

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private skipEntry(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z
    .locals 9
    .parameter "minRef"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 213
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_5

    aget-object v5, v0, v2

    .line 214
    .local v5, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v8, v5, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eq v8, p1, :cond_0

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->first()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 213
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 217
    :cond_1
    const/4 v4, 0x0

    .line 219
    .local v4, stepsBack:I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 220
    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->back(I)V

    .line 222
    invoke-virtual {v5, p1, v7}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;I)I

    move-result v1

    .line 223
    .local v1, cmp:I
    if-nez v1, :cond_3

    .line 226
    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    .line 239
    .end local v1           #cmp:I
    .end local v4           #stepsBack:I
    .end local v5           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_2
    return v6

    .line 228
    .restart local v1       #cmp:I
    .restart local v4       #stepsBack:I
    .restart local v5       #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_3
    if-ltz v1, :cond_4

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->first()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 231
    :cond_4
    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    goto :goto_1

    .end local v1           #cmp:I
    .end local v4           #stepsBack:I
    .end local v5           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_5
    move v6, v7

    .line 239
    goto :goto_2
.end method


# virtual methods
.method public isDirectoryFileConflict()Z
    .locals 1

    .prologue
    .line 356
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method min()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 115
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMin()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v3

    .line 116
    .local v3, minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-boolean v5, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->fastMinHasMatch:Z

    if-eqz v5, :cond_2

    .line 132
    .end local v3           #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    :goto_0
    return-object v3

    .line 119
    .restart local v3       #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_2
    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 120
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->skipEntry(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 121
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 122
    .local v4, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v5, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v5, v3, :cond_3

    .line 123
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    .line 124
    const/4 v5, 0x0

    iput-object v5, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 121
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 132
    .end local v0           #arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v4           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_4
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->combineDF(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v3

    goto :goto_0
.end method

.method popEntriesEqual()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 303
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 304
    .local v0, ch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 305
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v2, v3, v1

    .line 306
    .local v2, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v3, v0, :cond_0

    .line 307
    iget v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    if-nez v3, :cond_1

    .line 308
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    .line 313
    :goto_1
    iput-object v4, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 304
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 310
    :cond_1
    iget v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->back(I)V

    .line 311
    const/4 v3, 0x0

    iput v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    goto :goto_1

    .line 317
    .end local v2           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v0, v3, :cond_3

    .line 318
    iput-object v4, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 319
    :cond_3
    return-void
.end method

.method skipEntriesEqual()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 323
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 324
    .local v0, ch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 325
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v2, v3, v1

    .line 326
    .local v2, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v3, v0, :cond_0

    .line 327
    iget v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    if-nez v3, :cond_1

    .line 328
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->skip()V

    .line 333
    :goto_1
    iput-object v4, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 324
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 330
    :cond_1
    iget v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->back(I)V

    .line 331
    const/4 v3, 0x0

    iput v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    goto :goto_1

    .line 337
    .end local v2           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v0, v3, :cond_3

    .line 338
    iput-object v4, p0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->dfConflict:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 339
    :cond_3
    return-void
.end method
