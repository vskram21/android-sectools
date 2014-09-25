.class Lorg/eclipse/jgit/diff/SimilarityRenameDetector;
.super Ljava/lang/Object;
.source "SimilarityRenameDetector.java"


# static fields
.field private static final BITS_PER_INDEX:I = 0x1c

.field private static final INDEX_MASK:I = 0xfffffff

.field private static final SCORE_SHIFT:I = 0x38


# instance fields
.field private dsts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation
.end field

.field private matrix:[J

.field private out:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation
.end field

.field private reader:Lorg/eclipse/jgit/diff/ContentSource$Pair;

.field private renameScore:I

.field private srcs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation
.end field

.field private tableOverflow:Z


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/diff/ContentSource$Pair;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .parameter "reader"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/ContentSource$Pair;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 121
    .local p2, srcs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    .local p3, dsts:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    const/16 v0, 0x3c

    iput v0, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->renameScore:I

    .line 122
    iput-object p1, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->reader:Lorg/eclipse/jgit/diff/ContentSource$Pair;

    .line 123
    iput-object p2, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    .line 124
    iput-object p3, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    .line 125
    return-void
.end method

.method private buildMatrix(Lorg/eclipse/jgit/lib/ProgressMonitor;)I
    .locals 30
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    move-object/from16 v27, v0

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v27

    mul-int v26, v26, v27

    move/from16 v0, v26

    new-array v0, v0, [J

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->matrix:[J

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move/from16 v0, v26

    new-array v0, v0, [J

    move-object/from16 v24, v0

    .line 219
    .local v24, srcSizes:[J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move/from16 v0, v26

    new-array v9, v0, [J

    .line 220
    .local v9, dstSizes:[J
    const/4 v10, 0x0

    .line 226
    .local v10, dstTooLarge:Ljava/util/BitSet;
    const/4 v11, 0x0

    .line 227
    .local v11, mNext:I
    const/16 v21, 0x0

    .local v21, srcIdx:I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move/from16 v0, v21

    move/from16 v1, v26

    if-ge v0, v1, :cond_b

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 229
    .local v20, srcEnt:Lorg/eclipse/jgit/diff/DiffEntry;
    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v26, v0

    invoke-static/range {v26 .. v26}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->isFile(Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v26

    if-nez v26, :cond_1

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 227
    :cond_0
    :goto_1
    add-int/lit8 v21, v21, 0x1

    goto :goto_0

    .line 234
    :cond_1
    const/16 v18, 0x0

    .line 236
    .local v18, s:Lorg/eclipse/jgit/diff/SimilarityIndex;
    const/4 v6, 0x0

    .local v6, dstIdx:I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move/from16 v0, v26

    if-ge v6, v0, :cond_0

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 239
    .local v5, dstEnt:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v0, v5, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v26, v0

    invoke-static/range {v26 .. v26}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->isFile(Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v26

    if-nez v26, :cond_2

    .line 240
    const/16 v26, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 236
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 244
    :cond_2
    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v26, v0

    iget-object v0, v5, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v27, v0

    invoke-static/range {v26 .. v27}, Lorg/eclipse/jgit/diff/RenameDetector;->sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v26

    if-nez v26, :cond_3

    .line 245
    const/16 v26, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_3

    .line 249
    :cond_3
    if-eqz v10, :cond_4

    invoke-virtual {v10, v6}, Ljava/util/BitSet;->get(I)Z

    move-result v26

    if-eqz v26, :cond_4

    .line 250
    const/16 v26, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_3

    .line 254
    :cond_4
    aget-wide v22, v24, v21

    .line 255
    .local v22, srcSize:J
    const-wide/16 v26, 0x0

    cmp-long v26, v22, v26

    if-nez v26, :cond_5

    .line 256
    sget-object v26, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->size(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)J

    move-result-wide v26

    const-wide/16 v28, 0x1

    add-long v22, v26, v28

    .line 257
    aput-wide v22, v24, v21

    .line 260
    :cond_5
    aget-wide v7, v9, v6

    .line 261
    .local v7, dstSize:J
    const-wide/16 v26, 0x0

    cmp-long v26, v7, v26

    if-nez v26, :cond_6

    .line 262
    sget-object v26, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->size(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)J

    move-result-wide v26

    const-wide/16 v28, 0x1

    add-long v7, v26, v28

    .line 263
    aput-wide v7, v9, v6

    .line 266
    :cond_6
    move-wide/from16 v0, v22

    invoke-static {v0, v1, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    .line 267
    .local v13, max:J
    move-wide/from16 v0, v22

    invoke-static {v0, v1, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v15

    .line 268
    .local v15, min:J
    const-wide/16 v26, 0x64

    mul-long v26, v26, v15

    div-long v26, v26, v13

    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->renameScore:I

    move/from16 v28, v0

    move/from16 v0, v28

    int-to-long v0, v0

    move-wide/from16 v28, v0

    cmp-long v26, v26, v28

    if-gez v26, :cond_7

    .line 270
    const/16 v26, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto/16 :goto_3

    .line 274
    :cond_7
    if-nez v18, :cond_8

    .line 276
    :try_start_0
    sget-object v26, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->hash(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/SimilarityIndex;
    :try_end_0
    .catch Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v18

    .line 285
    :cond_8
    :try_start_1
    sget-object v26, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->hash(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/SimilarityIndex;
    :try_end_1
    .catch Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 295
    .local v4, d:Lorg/eclipse/jgit/diff/SimilarityIndex;
    const/16 v26, 0x2710

    move-object/from16 v0, v18

    move/from16 v1, v26

    invoke-virtual {v0, v4, v1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->score(Lorg/eclipse/jgit/diff/SimilarityIndex;I)I

    move-result v3

    .line 300
    .local v3, contentScore:I
    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    move-object/from16 v26, v0

    iget-object v0, v5, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-static/range {v26 .. v27}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->nameScore(Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    mul-int/lit8 v17, v26, 0x64

    .line 302
    .local v17, nameScore:I
    mul-int/lit8 v26, v3, 0x63

    mul-int/lit8 v27, v17, 0x1

    add-int v26, v26, v27

    move/from16 v0, v26

    div-int/lit16 v0, v0, 0x2710

    move/from16 v19, v0

    .line 304
    .local v19, score:I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->renameScore:I

    move/from16 v26, v0

    move/from16 v0, v19

    move/from16 v1, v26

    if-ge v0, v1, :cond_a

    .line 305
    const/16 v26, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto/16 :goto_3

    .line 277
    .end local v3           #contentScore:I
    .end local v4           #d:Lorg/eclipse/jgit/diff/SimilarityIndex;
    .end local v17           #nameScore:I
    .end local v19           #score:I
    :catch_0
    move-exception v25

    .line 278
    .local v25, tableFull:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->tableOverflow:Z

    goto/16 :goto_1

    .line 286
    .end local v25           #tableFull:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
    :catch_1
    move-exception v25

    .line 287
    .restart local v25       #tableFull:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
    if-nez v10, :cond_9

    .line 288
    new-instance v10, Ljava/util/BitSet;

    .end local v10           #dstTooLarge:Ljava/util/BitSet;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move/from16 v0, v26

    invoke-direct {v10, v0}, Ljava/util/BitSet;-><init>(I)V

    .line 289
    .restart local v10       #dstTooLarge:Ljava/util/BitSet;
    :cond_9
    invoke-virtual {v10, v6}, Ljava/util/BitSet;->set(I)V

    .line 290
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->tableOverflow:Z

    .line 291
    const/16 v26, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto/16 :goto_3

    .line 309
    .end local v25           #tableFull:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
    .restart local v3       #contentScore:I
    .restart local v4       #d:Lorg/eclipse/jgit/diff/SimilarityIndex;
    .restart local v17       #nameScore:I
    .restart local v19       #score:I
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->matrix:[J

    move-object/from16 v26, v0

    add-int/lit8 v12, v11, 0x1

    .end local v11           #mNext:I
    .local v12, mNext:I
    move/from16 v0, v19

    move/from16 v1, v21

    invoke-static {v0, v1, v6}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->encode(III)J

    move-result-wide v27

    aput-wide v27, v26, v11

    .line 310
    const/16 v26, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    move v11, v12

    .end local v12           #mNext:I
    .restart local v11       #mNext:I
    goto/16 :goto_3

    .line 318
    .end local v3           #contentScore:I
    .end local v4           #d:Lorg/eclipse/jgit/diff/SimilarityIndex;
    .end local v5           #dstEnt:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v6           #dstIdx:I
    .end local v7           #dstSize:J
    .end local v13           #max:J
    .end local v15           #min:J
    .end local v17           #nameScore:I
    .end local v18           #s:Lorg/eclipse/jgit/diff/SimilarityIndex;
    .end local v19           #score:I
    .end local v20           #srcEnt:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v22           #srcSize:J
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->matrix:[J

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-static {v0, v1, v11}, Ljava/util/Arrays;->sort([JII)V

    .line 319
    return v11
.end method

.method private static compactDstList(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    .local p0, in:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 205
    .local v2, r:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 206
    .local v0, e:Lorg/eclipse/jgit/diff/DiffEntry;
    if-eqz v0, :cond_0

    .line 207
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 209
    .end local v0           #e:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_1
    return-object v2
.end method

.method private static compactSrcList(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    .local p0, in:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 196
    .local v2, r:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 197
    .local v0, e:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v3, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v4, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v3, v4, :cond_0

    .line 198
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 200
    .end local v0           #e:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_1
    return-object v2
.end method

.method private static decodeFile(I)I
    .locals 1
    .parameter "v"

    .prologue
    .line 408
    const v0, 0xfffffff

    sub-int/2addr v0, p0

    return v0
.end method

.method static dstFile(J)I
    .locals 2
    .parameter "value"

    .prologue
    .line 390
    long-to-int v0, p0

    const v1, 0xfffffff

    and-int/2addr v0, v1

    invoke-static {v0}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->decodeFile(I)I

    move-result v0

    return v0
.end method

.method static encode(III)J
    .locals 5
    .parameter "score"
    .parameter "srcIdx"
    .parameter "dstIdx"

    .prologue
    .line 394
    int-to-long v0, p0

    const/16 v2, 0x38

    shl-long/2addr v0, v2

    invoke-static {p1}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->encodeFile(I)J

    move-result-wide v2

    const/16 v4, 0x1c

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-static {p2}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->encodeFile(I)J

    move-result-wide v2

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private static encodeFile(I)J
    .locals 2
    .parameter "idx"

    .prologue
    .line 404
    const v0, 0xfffffff

    sub-int/2addr v0, p0

    int-to-long v0, v0

    return-wide v0
.end method

.method private hash(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/SimilarityIndex;
    .locals 2
    .parameter "side"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
        }
    .end annotation

    .prologue
    .line 371
    new-instance v0, Lorg/eclipse/jgit/diff/SimilarityIndex;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/SimilarityIndex;-><init>()V

    .line 372
    .local v0, r:Lorg/eclipse/jgit/diff/SimilarityIndex;
    iget-object v1, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->reader:Lorg/eclipse/jgit/diff/ContentSource$Pair;

    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jgit/diff/ContentSource$Pair;->open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->hash(Lorg/eclipse/jgit/lib/ObjectLoader;)V

    .line 373
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/SimilarityIndex;->sort()V

    .line 374
    return-object v0
.end method

.method private static isFile(Lorg/eclipse/jgit/lib/FileMode;)Z
    .locals 2
    .parameter "mode"

    .prologue
    .line 412
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v0

    const v1, 0xf000

    and-int/2addr v0, v1

    const v1, 0x8000

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static nameScore(Ljava/lang/String;Ljava/lang/String;)I
    .locals 13
    .parameter "a"
    .parameter "b"

    .prologue
    .line 323
    const-string v11, "/"

    invoke-virtual {p0, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    add-int/lit8 v0, v11, 0x1

    .line 324
    .local v0, aDirLen:I
    const-string v11, "/"

    invoke-virtual {p1, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    add-int/lit8 v1, v11, 0x1

    .line 326
    .local v1, bDirLen:I
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 327
    .local v3, dirMin:I
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 332
    .local v2, dirMax:I
    if-nez v2, :cond_1

    .line 333
    const/16 v4, 0x64

    .line 334
    .local v4, dirScoreLtr:I
    const/16 v5, 0x64

    .line 355
    .local v5, dirScoreRtl:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    sub-int/2addr v11, v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v12

    sub-int/2addr v12, v1

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 356
    .local v8, fileMin:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    sub-int/2addr v11, v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v12

    sub-int/2addr v12, v1

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 358
    .local v7, fileMax:I
    const/4 v10, 0x0

    .line 359
    .local v10, fileSim:I
    :goto_1
    if-ge v10, v8, :cond_0

    .line 360
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    sub-int/2addr v11, v10

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    sub-int/2addr v12, v10

    invoke-virtual {p1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-eq v11, v12, :cond_7

    .line 364
    :cond_0
    mul-int/lit8 v11, v10, 0x64

    div-int v9, v11, v7

    .line 366
    .local v9, fileScore:I
    add-int v11, v4, v5

    mul-int/lit8 v11, v11, 0x19

    mul-int/lit8 v12, v9, 0x32

    add-int/2addr v11, v12

    div-int/lit8 v11, v11, 0x64

    return v11

    .line 336
    .end local v4           #dirScoreLtr:I
    .end local v5           #dirScoreRtl:I
    .end local v7           #fileMax:I
    .end local v8           #fileMin:I
    .end local v9           #fileScore:I
    .end local v10           #fileSim:I
    :cond_1
    const/4 v6, 0x0

    .line 337
    .local v6, dirSim:I
    :goto_2
    if-ge v6, v3, :cond_2

    .line 338
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-eq v11, v12, :cond_3

    .line 341
    :cond_2
    mul-int/lit8 v11, v6, 0x64

    div-int v4, v11, v2

    .line 343
    .restart local v4       #dirScoreLtr:I
    const/16 v11, 0x64

    if-ne v4, v11, :cond_4

    .line 344
    const/16 v5, 0x64

    .restart local v5       #dirScoreRtl:I
    goto :goto_0

    .line 337
    .end local v4           #dirScoreLtr:I
    .end local v5           #dirScoreRtl:I
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 346
    .restart local v4       #dirScoreLtr:I
    :cond_4
    const/4 v6, 0x0

    :goto_3
    if-ge v6, v3, :cond_5

    .line 347
    add-int/lit8 v11, v0, -0x1

    sub-int/2addr v11, v6

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    add-int/lit8 v12, v1, -0x1

    sub-int/2addr v12, v6

    invoke-virtual {p1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-eq v11, v12, :cond_6

    .line 351
    :cond_5
    mul-int/lit8 v11, v6, 0x64

    div-int v5, v11, v2

    .restart local v5       #dirScoreRtl:I
    goto :goto_0

    .line 346
    .end local v5           #dirScoreRtl:I
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 359
    .end local v6           #dirSim:I
    .restart local v5       #dirScoreRtl:I
    .restart local v7       #fileMax:I
    .restart local v8       #fileMin:I
    .restart local v10       #fileSim:I
    :cond_7
    add-int/lit8 v10, v10, 0x1

    goto :goto_1
.end method

.method private static score(J)I
    .locals 2
    .parameter "value"

    .prologue
    .line 382
    const/16 v0, 0x38

    ushr-long v0, p0, v0

    long-to-int v0, v0

    return v0
.end method

.method private size(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)J
    .locals 2
    .parameter "side"
    .parameter "ent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 378
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->reader:Lorg/eclipse/jgit/diff/ContentSource$Pair;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/diff/ContentSource$Pair;->size(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)J

    move-result-wide v0

    return-wide v0
.end method

.method static srcFile(J)I
    .locals 2
    .parameter "value"

    .prologue
    .line 386
    const/16 v0, 0x1c

    ushr-long v0, p0, v0

    long-to-int v0, v0

    const v1, 0xfffffff

    and-int/2addr v0, v1

    invoke-static {v0}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->decodeFile(I)I

    move-result v0

    return v0
.end method


# virtual methods
.method compute(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 12
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 132
    if-nez p1, :cond_0

    .line 133
    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 135
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->renamesFindingByContent:Ljava/lang/String;

    iget-object v9, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    mul-int/lit8 v9, v9, 0x2

    iget-object v10, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    mul-int/2addr v9, v10

    invoke-interface {p1, v8, v9}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 138
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->buildMatrix(Lorg/eclipse/jgit/lib/ProgressMonitor;)I

    move-result v4

    .line 139
    .local v4, mNext:I
    new-instance v8, Ljava/util/ArrayList;

    iget-object v9, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v4, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->out:Ljava/util/List;

    .line 144
    add-int/lit8 v4, v4, -0x1

    :goto_0
    if-ltz v4, :cond_3

    .line 145
    iget-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->matrix:[J

    aget-wide v2, v8, v4

    .line 146
    .local v2, ent:J
    invoke-static {v2, v3}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcFile(J)I

    move-result v6

    .line 147
    .local v6, sIdx:I
    invoke-static {v2, v3}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dstFile(J)I

    move-result v1

    .line 148
    .local v1, dIdx:I
    iget-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 149
    .local v5, s:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 151
    .local v0, d:Lorg/eclipse/jgit/diff/DiffEntry;
    if-nez v0, :cond_1

    .line 152
    invoke-interface {p1, v11}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 144
    :goto_1
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 157
    :cond_1
    iget-object v8, v5, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v9, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v8, v9, :cond_2

    .line 162
    sget-object v8, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v8, v5, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 163
    sget-object v7, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 168
    .local v7, type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    :goto_2
    iget-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->out:Ljava/util/List;

    invoke-static {v2, v3}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->score(J)I

    move-result v9

    invoke-static {v7, v5, v0, v9}, Lorg/eclipse/jgit/diff/DiffEntry;->pair(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;I)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    iget-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    const/4 v9, 0x0

    invoke-interface {v8, v1, v9}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 170
    invoke-interface {p1, v11}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_1

    .line 165
    .end local v7           #type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    :cond_2
    sget-object v7, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .restart local v7       #type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    goto :goto_2

    .line 173
    .end local v0           #d:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v1           #dIdx:I
    .end local v2           #ent:J
    .end local v5           #s:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v6           #sIdx:I
    .end local v7           #type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    :cond_3
    iget-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    invoke-static {v8}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->compactSrcList(Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    .line 174
    iget-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    invoke-static {v8}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->compactDstList(Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    .line 175
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 176
    return-void
.end method

.method getLeftOverDestinations()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dsts:Ljava/util/List;

    return-object v0
.end method

.method getLeftOverSources()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcs:Ljava/util/List;

    return-object v0
.end method

.method getMatches()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 179
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->out:Ljava/util/List;

    return-object v0
.end method

.method isTableOverflow()Z
    .locals 1

    .prologue
    .line 191
    iget-boolean v0, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->tableOverflow:Z

    return v0
.end method

.method setRenameScore(I)V
    .locals 0
    .parameter "score"

    .prologue
    .line 128
    iput p1, p0, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->renameScore:I

    .line 129
    return-void
.end method
