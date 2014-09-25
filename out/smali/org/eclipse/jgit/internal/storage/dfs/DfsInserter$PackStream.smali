.class Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;
.super Ljava/io/OutputStream;
.source "DfsInserter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PackStream"
.end annotation


# instance fields
.field private final blockSize:I

.field final compress:Ljava/util/zip/DeflaterOutputStream;

.field final crc32:Ljava/util/zip/CRC32;

.field private currBuf:[B

.field private currPos:J

.field private currPtr:I

.field private final deflater:Ljava/util/zip/Deflater;

.field private final hdrBuf:[B

.field private final md:Ljava/security/MessageDigest;

.field private final out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;)V
    .locals 4
    .parameter
    .parameter "out"

    .prologue
    .line 292
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 293
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    .line 295
    const/16 v1, 0x20

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B

    .line 296
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->md:Ljava/security/MessageDigest;

    .line 297
    new-instance v1, Ljava/util/zip/CRC32;

    invoke-direct {v1}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->crc32:Ljava/util/zip/CRC32;

    .line 298
    new-instance v1, Ljava/util/zip/Deflater;

    const/16 v2, 0x9

    invoke-direct {v1, v2}, Ljava/util/zip/Deflater;-><init>(I)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->deflater:Ljava/util/zip/Deflater;

    .line 299
    new-instance v1, Ljava/util/zip/DeflaterOutputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->deflater:Ljava/util/zip/Deflater;

    const/16 v3, 0x2000

    invoke-direct {v1, p0, v2, v3}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;I)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->compress:Ljava/util/zip/DeflaterOutputStream;

    .line 301
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->blockSize()I

    move-result v0

    .line 302
    .local v0, size:I
    if-gtz v0, :cond_1

    .line 303
    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->access$100(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v0

    .line 306
    :cond_0
    :goto_0
    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->blockSize:I

    .line 307
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->blockSize:I

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    .line 308
    return-void

    .line 304
    :cond_1
    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->access$100(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 305
    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->access$100(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v1

    div-int/2addr v1, v0

    mul-int/2addr v0, v1

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;)[B
    .locals 1
    .parameter "x0"

    .prologue
    .line 278
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B

    return-object v0
.end method

.method private copyOf([BII)[B
    .locals 2
    .parameter "src"
    .parameter "ptr"
    .parameter "cnt"

    .prologue
    .line 379
    new-array v0, p3, [B

    .line 380
    .local v0, dst:[B
    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 381
    return-object v0
.end method

.method private encodeTypeSize(IJ)I
    .locals 11
    .parameter "type"
    .parameter "rawLength"

    .prologue
    .line 321
    const/4 v4, 0x4

    ushr-long v2, p2, v4

    .line 322
    .local v2, nextLength:J
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    cmp-long v4, v2, v7

    if-lez v4, :cond_0

    const/16 v4, 0x80

    :goto_0
    shl-int/lit8 v7, p1, 0x4

    or-int/2addr v4, v7

    int-to-long v7, v4

    const-wide/16 v9, 0xf

    and-long/2addr v9, p2

    or-long/2addr v7, v9

    long-to-int v4, v7

    int-to-byte v4, v4

    aput-byte v4, v5, v6

    .line 323
    move-wide p2, v2

    .line 324
    const/4 v0, 0x1

    .local v0, n:I
    move v1, v0

    .line 325
    .end local v0           #n:I
    .local v1, n:I
    :goto_1
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-lez v4, :cond_2

    .line 326
    const/4 v4, 0x7

    ushr-long/2addr v2, v4

    .line 327
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B

    add-int/lit8 v0, v1, 0x1

    .end local v1           #n:I
    .restart local v0       #n:I
    const-wide/16 v6, 0x0

    cmp-long v4, v2, v6

    if-lez v4, :cond_1

    const/16 v4, 0x80

    :goto_2
    int-to-long v6, v4

    const-wide/16 v8, 0x7f

    and-long/2addr v8, p2

    or-long/2addr v6, v8

    long-to-int v4, v6

    int-to-byte v4, v4

    aput-byte v4, v5, v1

    .line 328
    move-wide p2, v2

    move v1, v0

    .end local v0           #n:I
    .restart local v1       #n:I
    goto :goto_1

    .line 322
    .end local v1           #n:I
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 327
    .restart local v0       #n:I
    :cond_1
    const/4 v4, 0x0

    goto :goto_2

    .line 330
    .end local v0           #n:I
    .restart local v1       #n:I
    :cond_2
    return v1
.end method

.method private flushBlock()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 364
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    invoke-virtual {v1, v2, v6, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->write([BII)V

    .line 367
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 368
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    .line 371
    .local v0, buf:[B
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;

    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->access$100(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v1

    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;

    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->packKey:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;
    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;->access$200(Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    move-result-object v3

    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPos:J

    invoke-direct {v2, v3, v4, v5, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J[B)V

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;)V

    .line 373
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPos:J

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPos:J

    .line 374
    iput v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    .line 375
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    .line 376
    return-void

    .line 370
    .end local v0           #buf:[B
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    invoke-direct {p0, v1, v6, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->copyOf([BII)[B

    move-result-object v0

    .restart local v0       #buf:[B
    goto :goto_0
.end method

.method private writeNoHash([BII)V
    .locals 3
    .parameter "data"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    :goto_0
    if-lez p3, :cond_1

    .line 349
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    array-length v1, v1

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 350
    .local v0, n:I
    if-nez v0, :cond_0

    .line 351
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->flushBlock()V

    .line 352
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->blockSize:I

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    goto :goto_0

    .line 356
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currBuf:[B

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 357
    add-int/2addr p2, v0

    .line 358
    sub-int/2addr p3, v0

    .line 359
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    goto :goto_0

    .line 361
    .end local v0           #n:I
    :cond_1
    return-void
.end method


# virtual methods
.method beginObject(IJ)V
    .locals 3
    .parameter "objectType"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 316
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    .line 317
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->encodeTypeSize(IJ)I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->write([BII)V

    .line 318
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 394
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 395
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    .line 396
    return-void
.end method

.method getCount()J
    .locals 4

    .prologue
    .line 311
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPos:J

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public write(I)V
    .locals 3
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 335
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 336
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->hdrBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->write([BII)V

    .line 337
    return-void
.end method

.method public write([BII)V
    .locals 1
    .parameter "data"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 341
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 342
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->md:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 343
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->writeNoHash([BII)V

    .line 344
    return-void
.end method

.method writePackFooter()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 385
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->md:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 386
    .local v0, packHash:[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->writeNoHash([BII)V

    .line 387
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->currPtr:I

    if-eqz v1, :cond_0

    .line 388
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter$PackStream;->flushBlock()V

    .line 389
    :cond_0
    return-object v0
.end method
