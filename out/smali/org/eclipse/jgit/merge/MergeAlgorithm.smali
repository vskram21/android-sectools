.class public final Lorg/eclipse/jgit/merge/MergeAlgorithm;
.super Ljava/lang/Object;
.source "MergeAlgorithm.java"


# static fields
.field private static final END_EDIT:Lorg/eclipse/jgit/diff/Edit;


# instance fields
.field private final diffAlg:Lorg/eclipse/jgit/diff/DiffAlgorithm;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const v1, 0x7fffffff

    .line 85
    new-instance v0, Lorg/eclipse/jgit/diff/Edit;

    invoke-direct {v0, v1, v1}, Lorg/eclipse/jgit/diff/Edit;-><init>(II)V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeAlgorithm;->END_EDIT:Lorg/eclipse/jgit/diff/Edit;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 70
    new-instance v0, Lorg/eclipse/jgit/diff/HistogramDiff;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/HistogramDiff;-><init>()V

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/merge/MergeAlgorithm;-><init>(Lorg/eclipse/jgit/diff/DiffAlgorithm;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/diff/DiffAlgorithm;)V
    .locals 0
    .parameter "diff"

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Lorg/eclipse/jgit/merge/MergeAlgorithm;->diffAlg:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 81
    return-void
.end method

.method private static nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/diff/Edit;",
            ">;)",
            "Lorg/eclipse/jgit/diff/Edit;"
        }
    .end annotation

    .prologue
    .line 318
    .local p0, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/diff/Edit;>;"
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/eclipse/jgit/merge/MergeAlgorithm;->END_EDIT:Lorg/eclipse/jgit/diff/Edit;

    goto :goto_0
.end method


# virtual methods
.method public merge(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/merge/MergeResult;
    .locals 28
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(",
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<TS;>;TS;TS;TS;)",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, cmp:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<TS;>;"
    .local p2, base:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    .local p3, ours:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    .local p4, theirs:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    new-instance v19, Ljava/util/ArrayList;

    const/16 v24, 0x3

    move-object/from16 v0, v19

    move/from16 v1, v24

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 102
    .local v19, sequences:Ljava/util/List;,"Ljava/util/List<TS;>;"
    move-object/from16 v0, v19

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    move-object/from16 v0, v19

    move-object/from16 v1, p4

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    new-instance v18, Lorg/eclipse/jgit/merge/MergeResult;

    invoke-direct/range {v18 .. v19}, Lorg/eclipse/jgit/merge/MergeResult;-><init>(Ljava/util/List;)V

    .line 107
    .local v18, result:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<TS;>;"
    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v24

    if-nez v24, :cond_3

    .line 108
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v24

    if-eqz v24, :cond_2

    .line 109
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/merge/MergeAlgorithm;->diffAlg:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v22

    .line 110
    .local v22, theirsEdits:Lorg/eclipse/jgit/diff/EditList;
    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/diff/EditList;->isEmpty()Z

    move-result v24

    if-nez v24, :cond_1

    .line 113
    const/16 v24, 0x1

    const/16 v25, 0x0

    const/16 v26, 0x0

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 114
    const/16 v24, 0x2

    const/16 v25, 0x0

    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v26

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 304
    .end local v22           #theirsEdits:Lorg/eclipse/jgit/diff/EditList;
    :cond_0
    :goto_0
    return-object v18

    .line 118
    .restart local v22       #theirsEdits:Lorg/eclipse/jgit/diff/EditList;
    :cond_1
    const/16 v24, 0x1

    const/16 v25, 0x0

    const/16 v26, 0x0

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    goto :goto_0

    .line 121
    .end local v22           #theirsEdits:Lorg/eclipse/jgit/diff/EditList;
    :cond_2
    const/16 v24, 0x1

    const/16 v25, 0x0

    const/16 v26, 0x0

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    goto :goto_0

    .line 123
    :cond_3
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v24

    if-nez v24, :cond_5

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/merge/MergeAlgorithm;->diffAlg:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v16

    .line 125
    .local v16, oursEdits:Lorg/eclipse/jgit/diff/EditList;
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/diff/EditList;->isEmpty()Z

    move-result v24

    if-nez v24, :cond_4

    .line 128
    const/16 v24, 0x1

    const/16 v25, 0x0

    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v26

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 130
    const/16 v24, 0x2

    const/16 v25, 0x0

    const/16 v26, 0x0

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    goto :goto_0

    .line 133
    :cond_4
    const/16 v24, 0x2

    const/16 v25, 0x0

    const/16 v26, 0x0

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    goto/16 :goto_0

    .line 137
    .end local v16           #oursEdits:Lorg/eclipse/jgit/diff/EditList;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/merge/MergeAlgorithm;->diffAlg:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v16

    .line 138
    .restart local v16       #oursEdits:Lorg/eclipse/jgit/diff/EditList;
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/diff/EditList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 139
    .local v6, baseToOurs:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/diff/Edit;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/merge/MergeAlgorithm;->diffAlg:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v22

    .line 140
    .restart local v22       #theirsEdits:Lorg/eclipse/jgit/diff/EditList;
    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/diff/EditList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 141
    .local v7, baseToTheirs:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/diff/Edit;>;"
    const/4 v10, 0x0

    .line 143
    .local v10, current:I
    invoke-static {v6}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v15

    .line 144
    .local v15, oursEdit:Lorg/eclipse/jgit/diff/Edit;
    invoke-static {v7}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v21

    .line 149
    .local v21, theirsEdit:Lorg/eclipse/jgit/diff/Edit;
    :goto_1
    sget-object v24, Lorg/eclipse/jgit/merge/MergeAlgorithm;->END_EDIT:Lorg/eclipse/jgit/diff/Edit;

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_6

    sget-object v24, Lorg/eclipse/jgit/merge/MergeAlgorithm;->END_EDIT:Lorg/eclipse/jgit/diff/Edit;

    move-object/from16 v0, v24

    if-eq v15, v0, :cond_17

    .line 150
    :cond_6
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_8

    .line 154
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v24

    move/from16 v0, v24

    if-eq v10, v0, :cond_7

    .line 155
    const/16 v24, 0x0

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    sget-object v26, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v10, v2, v3}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 158
    :cond_7
    const/16 v24, 0x1

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v25

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v26

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 160
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v10

    .line 161
    invoke-static {v6}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v15

    goto :goto_1

    .line 162
    :cond_8
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_a

    .line 166
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v24

    move/from16 v0, v24

    if-eq v10, v0, :cond_9

    .line 167
    const/16 v24, 0x0

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    sget-object v26, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v10, v2, v3}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 170
    :cond_9
    const/16 v24, 0x2

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v25

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v26

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 172
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v10

    .line 173
    invoke-static {v7}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v21

    goto/16 :goto_1

    .line 178
    :cond_a
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v24

    move/from16 v0, v24

    if-eq v0, v10, :cond_b

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v24

    move/from16 v0, v24

    if-eq v0, v10, :cond_b

    .line 180
    const/16 v24, 0x0

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v26

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->min(II)I

    move-result v25

    sget-object v26, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v10, v2, v3}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 186
    :cond_b
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v14

    .line 187
    .local v14, oursBeginB:I
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v20

    .line 189
    .local v20, theirsBeginB:I
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v24

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_c

    .line 190
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v24

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    sub-int v24, v24, v25

    sub-int v20, v20, v24

    .line 223
    :goto_2
    invoke-static {v6}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v12

    .line 224
    .local v12, nextOursEdit:Lorg/eclipse/jgit/diff/Edit;
    invoke-static {v7}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v13

    .line 226
    .local v13, nextTheirsEdit:Lorg/eclipse/jgit/diff/Edit;
    :goto_3
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual {v13}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-lt v0, v1, :cond_d

    .line 227
    move-object/from16 v21, v13

    .line 228
    invoke-static {v7}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v13

    goto :goto_3

    .line 193
    .end local v12           #nextOursEdit:Lorg/eclipse/jgit/diff/Edit;
    .end local v13           #nextTheirsEdit:Lorg/eclipse/jgit/diff/Edit;
    :cond_c
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v24

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    sub-int v24, v24, v25

    sub-int v14, v14, v24

    goto :goto_2

    .line 229
    .restart local v12       #nextOursEdit:Lorg/eclipse/jgit/diff/Edit;
    .restart local v13       #nextTheirsEdit:Lorg/eclipse/jgit/diff/Edit;
    :cond_d
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual {v12}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-lt v0, v1, :cond_e

    .line 230
    move-object v15, v12

    .line 231
    invoke-static {v6}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->nextEdit(Ljava/util/Iterator;)Lorg/eclipse/jgit/diff/Edit;

    move-result-object v12

    goto :goto_3

    .line 238
    :cond_e
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v17

    .line 239
    .local v17, oursEndB:I
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v23

    .line 240
    .local v23, theirsEndB:I
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_10

    .line 241
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v25

    sub-int v24, v24, v25

    add-int v17, v17, v24

    .line 256
    :goto_4
    sub-int v11, v17, v14

    .line 257
    .local v11, minBSize:I
    sub-int v24, v23, v20

    sub-int v5, v11, v24

    .line 258
    .local v5, BSizeDelta:I
    if-lez v5, :cond_f

    .line 259
    sub-int/2addr v11, v5

    .line 261
    :cond_f
    const/4 v8, 0x0

    .line 262
    .local v8, commonPrefix:I
    :goto_5
    if-ge v8, v11, :cond_11

    add-int v24, v14, v8

    add-int v25, v20, v8

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move/from16 v2, v24

    move-object/from16 v3, p4

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/diff/SequenceComparator;->equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z

    move-result v24

    if-eqz v24, :cond_11

    .line 265
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 243
    .end local v5           #BSizeDelta:I
    .end local v8           #commonPrefix:I
    .end local v11           #minBSize:I
    :cond_10
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v25

    sub-int v24, v24, v25

    add-int v23, v23, v24

    goto :goto_4

    .line 266
    .restart local v5       #BSizeDelta:I
    .restart local v8       #commonPrefix:I
    .restart local v11       #minBSize:I
    :cond_11
    sub-int/2addr v11, v8

    .line 267
    const/4 v9, 0x0

    .line 268
    .local v9, commonSuffix:I
    :goto_6
    if-ge v9, v11, :cond_12

    sub-int v24, v17, v9

    add-int/lit8 v24, v24, -0x1

    sub-int v25, v23, v9

    add-int/lit8 v25, v25, -0x1

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move/from16 v2, v24

    move-object/from16 v3, p4

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/diff/SequenceComparator;->equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z

    move-result v24

    if-eqz v24, :cond_12

    .line 271
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 272
    :cond_12
    sub-int/2addr v11, v9

    .line 275
    if-lez v8, :cond_13

    .line 276
    const/16 v24, 0x1

    add-int v25, v14, v8

    sget-object v26, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v14, v2, v3}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 280
    :cond_13
    if-gtz v11, :cond_14

    if-eqz v5, :cond_15

    .line 281
    :cond_14
    const/16 v24, 0x1

    add-int v25, v14, v8

    sub-int v26, v17, v9

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 284
    const/16 v24, 0x2

    add-int v25, v20, v8

    sub-int v26, v23, v9

    sget-object v27, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 290
    :cond_15
    if-lez v9, :cond_16

    .line 291
    const/16 v24, 0x1

    sub-int v25, v17, v9

    sget-object v26, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v17

    move-object/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    .line 294
    :cond_16
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v24

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v25

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 295
    move-object v15, v12

    .line 296
    move-object/from16 v21, v13

    .line 297
    goto/16 :goto_1

    .line 301
    .end local v5           #BSizeDelta:I
    .end local v8           #commonPrefix:I
    .end local v9           #commonSuffix:I
    .end local v11           #minBSize:I
    .end local v12           #nextOursEdit:Lorg/eclipse/jgit/diff/Edit;
    .end local v13           #nextTheirsEdit:Lorg/eclipse/jgit/diff/Edit;
    .end local v14           #oursBeginB:I
    .end local v17           #oursEndB:I
    .end local v20           #theirsBeginB:I
    .end local v23           #theirsEndB:I
    :cond_17
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v24

    move/from16 v0, v24

    if-ge v10, v0, :cond_0

    .line 302
    const/16 v24, 0x0

    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v25

    sget-object v26, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v10, v2, v3}, Lorg/eclipse/jgit/merge/MergeResult;->add(IIILorg/eclipse/jgit/merge/MergeChunk$ConflictState;)V

    goto/16 :goto_0
.end method
