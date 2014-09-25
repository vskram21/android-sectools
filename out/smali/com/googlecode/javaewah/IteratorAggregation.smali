.class public Lcom/googlecode/javaewah/IteratorAggregation;
.super Ljava/lang/Object;
.source "IteratorAggregation.java"


# static fields
.field public static final DEFAULTMAXBUFSIZE:I = 0x10000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static andToContainer(Lcom/googlecode/javaewah/BitmapStorage;ILcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/IteratingRLW;)V
    .locals 12
    .parameter "container"
    .parameter "desiredrlwcount"
    .parameter "rlwi"
    .parameter "rlwj"

    .prologue
    .line 237
    :goto_0
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_8

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_8

    add-int/lit8 v0, p1, -0x1

    .end local p1
    .local v0, desiredrlwcount:I
    if-lez p1, :cond_7

    .line 238
    :goto_1
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-gtz v8, :cond_0

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_5

    .line 239
    :cond_0
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-gez v8, :cond_1

    const/4 v1, 0x1

    .line 241
    .local v1, i_is_prey:Z
    :goto_2
    if-eqz v1, :cond_2

    move-object v7, p2

    .line 242
    .local v7, prey:Lcom/googlecode/javaewah/IteratingRLW;
    :goto_3
    if-eqz v1, :cond_3

    move-object v6, p3

    .line 244
    .local v6, predator:Lcom/googlecode/javaewah/IteratingRLW;
    :goto_4
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-nez v8, :cond_4

    .line 245
    const/4 v8, 0x0

    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v9

    invoke-interface {p0, v8, v9, v10}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 246
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {v7, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 247
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {v6, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_1

    .line 239
    .end local v1           #i_is_prey:Z
    .end local v6           #predator:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v7           #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    .restart local v1       #i_is_prey:Z
    :cond_2
    move-object v7, p3

    .line 241
    goto :goto_3

    .restart local v7       #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_3
    move-object v6, p2

    .line 242
    goto :goto_4

    .line 249
    .restart local v6       #predator:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_4
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-static {p0, v7, v8, v9}, Lcom/googlecode/javaewah/IteratorAggregation;->discharge(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;J)J

    move-result-wide v2

    .line 250
    .local v2, index:J
    const/4 v8, 0x0

    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v9

    sub-long/2addr v9, v2

    invoke-interface {p0, v8, v9, v10}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 252
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {v6, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_1

    .line 255
    .end local v1           #i_is_prey:Z
    .end local v2           #index:J
    .end local v6           #predator:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v7           #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_5
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v8

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 257
    .local v5, nbre_literal:I
    if-lez v5, :cond_9

    .line 258
    sub-int p1, v0, v5

    .line 259
    .end local v0           #desiredrlwcount:I
    .restart local p1
    const/4 v4, 0x0

    .local v4, k:I
    :goto_5
    if-ge v4, v5, :cond_6

    .line 260
    invoke-interface {p2, v4}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v8

    invoke-interface {p3, v4}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    and-long/2addr v8, v10

    invoke-interface {p0, v8, v9}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 259
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 261
    :cond_6
    int-to-long v8, v5

    invoke-interface {p2, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 262
    int-to-long v8, v5

    invoke-interface {p3, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto/16 :goto_0

    .end local v4           #k:I
    .end local v5           #nbre_literal:I
    .end local p1
    .restart local v0       #desiredrlwcount:I
    :cond_7
    move p1, v0

    .line 265
    .end local v0           #desiredrlwcount:I
    .restart local p1
    :cond_8
    return-void

    .end local p1
    .restart local v0       #desiredrlwcount:I
    .restart local v5       #nbre_literal:I
    :cond_9
    move p1, v0

    .end local v0           #desiredrlwcount:I
    .restart local p1
    goto/16 :goto_0
.end method

.method static andToContainer(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/IteratingRLW;)V
    .locals 11
    .parameter "container"
    .parameter "rlwi"
    .parameter "rlwj"

    .prologue
    .line 269
    :cond_0
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_8

    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_8

    .line 270
    :goto_1
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-gtz v7, :cond_1

    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_6

    .line 271
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v7

    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-gez v7, :cond_2

    const/4 v0, 0x1

    .line 273
    .local v0, i_is_prey:Z
    :goto_2
    if-eqz v0, :cond_3

    move-object v6, p1

    .line 274
    .local v6, prey:Lcom/googlecode/javaewah/IteratingRLW;
    :goto_3
    if-eqz v0, :cond_4

    move-object v5, p2

    .line 276
    .local v5, predator:Lcom/googlecode/javaewah/IteratingRLW;
    :goto_4
    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v7

    if-nez v7, :cond_5

    .line 277
    const/4 v7, 0x0

    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {p0, v7, v8, v9}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 278
    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v7

    invoke-interface {v6, v7, v8}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 279
    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v7

    invoke-interface {v5, v7, v8}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_1

    .line 271
    .end local v0           #i_is_prey:Z
    .end local v5           #predator:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v6           #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_2
    const/4 v0, 0x0

    goto :goto_2

    .restart local v0       #i_is_prey:Z
    :cond_3
    move-object v6, p2

    .line 273
    goto :goto_3

    .restart local v6       #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_4
    move-object v5, p1

    .line 274
    goto :goto_4

    .line 281
    .restart local v5       #predator:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_5
    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v7

    invoke-static {p0, v6, v7, v8}, Lcom/googlecode/javaewah/IteratorAggregation;->discharge(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;J)J

    move-result-wide v1

    .line 282
    .local v1, index:J
    const/4 v7, 0x0

    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    sub-long/2addr v8, v1

    invoke-interface {p0, v7, v8, v9}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 284
    invoke-interface {v5}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v7

    invoke-interface {v5, v7, v8}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_1

    .line 287
    .end local v0           #i_is_prey:Z
    .end local v1           #index:J
    .end local v5           #predator:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v6           #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_6
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v7

    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 289
    .local v4, nbre_literal:I
    if-lez v4, :cond_0

    .line 290
    const/4 v3, 0x0

    .local v3, k:I
    :goto_5
    if-ge v3, v4, :cond_7

    .line 291
    invoke-interface {p1, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v7

    invoke-interface {p2, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v9

    and-long/2addr v7, v9

    invoke-interface {p0, v7, v8}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 290
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 292
    :cond_7
    int-to-long v7, v4

    invoke-interface {p1, v7, v8}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 293
    int-to-long v7, v4

    invoke-interface {p2, v7, v8}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto/16 :goto_0

    .line 296
    .end local v3           #k:I
    .end local v4           #nbre_literal:I
    :cond_8
    return-void
.end method

.method public static varargs bufferedand(I[Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
    .locals 7
    .parameter "bufsize"
    .parameter "al"

    .prologue
    .line 87
    array-length v5, p1

    if-nez v5, :cond_0

    .line 88
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Need at least one iterator"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 89
    :cond_0
    array-length v5, p1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 90
    const/4 v5, 0x0

    aget-object v5, p1, v5

    .line 94
    :goto_0
    return-object v5

    .line 91
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 92
    .local v1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah/IteratingRLW;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah/IteratingRLW;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 93
    .local v2, i:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 92
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 94
    .end local v2           #i:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_2
    new-instance v5, Lcom/googlecode/javaewah/BufferedIterator;

    new-instance v6, Lcom/googlecode/javaewah/BufferedAndIterator;

    invoke-direct {v6, v1, p0}, Lcom/googlecode/javaewah/BufferedAndIterator;-><init>(Ljava/util/LinkedList;I)V

    invoke-direct {v5, v6}, Lcom/googlecode/javaewah/BufferedIterator;-><init>(Lcom/googlecode/javaewah/CloneableIterator;)V

    goto :goto_0
.end method

.method public static varargs bufferedand([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
    .locals 1
    .parameter "al"

    .prologue
    .line 76
    const/high16 v0, 0x1

    invoke-static {v0, p0}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedand(I[Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v0

    return-object v0
.end method

.method public static varargs bufferedor(I[Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
    .locals 7
    .parameter "bufsize"
    .parameter "al"

    .prologue
    .line 116
    array-length v5, p1

    if-nez v5, :cond_0

    .line 117
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Need at least one iterator"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 118
    :cond_0
    array-length v5, p1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 119
    const/4 v5, 0x0

    aget-object v5, p1, v5

    .line 124
    :goto_0
    return-object v5

    .line 121
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 122
    .local v1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah/IteratingRLW;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah/IteratingRLW;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 123
    .local v2, i:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 122
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 124
    .end local v2           #i:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_2
    new-instance v5, Lcom/googlecode/javaewah/BufferedIterator;

    new-instance v6, Lcom/googlecode/javaewah/BufferedORIterator;

    invoke-direct {v6, v1, p0}, Lcom/googlecode/javaewah/BufferedORIterator;-><init>(Ljava/util/LinkedList;I)V

    invoke-direct {v5, v6}, Lcom/googlecode/javaewah/BufferedIterator;-><init>(Lcom/googlecode/javaewah/CloneableIterator;)V

    goto :goto_0
.end method

.method public static varargs bufferedor([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
    .locals 1
    .parameter "al"

    .prologue
    .line 104
    const/high16 v0, 0x1

    invoke-static {v0, p0}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedor(I[Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v0

    return-object v0
.end method

.method public static varargs bufferedxor(I[Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
    .locals 7
    .parameter "bufsize"
    .parameter "al"

    .prologue
    .line 146
    array-length v5, p1

    if-nez v5, :cond_0

    .line 147
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Need at least one iterator"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 148
    :cond_0
    array-length v5, p1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 149
    const/4 v5, 0x0

    aget-object v5, p1, v5

    .line 156
    :goto_0
    return-object v5

    .line 152
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 153
    .local v1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah/IteratingRLW;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah/IteratingRLW;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 154
    .local v2, i:Lcom/googlecode/javaewah/IteratingRLW;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 153
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 156
    .end local v2           #i:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_2
    new-instance v5, Lcom/googlecode/javaewah/BufferedIterator;

    new-instance v6, Lcom/googlecode/javaewah/BufferedXORIterator;

    invoke-direct {v6, v1, p0}, Lcom/googlecode/javaewah/BufferedXORIterator;-><init>(Ljava/util/LinkedList;I)V

    invoke-direct {v5, v6}, Lcom/googlecode/javaewah/BufferedIterator;-><init>(Lcom/googlecode/javaewah/CloneableIterator;)V

    goto :goto_0
.end method

.method public static varargs bufferedxor([Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
    .locals 1
    .parameter "al"

    .prologue
    .line 134
    const/high16 v0, 0x1

    invoke-static {v0, p0}, Lcom/googlecode/javaewah/IteratorAggregation;->bufferedxor(I[Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;

    move-result-object v0

    return-object v0
.end method

.method protected static discharge(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;J)J
    .locals 11
    .parameter "container"
    .parameter "i"
    .parameter "max"

    .prologue
    const-wide/16 v9, 0x0

    .line 186
    const-wide/16 v4, 0x0

    .line 187
    .local v4, counter:J
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v7

    cmp-long v7, v7, v9

    if-lez v7, :cond_4

    cmp-long v7, v4, p2

    if-gez v7, :cond_4

    .line 188
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v2

    .line 189
    .local v2, L1:J
    cmp-long v7, v2, v9

    if-lez v7, :cond_1

    .line 190
    add-long v7, v2, v4

    cmp-long v7, v7, p2

    if-lez v7, :cond_0

    .line 191
    sub-long v2, p2, v4

    .line 192
    :cond_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v7

    invoke-interface {p0, v7, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 193
    add-long/2addr v4, v2

    .line 195
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v7

    int-to-long v0, v7

    .line 196
    .local v0, L:J
    add-long v7, v0, v4

    cmp-long v7, v7, p2

    if-lez v7, :cond_2

    sub-long v0, p2, v4

    .line 197
    :cond_2
    const/4 v6, 0x0

    .local v6, k:I
    :goto_1
    int-to-long v7, v6

    cmp-long v7, v7, v0

    if-gez v7, :cond_3

    .line 198
    invoke-interface {p1, v6}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v7

    invoke-interface {p0, v7, v8}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 197
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 200
    :cond_3
    add-long/2addr v4, v0

    .line 201
    add-long v7, v0, v2

    invoke-interface {p1, v7, v8}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_0

    .line 203
    .end local v0           #L:J
    .end local v2           #L1:J
    .end local v6           #k:I
    :cond_4
    return-wide v4
.end method

.method protected static dischargeAsEmpty(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;)V
    .locals 4
    .parameter "container"
    .parameter "i"

    .prologue
    .line 170
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 171
    const/4 v0, 0x0

    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v1

    invoke-interface {p0, v0, v1, v2}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 172
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    goto :goto_0

    .line 175
    :cond_0
    return-void
.end method

.method protected static dischargeNegated(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;J)J
    .locals 11
    .parameter "container"
    .parameter "i"
    .parameter "max"

    .prologue
    .line 215
    const-wide/16 v4, 0x0

    .line 216
    .local v4, counter:J
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_5

    cmp-long v7, v4, p2

    if-gez v7, :cond_5

    .line 217
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v2

    .line 218
    .local v2, L1:J
    const-wide/16 v7, 0x0

    cmp-long v7, v2, v7

    if-lez v7, :cond_1

    .line 219
    add-long v7, v2, v4

    cmp-long v7, v7, p2

    if-lez v7, :cond_0

    .line 220
    sub-long v2, p2, v4

    .line 221
    :cond_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v7

    if-nez v7, :cond_3

    const/4 v7, 0x1

    :goto_1
    invoke-interface {p0, v7, v2, v3}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 222
    add-long/2addr v4, v2

    .line 224
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v7

    int-to-long v0, v7

    .line 225
    .local v0, L:J
    add-long v7, v0, v4

    cmp-long v7, v7, p2

    if-lez v7, :cond_2

    sub-long v0, p2, v4

    .line 226
    :cond_2
    const/4 v6, 0x0

    .local v6, k:I
    :goto_2
    int-to-long v7, v6

    cmp-long v7, v7, v0

    if-gez v7, :cond_4

    .line 227
    invoke-interface {p1, v6}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v7

    const-wide/16 v9, -0x1

    xor-long/2addr v7, v9

    invoke-interface {p0, v7, v8}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 226
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 221
    .end local v0           #L:J
    .end local v6           #k:I
    :cond_3
    const/4 v7, 0x0

    goto :goto_1

    .line 229
    .restart local v0       #L:J
    .restart local v6       #k:I
    :cond_4
    add-long/2addr v4, v0

    .line 230
    add-long v7, v0, v2

    invoke-interface {p1, v7, v8}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_0

    .line 232
    .end local v0           #L:J
    .end local v2           #L1:J
    .end local v6           #k:I
    :cond_5
    return-wide v4
.end method

.method protected static inplaceand([JLcom/googlecode/javaewah/IteratingRLW;)I
    .locals 14
    .parameter "bitmap"
    .parameter "i"

    .prologue
    const-wide/16 v12, 0x0

    .line 424
    const/4 v4, 0x0

    .line 426
    .local v4, pos:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v6

    .local v6, s:J
    cmp-long v8, v6, v12

    if-lez v8, :cond_8

    .line 427
    int-to-long v8, v4

    add-long/2addr v8, v6

    array-length v10, p0

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-gez v8, :cond_3

    .line 428
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    long-to-int v0, v8

    .line 429
    .local v0, L:I
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-nez v8, :cond_0

    .line 430
    move v3, v4

    .local v3, k:I
    :goto_1
    add-int v8, v4, v0

    if-ge v3, v8, :cond_0

    .line 431
    aput-wide v12, p0, v3

    .line 430
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 433
    .end local v3           #k:I
    :cond_0
    add-int/2addr v4, v0

    .line 434
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v1

    .line 435
    .local v1, LR:I
    const/4 v3, 0x0

    .restart local v3       #k:I
    move v5, v4

    .end local v4           #pos:I
    .local v5, pos:I
    :goto_2
    if-ge v3, v1, :cond_1

    .line 436
    add-int/lit8 v4, v5, 0x1

    .end local v5           #pos:I
    .restart local v4       #pos:I
    aget-wide v8, p0, v5

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    and-long/2addr v8, v10

    aput-wide v8, p0, v5

    .line 435
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4           #pos:I
    .restart local v5       #pos:I
    goto :goto_2

    .line 437
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v8

    if-nez v8, :cond_2

    move v4, v5

    .line 461
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    .end local v5           #pos:I
    .restart local v4       #pos:I
    :goto_3
    return v5

    .end local v4           #pos:I
    .restart local v0       #L:I
    .restart local v1       #LR:I
    .restart local v3       #k:I
    .restart local v5       #pos:I
    :cond_2
    move v4, v5

    .line 440
    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_0

    .line 441
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    :cond_3
    array-length v8, p0

    sub-int v2, v8, v4

    .line 442
    .local v2, howmany:I
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    long-to-int v0, v8

    .line 443
    .restart local v0       #L:I
    add-int v8, v4, v0

    array-length v9, p0

    if-le v8, v9, :cond_5

    .line 444
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-nez v8, :cond_4

    .line 445
    move v3, v4

    .restart local v3       #k:I
    :goto_4
    array-length v8, p0

    if-ge v3, v8, :cond_4

    .line 446
    aput-wide v12, p0, v3

    .line 445
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 448
    .end local v3           #k:I
    :cond_4
    int-to-long v8, v2

    invoke-interface {p1, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 449
    array-length v5, p0

    goto :goto_3

    .line 451
    :cond_5
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-nez v8, :cond_6

    .line 452
    move v3, v4

    .restart local v3       #k:I
    :goto_5
    add-int v8, v4, v0

    if-ge v3, v8, :cond_6

    .line 453
    aput-wide v12, p0, v3

    .line 452
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 454
    .end local v3           #k:I
    :cond_6
    add-int/2addr v4, v0

    .line 455
    const/4 v3, 0x0

    .restart local v3       #k:I
    :goto_6
    array-length v8, p0

    if-ge v4, v8, :cond_7

    .line 456
    add-int/lit8 v5, v4, 0x1

    .end local v4           #pos:I
    .restart local v5       #pos:I
    aget-wide v8, p0, v4

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    and-long/2addr v8, v10

    aput-wide v8, p0, v4

    .line 455
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_6

    .line 457
    :cond_7
    int-to-long v8, v2

    invoke-interface {p1, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    move v5, v4

    .line 458
    goto :goto_3

    .end local v0           #L:I
    .end local v2           #howmany:I
    .end local v3           #k:I
    :cond_8
    move v5, v4

    .line 461
    goto :goto_3
.end method

.method protected static inplaceor([JLcom/googlecode/javaewah/IteratingRLW;)I
    .locals 14
    .parameter "bitmap"
    .parameter "i"

    .prologue
    const-wide/16 v12, -0x1

    .line 343
    const/4 v4, 0x0

    .line 345
    .local v4, pos:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v6

    .local v6, s:J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_8

    .line 346
    int-to-long v8, v4

    add-long/2addr v8, v6

    array-length v10, p0

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-gez v8, :cond_3

    .line 347
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    long-to-int v0, v8

    .line 348
    .local v0, L:I
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 349
    add-int v8, v4, v0

    invoke-static {p0, v4, v8, v12, v13}, Ljava/util/Arrays;->fill([JIIJ)V

    .line 350
    :cond_0
    add-int/2addr v4, v0

    .line 351
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v1

    .line 353
    .local v1, LR:I
    const/4 v3, 0x0

    .local v3, k:I
    move v5, v4

    .end local v4           #pos:I
    .local v5, pos:I
    :goto_1
    if-ge v3, v1, :cond_1

    .line 354
    add-int/lit8 v4, v5, 0x1

    .end local v5           #pos:I
    .restart local v4       #pos:I
    aget-wide v8, p0, v5

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    or-long/2addr v8, v10

    aput-wide v8, p0, v5

    .line 353
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4           #pos:I
    .restart local v5       #pos:I
    goto :goto_1

    .line 355
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v8

    if-nez v8, :cond_2

    move v4, v5

    .line 378
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    .end local v5           #pos:I
    .restart local v4       #pos:I
    :goto_2
    return v5

    .end local v4           #pos:I
    .restart local v0       #L:I
    .restart local v1       #LR:I
    .restart local v3       #k:I
    .restart local v5       #pos:I
    :cond_2
    move v4, v5

    .line 358
    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_0

    .line 359
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    :cond_3
    array-length v8, p0

    sub-int v2, v8, v4

    .line 360
    .local v2, howmany:I
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    long-to-int v0, v8

    .line 362
    .restart local v0       #L:I
    add-int v8, v4, v0

    array-length v9, p0

    if-le v8, v9, :cond_5

    .line 363
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 364
    array-length v8, p0

    invoke-static {p0, v4, v8, v12, v13}, Ljava/util/Arrays;->fill([JIIJ)V

    .line 366
    :cond_4
    int-to-long v8, v2

    invoke-interface {p1, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 367
    array-length v5, p0

    goto :goto_2

    .line 369
    :cond_5
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 370
    add-int v8, v4, v0

    invoke-static {p0, v4, v8, v12, v13}, Ljava/util/Arrays;->fill([JIIJ)V

    .line 371
    :cond_6
    add-int/2addr v4, v0

    .line 372
    const/4 v3, 0x0

    .restart local v3       #k:I
    :goto_3
    array-length v8, p0

    if-ge v4, v8, :cond_7

    .line 373
    add-int/lit8 v5, v4, 0x1

    .end local v4           #pos:I
    .restart local v5       #pos:I
    aget-wide v8, p0, v4

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    or-long/2addr v8, v10

    aput-wide v8, p0, v4

    .line 372
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_3

    .line 374
    :cond_7
    int-to-long v8, v2

    invoke-interface {p1, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    move v5, v4

    .line 375
    goto :goto_2

    .end local v0           #L:I
    .end local v2           #howmany:I
    .end local v3           #k:I
    :cond_8
    move v5, v4

    .line 378
    goto :goto_2
.end method

.method protected static inplacexor([JLcom/googlecode/javaewah/IteratingRLW;)I
    .locals 14
    .parameter "bitmap"
    .parameter "i"

    .prologue
    const-wide/16 v12, -0x1

    .line 383
    const/4 v4, 0x0

    .line 385
    .local v4, pos:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v6

    .local v6, s:J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_8

    .line 386
    int-to-long v8, v4

    add-long/2addr v8, v6

    array-length v10, p0

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-gez v8, :cond_3

    .line 387
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    long-to-int v0, v8

    .line 388
    .local v0, L:I
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 389
    move v3, v4

    .local v3, k:I
    :goto_1
    add-int v8, v4, v0

    if-ge v3, v8, :cond_0

    .line 390
    aget-wide v8, p0, v3

    xor-long/2addr v8, v12

    aput-wide v8, p0, v3

    .line 389
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 392
    .end local v3           #k:I
    :cond_0
    add-int/2addr v4, v0

    .line 393
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v1

    .line 394
    .local v1, LR:I
    const/4 v3, 0x0

    .restart local v3       #k:I
    move v5, v4

    .end local v4           #pos:I
    .local v5, pos:I
    :goto_2
    if-ge v3, v1, :cond_1

    .line 395
    add-int/lit8 v4, v5, 0x1

    .end local v5           #pos:I
    .restart local v4       #pos:I
    aget-wide v8, p0, v5

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    xor-long/2addr v8, v10

    aput-wide v8, p0, v5

    .line 394
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4           #pos:I
    .restart local v5       #pos:I
    goto :goto_2

    .line 396
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->next()Z

    move-result v8

    if-nez v8, :cond_2

    move v4, v5

    .line 420
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    .end local v5           #pos:I
    .restart local v4       #pos:I
    :goto_3
    return v5

    .end local v4           #pos:I
    .restart local v0       #L:I
    .restart local v1       #LR:I
    .restart local v3       #k:I
    .restart local v5       #pos:I
    :cond_2
    move v4, v5

    .line 399
    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_0

    .line 400
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    :cond_3
    array-length v8, p0

    sub-int v2, v8, v4

    .line 401
    .local v2, howmany:I
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    long-to-int v0, v8

    .line 402
    .restart local v0       #L:I
    add-int v8, v4, v0

    array-length v9, p0

    if-le v8, v9, :cond_5

    .line 403
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 404
    move v3, v4

    .restart local v3       #k:I
    :goto_4
    array-length v8, p0

    if-ge v3, v8, :cond_4

    .line 405
    aget-wide v8, p0, v3

    xor-long/2addr v8, v12

    aput-wide v8, p0, v3

    .line 404
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 407
    .end local v3           #k:I
    :cond_4
    int-to-long v8, v2

    invoke-interface {p1, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 408
    array-length v5, p0

    goto :goto_3

    .line 410
    :cond_5
    invoke-interface {p1}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 411
    move v3, v4

    .restart local v3       #k:I
    :goto_5
    add-int v8, v4, v0

    if-ge v3, v8, :cond_6

    .line 412
    aget-wide v8, p0, v3

    xor-long/2addr v8, v12

    aput-wide v8, p0, v3

    .line 411
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 413
    .end local v3           #k:I
    :cond_6
    add-int/2addr v4, v0

    .line 414
    const/4 v3, 0x0

    .restart local v3       #k:I
    :goto_6
    array-length v8, p0

    if-ge v4, v8, :cond_7

    .line 415
    add-int/lit8 v5, v4, 0x1

    .end local v4           #pos:I
    .restart local v5       #pos:I
    aget-wide v8, p0, v4

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    xor-long/2addr v8, v10

    aput-wide v8, p0, v4

    .line 414
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_6

    .line 416
    :cond_7
    int-to-long v8, v2

    invoke-interface {p1, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    move v5, v4

    .line 417
    goto :goto_3

    .end local v0           #L:I
    .end local v2           #howmany:I
    .end local v3           #k:I
    :cond_8
    move v5, v4

    .line 420
    goto :goto_3
.end method

.method public static not(Lcom/googlecode/javaewah/IteratingRLW;)Lcom/googlecode/javaewah/IteratingRLW;
    .locals 1
    .parameter "x"

    .prologue
    .line 23
    new-instance v0, Lcom/googlecode/javaewah/IteratorAggregation$1;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah/IteratorAggregation$1;-><init>(Lcom/googlecode/javaewah/IteratingRLW;)V

    return-object v0
.end method

.method public static xorToContainer(Lcom/googlecode/javaewah/BitmapStorage;ILcom/googlecode/javaewah/IteratingRLW;Lcom/googlecode/javaewah/IteratingRLW;)V
    .locals 12
    .parameter "container"
    .parameter "desiredrlwcount"
    .parameter "rlwi"
    .parameter "rlwj"

    .prologue
    .line 309
    :goto_0
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_8

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->size()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_8

    add-int/lit8 v0, p1, -0x1

    .end local p1
    .local v0, desiredrlwcount:I
    if-lez p1, :cond_7

    .line 310
    :goto_1
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-gtz v8, :cond_0

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_5

    .line 311
    :cond_0
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-gez v8, :cond_1

    const/4 v1, 0x1

    .line 313
    .local v1, i_is_prey:Z
    :goto_2
    if-eqz v1, :cond_2

    move-object v7, p2

    .line 314
    .local v7, prey:Lcom/googlecode/javaewah/IteratingRLW;
    :goto_3
    if-eqz v1, :cond_3

    move-object v6, p3

    .line 316
    .local v6, predator:Lcom/googlecode/javaewah/IteratingRLW;
    :goto_4
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningBit()Z

    move-result v8

    if-nez v8, :cond_4

    .line 317
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-static {p0, v7, v8, v9}, Lcom/googlecode/javaewah/IteratorAggregation;->discharge(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;J)J

    move-result-wide v2

    .line 318
    .local v2, index:J
    const/4 v8, 0x0

    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v9

    sub-long/2addr v9, v2

    invoke-interface {p0, v8, v9, v10}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 320
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {v6, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_1

    .line 311
    .end local v1           #i_is_prey:Z
    .end local v2           #index:J
    .end local v6           #predator:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v7           #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    .restart local v1       #i_is_prey:Z
    :cond_2
    move-object v7, p3

    .line 313
    goto :goto_3

    .restart local v7       #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_3
    move-object v6, p2

    .line 314
    goto :goto_4

    .line 322
    .restart local v6       #predator:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_4
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-static {p0, v7, v8, v9}, Lcom/googlecode/javaewah/IteratorAggregation;->dischargeNegated(Lcom/googlecode/javaewah/BitmapStorage;Lcom/googlecode/javaewah/IteratingRLW;J)J

    move-result-wide v2

    .line 323
    .restart local v2       #index:J
    const/4 v8, 0x1

    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v9

    sub-long/2addr v9, v2

    invoke-interface {p0, v8, v9, v10}, Lcom/googlecode/javaewah/BitmapStorage;->addStreamOfEmptyWords(ZJ)V

    .line 325
    invoke-interface {v6}, Lcom/googlecode/javaewah/IteratingRLW;->getRunningLength()J

    move-result-wide v8

    invoke-interface {v6, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto :goto_1

    .line 328
    .end local v1           #i_is_prey:Z
    .end local v2           #index:J
    .end local v6           #predator:Lcom/googlecode/javaewah/IteratingRLW;
    .end local v7           #prey:Lcom/googlecode/javaewah/IteratingRLW;
    :cond_5
    invoke-interface {p2}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v8

    invoke-interface {p3}, Lcom/googlecode/javaewah/IteratingRLW;->getNumberOfLiteralWords()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 330
    .local v5, nbre_literal:I
    if-lez v5, :cond_9

    .line 331
    sub-int p1, v0, v5

    .line 332
    .end local v0           #desiredrlwcount:I
    .restart local p1
    const/4 v4, 0x0

    .local v4, k:I
    :goto_5
    if-ge v4, v5, :cond_6

    .line 333
    invoke-interface {p2, v4}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v8

    invoke-interface {p3, v4}, Lcom/googlecode/javaewah/IteratingRLW;->getLiteralWordAt(I)J

    move-result-wide v10

    xor-long/2addr v8, v10

    invoke-interface {p0, v8, v9}, Lcom/googlecode/javaewah/BitmapStorage;->add(J)V

    .line 332
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 334
    :cond_6
    int-to-long v8, v5

    invoke-interface {p2, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    .line 335
    int-to-long v8, v5

    invoke-interface {p3, v8, v9}, Lcom/googlecode/javaewah/IteratingRLW;->discardFirstWords(J)V

    goto/16 :goto_0

    .end local v4           #k:I
    .end local v5           #nbre_literal:I
    .end local p1
    .restart local v0       #desiredrlwcount:I
    :cond_7
    move p1, v0

    .line 338
    .end local v0           #desiredrlwcount:I
    .restart local p1
    :cond_8
    return-void

    .end local p1
    .restart local v0       #desiredrlwcount:I
    .restart local v5       #nbre_literal:I
    :cond_9
    move p1, v0

    .end local v0           #desiredrlwcount:I
    .restart local p1
    goto/16 :goto_0
.end method
