.class Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;
.super Lorg/eclipse/jgit/internal/storage/file/PackIndex;
.source "PackIndexV2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$1;,
        Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;
    }
.end annotation


# static fields
.field private static final FANOUT:I = 0x100

.field private static final IS_O64:J = 0x80000000L

.field private static final NO_BYTES:[B

.field private static final NO_INTS:[I


# instance fields
.field private crc32:[[B

.field private final fanoutTable:[J

.field private names:[[I

.field private objectCnt:J

.field private offset32:[[B

.field private offset64:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 68
    new-array v0, v1, [I

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->NO_INTS:[I

    .line 70
    new-array v0, v1, [B

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->NO_BYTES:[B

    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;)V
    .locals 21
    .parameter "fd"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;-><init>()V

    .line 89
    const/16 v17, 0x400

    move/from16 v0, v17

    new-array v7, v0, [B

    .line 90
    .local v7, fanoutRaw:[B
    const/16 v17, 0x0

    array-length v0, v7

    move/from16 v18, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v7, v1, v2}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 91
    const/16 v17, 0x100

    move/from16 v0, v17

    new-array v0, v0, [J

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    .line 92
    const/4 v10, 0x0

    .local v10, k:I
    :goto_0
    const/16 v17, 0x100

    move/from16 v0, v17

    if-ge v10, v0, :cond_0

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    move-object/from16 v17, v0

    mul-int/lit8 v18, v10, 0x4

    move/from16 v0, v18

    invoke-static {v7, v0}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v18

    aput-wide v18, v17, v10

    .line 92
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 94
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    move-object/from16 v17, v0

    const/16 v18, 0xff

    aget-wide v17, v17, v18

    move-wide/from16 v0, v17

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->objectCnt:J

    .line 96
    const/16 v17, 0x100

    move/from16 v0, v17

    new-array v0, v0, [[I

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I

    .line 97
    const/16 v17, 0x100

    move/from16 v0, v17

    new-array v0, v0, [[B

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    .line 98
    const/16 v17, 0x100

    move/from16 v0, v17

    new-array v0, v0, [[B

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->crc32:[[B

    .line 104
    const/4 v10, 0x0

    :goto_1
    const/16 v17, 0x100

    move/from16 v0, v17

    if-ge v10, v0, :cond_5

    .line 106
    if-nez v10, :cond_1

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    move-object/from16 v17, v0

    aget-wide v5, v17, v10

    .line 111
    .local v5, bucketCnt:J
    :goto_2
    const-wide/16 v17, 0x0

    cmp-long v17, v5, v17

    if-nez v17, :cond_2

    .line 112
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I

    move-object/from16 v17, v0

    sget-object v18, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->NO_INTS:[I

    aput-object v18, v17, v10

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    move-object/from16 v17, v0

    sget-object v18, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->NO_BYTES:[B

    aput-object v18, v17, v10

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->crc32:[[B

    move-object/from16 v17, v0

    sget-object v18, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->NO_BYTES:[B

    aput-object v18, v17, v10

    .line 104
    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 109
    .end local v5           #bucketCnt:J
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    move-object/from16 v17, v0

    aget-wide v17, v17, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    move-object/from16 v19, v0

    add-int/lit8 v20, v10, -0x1

    aget-wide v19, v19, v20

    sub-long v5, v17, v19

    .restart local v5       #bucketCnt:J
    goto :goto_2

    .line 118
    :cond_2
    const-wide/16 v17, 0x14

    mul-long v11, v5, v17

    .line 119
    .local v11, nameLen:J
    const-wide/32 v17, 0x7fffffff

    cmp-long v17, v11, v17

    if-lez v17, :cond_3

    .line 120
    new-instance v17, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->indexFileIsTooLargeForJgit:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 122
    :cond_3
    long-to-int v9, v11

    .line 123
    .local v9, intNameLen:I
    new-array v0, v9, [B

    move-object/from16 v16, v0

    .line 124
    .local v16, raw:[B
    ushr-int/lit8 v17, v9, 0x2

    move/from16 v0, v17

    new-array v4, v0, [I

    .line 125
    .local v4, bin:[I
    const/16 v17, 0x0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move/from16 v2, v17

    move/from16 v3, v18

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 126
    const/4 v8, 0x0

    .local v8, i:I
    :goto_4
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v8, v0, :cond_4

    .line 127
    shl-int/lit8 v17, v8, 0x2

    invoke-static/range {v16 .. v17}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v17

    aput v17, v4, v8

    .line 126
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 129
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I

    move-object/from16 v17, v0

    aput-object v4, v17, v10

    .line 130
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    move-object/from16 v17, v0

    const-wide/16 v18, 0x4

    mul-long v18, v18, v5

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [B

    move-object/from16 v18, v0

    aput-object v18, v17, v10

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->crc32:[[B

    move-object/from16 v17, v0

    const-wide/16 v18, 0x4

    mul-long v18, v18, v5

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [B

    move-object/from16 v18, v0

    aput-object v18, v17, v10

    goto/16 :goto_3

    .line 135
    .end local v4           #bin:[I
    .end local v5           #bucketCnt:J
    .end local v8           #i:I
    .end local v9           #intNameLen:I
    .end local v11           #nameLen:J
    .end local v16           #raw:[B
    :cond_5
    const/4 v10, 0x0

    :goto_5
    const/16 v17, 0x100

    move/from16 v0, v17

    if-ge v10, v0, :cond_6

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->crc32:[[B

    move-object/from16 v17, v0

    aget-object v17, v17, v10

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->crc32:[[B

    move-object/from16 v19, v0

    aget-object v19, v19, v10

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 135
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 141
    :cond_6
    const/4 v13, 0x0

    .line 142
    .local v13, o64cnt:I
    const/4 v10, 0x0

    :goto_6
    const/16 v17, 0x100

    move/from16 v0, v17

    if-ge v10, v0, :cond_9

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    move-object/from16 v17, v0

    aget-object v14, v17, v10

    .line 144
    .local v14, ofs:[B
    const/16 v17, 0x0

    array-length v0, v14

    move/from16 v18, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v14, v1, v2}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 145
    const/4 v15, 0x0

    .local v15, p:I
    :goto_7
    array-length v0, v14

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v15, v0, :cond_8

    .line 146
    aget-byte v17, v14, v15

    if-gez v17, :cond_7

    .line 147
    add-int/lit8 v13, v13, 0x1

    .line 145
    :cond_7
    add-int/lit8 v15, v15, 0x4

    goto :goto_7

    .line 142
    :cond_8
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 152
    .end local v14           #ofs:[B
    .end local v15           #p:I
    :cond_9
    if-lez v13, :cond_a

    .line 153
    mul-int/lit8 v17, v13, 0x8

    move/from16 v0, v17

    new-array v0, v0, [B

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B

    .line 154
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 159
    :goto_8
    const/16 v17, 0x14

    move/from16 v0, v17

    new-array v0, v0, [B

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->packChecksum:[B

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->packChecksum:[B

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->packChecksum:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 161
    return-void

    .line 156
    :cond_a
    sget-object v17, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->NO_BYTES:[B

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B

    goto :goto_8
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I

    return-object v0
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[[B
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    return-object v0
.end method

.method static synthetic access$500(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;)[B
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B

    return-object v0
.end method

.method private binarySearchLevelTwo(Lorg/eclipse/jgit/lib/AnyObjectId;I)I
    .locals 8
    .parameter "objId"
    .parameter "levelOne"

    .prologue
    const/4 v6, -0x1

    .line 281
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I

    aget-object v1, v7, p2

    .line 282
    .local v1, data:[I
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    aget-object v7, v7, p2

    array-length v7, v7

    ushr-int/lit8 v2, v7, 0x2

    .line 283
    .local v2, high:I
    if-nez v2, :cond_1

    move v4, v6

    .line 299
    :cond_0
    :goto_0
    return v4

    .line 285
    :cond_1
    const/4 v3, 0x0

    .line 287
    .local v3, low:I
    :cond_2
    add-int v7, v3, v2

    ushr-int/lit8 v4, v7, 0x1

    .line 288
    .local v4, mid:I
    shl-int/lit8 v5, v4, 0x2

    .line 291
    .local v5, mid4:I
    add-int v7, v5, v4

    invoke-virtual {p1, v1, v7}, Lorg/eclipse/jgit/lib/AnyObjectId;->compareTo([II)I

    move-result v0

    .line 292
    .local v0, cmp:I
    if-gez v0, :cond_3

    .line 293
    move v2, v4

    .line 298
    :goto_1
    if-lt v3, v2, :cond_2

    move v4, v6

    .line 299
    goto :goto_0

    .line 294
    :cond_3
    if-eqz v0, :cond_0

    .line 297
    add-int/lit8 v3, v4, 0x1

    goto :goto_1
.end method

.method private findLevelOne(J)I
    .locals 6
    .parameter "nthPosition"

    .prologue
    .line 174
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    const-wide/16 v4, 0x1

    add-long/2addr v4, p1

    invoke-static {v3, v4, v5}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v2

    .line 175
    .local v2, levelOne:I
    if-ltz v2, :cond_0

    .line 179
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    aget-wide v0, v3, v2

    .line 180
    .local v0, base:J
    :goto_0
    if-lez v2, :cond_1

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    add-int/lit8 v4, v2, -0x1

    aget-wide v3, v3, v4

    cmp-long v3, v0, v3

    if-nez v3, :cond_1

    .line 181
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 185
    .end local v0           #base:J
    :cond_0
    add-int/lit8 v3, v2, 0x1

    neg-int v2, v3

    .line 187
    :cond_1
    return v2
.end method

.method private getLevelTwo(JI)I
    .locals 4
    .parameter "nthPosition"
    .parameter "levelOne"

    .prologue
    .line 191
    if-lez p3, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->fanoutTable:[J

    add-int/lit8 v3, p3, -0x1

    aget-wide v0, v2, v3

    .line 192
    .local v0, base:J
    :goto_0
    sub-long v2, p1, v0

    long-to-int v2, v2

    return v2

    .line 191
    .end local v0           #base:J
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private getOffset(II)J
    .locals 6
    .parameter "levelOne"
    .parameter "levelTwo"

    .prologue
    .line 220
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    aget-object v2, v2, p1

    shl-int/lit8 v3, p2, 0x2

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v0

    .line 221
    .local v0, p:J
    const-wide v2, 0x80000000L

    and-long/2addr v2, v0

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 222
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B

    const-wide v3, -0x80000001L

    and-long/2addr v3, v0

    long-to-int v3, v3

    mul-int/lit8 v3, v3, 0x8

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/NB;->decodeUInt64([BI)J

    move-result-wide v0

    .line 223
    .end local v0           #p:J
    :cond_0
    return-wide v0
.end method

.method private static idOffset(I)I
    .locals 1
    .parameter "p"

    .prologue
    .line 277
    shl-int/lit8 v0, p0, 0x2

    add-int/2addr v0, p0

    return v0
.end method


# virtual methods
.method public findCRC32(Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 5
    .parameter "objId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 228
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->getFirstByte()I

    move-result v0

    .line 229
    .local v0, levelOne:I
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->binarySearchLevelTwo(Lorg/eclipse/jgit/lib/AnyObjectId;I)I

    move-result v1

    .line 230
    .local v1, levelTwo:I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 231
    new-instance v2, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    const-string v4, "unknown"

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v2

    .line 232
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->crc32:[[B

    aget-object v2, v2, v0

    shl-int/lit8 v3, v1, 0x2

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v2

    return-wide v2
.end method

.method public findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 4
    .parameter "objId"

    .prologue
    .line 212
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->getFirstByte()I

    move-result v0

    .line 213
    .local v0, levelOne:I
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->binarySearchLevelTwo(Lorg/eclipse/jgit/lib/AnyObjectId;I)I

    move-result v1

    .line 214
    .local v1, levelTwo:I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 215
    const-wide/16 v2, -0x1

    .line 216
    :goto_0
    return-wide v2

    :cond_0
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->getOffset(II)J

    move-result-wide v2

    goto :goto_0
.end method

.method public getObjectCount()J
    .locals 2

    .prologue
    .line 165
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->objectCnt:J

    return-wide v0
.end method

.method public getObjectId(J)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 5
    .parameter "nthPosition"

    .prologue
    .line 197
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->findLevelOne(J)I

    move-result v0

    .line 198
    .local v0, levelOne:I
    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->getLevelTwo(JI)I

    move-result v1

    .line 199
    .local v1, p:I
    shl-int/lit8 v2, v1, 0x2

    .line 200
    .local v2, p4:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I

    aget-object v3, v3, v0

    add-int v4, v2, v1

    invoke-static {v3, v4}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([II)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    return-object v3
.end method

.method public getOffset(J)J
    .locals 4
    .parameter "nthPosition"

    .prologue
    .line 205
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->findLevelOne(J)I

    move-result v0

    .line 206
    .local v0, levelOne:I
    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->getLevelTwo(JI)I

    move-result v1

    .line 207
    .local v1, levelTwo:I
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->getOffset(II)J

    move-result-wide v2

    return-wide v2
.end method

.method public getOffset64Count()J
    .locals 2

    .prologue
    .line 170
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset64:[B

    array-length v0, v0

    div-int/lit8 v0, v0, 0x8

    int-to-long v0, v0

    return-wide v0
.end method

.method public hasCRC32Support()Z
    .locals 1

    .prologue
    .line 237
    const/4 v0, 0x1

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
    .line 242
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$EntriesIteratorV2;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;Lorg/eclipse/jgit/internal/storage/file/PackIndexV2$1;)V

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
    .line 248
    .local p1, matches:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->names:[[I

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->getFirstByte()I

    move-result v7

    aget-object v1, v6, v7

    .line 249
    .local v1, data:[I
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->offset32:[[B

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->getFirstByte()I

    move-result v7

    aget-object v6, v6, v7

    array-length v6, v6

    ushr-int/lit8 v4, v6, 0x2

    .line 250
    .local v4, max:I
    move v2, v4

    .line 251
    .local v2, high:I
    if-nez v2, :cond_1

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 253
    :cond_1
    const/4 v3, 0x0

    .line 255
    .local v3, low:I
    :cond_2
    add-int v6, v3, v2

    ushr-int/lit8 v5, v6, 0x1

    .line 256
    .local v5, p:I
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->idOffset(I)I

    move-result v6

    invoke-virtual {p2, v1, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare([II)I

    move-result v0

    .line 257
    .local v0, cmp:I
    if-gez v0, :cond_3

    .line 258
    move v2, v5

    .line 273
    :goto_1
    if-lt v3, v2, :cond_2

    goto :goto_0

    .line 259
    :cond_3
    if-nez v0, :cond_6

    .line 263
    :goto_2
    if-lez v5, :cond_5

    add-int/lit8 v6, v5, -0x1

    invoke-static {v6}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->idOffset(I)I

    move-result v6

    invoke-virtual {p2, v1, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare([II)I

    move-result v6

    if-nez v6, :cond_5

    .line 264
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 265
    :cond_4
    add-int/lit8 v5, v5, 0x1

    :cond_5
    if-ge v5, v4, :cond_0

    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->idOffset(I)I

    move-result v6

    invoke-virtual {p2, v1, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare([II)I

    move-result v6

    if-nez v6, :cond_0

    .line 266
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;->idOffset(I)I

    move-result v6

    invoke-static {v1, v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([II)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 267
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v6

    if-le v6, p3, :cond_4

    goto :goto_0

    .line 272
    :cond_6
    add-int/lit8 v3, v5, 0x1

    goto :goto_1
.end method
