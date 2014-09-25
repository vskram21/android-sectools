.class public Lorg/eclipse/jgit/merge/RecursiveMerger;
.super Lorg/eclipse/jgit/merge/ResolveMerger;
.source "RecursiveMerger.java"


# instance fields
.field public final MAX_BASES:I

.field private ident:Lorg/eclipse/jgit/lib/PersonIdent;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "local"

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/merge/RecursiveMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;Z)V

    .line 113
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;Z)V
    .locals 2
    .parameter "local"
    .parameter "inCore"

    .prologue
    .line 103
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/merge/ResolveMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;Z)V

    .line 91
    const/16 v0, 0xc8

    iput v0, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->MAX_BASES:I

    .line 93
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    iget-object v1, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->ident:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 104
    return-void
.end method

.method private createCommitForTree(Lorg/eclipse/jgit/lib/ObjectId;Ljava/util/List;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 5
    .parameter "tree"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;)",
            "Lorg/eclipse/jgit/revwalk/RevCommit;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    .local p2, parents:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    new-instance v0, Lorg/eclipse/jgit/lib/CommitBuilder;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/CommitBuilder;-><init>()V

    .line 234
    .local v0, c:Lorg/eclipse/jgit/lib/CommitBuilder;
    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentIds(Ljava/util/List;)V

    .line 235
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/CommitBuilder;->setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 236
    iget-object v4, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->ident:Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/lib/CommitBuilder;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 237
    iget-object v4, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->ident:Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/lib/CommitBuilder;->setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 238
    iget-object v4, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v2

    .line 239
    .local v2, odi:Lorg/eclipse/jgit/lib/ObjectInserter;
    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 240
    .local v1, newCommitId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 241
    iget-object v4, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    .line 242
    .local v3, ret:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget-object v4, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 243
    return-object v3
.end method

.method private dircacheFromTree(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/dircache/DirCache;
    .locals 6
    .parameter "treeId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 256
    invoke-static {}, Lorg/eclipse/jgit/dircache/DirCache;->newInCore()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v2

    .line 257
    .local v2, ret:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v0

    .line 258
    .local v0, builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    new-instance v3, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/merge/RecursiveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 259
    .local v3, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 260
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 261
    :goto_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 262
    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v4

    invoke-direct {v1, v4}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 263
    .local v1, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 264
    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 265
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_0

    .line 267
    .end local v1           #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->finish()V

    .line 268
    return-object v2
.end method


# virtual methods
.method protected getBaseCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "a"
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jgit/merge/RecursiveMerger;->getBaseCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method protected getBaseCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;I)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 16
    .parameter "a"
    .parameter "b"
    .parameter "callDepth"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .local v1, baseCommits:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 152
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v11, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->MERGE_BASE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 153
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 154
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 156
    :goto_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .local v2, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v2, :cond_0

    .line 157
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 159
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 160
    const/4 v10, 0x0

    .line 216
    :goto_1
    return-object v10

    .line 161
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_2

    .line 162
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/revwalk/RevCommit;

    goto :goto_1

    .line 163
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/16 v11, 0xc8

    if-lt v10, v11, :cond_3

    .line 164
    new-instance v10, Lorg/eclipse/jgit/errors/NoMergeBaseException;

    sget-object v11, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->TOO_MANY_MERGE_BASES:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->mergeRecursiveTooManyMergeBasesFor:Ljava/lang/String;

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const/16 v15, 0xc8

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/errors/NoMergeBaseException;-><init>(Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;Ljava/lang/String;)V

    throw v10

    .line 175
    :cond_3
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 176
    .local v4, currentBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 177
    .local v6, oldDircache:Lorg/eclipse/jgit/dircache/DirCache;
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->inCore:Z

    .line 178
    .local v7, oldIncore:Z
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 179
    .local v8, oldWTreeIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    const/4 v10, 0x0

    move-object/from16 v0, p0

    iput-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 181
    :try_start_0
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v10

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/eclipse/jgit/merge/RecursiveMerger;->dircacheFromTree(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v10

    move-object/from16 v0, p0

    iput-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 182
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->inCore:Z

    .line 184
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v9, parents:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    invoke-interface {v9, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    const/4 v3, 0x1

    .local v3, commitIdx:I
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v3, v10, :cond_6

    .line 187
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 188
    .local v5, nextBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    const/16 v10, 0xc8

    if-lt v3, v10, :cond_4

    .line 189
    new-instance v10, Lorg/eclipse/jgit/errors/NoMergeBaseException;

    sget-object v11, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->TOO_MANY_MERGE_BASES:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->mergeRecursiveTooManyMergeBasesFor:Ljava/lang/String;

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const/16 v15, 0xc8

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/errors/NoMergeBaseException;-><init>(Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;Ljava/lang/String;)V

    throw v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    .end local v3           #commitIdx:I
    .end local v5           #nextBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v9           #parents:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    :catchall_0
    move-exception v10

    move-object/from16 v0, p0

    iput-boolean v7, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->inCore:Z

    .line 213
    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 214
    move-object/from16 v0, p0

    iput-object v8, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 212
    throw v10

    .line 195
    .restart local v3       #commitIdx:I
    .restart local v5       #nextBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v9       #parents:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    :cond_4
    :try_start_1
    invoke-interface {v9, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    add-int/lit8 v10, p3, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v10}, Lorg/eclipse/jgit/merge/RecursiveMerger;->getBaseCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v10

    invoke-virtual {v10}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/eclipse/jgit/merge/RecursiveMerger;->openTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v10

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v11

    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11, v12}, Lorg/eclipse/jgit/merge/RecursiveMerger;->mergeTrees(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/revwalk/RevTree;Lorg/eclipse/jgit/revwalk/RevTree;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 201
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v9}, Lorg/eclipse/jgit/merge/RecursiveMerger;->createCommitForTree(Lorg/eclipse/jgit/lib/ObjectId;Ljava/util/List;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .line 186
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_2

    .line 203
    :cond_5
    new-instance v10, Lorg/eclipse/jgit/errors/NoMergeBaseException;

    sget-object v11, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->CONFLICTS_DURING_MERGE_BASE_CALCULATION:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->mergeRecursiveTooManyMergeBasesFor:Ljava/lang/String;

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const/16 v15, 0xc8

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/errors/NoMergeBaseException;-><init>(Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 212
    .end local v5           #nextBase:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_6
    move-object/from16 v0, p0

    iput-boolean v7, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->inCore:Z

    .line 213
    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 214
    move-object/from16 v0, p0

    iput-object v8, v0, Lorg/eclipse/jgit/merge/RecursiveMerger;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-object v10, v4

    .line 216
    goto/16 :goto_1
.end method
