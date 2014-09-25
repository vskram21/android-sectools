.class public Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
.super Ljava/lang/Object;
.source "PackReverseIndex.java"


# instance fields
.field private final bucketSize:J

.field private final index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

.field private final nth:[I

.field private final offsetIndex:[I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V
    .locals 31
    .parameter "packIndex"

    .prologue
    .line 91
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 92
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v8

    .line 95
    .local v8, cnt:J
    const-wide/16 v27, 0x1

    add-long v27, v27, v8

    const-wide/32 v29, 0x7fffffff

    cmp-long v27, v27, v29

    if-lez v27, :cond_0

    .line 96
    new-instance v27, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->hugeIndexesAreNotSupportedByJgitYet:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-direct/range {v27 .. v28}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 99
    :cond_0
    const-wide/16 v27, 0x0

    cmp-long v27, v8, v27

    if-nez v27, :cond_2

    .line 100
    const-wide v27, 0x7fffffffffffffffL

    move-wide/from16 v0, v27

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->bucketSize:J

    .line 101
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->offsetIndex:[I

    .line 102
    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    .line 148
    :cond_1
    return-void

    .line 106
    :cond_2
    long-to-int v0, v8

    move/from16 v27, v0

    move/from16 v0, v27

    new-array v0, v0, [J

    move-object/from16 v23, v0

    .line 108
    .local v23, offsetsBySha1:[J
    const-wide/16 v15, 0x0

    .line 109
    .local v15, maxOffset:J
    const/4 v13, 0x0

    .line 110
    .local v13, ith:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    .line 111
    .local v17, me:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->getOffset()J

    move-result-wide v21

    .line 112
    .local v21, o:J
    add-int/lit8 v14, v13, 0x1

    .end local v13           #ith:I
    .local v14, ith:I
    aput-wide v21, v23, v13

    .line 113
    cmp-long v27, v21, v15

    if-lez v27, :cond_3

    .line 114
    move-wide/from16 v15, v21

    :cond_3
    move v13, v14

    .line 115
    .end local v14           #ith:I
    .restart local v13       #ith:I
    goto :goto_0

    .line 117
    .end local v17           #me:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .end local v21           #o:J
    :cond_4
    div-long v27, v15, v8

    const-wide/16 v29, 0x1

    add-long v27, v27, v29

    move-wide/from16 v0, v27

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->bucketSize:J

    .line 118
    long-to-int v0, v8

    move/from16 v27, v0

    move/from16 v0, v27

    new-array v5, v0, [I

    .line 119
    .local v5, bucketIndex:[I
    long-to-int v0, v8

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    move/from16 v0, v27

    new-array v6, v0, [I

    .line 120
    .local v6, bucketValues:[I
    const/16 v24, 0x0

    .local v24, oi:I
    :goto_1
    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v24

    move/from16 v1, v27

    if-ge v0, v1, :cond_5

    .line 121
    aget-wide v21, v23, v24

    .line 122
    .restart local v21       #o:J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->bucketSize:J

    move-wide/from16 v27, v0

    div-long v27, v21, v27

    move-wide/from16 v0, v27

    long-to-int v4, v0

    .line 123
    .local v4, bucket:I
    add-int/lit8 v7, v24, 0x1

    .line 124
    .local v7, bucketValuesPos:I
    aget v10, v5, v4

    .line 125
    .local v10, current:I
    aput v7, v5, v4

    .line 126
    aput v10, v6, v7

    .line 120
    add-int/lit8 v24, v24, 0x1

    goto :goto_1

    .line 129
    .end local v4           #bucket:I
    .end local v7           #bucketValuesPos:I
    .end local v10           #current:I
    .end local v21           #o:J
    :cond_5
    const/16 v18, 0x0

    .line 130
    .local v18, nthByOffset:I
    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    .line 131
    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->offsetIndex:[I

    .line 132
    const/4 v3, 0x0

    .local v3, bi:I
    :goto_2
    array-length v0, v5

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v3, v0, :cond_1

    .line 133
    move/from16 v25, v18

    .line 135
    .local v25, start:I
    aget v26, v5, v3

    .local v26, vi:I
    move/from16 v19, v18

    .end local v18           #nthByOffset:I
    .local v19, nthByOffset:I
    :goto_3
    if-lez v26, :cond_8

    .line 136
    add-int/lit8 v20, v26, -0x1

    .line 137
    .local v20, nthBySha1:I
    aget-wide v21, v23, v20

    .line 138
    .restart local v21       #o:J
    add-int/lit8 v18, v19, 0x1

    .end local v19           #nthByOffset:I
    .restart local v18       #nthByOffset:I
    move/from16 v12, v19

    .line 139
    .local v12, insertion:I
    :goto_4
    move/from16 v0, v25

    if-ge v0, v12, :cond_6

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    move-object/from16 v27, v0

    add-int/lit8 v28, v12, -0x1

    aget v27, v27, v28

    aget-wide v27, v23, v27

    cmp-long v27, v21, v27

    if-lez v27, :cond_7

    .line 144
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    move-object/from16 v27, v0

    aput v20, v27, v12

    .line 135
    aget v26, v6, v26

    move/from16 v19, v18

    .end local v18           #nthByOffset:I
    .restart local v19       #nthByOffset:I
    goto :goto_3

    .line 142
    .end local v19           #nthByOffset:I
    .restart local v18       #nthByOffset:I
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    move-object/from16 v28, v0

    add-int/lit8 v29, v12, -0x1

    aget v28, v28, v29

    aput v28, v27, v12

    .line 139
    add-int/lit8 v12, v12, -0x1

    goto :goto_4

    .line 146
    .end local v12           #insertion:I
    .end local v18           #nthByOffset:I
    .end local v20           #nthBySha1:I
    .end local v21           #o:J
    .restart local v19       #nthByOffset:I
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->offsetIndex:[I

    move-object/from16 v27, v0

    aput v19, v27, v3

    .line 132
    add-int/lit8 v3, v3, 0x1

    move/from16 v18, v19

    .end local v19           #nthByOffset:I
    .restart local v18       #nthByOffset:I
    goto :goto_2
.end method

.method private binarySearch(J)I
    .locals 9
    .parameter "offset"

    .prologue
    .line 199
    iget-wide v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->bucketSize:J

    div-long v6, p1, v6

    long-to-int v0, v6

    .line 200
    .local v0, bucket:I
    if-nez v0, :cond_0

    const/4 v2, 0x0

    .line 201
    .local v2, low:I
    :goto_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->offsetIndex:[I

    aget v1, v6, v0

    .line 202
    .local v1, high:I
    :goto_1
    if-ge v2, v1, :cond_3

    .line 203
    add-int v6, v2, v1

    ushr-int/lit8 v3, v6, 0x1

    .line 204
    .local v3, mid:I
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    aget v7, v7, v3

    int-to-long v7, v7

    invoke-virtual {v6, v7, v8}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getOffset(J)J

    move-result-wide v4

    .line 205
    .local v4, o:J
    cmp-long v6, p1, v4

    if-gez v6, :cond_1

    .line 206
    move v1, v3

    goto :goto_1

    .line 200
    .end local v1           #high:I
    .end local v2           #low:I
    .end local v3           #mid:I
    .end local v4           #o:J
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->offsetIndex:[I

    add-int/lit8 v7, v0, -0x1

    aget v2, v6, v7

    goto :goto_0

    .line 207
    .restart local v1       #high:I
    .restart local v2       #low:I
    .restart local v3       #mid:I
    .restart local v4       #o:J
    :cond_1
    cmp-long v6, p1, v4

    if-nez v6, :cond_2

    .line 212
    .end local v3           #mid:I
    .end local v4           #o:J
    :goto_2
    return v3

    .line 210
    .restart local v3       #mid:I
    .restart local v4       #o:J
    :cond_2
    add-int/lit8 v2, v3, 0x1

    goto :goto_1

    .line 212
    .end local v3           #mid:I
    .end local v4           #o:J
    :cond_3
    const/4 v3, -0x1

    goto :goto_2
.end method


# virtual methods
.method public findNextOffset(JJ)J
    .locals 6
    .parameter "offset"
    .parameter "maxOffset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 182
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->binarySearch(J)I

    move-result v0

    .line 183
    .local v0, ith:I
    if-gez v0, :cond_0

    .line 184
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cantFindObjectInReversePackIndexForTheSpecifiedOffset:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 189
    :cond_0
    add-int/lit8 v1, v0, 0x1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    array-length v2, v2

    if-ne v1, v2, :cond_1

    .line 191
    .end local p3
    :goto_0
    return-wide p3

    .restart local p3
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getOffset(J)J

    move-result-wide p3

    goto :goto_0
.end method

.method public findObject(J)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "offset"

    .prologue
    .line 159
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->binarySearch(J)I

    move-result v0

    .line 160
    .local v0, ith:I
    if-gez v0, :cond_0

    .line 161
    const/4 v1, 0x0

    .line 162
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    goto :goto_0
.end method

.method findObjectByPosition(I)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "nthPosition"

    .prologue
    .line 216
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->nth:[I

    aget v1, v1, p1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method findPostion(J)I
    .locals 1
    .parameter "offset"

    .prologue
    .line 195
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->binarySearch(J)I

    move-result v0

    return v0
.end method
