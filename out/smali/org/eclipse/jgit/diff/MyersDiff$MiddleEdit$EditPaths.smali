.class abstract Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;
.super Ljava/lang/Object;
.source "MyersDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "EditPaths"
.end annotation


# instance fields
.field beginK:I

.field endK:I

.field maxK:I

.field middleK:I

.field minK:I

.field prevBeginK:I

.field prevEndK:I

.field private snake:Lorg/eclipse/jgit/util/LongList;

.field final synthetic this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

.field private x:Lorg/eclipse/jgit/util/IntList;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;)V
    .locals 1
    .parameter

    .prologue
    .line 307
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    iput-object p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 308
    new-instance v0, Lorg/eclipse/jgit/util/IntList;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/IntList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->x:Lorg/eclipse/jgit/util/IntList;

    .line 309
    new-instance v0, Lorg/eclipse/jgit/util/LongList;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/LongList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake:Lorg/eclipse/jgit/util/LongList;

    return-void
.end method

.method private forceKIntoRange(I)I
    .locals 2
    .parameter "k"

    .prologue
    .line 338
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->minK:I

    if-ge p1, v0, :cond_1

    .line 339
    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->minK:I

    iget v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->minK:I

    xor-int/2addr v1, p1

    and-int/lit8 v1, v1, 0x1

    add-int p1, v0, v1

    .line 342
    .end local p1
    :cond_0
    :goto_0
    return p1

    .line 340
    .restart local p1
    :cond_1
    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->maxK:I

    if-le p1, v0, :cond_0

    .line 341
    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->maxK:I

    iget v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->maxK:I

    xor-int/2addr v1, p1

    and-int/lit8 v1, v1, 0x1

    sub-int p1, v0, v1

    goto :goto_0
.end method


# virtual methods
.method abstract adjustMinMaxK(II)V
.end method

.method calculate(I)Z
    .locals 24
    .parameter "d"

    .prologue
    .line 399
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    move-object/from16 v0, p0

    iput v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->prevBeginK:I

    .line 400
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    move-object/from16 v0, p0

    iput v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->prevEndK:I

    .line 401
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    sub-int v3, v3, p1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->forceKIntoRange(I)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    .line 402
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    add-int v3, v3, p1

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->forceKIntoRange(I)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    .line 407
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    move/from16 v17, v0

    .local v17, k:I
    :goto_0
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    move/from16 v0, v17

    if-lt v0, v3, :cond_9

    .line 408
    const/16 v22, -0x1

    .local v22, left:I
    const/16 v23, -0x1

    .line 409
    .local v23, right:I
    const-wide/16 v7, -0x1

    .local v7, leftSnake:J
    const-wide/16 v13, -0x1

    .line 411
    .local v13, rightSnake:J
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->prevBeginK:I

    move/from16 v0, v17

    if-le v0, v3, :cond_2

    .line 412
    add-int/lit8 v3, p1, -0x1

    add-int/lit8 v4, v17, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getIndex(II)I

    move-result v21

    .line 413
    .local v21, i:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->x:Lorg/eclipse/jgit/util/IntList;

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v22

    .line 414
    add-int/lit8 v3, v17, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v3, v1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake(II)I

    move-result v6

    .line 415
    .local v6, end:I
    move/from16 v0, v22

    if-eq v0, v6, :cond_0

    add-int/lit8 v3, v17, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->newSnake(II)J

    move-result-wide v7

    .line 418
    :goto_1
    add-int/lit8 v5, v17, -0x1

    move-object/from16 v3, p0

    move/from16 v4, p1

    invoke-virtual/range {v3 .. v8}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->meets(IIIJ)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 419
    const/4 v3, 0x1

    .line 452
    .end local v6           #end:I
    .end local v7           #leftSnake:J
    .end local v13           #rightSnake:J
    .end local v21           #i:I
    .end local v22           #left:I
    .end local v23           #right:I
    :goto_2
    return v3

    .line 415
    .restart local v6       #end:I
    .restart local v7       #leftSnake:J
    .restart local v13       #rightSnake:J
    .restart local v21       #i:I
    .restart local v22       #left:I
    .restart local v23       #right:I
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake:Lorg/eclipse/jgit/util/LongList;

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/LongList;->get(I)J

    move-result-wide v7

    goto :goto_1

    .line 420
    :cond_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getLeft(I)I

    move-result v22

    .line 422
    .end local v6           #end:I
    .end local v21           #i:I
    :cond_2
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->prevEndK:I

    move/from16 v0, v17

    if-ge v0, v3, :cond_5

    .line 423
    add-int/lit8 v3, p1, -0x1

    add-int/lit8 v4, v17, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getIndex(II)I

    move-result v21

    .line 424
    .restart local v21       #i:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->x:Lorg/eclipse/jgit/util/IntList;

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v23

    .line 425
    add-int/lit8 v3, v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v3, v1}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake(II)I

    move-result v6

    .line 426
    .restart local v6       #end:I
    move/from16 v0, v23

    if-eq v0, v6, :cond_3

    add-int/lit8 v3, v17, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->newSnake(II)J

    move-result-wide v13

    .line 429
    :goto_3
    add-int/lit8 v11, v17, 0x1

    move-object/from16 v9, p0

    move/from16 v10, p1

    move v12, v6

    invoke-virtual/range {v9 .. v14}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->meets(IIIJ)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 430
    const/4 v3, 0x1

    goto :goto_2

    .line 426
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake:Lorg/eclipse/jgit/util/LongList;

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/LongList;->get(I)J

    move-result-wide v13

    goto :goto_3

    .line 431
    :cond_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getRight(I)I

    move-result v23

    .line 435
    .end local v6           #end:I
    .end local v21           #i:I
    :cond_5
    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->prevEndK:I

    move/from16 v0, v17

    if-ge v0, v3, :cond_6

    move-object/from16 v0, p0

    iget v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->prevBeginK:I

    move/from16 v0, v17

    if-le v0, v3, :cond_7

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->isBetter(II)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 438
    :cond_6
    move/from16 v18, v22

    .line 439
    .local v18, newX:I
    move-wide/from16 v19, v7

    .local v19, newSnake:J
    :goto_4
    move-object/from16 v15, p0

    move/from16 v16, p1

    .line 445
    invoke-virtual/range {v15 .. v20}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->meets(IIIJ)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 446
    const/4 v3, 0x1

    goto/16 :goto_2

    .line 442
    .end local v18           #newX:I
    .end local v19           #newSnake:J
    :cond_7
    move/from16 v18, v23

    .line 443
    .restart local v18       #newX:I
    move-wide/from16 v19, v13

    .restart local v19       #newSnake:J
    goto :goto_4

    .line 447
    :cond_8
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->adjustMinMaxK(II)V

    .line 448
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getIndex(II)I

    move-result v21

    .line 449
    .restart local v21       #i:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->x:Lorg/eclipse/jgit/util/IntList;

    move/from16 v0, v21

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Lorg/eclipse/jgit/util/IntList;->set(II)V

    .line 450
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake:Lorg/eclipse/jgit/util/LongList;

    move/from16 v0, v21

    move-wide/from16 v1, v19

    invoke-virtual {v3, v0, v1, v2}, Lorg/eclipse/jgit/util/LongList;->set(IJ)V

    .line 407
    add-int/lit8 v17, v17, -0x2

    goto/16 :goto_0

    .line 452
    .end local v7           #leftSnake:J
    .end local v13           #rightSnake:J
    .end local v18           #newX:I
    .end local v19           #newSnake:J
    .end local v21           #i:I
    .end local v22           #left:I
    .end local v23           #right:I
    :cond_9
    const/4 v3, 0x0

    goto/16 :goto_2
.end method

.method final getIndex(II)I
    .locals 5
    .parameter "d"
    .parameter "k"

    .prologue
    .line 317
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    add-int v0, p1, p2

    iget v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    sub-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 318
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->unexpectedOddResult:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 319
    :cond_0
    add-int v0, p1, p2

    iget v1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method abstract getLeft(I)I
.end method

.method abstract getRight(I)I
.end method

.method final getSnake(II)J
    .locals 5
    .parameter "d"
    .parameter "k"

    .prologue
    .line 331
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    if-lt p2, v0, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    if-le p2, v0, :cond_1

    .line 332
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->kNotInRange:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 333
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake:Lorg/eclipse/jgit/util/LongList;

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getIndex(II)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/LongList;->get(I)J

    move-result-wide v0

    return-wide v0
.end method

.method final getX(II)I
    .locals 5
    .parameter "d"
    .parameter "k"

    .prologue
    .line 324
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    if-lt p2, v0, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    if-le p2, v0, :cond_1

    .line 325
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->kNotInRange:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->x:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->getIndex(II)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    return v0
.end method

.method initialize(IIII)V
    .locals 3
    .parameter "k"
    .parameter "x"
    .parameter "minK"
    .parameter "maxK"

    .prologue
    .line 346
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    iput p3, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->minK:I

    .line 347
    iput p4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->maxK:I

    .line 348
    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->middleK:I

    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->endK:I

    iput p1, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->beginK:I

    .line 349
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->x:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/IntList;->clear()V

    .line 350
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->x:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 351
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake:Lorg/eclipse/jgit/util/LongList;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/LongList;->clear()V

    .line 352
    iget-object v0, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake:Lorg/eclipse/jgit/util/LongList;

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->newSnake(II)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/LongList;->add(J)V

    .line 353
    return-void
.end method

.method abstract isBetter(II)Z
.end method

.method final makeEdit(JJ)Z
    .locals 6
    .parameter "snake1"
    .parameter "snake2"

    .prologue
    .line 377
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake2x(J)I

    move-result v0

    .local v0, x1:I
    invoke-virtual {p0, p3, p4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake2x(J)I

    move-result v1

    .line 378
    .local v1, x2:I
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake2y(J)I

    move-result v2

    .local v2, y1:I
    invoke-virtual {p0, p3, p4}, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->snake2y(J)I

    move-result v3

    .line 390
    .local v3, y2:I
    if-gt v0, v1, :cond_0

    if-le v2, v3, :cond_1

    .line 391
    :cond_0
    move v0, v1

    .line 392
    move v2, v3

    .line 394
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;->this$1:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;

    new-instance v5, Lorg/eclipse/jgit/diff/Edit;

    invoke-direct {v5, v0, v1, v2, v3}, Lorg/eclipse/jgit/diff/Edit;-><init>(IIII)V

    iput-object v5, v4, Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit;->edit:Lorg/eclipse/jgit/diff/Edit;

    .line 395
    const/4 v4, 0x1

    return v4
.end method

.method abstract meets(IIIJ)Z
.end method

.method final newSnake(II)J
    .locals 7
    .parameter "k"
    .parameter "x"

    .prologue
    .line 363
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    add-int v4, p1, p2

    int-to-long v2, v4

    .line 364
    .local v2, y:J
    int-to-long v4, p2

    const/16 v6, 0x20

    shl-long v0, v4, v6

    .line 365
    .local v0, ret:J
    or-long v4, v0, v2

    return-wide v4
.end method

.method abstract snake(II)I
.end method

.method final snake2x(J)I
    .locals 2
    .parameter "snake"

    .prologue
    .line 369
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    const/16 v0, 0x20

    ushr-long v0, p1, v0

    long-to-int v0, v0

    return v0
.end method

.method final snake2y(J)I
    .locals 1
    .parameter "snake"

    .prologue
    .line 373
    .local p0, this:Lorg/eclipse/jgit/diff/MyersDiff$MiddleEdit$EditPaths;,"Lorg/eclipse/jgit/diff/MyersDiff<TS;>.MiddleEdit.EditPaths;"
    long-to-int v0, p1

    return v0
.end method
