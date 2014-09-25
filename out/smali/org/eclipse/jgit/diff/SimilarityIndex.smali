.class Lorg/eclipse/jgit/diff/SimilarityIndex;
.super Ljava/lang/Object;
.source "SimilarityIndex.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
    }
.end annotation


# static fields
.field private static final KEY_SHIFT:I = 0x20

.field private static final MAX_COUNT:J = 0xffffffffL

.field private static final TABLE_FULL_OUT_OF_MEMORY:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;


# instance fields
.field private fileSize:J

.field private idGrowAt:I

.field private idHash:[J

.field private idHashBits:I

.field private idSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    new-instance v0, Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/SimilarityIndex;->TABLE_FULL_OUT_OF_MEMORY:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const/16 v0, 0x8

    iput v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    .line 107
    const/4 v0, 0x1

    iget v1, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    shl-int/2addr v0, v1

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    .line 108
    iget v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    invoke-static {v0}, Lorg/eclipse/jgit/diff/SimilarityIndex;->growAt(I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idGrowAt:I

    .line 109
    return-void
.end method

.method private static common(Lorg/eclipse/jgit/diff/SimilarityIndex;Lorg/eclipse/jgit/diff/SimilarityIndex;)J
    .locals 6
    .parameter "src"
    .parameter "dst"

    .prologue
    const/4 v4, 0x0

    .line 207
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/diff/SimilarityIndex;->packedIndex(I)I

    move-result v3

    .line 208
    .local v3, srcIdx:I
    invoke-direct {p1, v4}, Lorg/eclipse/jgit/diff/SimilarityIndex;->packedIndex(I)I

    move-result v1

    .line 209
    .local v1, dstIdx:I
    iget-object v2, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    .line 210
    .local v2, srcHash:[J
    iget-object v0, p1, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    .line 211
    .local v0, dstHash:[J
    invoke-static {v2, v3, v0, v1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->common([JI[JI)J

    move-result-wide v4

    return-wide v4
.end method

.method private static common([JI[JI)J
    .locals 8
    .parameter "srcHash"
    .parameter "srcIdx"
    .parameter "dstHash"
    .parameter "dstIdx"

    .prologue
    .line 216
    array-length v4, p0

    if-eq p1, v4, :cond_0

    array-length v4, p2

    if-ne p3, v4, :cond_2

    .line 217
    :cond_0
    const-wide/16 v0, 0x0

    .line 250
    :cond_1
    return-wide v0

    .line 219
    :cond_2
    const-wide/16 v0, 0x0

    .line 220
    .local v0, common:J
    aget-wide v4, p0, p1

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v3

    .line 221
    .local v3, srcKey:I
    aget-wide v4, p2, p3

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v2

    .line 224
    .local v2, dstKey:I
    :goto_0
    if-ne v3, v2, :cond_3

    .line 225
    aget-wide v4, p0, p1

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->countOf(J)J

    move-result-wide v4

    aget-wide v6, p2, p3

    invoke-static {v6, v7}, Lorg/eclipse/jgit/diff/SimilarityIndex;->countOf(J)J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    add-long/2addr v0, v4

    .line 228
    add-int/lit8 p1, p1, 0x1

    array-length v4, p0

    if-eq p1, v4, :cond_1

    .line 230
    aget-wide v4, p0, p1

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v3

    .line 232
    add-int/lit8 p3, p3, 0x1

    array-length v4, p2

    if-eq p3, v4, :cond_1

    .line 234
    aget-wide v4, p2, p3

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v2

    goto :goto_0

    .line 236
    :cond_3
    if-ge v3, v2, :cond_4

    .line 238
    add-int/lit8 p1, p1, 0x1

    array-length v4, p0

    if-eq p1, v4, :cond_1

    .line 240
    aget-wide v4, p0, p1

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v3

    goto :goto_0

    .line 244
    :cond_4
    add-int/lit8 p3, p3, 0x1

    array-length v4, p2

    if-eq p3, v4, :cond_1

    .line 246
    aget-wide v4, p2, p3

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v2

    goto :goto_0
.end method

.method private static countOf(J)J
    .locals 2
    .parameter "v"

    .prologue
    .line 361
    const-wide v0, 0xffffffffL

    and-long/2addr v0, p0

    return-wide v0
.end method

.method private grow()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x0

    .line 329
    iget v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    const/16 v8, 0x1e

    if-ne v7, v8, :cond_0

    .line 330
    new-instance v7, Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;

    invoke-direct {v7}, Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;-><init>()V

    throw v7

    .line 332
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    .line 333
    .local v3, oldHash:[J
    iget-object v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    array-length v4, v7

    .line 335
    .local v4, oldSize:I
    iget v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    .line 336
    iget v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    invoke-static {v7}, Lorg/eclipse/jgit/diff/SimilarityIndex;->growAt(I)I

    move-result v7

    iput v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idGrowAt:I

    .line 339
    const/4 v7, 0x1

    :try_start_0
    iget v8, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    shl-int/2addr v7, v8

    new-array v7, v7, [J

    iput-object v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v4, :cond_4

    .line 345
    aget-wide v5, v3, v0

    .line 346
    .local v5, v:J
    cmp-long v7, v5, v9

    if-eqz v7, :cond_3

    .line 347
    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v7

    invoke-direct {p0, v7}, Lorg/eclipse/jgit/diff/SimilarityIndex;->slot(I)I

    move-result v1

    .line 348
    .local v1, j:I
    :cond_1
    :goto_1
    iget-object v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    aget-wide v7, v7, v1

    cmp-long v7, v7, v9

    if-eqz v7, :cond_2

    .line 349
    add-int/lit8 v1, v1, 0x1

    iget-object v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    array-length v7, v7

    if-lt v1, v7, :cond_1

    .line 350
    const/4 v1, 0x0

    goto :goto_1

    .line 340
    .end local v0           #i:I
    .end local v1           #j:I
    .end local v5           #v:J
    :catch_0
    move-exception v2

    .line 341
    .local v2, noMemory:Ljava/lang/OutOfMemoryError;
    sget-object v7, Lorg/eclipse/jgit/diff/SimilarityIndex;->TABLE_FULL_OUT_OF_MEMORY:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;

    throw v7

    .line 351
    .end local v2           #noMemory:Ljava/lang/OutOfMemoryError;
    .restart local v0       #i:I
    .restart local v1       #j:I
    .restart local v5       #v:J
    :cond_2
    iget-object v7, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    aput-wide v5, v7, v1

    .line 344
    .end local v1           #j:I
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 354
    .end local v5           #v:J
    :cond_4
    return-void
.end method

.method private static growAt(I)I
    .locals 2
    .parameter "idHashBits"

    .prologue
    .line 325
    const/4 v0, 0x1

    shl-int/2addr v0, p0

    add-int/lit8 v1, p0, -0x3

    mul-int/2addr v0, v1

    div-int/2addr v0, p0

    return v0
.end method

.method private static keyOf(J)I
    .locals 2
    .parameter "v"

    .prologue
    .line 357
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v0, v0

    return v0
.end method

.method private packedIndex(I)I
    .locals 2
    .parameter "idx"

    .prologue
    .line 277
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    array-length v0, v0

    iget v1, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idSize:I

    sub-int/2addr v0, v1

    add-int/2addr v0, p1

    return v0
.end method

.method private static pair(IJ)J
    .locals 3
    .parameter "key"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
        }
    .end annotation

    .prologue
    .line 311
    const-wide v0, 0xffffffffL

    cmp-long v0, v0, p1

    if-gez v0, :cond_0

    .line 312
    new-instance v0, Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;-><init>()V

    throw v0

    .line 313
    :cond_0
    int-to-long v0, p0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    or-long/2addr v0, p1

    return-wide v0
.end method

.method private slot(I)I
    .locals 1
    .parameter "key"

    .prologue
    .line 321
    iget v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHashBits:I

    rsub-int/lit8 v0, v0, 0x1f

    ushr-int v0, p1, v0

    return v0
.end method


# virtual methods
.method add(II)V
    .locals 8
    .parameter "key"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
        }
    .end annotation

    .prologue
    .line 281
    const v3, -0x61c8ffff

    mul-int/2addr v3, p1

    ushr-int/lit8 p1, v3, 0x1

    .line 283
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->slot(I)I

    move-result v0

    .line 285
    .local v0, j:I
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    aget-wide v1, v3, v0

    .line 286
    .local v1, v:J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-nez v3, :cond_2

    .line 288
    iget v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idGrowAt:I

    iget v4, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idSize:I

    if-gt v3, v4, :cond_1

    .line 289
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/SimilarityIndex;->grow()V

    .line 290
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->slot(I)I

    move-result v0

    .line 291
    goto :goto_0

    .line 293
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    int-to-long v4, p2

    invoke-static {p1, v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->pair(IJ)J

    move-result-wide v4

    aput-wide v4, v3, v0

    .line 294
    iget v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idSize:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idSize:I

    .line 302
    :goto_1
    return-void

    .line 297
    :cond_2
    invoke-static {v1, v2}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v3

    if-ne v3, p1, :cond_3

    .line 301
    iget-object v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    invoke-static {v1, v2}, Lorg/eclipse/jgit/diff/SimilarityIndex;->countOf(J)J

    move-result-wide v4

    int-to-long v6, p2

    add-long/2addr v4, v6

    invoke-static {p1, v4, v5}, Lorg/eclipse/jgit/diff/SimilarityIndex;->pair(IJ)J

    move-result-wide v4

    aput-wide v4, v3, v0

    goto :goto_1

    .line 304
    :cond_3
    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    array-length v3, v3

    if-lt v0, v3, :cond_0

    .line 305
    const/4 v0, 0x0

    goto :goto_0
.end method

.method common(Lorg/eclipse/jgit/diff/SimilarityIndex;)J
    .locals 2
    .parameter "dst"

    .prologue
    .line 203
    invoke-static {p0, p1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->common(Lorg/eclipse/jgit/diff/SimilarityIndex;Lorg/eclipse/jgit/diff/SimilarityIndex;)J

    move-result-wide v0

    return-wide v0
.end method

.method count(I)J
    .locals 2
    .parameter "idx"

    .prologue
    .line 265
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->packedIndex(I)I

    move-result v1

    aget-wide v0, v0, v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->countOf(J)J

    move-result-wide v0

    return-wide v0
.end method

.method findIndex(I)I
    .locals 2
    .parameter "key"

    .prologue
    .line 270
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idSize:I

    if-ge v0, v1, :cond_1

    .line 271
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/diff/SimilarityIndex;->key(I)I

    move-result v1

    if-ne v1, p1, :cond_0

    .line 273
    .end local v0           #i:I
    :goto_1
    return v0

    .line 270
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 273
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method getFileSize()J
    .locals 2

    .prologue
    .line 112
    iget-wide v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->fileSize:J

    return-wide v0
.end method

.method hash(Ljava/io/InputStream;J)V
    .locals 9
    .parameter "in"
    .parameter "remaining"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
        }
    .end annotation

    .prologue
    .line 154
    const/16 v7, 0x1000

    new-array v0, v7, [B

    .line 155
    .local v0, buf:[B
    const/4 v5, 0x0

    .line 156
    .local v5, ptr:I
    const/4 v2, 0x0

    .line 158
    .local v2, cnt:I
    :goto_0
    const-wide/16 v7, 0x0

    cmp-long v7, v7, p2

    if-gez v7, :cond_3

    .line 159
    const/16 v3, 0x1505

    .line 162
    .local v3, hash:I
    const/4 v4, 0x0

    .line 164
    .local v4, n:I
    :goto_1
    if-ne v5, v2, :cond_0

    .line 165
    const/4 v5, 0x0

    .line 166
    const/4 v7, 0x0

    array-length v8, v0

    invoke-virtual {p1, v0, v7, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 167
    if-gtz v2, :cond_0

    .line 168
    new-instance v7, Ljava/io/EOFException;

    invoke-direct {v7}, Ljava/io/EOFException;-><init>()V

    throw v7

    .line 171
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 172
    add-int/lit8 v6, v5, 0x1

    .end local v5           #ptr:I
    .local v6, ptr:I
    aget-byte v7, v0, v5

    and-int/lit16 v1, v7, 0xff

    .line 173
    .local v1, c:I
    const/16 v7, 0xa

    if-ne v1, v7, :cond_2

    .line 177
    :cond_1
    invoke-virtual {p0, v3, v4}, Lorg/eclipse/jgit/diff/SimilarityIndex;->add(II)V

    .line 178
    int-to-long v7, v4

    sub-long/2addr p2, v7

    move v5, v6

    .line 179
    .end local v6           #ptr:I
    .restart local v5       #ptr:I
    goto :goto_0

    .line 175
    .end local v5           #ptr:I
    .restart local v6       #ptr:I
    :cond_2
    shl-int/lit8 v7, v3, 0x5

    add-int/2addr v7, v3

    add-int v3, v7, v1

    .line 176
    const/16 v7, 0x40

    if-ge v4, v7, :cond_1

    int-to-long v7, v4

    cmp-long v7, v7, p2

    if-gez v7, :cond_1

    move v5, v6

    .end local v6           #ptr:I
    .restart local v5       #ptr:I
    goto :goto_1

    .line 180
    .end local v1           #c:I
    .end local v3           #hash:I
    .end local v4           #n:I
    :cond_3
    return-void
.end method

.method hash(Lorg/eclipse/jgit/lib/ObjectLoader;)V
    .locals 4
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectLoader;->isLarge()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 122
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v0

    .line 124
    .local v0, in:Lorg/eclipse/jgit/lib/ObjectStream;
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectStream;->getSize()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/diff/SimilarityIndex;->setFileSize(J)V

    .line 125
    iget-wide v2, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->fileSize:J

    invoke-virtual {p0, v0, v2, v3}, Lorg/eclipse/jgit/diff/SimilarityIndex;->hash(Ljava/io/InputStream;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    .line 134
    .end local v0           #in:Lorg/eclipse/jgit/lib/ObjectStream;
    :goto_0
    return-void

    .line 127
    .restart local v0       #in:Lorg/eclipse/jgit/lib/ObjectStream;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectStream;->close()V

    throw v2

    .line 130
    .end local v0           #in:Lorg/eclipse/jgit/lib/ObjectStream;
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v1

    .line 131
    .local v1, raw:[B
    array-length v2, v1

    int-to-long v2, v2

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/diff/SimilarityIndex;->setFileSize(J)V

    .line 132
    const/4 v2, 0x0

    array-length v3, v1

    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jgit/diff/SimilarityIndex;->hash([BII)V

    goto :goto_0
.end method

.method hash([BII)V
    .locals 6
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
        }
    .end annotation

    .prologue
    .line 137
    :goto_0
    if-ge p2, p3, :cond_2

    .line 138
    const/16 v1, 0x1505

    .line 139
    .local v1, hash:I
    move v3, p2

    .line 143
    .local v3, start:I
    :goto_1
    add-int/lit8 v2, p2, 0x1

    .end local p2
    .local v2, ptr:I
    aget-byte v4, p1, p2

    and-int/lit16 v0, v4, 0xff

    .line 144
    .local v0, c:I
    const/16 v4, 0xa

    if-ne v0, v4, :cond_1

    .line 148
    :cond_0
    sub-int v4, v2, v3

    invoke-virtual {p0, v1, v4}, Lorg/eclipse/jgit/diff/SimilarityIndex;->add(II)V

    move p2, v2

    .line 149
    .end local v2           #ptr:I
    .restart local p2
    goto :goto_0

    .line 146
    .end local p2
    .restart local v2       #ptr:I
    :cond_1
    shl-int/lit8 v4, v1, 0x5

    add-int/2addr v4, v1

    add-int v1, v4, v0

    .line 147
    if-ge v2, p3, :cond_0

    sub-int v4, v2, v3

    const/16 v5, 0x40

    if-ge v4, v5, :cond_0

    move p2, v2

    .end local v2           #ptr:I
    .restart local p2
    goto :goto_1

    .line 150
    .end local v0           #c:I
    .end local v1           #hash:I
    .end local v3           #start:I
    :cond_2
    return-void
.end method

.method key(I)I
    .locals 2
    .parameter "idx"

    .prologue
    .line 260
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->packedIndex(I)I

    move-result v1

    aget-wide v0, v0, v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->keyOf(J)I

    move-result v0

    return v0
.end method

.method score(Lorg/eclipse/jgit/diff/SimilarityIndex;I)I
    .locals 6
    .parameter "dst"
    .parameter "maxScore"

    .prologue
    .line 196
    iget-wide v2, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->fileSize:J

    iget-wide v4, p1, Lorg/eclipse/jgit/diff/SimilarityIndex;->fileSize:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 197
    .local v0, max:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 199
    .end local p2
    :goto_0
    return p2

    .restart local p2
    :cond_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->common(Lorg/eclipse/jgit/diff/SimilarityIndex;)J

    move-result-wide v2

    int-to-long v4, p2

    mul-long/2addr v2, v4

    div-long/2addr v2, v0

    long-to-int p2, v2

    goto :goto_0
.end method

.method setFileSize(J)V
    .locals 0
    .parameter "size"

    .prologue
    .line 116
    iput-wide p1, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->fileSize:J

    .line 117
    return-void
.end method

.method size()I
    .locals 1

    .prologue
    .line 255
    iget v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idSize:I

    return v0
.end method

.method sort()V
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SimilarityIndex;->idHash:[J

    invoke-static {v0}, Ljava/util/Arrays;->sort([J)V

    .line 193
    return-void
.end method
