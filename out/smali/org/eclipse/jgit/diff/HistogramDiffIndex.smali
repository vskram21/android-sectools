.class final Lorg/eclipse/jgit/diff/HistogramDiffIndex;
.super Ljava/lang/Object;
.source "HistogramDiffIndex.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final MAX_CNT:I = 0xff

.field private static final MAX_PTR:I = 0xfffffff

.field private static final REC_CNT_MASK:I = 0xff

.field private static final REC_NEXT_SHIFT:I = 0x24

.field private static final REC_PTR_MASK:I = 0xfffffff

.field private static final REC_PTR_SHIFT:I = 0x8


# instance fields
.field private final a:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field private final b:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field private final cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;"
        }
    .end annotation
.end field

.field private cnt:I

.field private hasCommon:Z

.field private final keyShift:I

.field private lcs:Lorg/eclipse/jgit/diff/Edit;

.field private final maxChainLength:I

.field private next:[I

.field private ptrShift:I

.field private recCnt:I

.field private recIdx:[I

.field private recs:[J

.field private final region:Lorg/eclipse/jgit/diff/Edit;

.field private final table:[I


# direct methods
.method constructor <init>(ILorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V
    .locals 4
    .parameter "maxChainLength"
    .parameter
    .parameter
    .parameter
    .parameter "r"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/Edit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiffIndex;,"Lorg/eclipse/jgit/diff/HistogramDiffIndex<TS;>;"
    .local p2, cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p3, a:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    .local p4, b:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    iput p1, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->maxChainLength:I

    .line 150
    iput-object p2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    .line 151
    iput-object p3, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 152
    iput-object p4, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 153
    iput-object p5, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    .line 155
    iget-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v2, v2, Lorg/eclipse/jgit/diff/Edit;->endA:I

    const v3, 0xfffffff

    if-lt v2, v3, :cond_0

    .line 156
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->sequenceTooLargeForDiffAlgorithm:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 159
    :cond_0
    invoke-virtual {p5}, Lorg/eclipse/jgit/diff/Edit;->getLengthA()I

    move-result v0

    .line 160
    .local v0, sz:I
    invoke-static {v0}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->tableBits(I)I

    move-result v1

    .line 161
    .local v1, tableBits:I
    const/4 v2, 0x1

    shl-int/2addr v2, v1

    new-array v2, v2, [I

    iput-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->table:[I

    .line 162
    rsub-int/lit8 v2, v1, 0x20

    iput v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->keyShift:I

    .line 163
    iget v2, p5, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    iput v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    .line 165
    const/4 v2, 0x4

    ushr-int/lit8 v3, v0, 0x3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    new-array v2, v2, [J

    iput-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    .line 166
    new-array v2, v0, [I

    iput-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->next:[I

    .line 167
    new-array v2, v0, [I

    iput-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recIdx:[I

    .line 168
    return-void
.end method

.method private hash(Lorg/eclipse/jgit/diff/HashedSequence;I)I
    .locals 2
    .parameter
    .parameter "idx"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;I)I"
        }
    .end annotation

    .prologue
    .line 310
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiffIndex;,"Lorg/eclipse/jgit/diff/HistogramDiffIndex<TS;>;"
    .local p1, s:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->hash(Lorg/eclipse/jgit/diff/HashedSequence;I)I

    move-result v0

    const v1, -0x61c8ffff

    mul-int/2addr v0, v1

    iget v1, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->keyShift:I

    ushr-int/2addr v0, v1

    return v0
.end method

.method private static recCnt(J)I
    .locals 1
    .parameter "rec"

    .prologue
    .line 328
    long-to-int v0, p0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private static recCreate(III)J
    .locals 5
    .parameter "next"
    .parameter "ptr"
    .parameter "cnt"

    .prologue
    .line 314
    int-to-long v0, p0

    const/16 v2, 0x24

    shl-long/2addr v0, v2

    int-to-long v2, p1

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p2

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private static recNext(J)I
    .locals 2
    .parameter "rec"

    .prologue
    .line 320
    const/16 v0, 0x24

    ushr-long v0, p0, v0

    long-to-int v0, v0

    return v0
.end method

.method private static recPtr(J)I
    .locals 2
    .parameter "rec"

    .prologue
    .line 324
    const/16 v0, 0x8

    ushr-long v0, p0, v0

    long-to-int v0, v0

    const v1, 0xfffffff

    and-int/2addr v0, v1

    return v0
.end method

.method private scanA()Z
    .locals 15

    .prologue
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiffIndex;,"Lorg/eclipse/jgit/diff/HistogramDiffIndex<TS;>;"
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 189
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v11, v11, Lorg/eclipse/jgit/diff/Edit;->endA:I

    add-int/lit8 v3, v11, -0x1

    .local v3, ptr:I
    :goto_0
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v11, v11, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    if-gt v11, v3, :cond_5

    .line 190
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-direct {p0, v11, v3}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->hash(Lorg/eclipse/jgit/diff/HashedSequence;I)I

    move-result v8

    .line 192
    .local v8, tIdx:I
    const/4 v0, 0x0

    .line 193
    .local v0, chainLen:I
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->table:[I

    aget v4, v11, v8

    .local v4, rIdx:I
    :goto_1
    if-eqz v4, :cond_2

    .line 194
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    aget-wide v5, v11, v4

    .line 195
    .local v5, rec:J
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    iget-object v12, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recPtr(J)I

    move-result v13

    iget-object v14, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-virtual {v11, v12, v13, v14, v3}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 199
    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCnt(J)I

    move-result v11

    add-int/lit8 v2, v11, 0x1

    .line 200
    .local v2, newCnt:I
    const/16 v11, 0xff

    if-ge v11, v2, :cond_0

    .line 201
    const/16 v2, 0xff

    .line 202
    :cond_0
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recNext(J)I

    move-result v12

    invoke-static {v12, v3, v2}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCreate(III)J

    move-result-wide v12

    aput-wide v12, v11, v4

    .line 203
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->next:[I

    iget v12, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    sub-int v12, v3, v12

    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recPtr(J)I

    move-result v13

    aput v13, v11, v12

    .line 204
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recIdx:[I

    iget v12, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    sub-int v12, v3, v12

    aput v4, v11, v12

    .line 189
    .end local v2           #newCnt:I
    .end local v5           #rec:J
    :goto_2
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 208
    .restart local v5       #rec:J
    :cond_1
    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recNext(J)I

    move-result v4

    .line 209
    add-int/lit8 v0, v0, 0x1

    .line 210
    goto :goto_1

    .line 212
    .end local v5           #rec:J
    :cond_2
    iget v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->maxChainLength:I

    if-ne v0, v11, :cond_3

    .line 230
    .end local v0           #chainLen:I
    .end local v4           #rIdx:I
    .end local v8           #tIdx:I
    :goto_3
    return v9

    .line 218
    .restart local v0       #chainLen:I
    .restart local v4       #rIdx:I
    .restart local v8       #tIdx:I
    :cond_3
    iget v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCnt:I

    add-int/lit8 v4, v11, 0x1

    iput v4, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCnt:I

    .line 219
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    array-length v11, v11

    if-ne v4, v11, :cond_4

    .line 220
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    array-length v11, v11

    shl-int/lit8 v11, v11, 0x1

    iget-object v12, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {v12}, Lorg/eclipse/jgit/diff/Edit;->getLengthA()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 221
    .local v7, sz:I
    new-array v1, v7, [J

    .line 222
    .local v1, n:[J
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    iget-object v12, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    array-length v12, v12

    invoke-static {v11, v9, v1, v9, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 223
    iput-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    .line 226
    .end local v1           #n:[J
    .end local v7           #sz:I
    :cond_4
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    iget-object v12, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->table:[I

    aget v12, v12, v8

    invoke-static {v12, v3, v10}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCreate(III)J

    move-result-wide v12

    aput-wide v12, v11, v4

    .line 227
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recIdx:[I

    iget v12, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    sub-int v12, v3, v12

    aput v4, v11, v12

    .line 228
    iget-object v11, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->table:[I

    aput v4, v11, v8

    goto :goto_2

    .end local v0           #chainLen:I
    .end local v4           #rIdx:I
    .end local v8           #tIdx:I
    :cond_5
    move v9, v10

    .line 230
    goto :goto_3
.end method

.method private static tableBits(I)I
    .locals 2
    .parameter "sz"

    .prologue
    .line 332
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v1

    rsub-int/lit8 v0, v1, 0x1f

    .line 333
    .local v0, bits:I
    if-nez v0, :cond_0

    .line 334
    const/4 v0, 0x1

    .line 335
    :cond_0
    const/4 v1, 0x1

    shl-int/2addr v1, v0

    if-ge v1, p0, :cond_1

    .line 336
    add-int/lit8 v0, v0, 0x1

    .line 337
    :cond_1
    return v0
.end method

.method private tryLongestCommonSequence(I)I
    .locals 17
    .parameter "bPtr"

    .prologue
    .line 234
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiffIndex;,"Lorg/eclipse/jgit/diff/HistogramDiffIndex<TS;>;"
    add-int/lit8 v4, p1, 0x1

    .line 235
    .local v4, bNext:I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->table:[I

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v13, v1}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->hash(Lorg/eclipse/jgit/diff/HashedSequence;I)I

    move-result v13

    aget v8, v12, v13

    .line 236
    .local v8, rIdx:I
    :goto_0
    if-eqz v8, :cond_b

    .line 237
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    aget-wide v10, v12, v8

    .line 240
    .local v10, rec:J
    invoke-static {v10, v11}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCnt(J)I

    move-result v12

    move-object/from16 v0, p0

    iget v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cnt:I

    if-le v12, v13, :cond_1

    .line 241
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->hasCommon:Z

    if-nez v12, :cond_0

    .line 242
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-static {v10, v11}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recPtr(J)I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    move/from16 v0, p1

    invoke-virtual {v12, v13, v14, v15, v0}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->hasCommon:Z

    .line 236
    :cond_0
    :goto_1
    invoke-static {v10, v11}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recNext(J)I

    move-result v8

    goto :goto_0

    .line 246
    :cond_1
    invoke-static {v10, v11}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recPtr(J)I

    move-result v3

    .line 247
    .local v3, as:I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    move/from16 v0, p1

    invoke-virtual {v12, v13, v3, v14, v0}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 250
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->hasCommon:Z

    .line 252
    :goto_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->next:[I

    move-object/from16 v0, p0

    iget v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    sub-int v13, v3, v13

    aget v7, v12, v13

    .line 253
    .local v7, np:I
    move/from16 v6, p1

    .line 254
    .local v6, bs:I
    add-int/lit8 v2, v3, 0x1

    .line 255
    .local v2, ae:I
    add-int/lit8 v5, v6, 0x1

    .line 256
    .local v5, be:I
    invoke-static {v10, v11}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCnt(J)I

    move-result v9

    .line 258
    .local v9, rc:I
    :cond_2
    :goto_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v12, v12, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    if-ge v12, v3, :cond_3

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v12, v12, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    if-ge v12, v6, :cond_3

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    add-int/lit8 v14, v3, -0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    add-int/lit8 v16, v6, -0x1

    invoke-virtual/range {v12 .. v16}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 260
    add-int/lit8 v3, v3, -0x1

    .line 261
    add-int/lit8 v6, v6, -0x1

    .line 262
    const/4 v12, 0x1

    if-ge v12, v9, :cond_2

    .line 263
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recIdx:[I

    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    sub-int v14, v3, v14

    aget v13, v13, v14

    aget-wide v12, v12, v13

    invoke-static {v12, v13}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCnt(J)I

    move-result v12

    invoke-static {v9, v12}, Ljava/lang/Math;->min(II)I

    move-result v9

    goto :goto_3

    .line 265
    :cond_3
    :goto_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v12, v12, Lorg/eclipse/jgit/diff/Edit;->endA:I

    if-ge v2, v12, :cond_5

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v12, v12, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ge v5, v12, :cond_5

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->a:Lorg/eclipse/jgit/diff/HashedSequence;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->b:Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-virtual {v12, v13, v2, v14, v5}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 267
    const/4 v12, 0x1

    if-ge v12, v9, :cond_4

    .line 268
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recs:[J

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recIdx:[I

    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    sub-int v14, v2, v14

    aget v13, v13, v14

    aget-wide v12, v12, v13

    invoke-static {v12, v13}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->recCnt(J)I

    move-result v12

    invoke-static {v9, v12}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 269
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 270
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 273
    :cond_5
    if-ge v4, v5, :cond_6

    .line 274
    move v4, v5

    .line 275
    :cond_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->lcs:Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {v12}, Lorg/eclipse/jgit/diff/Edit;->getLengthA()I

    move-result v12

    sub-int v13, v2, v3

    if-lt v12, v13, :cond_7

    move-object/from16 v0, p0

    iget v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cnt:I

    if-ge v9, v12, :cond_8

    .line 279
    :cond_7
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->lcs:Lorg/eclipse/jgit/diff/Edit;

    iput v3, v12, Lorg/eclipse/jgit/diff/Edit;->beginA:I

    .line 280
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->lcs:Lorg/eclipse/jgit/diff/Edit;

    iput v6, v12, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    .line 281
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->lcs:Lorg/eclipse/jgit/diff/Edit;

    iput v2, v12, Lorg/eclipse/jgit/diff/Edit;->endA:I

    .line 282
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->lcs:Lorg/eclipse/jgit/diff/Edit;

    iput v5, v12, Lorg/eclipse/jgit/diff/Edit;->endB:I

    .line 283
    move-object/from16 v0, p0

    iput v9, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cnt:I

    .line 291
    :cond_8
    if-eqz v7, :cond_0

    .line 294
    :cond_9
    if-ge v7, v2, :cond_a

    .line 298
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->next:[I

    move-object/from16 v0, p0

    iget v13, v0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->ptrShift:I

    sub-int v13, v7, v13

    aget v7, v12, v13

    .line 299
    if-nez v7, :cond_9

    goto/16 :goto_1

    .line 303
    :cond_a
    move v3, v7

    .line 304
    goto/16 :goto_2

    .line 306
    .end local v2           #ae:I
    .end local v3           #as:I
    .end local v5           #be:I
    .end local v6           #bs:I
    .end local v7           #np:I
    .end local v9           #rc:I
    .end local v10           #rec:J
    :cond_b
    return v4
.end method


# virtual methods
.method findLongestCommonSequence()Lorg/eclipse/jgit/diff/Edit;
    .locals 4

    .prologue
    .local p0, this:Lorg/eclipse/jgit/diff/HistogramDiffIndex;,"Lorg/eclipse/jgit/diff/HistogramDiffIndex<TS;>;"
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 171
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->scanA()Z

    move-result v2

    if-nez v2, :cond_1

    .line 180
    :cond_0
    :goto_0
    return-object v1

    .line 174
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/diff/Edit;

    invoke-direct {v2, v3, v3}, Lorg/eclipse/jgit/diff/Edit;-><init>(II)V

    iput-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->lcs:Lorg/eclipse/jgit/diff/Edit;

    .line 175
    iget v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->maxChainLength:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cnt:I

    .line 177
    iget-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v0, v2, Lorg/eclipse/jgit/diff/Edit;->beginB:I

    .local v0, bPtr:I
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->region:Lorg/eclipse/jgit/diff/Edit;

    iget v2, v2, Lorg/eclipse/jgit/diff/Edit;->endB:I

    if-ge v0, v2, :cond_2

    .line 178
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->tryLongestCommonSequence(I)I

    move-result v0

    goto :goto_1

    .line 180
    :cond_2
    iget-boolean v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->hasCommon:Z

    if-eqz v2, :cond_3

    iget v2, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->maxChainLength:I

    iget v3, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->cnt:I

    if-lt v2, v3, :cond_0

    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/diff/HistogramDiffIndex;->lcs:Lorg/eclipse/jgit/diff/Edit;

    goto :goto_0
.end method
