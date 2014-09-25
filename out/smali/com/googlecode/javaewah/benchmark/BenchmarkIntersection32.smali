.class public Lcom/googlecode/javaewah/benchmark/BenchmarkIntersection32;
.super Ljava/lang/Object;
.source "BenchmarkIntersection32.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3
    .parameter "args"

    .prologue
    .line 17
    const/16 v0, 0xa

    const/16 v1, 0x12

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/googlecode/javaewah/benchmark/BenchmarkIntersection32;->test(III)V

    .line 18
    return-void
.end method

.method public static test(III)V
    .locals 32
    .parameter "N"
    .parameter "nbr"
    .parameter "repeat"

    .prologue
    .line 22
    const-wide/16 v8, 0x0

    .line 24
    .local v8, bogus:J
    new-instance v12, Ljava/text/DecimalFormat;

    const-string v27, "0.###"

    move-object/from16 v0, v27

    invoke-direct {v12, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 25
    .local v12, df:Ljava/text/DecimalFormat;
    new-instance v10, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;

    invoke-direct {v10}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;-><init>()V

    .line 26
    .local v10, cdg:Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;
    const/16 v23, 0x1

    .local v23, sparsity:I
    :goto_0
    rsub-int/lit8 v27, p1, 0x1e

    move/from16 v0, v23

    move/from16 v1, v27

    if-ge v0, v1, :cond_13

    .line 27
    const/16 v24, 0x0

    .local v24, times:I
    :goto_1
    const/16 v27, 0x2

    move/from16 v0, v24

    move/from16 v1, v27

    if-ge v0, v1, :cond_12

    .line 28
    const-string v21, ""

    .line 30
    .local v21, line:Ljava/lang/String;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 31
    move/from16 v0, p0

    new-array v11, v0, [[I

    .line 32
    .local v11, data:[[I
    const/16 v27, 0x1

    add-int v28, p1, v23

    shl-int v2, v27, v28

    .line 33
    .local v2, Max:I
    const/16 v27, 0x1

    div-int/lit8 v28, p1, 0x2

    shl-int v27, v27, v28

    move/from16 v0, v27

    invoke-virtual {v10, v0, v2}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->generateClustered(II)[I

    move-result-object v18

    .line 34
    .local v18, inter:[I
    const/16 v20, 0x0

    .local v20, k:I
    :goto_2
    move/from16 v0, v20

    move/from16 v1, p0

    if-ge v0, v1, :cond_0

    .line 35
    const/16 v27, 0x1

    shl-int v27, v27, p1

    move/from16 v0, v27

    invoke-virtual {v10, v0, v2}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->generateClustered(II)[I

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/googlecode/javaewah/benchmark/Benchmark;->unite2by2([I[I)[I

    move-result-object v27

    aput-object v27, v11, v20

    .line 34
    add-int/lit8 v20, v20, 0x1

    goto :goto_2

    .line 37
    :cond_0
    move/from16 v0, p0

    new-array v13, v0, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 38
    .local v13, ewah:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v20, 0x0

    :goto_3
    move/from16 v0, v20

    move/from16 v1, p0

    if-ge v0, v1, :cond_2

    .line 39
    new-instance v27, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct/range {v27 .. v27}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    aput-object v27, v13, v20

    .line 40
    const/16 v26, 0x0

    .local v26, x:I
    :goto_4
    aget-object v27, v11, v20

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    if-ge v0, v1, :cond_1

    .line 41
    aget-object v27, v13, v20

    aget-object v28, v11, v20

    aget v28, v28, v26

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->set(I)Z

    .line 40
    add-int/lit8 v26, v26, 0x1

    goto :goto_4

    .line 43
    :cond_1
    const/16 v27, 0x0

    aput-object v27, v11, v20

    .line 38
    add-int/lit8 v20, v20, 0x1

    goto :goto_3

    .line 47
    .end local v26           #x:I
    :cond_2
    const/16 v27, 0x0

    aget-object v27, v13, v27

    const/16 v28, 0x1

    aget-object v28, v13, v28

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v5

    .line 48
    .local v5, answer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v20, 0x2

    :goto_5
    array-length v0, v13

    move/from16 v27, v0

    move/from16 v0, v20

    move/from16 v1, v27

    if-ge v0, v1, :cond_3

    .line 49
    aget-object v27, v13, v20

    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v5

    .line 48
    add-int/lit8 v20, v20, 0x1

    goto :goto_5

    .line 51
    :cond_3
    invoke-static {v13}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v14

    .line 52
    .local v14, ewahand:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v5, v14}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_4

    .line 53
    new-instance v27, Ljava/lang/RuntimeException;

    const-string v28, "bug EWAHCompressedBitmap.and"

    invoke-direct/range {v27 .. v28}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 55
    :cond_4
    const/high16 v27, 0x1

    move/from16 v0, v27

    invoke-static {v0, v13}, Lcom/googlecode/javaewah32/FastAggregation32;->bufferedand(I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v15

    .line 57
    .local v15, ewahand2:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v14, v15}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_5

    .line 58
    new-instance v27, Ljava/lang/RuntimeException;

    const-string v28, "bug FastAggregation.bufferedand "

    invoke-direct/range {v27 .. v28}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 64
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 65
    .local v6, bef:J
    const/16 v22, 0x0

    .local v22, r:I
    :goto_6
    move/from16 v0, v22

    move/from16 v1, p2

    if-ge v0, v1, :cond_8

    .line 66
    const/16 v20, 0x0

    :goto_7
    move/from16 v0, v20

    move/from16 v1, p0

    if-ge v0, v1, :cond_7

    .line 67
    const/16 v27, 0x0

    aget-object v17, v13, v27

    .line 68
    .local v17, ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v19, 0x1

    .local v19, j:I
    :goto_8
    add-int/lit8 v27, v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v27

    if-ge v0, v1, :cond_6

    .line 69
    aget-object v27, v13, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v17

    .line 68
    add-int/lit8 v19, v19, 0x1

    goto :goto_8

    .line 66
    :cond_6
    add-int/lit8 v20, v20, 0x1

    goto :goto_7

    .line 65
    .end local v17           #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v19           #j:I
    :cond_7
    add-int/lit8 v22, v22, 0x1

    goto :goto_6

    .line 72
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 73
    .local v3, aft:J
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\t"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    sub-long v28, v3, v6

    move-wide/from16 v0, v28

    long-to-double v0, v0

    move-wide/from16 v28, v0

    const-wide v30, 0x408f400000000000L

    div-double v28, v28, v30

    move-wide/from16 v0, v28

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 77
    const/16 v22, 0x0

    :goto_9
    move/from16 v0, v22

    move/from16 v1, p2

    if-ge v0, v1, :cond_b

    .line 78
    const/16 v20, 0x0

    :goto_a
    move/from16 v0, v20

    move/from16 v1, p0

    if-ge v0, v1, :cond_a

    .line 79
    add-int/lit8 v27, v20, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-object/from16 v16, v0

    .line 80
    .local v16, ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v19, 0x0

    .restart local v19       #j:I
    :goto_b
    add-int/lit8 v27, v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v27

    if-ge v0, v1, :cond_9

    .line 81
    aget-object v27, v13, v19

    aput-object v27, v16, v19

    .line 80
    add-int/lit8 v19, v19, 0x1

    goto :goto_b

    .line 83
    :cond_9
    invoke-static/range {v16 .. v16}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v17

    .line 85
    .restart local v17       #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    add-long v8, v8, v27

    .line 78
    add-int/lit8 v20, v20, 0x1

    goto :goto_a

    .line 77
    .end local v16           #ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v17           #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v19           #j:I
    :cond_a
    add-int/lit8 v22, v22, 0x1

    goto :goto_9

    .line 87
    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 88
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\t"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    sub-long v28, v3, v6

    move-wide/from16 v0, v28

    long-to-double v0, v0

    move-wide/from16 v28, v0

    const-wide v30, 0x408f400000000000L

    div-double v28, v28, v30

    move-wide/from16 v0, v28

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 91
    const/16 v22, 0x0

    :goto_c
    move/from16 v0, v22

    move/from16 v1, p2

    if-ge v0, v1, :cond_e

    .line 92
    const/16 v20, 0x0

    :goto_d
    move/from16 v0, v20

    move/from16 v1, p0

    if-ge v0, v1, :cond_d

    .line 93
    add-int/lit8 v27, v20, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-object/from16 v16, v0

    .line 94
    .restart local v16       #ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v19, 0x0

    .restart local v19       #j:I
    :goto_e
    add-int/lit8 v27, v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v27

    if-ge v0, v1, :cond_c

    .line 95
    aget-object v27, v13, v19

    aput-object v27, v16, v19

    .line 94
    add-int/lit8 v19, v19, 0x1

    goto :goto_e

    .line 97
    :cond_c
    const/high16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/googlecode/javaewah32/FastAggregation32;->bufferedand(I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v17

    .line 99
    .restart local v17       #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    add-long v8, v8, v27

    .line 92
    add-int/lit8 v20, v20, 0x1

    goto :goto_d

    .line 91
    .end local v16           #ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v17           #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v19           #j:I
    :cond_d
    add-int/lit8 v22, v22, 0x1

    goto :goto_c

    .line 101
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 103
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\t"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    sub-long v28, v3, v6

    move-wide/from16 v0, v28

    long-to-double v0, v0

    move-wide/from16 v28, v0

    const-wide v30, 0x408f400000000000L

    div-double v28, v28, v30

    move-wide/from16 v0, v28

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 106
    const/16 v22, 0x0

    :goto_f
    move/from16 v0, v22

    move/from16 v1, p2

    if-ge v0, v1, :cond_11

    .line 107
    const/16 v20, 0x0

    :goto_10
    move/from16 v0, v20

    move/from16 v1, p0

    if-ge v0, v1, :cond_10

    .line 108
    add-int/lit8 v27, v20, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Lcom/googlecode/javaewah32/IteratingRLW32;

    move-object/from16 v16, v0

    .line 109
    .local v16, ewahcp:[Lcom/googlecode/javaewah32/IteratingRLW32;
    const/16 v19, 0x0

    .restart local v19       #j:I
    :goto_11
    add-int/lit8 v27, v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v27

    if-ge v0, v1, :cond_f

    .line 110
    new-instance v27, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    aget-object v28, v13, v19

    invoke-direct/range {v27 .. v28}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    aput-object v27, v16, v19

    .line 109
    add-int/lit8 v19, v19, 0x1

    goto :goto_11

    .line 113
    :cond_f
    invoke-static/range {v16 .. v16}, Lcom/googlecode/javaewah32/IteratorAggregation32;->bufferedand([Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v17

    .line 114
    .local v17, ewahor:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-static/range {v17 .. v17}, Lcom/googlecode/javaewah32/IteratorUtil32;->cardinality(Lcom/googlecode/javaewah32/IteratingRLW32;)I

    move-result v25

    .line 115
    .local v25, wordcounter:I
    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v27, v0

    add-long v8, v8, v27

    .line 107
    add-int/lit8 v20, v20, 0x1

    goto :goto_10

    .line 106
    .end local v16           #ewahcp:[Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v17           #ewahor:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v19           #j:I
    .end local v25           #wordcounter:I
    :cond_10
    add-int/lit8 v22, v22, 0x1

    goto :goto_f

    .line 117
    :cond_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 119
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\t"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    sub-long v28, v3, v6

    move-wide/from16 v0, v28

    long-to-double v0, v0

    move-wide/from16 v28, v0

    const-wide v30, 0x408f400000000000L

    div-double v28, v28, v30

    move-wide/from16 v0, v28

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 121
    sget-object v27, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v28, "# times for: 2by2 EWAHCompressedBitmap.and bufferedand iterator-bufferedand"

    invoke-virtual/range {v27 .. v28}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 124
    sget-object v27, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object/from16 v0, v27

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    add-int/lit8 v24, v24, 0x1

    goto/16 :goto_1

    .line 126
    .end local v2           #Max:I
    .end local v3           #aft:J
    .end local v5           #answer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v6           #bef:J
    .end local v11           #data:[[I
    .end local v13           #ewah:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v14           #ewahand:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v15           #ewahand2:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v18           #inter:[I
    .end local v20           #k:I
    .end local v21           #line:Ljava/lang/String;
    .end local v22           #r:I
    :cond_12
    sget-object v27, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "# bogus ="

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 26
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_0

    .line 129
    .end local v24           #times:I
    :cond_13
    return-void
.end method
