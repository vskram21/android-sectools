.class public Lorg/eclipse/jgit/internal/storage/file/PackFile;
.super Ljava/lang/Object;
.source "PackFile.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;",
        ">;"
    }
.end annotation


# static fields
.field public static final SORT:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private activeCopyRawData:I

.field private activeWindows:I

.field private bitmapIdx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

.field private volatile corruptObjects:Lorg/eclipse/jgit/util/LongList;

.field private final extensions:I

.field private fd:Ljava/io/RandomAccessFile;

.field final hash:I

.field private volatile invalid:Z

.field private invalidBitmap:Z

.field private keepFile:Ljava/io/File;

.field length:J

.field private loadedIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

.field private packChecksum:[B

.field private final packFile:Ljava/io/File;

.field private packLastModified:I

.field private volatile packName:Ljava/lang/String;

.field private final readLock:Ljava/lang/Object;

.field private reverseIdx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 94
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackFile$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/file/PackFile$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->SORT:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 3
    .parameter "packFile"
    .parameter "extensions"

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readLock:Ljava/lang/Object;

    .line 153
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    .line 154
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    const/16 v2, 0xa

    shr-long/2addr v0, v2

    long-to-int v0, v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packLastModified:I

    .line 155
    iput p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->extensions:I

    .line 160
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->hash:I

    .line 161
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    .line 162
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/internal/storage/file/PackFile;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packLastModified:I

    return v0
.end method

.method private declared-synchronized beginCopyAsIs(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 4
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
        }
    .end annotation

    .prologue
    .line 562
    monitor-enter p0

    :try_start_0
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeCopyRawData:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeCopyRawData:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeWindows:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 564
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->doOpen()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 573
    :cond_0
    monitor-exit p0

    return-void

    .line 565
    :catch_0
    move-exception v1

    .line 568
    .local v1, thisPackNotValid:Ljava/io/IOException;
    :try_start_2
    new-instance v0, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;-><init>(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 569
    .local v0, gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 570
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 562
    .end local v0           #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    .end local v1           #thisPackNotValid:Ljava/io/IOException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private copyAsIs2(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 47
    .parameter "out"
    .parameter "src"
    .parameter "validate"
    .parameter "curs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
        }
    .end annotation

    .prologue
    .line 366
    if-eqz p3, :cond_0

    new-instance v33, Ljava/util/zip/CRC32;

    invoke-direct/range {v33 .. v33}, Ljava/util/zip/CRC32;-><init>()V

    .line 367
    .local v33, crc1:Ljava/util/zip/CRC32;
    :goto_0
    if-eqz p3, :cond_1

    new-instance v34, Ljava/util/zip/CRC32;

    invoke-direct/range {v34 .. v34}, Ljava/util/zip/CRC32;-><init>()V

    .line 368
    .local v34, crc2:Ljava/util/zip/CRC32;
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->getCopyBuffer()[B

    move-result-object v7

    .line 372
    .local v7, buf:[B
    move-object/from16 v0, p2

    iget-wide v5, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    const/4 v8, 0x0

    const/16 v9, 0x14

    move-object/from16 v4, p0

    move-object/from16 v10, p4

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 373
    const/4 v4, 0x0

    aget-byte v4, v7, v4

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 374
    .local v29, c:I
    shr-int/lit8 v4, v29, 0x4

    and-int/lit8 v46, v4, 0x7

    .line 375
    .local v46, typeCode:I
    and-int/lit8 v4, v29, 0xf

    int-to-long v0, v4

    move-wide/from16 v41, v0

    .line 376
    .local v41, inflatedLength:J
    const/16 v45, 0x4

    .line 377
    .local v45, shift:I
    const/16 v39, 0x1

    .local v39, headerCnt:I
    move/from16 v40, v39

    .line 378
    .end local v39           #headerCnt:I
    .local v40, headerCnt:I
    :goto_2
    move/from16 v0, v29

    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_2

    .line 379
    add-int/lit8 v39, v40, 0x1

    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    aget-byte v4, v7, v40

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 380
    and-int/lit8 v4, v29, 0x7f

    int-to-long v4, v4

    shl-long v4, v4, v45

    add-long v41, v41, v4

    .line 381
    add-int/lit8 v45, v45, 0x7

    move/from16 v40, v39

    .end local v39           #headerCnt:I
    .restart local v40       #headerCnt:I
    goto :goto_2

    .line 366
    .end local v7           #buf:[B
    .end local v29           #c:I
    .end local v33           #crc1:Ljava/util/zip/CRC32;
    .end local v34           #crc2:Ljava/util/zip/CRC32;
    .end local v40           #headerCnt:I
    .end local v41           #inflatedLength:J
    .end local v45           #shift:I
    .end local v46           #typeCode:I
    :cond_0
    const/16 v33, 0x0

    goto :goto_0

    .line 367
    .restart local v33       #crc1:Ljava/util/zip/CRC32;
    :cond_1
    const/16 v34, 0x0

    goto :goto_1

    .line 384
    .restart local v7       #buf:[B
    .restart local v29       #c:I
    .restart local v34       #crc2:Ljava/util/zip/CRC32;
    .restart local v40       #headerCnt:I
    .restart local v41       #inflatedLength:J
    .restart local v45       #shift:I
    .restart local v46       #typeCode:I
    :cond_2
    const/4 v4, 0x6

    move/from16 v0, v46

    if-ne v0, v4, :cond_5

    :cond_3
    move/from16 v39, v40

    .line 386
    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    add-int/lit8 v40, v39, 0x1

    .end local v39           #headerCnt:I
    .restart local v40       #headerCnt:I
    aget-byte v4, v7, v39

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 387
    move/from16 v0, v29

    and-int/lit16 v4, v0, 0x80

    if-nez v4, :cond_3

    .line 388
    if-eqz p3, :cond_9

    .line 389
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 390
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    move/from16 v39, v40

    .line 409
    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    :goto_3
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move/from16 v0, v39

    int-to-long v8, v0

    add-long v10, v4, v8

    .line 410
    .local v10, dataOffset:J
    move-object/from16 v0, p2

    iget-wide v12, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->length:J

    .local v12, dataLength:J
    move-object/from16 v8, p4

    move-object/from16 v9, p0

    .line 418
    :try_start_0
    invoke-virtual/range {v8 .. v13}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->quickCopy(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJ)Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;

    move-result-object v44

    .line 420
    .local v44, quickCopy:Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    if-eqz p3, :cond_b

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->hasCRC32Support()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 423
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findCRC32(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v36

    .line 424
    .local v36, expectedCRC:J
    if-eqz v44, :cond_a

    .line 425
    long-to-int v4, v12

    move-object/from16 v0, v44

    move-object/from16 v1, v33

    invoke-virtual {v0, v1, v10, v11, v4}, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->crc32(Ljava/util/zip/CRC32;JI)V

    .line 437
    :cond_4
    invoke-virtual/range {v33 .. v33}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    cmp-long v4, v4, v36

    if-eqz v4, :cond_11

    .line 438
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->setCorrupt(J)V

    .line 439
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p2

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 476
    .end local v36           #expectedCRC:J
    .end local v44           #quickCopy:Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    :catch_0
    move-exception v35

    .line 477
    .local v35, dataFormat:Ljava/util/zip/DataFormatException;
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->setCorrupt(J)V

    .line 479
    new-instance v32, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p2

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v5, v6

    const/4 v6, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    .line 483
    .local v32, corruptObject:Lorg/eclipse/jgit/errors/CorruptObjectException;
    move-object/from16 v0, v32

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 486
    new-instance v38, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;

    move-object/from16 v0, v38

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;-><init>(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 487
    .local v38, gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    move-object/from16 v0, v38

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 488
    throw v38

    .line 392
    .end local v10           #dataOffset:J
    .end local v12           #dataLength:J
    .end local v32           #corruptObject:Lorg/eclipse/jgit/errors/CorruptObjectException;
    .end local v35           #dataFormat:Ljava/util/zip/DataFormatException;
    .end local v38           #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    .end local v39           #headerCnt:I
    .restart local v40       #headerCnt:I
    :cond_5
    const/4 v4, 0x7

    move/from16 v0, v46

    if-ne v0, v4, :cond_8

    .line 393
    if-eqz p3, :cond_6

    .line 394
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 395
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 398
    :cond_6
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move/from16 v0, v40

    int-to-long v8, v0

    add-long v5, v4, v8

    const/4 v8, 0x0

    const/16 v9, 0x14

    move-object/from16 v4, p0

    move-object/from16 v10, p4

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 399
    if-eqz p3, :cond_7

    .line 400
    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object/from16 v0, v33

    invoke-virtual {v0, v7, v4, v5}, Ljava/util/zip/CRC32;->update([BII)V

    .line 401
    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object/from16 v0, v34

    invoke-virtual {v0, v7, v4, v5}, Ljava/util/zip/CRC32;->update([BII)V

    .line 403
    :cond_7
    add-int/lit8 v39, v40, 0x14

    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    goto/16 :goto_3

    .line 404
    .end local v39           #headerCnt:I
    .restart local v40       #headerCnt:I
    :cond_8
    if-eqz p3, :cond_9

    .line 405
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 406
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    :cond_9
    move/from16 v39, v40

    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    goto/16 :goto_3

    .line 427
    .restart local v10       #dataOffset:J
    .restart local v12       #dataLength:J
    .restart local v36       #expectedCRC:J
    .restart local v44       #quickCopy:Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    :cond_a
    move-wide v15, v10

    .line 428
    .local v15, pos:J
    move-wide/from16 v30, v12

    .line 429
    .local v30, cnt:J
    :goto_4
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_4

    .line 430
    :try_start_1
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 431
    .local v19, n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 432
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 433
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 434
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 435
    goto :goto_4

    .line 443
    .end local v15           #pos:J
    .end local v19           #n:I
    .end local v30           #cnt:J
    .end local v36           #expectedCRC:J
    :cond_b
    if-eqz p3, :cond_13

    .line 448
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inflater()Ljava/util/zip/Inflater;

    move-result-object v21

    .line 449
    .local v21, inf:Ljava/util/zip/Inflater;
    const/16 v4, 0x400

    new-array v0, v4, [B

    move-object/from16 v22, v0

    .line 450
    .local v22, tmp:[B
    if-eqz v44, :cond_e

    .line 451
    long-to-int v0, v12

    move/from16 v25, v0

    move-object/from16 v20, v44

    move-wide/from16 v23, v10

    invoke-virtual/range {v20 .. v25}, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->check(Ljava/util/zip/Inflater;[BJI)V

    .line 466
    :cond_c
    invoke-virtual/range {v21 .. v21}, Ljava/util/zip/Inflater;->finished()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-virtual/range {v21 .. v21}, Ljava/util/zip/Inflater;->getBytesRead()J

    move-result-wide v4

    cmp-long v4, v4, v12

    if-eqz v4, :cond_10

    .line 467
    :cond_d
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->setCorrupt(J)V

    .line 468
    new-instance v4, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->shortCompressedStreamAt:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p2

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 490
    .end local v21           #inf:Ljava/util/zip/Inflater;
    .end local v22           #tmp:[B
    .end local v44           #quickCopy:Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    :catch_1
    move-exception v43

    .line 492
    .local v43, ioError:Ljava/io/IOException;
    new-instance v38, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;

    move-object/from16 v0, v38

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;-><init>(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 493
    .restart local v38       #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    move-object/from16 v0, v38

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 494
    throw v38

    .line 453
    .end local v38           #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    .end local v43           #ioError:Ljava/io/IOException;
    .restart local v21       #inf:Ljava/util/zip/Inflater;
    .restart local v22       #tmp:[B
    .restart local v44       #quickCopy:Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    :cond_e
    move-wide v15, v10

    .line 454
    .restart local v15       #pos:J
    move-wide/from16 v30, v12

    .line 455
    .restart local v30       #cnt:J
    :goto_5
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_c

    .line 456
    :try_start_2
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 457
    .restart local v19       #n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 458
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 459
    const/4 v4, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 460
    :cond_f
    const/4 v4, 0x0

    move-object/from16 v0, v22

    array-length v5, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v4, v5}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v4

    if-gtz v4, :cond_f

    .line 462
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 463
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 464
    goto :goto_5

    .line 472
    .end local v15           #pos:J
    .end local v19           #n:I
    .end local v30           #cnt:J
    :cond_10
    invoke-virtual/range {v33 .. v33}, Ljava/util/zip/CRC32;->getValue()J
    :try_end_2
    .catch Ljava/util/zip/DataFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-wide v36

    .line 497
    .end local v21           #inf:Ljava/util/zip/Inflater;
    .end local v22           #tmp:[B
    .restart local v36       #expectedCRC:J
    :cond_11
    :goto_6
    if-eqz v44, :cond_14

    .line 501
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-wide/from16 v2, v41

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 502
    long-to-int v0, v12

    move/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v23, v44

    move-object/from16 v24, p1

    move-wide/from16 v25, v10

    invoke-virtual/range {v23 .. v28}, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;->write(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;JILjava/security/MessageDigest;)V

    .line 543
    :cond_12
    :goto_7
    return-void

    .line 474
    .end local v36           #expectedCRC:J
    :cond_13
    const-wide/16 v36, -0x1

    .restart local v36       #expectedCRC:J
    goto :goto_6

    .line 504
    :cond_14
    array-length v4, v7

    int-to-long v4, v4

    cmp-long v4, v12, v4

    if-gtz v4, :cond_16

    .line 508
    if-nez p3, :cond_15

    .line 509
    move-wide v15, v10

    .line 510
    .restart local v15       #pos:J
    move-wide/from16 v30, v12

    .line 511
    .restart local v30       #cnt:J
    :goto_8
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_15

    .line 512
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 513
    .restart local v19       #n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 514
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 515
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 516
    goto :goto_8

    .line 518
    .end local v15           #pos:J
    .end local v19           #n:I
    .end local v30           #cnt:J
    :cond_15
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-wide/from16 v2, v41

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 519
    const/4 v4, 0x0

    long-to-int v5, v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v4, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    goto :goto_7

    .line 525
    :cond_16
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-wide/from16 v2, v41

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 526
    move-wide v15, v10

    .line 527
    .restart local v15       #pos:J
    move-wide/from16 v30, v12

    .line 528
    .restart local v30       #cnt:J
    :goto_9
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_18

    .line 529
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 530
    .restart local v19       #n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 531
    if-eqz p3, :cond_17

    .line 532
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 533
    :cond_17
    const/4 v4, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    .line 534
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 535
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 536
    goto :goto_9

    .line 537
    .end local v19           #n:I
    :cond_18
    if-eqz p3, :cond_12

    invoke-virtual/range {v34 .. v34}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    cmp-long v4, v4, v36

    if-eqz v4, :cond_12

    .line 538
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p2

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->offset:J

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private final decompress(JILorg/eclipse/jgit/internal/storage/file/WindowCursor;)[B
    .locals 7
    .parameter "position"
    .parameter "sz"
    .parameter "curs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 326
    :try_start_0
    new-array v4, p3, [B
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .local v4, dstbuf:[B
    move-object v0, p4

    move-object v1, p0

    move-wide v2, p1

    .line 338
    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inflate(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BI)I

    move-result v0

    if-eq v0, p3, :cond_0

    .line 339
    new-instance v0, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->shortCompressedStreamAt:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 327
    .end local v4           #dstbuf:[B
    :catch_0
    move-exception v6

    .line 335
    .local v6, noMemory:Ljava/lang/OutOfMemoryError;
    const/4 v4, 0x0

    .line 342
    .end local v6           #noMemory:Ljava/lang/OutOfMemoryError;
    :cond_0
    return-object v4
.end method

.method private doClose()V
    .locals 2

    .prologue
    .line 625
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readLock:Ljava/lang/Object;

    monitor-enter v1

    .line 626
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 628
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 634
    :goto_0
    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    .line 636
    :cond_0
    monitor-exit v1

    .line 637
    return-void

    .line 636
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 629
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private doOpen()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 598
    :try_start_0
    iget-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid:Z

    if-eqz v2, :cond_0

    .line 599
    new-instance v2, Lorg/eclipse/jgit/errors/PackInvalidException;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/PackInvalidException;-><init>(Ljava/io/File;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    .line 605
    :catch_0
    move-exception v0

    .line 606
    .local v0, ioe:Ljava/io/IOException;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->openFail()V

    .line 607
    throw v0

    .line 600
    .end local v0           #ioe:Ljava/io/IOException;
    :cond_0
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_2

    .line 601
    :try_start_2
    new-instance v2, Ljava/io/RandomAccessFile;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    const-string v5, "r"

    invoke-direct {v2, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    .line 602
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    .line 603
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->onOpenPack()V

    .line 604
    monitor-exit v3

    .line 615
    return-void

    .line 604
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v2
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_2

    .line 608
    :catch_1
    move-exception v1

    .line 609
    .local v1, re:Ljava/lang/RuntimeException;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->openFail()V

    .line 610
    throw v1

    .line 611
    .end local v1           #re:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v1

    .line 612
    .local v1, re:Ljava/lang/Error;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->openFail()V

    .line 613
    throw v1
.end method

.method private declared-synchronized endCopyAsIs()V
    .locals 1

    .prologue
    .line 576
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeCopyRawData:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeCopyRawData:I

    if-nez v0, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeWindows:I

    if-nez v0, :cond_0

    .line 577
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->doClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 578
    :cond_0
    monitor-exit p0

    return-void

    .line 576
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private extFile(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/io/File;
    .locals 7
    .parameter "ext"

    .prologue
    const/16 v6, 0x2e

    .line 1098
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1099
    .local v2, p:Ljava/lang/String;
    invoke-virtual {v2, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 1100
    .local v1, dot:I
    if-gez v1, :cond_0

    move-object v0, v2

    .line 1101
    .local v0, b:Ljava/lang/String;
    :goto_0
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v3

    .line 1100
    .end local v0           #b:Ljava/lang/String;
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private findDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)J
    .locals 4
    .parameter "baseId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 849
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 850
    .local v0, ofs:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    .line 851
    new-instance v2, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->missingDeltaBase:Ljava/lang/String;

    invoke-direct {v2, p1, v3}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v2

    .line 853
    :cond_0
    return-wide v0
.end method

.method private findEndOffset(J)J
    .locals 6
    .parameter "startOffset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 1046
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    const-wide/16 v4, 0x14

    sub-long v0, v2, v4

    .line 1047
    .local v0, maxOffset:J
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getReverseIdx()Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    move-result-object v2

    invoke-virtual {v2, p1, p2, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->findNextOffset(JJ)J

    move-result-wide v2

    return-wide v2
.end method

.method private declared-synchronized getReverseIdx()Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1067
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->reverseIdx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    if-nez v0, :cond_0

    .line 1068
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->reverseIdx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    .line 1069
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->reverseIdx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 1067
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private hasExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Z
    .locals 2
    .parameter "ext"

    .prologue
    .line 1105
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->extensions:I

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private declared-synchronized idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->loadedIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    if-nez v2, :cond_2

    .line 166
    iget-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid:Z

    if-eqz v2, :cond_0

    .line 167
    new-instance v2, Lorg/eclipse/jgit/errors/PackInvalidException;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/PackInvalidException;-><init>(Ljava/io/File;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 170
    :cond_0
    :try_start_1
    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->extFile(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->open(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    .line 172
    .local v1, idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packChecksum:[B

    if-nez v2, :cond_3

    .line 173
    iget-object v2, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->packChecksum:[B

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packChecksum:[B

    .line 177
    :cond_1
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->loadedIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 183
    .end local v1           #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :cond_2
    :try_start_2
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->loadedIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v2

    .line 174
    .restart local v1       #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :cond_3
    :try_start_3
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packChecksum:[B

    iget-object v3, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->packChecksum:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_1

    .line 175
    new-instance v2, Lorg/eclipse/jgit/errors/PackMismatchException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packChecksumMismatch:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/PackMismatchException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 178
    .end local v1           #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :catch_0
    move-exception v0

    .line 179
    .local v0, e:Ljava/io/IOException;
    const/4 v2, 0x1

    :try_start_4
    iput-boolean v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid:Z

    .line 180
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method private isCorrupt(J)Z
    .locals 2
    .parameter "offset"

    .prologue
    .line 1073
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;

    .line 1074
    .local v0, list:Lorg/eclipse/jgit/util/LongList;
    if-nez v0, :cond_0

    .line 1075
    const/4 v1, 0x0

    .line 1077
    :goto_0
    return v1

    .line 1076
    :cond_0
    monitor-enter v0

    .line 1077
    :try_start_0
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/util/LongList;->contains(J)Z

    move-result v1

    monitor-exit v0

    goto :goto_0

    .line 1078
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private onOpenPack()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    const/4 v14, 0x3

    const/4 v13, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 675
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    .line 676
    .local v1, idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    const/16 v6, 0x14

    new-array v0, v6, [B

    .line 678
    .local v0, buf:[B
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    const-wide/16 v7, 0x0

    invoke-virtual {v6, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 679
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    const/16 v7, 0xc

    invoke-virtual {v6, v0, v11, v7}, Ljava/io/RandomAccessFile;->readFully([BII)V

    .line 680
    sget-object v6, Lorg/eclipse/jgit/lib/Constants;->PACK_SIGNATURE:[B

    invoke-static {v0, v11, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v6

    if-eq v6, v9, :cond_0

    .line 681
    new-instance v6, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->notAPACKFile:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 682
    :cond_0
    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v4

    .line 683
    .local v4, vers:J
    const/16 v6, 0x8

    invoke-static {v0, v6}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v2

    .line 684
    .local v2, packCnt:J
    const-wide/16 v6, 0x2

    cmp-long v6, v4, v6

    if-eqz v6, :cond_1

    const-wide/16 v6, 0x3

    cmp-long v6, v4, v6

    if-eqz v6, :cond_1

    .line 685
    new-instance v6, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->unsupportedPackVersion:Ljava/lang/String;

    new-array v8, v12, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 688
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v6

    cmp-long v6, v2, v6

    if-eqz v6, :cond_2

    .line 689
    new-instance v6, Lorg/eclipse/jgit/errors/PackMismatchException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->packObjectCountMismatch:Ljava/lang/String;

    new-array v8, v14, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v9

    aput-object v9, v8, v13

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/PackMismatchException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 694
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    iget-wide v7, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    const-wide/16 v9, 0x14

    sub-long/2addr v7, v9

    invoke-virtual {v6, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 695
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    const/16 v7, 0x14

    invoke-virtual {v6, v0, v11, v7}, Ljava/io/RandomAccessFile;->readFully([BII)V

    .line 696
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packChecksum:[B

    invoke-static {v0, v6}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v6

    if-nez v6, :cond_3

    .line 697
    new-instance v6, Lorg/eclipse/jgit/errors/PackMismatchException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->packObjectCountMismatch:Ljava/lang/String;

    new-array v8, v14, [Ljava/lang/Object;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v9

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    iget-object v9, v1, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->packChecksum:[B

    invoke-static {v9}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v9

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v9

    aput-object v9, v8, v13

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/PackMismatchException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 702
    :cond_3
    return-void
.end method

.method private openFail()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 618
    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeWindows:I

    .line 619
    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeCopyRawData:I

    .line 620
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid:Z

    .line 621
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->doClose()V

    .line 622
    return-void
.end method

.method private readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 7
    .parameter "position"
    .parameter "dstbuf"
    .parameter "dstoff"
    .parameter "cnt"
    .parameter "curs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 556
    move-object v0, p6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->copy(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BII)I

    move-result v0

    if-eq v0, p5, :cond_0

    .line 557
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 558
    :cond_0
    return-void
.end method

.method private setCorrupt(J)V
    .locals 4
    .parameter "offset"

    .prologue
    .line 1082
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;

    .line 1083
    .local v0, list:Lorg/eclipse/jgit/util/LongList;
    if-nez v0, :cond_1

    .line 1084
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1085
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;

    .line 1086
    if-nez v0, :cond_0

    .line 1087
    new-instance v1, Lorg/eclipse/jgit/util/LongList;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/LongList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1088
    .end local v0           #list:Lorg/eclipse/jgit/util/LongList;
    .local v1, list:Lorg/eclipse/jgit/util/LongList;
    :try_start_1
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-object v0, v1

    .line 1090
    .end local v1           #list:Lorg/eclipse/jgit/util/LongList;
    .restart local v0       #list:Lorg/eclipse/jgit/util/LongList;
    :cond_0
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1092
    :cond_1
    monitor-enter v0

    .line 1093
    :try_start_3
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/util/LongList;->add(J)V

    .line 1094
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1095
    return-void

    .line 1090
    :catchall_0
    move-exception v2

    :goto_0
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2

    .line 1094
    :catchall_1
    move-exception v2

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v2

    .line 1090
    .end local v0           #list:Lorg/eclipse/jgit/util/LongList;
    .restart local v1       #list:Lorg/eclipse/jgit/util/LongList;
    :catchall_2
    move-exception v2

    move-object v0, v1

    .end local v1           #list:Lorg/eclipse/jgit/util/LongList;
    .restart local v0       #list:Lorg/eclipse/jgit/util/LongList;
    goto :goto_0
.end method


# virtual methods
.method declared-synchronized beginWindowCache()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 581
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeWindows:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeWindows:I

    if-ne v1, v0, :cond_1

    .line 582
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeCopyRawData:I

    if-nez v1, :cond_0

    .line 583
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->doOpen()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 586
    :cond_0
    :goto_0
    monitor-exit p0

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 581
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 269
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->purge(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 270
    monitor-enter p0

    .line 271
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->loadedIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    .line 272
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->reverseIdx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    .line 273
    monitor-exit p0

    .line 274
    return-void

    .line 273
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method final copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 1
    .parameter "out"
    .parameter "src"
    .parameter "validate"
    .parameter "curs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
        }
    .end annotation

    .prologue
    .line 355
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->beginCopyAsIs(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 357
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->copyAsIs2(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 359
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->endCopyAsIs()V

    .line 361
    return-void

    .line 359
    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->endCopyAsIs()V

    throw v0
.end method

.method copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 6
    .parameter "out"
    .parameter "validate"
    .parameter "curs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    const-wide/16 v0, 0x0

    invoke-virtual {p3, p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 349
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    move-object v0, p3

    move-object v1, p0

    move v4, p2

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->copyPackAsIs(Lorg/eclipse/jgit/internal/storage/file/PackFile;JZLorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V

    .line 350
    return-void
.end method

.method declared-synchronized endWindowCache()Z
    .locals 2

    .prologue
    .line 590
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeWindows:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeWindows:I

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 591
    .local v0, r:Z
    :goto_0
    if-eqz v0, :cond_0

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->activeCopyRawData:I

    if-nez v1, :cond_0

    .line 592
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->doClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 593
    :cond_0
    monitor-exit p0

    return v0

    .line 590
    .end local v0           #r:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method findObjectForOffset(J)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 319
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getReverseIdx()Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->findObject(J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method get(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 4
    .parameter "curs"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 257
    .local v0, offset:J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->isCorrupt(J)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->load(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;J)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method declared-synchronized getBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1051
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalidBitmap:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 1052
    :cond_0
    const/4 v1, 0x0

    .line 1063
    :goto_0
    monitor-exit p0

    return-object v1

    .line 1053
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->bitmapIdx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    if-nez v1, :cond_2

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->hasExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1054
    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->extFile(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/io/File;

    move-result-object v1

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getReverseIdx()Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->open(Ljava/io/File;Lorg/eclipse/jgit/internal/storage/file/PackIndex;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v0

    .line 1058
    .local v0, idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packChecksum:[B

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->packChecksum:[B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1059
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->bitmapIdx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    .line 1063
    .end local v0           #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :cond_2
    :goto_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->bitmapIdx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    goto :goto_0

    .line 1061
    .restart local v0       #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalidBitmap:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1051
    .end local v0           #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method getDeltaHeader(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;J)[B
    .locals 6
    .parameter "wc"
    .parameter "pos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    .line 888
    const/16 v0, 0x12

    new-array v4, v0, [B

    .line 889
    .local v4, hdr:[B
    const/4 v5, 0x0

    move-object v0, p1

    move-object v1, p0

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inflate(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BI)I

    .line 890
    return-object v4
.end method

.method public getIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    return-object v0
.end method

.method getObjectCount()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 305
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v0

    return-wide v0
.end method

.method getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;J)J
    .locals 19
    .parameter "curs"
    .parameter "pos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 948
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->tempId:[B

    .line 949
    .local v5, ib:[B
    const/4 v6, 0x0

    const/16 v7, 0x14

    move-object/from16 v2, p0

    move-wide/from16 v3, p2

    move-object/from16 v8, p1

    invoke-direct/range {v2 .. v8}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 950
    const/4 v2, 0x0

    aget-byte v2, v5, v2

    and-int/lit16 v9, v2, 0xff

    .line 951
    .local v9, c:I
    shr-int/lit8 v2, v9, 0x4

    and-int/lit8 v18, v2, 0x7

    .line 952
    .local v18, type:I
    and-int/lit8 v2, v9, 0xf

    int-to-long v0, v2

    move-wide/from16 v16, v0

    .line 953
    .local v16, sz:J
    const/4 v15, 0x4

    .line 954
    .local v15, shift:I
    const/4 v13, 0x1

    .local v13, p:I
    move v14, v13

    .line 955
    .end local v13           #p:I
    .local v14, p:I
    :goto_0
    and-int/lit16 v2, v9, 0x80

    if-eqz v2, :cond_0

    .line 956
    add-int/lit8 v13, v14, 0x1

    .end local v14           #p:I
    .restart local v13       #p:I
    aget-byte v2, v5, v14

    and-int/lit16 v9, v2, 0xff

    .line 957
    and-int/lit8 v2, v9, 0x7f

    int-to-long v2, v2

    shl-long/2addr v2, v15

    add-long v16, v16, v2

    .line 958
    add-int/lit8 v15, v15, 0x7

    move v14, v13

    .end local v13           #p:I
    .restart local v14       #p:I
    goto :goto_0

    .line 962
    :cond_0
    packed-switch v18, :pswitch_data_0

    .line 981
    :pswitch_0
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_1
    move v13, v14

    .line 986
    .end local v14           #p:I
    .end local v16           #sz:J
    .restart local v13       #p:I
    :goto_1
    return-wide v16

    .line 970
    .end local v13           #p:I
    .restart local v14       #p:I
    .restart local v16       #sz:J
    :pswitch_2
    add-int/lit8 v13, v14, 0x1

    .end local v14           #p:I
    .restart local v13       #p:I
    aget-byte v2, v5, v14

    and-int/lit16 v9, v2, 0xff

    move v14, v13

    .line 971
    .end local v13           #p:I
    .restart local v14       #p:I
    :goto_2
    and-int/lit16 v2, v9, 0x80

    if-eqz v2, :cond_1

    .line 972
    add-int/lit8 v13, v14, 0x1

    .end local v14           #p:I
    .restart local v13       #p:I
    aget-byte v2, v5, v14

    and-int/lit16 v9, v2, 0xff

    move v14, v13

    .end local v13           #p:I
    .restart local v14       #p:I
    goto :goto_2

    .line 973
    :cond_1
    int-to-long v2, v14

    add-long v10, p2, v2

    .local v10, deltaAt:J
    move v13, v14

    .line 986
    .end local v14           #p:I
    .restart local v13       #p:I
    :goto_3
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10, v11}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getDeltaHeader(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;J)[B

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->getResultSize([B)J
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v16

    goto :goto_1

    .line 977
    .end local v10           #deltaAt:J
    .end local v13           #p:I
    .restart local v14       #p:I
    :pswitch_3
    int-to-long v2, v14

    add-long v2, v2, p2

    const-wide/16 v6, 0x14

    add-long v10, v2, v6

    .restart local v10       #deltaAt:J
    move v13, v14

    .line 978
    .end local v14           #p:I
    .restart local v13       #p:I
    goto :goto_3

    .line 987
    :catch_0
    move-exception v12

    .line 988
    .local v12, e:Ljava/util/zip/DataFormatException;
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 962
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 4
    .parameter "curs"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 942
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 943
    .local v0, offset:J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;J)J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method getObjectType(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;J)I
    .locals 13
    .parameter "curs"
    .parameter "pos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 894
    iget-object v3, p1, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->tempId:[B

    .line 896
    .local v3, ib:[B
    :goto_0
    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object v0, p0

    move-wide v1, p2

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 897
    const/4 v0, 0x0

    aget-byte v0, v3, v0

    and-int/lit16 v7, v0, 0xff

    .line 898
    .local v7, c:I
    shr-int/lit8 v0, v7, 0x4

    and-int/lit8 v12, v0, 0x7

    .line 900
    .local v12, type:I
    packed-switch v12, :pswitch_data_0

    .line 933
    :pswitch_0
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 908
    :pswitch_1
    const/4 v10, 0x1

    .local v10, p:I
    move v11, v10

    .line 909
    .end local v10           #p:I
    .local v11, p:I
    :goto_1
    and-int/lit16 v0, v7, 0x80

    if-eqz v0, :cond_0

    .line 910
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    move v11, v10

    .end local v10           #p:I
    .restart local v11       #p:I
    goto :goto_1

    .line 911
    :cond_0
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    .line 912
    and-int/lit8 v0, v7, 0x7f

    int-to-long v8, v0

    .local v8, ofs:J
    move v11, v10

    .line 913
    .end local v10           #p:I
    .restart local v11       #p:I
    :goto_2
    and-int/lit16 v0, v7, 0x80

    if-eqz v0, :cond_1

    .line 914
    const-wide/16 v0, 0x1

    add-long/2addr v8, v0

    .line 915
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    .line 916
    const/4 v0, 0x7

    shl-long/2addr v8, v0

    .line 917
    and-int/lit8 v0, v7, 0x7f

    int-to-long v0, v0

    add-long/2addr v8, v0

    move v11, v10

    .end local v10           #p:I
    .restart local v11       #p:I
    goto :goto_2

    .line 919
    :cond_1
    sub-long/2addr p2, v8

    .line 920
    goto :goto_0

    .line 924
    .end local v8           #ofs:J
    .end local v11           #p:I
    :pswitch_2
    const/4 v10, 0x1

    .restart local v10       #p:I
    move v11, v10

    .line 925
    .end local v10           #p:I
    .restart local v11       #p:I
    :goto_3
    and-int/lit16 v0, v7, 0x80

    if-eqz v0, :cond_2

    .line 926
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    move v11, v10

    .end local v10           #p:I
    .restart local v11       #p:I
    goto :goto_3

    .line 927
    :cond_2
    int-to-long v0, v11

    add-long v1, p2, v0

    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object v0, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 928
    invoke-static {v3}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->findDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)J

    move-result-wide p2

    .line 929
    goto :goto_0

    .line 905
    .end local v11           #p:I
    :pswitch_3
    return v12

    .line 900
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getPackFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    return-object v0
.end method

.method public getPackName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 201
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packName:Ljava/lang/String;

    .line 202
    .local v0, name:Ljava/lang/String;
    if-nez v0, :cond_2

    .line 203
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 204
    const-string v1, "pack-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 205
    const-string v1, "pack-"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 206
    :cond_0
    const-string v1, ".pack"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 207
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, ".pack"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 208
    :cond_1
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packName:Ljava/lang/String;

    .line 210
    :cond_2
    return-object v0
.end method

.method public hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 4
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 228
    .local v0, offset:J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->isCorrupt(J)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method invalid()Z
    .locals 1

    .prologue
    .line 546
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid:Z

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
    .line 290
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 292
    :goto_0
    return-object v1

    .line 291
    :catch_0
    move-exception v0

    .line 292
    .local v0, e:Ljava/io/IOException;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    goto :goto_0
.end method

.method load(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;J)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 42
    .parameter "curs"
    .parameter "pos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/LargeObjectException;
        }
    .end annotation

    .prologue
    .line 707
    :try_start_0
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->tempId:[B

    .line 708
    .local v6, ib:[B
    const/4 v14, 0x0

    .line 709
    .local v14, delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    const/16 v34, 0x0

    .line 710
    .local v34, data:[B
    const/16 v41, -0x1

    .line 711
    .local v41, type:I
    const/16 v31, 0x0

    .local v31, cached:Z
    move-object/from16 v35, v14

    .line 714
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .local v35, delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    :goto_0
    const/4 v7, 0x0

    const/16 v8, 0x14

    move-object/from16 v3, p0

    move-wide/from16 v4, p2

    move-object/from16 v9, p1

    invoke-direct/range {v3 .. v9}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 715
    const/4 v3, 0x0

    aget-byte v3, v6, v3

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 716
    .local v30, c:I
    shr-int/lit8 v3, v30, 0x4

    and-int/lit8 v8, v3, 0x7

    .line 717
    .local v8, typeCode:I
    and-int/lit8 v3, v30, 0xf

    int-to-long v9, v3

    .line 718
    .local v9, sz:J
    const/16 v39, 0x4

    .line 719
    .local v39, shift:I
    const/4 v13, 0x1

    .line 720
    .local v13, p:I
    :goto_1
    move/from16 v0, v30

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_0

    .line 721
    add-int/lit8 v19, v13, 0x1

    .end local v13           #p:I
    .local v19, p:I
    aget-byte v3, v6, v13

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 722
    and-int/lit8 v3, v30, 0x7f

    int-to-long v3, v3

    shl-long v3, v3, v39

    add-long/2addr v9, v3

    .line 723
    add-int/lit8 v39, v39, 0x7

    move/from16 v13, v19

    .end local v19           #p:I
    .restart local v13       #p:I
    goto :goto_1

    .line 726
    :cond_0
    packed-switch v8, :pswitch_data_0

    .line 790
    :pswitch_0
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v5, v7

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 837
    .end local v6           #ib:[B
    .end local v8           #typeCode:I
    .end local v9           #sz:J
    .end local v13           #p:I
    .end local v30           #c:I
    .end local v31           #cached:Z
    .end local v34           #data:[B
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .end local v39           #shift:I
    .end local v41           #type:I
    :catch_0
    move-exception v36

    .line 838
    .local v36, dfe:Ljava/util/zip/DataFormatException;
    new-instance v33, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v4, v5

    const/4 v5, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v33

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    .line 842
    .local v33, coe:Lorg/eclipse/jgit/errors/CorruptObjectException;
    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 843
    throw v33

    .line 731
    .end local v33           #coe:Lorg/eclipse/jgit/errors/CorruptObjectException;
    .end local v36           #dfe:Ljava/util/zip/DataFormatException;
    .restart local v6       #ib:[B
    .restart local v8       #typeCode:I
    .restart local v9       #sz:J
    .restart local v13       #p:I
    .restart local v30       #c:I
    .restart local v31       #cached:Z
    .restart local v34       #data:[B
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v39       #shift:I
    .restart local v41       #type:I
    :pswitch_1
    if-nez v35, :cond_1

    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->getStreamFileThreshold()I

    move-result v3

    int-to-long v3, v3

    cmp-long v3, v9, v3

    if-gez v3, :cond_e

    .line 732
    :cond_1
    int-to-long v3, v13

    add-long v3, v3, p2

    long-to-int v5, v9

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v4, v5, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->decompress(JILorg/eclipse/jgit/internal/storage/file/WindowCursor;)[B

    move-result-object v26

    .line 734
    .end local v34           #data:[B
    .local v26, data:[B
    :goto_2
    if-eqz v35, :cond_2

    .line 735
    move/from16 v27, v8

    .end local v41           #type:I
    .local v27, type:I
    move-object/from16 v14, v35

    .line 799
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    :goto_3
    if-nez v26, :cond_9

    .line 800
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->inMemoryBufferLimitExceeded:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 739
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .end local v27           #type:I
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v41       #type:I
    :cond_2
    if-eqz v26, :cond_3

    .line 740
    new-instance v7, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;

    move-object/from16 v0, v26

    invoke-direct {v7, v8, v0}, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;-><init>(I[B)V

    move/from16 v27, v41

    .end local v41           #type:I
    .restart local v27       #type:I
    move-object/from16 v14, v35

    .line 835
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    :goto_4
    return-object v7

    .line 742
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .end local v27           #type:I
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v41       #type:I
    :cond_3
    new-instance v7, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;

    move-object/from16 v0, p1

    iget-object v15, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    move-wide/from16 v11, p2

    move-object/from16 v14, p0

    invoke-direct/range {v7 .. v15}, Lorg/eclipse/jgit/internal/storage/file/LargePackedWholeObject;-><init>(IJJILorg/eclipse/jgit/internal/storage/file/PackFile;Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V

    move/from16 v27, v41

    .end local v41           #type:I
    .restart local v27       #type:I
    move-object/from16 v14, v35

    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    goto :goto_4

    .line 747
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .end local v26           #data:[B
    .end local v27           #type:I
    .restart local v34       #data:[B
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v41       #type:I
    :pswitch_2
    add-int/lit8 v19, v13, 0x1

    .end local v13           #p:I
    .restart local v19       #p:I
    aget-byte v3, v6, v13

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 748
    and-int/lit8 v3, v30, 0x7f

    int-to-long v0, v3

    move-wide/from16 v20, v0

    .line 749
    .local v20, base:J
    :goto_5
    move/from16 v0, v30

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_4

    .line 750
    const-wide/16 v3, 0x1

    add-long v20, v20, v3

    .line 751
    add-int/lit8 v13, v19, 0x1

    .end local v19           #p:I
    .restart local v13       #p:I
    aget-byte v3, v6, v19

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 752
    const/4 v3, 0x7

    shl-long v20, v20, v3

    .line 753
    and-int/lit8 v3, v30, 0x7f

    int-to-long v3, v3

    add-long v20, v20, v3

    move/from16 v19, v13

    .end local v13           #p:I
    .restart local v19       #p:I
    goto :goto_5

    .line 755
    :cond_4
    sub-long v20, p2, v20

    .line 756
    new-instance v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;

    long-to-int v0, v9

    move/from16 v18, v0

    move-object/from16 v15, v35

    move-wide/from16 v16, p2

    invoke-direct/range {v14 .. v21}, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;JIIJ)V

    .line 757
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    iget v3, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->deltaSize:I

    int-to-long v3, v3

    cmp-long v3, v9, v3

    if-eqz v3, :cond_5

    move/from16 v13, v19

    .end local v19           #p:I
    .restart local v13       #p:I
    move/from16 v27, v41

    .end local v41           #type:I
    .restart local v27       #type:I
    move-object/from16 v26, v34

    .line 758
    .end local v34           #data:[B
    .restart local v26       #data:[B
    goto :goto_3

    .line 760
    .end local v13           #p:I
    .end local v26           #data:[B
    .end local v27           #type:I
    .restart local v19       #p:I
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    move-result-object v3

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-virtual {v3, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->get(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;

    move-result-object v37

    .line 761
    .local v37, e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;
    if-eqz v37, :cond_6

    .line 762
    move-object/from16 v0, v37

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;->type:I

    move/from16 v27, v0

    .line 763
    .end local v41           #type:I
    .restart local v27       #type:I
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;->data:[B

    move-object/from16 v26, v0

    .line 764
    .end local v34           #data:[B
    .restart local v26       #data:[B
    const/16 v31, 0x1

    move/from16 v13, v19

    .line 765
    .end local v19           #p:I
    .restart local v13       #p:I
    goto/16 :goto_3

    .line 767
    .end local v13           #p:I
    .end local v26           #data:[B
    .end local v27           #type:I
    .restart local v19       #p:I
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_6
    move-wide/from16 p2, v20

    move-object/from16 v35, v14

    .line 768
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    goto/16 :goto_0

    .line 772
    .end local v19           #p:I
    .end local v20           #base:J
    .end local v37           #e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;
    .restart local v13       #p:I
    :pswitch_3
    int-to-long v3, v13

    add-long v23, p2, v3

    const/16 v26, 0x0

    const/16 v27, 0x14

    move-object/from16 v22, p0

    move-object/from16 v25, v6

    move-object/from16 v28, p1

    invoke-direct/range {v22 .. v28}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 773
    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->findDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)J

    move-result-wide v20

    .line 774
    .restart local v20       #base:J
    new-instance v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;

    long-to-int v0, v9

    move/from16 v26, v0

    add-int/lit8 v27, v13, 0x14

    move-object/from16 v22, v14

    move-object/from16 v23, v35

    move-wide/from16 v24, p2

    move-wide/from16 v28, v20

    invoke-direct/range {v22 .. v29}, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;JIIJ)V

    .line 775
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    iget v3, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->deltaSize:I

    int-to-long v3, v3

    cmp-long v3, v9, v3

    if-eqz v3, :cond_7

    move/from16 v27, v41

    .end local v41           #type:I
    .restart local v27       #type:I
    move-object/from16 v26, v34

    .line 776
    .end local v34           #data:[B
    .restart local v26       #data:[B
    goto/16 :goto_3

    .line 778
    .end local v26           #data:[B
    .end local v27           #type:I
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    move-result-object v3

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-virtual {v3, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->get(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;

    move-result-object v37

    .line 779
    .restart local v37       #e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;
    if-eqz v37, :cond_8

    .line 780
    move-object/from16 v0, v37

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;->type:I

    move/from16 v27, v0

    .line 781
    .end local v41           #type:I
    .restart local v27       #type:I
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;->data:[B

    move-object/from16 v26, v0

    .line 782
    .end local v34           #data:[B
    .restart local v26       #data:[B
    const/16 v31, 0x1

    .line 783
    goto/16 :goto_3

    .line 785
    .end local v26           #data:[B
    .end local v27           #type:I
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_8
    move-wide/from16 p2, v20

    move-object/from16 v35, v14

    .line 786
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    goto/16 :goto_0

    .line 804
    .end local v20           #base:J
    .end local v34           #data:[B
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .end local v37           #e:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache$Entry;
    .end local v41           #type:I
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v26       #data:[B
    .restart local v27       #type:I
    :cond_9
    if-eqz v31, :cond_b

    .line 805
    const/16 v31, 0x0

    .line 809
    :cond_a
    :goto_6
    iget-wide v0, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->deltaPos:J

    move-wide/from16 p2, v0

    .line 811
    iget v3, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->hdrLen:I

    int-to-long v3, v3

    add-long v3, v3, p2

    iget v5, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->deltaSize:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v4, v5, v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->decompress(JILorg/eclipse/jgit/internal/storage/file/WindowCursor;)[B

    move-result-object v32

    .line 813
    .local v32, cmds:[B
    if-nez v32, :cond_c

    .line 814
    const/16 v26, 0x0

    .line 815
    new-instance v3, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;

    new-instance v4, Ljava/lang/OutOfMemoryError;

    invoke-direct {v4}, Ljava/lang/OutOfMemoryError;-><init>()V

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;-><init>(Ljava/lang/OutOfMemoryError;)V

    throw v3

    .line 806
    .end local v32           #cmds:[B
    :cond_b
    iget-object v3, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->next:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;

    if-nez v3, :cond_a

    .line 807
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    move-result-object v22

    iget-wide v0, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->basePos:J

    move-wide/from16 v24, v0

    move-object/from16 v23, p0

    invoke-virtual/range {v22 .. v27}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;->store(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BI)V

    goto :goto_6

    .line 818
    .restart local v32       #cmds:[B
    :cond_c
    invoke-static/range {v32 .. v32}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->getResultSize([B)J

    move-result-wide v9

    .line 819
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v3, v9

    if-gtz v3, :cond_d

    .line 820
    new-instance v3, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;

    invoke-direct {v3}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;-><init>()V

    throw v3
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 824
    :cond_d
    long-to-int v3, v9

    :try_start_2
    new-array v0, v3, [B

    move-object/from16 v38, v0
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 830
    .local v38, result:[B
    :try_start_3
    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v38

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->apply([B[B[B)[B

    .line 831
    move-object/from16 v26, v38

    .line 832
    iget-object v14, v14, Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;->next:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;

    .line 833
    if-nez v14, :cond_9

    .line 835
    new-instance v7, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;

    move/from16 v0, v27

    move-object/from16 v1, v26

    invoke-direct {v7, v0, v1}, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;-><init>(I[B)V

    goto/16 :goto_4

    .line 825
    .end local v38           #result:[B
    :catch_1
    move-exception v40

    .line 826
    .local v40, tooBig:Ljava/lang/OutOfMemoryError;
    const/16 v26, 0x0

    .line 827
    new-instance v3, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;

    move-object/from16 v0, v40

    invoke-direct {v3, v0}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;-><init>(Ljava/lang/OutOfMemoryError;)V

    throw v3
    :try_end_3
    .catch Ljava/util/zip/DataFormatException; {:try_start_3 .. :try_end_3} :catch_0

    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .end local v26           #data:[B
    .end local v27           #type:I
    .end local v32           #cmds:[B
    .end local v40           #tooBig:Ljava/lang/OutOfMemoryError;
    .restart local v34       #data:[B
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/file/PackFile$Delta;
    .restart local v41       #type:I
    :cond_e
    move-object/from16 v26, v34

    .end local v34           #data:[B
    .restart local v26       #data:[B
    goto/16 :goto_2

    .line 726
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method mmap(JI)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    .locals 9
    .parameter "pos"
    .parameter "size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 651
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readLock:Ljava/lang/Object;

    monitor-enter v8

    .line 652
    :try_start_0
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    int-to-long v2, p3

    add-long/2addr v2, p1

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 653
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long/2addr v0, p1

    long-to-int p3, v0

    .line 657
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    int-to-long v4, p3

    move-wide v2, p1

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v7

    .line 668
    .local v7, map:Ljava/nio/MappedByteBuffer;
    :goto_0
    :try_start_2
    invoke-virtual {v7}, Ljava/nio/MappedByteBuffer;->hasArray()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 669
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;

    invoke-virtual {v7}, Ljava/nio/MappedByteBuffer;->array()[B

    move-result-object v1

    invoke-direct {v0, p0, p1, p2, v1}, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[B)V

    monitor-exit v8

    .line 670
    :goto_1
    return-object v0

    .line 658
    .end local v7           #map:Ljava/nio/MappedByteBuffer;
    :catch_0
    move-exception v6

    .line 663
    .local v6, ioe1:Ljava/io/IOException;
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 664
    invoke-static {}, Ljava/lang/System;->runFinalization()V

    .line 665
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    int-to-long v4, p3

    move-wide v2, p1

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v7

    .restart local v7       #map:Ljava/nio/MappedByteBuffer;
    goto :goto_0

    .line 670
    .end local v6           #ioe1:Ljava/io/IOException;
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;

    invoke-direct {v0, p0, p1, p2, v7}, Lorg/eclipse/jgit/internal/storage/file/ByteBufferWindow;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLjava/nio/ByteBuffer;)V

    monitor-exit v8

    goto :goto_1

    .line 671
    .end local v7           #map:Ljava/nio/MappedByteBuffer;
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method read(JI)Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    .locals 7
    .parameter "pos"
    .parameter "size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 640
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readLock:Ljava/lang/Object;

    monitor-enter v2

    .line 641
    :try_start_0
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    int-to-long v5, p3

    add-long/2addr v5, p1

    cmp-long v1, v3, v5

    if-gez v1, :cond_0

    .line 642
    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    sub-long/2addr v3, p1

    long-to-int p3, v3

    .line 643
    :cond_0
    new-array v0, p3, [B

    .line 644
    .local v0, buf:[B
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 645
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->fd:Ljava/io/RandomAccessFile;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, p3}, Ljava/io/RandomAccessFile;->readFully([BII)V

    .line 646
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;

    invoke-direct {v1, p0, p1, p2, v0}, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[B)V

    monitor-exit v2

    return-object v1

    .line 647
    .end local v0           #buf:[B
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method representation(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    .locals 25
    .parameter "curs"
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 996
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v2

    .line 997
    .local v2, pos:J
    const-wide/16 v5, 0x0

    cmp-long v1, v2, v5

    if-gez v1, :cond_0

    .line 998
    const/4 v1, 0x0

    .line 1034
    :goto_0
    return-object v1

    .line 1000
    :cond_0
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->tempId:[B

    .line 1001
    .local v4, ib:[B
    const/4 v5, 0x0

    const/16 v6, 0x14

    move-object/from16 v1, p0

    move-object/from16 v7, p1

    invoke-direct/range {v1 .. v7}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 1002
    const/4 v1, 0x0

    aget-byte v1, v4, v1

    and-int/lit16 v0, v1, 0xff

    move/from16 v19, v0

    .line 1003
    .local v19, c:I
    const/16 v22, 0x1

    .line 1004
    .local v22, p:I
    shr-int/lit8 v1, v19, 0x4

    and-int/lit8 v24, v1, 0x7

    .local v24, typeCode:I
    move/from16 v23, v22

    .line 1005
    .end local v22           #p:I
    .local v23, p:I
    :goto_1
    move/from16 v0, v19

    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_1

    .line 1006
    add-int/lit8 v22, v23, 0x1

    .end local v23           #p:I
    .restart local v22       #p:I
    aget-byte v1, v4, v23

    and-int/lit16 v0, v1, 0xff

    move/from16 v19, v0

    move/from16 v23, v22

    .end local v22           #p:I
    .restart local v23       #p:I
    goto :goto_1

    .line 1008
    :cond_1
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->findEndOffset(J)J

    move-result-wide v5

    sub-long v20, v5, v2

    .line 1009
    .local v20, len:J
    packed-switch v24, :pswitch_data_0

    .line 1038
    :pswitch_0
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1014
    :pswitch_1
    move/from16 v0, v23

    int-to-long v5, v0

    sub-long v5, v20, v5

    move-object/from16 v0, p0

    invoke-static {v0, v2, v3, v5, v6}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->newWhole(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJ)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;

    move-result-object v1

    goto :goto_0

    .line 1017
    :pswitch_2
    add-int/lit8 v22, v23, 0x1

    .end local v23           #p:I
    .restart local v22       #p:I
    aget-byte v1, v4, v23

    and-int/lit16 v0, v1, 0xff

    move/from16 v19, v0

    .line 1018
    and-int/lit8 v1, v19, 0x7f

    int-to-long v10, v1

    .local v10, ofs:J
    move/from16 v23, v22

    .line 1019
    .end local v22           #p:I
    .restart local v23       #p:I
    :goto_2
    move/from16 v0, v19

    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_2

    .line 1020
    const-wide/16 v5, 0x1

    add-long/2addr v10, v5

    .line 1021
    add-int/lit8 v22, v23, 0x1

    .end local v23           #p:I
    .restart local v22       #p:I
    aget-byte v1, v4, v23

    and-int/lit16 v0, v1, 0xff

    move/from16 v19, v0

    .line 1022
    const/4 v1, 0x7

    shl-long/2addr v10, v1

    .line 1023
    and-int/lit8 v1, v19, 0x7f

    int-to-long v5, v1

    add-long/2addr v10, v5

    move/from16 v23, v22

    .end local v22           #p:I
    .restart local v23       #p:I
    goto :goto_2

    .line 1025
    :cond_2
    sub-long v10, v2, v10

    .line 1026
    move/from16 v0, v23

    int-to-long v5, v0

    sub-long v8, v20, v5

    move-object/from16 v5, p0

    move-wide v6, v2

    invoke-static/range {v5 .. v11}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->newDelta(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJJ)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;

    move-result-object v1

    goto/16 :goto_0

    .line 1030
    .end local v10           #ofs:J
    :pswitch_3
    move/from16 v0, v23

    int-to-long v5, v0

    sub-long v20, v20, v5

    .line 1031
    const-wide/16 v5, 0x14

    sub-long v20, v20, v5

    .line 1032
    move/from16 v0, v23

    int-to-long v5, v0

    add-long v13, v2, v5

    const/16 v16, 0x0

    const/16 v17, 0x14

    move-object/from16 v12, p0

    move-object v15, v4

    move-object/from16 v18, p1

    invoke-direct/range {v12 .. v18}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 1033
    invoke-static {v4}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v17

    .local v17, id:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v12, p0

    move-wide v13, v2

    move-wide/from16 v15, v20

    .line 1034
    invoke-static/range {v12 .. v17}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->newDelta(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJLorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;

    move-result-object v1

    goto/16 :goto_0

    .line 1009
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V
    .locals 1
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
    .line 262
    .local p1, matches:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->idx()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V

    .line 263
    return-void
.end method

.method setInvalid()V
    .locals 1

    .prologue
    .line 550
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid:Z

    .line 551
    return-void
.end method

.method public shouldBeKept()Z
    .locals 3

    .prologue
    .line 237
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->keepFile:Ljava/io/File;

    if-nez v0, :cond_0

    .line 238
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->packFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".keep"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->keepFile:Ljava/io/File;

    .line 239
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackFile;->keepFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method
