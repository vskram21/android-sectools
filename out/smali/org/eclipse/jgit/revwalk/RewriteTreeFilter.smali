.class Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "RewriteTreeFilter.java"


# static fields
.field private static final PARSED:I = 0x1

.field private static final REWRITE:I = 0x8

.field private static final UNINTERESTING:I = 0x4


# instance fields
.field private final pathFilter:Lorg/eclipse/jgit/treewalk/TreeWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 2
    .parameter "walker"
    .parameter "t"

    .prologue
    .line 85
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    .line 86
    new-instance v0, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v1, p1, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->pathFilter:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 87
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->pathFilter:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 88
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->pathFilter:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->shouldBeRecursive()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 89
    return-void
.end method

.method private static isRename(Lorg/eclipse/jgit/diff/DiffEntry;)Z
    .locals 2
    .parameter "ent"

    .prologue
    .line 265
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateFollowFilter([Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/diff/DiffConfig;)V
    .locals 10
    .parameter "trees"
    .parameter "cfg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->pathFilter:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 239
    .local v7, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFilter()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/revwalk/FollowFilter;

    .line 240
    .local v5, oldFilter:Lorg/eclipse/jgit/revwalk/FollowFilter;
    sget-object v8, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 241
    invoke-virtual {v7, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset([Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 243
    invoke-static {v7}, Lorg/eclipse/jgit/diff/DiffEntry;->scan(Lorg/eclipse/jgit/treewalk/TreeWalk;)Ljava/util/List;

    move-result-object v2

    .line 244
    .local v2, files:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    new-instance v6, Lorg/eclipse/jgit/diff/RenameDetector;

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v8

    invoke-direct {v6, v8, p2}, Lorg/eclipse/jgit/diff/RenameDetector;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/diff/DiffConfig;)V

    .line 245
    .local v6, rd:Lorg/eclipse/jgit/diff/RenameDetector;
    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/diff/RenameDetector;->addAll(Ljava/util/Collection;)V

    .line 246
    invoke-virtual {v6}, Lorg/eclipse/jgit/diff/RenameDetector;->compute()Ljava/util/List;

    move-result-object v2

    .line 248
    move-object v4, v5

    .line 249
    .local v4, newFilter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 250
    .local v1, ent:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-static {v1}, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->isRename(Lorg/eclipse/jgit/diff/DiffEntry;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/FollowFilter;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 251
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, p2}, Lorg/eclipse/jgit/revwalk/FollowFilter;->create(Ljava/lang/String;Lorg/eclipse/jgit/diff/DiffConfig;)Lorg/eclipse/jgit/revwalk/FollowFilter;

    move-result-object v4

    .line 252
    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/FollowFilter;->getRenameCallback()Lorg/eclipse/jgit/revwalk/RenameCallback;

    move-result-object v0

    .line 253
    .local v0, callback:Lorg/eclipse/jgit/revwalk/RenameCallback;
    if-eqz v0, :cond_1

    .line 254
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RenameCallback;->renamed(Lorg/eclipse/jgit/diff/DiffEntry;)V

    move-object v8, v4

    .line 256
    check-cast v8, Lorg/eclipse/jgit/revwalk/FollowFilter;

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/revwalk/FollowFilter;->setRenameCallback(Lorg/eclipse/jgit/revwalk/RenameCallback;)V

    .line 261
    .end local v0           #callback:Lorg/eclipse/jgit/revwalk/RenameCallback;
    .end local v1           #ent:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_1
    invoke-virtual {v7, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 262
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
    .line 76
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 1

    .prologue
    .line 93
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 15
    .parameter "walker"
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/StopWalkException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    move-object/from16 v0, p2

    iget-object v8, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 103
    .local v8, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v6, v8

    .line 104
    .local v6, nParents:I
    iget-object v12, p0, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->pathFilter:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 105
    .local v12, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    add-int/lit8 v13, v6, 0x1

    new-array v11, v13, [Lorg/eclipse/jgit/lib/ObjectId;

    .line 106
    .local v11, trees:[Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v6, :cond_1

    .line 107
    move-object/from16 v0, p2

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v7, v13, v4

    .line 108
    .local v7, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v13, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v13, v13, 0x1

    if-nez v13, :cond_0

    .line 109
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 110
    :cond_0
    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v13

    aput-object v13, v11, v4

    .line 106
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 112
    .end local v7           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v13

    aput-object v13, v11, v6

    .line 113
    invoke-virtual {v12, v11}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset([Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 115
    const/4 v13, 0x1

    if-ne v6, v13, :cond_5

    .line 118
    const/4 v2, 0x0

    .local v2, chgs:I
    const/4 v1, 0x0

    .line 119
    .local v1, adds:I
    :goto_1
    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 120
    add-int/lit8 v2, v2, 0x1

    .line 121
    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v13

    if-nez v13, :cond_2

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v13

    if-eqz v13, :cond_2

    .line 122
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 127
    :cond_2
    if-nez v2, :cond_3

    .line 131
    move-object/from16 v0, p2

    iget v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v13, v13, 0x8

    move-object/from16 v0, p2

    iput v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 132
    const/4 v13, 0x0

    .line 227
    .end local v1           #adds:I
    .end local v2           #chgs:I
    :goto_2
    return v13

    .line 137
    .restart local v1       #adds:I
    .restart local v2       #chgs:I
    :cond_3
    if-lez v1, :cond_4

    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFilter()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v13

    instance-of v13, v13, Lorg/eclipse/jgit/revwalk/FollowFilter;

    if-eqz v13, :cond_4

    .line 142
    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFilter()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v13

    check-cast v13, Lorg/eclipse/jgit/revwalk/FollowFilter;

    iget-object v13, v13, Lorg/eclipse/jgit/revwalk/FollowFilter;->cfg:Lorg/eclipse/jgit/diff/DiffConfig;

    invoke-direct {p0, v11, v13}, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;->updateFollowFilter([Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/diff/DiffConfig;)V

    .line 144
    :cond_4
    const/4 v13, 0x1

    goto :goto_2

    .line 146
    .end local v1           #adds:I
    .end local v2           #chgs:I
    :cond_5
    if-nez v6, :cond_7

    .line 150
    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 151
    const/4 v13, 0x1

    goto :goto_2

    .line 152
    :cond_6
    move-object/from16 v0, p2

    iget v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v13, v13, 0x8

    move-object/from16 v0, p2

    iput v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 153
    const/4 v13, 0x0

    goto :goto_2

    .line 161
    :cond_7
    new-array v2, v6, [I

    .line 162
    .local v2, chgs:[I
    new-array v1, v6, [I

    .line 163
    .local v1, adds:[I
    :cond_8
    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v13

    if-eqz v13, :cond_b

    .line 164
    invoke-virtual {v12, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v5

    .line 165
    .local v5, myMode:I
    const/4 v4, 0x0

    :goto_3
    if-ge v4, v6, :cond_8

    .line 166
    invoke-virtual {v12, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v9

    .line 167
    .local v9, pMode:I
    if-ne v5, v9, :cond_a

    invoke-virtual {v12, v4, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->idEqual(II)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 165
    :cond_9
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 170
    :cond_a
    aget v13, v2, v4

    add-int/lit8 v13, v13, 0x1

    aput v13, v2, v4

    .line 171
    if-nez v9, :cond_9

    if-eqz v5, :cond_9

    .line 172
    aget v13, v1, v4

    add-int/lit8 v13, v13, 0x1

    aput v13, v1, v4

    goto :goto_4

    .line 176
    .end local v5           #myMode:I
    .end local v9           #pMode:I
    :cond_b
    const/4 v10, 0x0

    .line 177
    .local v10, same:Z
    const/4 v3, 0x0

    .line 178
    .local v3, diff:Z
    const/4 v4, 0x0

    :goto_5
    if-ge v4, v6, :cond_f

    .line 179
    aget v13, v2, v4

    if-nez v13, :cond_d

    .line 185
    aget-object v7, v8, v4

    .line 186
    .restart local v7       #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v13, v7, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v13, v13, 0x4

    if-eqz v13, :cond_c

    .line 191
    const/4 v10, 0x1

    .line 178
    .end local v7           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 195
    .restart local v7       #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_c
    move-object/from16 v0, p2

    iget v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v13, v13, 0x8

    move-object/from16 v0, p2

    iput v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 196
    const/4 v13, 0x1

    new-array v13, v13, [Lorg/eclipse/jgit/revwalk/RevCommit;

    const/4 v14, 0x0

    aput-object v7, v13, v14

    move-object/from16 v0, p2

    iput-object v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 197
    const/4 v13, 0x0

    goto/16 :goto_2

    .line 200
    .end local v7           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_d
    aget v13, v2, v4

    aget v14, v1, v4

    if-ne v13, v14, :cond_e

    .line 206
    aget-object v13, v8, v4

    sget-object v14, Lorg/eclipse/jgit/revwalk/RevCommit;->NO_PARENTS:[Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v14, v13, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 211
    :cond_e
    const/4 v3, 0x1

    goto :goto_6

    .line 214
    :cond_f
    if-eqz v3, :cond_10

    if-nez v10, :cond_10

    .line 219
    const/4 v13, 0x1

    goto/16 :goto_2

    .line 226
    :cond_10
    move-object/from16 v0, p2

    iget v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v13, v13, 0x8

    move-object/from16 v0, p2

    iput v13, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 227
    const/4 v13, 0x0

    goto/16 :goto_2
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    return v0
.end method
