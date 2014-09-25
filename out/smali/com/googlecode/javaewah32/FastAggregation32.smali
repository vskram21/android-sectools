.class public Lcom/googlecode/javaewah32/FastAggregation32;
.super Ljava/lang/Object;
.source "FastAggregation32.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/googlecode/javaewah32/FastAggregation32;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/googlecode/javaewah32/FastAggregation32;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs bufferedand(I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 1
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 26
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 27
    .local v0, answer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-static {v0, p0, p1}, Lcom/googlecode/javaewah32/FastAggregation32;->bufferedandWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 28
    return-object v0
.end method

.method public static varargs bufferedandWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 11
    .parameter "container"
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 40
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 41
    .local v0, al:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;>;"
    move-object v1, p2

    .local v1, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v9, v1

    .local v9, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_0
    if-ge v7, v9, :cond_0

    aget-object v2, v1, v7

    .line 42
    .local v2, bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    new-instance v10, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v10, v2}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    invoke-virtual {v0, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 41
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 44
    .end local v2           #bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_0
    array-length v10, p2

    mul-int/2addr v10, p1

    new-array v5, v10, [I

    .line 46
    .local v5, hardbitmap:[I
    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    .line 47
    .local v6, i:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-interface {v6}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v10

    if-nez v10, :cond_1

    .line 48
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 52
    .end local v6           #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_7

    .line 53
    const/4 v10, -0x1

    invoke-static {v5, v10}, Ljava/util/Arrays;->fill([II)V

    .line 54
    const v4, 0x7fffffff

    .line 55
    .local v4, effective:I
    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    .line 56
    .restart local v6       #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-static {v5, v6}, Lcom/googlecode/javaewah32/IteratorAggregation32;->inplaceand([ILcom/googlecode/javaewah32/IteratingRLW32;)I

    move-result v3

    .line 57
    .local v3, eff:I
    if-ge v3, v4, :cond_3

    .line 58
    move v4, v3

    goto :goto_2

    .line 60
    .end local v3           #eff:I
    .end local v6           #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_4
    const/4 v8, 0x0

    .local v8, k:I
    :goto_3
    if-ge v8, v4, :cond_5

    .line 61
    aget v10, v5, v8

    invoke-interface {p0, v10}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 60
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 62
    :cond_5
    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    .line 63
    .restart local v6       #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-interface {v6}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v10

    if-nez v10, :cond_6

    .line 64
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    goto :goto_1

    .line 68
    .end local v4           #effective:I
    .end local v6           #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v8           #k:I
    :cond_7
    return-void
.end method

.method public static varargs bufferedor(I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 1
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 78
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 79
    .local v0, answer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-static {v0, p0, p1}, Lcom/googlecode/javaewah32/FastAggregation32;->bufferedorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 80
    return-object v0
.end method

.method public static varargs bufferedorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 13
    .parameter "container"
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 92
    const/4 v10, 0x0

    .line 93
    .local v10, range:I
    invoke-virtual {p2}, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clone()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 94
    .local v11, sbitmaps:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    new-instance v12, Lcom/googlecode/javaewah32/FastAggregation32$1;

    invoke-direct {v12}, Lcom/googlecode/javaewah32/FastAggregation32$1;-><init>()V

    invoke-static {v11, v12}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v0, al:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;>;"
    move-object v1, v11

    .local v1, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v8, v1

    .local v8, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v8, :cond_1

    aget-object v2, v1, v6

    .line 103
    .local v2, bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v12, v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-le v12, v10, :cond_0

    .line 104
    iget v10, v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 105
    :cond_0
    new-instance v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v12, v2}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 107
    .end local v2           #bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_1
    new-array v5, p1, [I

    .line 108
    .local v5, hardbitmap:[I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 109
    .local v9, maxr:I
    :goto_1
    if-lez v9, :cond_6

    .line 110
    const/4 v4, 0x0

    .line 111
    .local v4, effective:I
    const/4 v7, 0x0

    .local v7, k:I
    :goto_2
    if-ge v7, v9, :cond_4

    .line 112
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v12

    if-lez v12, :cond_3

    .line 113
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-static {v5, v12}, Lcom/googlecode/javaewah32/IteratorAggregation32;->inplaceor([ILcom/googlecode/javaewah32/IteratingRLW32;)I

    move-result v3

    .line 114
    .local v3, eff:I
    if-le v3, v4, :cond_2

    .line 115
    move v4, v3

    .line 111
    .end local v3           #eff:I
    :cond_2
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 117
    :cond_3
    move v9, v7

    goto :goto_3

    .line 119
    :cond_4
    const/4 v7, 0x0

    :goto_4
    if-ge v7, v4, :cond_5

    .line 120
    aget v12, v5, v7

    invoke-interface {p0, v12}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 119
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 121
    :cond_5
    const/4 v12, 0x0

    invoke-static {v5, v12}, Ljava/util/Arrays;->fill([II)V

    goto :goto_1

    .line 124
    .end local v4           #effective:I
    .end local v7           #k:I
    :cond_6
    invoke-interface {p0, v10}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    .line 125
    return-void
.end method

.method public static varargs bufferedxor(I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .locals 1
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 135
    new-instance v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;-><init>()V

    .line 136
    .local v0, answer:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-static {v0, p0, p1}, Lcom/googlecode/javaewah32/FastAggregation32;->bufferedxorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    .line 137
    return-object v0
.end method

.method public static varargs bufferedxorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 13
    .parameter "container"
    .parameter "bufsize"
    .parameter "bitmaps"

    .prologue
    .line 150
    const/4 v10, 0x0

    .line 151
    .local v10, range:I
    invoke-virtual {p2}, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clone()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 152
    .local v11, sbitmaps:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    new-instance v12, Lcom/googlecode/javaewah32/FastAggregation32$2;

    invoke-direct {v12}, Lcom/googlecode/javaewah32/FastAggregation32$2;-><init>()V

    invoke-static {v11, v12}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 160
    .local v0, al:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;>;"
    move-object v1, v11

    .local v1, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v8, v1

    .local v8, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v8, :cond_1

    aget-object v2, v1, v6

    .line 161
    .local v2, bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    iget v12, v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    if-le v12, v10, :cond_0

    .line 162
    iget v10, v2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .line 163
    :cond_0
    new-instance v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-direct {v12, v2}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 165
    .end local v2           #bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_1
    new-array v5, p1, [I

    .line 166
    .local v5, hardbitmap:[I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 167
    .local v9, maxr:I
    :goto_1
    if-lez v9, :cond_6

    .line 168
    const/4 v4, 0x0

    .line 169
    .local v4, effective:I
    const/4 v7, 0x0

    .local v7, k:I
    :goto_2
    if-ge v7, v9, :cond_4

    .line 170
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    invoke-virtual {v12}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v12

    if-lez v12, :cond_3

    .line 171
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/googlecode/javaewah32/IteratingRLW32;

    invoke-static {v5, v12}, Lcom/googlecode/javaewah32/IteratorAggregation32;->inplacexor([ILcom/googlecode/javaewah32/IteratingRLW32;)I

    move-result v3

    .line 172
    .local v3, eff:I
    if-le v3, v4, :cond_2

    .line 173
    move v4, v3

    .line 169
    .end local v3           #eff:I
    :cond_2
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 175
    :cond_3
    move v9, v7

    goto :goto_3

    .line 177
    :cond_4
    const/4 v7, 0x0

    :goto_4
    if-ge v7, v4, :cond_5

    .line 178
    aget v12, v5, v7

    invoke-interface {p0, v12}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 177
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 179
    :cond_5
    const/4 v12, 0x0

    invoke-static {v5, v12}, Ljava/util/Arrays;->fill([II)V

    goto :goto_1

    .line 181
    .end local v4           #effective:I
    .end local v7           #k:I
    :cond_6
    invoke-interface {p0, v10}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    .line 182
    return-void
.end method

.method public static varargs legacy_orWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 28
    .parameter "container"
    .parameter "bitmaps"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 249
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v26, v0

    const/16 v27, 0x2

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_0

    .line 251
    const/16 v26, 0x0

    aget-object v26, p1, v26

    const/16 v27, 0x1

    aget-object v27, p1, v27

    invoke-virtual/range {v26 .. v28}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->orToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 375
    :goto_0
    return-void

    .line 257
    :cond_0
    invoke-virtual/range {p1 .. p1}, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->clone()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, [Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 258
    .local v23, sortedBitmaps:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    new-instance v26, Lcom/googlecode/javaewah32/FastAggregation32$5;

    invoke-direct/range {v26 .. v26}, Lcom/googlecode/javaewah32/FastAggregation32$5;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 266
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    new-array v0, v0, [Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    move-object/from16 v21, v0

    .line 267
    .local v21, rlws:[Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    const/4 v11, 0x0

    .line 268
    .local v11, maxAvailablePos:I
    move-object/from16 v3, v23

    .local v3, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v10, v3

    .local v10, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    move v12, v11

    .end local v11           #maxAvailablePos:I
    .local v12, maxAvailablePos:I
    :goto_1
    if-ge v7, v10, :cond_1

    aget-object v4, v3, v7

    .line 269
    .local v4, bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v4}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->getEWAHIterator()Lcom/googlecode/javaewah32/EWAHIterator32;

    move-result-object v9

    .line 270
    .local v9, iterator:Lcom/googlecode/javaewah32/EWAHIterator32;
    invoke-virtual {v9}, Lcom/googlecode/javaewah32/EWAHIterator32;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_15

    .line 271
    add-int/lit8 v11, v12, 0x1

    .end local v12           #maxAvailablePos:I
    .restart local v11       #maxAvailablePos:I
    new-instance v26, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;

    move-object/from16 v0, v26

    invoke-direct {v0, v9}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;-><init>(Lcom/googlecode/javaewah32/EWAHIterator32;)V

    aput-object v26, v21, v12

    .line 268
    :goto_2
    add-int/lit8 v7, v7, 0x1

    move v12, v11

    .end local v11           #maxAvailablePos:I
    .restart local v12       #maxAvailablePos:I
    goto :goto_1

    .line 276
    .end local v4           #bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v9           #iterator:Lcom/googlecode/javaewah32/EWAHIterator32;
    :cond_1
    if-nez v12, :cond_2

    .line 277
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    goto :goto_0

    .line 281
    :cond_2
    const/16 v26, 0x0

    aget-object v26, v23, v26

    move-object/from16 v0, v26

    iget v14, v0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    .local v14, maxSize:I
    move v11, v12

    .line 284
    .end local v12           #maxAvailablePos:I
    .restart local v11       #maxAvailablePos:I
    :cond_3
    const/4 v13, 0x0

    .line 285
    .local v13, maxOneRl:I
    const v17, 0x7fffffff

    .line 286
    .local v17, minZeroRl:I
    const v16, 0x7fffffff

    .line 287
    .local v16, minSize:I
    const/16 v18, 0x0

    .line 288
    .local v18, numEmptyRl:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_3
    if-ge v6, v11, :cond_4

    .line 289
    aget-object v20, v21, v6

    .line 290
    .local v20, rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->size()I

    move-result v22

    .line 291
    .local v22, size:I
    if-nez v22, :cond_5

    .line 292
    move v11, v6

    .line 313
    .end local v20           #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v22           #size:I
    :cond_4
    if-nez v11, :cond_8

    .line 374
    :goto_4
    move-object/from16 v0, p0

    invoke-interface {v0, v14}, Lcom/googlecode/javaewah32/BitmapStorage32;->setSizeInBits(I)V

    goto :goto_0

    .line 295
    .restart local v20       #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .restart local v22       #size:I
    :cond_5
    move/from16 v0, v16

    move/from16 v1, v22

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 297
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningBit()Z

    move-result v26

    if-eqz v26, :cond_7

    .line 298
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v19

    .line 299
    .local v19, rl:I
    move/from16 v0, v19

    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 300
    const/16 v17, 0x0

    .line 301
    if-nez v19, :cond_6

    if-lez v22, :cond_6

    .line 302
    add-int/lit8 v18, v18, 0x1

    .line 288
    :cond_6
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 305
    .end local v19           #rl:I
    :cond_7
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v19

    .line 306
    .restart local v19       #rl:I
    move/from16 v0, v17

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 307
    if-nez v19, :cond_6

    if-lez v22, :cond_6

    .line 308
    add-int/lit8 v18, v18, 0x1

    goto :goto_5

    .line 315
    .end local v19           #rl:I
    .end local v20           #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v22           #size:I
    :cond_8
    const/16 v26, 0x1

    move/from16 v0, v26

    if-ne v11, v0, :cond_9

    .line 317
    const/16 v26, 0x0

    aget-object v26, v21, v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;)V

    goto :goto_4

    .line 321
    :cond_9
    if-lez v13, :cond_a

    .line 322
    const/16 v26, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-interface {v0, v1, v13}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 323
    const/4 v6, 0x0

    :goto_6
    if-ge v6, v11, :cond_3

    .line 324
    aget-object v20, v21, v6

    .line 325
    .restart local v20       #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 323
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 327
    .end local v20           #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_a
    if-lez v17, :cond_b

    .line 328
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v17

    invoke-interface {v0, v1, v2}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 329
    const/4 v6, 0x0

    :goto_7
    if-ge v6, v11, :cond_3

    .line 330
    aget-object v20, v21, v6

    .line 331
    .restart local v20       #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 329
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 334
    .end local v20           #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_b
    const/4 v8, 0x0

    .line 336
    .local v8, index:I
    const/16 v26, 0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-ne v0, v1, :cond_10

    .line 339
    const/4 v5, 0x0

    .line 340
    .local v5, emptyRl:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    const v15, 0x7fffffff

    .line 341
    .local v15, minNonEmptyRl:I
    const/4 v6, 0x0

    :goto_8
    if-ge v6, v11, :cond_e

    .line 342
    aget-object v20, v21, v6

    .line 343
    .restart local v20       #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v19

    .line 344
    .restart local v19       #rl:I
    if-nez v19, :cond_d

    .line 345
    sget-boolean v26, Lcom/googlecode/javaewah32/FastAggregation32;->$assertionsDisabled:Z

    if-nez v26, :cond_c

    if-eqz v5, :cond_c

    new-instance v26, Ljava/lang/AssertionError;

    invoke-direct/range {v26 .. v26}, Ljava/lang/AssertionError;-><init>()V

    throw v26

    .line 346
    :cond_c
    move-object/from16 v5, v20

    .line 341
    :goto_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 348
    :cond_d
    move/from16 v0, v19

    invoke-static {v15, v0}, Ljava/lang/Math;->min(II)I

    move-result v15

    goto :goto_9

    .line 351
    .end local v19           #rl:I
    .end local v20           #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    :cond_e
    move/from16 v0, v16

    if-le v15, v0, :cond_12

    move/from16 v25, v16

    .line 352
    .local v25, wordsToWrite:I
    :goto_a
    if-eqz v5, :cond_f

    .line 353
    move/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v5, v0, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->writeLiteralWords(ILcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 354
    :cond_f
    add-int v8, v8, v25

    .line 357
    .end local v5           #emptyRl:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v15           #minNonEmptyRl:I
    .end local v25           #wordsToWrite:I
    :cond_10
    :goto_b
    move/from16 v0, v16

    if-ge v8, v0, :cond_14

    .line 358
    const/16 v24, 0x0

    .line 359
    .local v24, word:I
    const/4 v6, 0x0

    :goto_c
    if-ge v6, v11, :cond_13

    .line 360
    aget-object v20, v21, v6

    .line 361
    .restart local v20       #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v26

    move/from16 v0, v26

    if-gt v0, v8, :cond_11

    .line 362
    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getRunningLength()I

    move-result v26

    sub-int v26, v8, v26

    move-object/from16 v0, v20

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->getLiteralWordAt(I)I

    move-result v26

    or-int v24, v24, v26

    .line 359
    :cond_11
    add-int/lit8 v6, v6, 0x1

    goto :goto_c

    .end local v20           #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v24           #word:I
    .restart local v5       #emptyRl:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .restart local v15       #minNonEmptyRl:I
    :cond_12
    move/from16 v25, v15

    .line 351
    goto :goto_a

    .line 365
    .end local v5           #emptyRl:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .end local v15           #minNonEmptyRl:I
    .restart local v24       #word:I
    :cond_13
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-interface {v0, v1}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 366
    add-int/lit8 v8, v8, 0x1

    .line 367
    goto :goto_b

    .line 368
    .end local v24           #word:I
    :cond_14
    const/4 v6, 0x0

    :goto_d
    if-ge v6, v11, :cond_3

    .line 369
    aget-object v20, v21, v6

    .line 370
    .restart local v20       #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    move-object/from16 v0, v20

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;->discardFirstWords(I)V

    .line 368
    add-int/lit8 v6, v6, 0x1

    goto :goto_d

    .end local v6           #i:I
    .end local v8           #index:I
    .end local v11           #maxAvailablePos:I
    .end local v13           #maxOneRl:I
    .end local v14           #maxSize:I
    .end local v16           #minSize:I
    .end local v17           #minZeroRl:I
    .end local v18           #numEmptyRl:I
    .end local v20           #rlw:Lcom/googlecode/javaewah32/IteratingBufferedRunningLengthWord32;
    .restart local v4       #bitmap:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .restart local v9       #iterator:Lcom/googlecode/javaewah32/EWAHIterator32;
    .restart local v12       #maxAvailablePos:I
    :cond_15
    move v11, v12

    .end local v12           #maxAvailablePos:I
    .restart local v11       #maxAvailablePos:I
    goto/16 :goto_2
.end method

.method public static varargs orToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 10
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    const/4 v9, 0x2

    .line 191
    array-length v7, p1

    if-ge v7, v9, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "We need at least two bitmaps"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 192
    :cond_0
    new-instance v3, Ljava/util/PriorityQueue;

    array-length v7, p1

    new-instance v8, Lcom/googlecode/javaewah32/FastAggregation32$3;

    invoke-direct {v8}, Lcom/googlecode/javaewah32/FastAggregation32$3;-><init>()V

    invoke-direct {v3, v7, v8}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 199
    .local v3, pq:Ljava/util/PriorityQueue;,"Ljava/util/PriorityQueue<Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 200
    .local v4, x:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 199
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 202
    .end local v4           #x:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_1
    :goto_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    if-le v7, v9, :cond_2

    .line 203
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 204
    .local v5, x1:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 205
    .local v6, x2:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v5, v6}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->or(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 207
    .end local v5           #x1:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v6           #x2:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_2
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v7, v8, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->orToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 208
    return-void
.end method

.method public static varargs xorToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 10
    .parameter "container"
    .parameter "bitmaps"

    .prologue
    const/4 v9, 0x2

    .line 218
    array-length v7, p1

    if-ge v7, v9, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "We need at least two bitmaps"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 219
    :cond_0
    new-instance v3, Ljava/util/PriorityQueue;

    array-length v7, p1

    new-instance v8, Lcom/googlecode/javaewah32/FastAggregation32$4;

    invoke-direct {v8}, Lcom/googlecode/javaewah32/FastAggregation32$4;-><init>()V

    invoke-direct {v3, v7, v8}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 226
    .local v3, pq:Ljava/util/PriorityQueue;,"Ljava/util/PriorityQueue<Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v4, v0, v1

    .line 227
    .local v4, x:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 226
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 229
    .end local v4           #x:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_1
    :goto_1
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    if-le v7, v9, :cond_2

    .line 230
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 231
    .local v5, x1:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .line 232
    .local v6, x2:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    invoke-virtual {v5, v6}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->xor(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 234
    .end local v5           #x1:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    .end local v6           #x2:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;
    :cond_2
    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v7, v8, p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->xorToContainer(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/BitmapStorage32;)V

    .line 235
    return-void
.end method
