.class public Lcom/googlecode/javaewah32/IteratorAggregation32;
.super Ljava/lang/Object;
.source "IteratorAggregation32.java"


# static fields
.field public static final DEFAULTMAXBUFSIZE:I = 0x10000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static andToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;ILcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/IteratingRLW32;)V
    .locals 10
    .parameter "container"
    .parameter "desiredrlwcount"
    .parameter "rlwi"
    .parameter "rlwj"

    .prologue
    const/4 v7, 0x0

    .line 225
    :goto_0
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v8

    if-lez v8, :cond_8

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v8

    if-lez v8, :cond_8

    add-int/lit8 v0, p1, -0x1

    .end local p1
    .local v0, desiredrlwcount:I
    if-lez p1, :cond_7

    .line 226
    :goto_1
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    if-gtz v8, :cond_0

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    if-lez v8, :cond_5

    .line 227
    :cond_0
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    if-ge v8, v9, :cond_1

    const/4 v1, 0x1

    .line 229
    .local v1, i_is_prey:Z
    :goto_2
    if-eqz v1, :cond_2

    move-object v6, p2

    .line 230
    .local v6, prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :goto_3
    if-eqz v1, :cond_3

    move-object v5, p3

    .line 232
    .local v5, predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    :goto_4
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v8

    if-nez v8, :cond_4

    .line 233
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    invoke-interface {p0, v7, v8}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 234
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    invoke-interface {v6, v8}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 235
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    invoke-interface {v5, v8}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_1

    .end local v1           #i_is_prey:Z
    .end local v5           #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v6           #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_1
    move v1, v7

    .line 227
    goto :goto_2

    .restart local v1       #i_is_prey:Z
    :cond_2
    move-object v6, p3

    .line 229
    goto :goto_3

    .restart local v6       #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_3
    move-object v5, p2

    .line 230
    goto :goto_4

    .line 237
    .restart local v5       #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_4
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    invoke-static {p0, v6, v8}, Lcom/googlecode/javaewah32/IteratorAggregation32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;I)I

    move-result v2

    .line 238
    .local v2, index:I
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    sub-int/2addr v8, v2

    invoke-interface {p0, v7, v8}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 240
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    invoke-interface {v5, v8}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_1

    .line 243
    .end local v1           #i_is_prey:Z
    .end local v2           #index:I
    .end local v5           #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v6           #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_5
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v8

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 245
    .local v4, nbre_literal:I
    if-lez v4, :cond_9

    .line 246
    sub-int p1, v0, v4

    .line 247
    .end local v0           #desiredrlwcount:I
    .restart local p1
    const/4 v3, 0x0

    .local v3, k:I
    :goto_5
    if-ge v3, v4, :cond_6

    .line 248
    invoke-interface {p2, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    invoke-interface {p3, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v9

    and-int/2addr v8, v9

    invoke-interface {p0, v8}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 247
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 249
    :cond_6
    invoke-interface {p2, v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 250
    invoke-interface {p3, v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto/16 :goto_0

    .end local v3           #k:I
    .end local v4           #nbre_literal:I
    .end local p1
    .restart local v0       #desiredrlwcount:I
    :cond_7
    move p1, v0

    .line 253
    .end local v0           #desiredrlwcount:I
    .restart local p1
    :cond_8
    return-void

    .end local p1
    .restart local v0       #desiredrlwcount:I
    .restart local v4       #nbre_literal:I
    :cond_9
    move p1, v0

    .end local v0           #desiredrlwcount:I
    .restart local p1
    goto/16 :goto_0
.end method

.method static andToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/IteratingRLW32;)V
    .locals 9
    .parameter "container"
    .parameter "rlwi"
    .parameter "rlwj"

    .prologue
    const/4 v6, 0x0

    .line 257
    :cond_0
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v7

    if-lez v7, :cond_8

    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v7

    if-lez v7, :cond_8

    .line 258
    :goto_1
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    if-gtz v7, :cond_1

    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    if-lez v7, :cond_6

    .line 259
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v8

    if-ge v7, v8, :cond_2

    const/4 v0, 0x1

    .line 261
    .local v0, i_is_prey:Z
    :goto_2
    if-eqz v0, :cond_3

    move-object v5, p1

    .line 262
    .local v5, prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :goto_3
    if-eqz v0, :cond_4

    move-object v4, p2

    .line 264
    .local v4, predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    :goto_4
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-nez v7, :cond_5

    .line 265
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    invoke-interface {p0, v6, v7}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 266
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    invoke-interface {v5, v7}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 267
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    invoke-interface {v4, v7}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_1

    .end local v0           #i_is_prey:Z
    .end local v4           #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v5           #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_2
    move v0, v6

    .line 259
    goto :goto_2

    .restart local v0       #i_is_prey:Z
    :cond_3
    move-object v5, p2

    .line 261
    goto :goto_3

    .restart local v5       #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_4
    move-object v4, p1

    .line 262
    goto :goto_4

    .line 269
    .restart local v4       #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_5
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    invoke-static {p0, v5, v7}, Lcom/googlecode/javaewah32/IteratorAggregation32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;I)I

    move-result v1

    .line 270
    .local v1, index:I
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    sub-int/2addr v7, v1

    invoke-interface {p0, v6, v7}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 272
    invoke-interface {v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v7

    invoke-interface {v4, v7}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_1

    .line 275
    .end local v0           #i_is_prey:Z
    .end local v1           #index:I
    .end local v4           #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v5           #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_6
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v7

    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 277
    .local v3, nbre_literal:I
    if-lez v3, :cond_0

    .line 278
    const/4 v2, 0x0

    .local v2, k:I
    :goto_5
    if-ge v2, v3, :cond_7

    .line 279
    invoke-interface {p1, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v7

    invoke-interface {p2, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    and-int/2addr v7, v8

    invoke-interface {p0, v7}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 278
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 280
    :cond_7
    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 281
    invoke-interface {p2, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto/16 :goto_0

    .line 284
    .end local v2           #k:I
    .end local v3           #nbre_literal:I
    :cond_8
    return-void
.end method

.method public static varargs bufferedand(I[Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 7
    .parameter "bufsize"
    .parameter "al"

    .prologue
    .line 84
    array-length v5, p1

    if-nez v5, :cond_0

    .line 85
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Need at least one iterator"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 86
    :cond_0
    array-length v5, p1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 87
    const/4 v5, 0x0

    aget-object v5, p1, v5

    .line 91
    :goto_0
    return-object v5

    .line 88
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 89
    .local v1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah32/IteratingRLW32;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 90
    .local v2, i:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 89
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 91
    .end local v2           #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_2
    new-instance v5, Lcom/googlecode/javaewah32/BufferedIterator32;

    new-instance v6, Lcom/googlecode/javaewah32/AndIt;

    invoke-direct {v6, v1, p0}, Lcom/googlecode/javaewah32/AndIt;-><init>(Ljava/util/LinkedList;I)V

    invoke-direct {v5, v6}, Lcom/googlecode/javaewah32/BufferedIterator32;-><init>(Lcom/googlecode/javaewah/CloneableIterator;)V

    goto :goto_0
.end method

.method public static varargs bufferedand([Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 1
    .parameter "al"

    .prologue
    .line 73
    const/high16 v0, 0x1

    invoke-static {v0, p0}, Lcom/googlecode/javaewah32/IteratorAggregation32;->bufferedand(I[Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v0

    return-object v0
.end method

.method public static varargs bufferedor(I[Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 7
    .parameter "bufsize"
    .parameter "al"

    .prologue
    .line 112
    array-length v5, p1

    if-nez v5, :cond_0

    .line 113
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Need at least one iterator"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 114
    :cond_0
    array-length v5, p1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 115
    const/4 v5, 0x0

    aget-object v5, p1, v5

    .line 120
    :goto_0
    return-object v5

    .line 117
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 118
    .local v1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah32/IteratingRLW32;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 119
    .local v2, i:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 118
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 120
    .end local v2           #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_2
    new-instance v5, Lcom/googlecode/javaewah32/BufferedIterator32;

    new-instance v6, Lcom/googlecode/javaewah32/ORIt;

    invoke-direct {v6, v1, p0}, Lcom/googlecode/javaewah32/ORIt;-><init>(Ljava/util/LinkedList;I)V

    invoke-direct {v5, v6}, Lcom/googlecode/javaewah32/BufferedIterator32;-><init>(Lcom/googlecode/javaewah/CloneableIterator;)V

    goto :goto_0
.end method

.method public static varargs bufferedor([Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 1
    .parameter "al"

    .prologue
    .line 101
    const/high16 v0, 0x1

    invoke-static {v0, p0}, Lcom/googlecode/javaewah32/IteratorAggregation32;->bufferedor(I[Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v0

    return-object v0
.end method

.method public static varargs bufferedxor(I[Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 7
    .parameter "bufsize"
    .parameter "al"

    .prologue
    .line 140
    array-length v5, p1

    if-nez v5, :cond_0

    .line 141
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Need at least one iterator"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 142
    :cond_0
    array-length v5, p1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 143
    const/4 v5, 0x0

    aget-object v5, p1, v5

    .line 148
    :goto_0
    return-object v5

    .line 145
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 146
    .local v1, basell:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javaewah32/IteratingRLW32;>;"
    move-object v0, p1

    .local v0, arr$:[Lcom/googlecode/javaewah32/IteratingRLW32;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 147
    .local v2, i:Lcom/googlecode/javaewah32/IteratingRLW32;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 146
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 148
    .end local v2           #i:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_2
    new-instance v5, Lcom/googlecode/javaewah32/BufferedIterator32;

    new-instance v6, Lcom/googlecode/javaewah32/XORIt;

    invoke-direct {v6, v1, p0}, Lcom/googlecode/javaewah32/XORIt;-><init>(Ljava/util/LinkedList;I)V

    invoke-direct {v5, v6}, Lcom/googlecode/javaewah32/BufferedIterator32;-><init>(Lcom/googlecode/javaewah/CloneableIterator;)V

    goto :goto_0
.end method

.method public static varargs bufferedxor([Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 1
    .parameter "al"

    .prologue
    .line 130
    const/high16 v0, 0x1

    invoke-static {v0, p0}, Lcom/googlecode/javaewah32/IteratorAggregation32;->bufferedxor(I[Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;

    move-result-object v0

    return-object v0
.end method

.method protected static discharge(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;I)I
    .locals 5
    .parameter "container"
    .parameter "i"
    .parameter "max"

    .prologue
    .line 175
    const/4 v2, 0x0

    .line 176
    .local v2, counter:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v4

    if-lez v4, :cond_4

    if-ge v2, p2, :cond_4

    .line 177
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v1

    .line 178
    .local v1, L1:I
    if-lez v1, :cond_1

    .line 179
    add-int v4, v1, v2

    if-le v4, p2, :cond_0

    .line 180
    sub-int v1, p2, v2

    .line 181
    :cond_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v4

    invoke-interface {p0, v4, v1}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 182
    add-int/2addr v2, v1

    .line 184
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v0

    .line 185
    .local v0, L:I
    add-int v4, v0, v2

    if-le v4, p2, :cond_2

    sub-int v0, p2, v2

    .line 186
    :cond_2
    const/4 v3, 0x0

    .local v3, k:I
    :goto_1
    if-ge v3, v0, :cond_3

    .line 187
    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v4

    invoke-interface {p0, v4}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 186
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 189
    :cond_3
    add-int/2addr v2, v0

    .line 190
    add-int v4, v0, v1

    invoke-interface {p1, v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_0

    .line 192
    .end local v0           #L:I
    .end local v1           #L1:I
    .end local v3           #k:I
    :cond_4
    return v2
.end method

.method protected static dischargeAsEmpty(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;)V
    .locals 2
    .parameter "container"
    .parameter "i"

    .prologue
    .line 160
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 161
    const/4 v0, 0x0

    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v1

    invoke-interface {p0, v0, v1}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 162
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    goto :goto_0

    .line 165
    :cond_0
    return-void
.end method

.method protected static dischargeNegated(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;I)I
    .locals 5
    .parameter "container"
    .parameter "i"
    .parameter "max"

    .prologue
    .line 203
    const/4 v2, 0x0

    .line 204
    .local v2, counter:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v4

    if-lez v4, :cond_4

    if-ge v2, p2, :cond_4

    .line 205
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v1

    .line 206
    .local v1, L1:I
    if-lez v1, :cond_1

    .line 207
    add-int v4, v1, v2

    if-le v4, p2, :cond_0

    .line 208
    sub-int v1, p2, v2

    .line 209
    :cond_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v4

    invoke-interface {p0, v4, v1}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 210
    add-int/2addr v2, v1

    .line 212
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v0

    .line 213
    .local v0, L:I
    add-int v4, v0, v2

    if-le v4, p2, :cond_2

    sub-int v0, p2, v2

    .line 214
    :cond_2
    const/4 v3, 0x0

    .local v3, k:I
    :goto_1
    if-ge v3, v0, :cond_3

    .line 215
    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v4

    invoke-interface {p0, v4}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 214
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 217
    :cond_3
    add-int/2addr v2, v0

    .line 218
    add-int v4, v0, v1

    invoke-interface {p1, v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_0

    .line 220
    .end local v0           #L:I
    .end local v1           #L1:I
    .end local v3           #k:I
    :cond_4
    return v2
.end method

.method protected static inplaceand([ILcom/googlecode/javaewah32/IteratingRLW32;)I
    .locals 10
    .parameter "bitmap"
    .parameter "i"

    .prologue
    const/4 v9, 0x0

    .line 410
    const/4 v4, 0x0

    .line 412
    .local v4, pos:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v6

    .local v6, s:I
    if-lez v6, :cond_8

    .line 413
    add-int v7, v4, v6

    array-length v8, p0

    if-ge v7, v8, :cond_3

    .line 414
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    .line 415
    .local v0, L:I
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-nez v7, :cond_0

    .line 416
    move v3, v4

    .local v3, k:I
    :goto_1
    add-int v7, v4, v0

    if-ge v3, v7, :cond_0

    .line 417
    aput v9, p0, v3

    .line 416
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 419
    .end local v3           #k:I
    :cond_0
    add-int/2addr v4, v0

    .line 420
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v1

    .line 421
    .local v1, LR:I
    const/4 v3, 0x0

    .restart local v3       #k:I
    move v5, v4

    .end local v4           #pos:I
    .local v5, pos:I
    :goto_2
    if-ge v3, v1, :cond_1

    .line 422
    add-int/lit8 v4, v5, 0x1

    .end local v5           #pos:I
    .restart local v4       #pos:I
    aget v7, p0, v5

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    and-int/2addr v7, v8

    aput v7, p0, v5

    .line 421
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4           #pos:I
    .restart local v5       #pos:I
    goto :goto_2

    .line 423
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    move-result v7

    if-nez v7, :cond_2

    move v4, v5

    .line 447
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

    .line 426
    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_0

    .line 427
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    :cond_3
    array-length v7, p0

    sub-int v2, v7, v4

    .line 428
    .local v2, howmany:I
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    .line 429
    .restart local v0       #L:I
    add-int v7, v4, v0

    array-length v8, p0

    if-le v7, v8, :cond_5

    .line 430
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-nez v7, :cond_4

    .line 431
    move v3, v4

    .restart local v3       #k:I
    :goto_4
    array-length v7, p0

    if-ge v3, v7, :cond_4

    .line 432
    aput v9, p0, v3

    .line 431
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 434
    .end local v3           #k:I
    :cond_4
    invoke-interface {p1, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 435
    array-length v5, p0

    goto :goto_3

    .line 437
    :cond_5
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-nez v7, :cond_6

    .line 438
    move v3, v4

    .restart local v3       #k:I
    :goto_5
    add-int v7, v4, v0

    if-ge v3, v7, :cond_6

    .line 439
    aput v9, p0, v3

    .line 438
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 440
    .end local v3           #k:I
    :cond_6
    add-int/2addr v4, v0

    .line 441
    const/4 v3, 0x0

    .restart local v3       #k:I
    :goto_6
    array-length v7, p0

    if-ge v4, v7, :cond_7

    .line 442
    add-int/lit8 v5, v4, 0x1

    .end local v4           #pos:I
    .restart local v5       #pos:I
    aget v7, p0, v4

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    and-int/2addr v7, v8

    aput v7, p0, v4

    .line 441
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_6

    .line 443
    :cond_7
    invoke-interface {p1, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    move v5, v4

    .line 444
    goto :goto_3

    .end local v0           #L:I
    .end local v2           #howmany:I
    .end local v3           #k:I
    :cond_8
    move v5, v4

    .line 447
    goto :goto_3
.end method

.method protected static inplaceor([ILcom/googlecode/javaewah32/IteratingRLW32;)I
    .locals 10
    .parameter "bitmap"
    .parameter "i"

    .prologue
    const/4 v9, -0x1

    .line 330
    const/4 v4, 0x0

    .line 332
    .local v4, pos:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v6

    .local v6, s:I
    if-lez v6, :cond_8

    .line 333
    add-int v7, v4, v6

    array-length v8, p0

    if-ge v7, v8, :cond_3

    .line 334
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    .line 335
    .local v0, L:I
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 336
    add-int v7, v4, v0

    invoke-static {p0, v4, v7, v9}, Ljava/util/Arrays;->fill([IIII)V

    .line 337
    :cond_0
    add-int/2addr v4, v0

    .line 338
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v1

    .line 339
    .local v1, LR:I
    const/4 v3, 0x0

    .local v3, k:I
    move v5, v4

    .end local v4           #pos:I
    .local v5, pos:I
    :goto_1
    if-ge v3, v1, :cond_1

    .line 340
    add-int/lit8 v4, v5, 0x1

    .end local v5           #pos:I
    .restart local v4       #pos:I
    aget v7, p0, v5

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    or-int/2addr v7, v8

    aput v7, p0, v5

    .line 339
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4           #pos:I
    .restart local v5       #pos:I
    goto :goto_1

    .line 341
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    move-result v7

    if-nez v7, :cond_2

    move v4, v5

    .line 363
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

    .line 344
    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_0

    .line 345
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    :cond_3
    array-length v7, p0

    sub-int v2, v7, v4

    .line 346
    .local v2, howmany:I
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    .line 347
    .restart local v0       #L:I
    add-int v7, v4, v0

    array-length v8, p0

    if-le v7, v8, :cond_5

    .line 348
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 349
    array-length v7, p0

    invoke-static {p0, v4, v7, v9}, Ljava/util/Arrays;->fill([IIII)V

    .line 351
    :cond_4
    invoke-interface {p1, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 352
    array-length v5, p0

    goto :goto_2

    .line 354
    :cond_5
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 355
    add-int v7, v4, v0

    invoke-static {p0, v4, v7, v9}, Ljava/util/Arrays;->fill([IIII)V

    .line 356
    :cond_6
    add-int/2addr v4, v0

    .line 357
    const/4 v3, 0x0

    .restart local v3       #k:I
    :goto_3
    array-length v7, p0

    if-ge v4, v7, :cond_7

    .line 358
    add-int/lit8 v5, v4, 0x1

    .end local v4           #pos:I
    .restart local v5       #pos:I
    aget v7, p0, v4

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    or-int/2addr v7, v8

    aput v7, p0, v4

    .line 357
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_3

    .line 359
    :cond_7
    invoke-interface {p1, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    move v5, v4

    .line 360
    goto :goto_2

    .end local v0           #L:I
    .end local v2           #howmany:I
    .end local v3           #k:I
    :cond_8
    move v5, v4

    .line 363
    goto :goto_2
.end method

.method protected static inplacexor([ILcom/googlecode/javaewah32/IteratingRLW32;)I
    .locals 9
    .parameter "bitmap"
    .parameter "i"

    .prologue
    .line 369
    const/4 v4, 0x0

    .line 371
    .local v4, pos:I
    :goto_0
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v6

    .local v6, s:I
    if-lez v6, :cond_8

    .line 372
    add-int v7, v4, v6

    array-length v8, p0

    if-ge v7, v8, :cond_3

    .line 373
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    .line 374
    .local v0, L:I
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 375
    move v3, v4

    .local v3, k:I
    :goto_1
    add-int v7, v4, v0

    if-ge v3, v7, :cond_0

    .line 376
    aget v7, p0, v3

    xor-int/lit8 v7, v7, -0x1

    aput v7, p0, v3

    .line 375
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 378
    .end local v3           #k:I
    :cond_0
    add-int/2addr v4, v0

    .line 379
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v1

    .line 380
    .local v1, LR:I
    const/4 v3, 0x0

    .restart local v3       #k:I
    move v5, v4

    .end local v4           #pos:I
    .local v5, pos:I
    :goto_2
    if-ge v3, v1, :cond_1

    .line 381
    add-int/lit8 v4, v5, 0x1

    .end local v5           #pos:I
    .restart local v4       #pos:I
    aget v7, p0, v5

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    xor-int/2addr v7, v8

    aput v7, p0, v5

    .line 380
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4           #pos:I
    .restart local v5       #pos:I
    goto :goto_2

    .line 382
    :cond_1
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->next()Z

    move-result v7

    if-nez v7, :cond_2

    move v4, v5

    .line 406
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

    .line 385
    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_0

    .line 386
    .end local v0           #L:I
    .end local v1           #LR:I
    .end local v3           #k:I
    :cond_3
    array-length v7, p0

    sub-int v2, v7, v4

    .line 387
    .local v2, howmany:I
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v0

    .line 388
    .restart local v0       #L:I
    add-int v7, v4, v0

    array-length v8, p0

    if-le v7, v8, :cond_5

    .line 389
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 390
    move v3, v4

    .restart local v3       #k:I
    :goto_4
    array-length v7, p0

    if-ge v3, v7, :cond_4

    .line 391
    aget v7, p0, v3

    xor-int/lit8 v7, v7, -0x1

    aput v7, p0, v3

    .line 390
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 393
    .end local v3           #k:I
    :cond_4
    invoke-interface {p1, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 394
    array-length v5, p0

    goto :goto_3

    .line 396
    :cond_5
    invoke-interface {p1}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 397
    move v3, v4

    .restart local v3       #k:I
    :goto_5
    add-int v7, v4, v0

    if-ge v3, v7, :cond_6

    .line 398
    aget v7, p0, v3

    xor-int/lit8 v7, v7, -0x1

    aput v7, p0, v3

    .line 397
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 399
    .end local v3           #k:I
    :cond_6
    add-int/2addr v4, v0

    .line 400
    const/4 v3, 0x0

    .restart local v3       #k:I
    :goto_6
    array-length v7, p0

    if-ge v4, v7, :cond_7

    .line 401
    add-int/lit8 v5, v4, 0x1

    .end local v4           #pos:I
    .restart local v5       #pos:I
    aget v7, p0, v4

    invoke-interface {p1, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v8

    xor-int/2addr v7, v8

    aput v7, p0, v4

    .line 400
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5           #pos:I
    .restart local v4       #pos:I
    goto :goto_6

    .line 402
    :cond_7
    invoke-interface {p1, v2}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    move v5, v4

    .line 403
    goto :goto_3

    .end local v0           #L:I
    .end local v2           #howmany:I
    .end local v3           #k:I
    :cond_8
    move v5, v4

    .line 406
    goto :goto_3
.end method

.method public static not(Lcom/googlecode/javaewah32/IteratingRLW32;)Lcom/googlecode/javaewah32/IteratingRLW32;
    .locals 1
    .parameter "x"

    .prologue
    .line 26
    new-instance v0, Lcom/googlecode/javaewah32/IteratorAggregation32$1;

    invoke-direct {v0, p0}, Lcom/googlecode/javaewah32/IteratorAggregation32$1;-><init>(Lcom/googlecode/javaewah32/IteratingRLW32;)V

    return-object v0
.end method

.method public static xorToContainer(Lcom/googlecode/javaewah32/BitmapStorage32;ILcom/googlecode/javaewah32/IteratingRLW32;Lcom/googlecode/javaewah32/IteratingRLW32;)V
    .locals 11
    .parameter "container"
    .parameter "desiredrlwcount"
    .parameter "rlwi"
    .parameter "rlwj"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 297
    :goto_0
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v9

    if-lez v9, :cond_8

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->size()I

    move-result v9

    if-lez v9, :cond_8

    add-int/lit8 v0, p1, -0x1

    .end local p1
    .local v0, desiredrlwcount:I
    if-lez p1, :cond_7

    .line 298
    :goto_1
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    if-gtz v9, :cond_0

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    if-lez v9, :cond_5

    .line 299
    :cond_0
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v10

    if-ge v9, v10, :cond_1

    move v1, v7

    .line 301
    .local v1, i_is_prey:Z
    :goto_2
    if-eqz v1, :cond_2

    move-object v6, p2

    .line 302
    .local v6, prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :goto_3
    if-eqz v1, :cond_3

    move-object v5, p3

    .line 304
    .local v5, predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    :goto_4
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningBit()Z

    move-result v9

    if-nez v9, :cond_4

    .line 305
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    invoke-static {p0, v6, v9}, Lcom/googlecode/javaewah32/IteratorAggregation32;->discharge(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;I)I

    move-result v2

    .line 306
    .local v2, index:I
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    sub-int/2addr v9, v2

    invoke-interface {p0, v8, v9}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 308
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    invoke-interface {v5, v9}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_1

    .end local v1           #i_is_prey:Z
    .end local v2           #index:I
    .end local v5           #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v6           #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_1
    move v1, v8

    .line 299
    goto :goto_2

    .restart local v1       #i_is_prey:Z
    :cond_2
    move-object v6, p3

    .line 301
    goto :goto_3

    .restart local v6       #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_3
    move-object v5, p2

    .line 302
    goto :goto_4

    .line 310
    .restart local v5       #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_4
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    invoke-static {p0, v6, v9}, Lcom/googlecode/javaewah32/IteratorAggregation32;->dischargeNegated(Lcom/googlecode/javaewah32/BitmapStorage32;Lcom/googlecode/javaewah32/IteratingRLW32;I)I

    move-result v2

    .line 311
    .restart local v2       #index:I
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    sub-int/2addr v9, v2

    invoke-interface {p0, v7, v9}, Lcom/googlecode/javaewah32/BitmapStorage32;->addStreamOfEmptyWords(ZI)V

    .line 313
    invoke-interface {v5}, Lcom/googlecode/javaewah32/IteratingRLW32;->getRunningLength()I

    move-result v9

    invoke-interface {v5, v9}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto :goto_1

    .line 316
    .end local v1           #i_is_prey:Z
    .end local v2           #index:I
    .end local v5           #predator:Lcom/googlecode/javaewah32/IteratingRLW32;
    .end local v6           #prey:Lcom/googlecode/javaewah32/IteratingRLW32;
    :cond_5
    invoke-interface {p2}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v9

    invoke-interface {p3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getNumberOfLiteralWords()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 318
    .local v4, nbre_literal:I
    if-lez v4, :cond_9

    .line 319
    sub-int p1, v0, v4

    .line 320
    .end local v0           #desiredrlwcount:I
    .restart local p1
    const/4 v3, 0x0

    .local v3, k:I
    :goto_5
    if-ge v3, v4, :cond_6

    .line 321
    invoke-interface {p2, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v9

    invoke-interface {p3, v3}, Lcom/googlecode/javaewah32/IteratingRLW32;->getLiteralWordAt(I)I

    move-result v10

    xor-int/2addr v9, v10

    invoke-interface {p0, v9}, Lcom/googlecode/javaewah32/BitmapStorage32;->add(I)V

    .line 320
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 322
    :cond_6
    invoke-interface {p2, v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    .line 323
    invoke-interface {p3, v4}, Lcom/googlecode/javaewah32/IteratingRLW32;->discardFirstWords(I)V

    goto/16 :goto_0

    .end local v3           #k:I
    .end local v4           #nbre_literal:I
    .end local p1
    .restart local v0       #desiredrlwcount:I
    :cond_7
    move p1, v0

    .line 326
    .end local v0           #desiredrlwcount:I
    .restart local p1
    :cond_8
    return-void

    .end local p1
    .restart local v0       #desiredrlwcount:I
    .restart local v4       #nbre_literal:I
    :cond_9
    move p1, v0

    .end local v0           #desiredrlwcount:I
    .restart local p1
    goto/16 :goto_0
.end method
