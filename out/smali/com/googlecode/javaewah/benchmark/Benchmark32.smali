.class public Lcom/googlecode/javaewah/benchmark/Benchmark32;
.super Ljava/lang/Object;
.source "Benchmark32.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3
    .parameter "args"

    .prologue
    .line 26
    const/16 v0, 0x64

    const/16 v1, 0x10

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/googlecode/javaewah/benchmark/Benchmark32;->test(III)V

    .line 28
    return-void
.end method

.method public static test(III)V
    .locals 35
    .parameter "N"
    .parameter "nbr"
    .parameter "repeat"

    .prologue
    .line 32
    new-instance v15, Ljava/text/DecimalFormat;

    const-string v30, "0.###"

    move-object/from16 v0, v30

    invoke-direct {v15, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 33
    .local v15, df:Ljava/text/DecimalFormat;
    new-instance v13, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;

    invoke-direct {v13}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;-><init>()V

    .line 34
    .local v13, cdg:Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;
    const/16 v28, 0x1

    .local v28, sparsity:I
    :goto_0
    rsub-int/lit8 v30, p1, 0x1e

    move/from16 v0, v28

    move/from16 v1, v30

    if-ge v0, v1, :cond_24

    .line 35
    const-wide/16 v9, 0x0

    .line 36
    .local v9, bogus:J
    const-string v25, ""

    .line 38
    .local v25, line:Ljava/lang/String;
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 39
    move/from16 v0, p0

    new-array v14, v0, [[I

    .line 40
    .local v14, data:[[I
    const/16 v30, 0x1

    add-int v31, p1, v28

    shl-int v3, v30, v31

    .line 41
    .local v3, Max:I
    sget-object v30, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v31, "# generating random data..."

    invoke-virtual/range {v30 .. v31}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 42
    const/16 v30, 0x1

    div-int/lit8 v31, p1, 0x2

    shl-int v30, v30, v31

    move/from16 v0, v30

    invoke-virtual {v13, v0, v3}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->generateClustered(II)[I

    move-result-object v21

    .line 43
    .local v21, inter:[I
    const/16 v24, 0x0

    .local v24, k:I
    :goto_1
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_0

    .line 44
    const/16 v30, 0x1

    shl-int v30, v30, p1

    move/from16 v0, v30

    invoke-virtual {v13, v0, v3}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->generateClustered(II)[I

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/googlecode/javaewah/benchmark/Benchmark;->unite2by2([I[I)[I

    move-result-object v30

    aput-object v30, v14, v24

    .line 43
    add-int/lit8 v24, v24, 0x1

    goto :goto_1

    .line 45
    :cond_0
    sget-object v30, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v31, "# generating random data... ok."

    invoke-virtual/range {v30 .. v31}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 48
    .local v7, bef:J
    move/from16 v0, p0

    new-array v0, v0, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-object/from16 v16, v0

    .line 49
    .local v16, ewah:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v27, 0x0

    .line 50
    .local v27, size:I
    const/16 v26, 0x0

    .local v26, r:I
    :goto_2
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_3

    .line 51
    const/16 v27, 0x0

    .line 52
    const/16 v24, 0x0

    :goto_3
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_2

    .line 53
    new-instance v30, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    aput-object v30, v16, v24

    .line 54
    const/16 v29, 0x0

    .local v29, x:I
    :goto_4
    aget-object v30, v14, v24

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v29

    move/from16 v1, v30

    if-ge v0, v1, :cond_1

    .line 55
    aget-object v30, v16, v24

    aget-object v31, v14, v24

    aget v31, v31, v29

    invoke-virtual/range {v30 .. v31}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->set(I)Z

    .line 54
    add-int/lit8 v29, v29, 0x1

    goto :goto_4

    .line 57
    :cond_1
    aget-object v30, v16, v24

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBytes()I

    move-result v30

    add-int v27, v27, v30

    .line 52
    add-int/lit8 v24, v24, 0x1

    goto :goto_3

    .line 50
    .end local v29           #x:I
    :cond_2
    add-int/lit8 v26, v26, 0x1

    goto :goto_2

    .line 60
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 61
    .local v4, aft:J
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 62
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 65
    const/16 v26, 0x0

    :goto_5
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_5

    .line 66
    const/16 v24, 0x0

    :goto_6
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_4

    .line 67
    aget-object v30, v16, v24

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->toArray()[I

    move-result-object v6

    .line 68
    .local v6, array:[I
    array-length v0, v6

    move/from16 v30, v0

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 66
    add-int/lit8 v24, v24, 0x1

    goto :goto_6

    .line 65
    .end local v6           #array:[I
    :cond_4
    add-int/lit8 v26, v26, 0x1

    goto :goto_5

    .line 70
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 71
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 74
    const/16 v26, 0x0

    :goto_7
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_8

    .line 75
    const/16 v24, 0x0

    :goto_8
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_7

    .line 76
    aget-object v30, v16, v24

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->cardinality()I

    move-result v30

    move/from16 v0, v30

    new-array v6, v0, [I

    .line 77
    .restart local v6       #array:[I
    const/4 v11, 0x0

    .line 78
    .local v11, c:I
    aget-object v30, v16, v24

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_6

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/Integer;

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Integer;->intValue()I

    move-result v29

    .line 79
    .restart local v29       #x:I
    add-int/lit8 v12, v11, 0x1

    .end local v11           #c:I
    .local v12, c:I
    aput v29, v6, v11

    move v11, v12

    .end local v12           #c:I
    .restart local v11       #c:I
    goto :goto_9

    .line 75
    .end local v29           #x:I
    :cond_6
    add-int/lit8 v24, v24, 0x1

    goto :goto_8

    .line 74
    .end local v6           #array:[I
    .end local v11           #c:I
    .end local v20           #i$:Ljava/util/Iterator;
    :cond_7
    add-int/lit8 v26, v26, 0x1

    goto :goto_7

    .line 81
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 82
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 84
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 85
    const/16 v26, 0x0

    :goto_a
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_b

    .line 86
    const/16 v24, 0x0

    :goto_b
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_a

    .line 87
    aget-object v30, v16, v24

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getPositions()Ljava/util/List;

    move-result-object v2

    .line 88
    .local v2, L:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v30

    move/from16 v0, v30

    new-array v6, v0, [I

    .line 89
    .restart local v6       #array:[I
    const/4 v11, 0x0

    .line 90
    .restart local v11       #c:I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .restart local v20       #i$:Ljava/util/Iterator;
    :goto_c
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_9

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/Integer;

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Integer;->intValue()I

    move-result v29

    .line 91
    .restart local v29       #x:I
    add-int/lit8 v12, v11, 0x1

    .end local v11           #c:I
    .restart local v12       #c:I
    aput v29, v6, v11

    move v11, v12

    .end local v12           #c:I
    .restart local v11       #c:I
    goto :goto_c

    .line 86
    .end local v29           #x:I
    :cond_9
    add-int/lit8 v24, v24, 0x1

    goto :goto_b

    .line 85
    .end local v2           #L:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v6           #array:[I
    .end local v11           #c:I
    .end local v20           #i$:Ljava/util/Iterator;
    :cond_a
    add-int/lit8 v26, v26, 0x1

    goto :goto_a

    .line 93
    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 94
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 97
    const/16 v26, 0x0

    :goto_d
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_e

    .line 98
    const/16 v24, 0x0

    :goto_e
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_d

    .line 99
    aget-object v30, v16, v24

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v22

    .line 100
    .local v22, iter:Lcom/googlecode/javaewah/IntIterator;
    :goto_f
    invoke-interface/range {v22 .. v22}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_c

    .line 101
    invoke-interface/range {v22 .. v22}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    goto :goto_f

    .line 98
    :cond_c
    add-int/lit8 v24, v24, 0x1

    goto :goto_e

    .line 97
    .end local v22           #iter:Lcom/googlecode/javaewah/IntIterator;
    :cond_d
    add-int/lit8 v26, v26, 0x1

    goto :goto_d

    .line 104
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 105
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 106
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t\t\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 108
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 109
    const/16 v26, 0x0

    :goto_10
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_11

    .line 110
    const/16 v24, 0x0

    :goto_11
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_10

    .line 111
    const/16 v30, 0x0

    aget-object v19, v16, v30

    .line 112
    .local v19, ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v23, 0x1

    .local v23, j:I
    :goto_12
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v30

    if-ge v0, v1, :cond_f

    .line 113
    aget-object v30, v16, v23

    move-object/from16 v0, v19

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->or(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v19

    .line 112
    add-int/lit8 v23, v23, 0x1

    goto :goto_12

    .line 115
    :cond_f
    invoke-virtual/range {v19 .. v19}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 110
    add-int/lit8 v24, v24, 0x1

    goto :goto_11

    .line 109
    .end local v19           #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v23           #j:I
    :cond_10
    add-int/lit8 v26, v26, 0x1

    goto :goto_10

    .line 117
    :cond_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 118
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 120
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 121
    const/16 v26, 0x0

    :goto_13
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_14

    .line 122
    const/16 v24, 0x0

    :goto_14
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_13

    .line 123
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-object/from16 v18, v0

    .line 124
    .local v18, ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v23, 0x0

    .restart local v23       #j:I
    :goto_15
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v30

    if-ge v0, v1, :cond_12

    .line 125
    aget-object v30, v16, v23

    aput-object v30, v18, v23

    .line 124
    add-int/lit8 v23, v23, 0x1

    goto :goto_15

    .line 127
    :cond_12
    invoke-static/range {v18 .. v18}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->or([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v19

    .line 129
    .restart local v19       #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual/range {v19 .. v19}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 122
    add-int/lit8 v24, v24, 0x1

    goto :goto_14

    .line 121
    .end local v18           #ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v19           #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v23           #j:I
    :cond_13
    add-int/lit8 v26, v26, 0x1

    goto :goto_13

    .line 131
    :cond_14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 132
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 136
    const/16 v26, 0x0

    :goto_16
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_17

    .line 137
    const/16 v24, 0x0

    :goto_17
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_16

    .line 138
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-object/from16 v18, v0

    .line 139
    .restart local v18       #ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v23, 0x0

    .restart local v23       #j:I
    :goto_18
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v30

    if-ge v0, v1, :cond_15

    .line 140
    aget-object v30, v16, v23

    aput-object v30, v18, v23

    .line 139
    add-int/lit8 v23, v23, 0x1

    goto :goto_18

    .line 142
    :cond_15
    invoke-static/range {v18 .. v18}, Lcom/googlecode/javaewah/FastAggregation;->or([Lcom/googlecode/javaewah/LogicalElement;)Lcom/googlecode/javaewah/LogicalElement;

    move-result-object v19

    check-cast v19, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 143
    .restart local v19       #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual/range {v19 .. v19}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 137
    add-int/lit8 v24, v24, 0x1

    goto :goto_17

    .line 136
    .end local v18           #ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v19           #ewahor:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v23           #j:I
    :cond_16
    add-int/lit8 v26, v26, 0x1

    goto :goto_16

    .line 145
    :cond_17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 146
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 148
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 149
    const/16 v26, 0x0

    :goto_19
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_1a

    .line 150
    const/16 v24, 0x0

    :goto_1a
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_19

    .line 151
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Lcom/googlecode/javaewah32/IteratingRLW32;

    move-object/from16 v18, v0

    .line 152
    .local v18, ewahcp:[Lcom/googlecode/javaewah32/IteratingRLW32;
    const/16 v23, 0x0

    .restart local v23       #j:I
    :goto_1b
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v30

    if-ge v0, v1, :cond_18

    .line 153
    aget-object v30, v16, v23

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getIteratingRLW()Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v30

    aput-object v30, v18, v23

    .line 152
    add-int/lit8 v23, v23, 0x1

    goto :goto_1b

    .line 155
    :cond_18
    invoke-static/range {v18 .. v18}, Lcom/googlecode/javaewah32/IteratorAggregation32;->bufferedor([Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v19

    .line 156
    .local v19, ewahor:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah32/IteratorUtil32;->materialize(Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 150
    add-int/lit8 v24, v24, 0x1

    goto :goto_1a

    .line 149
    .end local v18           #ewahcp:[Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v19           #ewahor:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v23           #j:I
    :cond_19
    add-int/lit8 v26, v26, 0x1

    goto :goto_19

    .line 158
    :cond_1a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 160
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 161
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t\t\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 164
    const/16 v26, 0x0

    :goto_1c
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_1d

    .line 165
    const/16 v24, 0x0

    :goto_1d
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_1c

    .line 166
    const/16 v30, 0x0

    aget-object v17, v16, v30

    .line 167
    .local v17, ewahand:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v23, 0x1

    .restart local v23       #j:I
    :goto_1e
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v30

    if-ge v0, v1, :cond_1b

    .line 168
    aget-object v30, v16, v23

    move-object/from16 v0, v17

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v17

    .line 167
    add-int/lit8 v23, v23, 0x1

    goto :goto_1e

    .line 170
    :cond_1b
    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 165
    add-int/lit8 v24, v24, 0x1

    goto :goto_1d

    .line 164
    .end local v17           #ewahand:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v23           #j:I
    :cond_1c
    add-int/lit8 v26, v26, 0x1

    goto :goto_1c

    .line 172
    :cond_1d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 173
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 175
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 176
    const/16 v26, 0x0

    :goto_1f
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_20

    .line 177
    const/16 v24, 0x0

    :goto_20
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_1f

    .line 178
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-object/from16 v18, v0

    .line 179
    .local v18, ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    const/16 v23, 0x0

    .restart local v23       #j:I
    :goto_21
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v30

    if-ge v0, v1, :cond_1e

    .line 180
    aget-object v30, v16, v23

    aput-object v30, v18, v23

    .line 179
    add-int/lit8 v23, v23, 0x1

    goto :goto_21

    .line 182
    :cond_1e
    invoke-static/range {v18 .. v18}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->and([Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v17

    .line 184
    .restart local v17       #ewahand:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 177
    add-int/lit8 v24, v24, 0x1

    goto :goto_20

    .line 176
    .end local v17           #ewahand:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v18           #ewahcp:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v23           #j:I
    :cond_1f
    add-int/lit8 v26, v26, 0x1

    goto :goto_1f

    .line 186
    :cond_20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 187
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 191
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 192
    const/16 v26, 0x0

    :goto_22
    move/from16 v0, v26

    move/from16 v1, p2

    if-ge v0, v1, :cond_23

    .line 193
    const/16 v24, 0x0

    :goto_23
    move/from16 v0, v24

    move/from16 v1, p0

    if-ge v0, v1, :cond_22

    .line 194
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Lcom/googlecode/javaewah32/IteratingRLW32;

    move-object/from16 v18, v0

    .line 195
    .local v18, ewahcp:[Lcom/googlecode/javaewah32/IteratingRLW32;
    const/16 v23, 0x0

    .restart local v23       #j:I
    :goto_24
    add-int/lit8 v30, v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v30

    if-ge v0, v1, :cond_21

    .line 196
    aget-object v30, v16, v23

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getIteratingRLW()Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v30

    aput-object v30, v18, v23

    .line 195
    add-int/lit8 v23, v23, 0x1

    goto :goto_24

    .line 198
    :cond_21
    invoke-static/range {v18 .. v18}, Lcom/googlecode/javaewah32/IteratorAggregation32;->bufferedand([Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v17

    .line 199
    .local v17, ewahand:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-static/range {v17 .. v17}, Lcom/googlecode/javaewah32/IteratorUtil32;->materialize(Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeInBits()I

    move-result v30

    move/from16 v0, v30

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v9, v9, v30

    .line 193
    add-int/lit8 v24, v24, 0x1

    goto :goto_23

    .line 192
    .end local v17           #ewahand:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v18           #ewahcp:[Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v23           #j:I
    :cond_22
    add-int/lit8 v26, v26, 0x1

    goto :goto_22

    .line 201
    :cond_23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 203
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\t"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    sub-long v31, v4, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x408f400000000000L

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 206
    sget-object v30, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v31, "time for building, toArray(), Java iterator, intIterator,\t\t\t logical or (2-by-2), logical or (grouped), FastAggregation.or, iterator-based or, \t\t\t (2-by-2) and,  logical and (grouped), iterator-based and"

    invoke-virtual/range {v30 .. v31}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 208
    sget-object v30, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 209
    sget-object v30, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "# bogus ="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 34
    add-int/lit8 v28, v28, 0x2

    goto/16 :goto_0

    .line 211
    .end local v3           #Max:I
    .end local v4           #aft:J
    .end local v7           #bef:J
    .end local v9           #bogus:J
    .end local v14           #data:[[I
    .end local v16           #ewah:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v21           #inter:[I
    .end local v24           #k:I
    .end local v25           #line:Ljava/lang/String;
    .end local v26           #r:I
    .end local v27           #size:I
    :cond_24
    return-void
.end method
