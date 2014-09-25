.class public Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;
.super Lorg/eclipse/jgit/transport/PackParser;
.source "ObjectDirectoryPackParser.java"


# instance fields
.field private final crc:Ljava/util/zip/CRC32;

.field private final db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

.field private def:Ljava/util/zip/Deflater;

.field private indexVersion:I

.field private keepEmpty:Z

.field private newPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

.field private origEnd:J

.field private origHash:[B

.field private out:Ljava/io/RandomAccessFile;

.field private packEnd:J

.field private packHash:[B

.field private final tailDigest:Ljava/security/MessageDigest;

.field private tmpIdx:Ljava/io/File;

.field private tmpPack:Ljava/io/File;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Ljava/io/InputStream;)V
    .locals 2
    .parameter "odb"
    .parameter "src"

    .prologue
    .line 125
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/PackParser;-><init>(Lorg/eclipse/jgit/lib/ObjectDatabase;Ljava/io/InputStream;)V

    .line 126
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    .line 127
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    .line 128
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tailDigest:Ljava/security/MessageDigest;

    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getConfig()Lorg/eclipse/jgit/lib/Config;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Config;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/CoreConfig;->getPackIndexVersion()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->indexVersion:I

    .line 131
    return-void
.end method

.method private static baseName(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .parameter "tmpPack"

    .prologue
    .line 314
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 315
    .local v0, name:Ljava/lang/String;
    const/4 v1, 0x0

    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private cleanupTemporaryFiles()V
    .locals 1

    .prologue
    .line 319
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    .line 321
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 322
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    .line 323
    :cond_1
    return-void
.end method

.method private renameAndOpenPack(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/PackLock;
    .locals 17
    .parameter "lockMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 429
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->keepEmpty:Z

    if-nez v12, :cond_1

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->getObjectCount()I

    move-result v12

    if-nez v12, :cond_1

    .line 430
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 431
    const/4 v7, 0x0

    .line 507
    :cond_0
    :goto_0
    return-object v7

    .line 434
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    .line 435
    .local v1, d:Ljava/security/MessageDigest;
    const/16 v12, 0x14

    new-array v10, v12, [B

    .line 436
    .local v10, oeBytes:[B
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->getObjectCount()I

    move-result v12

    if-ge v6, v12, :cond_2

    .line 437
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->getObject(I)Lorg/eclipse/jgit/transport/PackedObjectInfo;

    move-result-object v9

    .line 438
    .local v9, oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    const/4 v12, 0x0

    invoke-virtual {v9, v10, v12}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->copyRawTo([BI)V

    .line 439
    invoke-virtual {v1, v10}, Ljava/security/MessageDigest;->update([B)V

    .line 436
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 442
    .end local v9           #oe:Lorg/eclipse/jgit/transport/PackedObjectInfo;
    :cond_2
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v12

    invoke-static {v12}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v12

    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v8

    .line 443
    .local v8, name:Ljava/lang/String;
    new-instance v11, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v12}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getDirectory()Ljava/io/File;

    move-result-object v12

    const-string v13, "pack"

    invoke-direct {v11, v12, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 444
    .local v11, packDir:Ljava/io/File;
    new-instance v5, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "pack-"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ".pack"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v5, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 445
    .local v5, finalPack:Ljava/io/File;
    new-instance v4, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "pack-"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ".idx"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v4, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 446
    .local v4, finalIdx:Ljava/io/File;
    new-instance v7, Lorg/eclipse/jgit/internal/storage/file/PackLock;

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v12}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v12

    invoke-direct {v7, v5, v12}, Lorg/eclipse/jgit/internal/storage/file/PackLock;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 448
    .local v7, keep:Lorg/eclipse/jgit/internal/storage/file/PackLock;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_3

    invoke-virtual {v11}, Ljava/io/File;->mkdir()Z

    move-result v12

    if-nez v12, :cond_3

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_3

    .line 452
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 453
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateDirectory:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 458
    :cond_3
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 461
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 462
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 465
    :cond_4
    if-eqz p1, :cond_5

    .line 470
    :try_start_0
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/internal/storage/file/PackLock;->lock(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 471
    new-instance v12, Lorg/eclipse/jgit/errors/LockFailedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->cannotLockPackIn:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v5, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v5, v13}, Lorg/eclipse/jgit/errors/LockFailedException;-><init>(Ljava/io/File;Ljava/lang/String;)V

    throw v12
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 474
    :catch_0
    move-exception v2

    .line 475
    .local v2, e:Ljava/io/IOException;
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 476
    throw v2

    .line 480
    .end local v2           #e:Ljava/io/IOException;
    :cond_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    invoke-virtual {v12, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 481
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 482
    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/PackLock;->unlock()V

    .line 483
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->cannotMovePackTo:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v5, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 487
    :cond_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    invoke-virtual {v12, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v12

    if-nez v12, :cond_8

    .line 488
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 489
    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/PackLock;->unlock()V

    .line 490
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v12

    if-nez v12, :cond_7

    .line 491
    invoke-virtual {v5}, Ljava/io/File;->deleteOnExit()V

    .line 492
    :cond_7
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->cannotMoveIndexTo:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v4, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 497
    :cond_8
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v12, v5}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->openPack(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->newPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 507
    if-nez p1, :cond_0

    const/4 v7, 0x0

    goto/16 :goto_0

    .line 498
    :catch_1
    move-exception v3

    .line 499
    .local v3, err:Ljava/io/IOException;
    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/PackLock;->unlock()V

    .line 500
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_9

    .line 501
    invoke-static {v5}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 502
    :cond_9
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_a

    .line 503
    invoke-static {v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 504
    :cond_a
    throw v3
.end method

.method private writeIdx()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 412
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->getSortedObjectList(Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    .line 413
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/PackedObjectInfo;>;"
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 416
    .local v2, os:Ljava/io/FileOutputStream;
    :try_start_0
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->indexVersion:I

    if-gtz v3, :cond_0

    .line 417
    invoke-static {v2, v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->createOldestPossible(Ljava/io/OutputStream;Ljava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;

    move-result-object v0

    .line 420
    .local v0, iw:Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packHash:[B

    invoke-virtual {v0, v1, v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->write(Ljava/util/List;[B)V

    .line 421
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/nio/channels/FileChannel;->force(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 423
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 425
    return-void

    .line 419
    .end local v0           #iw:Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    :cond_0
    :try_start_1
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->indexVersion:I

    invoke-static {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->createVersion(Ljava/io/OutputStream;I)Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .restart local v0       #iw:Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    goto :goto_0

    .line 423
    .end local v0           #iw:Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    throw v3
.end method


# virtual methods
.method protected checkCRC(I)Z
    .locals 2
    .parameter "oldCRC"

    .prologue
    .line 310
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

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

.method public getPackFile()Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->newPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    return-object v0
.end method

.method public getPackSize()J
    .locals 10

    .prologue
    .line 173
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->newPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    if-nez v6, :cond_1

    .line 174
    invoke-super {p0}, Lorg/eclipse/jgit/transport/PackParser;->getPackSize()J

    move-result-wide v4

    .line 183
    :cond_0
    :goto_0
    return-wide v4

    .line 176
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->newPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v3

    .line 177
    .local v3, pack:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 178
    .local v4, size:J
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 179
    .local v2, p:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    const-string v9, ".pack"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".idx"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, i:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 181
    .local v1, idx:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 182
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v6

    add-long/2addr v4, v6

    goto :goto_0
.end method

.method protected onAppendBase(I[BLorg/eclipse/jgit/transport/PackedObjectInfo;)Z
    .locals 9
    .parameter "typeCode"
    .parameter "data"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 328
    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    invoke-virtual {p3, v4, v5}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setOffset(J)V

    .line 330
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->buffer()[B

    move-result-object v0

    .line 331
    .local v0, buf:[B
    array-length v3, p2

    .line 332
    .local v3, sz:I
    const/4 v1, 0x0

    .line 333
    .local v1, len:I
    add-int/lit8 v2, v1, 0x1

    .end local v1           #len:I
    .local v2, len:I
    shl-int/lit8 v4, p1, 0x4

    and-int/lit8 v5, v3, 0xf

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 334
    ushr-int/lit8 v3, v3, 0x4

    .line 335
    :goto_0
    if-lez v3, :cond_0

    .line 336
    add-int/lit8 v4, v2, -0x1

    aget-byte v5, v0, v4

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, v0, v4

    .line 337
    add-int/lit8 v1, v2, 0x1

    .end local v2           #len:I
    .restart local v1       #len:I
    and-int/lit8 v4, v3, 0x7f

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 338
    ushr-int/lit8 v3, v3, 0x7

    move v2, v1

    .end local v1           #len:I
    .restart local v2       #len:I
    goto :goto_0

    .line 341
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tailDigest:Ljava/security/MessageDigest;

    invoke-virtual {v4, v0, v8, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 342
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4}, Ljava/util/zip/CRC32;->reset()V

    .line 343
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4, v0, v8, v2}, Ljava/util/zip/CRC32;->update([BII)V

    .line 344
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    invoke-virtual {v4, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 345
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v4, v0, v8, v2}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 346
    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    int-to-long v6, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    .line 348
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    if-nez v4, :cond_1

    .line 349
    new-instance v4, Ljava/util/zip/Deflater;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v8}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    .line 352
    :goto_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4, p2}, Ljava/util/zip/Deflater;->setInput([B)V

    .line 353
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4}, Ljava/util/zip/Deflater;->finish()V

    move v1, v2

    .line 355
    .end local v2           #len:I
    .restart local v1       #len:I
    :goto_2
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4}, Ljava/util/zip/Deflater;->finished()Z

    move-result v4

    if-nez v4, :cond_2

    .line 356
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4, v0}, Ljava/util/zip/Deflater;->deflate([B)I

    move-result v1

    .line 357
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tailDigest:Ljava/security/MessageDigest;

    invoke-virtual {v4, v0, v8, v1}, Ljava/security/MessageDigest;->update([BII)V

    .line 358
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4, v0, v8, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 359
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v4, v0, v8, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 360
    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    int-to-long v6, v1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    goto :goto_2

    .line 351
    .end local v1           #len:I
    .restart local v2       #len:I
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v4}, Ljava/util/zip/Deflater;->reset()V

    goto :goto_1

    .line 363
    .end local v2           #len:I
    .restart local v1       #len:I
    :cond_2
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v4}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    long-to-int v4, v4

    invoke-virtual {p3, v4}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setCRC(I)V

    .line 364
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
    .line 239
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 240
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
    .line 245
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 246
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
    .line 228
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 229
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
    .line 250
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;-><init>()V

    .line 251
    .local v0, delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->setCRC(I)V

    .line 252
    return-object v0
.end method

.method protected onEndThinPack()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v13, 0x0

    const/16 v12, 0xc

    const/4 v11, 0x0

    .line 369
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tailDigest:Ljava/security/MessageDigest;

    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v8

    .line 370
    .local v8, tailHash:[B
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->buffer()[B

    move-result-object v0

    .line 372
    .local v0, buf:[B
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v3

    .line 373
    .local v3, origDigest:Ljava/security/MessageDigest;
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v7

    .line 374
    .local v7, tailDigest:Ljava/security/MessageDigest;
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v6

    .line 376
    .local v6, packDigest:Ljava/security/MessageDigest;
    iget-wide v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->origEnd:J

    .line 377
    .local v4, origRemaining:J
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v9, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 378
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v9, v0, v11, v12}, Ljava/io/RandomAccessFile;->readFully([BII)V

    .line 379
    invoke-virtual {v3, v0, v11, v12}, Ljava/security/MessageDigest;->update([BII)V

    .line 380
    const-wide/16 v9, 0xc

    sub-long/2addr v4, v9

    .line 382
    const/16 v9, 0x8

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->getObjectCount()I

    move-result v10

    invoke-static {v0, v9, v10}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 383
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v9, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 384
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v9, v0, v11, v12}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 385
    invoke-virtual {v6, v0, v11, v12}, Ljava/security/MessageDigest;->update([BII)V

    .line 388
    :goto_0
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v9, v0}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v1

    .line 389
    .local v1, n:I
    if-gez v1, :cond_1

    .line 403
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v9

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->origHash:[B

    invoke-static {v9, v10}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-virtual {v7}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v9

    invoke-static {v9, v8}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v9

    if-nez v9, :cond_4

    .line 405
    :cond_0
    new-instance v9, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->packCorruptedWhileWritingToFilesystem:Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 391
    :cond_1
    cmp-long v9, v4, v13

    if-eqz v9, :cond_3

    .line 392
    int-to-long v9, v1

    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    long-to-int v2, v9

    .line 393
    .local v2, origCnt:I
    invoke-virtual {v3, v0, v11, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 394
    int-to-long v9, v2

    sub-long/2addr v4, v9

    .line 395
    cmp-long v9, v4, v13

    if-nez v9, :cond_2

    .line 396
    sub-int v9, v1, v2

    invoke-virtual {v7, v0, v2, v9}, Ljava/security/MessageDigest;->update([BII)V

    .line 400
    .end local v2           #origCnt:I
    :cond_2
    :goto_1
    invoke-virtual {v6, v0, v11, v1}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 398
    :cond_3
    invoke-virtual {v7, v0, v11, v1}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_1

    .line 408
    :cond_4
    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v9

    iput-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packHash:[B

    .line 409
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
    .line 233
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->setCRC(I)V

    .line 234
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
    .line 259
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
    .line 270
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0, p2, p3, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 271
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
    .line 264
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0, p2, p3, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 265
    return-void
.end method

.method protected onPackFooter([B)V
    .locals 2
    .parameter "hash"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    .line 282
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->origEnd:J

    .line 283
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->origHash:[B

    .line 284
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packHash:[B

    .line 285
    return-void
.end method

.method protected onPackHeader(J)V
    .locals 0
    .parameter "objectCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    return-void
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
    .line 276
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 277
    return-void
.end method

.method public parse(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;
    .locals 4
    .parameter "receiving"
    .parameter "resolving"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    const-string v0, "incoming_"

    const-string v1, ".pack"

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getDirectory()Ljava/io/File;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    .line 190
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getDirectory()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->baseName(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".idx"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    .line 192
    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    const-string v2, "rw"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    .line 194
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/transport/PackParser;->parse(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 196
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packEnd:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 197
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->packHash:[B

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->write([B)V

    .line 198
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 199
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 201
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->writeIdx()V

    .line 203
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpPack:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->setReadOnly()Z

    .line 204
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->tmpIdx:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->setReadOnly()Z

    .line 206
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->getLockMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->renameAndOpenPack(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/PackLock;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 208
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    if-eqz v1, :cond_0

    .line 209
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->end()V

    .line 211
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 212
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 216
    :cond_1
    :goto_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 206
    return-object v0

    .line 208
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    if-eqz v1, :cond_2

    .line 209
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->def:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->end()V

    .line 211
    :cond_2
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 212
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 216
    :cond_3
    :goto_1
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->cleanupTemporaryFiles()V

    .line 208
    throw v0

    .line 213
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method protected readDatabase([BII)I
    .locals 1
    .parameter "dst"
    .parameter "pos"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 305
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v0

    return v0
.end method

.method protected seekDatabase(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .locals 3
    .parameter "delta"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->getOffset()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 291
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 292
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->readObjectHeader(Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v0

    return-object v0
.end method

.method protected seekDatabase(Lorg/eclipse/jgit/transport/PackedObjectInfo;Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;
    .locals 3
    .parameter "obj"
    .parameter "info"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->out:Ljava/io/RandomAccessFile;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/PackedObjectInfo;->getOffset()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 299
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 300
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->readObjectHeader(Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;)Lorg/eclipse/jgit/transport/PackParser$ObjectTypeAndSize;

    move-result-object v0

    return-object v0
.end method

.method public setIndexVersion(I)V
    .locals 0
    .parameter "version"

    .prologue
    .line 142
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->indexVersion:I

    .line 143
    return-void
.end method

.method public setKeepEmpty(Z)V
    .locals 0
    .parameter "empty"

    .prologue
    .line 156
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryPackParser;->keepEmpty:Z

    .line 157
    return-void
.end method
