.class public Lcom/googlecode/javaewah/benchmark/Benchmark;
.super Ljava/lang/Object;
.source "Benchmark.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3
    .parameter "args"

    .prologue
    .line 79
    const/16 v0, 0x64

    const/16 v1, 0x10

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/googlecode/javaewah/benchmark/Benchmark;->test(III)V

    .line 80
    return-void
.end method

.method public static test(III)V
    .locals 39
    .parameter "N"
    .parameter "nbr"
    .parameter "repeat"

    .prologue
    .line 84
    new-instance v15, Ljava/text/DecimalFormat;

    const-string v34, "0.###"

    move-object/from16 v0, v34

    invoke-direct {v15, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 85
    .local v15, df:Ljava/text/DecimalFormat;
    new-instance v13, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;

    invoke-direct {v13}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;-><init>()V

    .line 86
    .local v13, cdg:Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;
    const/16 v32, 0x1

    .local v32, sparsity:I
    :goto_0
    rsub-int/lit8 v34, p1, 0x1e

    move/from16 v0, v32

    move/from16 v1, v34

    if-ge v0, v1, :cond_2a

    .line 87
    const-wide/16 v9, 0x0

    .line 88
    .local v9, bogus:J
    const-string v27, ""

    .line 90
    .local v27, line:Ljava/lang/String;
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 91
    move/from16 v0, p0

    new-array v14, v0, [[I

    .line 92
    .local v14, data:[[I
    const/16 v34, 0x1

    add-int v35, p1, v32

    shl-int v3, v34, v35

    .line 93
    .local v3, Max:I
    sget-object v34, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v35, "# generating random data..."

    invoke-virtual/range {v34 .. v35}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    const/16 v34, 0x1

    div-int/lit8 v35, p1, 0x2

    shl-int v34, v34, v35

    move/from16 v0, v34

    invoke-virtual {v13, v0, v3}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->generateClustered(II)[I

    move-result-object v23

    .line 95
    .local v23, inter:[I
    const/16 v26, 0x0

    .local v26, k:I
    :goto_1
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_0

    .line 96
    const/16 v34, 0x1

    shl-int v34, v34, p1

    move/from16 v0, v34

    invoke-virtual {v13, v0, v3}, Lcom/googlecode/javaewah/benchmark/ClusteredDataGenerator;->generateClustered(II)[I

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lcom/googlecode/javaewah/benchmark/Benchmark;->unite2by2([I[I)[I

    move-result-object v34

    aput-object v34, v14, v26

    .line 95
    add-int/lit8 v26, v26, 0x1

    goto :goto_1

    .line 97
    :cond_0
    sget-object v34, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v35, "# generating random data... ok."

    invoke-virtual/range {v34 .. v35}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 99
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 100
    .local v7, bef:J
    move/from16 v0, p0

    new-array v0, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-object/from16 v16, v0

    .line 101
    .local v16, ewah:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v31, 0x0

    .line 102
    .local v31, size:I
    const/16 v30, 0x0

    .local v30, r:I
    :goto_2
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_3

    .line 103
    const/16 v31, 0x0

    .line 104
    const/16 v26, 0x0

    :goto_3
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_2

    .line 105
    new-instance v34, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    aput-object v34, v16, v26

    .line 106
    const/16 v33, 0x0

    .local v33, x:I
    :goto_4
    aget-object v34, v14, v26

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v34, v0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_1

    .line 107
    aget-object v34, v16, v26

    aget-object v35, v14, v26

    aget v35, v35, v33

    invoke-virtual/range {v34 .. v35}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->set(I)Z

    .line 106
    add-int/lit8 v33, v33, 0x1

    goto :goto_4

    .line 109
    :cond_1
    aget-object v34, v16, v26

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v34

    add-int v31, v31, v34

    .line 104
    add-int/lit8 v26, v26, 0x1

    goto :goto_3

    .line 102
    .end local v33           #x:I
    :cond_2
    add-int/lit8 v30, v30, 0x1

    goto :goto_2

    .line 112
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 113
    .local v4, aft:J
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 114
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 116
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 117
    const/16 v30, 0x0

    :goto_5
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_5

    .line 118
    const/16 v26, 0x0

    :goto_6
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_4

    .line 119
    aget-object v34, v16, v26

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->toArray()[I

    move-result-object v6

    .line 120
    .local v6, array:[I
    array-length v0, v6

    move/from16 v34, v0

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 118
    add-int/lit8 v26, v26, 0x1

    goto :goto_6

    .line 117
    .end local v6           #array:[I
    :cond_4
    add-int/lit8 v30, v30, 0x1

    goto :goto_5

    .line 122
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 123
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 125
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 126
    const/16 v30, 0x0

    :goto_7
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_8

    .line 127
    const/16 v26, 0x0

    :goto_8
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_7

    .line 128
    aget-object v34, v16, v26

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->cardinality()I

    move-result v34

    move/from16 v0, v34

    new-array v6, v0, [I

    .line 129
    .restart local v6       #array:[I
    const/4 v11, 0x0

    .line 130
    .local v11, c:I
    aget-object v34, v16, v26

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->iterator()Ljava/util/Iterator;

    move-result-object v22

    .local v22, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_6

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/Integer;

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Integer;->intValue()I

    move-result v33

    .line 131
    .restart local v33       #x:I
    add-int/lit8 v12, v11, 0x1

    .end local v11           #c:I
    .local v12, c:I
    aput v33, v6, v11

    move v11, v12

    .end local v12           #c:I
    .restart local v11       #c:I
    goto :goto_9

    .line 127
    .end local v33           #x:I
    :cond_6
    add-int/lit8 v26, v26, 0x1

    goto :goto_8

    .line 126
    .end local v6           #array:[I
    .end local v11           #c:I
    .end local v22           #i$:Ljava/util/Iterator;
    :cond_7
    add-int/lit8 v30, v30, 0x1

    goto :goto_7

    .line 133
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 134
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 137
    const/16 v30, 0x0

    :goto_a
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_b

    .line 138
    const/16 v26, 0x0

    :goto_b
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_a

    .line 139
    aget-object v34, v16, v26

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getPositions()Ljava/util/List;

    move-result-object v2

    .line 140
    .local v2, L:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v34

    move/from16 v0, v34

    new-array v6, v0, [I

    .line 141
    .restart local v6       #array:[I
    const/4 v11, 0x0

    .line 142
    .restart local v11       #c:I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v22

    .restart local v22       #i$:Ljava/util/Iterator;
    :goto_c
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_9

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/Integer;

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Integer;->intValue()I

    move-result v33

    .line 143
    .restart local v33       #x:I
    add-int/lit8 v12, v11, 0x1

    .end local v11           #c:I
    .restart local v12       #c:I
    aput v33, v6, v11

    move v11, v12

    .end local v12           #c:I
    .restart local v11       #c:I
    goto :goto_c

    .line 138
    .end local v33           #x:I
    :cond_9
    add-int/lit8 v26, v26, 0x1

    goto :goto_b

    .line 137
    .end local v2           #L:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v6           #array:[I
    .end local v11           #c:I
    .end local v22           #i$:Ljava/util/Iterator;
    :cond_a
    add-int/lit8 v30, v30, 0x1

    goto :goto_a

    .line 145
    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 146
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 148
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 149
    const/16 v30, 0x0

    :goto_d
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_e

    .line 150
    const/16 v26, 0x0

    :goto_e
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_d

    .line 151
    aget-object v34, v16, v26

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v24

    .line 152
    .local v24, iter:Lcom/googlecode/javaewah/IntIterator;
    :goto_f
    invoke-interface/range {v24 .. v24}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_c

    .line 153
    invoke-interface/range {v24 .. v24}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    goto :goto_f

    .line 150
    :cond_c
    add-int/lit8 v26, v26, 0x1

    goto :goto_e

    .line 149
    .end local v24           #iter:Lcom/googlecode/javaewah/IntIterator;
    :cond_d
    add-int/lit8 v30, v30, 0x1

    goto :goto_d

    .line 156
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 157
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 158
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t\t\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 160
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 161
    const/16 v30, 0x0

    :goto_10
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_11

    .line 162
    const/16 v26, 0x0

    :goto_11
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_10

    .line 163
    const/16 v34, 0x0

    aget-object v20, v16, v34

    .line 164
    .local v20, ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v25, 0x1

    .local v25, j:I
    :goto_12
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_f

    .line 165
    aget-object v34, v16, v25

    move-object/from16 v0, v20

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v20

    .line 164
    add-int/lit8 v25, v25, 0x1

    goto :goto_12

    .line 167
    :cond_f
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 162
    add-int/lit8 v26, v26, 0x1

    goto :goto_11

    .line 161
    .end local v20           #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v25           #j:I
    :cond_10
    add-int/lit8 v30, v30, 0x1

    goto :goto_10

    .line 169
    :cond_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 170
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 172
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 173
    const/16 v30, 0x0

    :goto_13
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_14

    .line 174
    const/16 v26, 0x0

    :goto_14
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_13

    .line 175
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-object/from16 v19, v0

    .line 176
    .local v19, ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v25, 0x0

    .restart local v25       #j:I
    :goto_15
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_12

    .line 177
    aget-object v34, v16, v25

    aput-object v34, v19, v25

    .line 176
    add-int/lit8 v25, v25, 0x1

    goto :goto_15

    .line 179
    :cond_12
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v20

    .line 181
    .restart local v20       #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 174
    add-int/lit8 v26, v26, 0x1

    goto :goto_14

    .line 173
    .end local v19           #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v20           #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v25           #j:I
    :cond_13
    add-int/lit8 v30, v30, 0x1

    goto :goto_13

    .line 183
    :cond_14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 184
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 187
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 188
    const/16 v30, 0x0

    :goto_16
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_17

    .line 189
    const/16 v26, 0x0

    :goto_17
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_16

    .line 190
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-object/from16 v19, v0

    .line 191
    .restart local v19       #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v25, 0x0

    .restart local v25       #j:I
    :goto_18
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_15

    .line 192
    aget-object v34, v16, v25

    aput-object v34, v19, v25

    .line 191
    add-int/lit8 v25, v25, 0x1

    goto :goto_18

    .line 194
    :cond_15
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah/FastAggregation;->or([Lcom/googlecode/javaewah/LogicalElement;)Lcom/googlecode/javaewah/LogicalElement;

    move-result-object v20

    check-cast v20, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 195
    .restart local v20       #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 189
    add-int/lit8 v26, v26, 0x1

    goto :goto_17

    .line 188
    .end local v19           #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v20           #ewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v25           #j:I
    :cond_16
    add-int/lit8 v30, v30, 0x1

    goto :goto_16

    .line 197
    :cond_17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 198
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 201
    const/16 v26, 0x0

    :goto_19
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_1a

    .line 202
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Lcom/googlecode/javaewah/IteratingRLW;

    move-object/from16 v19, v0

    .line 203
    .local v19, ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    const/16 v25, 0x0

    .restart local v25       #j:I
    :goto_1a
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_18

    .line 204
    aget-object v34, v16, v25

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getIteratingRLW()Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v34

    aput-object v34, v19, v25

    .line 203
    add-int/lit8 v25, v25, 0x1

    goto :goto_1a

    .line 206
    :cond_18
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedor([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v20

    .line 207
    .local v20, ewahor:Lcom/googlecode/javaewah/IteratingRLW;
    add-int/lit8 v34, v26, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v34

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v34

    check-cast v34, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-static/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v21

    .line 208
    .local v21, ewahorp:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static/range {v20 .. v20}, Lcom/googlecode/javaewah/IteratorUtil;->materialize(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v29

    .line 209
    .local v29, mewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    move-object/from16 v0, v21

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-nez v34, :cond_19

    new-instance v34, Ljava/lang/RuntimeException;

    const-string v35, "bug"

    invoke-direct/range {v34 .. v35}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v34

    .line 201
    :cond_19
    add-int/lit8 v26, v26, 0x1

    goto :goto_19

    .line 211
    .end local v19           #ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    .end local v20           #ewahor:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v21           #ewahorp:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v25           #j:I
    .end local v29           #mewahor:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_1a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 212
    const/16 v30, 0x0

    :goto_1b
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_1d

    .line 213
    const/16 v26, 0x0

    :goto_1c
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_1c

    .line 214
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Lcom/googlecode/javaewah/IteratingRLW;

    move-object/from16 v19, v0

    .line 215
    .restart local v19       #ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    const/16 v25, 0x0

    .restart local v25       #j:I
    :goto_1d
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_1b

    .line 216
    aget-object v34, v16, v25

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getIteratingRLW()Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v34

    aput-object v34, v19, v25

    .line 215
    add-int/lit8 v25, v25, 0x1

    goto :goto_1d

    .line 218
    :cond_1b
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedor([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v20

    .line 219
    .restart local v20       #ewahor:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-static/range {v20 .. v20}, Lcom/googlecode/javaewah/IteratorUtil;->materialize(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 213
    add-int/lit8 v26, v26, 0x1

    goto :goto_1c

    .line 212
    .end local v19           #ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    .end local v20           #ewahor:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v25           #j:I
    :cond_1c
    add-int/lit8 v30, v30, 0x1

    goto :goto_1b

    .line 221
    :cond_1d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 223
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 224
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t\t\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 226
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 227
    const/16 v30, 0x0

    :goto_1e
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_20

    .line 228
    const/16 v26, 0x0

    :goto_1f
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_1f

    .line 229
    const/16 v34, 0x0

    aget-object v17, v16, v34

    .line 230
    .local v17, ewahand:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v25, 0x1

    .restart local v25       #j:I
    :goto_20
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_1e

    .line 231
    aget-object v34, v16, v25

    move-object/from16 v0, v17

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v17

    .line 230
    add-int/lit8 v25, v25, 0x1

    goto :goto_20

    .line 233
    :cond_1e
    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 228
    add-int/lit8 v26, v26, 0x1

    goto :goto_1f

    .line 227
    .end local v17           #ewahand:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v25           #j:I
    :cond_1f
    add-int/lit8 v30, v30, 0x1

    goto :goto_1e

    .line 235
    :cond_20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 236
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 238
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 239
    const/16 v30, 0x0

    :goto_21
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_23

    .line 240
    const/16 v26, 0x0

    :goto_22
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_22

    .line 241
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-object/from16 v19, v0

    .line 242
    .local v19, ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    const/16 v25, 0x0

    .restart local v25       #j:I
    :goto_23
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_21

    .line 243
    aget-object v34, v16, v25

    aput-object v34, v19, v25

    .line 242
    add-int/lit8 v25, v25, 0x1

    goto :goto_23

    .line 245
    :cond_21
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v17

    .line 247
    .restart local v17       #ewahand:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 240
    add-int/lit8 v26, v26, 0x1

    goto :goto_22

    .line 239
    .end local v17           #ewahand:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v19           #ewahcp:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v25           #j:I
    :cond_22
    add-int/lit8 v30, v30, 0x1

    goto :goto_21

    .line 249
    :cond_23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 250
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 252
    const/16 v26, 0x0

    :goto_24
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_26

    .line 253
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Lcom/googlecode/javaewah/IteratingRLW;

    move-object/from16 v19, v0

    .line 254
    .local v19, ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    const/16 v25, 0x0

    .restart local v25       #j:I
    :goto_25
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_24

    .line 255
    aget-object v34, v16, v25

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getIteratingRLW()Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v34

    aput-object v34, v19, v25

    .line 254
    add-int/lit8 v25, v25, 0x1

    goto :goto_25

    .line 257
    :cond_24
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedand([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v17

    .line 258
    .local v17, ewahand:Lcom/googlecode/javaewah/IteratingRLW;
    add-int/lit8 v34, v26, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v34

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v34

    check-cast v34, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-static/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and([Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v18

    .line 259
    .local v18, ewahandp:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static/range {v17 .. v17}, Lcom/googlecode/javaewah/IteratorUtil;->materialize(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v28

    .line 260
    .local v28, mewahand:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    move-object/from16 v0, v18

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-nez v34, :cond_25

    new-instance v34, Ljava/lang/RuntimeException;

    const-string v35, "bug"

    invoke-direct/range {v34 .. v35}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v34

    .line 252
    :cond_25
    add-int/lit8 v26, v26, 0x1

    goto :goto_24

    .line 263
    .end local v17           #ewahand:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v18           #ewahandp:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v19           #ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    .end local v25           #j:I
    .end local v28           #mewahand:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 264
    const/16 v30, 0x0

    :goto_26
    move/from16 v0, v30

    move/from16 v1, p2

    if-ge v0, v1, :cond_29

    .line 265
    const/16 v26, 0x0

    :goto_27
    move/from16 v0, v26

    move/from16 v1, p0

    if-ge v0, v1, :cond_28

    .line 266
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Lcom/googlecode/javaewah/IteratingRLW;

    move-object/from16 v19, v0

    .line 267
    .restart local v19       #ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    const/16 v25, 0x0

    .restart local v25       #j:I
    :goto_28
    add-int/lit8 v34, v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v34

    if-ge v0, v1, :cond_27

    .line 268
    aget-object v34, v16, v25

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getIteratingRLW()Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v34

    aput-object v34, v19, v25

    .line 267
    add-int/lit8 v25, v25, 0x1

    goto :goto_28

    .line 270
    :cond_27
    invoke-static/range {v19 .. v19}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedand([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v17

    .line 271
    .restart local v17       #ewahand:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-static/range {v17 .. v17}, Lcom/googlecode/javaewah/IteratorUtil;->materialize(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBits()I

    move-result v34

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v9, v9, v34

    .line 265
    add-int/lit8 v26, v26, 0x1

    goto :goto_27

    .line 264
    .end local v17           #ewahand:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v19           #ewahcp:[Lcom/googlecode/javaewah/IteratingRLW;
    .end local v25           #j:I
    :cond_28
    add-int/lit8 v30, v30, 0x1

    goto :goto_26

    .line 273
    :cond_29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 275
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, "\t"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    sub-long v35, v4, v7

    move-wide/from16 v0, v35

    long-to-double v0, v0

    move-wide/from16 v35, v0

    const-wide v37, 0x408f400000000000L

    div-double v35, v35, v37

    move-wide/from16 v0, v35

    invoke-virtual {v15, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 278
    sget-object v34, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v35, "time for building, toArray(), Java iterator, intIterator,\t\t\t logical or (2-by-2), logical or (grouped), FastAggregation.or, iterator-based or, \t\t\t (2-by-2) and,  logical and (grouped), iterator-based and"

    invoke-virtual/range {v34 .. v35}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 280
    sget-object v34, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object/from16 v0, v34

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 281
    sget-object v34, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-direct/range {v35 .. v35}, Ljava/lang/StringBuilder;-><init>()V

    const-string v36, "# bogus ="

    invoke-virtual/range {v35 .. v36}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 86
    add-int/lit8 v32, v32, 0x2

    goto/16 :goto_0

    .line 283
    .end local v3           #Max:I
    .end local v4           #aft:J
    .end local v7           #bef:J
    .end local v9           #bogus:J
    .end local v14           #data:[[I
    .end local v16           #ewah:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v23           #inter:[I
    .end local v26           #k:I
    .end local v27           #line:Ljava/lang/String;
    .end local v30           #r:I
    .end local v31           #size:I
    :cond_2a
    return-void
.end method

.method public static unite2by2([I[I)[I
    .locals 7
    .parameter "set1"
    .parameter "set2"

    .prologue
    .line 32
    const/4 v3, 0x0

    .line 33
    .local v3, pos:I
    const/4 v1, 0x0

    .local v1, k1:I
    const/4 v2, 0x0

    .line 34
    .local v2, k2:I
    array-length v5, p0

    if-nez v5, :cond_0

    .line 35
    array-length v5, p1

    invoke-static {p1, v5}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v5

    .line 72
    :goto_0
    return-object v5

    .line 36
    :cond_0
    array-length v5, p1

    if-nez v5, :cond_1

    .line 37
    array-length v5, p0

    invoke-static {p0, v5}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v5

    goto :goto_0

    .line 38
    :cond_1
    array-length v5, p0

    array-length v6, p1

    add-int/2addr v5, v6

    new-array v0, v5, [I

    .line 40
    .local v0, buffer:[I
    :goto_1
    aget v5, p0, v1

    aget v6, p1, v2

    if-ge v5, v6, :cond_2

    .line 41
    add-int/lit8 v4, v3, 0x1

    .end local v3           #pos:I
    .local v4, pos:I
    aget v5, p0, v1

    aput v5, v0, v3

    .line 42
    add-int/lit8 v1, v1, 0x1

    .line 43
    array-length v5, p0

    if-lt v1, v5, :cond_6

    move v3, v4

    .line 44
    .end local v4           #pos:I
    .restart local v3       #pos:I
    :goto_2
    array-length v5, p1

    if-ge v2, v5, :cond_5

    .line 45
    add-int/lit8 v4, v3, 0x1

    .end local v3           #pos:I
    .restart local v4       #pos:I
    aget v5, p1, v2

    aput v5, v0, v3

    .line 44
    add-int/lit8 v2, v2, 0x1

    move v3, v4

    .end local v4           #pos:I
    .restart local v3       #pos:I
    goto :goto_2

    .line 48
    :cond_2
    aget v5, p0, v1

    aget v6, p1, v2

    if-ne v5, v6, :cond_4

    .line 49
    add-int/lit8 v4, v3, 0x1

    .end local v3           #pos:I
    .restart local v4       #pos:I
    aget v5, p0, v1

    aput v5, v0, v3

    .line 50
    add-int/lit8 v1, v1, 0x1

    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    array-length v5, p0

    if-lt v1, v5, :cond_3

    move v3, v4

    .line 53
    .end local v4           #pos:I
    .restart local v3       #pos:I
    :goto_3
    array-length v5, p1

    if-ge v2, v5, :cond_5

    .line 54
    add-int/lit8 v4, v3, 0x1

    .end local v3           #pos:I
    .restart local v4       #pos:I
    aget v5, p1, v2

    aput v5, v0, v3

    .line 53
    add-int/lit8 v2, v2, 0x1

    move v3, v4

    .end local v4           #pos:I
    .restart local v3       #pos:I
    goto :goto_3

    .line 57
    .end local v3           #pos:I
    .restart local v4       #pos:I
    :cond_3
    array-length v5, p1

    if-lt v2, v5, :cond_6

    move v3, v4

    .line 58
    .end local v4           #pos:I
    .restart local v3       #pos:I
    :goto_4
    array-length v5, p0

    if-ge v1, v5, :cond_5

    .line 59
    add-int/lit8 v4, v3, 0x1

    .end local v3           #pos:I
    .restart local v4       #pos:I
    aget v5, p0, v1

    aput v5, v0, v3

    .line 58
    add-int/lit8 v1, v1, 0x1

    move v3, v4

    .end local v4           #pos:I
    .restart local v3       #pos:I
    goto :goto_4

    .line 63
    :cond_4
    add-int/lit8 v4, v3, 0x1

    .end local v3           #pos:I
    .restart local v4       #pos:I
    aget v5, p1, v2

    aput v5, v0, v3

    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    array-length v5, p1

    if-lt v2, v5, :cond_6

    move v3, v4

    .line 66
    .end local v4           #pos:I
    .restart local v3       #pos:I
    :goto_5
    array-length v5, p0

    if-ge v1, v5, :cond_5

    .line 67
    add-int/lit8 v4, v3, 0x1

    .end local v3           #pos:I
    .restart local v4       #pos:I
    aget v5, p0, v1

    aput v5, v0, v3

    .line 66
    add-int/lit8 v1, v1, 0x1

    move v3, v4

    .end local v4           #pos:I
    .restart local v3       #pos:I
    goto :goto_5

    .line 72
    :cond_5
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v5

    goto :goto_0

    .end local v3           #pos:I
    .restart local v4       #pos:I
    :cond_6
    move v3, v4

    .end local v4           #pos:I
    .restart local v3       #pos:I
    goto :goto_1
.end method
