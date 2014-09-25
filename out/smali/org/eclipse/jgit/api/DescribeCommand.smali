.class public Lorg/eclipse/jgit/api/DescribeCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "DescribeCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private maxCandidates:I

.field private target:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private final w:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 86
    const/16 v0, 0xa

    iput v0, p0, Lorg/eclipse/jgit/api/DescribeCommand;->maxCandidates:I

    .line 94
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 96
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/api/DescribeCommand;)Lorg/eclipse/jgit/revwalk/RevWalk;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DescribeCommand;->call()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 153
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/DescribeCommand;->checkCallable()V

    .line 155
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->target:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v18, v0

    if-nez v18, :cond_0

    .line 156
    const-string v18, "HEAD"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/DescribeCommand;->setTarget(Ljava/lang/String;)Lorg/eclipse/jgit/api/DescribeCommand;

    .line 158
    :cond_0
    new-instance v17, Ljava/util/HashMap;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashMap;-><init>()V

    .line 160
    .local v17, tags:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Ref;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v18

    const-string v19, "refs/tags/"

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/eclipse/jgit/lib/Ref;

    .line 161
    .local v14, r:Lorg/eclipse/jgit/lib/Ref;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Lorg/eclipse/jgit/lib/Repository;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    .line 162
    .local v10, key:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v10, :cond_1

    .line 163
    invoke-interface {v14}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    .line 164
    :cond_1
    move-object/from16 v0, v17

    invoke-interface {v0, v10, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 278
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v10           #key:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v14           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v17           #tags:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Ref;>;"
    :catch_0
    move-exception v8

    .line 279
    .local v8, e:Ljava/io/IOException;
    :try_start_1
    new-instance v18, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v8}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v18
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 281
    .end local v8           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v18

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/DescribeCommand;->setCallable(Z)V

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v18

    .line 168
    .restart local v9       #i$:Ljava/util/Iterator;
    .restart local v17       #tags:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_2
    :try_start_2
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {v2}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>()V

    .line 209
    .local v2, allFlags:Lorg/eclipse/jgit/revwalk/RevFlagSet;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 212
    .local v6, candidates:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->target:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v18, v0

    invoke-interface/range {v17 .. v18}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/eclipse/jgit/lib/Ref;

    .line 213
    .local v12, lucky:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v12, :cond_3

    .line 214
    invoke-interface {v12}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v18

    const-string v19, "refs/tags/"

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v18

    .line 281
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/DescribeCommand;->setCallable(Z)V

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .end local v9           #i$:Ljava/util/Iterator;
    :goto_1
    return-object v18

    .line 216
    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_3
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->target:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 218
    const/4 v15, 0x0

    .line 220
    .local v15, seen:I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    .local v5, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v5, :cond_7

    .line 221
    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->hasAny(Lorg/eclipse/jgit/revwalk/RevFlagSet;)Z

    move-result v18

    if-nez v18, :cond_4

    .line 225
    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/lib/Ref;

    .line 226
    .local v16, t:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v16, :cond_4

    .line 227
    new-instance v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v7, v0, v5, v1, v2}, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;-><init>(Lorg/eclipse/jgit/api/DescribeCommand;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    .line 228
    .local v7, cd:Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    iput v15, v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    .line 235
    .end local v7           #cd:Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
    .end local v16           #t:Lorg/eclipse/jgit/lib/Ref;
    :cond_4
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_5
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;

    .line 236
    .restart local v7       #cd:Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
    invoke-virtual {v7, v5}, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->reaches(Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v18

    if-nez v18, :cond_5

    .line 237
    iget v0, v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    iput v0, v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    goto :goto_3

    .line 243
    .end local v7           #cd:Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
    :cond_6
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v18

    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->maxCandidates:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_8

    .line 254
    .end local v9           #i$:Ljava/util/Iterator;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 255
    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->hasAll(Lorg/eclipse/jgit/revwalk/RevFlagSet;)Z

    move-result v18

    if-eqz v18, :cond_9

    .line 257
    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    .local v3, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v11, v3

    .local v11, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    :goto_4
    if-ge v9, v11, :cond_7

    aget-object v13, v3, v9

    .line 258
    .local v13, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    sget-object v18, Lorg/eclipse/jgit/revwalk/RevFlag;->SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 257
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 249
    .end local v3           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v11           #len$:I
    .end local v13           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    .local v9, i$:Ljava/util/Iterator;
    :cond_8
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_2

    .line 260
    .end local v9           #i$:Ljava/util/Iterator;
    :cond_9
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_a
    :goto_5
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;

    .line 261
    .restart local v7       #cd:Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
    invoke-virtual {v7, v5}, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->reaches(Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v18

    if-nez v18, :cond_a

    .line 262
    iget v0, v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    iput v0, v7, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->depth:I

    goto :goto_5

    .line 268
    .end local v7           #cd:Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
    .end local v9           #i$:Ljava/util/Iterator;
    :cond_b
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result v18

    if-eqz v18, :cond_c

    .line 269
    const/16 v18, 0x0

    .line 281
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/DescribeCommand;->setCallable(Z)V

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_1

    .line 271
    :cond_c
    :try_start_4
    new-instance v18, Lorg/eclipse/jgit/api/DescribeCommand$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/DescribeCommand$1;-><init>(Lorg/eclipse/jgit/api/DescribeCommand;)V

    move-object/from16 v0, v18

    invoke-static {v6, v0}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;

    .line 277
    .local v4, best:Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->target:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/api/DescribeCommand$1Candidate;->describe(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v18

    .line 281
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/DescribeCommand;->setCallable(Z)V

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_1
.end method

.method public setTarget(Ljava/lang/String;)Lorg/eclipse/jgit/api/DescribeCommand;
    .locals 5
    .parameter "rev"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v1, p0, Lorg/eclipse/jgit/api/DescribeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 133
    .local v0, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v0, :cond_0

    .line 134
    new-instance v1, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 135
    :cond_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/DescribeCommand;->setTarget(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/api/DescribeCommand;

    move-result-object v1

    return-object v1
.end method

.method public setTarget(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/api/DescribeCommand;
    .locals 1
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand;->w:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/DescribeCommand;->target:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 113
    return-object p0
.end method
