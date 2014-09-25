.class public Lcom/googlecode/javaewah/benchmark/BenchmarkUnion;
.super Ljava/lang/Object;
.source "BenchmarkUnion.java"


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

    invoke-static {v0, v1, v2}, Lcom/googlecode/javaewah/benchmark/BenchmarkUnion;->test(III)V

    .line 18
    return-void
.end method

.method public static test(III)V
    .locals 31
    .parameter "N"
    .parameter "nbr"
    .parameter "repeat"

    .prologue
    .line 22
    const-wide/16 v8, 0x0

    .line 24
    .local v8, bogus:J
    new-instance v12, Ljava/text/DecimalFormat;

    const-string v26, "0.###"

    move-object/from16 v0, v26

    invoke-direct {v12, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 25
    .local v12, df:Ljava/text/DecimalFormat;
    new-instance v10, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;

    invoke-direct {v10}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;-><init>()V

    .line 26
    .local v10, cdg:Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;
    const/16 v22, 0x1

    .local v22, sparsity:I
    :goto_0
    rsub-int/lit8 v26, p1, 0x1e

    move/from16 v0, v22

    move/from16 v1, v26

    if-ge v0, v1, :cond_1a

    .line 27
    const/16 v23, 0x0

    .local v23, times:I
    :goto_1
    const/16 v26, 0x2

    move/from16 v0, v23

    move/from16 v1, v26

    if-ge v0, v1, :cond_19

    .line 28
    const-string v20, ""

    .line 30
    .local v20, line:Ljava/lang/String;
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 31
    move/from16 v0, p0

    new-array v11, v0, [[I

    .line 32
    .local v11, data:[[I
    const/16 v26, 0x1

    add-int v27, p1, v22

    shl-int v2, v26, v27

    .line 33
    .local v2, Max:I
    const/16 v19, 0x0

    .local v19, k:I
    :goto_2
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_0

    .line 34
    const/16 v26, 0x1

    shl-int v26, v26, p1

    move/from16 v0, v26

    invoke-virtual {v10, v0, v2}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->generateClustered(II)[I

    move-result-object v26

    aput-object v26, v11, v19

    .line 33
    add-int/lit8 v19, v19, 0x1

    goto :goto_2

    .line 36
    :cond_0
    move/from16 v0, p0

    new-array v13, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 37
    .local v13, ewah:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v19, 0x0

    :goto_3
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_2

    .line 38
    new-instance v26, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct/range {v26 .. v26}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    aput-object v26, v13, v19

    .line 39
    const/16 v25, 0x0

    .local v25, x:I
    :goto_4
    aget-object v26, v11, v19

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v25

    move/from16 v1, v26

    if-ge v0, v1, :cond_1

    .line 40
    aget-object v26, v13, v19

    aget-object v27, v11, v19

    aget v27, v27, v25

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    .line 39
    add-int/lit8 v25, v25, 0x1

    goto :goto_4

    .line 42
    :cond_1
    const/16 v26, 0x0

    aput-object v26, v11, v19

    .line 37
    add-int/lit8 v19, v19, 0x1

    goto :goto_3

    .line 46
    .end local v25           #x:I
    :cond_2
    const/16 v26, 0x0

    aget-object v26, v13, v26

    const/16 v27, 0x1

    aget-object v27, v13, v27

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v5

    .line 47
    .local v5, answer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v19, 0x2

    :goto_5
    array-length v0, v13

    move/from16 v26, v0

    move/from16 v0, v19

    move/from16 v1, v26

    if-ge v0, v1, :cond_3

    .line 48
    aget-object v26, v13, v19

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v5

    .line 47
    add-int/lit8 v19, v19, 0x1

    goto :goto_5

    .line 50
    :cond_3
    invoke-static {v13}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v15

    .line 51
    .local v15, ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v5, v15}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_4

    .line 52
    new-instance v26, Ljava/lang/RuntimeException;

    const-string v27, "bug EWAHCompressedBitmap.or"

    invoke-direct/range {v26 .. v27}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v26

    .line 54
    :cond_4
    invoke-static {v13}, Lcom/googlecode/javaewah/FastAggregation;->or([Lcom/googlecode/javaewah/LogicalElement;)Lcom/googlecode/javaewah/LogicalElement;

    move-result-object v17

    check-cast v17, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 55
    .local v17, ewahor3:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_5

    .line 56
    new-instance v26, Ljava/lang/RuntimeException;

    const-string v27, "bug FastAggregation.or"

    invoke-direct/range {v26 .. v27}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v26

    .line 57
    :cond_5
    const/high16 v26, 0x1

    move/from16 v0, v26

    invoke-static {v0, v13}, Lcom/googlecode/javaewah/FastAggregation;->bufferedor(I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v16

    .line 59
    .local v16, ewahor2:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual/range {v15 .. v16}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_6

    .line 60
    new-instance v26, Ljava/lang/RuntimeException;

    const-string v27, "bug FastAggregation.bufferedor "

    invoke-direct/range {v26 .. v27}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v26

    .line 66
    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 67
    .local v6, bef:J
    const/16 v21, 0x0

    .local v21, r:I
    :goto_6
    move/from16 v0, v21

    move/from16 v1, p2

    if-ge v0, v1, :cond_9

    .line 68
    const/16 v19, 0x0

    :goto_7
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_8

    .line 69
    const/16 v26, 0x0

    aget-object v15, v13, v26

    .line 70
    const/16 v18, 0x1

    .local v18, j:I
    :goto_8
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-ge v0, v1, :cond_7

    .line 71
    aget-object v26, v13, v18

    move-object/from16 v0, v26

    invoke-virtual {v15, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v15

    .line 70
    add-int/lit8 v18, v18, 0x1

    goto :goto_8

    .line 68
    :cond_7
    add-int/lit8 v19, v19, 0x1

    goto :goto_7

    .line 67
    .end local v18           #j:I
    :cond_8
    add-int/lit8 v21, v21, 0x1

    goto :goto_6

    .line 74
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 75
    .local v3, aft:J
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\t"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sub-long v27, v3, v6

    move-wide/from16 v0, v27

    long-to-double v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0x408f400000000000L

    div-double v27, v27, v29

    move-wide/from16 v0, v27

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 79
    const/16 v21, 0x0

    :goto_9
    move/from16 v0, v21

    move/from16 v1, p2

    if-ge v0, v1, :cond_c

    .line 80
    const/16 v19, 0x0

    :goto_a
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_b

    .line 81
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v26

    new-array v14, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 82
    .local v14, ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v18, 0x0

    .restart local v18       #j:I
    :goto_b
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-ge v0, v1, :cond_a

    .line 83
    aget-object v26, v13, v18

    aput-object v26, v14, v18

    .line 82
    add-int/lit8 v18, v18, 0x1

    goto :goto_b

    .line 85
    :cond_a
    invoke-static {v14}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v15

    .line 87
    invoke-virtual {v15}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v26

    move/from16 v0, v26

    int-to-long v0, v0

    move-wide/from16 v26, v0

    add-long v8, v8, v26

    .line 80
    add-int/lit8 v19, v19, 0x1

    goto :goto_a

    .line 79
    .end local v14           #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v18           #j:I
    :cond_b
    add-int/lit8 v21, v21, 0x1

    goto :goto_9

    .line 89
    :cond_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 90
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\t"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sub-long v27, v3, v6

    move-wide/from16 v0, v27

    long-to-double v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0x408f400000000000L

    div-double v27, v27, v29

    move-wide/from16 v0, v27

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 94
    const/16 v21, 0x0

    :goto_c
    move/from16 v0, v21

    move/from16 v1, p2

    if-ge v0, v1, :cond_f

    .line 95
    const/16 v19, 0x0

    :goto_d
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_e

    .line 96
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v26

    new-array v14, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 97
    .restart local v14       #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v18, 0x0

    .restart local v18       #j:I
    :goto_e
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-ge v0, v1, :cond_d

    .line 98
    aget-object v26, v13, v18

    aput-object v26, v14, v18

    .line 97
    add-int/lit8 v18, v18, 0x1

    goto :goto_e

    .line 100
    :cond_d
    invoke-static {v14}, Lcom/googlecode/javaewah/FastAggregation;->or([Lcom/googlecode/javaewah/LogicalElement;)Lcom/googlecode/javaewah/LogicalElement;

    move-result-object v15

    .end local v15           #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    check-cast v15, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 102
    .restart local v15       #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v15}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v26

    move/from16 v0, v26

    int-to-long v0, v0

    move-wide/from16 v26, v0

    add-long v8, v8, v26

    .line 95
    add-int/lit8 v19, v19, 0x1

    goto :goto_d

    .line 94
    .end local v14           #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v18           #j:I
    :cond_e
    add-int/lit8 v21, v21, 0x1

    goto :goto_c

    .line 104
    :cond_f
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 105
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\t"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sub-long v27, v3, v6

    move-wide/from16 v0, v27

    long-to-double v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0x408f400000000000L

    div-double v27, v27, v29

    move-wide/from16 v0, v27

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 110
    const/16 v21, 0x0

    :goto_f
    move/from16 v0, v21

    move/from16 v1, p2

    if-ge v0, v1, :cond_12

    .line 111
    const/16 v19, 0x0

    :goto_10
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_11

    .line 112
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v26

    new-array v14, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 113
    .restart local v14       #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v18, 0x0

    .restart local v18       #j:I
    :goto_11
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-ge v0, v1, :cond_10

    .line 114
    aget-object v26, v13, v18

    aput-object v26, v14, v18

    .line 113
    add-int/lit8 v18, v18, 0x1

    goto :goto_11

    .line 116
    :cond_10
    const/high16 v26, 0x1

    move/from16 v0, v26

    invoke-static {v0, v14}, Lcom/googlecode/javaewah/FastAggregation;->bufferedor(I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v15

    .line 118
    invoke-virtual {v15}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v26

    move/from16 v0, v26

    int-to-long v0, v0

    move-wide/from16 v26, v0

    add-long v8, v8, v26

    .line 111
    add-int/lit8 v19, v19, 0x1

    goto :goto_10

    .line 110
    .end local v14           #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v18           #j:I
    :cond_11
    add-int/lit8 v21, v21, 0x1

    goto :goto_f

    .line 120
    :cond_12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 122
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\t"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sub-long v27, v3, v6

    move-wide/from16 v0, v27

    long-to-double v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0x408f400000000000L

    div-double v27, v27, v29

    move-wide/from16 v0, v27

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 124
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 125
    const/16 v21, 0x0

    :goto_12
    move/from16 v0, v21

    move/from16 v1, p2

    if-ge v0, v1, :cond_15

    .line 126
    const/16 v19, 0x0

    :goto_13
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_14

    .line 127
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v26

    new-array v14, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 128
    .restart local v14       #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v18, 0x0

    .restart local v18       #j:I
    :goto_14
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-ge v0, v1, :cond_13

    .line 129
    aget-object v26, v13, v18

    aput-object v26, v14, v18

    .line 128
    add-int/lit8 v18, v18, 0x1

    goto :goto_14

    .line 131
    :cond_13
    new-instance v25, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct/range {v25 .. v25}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 132
    .local v25, x:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    move-object/from16 v0, v25

    invoke-static {v0, v14}, Lcom/googlecode/javaewah/FastAggregation;->legacy_orWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 133
    invoke-virtual/range {v25 .. v25}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v26

    move/from16 v0, v26

    int-to-long v0, v0

    move-wide/from16 v26, v0

    add-long v8, v8, v26

    .line 126
    add-int/lit8 v19, v19, 0x1

    goto :goto_13

    .line 125
    .end local v14           #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v18           #j:I
    .end local v25           #x:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_14
    add-int/lit8 v21, v21, 0x1

    goto :goto_12

    .line 135
    :cond_15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 137
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\t"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sub-long v27, v3, v6

    move-wide/from16 v0, v27

    long-to-double v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0x408f400000000000L

    div-double v27, v27, v29

    move-wide/from16 v0, v27

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 139
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 140
    const/16 v21, 0x0

    .end local v15           #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :goto_15
    move/from16 v0, v21

    move/from16 v1, p2

    if-ge v0, v1, :cond_18

    .line 141
    const/16 v19, 0x0

    :goto_16
    move/from16 v0, v19

    move/from16 v1, p0

    if-ge v0, v1, :cond_17

    .line 142
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v26

    new-array v14, v0, [Lcom/googlecode/javaewah/IteratingRLW;

    .line 143
    .local v14, ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    const/16 v18, 0x0

    .restart local v18       #j:I
    :goto_17
    add-int/lit8 v26, v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-ge v0, v1, :cond_16

    .line 144
    new-instance v26, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    aget-object v27, v13, v18

    invoke-direct/range {v26 .. v27}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    aput-object v26, v14, v18

    .line 143
    add-int/lit8 v18, v18, 0x1

    goto :goto_17

    .line 147
    :cond_16
    invoke-static {v14}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedor([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v15

    .line 148
    .local v15, ewahor:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-static {v15}, Lcom/googlecode/javaewah/IteratorUtil;->cardinality(Lcom/googlecode/javaewah/IteratingRLW;)I

    move-result v24

    .line 149
    .local v24, wordcounter:I
    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v26, v0

    add-long v8, v8, v26

    .line 141
    add-int/lit8 v19, v19, 0x1

    goto :goto_16

    .line 140
    .end local v14           #ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    .end local v15           #ewahor:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v18           #j:I
    .end local v24           #wordcounter:I
    :cond_17
    add-int/lit8 v21, v21, 0x1

    goto :goto_15

    .line 151
    :cond_18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 153
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\t"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sub-long v27, v3, v6

    move-wide/from16 v0, v27

    long-to-double v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0x408f400000000000L

    div-double v27, v27, v29

    move-wide/from16 v0, v27

    invoke-virtual {v12, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 155
    sget-object v26, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v27, "# times for: 2by2 EWAHCompressedBitmap.or FastAggregation.or experimentalor bufferedor legacygroupedor iterator-bufferedor"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 158
    sget-object v26, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_1

    .line 160
    .end local v2           #Max:I
    .end local v3           #aft:J
    .end local v5           #answer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v6           #bef:J
    .end local v11           #data:[[I
    .end local v13           #ewah:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v16           #ewahor2:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v17           #ewahor3:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v19           #k:I
    .end local v20           #line:Ljava/lang/String;
    .end local v21           #r:I
    :cond_19
    sget-object v26, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "# bogus ="

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 26
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_0

    .line 163
    .end local v23           #times:I
    :cond_1a
    return-void
.end method
