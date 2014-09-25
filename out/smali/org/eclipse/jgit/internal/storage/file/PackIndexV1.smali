.class Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndex;
.source "PackIndexV1.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$1;,
        Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;
    }
.end annotation


# static fields
.field private static final IDX_HDR_LEN:I = 0x400


# instance fields
.field private final idxHeader:[J

.field private idxdata:[[B

.field private objectCnt:J


# direct methods
.method constructor <init>(Ljava/io/InputStream;[B)V
    .locals 8
    .parameter "fd"
    .parameter "hdr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 74
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;-><init>()V

    .line 75
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 76
    .local v0, fanoutTable:[B
    array-length v3, p2

    invoke-static {p2, v7, v0, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 77
    array-length v3, p2

    array-length v4, p2

    rsub-int v4, v4, 0x400

    invoke-static {p1, v0, v3, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 79
    const/16 v3, 0x100

    new-array v3, v3, [J

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    .line 80
    const/4 v1, 0x0

    .local v1, k:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 81
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    mul-int/lit8 v4, v1, 0x4

    invoke-static {v0, v4}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v4

    aput-wide v4, v3, v1

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 82
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    array-length v3, v3

    new-array v3, v3, [[B

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    .line 83
    const/4 v1, 0x0

    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    array-length v3, v3

    if-ge v1, v3, :cond_3

    .line 85
    if-nez v1, :cond_2

    .line 86
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    aget-wide v3, v3, v1

    long-to-int v2, v3

    .line 90
    .local v2, n:I
    :goto_2
    if-lez v2, :cond_1

    .line 91
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    mul-int/lit8 v4, v2, 0x18

    new-array v4, v4, [B

    aput-object v4, v3, v1

    .line 92
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    aget-object v3, v3, v1

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    aget-object v4, v4, v1

    array-length v4, v4

    invoke-static {p1, v3, v7, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 83
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 88
    .end local v2           #n:I
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    aget-wide v3, v3, v1

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    add-int/lit8 v6, v1, -0x1

    aget-wide v5, v5, v6

    sub-long/2addr v3, v5

    long-to-int v2, v3

    .restart local v2       #n:I
    goto :goto_2

    .line 95
    .end local v2           #n:I
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    const/16 v4, 0xff

    aget-wide v3, v3, v4

    iput-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->objectCnt:J

    .line 97
    const/16 v3, 0x14

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->packChecksum:[B

    .line 98
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->packChecksum:[B

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->packChecksum:[B

    array-length v4, v4

    invoke-static {p1, v3, v7, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 99
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;)[[B
    .locals 1
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    return-object v0
.end method

.method private findLevelOne(J)I
    .locals 6
    .parameter "nthPosition"

    .prologue
    .line 117
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    const-wide/16 v4, 0x1

    add-long/2addr v4, p1

    invoke-static {v3, v4, v5}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v2

    .line 118
    .local v2, levelOne:I
    if-ltz v2, :cond_0

    .line 122
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    aget-wide v0, v3, v2

    .line 123
    .local v0, base:J
    :goto_0
    if-lez v2, :cond_1

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    add-int/lit8 v4, v2, -0x1

    aget-wide v3, v3, v4

    cmp-long v3, v0, v3

    if-nez v3, :cond_1

    .line 124
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 128
    .end local v0           #base:J
    :cond_0
    add-int/lit8 v3, v2, 0x1

    neg-int v2, v3

    .line 130
    :cond_1
    return v2
.end method

.method private getLevelTwo(JI)I
    .locals 4
    .parameter "nthPosition"
    .parameter "levelOne"

    .prologue
    .line 134
    if-lez p3, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxHeader:[J

    add-int/lit8 v3, p3, -0x1

    aget-wide v0, v2, v3

    .line 135
    .local v0, base:J
    :goto_0
    sub-long v2, p1, v0

    long-to-int v2, v2

    return v2

    .line 134
    .end local v0           #base:J
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private static idOffset(I)I
    .locals 1
    .parameter "mid"

    .prologue
    .line 227
    mul-int/lit8 v0, p0, 0x18

    add-int/lit8 v0, v0, 0x4

    return v0
.end method


# virtual methods
.method public findCRC32(Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 1
    .parameter "objId"

    .prologue
    .line 182
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 16
    .parameter "objId"

    .prologue
    .line 156
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->getFirstByte()I

    move-result v8

    .line 157
    .local v8, levelOne:I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    aget-object v6, v12, v8

    .line 158
    .local v6, data:[B
    if-nez v6, :cond_0

    .line 159
    const-wide/16 v12, -0x1

    .line 177
    :goto_0
    return-wide v12

    .line 160
    :cond_0
    array-length v12, v6

    div-int/lit8 v7, v12, 0x18

    .line 161
    .local v7, high:I
    const/4 v9, 0x0

    .line 163
    .local v9, low:I
    :cond_1
    add-int v12, v9, v7

    ushr-int/lit8 v10, v12, 0x1

    .line 164
    .local v10, mid:I
    invoke-static {v10}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idOffset(I)I

    move-result v11

    .line 165
    .local v11, pos:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v11}, Lorg/eclipse/jgit/lib/AnyObjectId;->compareTo([BI)I

    move-result v5

    .line 166
    .local v5, cmp:I
    if-gez v5, :cond_2

    .line 167
    move v7, v10

    .line 176
    :goto_1
    if-lt v9, v7, :cond_1

    .line 177
    const-wide/16 v12, -0x1

    goto :goto_0

    .line 168
    :cond_2
    if-nez v5, :cond_3

    .line 169
    add-int/lit8 v12, v11, -0x4

    aget-byte v12, v6, v12

    and-int/lit16 v1, v12, 0xff

    .line 170
    .local v1, b0:I
    add-int/lit8 v12, v11, -0x3

    aget-byte v12, v6, v12

    and-int/lit16 v2, v12, 0xff

    .line 171
    .local v2, b1:I
    add-int/lit8 v12, v11, -0x2

    aget-byte v12, v6, v12

    and-int/lit16 v3, v12, 0xff

    .line 172
    .local v3, b2:I
    add-int/lit8 v12, v11, -0x1

    aget-byte v12, v6, v12

    and-int/lit16 v4, v12, 0xff

    .line 173
    .local v4, b3:I
    int-to-long v12, v1

    const/16 v14, 0x18

    shl-long/2addr v12, v14

    shl-int/lit8 v14, v2, 0x10

    int-to-long v14, v14

    or-long/2addr v12, v14

    shl-int/lit8 v14, v3, 0x8

    int-to-long v14, v14

    or-long/2addr v12, v14

    int-to-long v14, v4

    or-long/2addr v12, v14

    goto :goto_0

    .line 175
    .end local v1           #b0:I
    .end local v2           #b1:I
    .end local v3           #b2:I
    .end local v4           #b3:I
    :cond_3
    add-int/lit8 v9, v10, 0x1

    goto :goto_1
.end method

.method public getObjectCount()J
    .locals 2

    .prologue
    .line 103
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->objectCnt:J

    return-wide v0
.end method

.method public getObjectId(J)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 4
    .parameter "nthPosition"

    .prologue
    .line 140
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->findLevelOne(J)I

    move-result v1

    .line 141
    .local v1, levelOne:I
    invoke-direct {p0, p1, p2, v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->getLevelTwo(JI)I

    move-result v2

    .line 142
    .local v2, p:I
    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idOffset(I)I

    move-result v0

    .line 143
    .local v0, dataIdx:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    aget-object v3, v3, v1

    invoke-static {v3, v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    return-object v3
.end method

.method getOffset(J)J
    .locals 5
    .parameter "nthPosition"

    .prologue
    .line 148
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->findLevelOne(J)I

    move-result v0

    .line 149
    .local v0, levelOne:I
    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->getLevelTwo(JI)I

    move-result v1

    .line 150
    .local v1, levelTwo:I
    mul-int/lit8 v2, v1, 0x18

    .line 151
    .local v2, p:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    aget-object v3, v3, v0

    invoke-static {v3, v2}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v3

    return-wide v3
.end method

.method public getOffset64Count()J
    .locals 8

    .prologue
    .line 108
    const-wide/16 v2, 0x0

    .line 109
    .local v2, n64:J
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    .line 110
    .local v0, e:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->getOffset()J

    move-result-wide v4

    const-wide/32 v6, 0x7fffffff

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    .line 111
    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    goto :goto_0

    .line 113
    .end local v0           #e:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    :cond_1
    return-wide v2
.end method

.method public hasCRC32Support()Z
    .locals 1

    .prologue
    .line 187
    const/4 v0, 0x0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 192
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$IndexV1Iterator;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;Lorg/eclipse/jgit/internal/storage/file/PackIndexV1$1;)V

    return-object v0
.end method

.method public resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V
    .locals 8
    .parameter
    .parameter "id"
    .parameter "matchLimit"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            "I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    .local p1, matches:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idxdata:[[B

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->getFirstByte()I

    move-result v7

    aget-object v1, v6, v7

    .line 199
    .local v1, data:[B
    if-nez v1, :cond_1

    .line 224
    :cond_0
    :goto_0
    return-void

    .line 201
    :cond_1
    array-length v6, v1

    div-int/lit8 v4, v6, 0x18

    .line 202
    .local v4, max:I
    move v2, v4

    .line 203
    .local v2, high:I
    const/4 v3, 0x0

    .line 205
    .local v3, low:I
    :cond_2
    add-int v6, v3, v2

    ushr-int/lit8 v5, v6, 0x1

    .line 206
    .local v5, p:I
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idOffset(I)I

    move-result v6

    invoke-virtual {p2, v1, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare([BI)I

    move-result v0

    .line 207
    .local v0, cmp:I
    if-gez v0, :cond_3

    .line 208
    move v2, v5

    .line 223
    :goto_1
    if-lt v3, v2, :cond_2

    goto :goto_0

    .line 209
    :cond_3
    if-nez v0, :cond_6

    .line 213
    :goto_2
    if-lez v5, :cond_5

    add-int/lit8 v6, v5, -0x1

    invoke-static {v6}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idOffset(I)I

    move-result v6

    invoke-virtual {p2, v1, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare([BI)I

    move-result v6

    if-nez v6, :cond_5

    .line 214
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 215
    :cond_4
    add-int/lit8 v5, v5, 0x1

    :cond_5
    if-ge v5, v4, :cond_0

    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idOffset(I)I

    move-result v6

    invoke-virtual {p2, v1, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare([BI)I

    move-result v6

    if-nez v6, :cond_0

    .line 216
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;->idOffset(I)I

    move-result v6

    invoke-static {v1, v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 217
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v6

    if-le v6, p3, :cond_4

    goto :goto_0

    .line 222
    :cond_6
    add-int/lit8 v3, v5, 0x1

    goto :goto_1
.end method
