.class Lorg/eclipse/jgit/revwalk/StartGenerator;
.super Lorg/eclipse/jgit/revwalk/Generator;
.source "StartGenerator.java"


# instance fields
.field private final walker:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 0
    .parameter "w"

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/Generator;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 71
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 84
    .local v12, w:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevWalk;->getRevFilter()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v9

    .line 85
    .local v9, rf:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevWalk;->getTreeFilter()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v10

    .line 86
    .local v10, tf:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v8, v13, Lorg/eclipse/jgit/revwalk/RevWalk;->queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    .line 88
    .local v8, q:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;
    iget-object v13, v12, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v14, v12, Lorg/eclipse/jgit/revwalk/RevWalk;->roots:Ljava/util/ArrayList;

    invoke-virtual {v13, v12, v14}, Lorg/eclipse/jgit/lib/ObjectReader;->walkAdviceBeginCommits(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Collection;)V

    .line 90
    sget-object v13, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->MERGE_BASE:Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    if-ne v9, v13, :cond_1

    .line 94
    sget-object v13, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    if-eq v10, v13, :cond_0

    .line 95
    new-instance v13, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->cannotCombineTreeFilterWithRevFilter:Ljava/lang/String;

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v10, v15, v16

    const/16 v16, 0x1

    aput-object v9, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 98
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;

    invoke-direct {v5, v12}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 99
    .local v5, mbg:Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iput-object v5, v13, Lorg/eclipse/jgit/revwalk/RevWalk;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    .line 100
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v14, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->EMPTY_QUEUE:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    iput-object v14, v13, Lorg/eclipse/jgit/revwalk/RevWalk;->queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    .line 101
    invoke-virtual {v5, v8}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->init(Lorg/eclipse/jgit/revwalk/AbstractRevQueue;)V

    .line 102
    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    .line 183
    .end local v5           #mbg:Lorg/eclipse/jgit/revwalk/MergeBaseGenerator;
    :goto_0
    return-object v13

    .line 105
    :cond_1
    const/4 v13, 0x4

    invoke-virtual {v8, v13}, Lorg/eclipse/jgit/revwalk/AbstractRevQueue;->anybodyHasFlag(I)Z

    move-result v11

    .line 106
    .local v11, uninteresting:Z
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v14, Lorg/eclipse/jgit/revwalk/RevSort;->BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->hasRevSort(Lorg/eclipse/jgit/revwalk/RevSort;)Z

    move-result v1

    .line 108
    .local v1, boundary:Z
    if-nez v1, :cond_2

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    instance-of v13, v13, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    if-eqz v13, :cond_2

    .line 113
    const/4 v1, 0x1

    .line 115
    :cond_2
    if-eqz v1, :cond_3

    if-nez v11, :cond_3

    .line 120
    const/4 v1, 0x0

    .line 124
    :cond_3
    const/4 v7, 0x0

    .line 125
    .local v7, pendingOutputType:I
    instance-of v13, v8, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    if-eqz v13, :cond_8

    move-object v6, v8

    .line 126
    check-cast v6, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    .line 129
    .local v6, pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;
    :goto_1
    sget-object v13, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    if-eq v10, v13, :cond_4

    .line 130
    new-instance v13, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;

    invoke-direct {v13, v12, v10}, Lorg/eclipse/jgit/revwalk/RewriteTreeFilter;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    invoke-static {v13, v9}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;->create(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v9

    .line 131
    or-int/lit8 v7, v7, 0x2

    .line 132
    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevWalk;->getRewriteParents()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 133
    or-int/lit8 v7, v7, 0x4

    .line 136
    :cond_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    iput-object v8, v13, Lorg/eclipse/jgit/revwalk/RevWalk;->queue:Lorg/eclipse/jgit/revwalk/AbstractRevQueue;

    .line 138
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    instance-of v13, v13, Lorg/eclipse/jgit/revwalk/DepthWalk;

    if-eqz v13, :cond_9

    .line 139
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    check-cast v2, Lorg/eclipse/jgit/revwalk/DepthWalk;

    .line 140
    .local v2, dw:Lorg/eclipse/jgit/revwalk/DepthWalk;
    new-instance v3, Lorg/eclipse/jgit/revwalk/DepthGenerator;

    invoke-direct {v3, v2, v6}, Lorg/eclipse/jgit/revwalk/DepthGenerator;-><init>(Lorg/eclipse/jgit/revwalk/DepthWalk;Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 153
    .end local v2           #dw:Lorg/eclipse/jgit/revwalk/DepthWalk;
    .local v3, g:Lorg/eclipse/jgit/revwalk/Generator;
    :cond_5
    :goto_2
    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v13

    and-int/lit8 v13, v13, 0x4

    if-eqz v13, :cond_6

    .line 159
    new-instance v4, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v4, v3}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 160
    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .local v4, g:Lorg/eclipse/jgit/revwalk/Generator;
    new-instance v3, Lorg/eclipse/jgit/revwalk/RewriteGenerator;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/revwalk/RewriteGenerator;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 163
    .end local v4           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :cond_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v14, Lorg/eclipse/jgit/revwalk/RevSort;->TOPO:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->hasRevSort(Lorg/eclipse/jgit/revwalk/RevSort;)Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/Generator;->outputType()I

    move-result v13

    and-int/lit8 v13, v13, 0x8

    if-nez v13, :cond_7

    .line 165
    new-instance v4, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;

    invoke-direct {v4, v3}, Lorg/eclipse/jgit/revwalk/TopoSortGenerator;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v4       #g:Lorg/eclipse/jgit/revwalk/Generator;
    move-object v3, v4

    .line 166
    .end local v4           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :cond_7
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/StartGenerator;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v14, Lorg/eclipse/jgit/revwalk/RevSort;->REVERSE:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->hasRevSort(Lorg/eclipse/jgit/revwalk/RevSort;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 167
    new-instance v4, Lorg/eclipse/jgit/revwalk/LIFORevQueue;

    invoke-direct {v4, v3}, Lorg/eclipse/jgit/revwalk/LIFORevQueue;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 168
    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v4       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :goto_3
    if-eqz v1, :cond_a

    .line 169
    new-instance v3, Lorg/eclipse/jgit/revwalk/BoundaryGenerator;

    invoke-direct {v3, v12, v4}, Lorg/eclipse/jgit/revwalk/BoundaryGenerator;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 182
    .end local v4           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :goto_4
    iput-object v3, v12, Lorg/eclipse/jgit/revwalk/RevWalk;->pending:Lorg/eclipse/jgit/revwalk/Generator;

    .line 183
    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/Generator;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    goto/16 :goto_0

    .line 128
    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .end local v6           #pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;
    :cond_8
    new-instance v6, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-direct {v6, v8}, Lorg/eclipse/jgit/revwalk/DateRevQueue;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .restart local v6       #pending:Lorg/eclipse/jgit/revwalk/DateRevQueue;
    goto/16 :goto_1

    .line 142
    :cond_9
    new-instance v3, Lorg/eclipse/jgit/revwalk/PendingGenerator;

    invoke-direct {v3, v12, v6, v9, v7}, Lorg/eclipse/jgit/revwalk/PendingGenerator;-><init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/DateRevQueue;Lorg/eclipse/jgit/revwalk/filter/RevFilter;I)V

    .line 144
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    if-eqz v1, :cond_5

    move-object v13, v3

    .line 149
    check-cast v13, Lorg/eclipse/jgit/revwalk/PendingGenerator;

    const/4 v14, 0x0

    iput-boolean v14, v13, Lorg/eclipse/jgit/revwalk/PendingGenerator;->canDispose:Z

    goto :goto_2

    .line 170
    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v4       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :cond_a
    if-eqz v11, :cond_c

    .line 177
    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->peek()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    if-eqz v13, :cond_b

    .line 178
    new-instance v3, Lorg/eclipse/jgit/revwalk/DelayRevQueue;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/revwalk/DelayRevQueue;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .line 179
    .end local v4           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :goto_5
    new-instance v4, Lorg/eclipse/jgit/revwalk/FixUninterestingGenerator;

    invoke-direct {v4, v3}, Lorg/eclipse/jgit/revwalk/FixUninterestingGenerator;-><init>(Lorg/eclipse/jgit/revwalk/Generator;)V

    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v4       #g:Lorg/eclipse/jgit/revwalk/Generator;
    move-object v3, v4

    .end local v4           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    goto :goto_4

    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v4       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :cond_b
    move-object v3, v4

    .end local v4           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    goto :goto_5

    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v4       #g:Lorg/eclipse/jgit/revwalk/Generator;
    :cond_c
    move-object v3, v4

    .end local v4           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v3       #g:Lorg/eclipse/jgit/revwalk/Generator;
    goto :goto_4

    :cond_d
    move-object v4, v3

    .end local v3           #g:Lorg/eclipse/jgit/revwalk/Generator;
    .restart local v4       #g:Lorg/eclipse/jgit/revwalk/Generator;
    goto :goto_3
.end method

.method outputType()I
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    return v0
.end method
