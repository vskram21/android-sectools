.class public Lcom/googlecode/javaewah/FastAggregation;
.super Ljava/lang/Object;
.source "FastAggregation.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/googlecode/javaewah/FastAggregation;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/googlecode/javaewah/FastAggregation;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs bufferedand(I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 30
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 31
    .local v0, answer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {v0, p0, p1}, Lcom/googlecode/javaewah/FastAggregation;->bufferedandWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 32
    return-object v0
.end method

.method public static varargs bufferedandWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 16
    .parameter "container"
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 44
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 45
    .local v1, al:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;>;"
    move-object/from16 v2, p2

    .local v2, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v11, v2

    .local v11, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    :goto_0
    if-ge v9, v11, :cond_0

    aget-object v3, v2, v9

    .line 46
    .local v3, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    new-instance v12, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v12, v3}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    invoke-virtual {v1, v12}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 45
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 49
    .end local v3           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_0
    move-object/from16 v0, p2

    array-length v12, v0

    mul-int v12, v12, p1

    new-array v7, v12, [J

    .line 51
    .local v7, hardbitmap:[J
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    .line 52
    .local v8, i:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-interface {v8}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmp-long v12, v12, v14

    if-nez v12, :cond_1

    .line 53
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 57
    .end local v8           #i:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_2
    :goto_1
    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_7

    .line 58
    const-wide/16 v12, -0x1

    invoke-static {v7, v12, v13}, Ljava/util/Arrays;->fill([JJ)V

    .line 59
    const-wide/32 v5, 0x7fffffff

    .line 60
    .local v5, effective:J
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_3
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    .line 61
    .restart local v8       #i:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-static {v7, v8}, Lcom/googlecode/javaewah/IteratorAggregation;->inplaceand([JLcom/googlecode/javaewah/IteratingRLW;)I

    move-result v4

    .line 62
    .local v4, eff:I
    int-to-long v12, v4

    cmp-long v12, v12, v5

    if-gez v12, :cond_3

    .line 63
    int-to-long v5, v4

    goto :goto_2

    .line 65
    .end local v4           #eff:I
    .end local v8           #i:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_4
    const/4 v10, 0x0

    .local v10, k:I
    :goto_3
    int-to-long v12, v10

    cmp-long v12, v12, v5

    if-gez v12, :cond_5

    .line 66
    aget-wide v12, v7, v10

    move-object/from16 v0, p0

    invoke-interface {v0, v12, v13}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 65
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 67
    :cond_5
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    .line 68
    .restart local v8       #i:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-interface {v8}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmp-long v12, v12, v14

    if-nez v12, :cond_6

    .line 69
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    goto :goto_1

    .line 73
    .end local v5           #effective:J
    .end local v8           #i:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v10           #k:I
    :cond_7
    return-void
.end method

.method public static varargs bufferedor(I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 83
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 84
    .local v0, answer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {v0, p0, p1}, Lcom/googlecode/javaewah/FastAggregation;->bufferedorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 85
    return-object v0
.end method

.method public static varargs bufferedorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 18
    .parameter "container"
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 97
    const/4 v12, 0x0

    .line 98
    .local v12, range:I
    invoke-virtual/range {p2 .. p2}, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clone()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 99
    .local v13, sbitmaps:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    new-instance v14, Lcom/googlecode/javaewah/FastAggregation$1;

    invoke-direct {v14}, Lcom/googlecode/javaewah/FastAggregation$1;-><init>()V

    invoke-static {v13, v14}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 106
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .local v1, al:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;>;"
    move-object v2, v13

    .local v2, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v10, v2

    .local v10, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v10, :cond_1

    aget-object v3, v2, v8

    .line 108
    .local v3, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v14, v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-le v14, v12, :cond_0

    .line 109
    iget v12, v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 110
    :cond_0
    new-instance v14, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v14, v3}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 112
    .end local v3           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_1
    move/from16 v0, p1

    new-array v7, v0, [J

    .line 113
    .local v7, hardbitmap:[J
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 114
    .local v11, maxr:I
    :goto_1
    if-lez v11, :cond_6

    .line 115
    const-wide/16 v5, 0x0

    .line 116
    .local v5, effective:J
    const/4 v9, 0x0

    .local v9, k:I
    :goto_2
    if-ge v9, v11, :cond_4

    .line 117
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-virtual {v14}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-lez v14, :cond_3

    .line 118
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javaewah/IteratingRLW;

    invoke-static {v7, v14}, Lcom/googlecode/javaewah/IteratorAggregation;->inplaceor([JLcom/googlecode/javaewah/IteratingRLW;)I

    move-result v4

    .line 119
    .local v4, eff:I
    int-to-long v14, v4

    cmp-long v14, v14, v5

    if-lez v14, :cond_2

    .line 120
    int-to-long v5, v4

    .line 116
    .end local v4           #eff:I
    :cond_2
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 122
    :cond_3
    move v11, v9

    goto :goto_3

    .line 124
    :cond_4
    const/4 v9, 0x0

    :goto_4
    int-to-long v14, v9

    cmp-long v14, v14, v5

    if-gez v14, :cond_5

    .line 125
    aget-wide v14, v7, v9

    move-object/from16 v0, p0

    invoke-interface {v0, v14, v15}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 124
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 126
    :cond_5
    const-wide/16 v14, 0x0

    invoke-static {v7, v14, v15}, Ljava/util/Arrays;->fill([JJ)V

    goto :goto_1

    .line 129
    .end local v5           #effective:J
    .end local v9           #k:I
    :cond_6
    move-object/from16 v0, p0

    invoke-interface {v0, v12}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    .line 130
    return-void
.end method

.method public static varargs bufferedxor(I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 140
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 141
    .local v0, answer:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-static {v0, p0, p1}, Lcom/googlecode/javaewah/FastAggregation;->bufferedxorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 142
    return-object v0
.end method

.method public static varargs bufferedxorWithContainer(Lcom/googlecode/javaewah/BitmapStorage;I[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 18
    .parameter "container"
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 155
    const/4 v12, 0x0

    .line 156
    .local v12, range:I
    invoke-virtual/range {p2 .. p2}, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clone()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 157
    .local v13, sbitmaps:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    new-instance v14, Lcom/googlecode/javaewah/FastAggregation$2;

    invoke-direct {v14}, Lcom/googlecode/javaewah/FastAggregation$2;-><init>()V

    invoke-static {v13, v14}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 164
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .local v1, al:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;>;"
    move-object v2, v13

    .local v2, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v10, v2

    .local v10, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v10, :cond_1

    aget-object v3, v2, v8

    .line 166
    .local v3, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    iget v14, v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-le v14, v12, :cond_0

    .line 167
    iget v12, v3, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    .line 168
    :cond_0
    new-instance v14, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-direct {v14, v3}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 170
    .end local v3           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_1
    move/from16 v0, p1

    new-array v7, v0, [J

    .line 171
    .local v7, hardbitmap:[J
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 172
    .local v11, maxr:I
    :goto_1
    if-lez v11, :cond_6

    .line 173
    const-wide/16 v5, 0x0

    .line 174
    .local v5, effective:J
    const/4 v9, 0x0

    .local v9, k:I
    :goto_2
    if-ge v9, v11, :cond_4

    .line 175
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    invoke-virtual {v14}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-lez v14, :cond_3

    .line 176
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javaewah/IteratingRLW;

    invoke-static {v7, v14}, Lcom/googlecode/javaewah/IteratorAggregation;->inplacexor([JLcom/googlecode/javaewah/IteratingRLW;)I

    move-result v4

    .line 177
    .local v4, eff:I
    int-to-long v14, v4

    cmp-long v14, v14, v5

    if-lez v14, :cond_2

    .line 178
    int-to-long v5, v4

    .line 174
    .end local v4           #eff:I
    :cond_2
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 180
    :cond_3
    move v11, v9

    goto :goto_3

    .line 182
    :cond_4
    const/4 v9, 0x0

    :goto_4
    int-to-long v14, v9

    cmp-long v14, v14, v5

    if-gez v14, :cond_5

    .line 183
    aget-wide v14, v7, v9

    move-object/from16 v0, p0

    invoke-interface {v0, v14, v15}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 182
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 184
    :cond_5
    const-wide/16 v14, 0x0

    invoke-static {v7, v14, v15}, Ljava/util/Arrays;->fill([JJ)V

    goto :goto_1

    .line 186
    .end local v5           #effective:J
    .end local v9           #k:I
    :cond_6
    move-object/from16 v0, p0

    invoke-interface {v0, v12}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    .line 187
    return-void
.end method

.method public static varargs legacy_orWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 39
    .parameter "container"
    .parameter "bitmaps"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 308
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v35, v0

    const/16 v36, 0x2

    move/from16 v0, v35

    move/from16 v1, v36

    if-ne v0, v1, :cond_0

    .line 310
    const/16 v35, 0x0

    aget-object v35, p1, v35

    const/16 v36, 0x1

    aget-object v36, p1, v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->orToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 434
    :goto_0
    return-void

    .line 316
    :cond_0
    invoke-virtual/range {p1 .. p1}, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;->clone()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, [Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 317
    .local v30, sortedBitmaps:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    new-instance v35, Lcom/googlecode/javaewah/FastAggregation$7;

    invoke-direct/range {v35 .. v35}, Lcom/googlecode/javaewah/FastAggregation$7;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v35

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 325
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v35, v0

    move/from16 v0, v35

    new-array v0, v0, [Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-object/from16 v27, v0

    .line 326
    .local v27, rlws:[Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    const/4 v12, 0x0

    .line 327
    .local v12, maxAvailablePos:I
    move-object/from16 v4, v30

    .local v4, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v11, v4

    .local v11, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    move v13, v12

    .end local v12           #maxAvailablePos:I
    .local v13, maxAvailablePos:I
    :goto_1
    if-ge v8, v11, :cond_1

    aget-object v5, v4, v8

    .line 328
    .local v5, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v5}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->getEWAHIterator()Lcom/googlecode/javaewah/EWAHIterator;

    move-result-object v10

    .line 329
    .local v10, iterator:Lcom/googlecode/javaewah/EWAHIterator;
    invoke-virtual {v10}, Lcom/googlecode/javaewah/EWAHIterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_15

    .line 330
    add-int/lit8 v12, v13, 0x1

    .end local v13           #maxAvailablePos:I
    .restart local v12       #maxAvailablePos:I
    new-instance v35, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;

    move-object/from16 v0, v35

    invoke-direct {v0, v10}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;-><init>(Lcom/googlecode/javaewah/EWAHIterator;)V

    aput-object v35, v27, v13

    .line 327
    :goto_2
    add-int/lit8 v8, v8, 0x1

    move v13, v12

    .end local v12           #maxAvailablePos:I
    .restart local v13       #maxAvailablePos:I
    goto :goto_1

    .line 335
    .end local v5           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v10           #iterator:Lcom/googlecode/javaewah/EWAHIterator;
    :cond_1
    if-nez v13, :cond_2

    .line 336
    const/16 v35, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    goto :goto_0

    .line 340
    :cond_2
    const/16 v35, 0x0

    aget-object v35, v30, v35

    move-object/from16 v0, v35

    iget v0, v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    move/from16 v16, v0

    .local v16, maxSize:I
    move v12, v13

    .line 343
    .end local v13           #maxAvailablePos:I
    .restart local v12       #maxAvailablePos:I
    :cond_3
    const-wide/16 v14, 0x0

    .line 344
    .local v14, maxOneRl:J
    const-wide v21, 0x7fffffffffffffffL

    .line 345
    .local v21, minZeroRl:J
    const-wide v19, 0x7fffffffffffffffL

    .line 346
    .local v19, minSize:J
    const/16 v23, 0x0

    .line 347
    .local v23, numEmptyRl:I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_3
    if-ge v7, v12, :cond_4

    .line 348
    aget-object v26, v27, v7

    .line 349
    .local v26, rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->size()J

    move-result-wide v28

    .line 350
    .local v28, size:J
    const-wide/16 v35, 0x0

    cmp-long v35, v28, v35

    if-nez v35, :cond_5

    .line 351
    move v12, v7

    .line 372
    .end local v26           #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v28           #size:J
    :cond_4
    if-nez v12, :cond_8

    .line 433
    :goto_4
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah/BitmapStorage;->setSizeInBits(I)V

    goto :goto_0

    .line 354
    .restart local v26       #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .restart local v28       #size:J
    :cond_5
    move-wide/from16 v0, v19

    move-wide/from16 v2, v28

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v19

    .line 356
    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningBit()Z

    move-result v35

    if-eqz v35, :cond_7

    .line 357
    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v24

    .line 358
    .local v24, rl:J
    move-wide/from16 v0, v24

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v14

    .line 359
    const-wide/16 v21, 0x0

    .line 360
    const-wide/16 v35, 0x0

    cmp-long v35, v24, v35

    if-nez v35, :cond_6

    const-wide/16 v35, 0x0

    cmp-long v35, v28, v35

    if-lez v35, :cond_6

    .line 361
    add-int/lit8 v23, v23, 0x1

    .line 347
    :cond_6
    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 364
    .end local v24           #rl:J
    :cond_7
    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v24

    .line 365
    .restart local v24       #rl:J
    move-wide/from16 v0, v21

    move-wide/from16 v2, v24

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v21

    .line 366
    const-wide/16 v35, 0x0

    cmp-long v35, v24, v35

    if-nez v35, :cond_6

    const-wide/16 v35, 0x0

    cmp-long v35, v28, v35

    if-lez v35, :cond_6

    .line 367
    add-int/lit8 v23, v23, 0x1

    goto :goto_5

    .line 374
    .end local v24           #rl:J
    .end local v26           #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v28           #size:J
    :cond_8
    const/16 v35, 0x1

    move/from16 v0, v35

    if-ne v12, v0, :cond_9

    .line 376
    const/16 v35, 0x0

    aget-object v35, v27, v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discharge(Lcom/googlecode/javaewah/BitmapStorage;)V

    goto :goto_4

    .line 380
    :cond_9
    const-wide/16 v35, 0x0

    cmp-long v35, v14, v35

    if-lez v35, :cond_a

    .line 381
    const/16 v35, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-interface {v0, v1, v14, v15}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 382
    const/4 v7, 0x0

    :goto_6
    if-ge v7, v12, :cond_3

    .line 383
    aget-object v26, v27, v7

    .line 384
    .restart local v26       #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    move-object/from16 v0, v26

    invoke-virtual {v0, v14, v15}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 382
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 386
    .end local v26           #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_a
    const-wide/16 v35, 0x0

    cmp-long v35, v21, v35

    if-lez v35, :cond_b

    .line 387
    const/16 v35, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v35

    move-wide/from16 v2, v21

    invoke-interface {v0, v1, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 388
    const/4 v7, 0x0

    :goto_7
    if-ge v7, v12, :cond_3

    .line 389
    aget-object v26, v27, v7

    .line 390
    .restart local v26       #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    move-object/from16 v0, v26

    move-wide/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 388
    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 393
    .end local v26           #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_b
    const/4 v9, 0x0

    .line 395
    .local v9, index:I
    const/16 v35, 0x1

    move/from16 v0, v23

    move/from16 v1, v35

    if-ne v0, v1, :cond_10

    .line 398
    const/4 v6, 0x0

    .line 399
    .local v6, emptyRl:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    const-wide v17, 0x7fffffffffffffffL

    .line 400
    .local v17, minNonEmptyRl:J
    const/4 v7, 0x0

    :goto_8
    if-ge v7, v12, :cond_e

    .line 401
    aget-object v26, v27, v7

    .line 402
    .restart local v26       #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v24

    .line 403
    .restart local v24       #rl:J
    const-wide/16 v35, 0x0

    cmp-long v35, v24, v35

    if-nez v35, :cond_d

    .line 404
    sget-boolean v35, Lcom/googlecode/javaewah/FastAggregation;->$assertionsDisabled:Z

    if-nez v35, :cond_c

    if-eqz v6, :cond_c

    new-instance v35, Ljava/lang/AssertionError;

    invoke-direct/range {v35 .. v35}, Ljava/lang/AssertionError;-><init>()V

    throw v35

    .line 405
    :cond_c
    move-object/from16 v6, v26

    .line 400
    :goto_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 407
    :cond_d
    move-wide/from16 v0, v17

    move-wide/from16 v2, v24

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v17

    goto :goto_9

    .line 410
    .end local v24           #rl:J
    .end local v26           #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    :cond_e
    cmp-long v35, v17, v19

    if-lez v35, :cond_12

    move-wide/from16 v33, v19

    .line 411
    .local v33, wordsToWrite:J
    :goto_a
    if-eqz v6, :cond_f

    .line 412
    move-wide/from16 v0, v33

    long-to-int v0, v0

    move/from16 v35, v0

    move/from16 v0, v35

    move-object/from16 v1, p0

    invoke-virtual {v6, v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->writeLiteralWords(ILcom/googlecode/javaewah/BitmapStorage;)V

    .line 413
    :cond_f
    int-to-long v0, v9

    move-wide/from16 v35, v0

    add-long v35, v35, v33

    move-wide/from16 v0, v35

    long-to-int v9, v0

    .line 416
    .end local v6           #emptyRl:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v17           #minNonEmptyRl:J
    .end local v33           #wordsToWrite:J
    :cond_10
    :goto_b
    int-to-long v0, v9

    move-wide/from16 v35, v0

    cmp-long v35, v35, v19

    if-gez v35, :cond_14

    .line 417
    const-wide/16 v31, 0x0

    .line 418
    .local v31, word:J
    const/4 v7, 0x0

    :goto_c
    if-ge v7, v12, :cond_13

    .line 419
    aget-object v26, v27, v7

    .line 420
    .restart local v26       #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v35

    int-to-long v0, v9

    move-wide/from16 v37, v0

    cmp-long v35, v35, v37

    if-gtz v35, :cond_11

    .line 421
    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getRunningLength()J

    move-result-wide v35

    move-wide/from16 v0, v35

    long-to-int v0, v0

    move/from16 v35, v0

    sub-int v35, v9, v35

    move-object/from16 v0, v26

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->getLiteralWordAt(I)J

    move-result-wide v35

    or-long v31, v31, v35

    .line 418
    :cond_11
    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    .end local v26           #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v31           #word:J
    .restart local v6       #emptyRl:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .restart local v17       #minNonEmptyRl:J
    :cond_12
    move-wide/from16 v33, v17

    .line 410
    goto :goto_a

    .line 424
    .end local v6           #emptyRl:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .end local v17           #minNonEmptyRl:J
    .restart local v31       #word:J
    :cond_13
    move-object/from16 v0, p0

    move-wide/from16 v1, v31

    invoke-interface {v0, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 425
    add-int/lit8 v9, v9, 0x1

    .line 426
    goto :goto_b

    .line 427
    .end local v31           #word:J
    :cond_14
    const/4 v7, 0x0

    :goto_d
    if-ge v7, v12, :cond_3

    .line 428
    aget-object v26, v27, v7

    .line 429
    .restart local v26       #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    move-object/from16 v0, v26

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;->discardFirstWords(J)V

    .line 427
    add-int/lit8 v7, v7, 0x1

    goto :goto_d

    .end local v7           #i:I
    .end local v9           #index:I
    .end local v12           #maxAvailablePos:I
    .end local v14           #maxOneRl:J
    .end local v16           #maxSize:I
    .end local v19           #minSize:J
    .end local v21           #minZeroRl:J
    .end local v23           #numEmptyRl:I
    .end local v26           #rlw:Lcom/googlecode/javaewah/IteratingBufferedRunningLengthWord;
    .restart local v5       #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .restart local v10       #iterator:Lcom/googlecode/javaewah/EWAHIterator;
    .restart local v13       #maxAvailablePos:I
    :cond_15
    move v12, v13

    .end local v13           #maxAvailablePos:I
    .restart local v12       #maxAvailablePos:I
    goto/16 :goto_2
.end method

.method public static varargs or([Lcom/googlecode/javaewah/LogicalElement;)Lcom/googlecode/javaewah/LogicalElement;
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/googlecode/javaewah/LogicalElement;",
            ">([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, bitmaps:[Lcom/googlecode/javaewah/LogicalElement;,"[TT;"
    new-instance v3, Ljava/util/PriorityQueue;

    array-length v7, p0

    new-instance v8, Lcom/googlecode/javaewah/FastAggregation$3;

    invoke-direct {v8}, Lcom/googlecode/javaewah/FastAggregation$3;-><init>()V

    invoke-direct {v3, v7, v8}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 205
    .local v3, pq:Ljava/util/PriorityQueue;,"Ljava/util/PriorityQueue<TT;>;"
    move-object v0, p0

    .local v0, arr$:[Lcom/googlecode/javaewah/LogicalElement;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 206
    .local v4, x:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 208
    .end local v4           #x:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    :cond_0
    :goto_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_1

    .line 209
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javaewah/LogicalElement;

    .line 210
    .local v5, x1:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah/LogicalElement;

    .line 211
    .local v6, x2:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    invoke-interface {v5, v6}, Lcom/googlecode/javaewah/LogicalElement;->or(Ljava/lang/Object;)Lcom/googlecode/javaewah/LogicalElement;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 213
    .end local v5           #x1:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    .end local v6           #x2:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    :cond_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javaewah/LogicalElement;

    return-object v7
.end method

.method public static varargs orToContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 10
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    const/4 v9, 0x2

    .line 222
    array-length v7, p1

    if-ge v7, v9, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "We need at least two bitmaps"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 223
    :cond_0
    new-instance v3, Ljava/util/PriorityQueue;

    array-length v7, p1

    new-instance v8, Lcom/googlecode/javaewah/FastAggregation$4;

    invoke-direct {v8}, Lcom/googlecode/javaewah/FastAggregation$4;-><init>()V

    invoke-direct {v3, v7, v8}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 230
    .local v3, pq:Ljava/util/PriorityQueue;,"Ljava/util/PriorityQueue<Lcom/googlecode/javaewah/EWAHCompressedBitmap;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 231
    .local v4, x:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 230
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 233
    .end local v4           #x:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_1
    :goto_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    if-le v7, v9, :cond_2

    .line 234
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 235
    .local v5, x1:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 236
    .local v6, x2:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v5, v6}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->or(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 238
    .end local v5           #x1:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v6           #x2:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_2
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v7, v8, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->orToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 239
    return-void
.end method

.method public static varargs xor([Lcom/googlecode/javaewah/LogicalElement;)Lcom/googlecode/javaewah/LogicalElement;
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/googlecode/javaewah/LogicalElement;",
            ">([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 252
    .local p0, bitmaps:[Lcom/googlecode/javaewah/LogicalElement;,"[TT;"
    new-instance v3, Ljava/util/PriorityQueue;

    array-length v7, p0

    new-instance v8, Lcom/googlecode/javaewah/FastAggregation$5;

    invoke-direct {v8}, Lcom/googlecode/javaewah/FastAggregation$5;-><init>()V

    invoke-direct {v3, v7, v8}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 260
    .local v3, pq:Ljava/util/PriorityQueue;,"Ljava/util/PriorityQueue<TT;>;"
    move-object v0, p0

    .local v0, arr$:[Lcom/googlecode/javaewah/LogicalElement;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 261
    .local v4, x:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 260
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 262
    .end local v4           #x:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    :cond_0
    :goto_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_1

    .line 263
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javaewah/LogicalElement;

    .line 264
    .local v5, x1:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah/LogicalElement;

    .line 265
    .local v6, x2:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    invoke-interface {v5, v6}, Lcom/googlecode/javaewah/LogicalElement;->xor(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javaewah/LogicalElement;

    invoke-virtual {v3, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 267
    .end local v5           #x1:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    .end local v6           #x2:Lcom/googlecode/javaewah/LogicalElement;,"TT;"
    :cond_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javaewah/LogicalElement;

    return-object v7
.end method

.method public static varargs xorToContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 10
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    const/4 v9, 0x2

    .line 277
    array-length v7, p1

    if-ge v7, v9, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "We need at least two bitmaps"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 278
    :cond_0
    new-instance v3, Ljava/util/PriorityQueue;

    array-length v7, p1

    new-instance v8, Lcom/googlecode/javaewah/FastAggregation$6;

    invoke-direct {v8}, Lcom/googlecode/javaewah/FastAggregation$6;-><init>()V

    invoke-direct {v3, v7, v8}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 285
    .local v3, pq:Ljava/util/PriorityQueue;,"Ljava/util/PriorityQueue<Lcom/googlecode/javaewah/EWAHCompressedBitmap;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 286
    .local v4, x:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 285
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 288
    .end local v4           #x:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_1
    :goto_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    if-le v7, v9, :cond_2

    .line 289
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 290
    .local v5, x1:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 291
    .local v6, x2:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v5, v6}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xor(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 293
    .end local v5           #x1:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v6           #x2:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    :cond_2
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v7, v8, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->xorToContainer(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/BitmapStorage;)V

    .line 294
    return-void
.end method
