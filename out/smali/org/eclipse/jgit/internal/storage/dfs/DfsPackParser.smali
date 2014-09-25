.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;
.super Lorg/eclipse/jgit/transport/PackParser;
.source "DfsPackParser.java"


# instance fields
.field private blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

.field private blockSize:I

.field private final crc:Ljava/util/zip/CRC32;

.field private currBuf:[B

.field private currEnd:I

.field private currPos:J

.field private def:Ljava/util/zip/Deflater;

.field private isEmptyPack:Z

.field private final objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

.field private final objins:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;

.field private out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

.field private final packDigest:Ljava/security/MessageDigest;

.field private packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

.field private packEnd:J

.field private packHash:[B

.field private packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

.field private packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

.field private readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

.field private readPos:J


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;Ljava/io/InputStream;)V
    .locals 1
    .parameter "db"
    .parameter "ins"
    .parameter "in"

    .prologue
    .line 128
    invoke-direct {p0, p1, p3}, Lorg/eclipse/jgit/transport/PackParser;-><init>(Lorg/eclipse/jgit/lib/ObjectDatabase;Ljava/io/InputStream;)V

    .line 129
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    .line 130
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objins:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;

    .line 131
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    .line 132
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDigest:Ljava/security/MessageDigest;

    .line 133
    return-void
.end method

.method private buffer([BII)V
    .locals 6
    .parameter "raw"
    .parameter "pos"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 277
    :goto_0
    if-lez p3, :cond_1

    .line 278
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    array-length v2, v2

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    sub-int/2addr v2, v3

    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 279
    .local v0, n:I
    if-nez v0, :cond_0

    .line 280
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->flushBlock()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-result-object v1

    .line 281
    .local v1, v:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockSize:I

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    .line 282
    const/4 v2, 0x0

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    .line 283
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currPos:J

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currPos:J

    goto :goto_0

    .line 287
    .end local v1           #v:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    invoke-static {p1, p2, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 288
    add-int/2addr p2, v0

    .line 289
    sub-int/2addr p3, v0

    .line 290
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    .line 291
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packEnd:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packEnd:J

    goto :goto_0

    .line 293
    .end local v0           #n:I
    :cond_1
    return-void
.end method

.method private flushBlock()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 296
    iget-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->isEmptyPack:Z

    if-eqz v2, :cond_0

    .line 297
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->willNotStoreEmptyPack:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 299
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    iget v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    invoke-virtual {v2, v3, v5, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->write([BII)V

    .line 302
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    array-length v3, v3

    if-ne v2, v3, :cond_1

    .line 303
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    .line 309
    .local v0, buf:[B
    :goto_0
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currPos:J

    invoke-direct {v1, v2, v3, v4, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J[B)V

    .line 310
    .local v1, v:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 311
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;)V

    .line 312
    return-object v1

    .line 305
    .end local v0           #buf:[B
    .end local v1           #v:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :cond_1
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    new-array v0, v2, [B

    .line 306
    .restart local v0       #buf:[B
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    invoke-static {v2, v5, v0, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method private read(J[BII)I
    .locals 4
    .parameter "pos"
    .parameter "dst"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 375
    if-nez p5, :cond_1

    .line 376
    const/4 v0, 0x0

    .line 388
    :cond_0
    :goto_0
    return v0

    .line 378
    :cond_1
    const/4 v0, 0x0

    .line 379
    .local v0, cnt:I
    :goto_1
    if-lez p5, :cond_2

    .line 380
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-static {p3, p4, p5}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v2, p1, p2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->read(JLjava/nio/ByteBuffer;)I

    move-result v1

    .line 381
    .local v1, r:I
    if-gtz v1, :cond_3

    .line 388
    .end local v1           #r:I
    :cond_2
    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    .line 383
    .restart local v1       #r:I
    :cond_3
    int-to-long v2, v1

    add-long/2addr p1, v2

    .line 384
    add-int/2addr p4, v1

    .line 385
    sub-int/2addr p5, v1

    .line 386
    add-int/2addr v0, v1

    .line 387
    goto :goto_1
.end method

.method private toBlockStart(J)J
    .locals 4
    .parameter "pos"

    .prologue
    .line 392
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockSize:I

    int-to-long v0, v0

    div-long v0, p1, v0

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockSize:I

    int-to-long v2, v2

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method private writePackIndex()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 450
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->getSortedObjectList(Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v0

    .line 451
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objins:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packHash:[B

    invoke-virtual {v1, v2, v3, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->writePackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;[BLjava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    .line 452
    return-void
.end method


# virtual methods
.method protected checkCRC(I)Z
    .locals 2
    .parameter "oldCRC"

    .prologue
    .line 397
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    long-to-int v0, v0

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    return-object v0
.end method

.method protected onAppendBase(I[BLorg/eclipse/jgit/transport/PackedObjectInfo;)Z
    .locals 7
    .parameter "typeCode"
    .parameter "data"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 403
    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packEnd:J

    invoke-virtual {p3, v4, v5}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setOffset(J)V

    .line 405
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->buffer()[B

    move-result-object v0

    .line 406
    .local v0, buf:[B
    array-length v3, p2

    .line 407
    .local v3, sz:I
    const/4 v1, 0x0

    .line 408
    .local v1, len:I
    add-int/lit8 v2, v1, 0x1

    .end local v1           #len:I
    .local v2, len:I
    shl-int/lit8 v4, p1, 0x4

    and-int/lit8 v5, v3, 0xf

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 409
    ushr-int/lit8 v3, v3, 0x4

    .line 410
    :goto_0
    if-lez v3, :cond_0

    .line 411
    add-int/lit8 v4, v2, -0x1

    aget-byte v5, v0, v4

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, v0, v4

    .line 412
    add-int/lit8 v1, v2, 0x1

    .end local v2           #len:I
    .restart local v1       #len:I
    and-int/lit8 v4, v3, 0x7f

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 413
    ushr-int/lit8 v3, v3, 0x7

    move v2, v1

    .end local v1           #len:I
    .restart local v2       #len:I
    goto :goto_0

    .line 416
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDigest:Ljava/security/MessageDigest;

    invoke-virtual {v4, v0, v6, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 417
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4}, Ljava/util/zip/CRC32;->reset()V

    .line 418
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4, v0, v6, v2}, Ljava/util/zip/CRC32;->update([BII)V

    .line 419
    invoke-direct {p0, v0, v6, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->buffer([BII)V

    .line 421
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    if-nez v4, :cond_1

    .line 422
    new-instance v4, Ljava/util/zip/Deflater;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v6}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    .line 425
    :goto_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4, p2}, Ljava/util/zip/Deflater;->setInput([B)V

    .line 426
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4}, Ljava/util/zip/Deflater;->finish()V

    move v1, v2

    .line 428
    .end local v2           #len:I
    .restart local v1       #len:I
    :goto_2
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4}, Ljava/util/zip/Deflater;->finished()Z

    move-result v4

    if-nez v4, :cond_2

    .line 429
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4, v0}, Ljava/util/zip/Deflater;->deflate([B)I

    move-result v1

    .line 430
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDigest:Ljava/security/MessageDigest;

    invoke-virtual {v4, v0, v6, v1}, Ljava/security/MessageDigest;->update([BII)V

    .line 431
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4, v0, v6, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 432
    invoke-direct {p0, v0, v6, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->buffer([BII)V

    goto :goto_2

    .line 424
    .end local v1           #len:I
    .restart local v2       #len:I
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4}, Ljava/util/zip/Deflater;->reset()V

    goto :goto_1

    .line 435
    .end local v2           #len:I
    .restart local v1       #len:I
    :cond_2
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    long-to-int v4, v4

    invoke-virtual {p3, v4}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setCRC(I)V

    .line 436
    const/4 v4, 0x1

    return v4
.end method

.method protected onBeginOfsDelta(JJJ)V
    .locals 1
    .parameter "streamPosition"
    .parameter "baseStreamPosition"
    .parameter "inflatedSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 236
    return-void
.end method

.method protected onBeginRefDelta(JLorg/eclipse/jgit/lib/AnyObjectId;J)V
    .locals 1
    .parameter "streamPosition"
    .parameter "baseId"
    .parameter "inflatedSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 242
    return-void
.end method

.method protected onBeginWholeObject(JIJ)V
    .locals 1
    .parameter "streamPosition"
    .parameter "type"
    .parameter "inflatedSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 225
    return-void
.end method

.method protected onEndDelta()Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;-><init>()V

    .line 247
    .local v0, delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->setCRC(I)V

    .line 248
    return-object v0
.end method

.method protected onEndThinPack()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 446
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDigest:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packHash:[B

    .line 447
    return-void
.end method

.method protected onEndWholeObject(Lorg/eclipse/jgit/transport/PackedObjectInfo;)V
    .locals 2
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setCRC(I)V

    .line 230
    return-void
.end method

.method protected onInflatedObjectData(Lorg/eclipse/jgit/transport/PackedObjectInfo;I[B)V
    .locals 0
    .parameter "obj"
    .parameter "typeCode"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    return-void
.end method

.method protected onObjectData(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V
    .locals 1
    .parameter "src"
    .parameter "raw"
    .parameter "pos"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0, p2, p3, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 267
    return-void
.end method

.method protected onObjectHeader(Lorg/eclipse/jgit/transport/PackParser$Source;[BII)V
    .locals 1
    .parameter "src"
    .parameter "raw"
    .parameter "pos"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 260
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0, p2, p3, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 261
    return-void
.end method

.method protected onPackFooter([B)V
    .locals 0
    .parameter "hash"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packHash:[B

    .line 322
    return-void
.end method

.method protected onPackHeader(J)V
    .locals 4
    .parameter "objectCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-nez v1, :cond_0

    .line 203
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->isEmptyPack:Z

    .line 204
    const/16 v1, 0x100

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    .line 219
    :goto_0
    return-void

    .line 208
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    sget-object v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->RECEIVE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->newPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 209
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-direct {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 211
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v3, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    .line 212
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->blockSize()I

    move-result v0

    .line 213
    .local v0, size:I
    if-gtz v0, :cond_2

    .line 214
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v0

    .line 217
    :cond_1
    :goto_1
    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockSize:I

    .line 218
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockSize:I

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    goto :goto_0

    .line 215
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 216
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v1

    div-int/2addr v1, v0

    mul-int/2addr v0, v1

    goto :goto_1
.end method

.method protected onStoreStream([BII)V
    .locals 1
    .parameter "raw"
    .parameter "pos"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->buffer([BII)V

    .line 273
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDigest:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 274
    return-void
.end method

.method public parse(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;
    .locals 7
    .parameter "receiving"
    .parameter "resolving"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 138
    const/4 v1, 0x1

    .line 140
    .local v1, rollback:Z
    :try_start_0
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getInstance()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 141
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/transport/PackParser;->parse(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 142
    iget-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->isEmptyPack:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_3

    .line 167
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 168
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    .line 169
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 171
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    if-eqz v2, :cond_0

    .line 172
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v2}, Ljava/util/zip/Deflater;->end()V

    .line 173
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    .line 176
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    if-eqz v2, :cond_1

    .line 178
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 182
    :goto_0
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    .line 185
    :cond_1
    if-eqz v1, :cond_2

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    if-eqz v2, :cond_2

    .line 187
    :try_start_2
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 189
    :goto_1
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 165
    :cond_2
    return-object v6

    .line 144
    :cond_3
    :try_start_3
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packHash:[B

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packHash:[B

    array-length v4, v4

    invoke-direct {p0, v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->buffer([BII)V

    .line 145
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    if-eqz v2, :cond_4

    .line 146
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->flushBlock()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 147
    :cond_4
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    .line 148
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    .line 149
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    .line 150
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 151
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v3, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V

    .line 152
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v3, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packEnd:J

    invoke-virtual {v2, v3, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 154
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->writePackIndex()V

    .line 155
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->commitPack(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 156
    const/4 v1, 0x0

    .line 158
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getOrCreate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .line 159
    .local v0, p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockSize:I

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setBlockSize(I)V

    .line 160
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    if-eqz v2, :cond_5

    .line 161
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setPackIndex(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    .line 163
    :cond_5
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->addPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 167
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 168
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    .line 169
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 171
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    if-eqz v2, :cond_6

    .line 172
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v2}, Ljava/util/zip/Deflater;->end()V

    .line 173
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    .line 176
    :cond_6
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    if-eqz v2, :cond_7

    .line 178
    :try_start_4
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 182
    :goto_2
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    .line 185
    :cond_7
    if-eqz v1, :cond_2

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    if-eqz v2, :cond_2

    .line 187
    :try_start_5
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_1

    .line 189
    :catchall_0
    move-exception v2

    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    throw v2

    .line 167
    .end local v0           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :catchall_1
    move-exception v2

    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 168
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    .line 169
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 171
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    if-eqz v3, :cond_8

    .line 172
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v3}, Ljava/util/zip/Deflater;->end()V

    .line 173
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->def:Ljava/util/zip/Deflater;

    .line 176
    :cond_8
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    if-eqz v3, :cond_9

    .line 178
    :try_start_6
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 182
    :goto_3
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    .line 185
    :cond_9
    if-eqz v1, :cond_a

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    if-eqz v3, :cond_a

    .line 187
    :try_start_7
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 189
    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 167
    :cond_a
    throw v2

    .line 189
    :catchall_2
    move-exception v2

    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    throw v2

    :catchall_3
    move-exception v2

    iput-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packDsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    throw v2

    .line 179
    .restart local v0       #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :catch_0
    move-exception v2

    goto :goto_2

    .end local v0           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :catch_1
    move-exception v2

    goto/16 :goto_0

    :catch_2
    move-exception v3

    goto :goto_3
.end method

.method protected readDatabase([BII)I
    .locals 16
    .parameter "dst"
    .parameter "pos"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    if-nez p3, :cond_0

    .line 343
    const/4 v14, 0x0

    .line 371
    :goto_0
    return v14

    .line 345
    :cond_0
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currPos:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    cmp-long v2, v8, v10

    if-gtz v2, :cond_2

    .line 347
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currPos:J

    sub-long/2addr v8, v10

    long-to-int v15, v8

    .line 348
    .local v15, p:I
    move-object/from16 v0, p0

    iget v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currEnd:I

    sub-int/2addr v2, v15

    move/from16 v0, p3

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v14

    .line 349
    .local v14, n:I
    if-nez v14, :cond_1

    .line 350
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 351
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->currBuf:[B

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v2, v15, v0, v1, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 352
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    int-to-long v10, v14

    add-long/2addr v8, v10

    move-object/from16 v0, p0

    iput-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    goto :goto_0

    .line 356
    .end local v14           #n:I
    .end local v15           #p:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    invoke-virtual {v2, v6, v8, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->contains(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Z

    move-result v2

    if-nez v2, :cond_5

    .line 357
    :cond_3
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->toBlockStart(J)J

    move-result-wide v3

    .line 358
    .local v3, start:J
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-virtual {v2, v6, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->get(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 359
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    if-nez v2, :cond_5

    .line 360
    move-object/from16 v0, p0

    iget v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockSize:I

    int-to-long v8, v2

    move-object/from16 v0, p0

    iget-wide v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packEnd:J

    sub-long/2addr v10, v3

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v7, v8

    .line 361
    .local v7, size:I
    new-array v5, v7, [B

    .line 362
    .local v5, buf:[B
    const/4 v6, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->read(J[BII)I

    move-result v2

    if-eq v2, v7, :cond_4

    .line 363
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 364
    :cond_4
    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-direct {v2, v6, v3, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J[B)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 365
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->blockCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    invoke-virtual {v2, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;)V

    .line 369
    .end local v3           #start:J
    .end local v5           #buf:[B
    .end local v7           #size:I
    :cond_5
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readBlock:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-object/from16 v0, p0

    iget-wide v9, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    move-object/from16 v11, p1

    move/from16 v12, p2

    move/from16 v13, p3

    invoke-virtual/range {v8 .. v13}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->copy(J[BII)I

    move-result v14

    .line 370
    .restart local v14       #n:I
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    int-to-long v10, v14

    add-long/2addr v8, v10

    move-object/from16 v0, p0

    iput-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    goto/16 :goto_0
.end method

.method protected seekDatabase(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .locals 2
    .parameter "delta"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->getOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    .line 336
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 337
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readObjectHeader(Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v0

    return-object v0
.end method

.method protected seekDatabase(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .locals 2
    .parameter "obj"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 327
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readPos:J

    .line 328
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 329
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackParser;->readObjectHeader(Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v0

    return-object v0
.end method
