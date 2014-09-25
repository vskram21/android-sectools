.class public final Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
.super Ljava/lang/Object;
.source "DfsPackFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    }
.end annotation


# static fields
.field private static final POS_BITMAP_INDEX:J = -0x3L

.field private static final POS_INDEX:J = -0x1L

.field private static final POS_REVERSE_INDEX:J = -0x2L


# instance fields
.field private volatile bitmapIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;",
            ">;"
        }
    .end annotation
.end field

.field private volatile blockSize:I

.field private final cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

.field private volatile corruptObjects:Lorg/eclipse/jgit/util/LongList;

.field private volatile index:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackIndex;",
            ">;"
        }
    .end annotation
.end field

.field private final initLock:Ljava/lang/Object;

.field private volatile invalid:Z

.field final key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

.field volatile length:J

.field private final packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

.field private volatile reverseIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;)V
    .locals 4
    .parameter "cache"
    .parameter "desc"
    .parameter "key"

    .prologue
    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->initLock:Ljava/lang/Object;

    .line 174
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    .line 175
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 176
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 178
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    .line 179
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 180
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    .line 181
    :cond_0
    return-void
.end method

.method private decompress(JILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)[B
    .locals 7
    .parameter "position"
    .parameter "sz"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 438
    :try_start_0
    new-array v4, p3, [B
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .local v4, dstbuf:[B
    move-object v0, p4

    move-object v1, p0

    move-wide v2, p1

    .line 450
    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inflate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J[BZ)I

    move-result v0

    if-eq v0, p3, :cond_0

    .line 451
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

    .line 439
    .end local v4           #dstbuf:[B
    :catch_0
    move-exception v6

    .line 447
    .local v6, noMemory:Ljava/lang/OutOfMemoryError;
    const/4 v4, 0x0

    .line 454
    .end local v6           #noMemory:Ljava/lang/OutOfMemoryError;
    :cond_0
    return-object v4
.end method

.method private findDeltaBase(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/ObjectId;)J
    .locals 4
    .parameter "ctx"
    .parameter "baseId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 890
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 891
    .local v0, ofs:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    .line 892
    new-instance v2, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->missingDeltaBase:Ljava/lang/String;

    invoke-direct {v2, p2, v3}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v2

    .line 894
    :cond_0
    return-wide v0
.end method

.method private getPackName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 203
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 16
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->index:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 223
    .local v5, idxref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<Lorg/eclipse/jgit/internal/storage/file/PackIndex;>;"
    if-eqz v5, :cond_0

    .line 224
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    .line 225
    .local v4, idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    if-eqz v4, :cond_0

    .line 276
    :goto_0
    return-object v4

    .line 229
    .end local v4           #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid:Z

    if-eqz v10, :cond_1

    .line 230
    new-instance v10, Lorg/eclipse/jgit/errors/PackInvalidException;

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/errors/PackInvalidException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 232
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/lib/Repository;->getGlobalListenerList()Lorg/eclipse/jgit/events/ListenerList;

    move-result-object v10

    new-instance v11, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedEvent;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedEvent;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/events/ListenerList;->dispatch(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 235
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->initLock:Ljava/lang/Object;

    monitor-enter v11

    .line 236
    :try_start_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->index:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 237
    if-eqz v5, :cond_2

    .line 238
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    .line 239
    .restart local v4       #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    if-eqz v4, :cond_2

    .line 240
    monitor-exit v11

    goto :goto_0

    .line 277
    .end local v4           #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :catchall_0
    move-exception v10

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v10

    .line 245
    :cond_2
    :try_start_1
    move-object/from16 v0, p1

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v13, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v10, v12, v13}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->openFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v8

    .line 247
    .local v8, rc:Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    :try_start_2
    invoke-static {v8}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v6

    .line 248
    .local v6, in:Ljava/io/InputStream;
    const/16 v9, 0x2000

    .line 249
    .local v9, wantSize:I
    invoke-interface {v8}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->blockSize()I

    move-result v1

    .line 250
    .local v1, bs:I
    if-lez v1, :cond_4

    if-ge v1, v9, :cond_4

    .line 251
    div-int v10, v9, v1

    mul-int/2addr v1, v10

    .line 254
    :cond_3
    :goto_1
    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-direct {v7, v6, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 255
    .end local v6           #in:Ljava/io/InputStream;
    .local v7, in:Ljava/io/InputStream;
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->read(Ljava/io/InputStream;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v4

    .line 257
    .restart local v4       #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_start_3
    invoke-interface {v8}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/EOFException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 275
    :try_start_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setPackIndex(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    .line 276
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 252
    .end local v4           #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .end local v7           #in:Ljava/io/InputStream;
    .restart local v6       #in:Ljava/io/InputStream;
    :cond_4
    if-gtz v1, :cond_3

    .line 253
    move v1, v9

    goto :goto_1

    .line 257
    .end local v1           #bs:I
    .end local v6           #in:Ljava/io/InputStream;
    .end local v9           #wantSize:I
    :catchall_1
    move-exception v10

    :try_start_5
    invoke-interface {v8}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->close()V

    throw v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/EOFException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 259
    .end local v8           #rc:Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    :catch_0
    move-exception v2

    .line 260
    .local v2, e:Ljava/io/EOFException;
    const/4 v10, 0x1

    :try_start_6
    move-object/from16 v0, p0

    iput-boolean v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid:Z

    .line 261
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->shortReadOfIndex:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v15, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v14, v15}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v3, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 264
    .local v3, e2:Ljava/io/IOException;
    invoke-virtual {v3, v2}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 265
    throw v3

    .line 266
    .end local v2           #e:Ljava/io/EOFException;
    .end local v3           #e2:Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 267
    .local v2, e:Ljava/io/IOException;
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid:Z

    .line 268
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->cannotReadIndex:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v15, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v14, v15}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v3, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 271
    .restart local v3       #e2:Ljava/io/IOException;
    invoke-virtual {v3, v2}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 272
    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method private isCorrupt(J)Z
    .locals 2
    .parameter "offset"

    .prologue
    .line 1089
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;

    .line 1090
    .local v0, list:Lorg/eclipse/jgit/util/LongList;
    if-nez v0, :cond_0

    .line 1091
    const/4 v1, 0x0

    .line 1093
    :goto_0
    return v1

    .line 1092
    :cond_0
    monitor-enter v0

    .line 1093
    :try_start_0
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/util/LongList;->contains(J)Z

    move-result v1

    monitor-exit v0

    goto :goto_0

    .line 1094
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V
    .locals 7
    .parameter "position"
    .parameter "dstbuf"
    .parameter "dstoff"
    .parameter "cnt"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 663
    move-object v0, p6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->copy(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J[BII)I

    move-result v0

    if-eq v0, p5, :cond_0

    .line 664
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 665
    :cond_0
    return-void
.end method

.method private setCorrupt(J)V
    .locals 4
    .parameter "offset"

    .prologue
    .line 1098
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;

    .line 1099
    .local v0, list:Lorg/eclipse/jgit/util/LongList;
    if-nez v0, :cond_1

    .line 1100
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->initLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1101
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;

    .line 1102
    if-nez v0, :cond_0

    .line 1103
    new-instance v1, Lorg/eclipse/jgit/util/LongList;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/LongList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1104
    .end local v0           #list:Lorg/eclipse/jgit/util/LongList;
    .local v1, list:Lorg/eclipse/jgit/util/LongList;
    :try_start_1
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->corruptObjects:Lorg/eclipse/jgit/util/LongList;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-object v0, v1

    .line 1106
    .end local v1           #list:Lorg/eclipse/jgit/util/LongList;
    .restart local v0       #list:Lorg/eclipse/jgit/util/LongList;
    :cond_0
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1108
    :cond_1
    monitor-enter v0

    .line 1109
    :try_start_3
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/util/LongList;->add(J)V

    .line 1110
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1111
    return-void

    .line 1106
    :catchall_0
    move-exception v2

    :goto_0
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2

    .line 1110
    :catchall_1
    move-exception v2

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v2

    .line 1106
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
.method alignToBlock(J)J
    .locals 5
    .parameter "pos"

    .prologue
    .line 668
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->blockSize:I

    .line 669
    .local v0, size:I
    if-nez v0, :cond_0

    .line 670
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v0

    .line 671
    :cond_0
    int-to-long v1, v0

    div-long v1, p1, v1

    int-to-long v3, v0

    mul-long/2addr v1, v3

    return-wide v1
.end method

.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 415
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->remove(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    .line 416
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->index:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 417
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->reverseIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 418
    return-void
.end method

.method copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;ZLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V
    .locals 47
    .parameter "out"
    .parameter "src"
    .parameter "validate"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
        }
    .end annotation

    .prologue
    .line 467
    if-eqz p3, :cond_0

    new-instance v33, Ljava/util/zip/CRC32;

    invoke-direct/range {v33 .. v33}, Ljava/util/zip/CRC32;-><init>()V

    .line 468
    .local v33, crc1:Ljava/util/zip/CRC32;
    :goto_0
    if-eqz p3, :cond_1

    new-instance v34, Ljava/util/zip/CRC32;

    invoke-direct/range {v34 .. v34}, Ljava/util/zip/CRC32;-><init>()V

    .line 469
    .local v34, crc2:Ljava/util/zip/CRC32;
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->getCopyBuffer()[B

    move-result-object v7

    .line 474
    .local v7, buf:[B
    :try_start_0
    move-object/from16 v0, p2

    iget-wide v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    const/4 v8, 0x0

    const/16 v9, 0x14

    move-object/from16 v4, p0

    move-object/from16 v10, p4

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 481
    const/4 v4, 0x0

    aget-byte v4, v7, v4

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 482
    .local v29, c:I
    shr-int/lit8 v4, v29, 0x4

    and-int/lit8 v46, v4, 0x7

    .line 483
    .local v46, typeCode:I
    and-int/lit8 v4, v29, 0xf

    int-to-long v0, v4

    move-wide/from16 v41, v0

    .line 484
    .local v41, inflatedLength:J
    const/16 v45, 0x4

    .line 485
    .local v45, shift:I
    const/16 v39, 0x1

    .local v39, headerCnt:I
    move/from16 v40, v39

    .line 486
    .end local v39           #headerCnt:I
    .local v40, headerCnt:I
    :goto_2
    move/from16 v0, v29

    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_2

    .line 487
    add-int/lit8 v39, v40, 0x1

    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    aget-byte v4, v7, v40

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 488
    and-int/lit8 v4, v29, 0x7f

    int-to-long v4, v4

    shl-long v4, v4, v45

    add-long v41, v41, v4

    .line 489
    add-int/lit8 v45, v45, 0x7

    move/from16 v40, v39

    .end local v39           #headerCnt:I
    .restart local v40       #headerCnt:I
    goto :goto_2

    .line 467
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

    .line 468
    .restart local v33       #crc1:Ljava/util/zip/CRC32;
    :cond_1
    const/16 v34, 0x0

    goto :goto_1

    .line 475
    .restart local v7       #buf:[B
    .restart local v34       #crc2:Ljava/util/zip/CRC32;
    :catch_0
    move-exception v43

    .line 477
    .local v43, ioError:Ljava/io/IOException;
    new-instance v38, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;

    move-object/from16 v0, v38

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;-><init>(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 478
    .local v38, gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    move-object/from16 v0, v38

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 479
    throw v38

    .line 492
    .end local v38           #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    .end local v43           #ioError:Ljava/io/IOException;
    .restart local v29       #c:I
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

    .line 494
    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    add-int/lit8 v40, v39, 0x1

    .end local v39           #headerCnt:I
    .restart local v40       #headerCnt:I
    aget-byte v4, v7, v39

    and-int/lit16 v0, v4, 0xff

    move/from16 v29, v0

    .line 495
    move/from16 v0, v29

    and-int/lit16 v4, v0, 0x80

    if-nez v4, :cond_3

    .line 496
    if-eqz p3, :cond_9

    .line 497
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 498
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    move/from16 v39, v40

    .line 517
    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    :goto_3
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move/from16 v0, v39

    int-to-long v8, v0

    add-long v10, v4, v8

    .line 518
    .local v10, dataOffset:J
    move-object/from16 v0, p2

    iget-wide v12, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->length:J

    .local v12, dataLength:J
    move-object/from16 v8, p4

    move-object/from16 v9, p0

    .line 526
    :try_start_1
    invoke-virtual/range {v8 .. v13}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->quickCopy(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JJ)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-result-object v44

    .line 528
    .local v44, quickCopy:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    if-eqz p3, :cond_b

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->hasCRC32Support()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 531
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findCRC32(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v36

    .line 532
    .local v36, expectedCRC:J
    if-eqz v44, :cond_a

    .line 533
    long-to-int v4, v12

    move-object/from16 v0, v44

    move-object/from16 v1, v33

    invoke-virtual {v0, v1, v10, v11, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->crc32(Ljava/util/zip/CRC32;JI)V

    .line 545
    :cond_4
    invoke-virtual/range {v33 .. v33}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    cmp-long v4, v4, v36

    if-eqz v4, :cond_11

    .line 546
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setCorrupt(J)V

    .line 547
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p2

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x1

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 584
    .end local v36           #expectedCRC:J
    .end local v44           #quickCopy:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :catch_1
    move-exception v35

    .line 585
    .local v35, dataFormat:Ljava/util/zip/DataFormatException;
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setCorrupt(J)V

    .line 587
    new-instance v32, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p2

    iget-wide v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v5, v6

    const/4 v6, 0x1

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    .line 591
    .local v32, corruptObject:Lorg/eclipse/jgit/errors/CorruptObjectException;
    move-object/from16 v0, v32

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 594
    new-instance v38, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;

    move-object/from16 v0, v38

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;-><init>(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 595
    .restart local v38       #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    move-object/from16 v0, v38

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 596
    throw v38

    .line 500
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

    .line 501
    if-eqz p3, :cond_6

    .line 502
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 503
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 506
    :cond_6
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move/from16 v0, v40

    int-to-long v8, v0

    add-long v5, v4, v8

    const/4 v8, 0x0

    const/16 v9, 0x14

    move-object/from16 v4, p0

    move-object/from16 v10, p4

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 507
    if-eqz p3, :cond_7

    .line 508
    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object/from16 v0, v33

    invoke-virtual {v0, v7, v4, v5}, Ljava/util/zip/CRC32;->update([BII)V

    .line 509
    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object/from16 v0, v34

    invoke-virtual {v0, v7, v4, v5}, Ljava/util/zip/CRC32;->update([BII)V

    .line 511
    :cond_7
    add-int/lit8 v39, v40, 0x14

    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    goto/16 :goto_3

    .line 512
    .end local v39           #headerCnt:I
    .restart local v40       #headerCnt:I
    :cond_8
    if-eqz p3, :cond_9

    .line 513
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 514
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v40

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    :cond_9
    move/from16 v39, v40

    .end local v40           #headerCnt:I
    .restart local v39       #headerCnt:I
    goto/16 :goto_3

    .line 535
    .restart local v10       #dataOffset:J
    .restart local v12       #dataLength:J
    .restart local v36       #expectedCRC:J
    .restart local v44       #quickCopy:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :cond_a
    move-wide v15, v10

    .line 536
    .local v15, pos:J
    move-wide/from16 v30, v12

    .line 537
    .local v30, cnt:J
    :goto_4
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_4

    .line 538
    :try_start_2
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 539
    .local v19, n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 540
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 541
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 542
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 543
    goto :goto_4

    .line 551
    .end local v15           #pos:J
    .end local v19           #n:I
    .end local v30           #cnt:J
    .end local v36           #expectedCRC:J
    :cond_b
    if-eqz p3, :cond_13

    .line 556
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inflater()Ljava/util/zip/Inflater;

    move-result-object v21

    .line 557
    .local v21, inf:Ljava/util/zip/Inflater;
    const/16 v4, 0x400

    new-array v0, v4, [B

    move-object/from16 v22, v0

    .line 558
    .local v22, tmp:[B
    if-eqz v44, :cond_e

    .line 559
    long-to-int v0, v12

    move/from16 v25, v0

    move-object/from16 v20, v44

    move-wide/from16 v23, v10

    invoke-virtual/range {v20 .. v25}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->check(Ljava/util/zip/Inflater;[BJI)V

    .line 574
    :cond_c
    invoke-virtual/range {v21 .. v21}, Ljava/util/zip/Inflater;->finished()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-virtual/range {v21 .. v21}, Ljava/util/zip/Inflater;->getBytesRead()J

    move-result-wide v4

    cmp-long v4, v4, v12

    if-eqz v4, :cond_10

    .line 575
    :cond_d
    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setCorrupt(J)V

    .line 576
    new-instance v4, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->shortCompressedStreamAt:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p2

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_2
    .catch Ljava/util/zip/DataFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 598
    .end local v21           #inf:Ljava/util/zip/Inflater;
    .end local v22           #tmp:[B
    .end local v44           #quickCopy:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :catch_2
    move-exception v43

    .line 600
    .restart local v43       #ioError:Ljava/io/IOException;
    new-instance v38, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;

    move-object/from16 v0, v38

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;-><init>(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 601
    .restart local v38       #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    move-object/from16 v0, v38

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 602
    throw v38

    .line 561
    .end local v38           #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    .end local v43           #ioError:Ljava/io/IOException;
    .restart local v21       #inf:Ljava/util/zip/Inflater;
    .restart local v22       #tmp:[B
    .restart local v44       #quickCopy:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :cond_e
    move-wide v15, v10

    .line 562
    .restart local v15       #pos:J
    move-wide/from16 v30, v12

    .line 563
    .restart local v30       #cnt:J
    :goto_5
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_c

    .line 564
    :try_start_3
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 565
    .restart local v19       #n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 566
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 567
    const/4 v4, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 568
    :cond_f
    const/4 v4, 0x0

    move-object/from16 v0, v22

    array-length v5, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v4, v5}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v4

    if-gtz v4, :cond_f

    .line 570
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 571
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 572
    goto :goto_5

    .line 580
    .end local v15           #pos:J
    .end local v19           #n:I
    .end local v30           #cnt:J
    :cond_10
    invoke-virtual/range {v33 .. v33}, Ljava/util/zip/CRC32;->getValue()J
    :try_end_3
    .catch Ljava/util/zip/DataFormatException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    move-result-wide v36

    .line 605
    .end local v21           #inf:Ljava/util/zip/Inflater;
    .end local v22           #tmp:[B
    .restart local v36       #expectedCRC:J
    :cond_11
    :goto_6
    if-eqz v44, :cond_14

    .line 609
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-wide/from16 v2, v41

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 610
    long-to-int v0, v12

    move/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v23, v44

    move-object/from16 v24, p1

    move-wide/from16 v25, v10

    invoke-virtual/range {v23 .. v28}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->write(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;JILjava/security/MessageDigest;)V

    .line 651
    :cond_12
    :goto_7
    return-void

    .line 582
    .end local v36           #expectedCRC:J
    :cond_13
    const-wide/16 v36, -0x1

    .restart local v36       #expectedCRC:J
    goto :goto_6

    .line 612
    :cond_14
    array-length v4, v7

    int-to-long v4, v4

    cmp-long v4, v12, v4

    if-gtz v4, :cond_16

    .line 616
    if-nez p3, :cond_15

    .line 617
    move-wide v15, v10

    .line 618
    .restart local v15       #pos:J
    move-wide/from16 v30, v12

    .line 619
    .restart local v30       #cnt:J
    :goto_8
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_15

    .line 620
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 621
    .restart local v19       #n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 622
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 623
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 624
    goto :goto_8

    .line 626
    .end local v15           #pos:J
    .end local v19           #n:I
    .end local v30           #cnt:J
    :cond_15
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-wide/from16 v2, v41

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 627
    const/4 v4, 0x0

    long-to-int v5, v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v4, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    goto :goto_7

    .line 633
    :cond_16
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-wide/from16 v2, v41

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 634
    move-wide v15, v10

    .line 635
    .restart local v15       #pos:J
    move-wide/from16 v30, v12

    .line 636
    .restart local v30       #cnt:J
    :goto_9
    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_18

    .line 637
    array-length v4, v7

    int-to-long v4, v4

    move-wide/from16 v0, v30

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v19, v0

    .line 638
    .restart local v19       #n:I
    const/16 v18, 0x0

    move-object/from16 v14, p0

    move-object/from16 v17, v7

    move-object/from16 v20, p4

    invoke-direct/range {v14 .. v20}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 639
    if-eqz p3, :cond_17

    .line 640
    const/4 v4, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 641
    :cond_17
    const/4 v4, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v7, v4, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    .line 642
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v15, v4

    .line 643
    move/from16 v0, v19

    int-to-long v4, v0

    sub-long v30, v30, v4

    .line 644
    goto :goto_9

    .line 645
    .end local v19           #n:I
    :cond_18
    if-eqz p3, :cond_12

    invoke-virtual/range {v34 .. v34}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    cmp-long v4, v4, v36

    if-eqz v4, :cond_12

    .line 646
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p2

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->offset:J

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x1

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v8

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V
    .locals 6
    .parameter "out"
    .parameter "validate"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 460
    const-wide/16 v0, 0x0

    invoke-virtual {p3, p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 461
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    move-object v0, p3

    move-object v1, p0

    move v4, p2

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->copyPackAsIs(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JZLorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V

    .line 462
    return-void
.end method

.method findOffset(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 2
    .parameter "ctx"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 405
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    return-wide v0
.end method

.method get(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 4
    .parameter "ctx"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 400
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 401
    .local v0, offset:J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->isCorrupt(J)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->load(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method getBitmapIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .locals 23
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 285
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid:Z

    if-nez v4, :cond_0

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->isGarbage()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 286
    :cond_0
    const/4 v9, 0x0

    .line 340
    :cond_1
    :goto_0
    return-object v9

    .line 287
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->bitmapIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 288
    .local v13, idxref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;>;"
    if-eqz v13, :cond_3

    .line 289
    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    .line 290
    .local v9, idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    if-nez v9, :cond_1

    .line 294
    .end local v9           #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v5, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->hasFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 295
    const/4 v9, 0x0

    goto :goto_0

    .line 297
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->initLock:Ljava/lang/Object;

    move-object/from16 v20, v0

    monitor-enter v20

    .line 298
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->bitmapIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 299
    if-eqz v13, :cond_5

    .line 300
    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    .line 301
    .restart local v9       #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    if-eqz v9, :cond_5

    .line 302
    monitor-exit v20

    goto :goto_0

    .line 341
    .end local v9           #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :catchall_0
    move-exception v4

    monitor-exit v20
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 308
    :cond_5
    :try_start_1
    move-object/from16 v0, p1

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v6, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->openFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v16

    .line 310
    .local v16, rc:Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    :try_start_2
    invoke-static/range {v16 .. v16}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v14

    .line 311
    .local v14, in:Ljava/io/InputStream;
    const/16 v19, 0x2000

    .line 312
    .local v19, wantSize:I
    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->blockSize()I

    move-result v10

    .line 313
    .local v10, bs:I
    if-lez v10, :cond_7

    move/from16 v0, v19

    if-ge v10, v0, :cond_7

    .line 314
    div-int v4, v19, v10

    mul-int/2addr v10, v4

    .line 317
    :cond_6
    :goto_1
    new-instance v15, Ljava/io/BufferedInputStream;

    invoke-direct {v15, v14, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 318
    .end local v14           #in:Ljava/io/InputStream;
    .local v15, in:Ljava/io/InputStream;
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v4

    invoke-virtual/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getReverseIdx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    move-result-object v5

    invoke-static {v15, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->read(Ljava/io/InputStream;Lorg/eclipse/jgit/internal/storage/file/PackIndex;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v9

    .line 321
    .restart local v9       #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :try_start_3
    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->position()J

    move-result-wide v17

    .line 322
    .local v17, size:J
    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/EOFException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 338
    :try_start_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    const-wide/16 v6, -0x3

    const-wide/32 v21, 0x7fffffff

    move-wide/from16 v0, v17

    move-wide/from16 v2, v21

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v21

    move-wide/from16 v0, v21

    long-to-int v8, v0

    invoke-virtual/range {v4 .. v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->bitmapIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 340
    monitor-exit v20
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 315
    .end local v9           #idx:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .end local v15           #in:Ljava/io/InputStream;
    .end local v17           #size:J
    .restart local v14       #in:Ljava/io/InputStream;
    :cond_7
    if-gtz v10, :cond_6

    .line 316
    move/from16 v10, v19

    goto :goto_1

    .line 321
    .end local v10           #bs:I
    .end local v14           #in:Ljava/io/InputStream;
    .end local v19           #wantSize:I
    :catchall_1
    move-exception v4

    :try_start_5
    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->position()J

    move-result-wide v17

    .line 322
    .restart local v17       #size:J
    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->close()V

    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/EOFException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 324
    .end local v16           #rc:Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    .end local v17           #size:J
    :catch_0
    move-exception v11

    .line 325
    .local v11, e:Ljava/io/EOFException;
    :try_start_6
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->shortReadOfIndex:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v8, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v12, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 328
    .local v12, e2:Ljava/io/IOException;
    invoke-virtual {v12, v11}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 329
    throw v12

    .line 330
    .end local v11           #e:Ljava/io/EOFException;
    .end local v12           #e2:Ljava/io/IOException;
    :catch_1
    move-exception v11

    .line 331
    .local v11, e:Ljava/io/IOException;
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->cannotReadIndex:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v8, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v12, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 334
    .restart local v12       #e2:Ljava/io/IOException;
    invoke-virtual {v12, v11}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 335
    throw v12
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public getCachedSize()J
    .locals 2

    .prologue
    .line 199
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->cachedSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method getDeltaHeader(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)[B
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
    .line 929
    const/16 v0, 0x20

    new-array v4, v0, [B

    .line 930
    .local v4, hdr:[B
    const/4 v5, 0x1

    move-object v0, p1

    move-object v1, p0

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inflate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J[BZ)I

    .line 931
    return-object v4
.end method

.method getObjectCount(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)J
    .locals 2
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 431
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v0

    return-wide v0
.end method

.method getObjectSize(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)J
    .locals 20
    .parameter "ctx"
    .parameter "pos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 987
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->tempId:[B

    .line 988
    .local v5, ib:[B
    const/4 v6, 0x0

    const/16 v7, 0x14

    move-object/from16 v2, p0

    move-wide/from16 v3, p2

    move-object/from16 v8, p1

    invoke-direct/range {v2 .. v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 989
    const/4 v2, 0x0

    aget-byte v2, v5, v2

    and-int/lit16 v9, v2, 0xff

    .line 990
    .local v9, c:I
    shr-int/lit8 v2, v9, 0x4

    and-int/lit8 v19, v2, 0x7

    .line 991
    .local v19, type:I
    and-int/lit8 v2, v9, 0xf

    int-to-long v0, v2

    move-wide/from16 v17, v0

    .line 992
    .local v17, sz:J
    const/16 v16, 0x4

    .line 993
    .local v16, shift:I
    const/4 v14, 0x1

    .local v14, p:I
    move v15, v14

    .line 994
    .end local v14           #p:I
    .local v15, p:I
    :goto_0
    and-int/lit16 v2, v9, 0x80

    if-eqz v2, :cond_0

    .line 995
    add-int/lit8 v14, v15, 0x1

    .end local v15           #p:I
    .restart local v14       #p:I
    aget-byte v2, v5, v15

    and-int/lit16 v9, v2, 0xff

    .line 996
    and-int/lit8 v2, v9, 0x7f

    int-to-long v2, v2

    shl-long v2, v2, v16

    add-long v17, v17, v2

    .line 997
    add-int/lit8 v16, v16, 0x7

    move v15, v14

    .end local v14           #p:I
    .restart local v15       #p:I
    goto :goto_0

    .line 1001
    :cond_0
    packed-switch v19, :pswitch_data_0

    .line 1020
    :pswitch_0
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_1
    move v14, v15

    .line 1025
    .end local v15           #p:I
    .end local v17           #sz:J
    .restart local v14       #p:I
    :goto_1
    return-wide v17

    .line 1009
    .end local v14           #p:I
    .restart local v15       #p:I
    .restart local v17       #sz:J
    :pswitch_2
    add-int/lit8 v14, v15, 0x1

    .end local v15           #p:I
    .restart local v14       #p:I
    aget-byte v2, v5, v15

    and-int/lit16 v9, v2, 0xff

    move v15, v14

    .line 1010
    .end local v14           #p:I
    .restart local v15       #p:I
    :goto_2
    and-int/lit16 v2, v9, 0x80

    if-eqz v2, :cond_1

    .line 1011
    add-int/lit8 v14, v15, 0x1

    .end local v15           #p:I
    .restart local v14       #p:I
    aget-byte v2, v5, v15

    and-int/lit16 v9, v2, 0xff

    move v15, v14

    .end local v14           #p:I
    .restart local v15       #p:I
    goto :goto_2

    .line 1012
    :cond_1
    int-to-long v2, v15

    add-long v11, p2, v2

    .local v11, deltaAt:J
    move v14, v15

    .line 1025
    .end local v15           #p:I
    .restart local v14       #p:I
    :goto_3
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v11, v12}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getDeltaHeader(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)[B

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->getResultSize([B)J
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v17

    goto :goto_1

    .line 1016
    .end local v11           #deltaAt:J
    .end local v14           #p:I
    .restart local v15       #p:I
    :pswitch_3
    int-to-long v2, v15

    add-long v2, v2, p2

    const-wide/16 v6, 0x14

    add-long v11, v2, v6

    .restart local v11       #deltaAt:J
    move v14, v15

    .line 1017
    .end local v15           #p:I
    .restart local v14       #p:I
    goto :goto_3

    .line 1026
    :catch_0
    move-exception v13

    .line 1027
    .local v13, dfe:Ljava/util/zip/DataFormatException;
    new-instance v10, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->objectAtHasBadZlibStream:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v3, v4

    const/4 v4, 0x1

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v10, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    .line 1031
    .local v10, coe:Lorg/eclipse/jgit/errors/CorruptObjectException;
    invoke-virtual {v10, v13}, Lorg/eclipse/jgit/errors/CorruptObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 1032
    throw v10

    .line 1001
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

.method getObjectSize(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 4
    .parameter "ctx"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 981
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 982
    .local v0, offset:J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getObjectSize(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method getObjectType(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)I
    .locals 13
    .parameter "ctx"
    .parameter "pos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 935
    iget-object v3, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->tempId:[B

    .line 937
    .local v3, ib:[B
    :goto_0
    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object v0, p0

    move-wide v1, p2

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 938
    const/4 v0, 0x0

    aget-byte v0, v3, v0

    and-int/lit16 v7, v0, 0xff

    .line 939
    .local v7, c:I
    shr-int/lit8 v0, v7, 0x4

    and-int/lit8 v12, v0, 0x7

    .line 941
    .local v12, type:I
    packed-switch v12, :pswitch_data_0

    .line 974
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

    .line 949
    :pswitch_1
    const/4 v10, 0x1

    .local v10, p:I
    move v11, v10

    .line 950
    .end local v10           #p:I
    .local v11, p:I
    :goto_1
    and-int/lit16 v0, v7, 0x80

    if-eqz v0, :cond_0

    .line 951
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    move v11, v10

    .end local v10           #p:I
    .restart local v11       #p:I
    goto :goto_1

    .line 952
    :cond_0
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    .line 953
    and-int/lit8 v0, v7, 0x7f

    int-to-long v8, v0

    .local v8, ofs:J
    move v11, v10

    .line 954
    .end local v10           #p:I
    .restart local v11       #p:I
    :goto_2
    and-int/lit16 v0, v7, 0x80

    if-eqz v0, :cond_1

    .line 955
    const-wide/16 v0, 0x1

    add-long/2addr v8, v0

    .line 956
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    .line 957
    const/4 v0, 0x7

    shl-long/2addr v8, v0

    .line 958
    and-int/lit8 v0, v7, 0x7f

    int-to-long v0, v0

    add-long/2addr v8, v0

    move v11, v10

    .end local v10           #p:I
    .restart local v11       #p:I
    goto :goto_2

    .line 960
    :cond_1
    sub-long/2addr p2, v8

    .line 961
    goto :goto_0

    .line 965
    .end local v8           #ofs:J
    .end local v11           #p:I
    :pswitch_2
    const/4 v10, 0x1

    .restart local v10       #p:I
    move v11, v10

    .line 966
    .end local v10           #p:I
    .restart local v11       #p:I
    :goto_3
    and-int/lit16 v0, v7, 0x80

    if-eqz v0, :cond_2

    .line 967
    add-int/lit8 v10, v11, 0x1

    .end local v11           #p:I
    .restart local v10       #p:I
    aget-byte v0, v3, v11

    and-int/lit16 v7, v0, 0xff

    move v11, v10

    .end local v10           #p:I
    .restart local v11       #p:I
    goto :goto_3

    .line 968
    :cond_2
    int-to-long v0, v11

    add-long v1, p2, v0

    const/4 v4, 0x0

    const/16 v5, 0x14

    move-object v0, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 969
    invoke-static {v3}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->findDeltaBase(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/ObjectId;)J

    move-result-wide p2

    .line 970
    goto :goto_0

    .line 946
    .end local v11           #p:I
    :pswitch_3
    return v12

    .line 941
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

.method getOrLoadBlock(JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    .locals 1
    .parameter "pos"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 675
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getOrLoad(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-result-object v0

    return-object v0
.end method

.method public getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    return-object v0
.end method

.method getPackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 1
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    return-object v0
.end method

.method getReverseIdx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    .locals 9
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->reverseIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 346
    .local v7, revref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;>;"
    if-eqz v7, :cond_0

    .line 347
    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    .line 348
    .local v5, revidx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    if-eqz v5, :cond_0

    .line 365
    :goto_0
    return-object v5

    .line 352
    .end local v5           #revidx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    :cond_0
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->initLock:Ljava/lang/Object;

    monitor-enter v8

    .line 353
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->reverseIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 354
    if-eqz v7, :cond_1

    .line 355
    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    .line 356
    .restart local v5       #revidx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    if-eqz v5, :cond_1

    .line 357
    monitor-exit v8

    goto :goto_0

    .line 366
    .end local v5           #revidx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 360
    :cond_1
    :try_start_1
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v6

    .line 361
    .local v6, idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    new-instance v5, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    .line 362
    .restart local v5       #revidx:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v0

    const-wide/16 v2, 0x8

    mul-long/2addr v0, v2

    const-wide/32 v2, 0x7fffffff

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v4, v0

    .line 364
    .local v4, sz:I
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    const-wide/16 v2, -0x2

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->reverseIndex:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 365
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public hasObject(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 4
    .parameter "ctx"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 382
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 383
    .local v0, offset:J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->isCorrupt(J)Z

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
    .line 654
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid:Z

    return v0
.end method

.method final isGarbage()Z
    .locals 2

    .prologue
    .line 281
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getPackSource()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->UNREACHABLE_GARBAGE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isIndexLoaded()Z
    .locals 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->index:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 194
    .local v0, idxref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<Lorg/eclipse/jgit/internal/storage/file/PackIndex;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->has()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method load(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 42
    .parameter "ctx"
    .parameter "pos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 750
    :try_start_0
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->tempId:[B

    .line 751
    .local v6, ib:[B
    const/4 v14, 0x0

    .line 752
    .local v14, delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    const/16 v34, 0x0

    .line 753
    .local v34, data:[B
    const/16 v41, -0x1

    .line 754
    .local v41, type:I
    const/16 v31, 0x0

    .local v31, cached:Z
    move-object/from16 v35, v14

    .line 757
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .local v35, delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    :goto_0
    const/4 v7, 0x0

    const/16 v8, 0x14

    move-object/from16 v3, p0

    move-wide/from16 v4, p2

    move-object/from16 v9, p1

    invoke-direct/range {v3 .. v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 758
    const/4 v3, 0x0

    aget-byte v3, v6, v3

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 759
    .local v30, c:I
    shr-int/lit8 v3, v30, 0x4

    and-int/lit8 v8, v3, 0x7

    .line 760
    .local v8, typeCode:I
    and-int/lit8 v3, v30, 0xf

    int-to-long v9, v3

    .line 761
    .local v9, sz:J
    const/16 v39, 0x4

    .line 762
    .local v39, shift:I
    const/4 v13, 0x1

    .line 763
    .local v13, p:I
    :goto_1
    move/from16 v0, v30

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_0

    .line 764
    add-int/lit8 v19, v13, 0x1

    .end local v13           #p:I
    .local v19, p:I
    aget-byte v3, v6, v13

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 765
    and-int/lit8 v3, v30, 0x7f

    int-to-long v3, v3

    shl-long v3, v3, v39

    add-long/2addr v9, v3

    .line 766
    add-int/lit8 v39, v39, 0x7

    move/from16 v13, v19

    .end local v19           #p:I
    .restart local v13       #p:I
    goto :goto_1

    .line 769
    :cond_0
    packed-switch v8, :pswitch_data_0

    .line 832
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

    .line 878
    .end local v6           #ib:[B
    .end local v8           #typeCode:I
    .end local v9           #sz:J
    .end local v13           #p:I
    .end local v30           #c:I
    .end local v31           #cached:Z
    .end local v34           #data:[B
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .end local v39           #shift:I
    .end local v41           #type:I
    :catch_0
    move-exception v36

    .line 879
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

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v33

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    .line 883
    .local v33, coe:Lorg/eclipse/jgit/errors/CorruptObjectException;
    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 884
    throw v33

    .line 774
    .end local v33           #coe:Lorg/eclipse/jgit/errors/CorruptObjectException;
    .end local v36           #dfe:Ljava/util/zip/DataFormatException;
    .restart local v6       #ib:[B
    .restart local v8       #typeCode:I
    .restart local v9       #sz:J
    .restart local v13       #p:I
    .restart local v30       #c:I
    .restart local v31       #cached:Z
    .restart local v34       #data:[B
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v39       #shift:I
    .restart local v41       #type:I
    :pswitch_1
    if-eqz v35, :cond_1

    .line 775
    int-to-long v3, v13

    add-long v3, v3, p2

    long-to-int v5, v9

    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v4, v5, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->decompress(JILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)[B

    move-result-object v27

    .line 776
    .end local v34           #data:[B
    .local v27, data:[B
    move/from16 v26, v8

    .end local v41           #type:I
    .local v26, type:I
    move-object/from16 v14, v35

    .line 840
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    :goto_2
    if-nez v27, :cond_9

    .line 841
    new-instance v3, Lorg/eclipse/jgit/errors/LargeObjectException;

    invoke-direct {v3}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>()V

    throw v3

    .line 780
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .end local v26           #type:I
    .end local v27           #data:[B
    .restart local v34       #data:[B
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v41       #type:I
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->getStreamFileThreshold()I

    move-result v3

    int-to-long v3, v3

    cmp-long v3, v9, v3

    if-gez v3, :cond_2

    .line 781
    int-to-long v3, v13

    add-long v3, v3, p2

    long-to-int v5, v9

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v4, v5, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->decompress(JILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)[B

    move-result-object v27

    .line 782
    .end local v34           #data:[B
    .restart local v27       #data:[B
    if-eqz v27, :cond_3

    .line 783
    new-instance v7, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;

    move-object/from16 v0, v27

    invoke-direct {v7, v8, v0}, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;-><init>(I[B)V

    move/from16 v26, v41

    .end local v41           #type:I
    .restart local v26       #type:I
    move-object/from16 v14, v35

    .line 876
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    :goto_3
    return-object v7

    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .end local v26           #type:I
    .end local v27           #data:[B
    .restart local v34       #data:[B
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v41       #type:I
    :cond_2
    move-object/from16 v27, v34

    .line 785
    .end local v34           #data:[B
    .restart local v27       #data:[B
    :cond_3
    new-instance v7, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;

    move-object/from16 v0, p1

    iget-object v15, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-wide/from16 v11, p2

    move-object/from16 v14, p0

    invoke-direct/range {v7 .. v15}, Lorg/eclipse/jgit/internal/storage/dfs/LargePackedWholeObject;-><init>(IJJILorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V

    move/from16 v26, v41

    .end local v41           #type:I
    .restart local v26       #type:I
    move-object/from16 v14, v35

    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    goto :goto_3

    .line 789
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .end local v26           #type:I
    .end local v27           #data:[B
    .restart local v34       #data:[B
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v41       #type:I
    :pswitch_2
    add-int/lit8 v19, v13, 0x1

    .end local v13           #p:I
    .restart local v19       #p:I
    aget-byte v3, v6, v13

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 790
    and-int/lit8 v3, v30, 0x7f

    int-to-long v0, v3

    move-wide/from16 v20, v0

    .line 791
    .local v20, base:J
    :goto_4
    move/from16 v0, v30

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_4

    .line 792
    const-wide/16 v3, 0x1

    add-long v20, v20, v3

    .line 793
    add-int/lit8 v13, v19, 0x1

    .end local v19           #p:I
    .restart local v13       #p:I
    aget-byte v3, v6, v19

    and-int/lit16 v0, v3, 0xff

    move/from16 v30, v0

    .line 794
    const/4 v3, 0x7

    shl-long v20, v20, v3

    .line 795
    and-int/lit8 v3, v30, 0x7f

    int-to-long v3, v3

    add-long v20, v20, v3

    move/from16 v19, v13

    .end local v13           #p:I
    .restart local v19       #p:I
    goto :goto_4

    .line 797
    :cond_4
    sub-long v20, p2, v20

    .line 798
    new-instance v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;

    long-to-int v0, v9

    move/from16 v18, v0

    move-object/from16 v15, v35

    move-wide/from16 v16, p2

    invoke-direct/range {v14 .. v21}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;JIIJ)V

    .line 799
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    iget v3, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->deltaSize:I

    int-to-long v3, v3

    cmp-long v3, v9, v3

    if-eqz v3, :cond_5

    move/from16 v13, v19

    .end local v19           #p:I
    .restart local v13       #p:I
    move/from16 v26, v41

    .end local v41           #type:I
    .restart local v26       #type:I
    move-object/from16 v27, v34

    .line 800
    .end local v34           #data:[B
    .restart local v27       #data:[B
    goto/16 :goto_2

    .line 802
    .end local v13           #p:I
    .end local v26           #type:I
    .end local v27           #data:[B
    .restart local v19       #p:I
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    move-wide/from16 v0, v20

    invoke-virtual {v3, v4, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->get(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;

    move-result-object v37

    .line 803
    .local v37, e:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
    if-eqz v37, :cond_6

    .line 804
    move-object/from16 v0, v37

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;->type:I

    move/from16 v26, v0

    .line 805
    .end local v41           #type:I
    .restart local v26       #type:I
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;->data:[B

    move-object/from16 v27, v0

    .line 806
    .end local v34           #data:[B
    .restart local v27       #data:[B
    const/16 v31, 0x1

    move/from16 v13, v19

    .line 807
    .end local v19           #p:I
    .restart local v13       #p:I
    goto/16 :goto_2

    .line 809
    .end local v13           #p:I
    .end local v26           #type:I
    .end local v27           #data:[B
    .restart local v19       #p:I
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_6
    move-wide/from16 p2, v20

    move-object/from16 v35, v14

    .line 810
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    goto/16 :goto_0

    .line 814
    .end local v19           #p:I
    .end local v20           #base:J
    .end local v37           #e:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
    .restart local v13       #p:I
    :pswitch_3
    int-to-long v3, v13

    add-long v23, p2, v3

    const/16 v26, 0x0

    const/16 v27, 0x14

    move-object/from16 v22, p0

    move-object/from16 v25, v6

    move-object/from16 v28, p1

    invoke-direct/range {v22 .. v28}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 815
    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->findDeltaBase(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/ObjectId;)J

    move-result-wide v20

    .line 816
    .restart local v20       #base:J
    new-instance v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;

    long-to-int v0, v9

    move/from16 v26, v0

    add-int/lit8 v27, v13, 0x14

    move-object/from16 v22, v14

    move-object/from16 v23, v35

    move-wide/from16 v24, p2

    move-wide/from16 v28, v20

    invoke-direct/range {v22 .. v29}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;JIIJ)V

    .line 817
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    iget v3, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->deltaSize:I

    int-to-long v3, v3

    cmp-long v3, v9, v3

    if-eqz v3, :cond_7

    move/from16 v26, v41

    .end local v41           #type:I
    .restart local v26       #type:I
    move-object/from16 v27, v34

    .line 818
    .end local v34           #data:[B
    .restart local v27       #data:[B
    goto/16 :goto_2

    .line 820
    .end local v26           #type:I
    .end local v27           #data:[B
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    move-wide/from16 v0, v20

    invoke-virtual {v3, v4, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->get(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;

    move-result-object v37

    .line 821
    .restart local v37       #e:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
    if-eqz v37, :cond_8

    .line 822
    move-object/from16 v0, v37

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;->type:I

    move/from16 v26, v0

    .line 823
    .end local v41           #type:I
    .restart local v26       #type:I
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;->data:[B

    move-object/from16 v27, v0

    .line 824
    .end local v34           #data:[B
    .restart local v27       #data:[B
    const/16 v31, 0x1

    .line 825
    goto/16 :goto_2

    .line 827
    .end local v26           #type:I
    .end local v27           #data:[B
    .restart local v34       #data:[B
    .restart local v41       #type:I
    :cond_8
    move-wide/from16 p2, v20

    move-object/from16 v35, v14

    .line 828
    .end local v14           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v35       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    goto/16 :goto_0

    .line 845
    .end local v20           #base:J
    .end local v34           #data:[B
    .end local v35           #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .end local v37           #e:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;
    .end local v41           #type:I
    .restart local v14       #delta:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
    .restart local v26       #type:I
    .restart local v27       #data:[B
    :cond_9
    if-eqz v31, :cond_b

    .line 846
    const/16 v31, 0x0

    .line 850
    :cond_a
    :goto_5
    iget-wide v0, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->deltaPos:J

    move-wide/from16 p2, v0

    .line 852
    iget v3, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->hdrLen:I

    int-to-long v3, v3

    add-long v3, v3, p2

    iget v5, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->deltaSize:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v4, v5, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->decompress(JILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)[B

    move-result-object v32

    .line 853
    .local v32, cmds:[B
    if-nez v32, :cond_c

    .line 854
    const/16 v27, 0x0

    .line 855
    new-instance v3, Lorg/eclipse/jgit/errors/LargeObjectException;

    invoke-direct {v3}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>()V

    throw v3

    .line 847
    .end local v32           #cmds:[B
    :cond_b
    iget-object v3, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;

    if-nez v3, :cond_a

    .line 848
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    move-object/from16 v23, v0

    iget-wide v0, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->basePos:J

    move-wide/from16 v24, v0

    invoke-virtual/range {v22 .. v27}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JI[B)V

    goto :goto_5

    .line 858
    .restart local v32       #cmds:[B
    :cond_c
    invoke-static/range {v32 .. v32}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->getResultSize([B)J

    move-result-wide v9

    .line 859
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v3, v9

    if-gtz v3, :cond_d

    .line 860
    new-instance v3, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;

    invoke-direct {v3}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;-><init>()V

    throw v3
    :try_end_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 864
    :cond_d
    long-to-int v3, v9

    :try_start_2
    new-array v0, v3, [B

    move-object/from16 v38, v0
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/zip/DataFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 871
    .local v38, result:[B
    :try_start_3
    move-object/from16 v0, v27

    move-object/from16 v1, v32

    move-object/from16 v2, v38

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->apply([B[B[B)[B

    .line 872
    move-object/from16 v27, v38

    .line 873
    iget-object v14, v14, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;

    .line 874
    if-nez v14, :cond_9

    .line 876
    new-instance v7, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;

    move/from16 v0, v26

    move-object/from16 v1, v27

    invoke-direct {v7, v0, v1}, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;-><init>(I[B)V

    goto/16 :goto_3

    .line 865
    .end local v38           #result:[B
    :catch_1
    move-exception v40

    .line 866
    .local v40, tooBig:Ljava/lang/OutOfMemoryError;
    const/16 v27, 0x0

    .line 867
    const/16 v32, 0x0

    .line 868
    new-instance v3, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;

    move-object/from16 v0, v40

    invoke-direct {v3, v0}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;-><init>(Ljava/lang/OutOfMemoryError;)V

    throw v3
    :try_end_3
    .catch Ljava/util/zip/DataFormatException; {:try_start_3 .. :try_end_3} :catch_0

    .line 769
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

.method readOneBlock(JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    .locals 16
    .parameter "pos"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 680
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid:Z

    if-eqz v10, :cond_0

    .line 681
    new-instance v10, Lorg/eclipse/jgit/errors/PackInvalidException;

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/errors/PackInvalidException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 683
    :cond_0
    move-object/from16 v0, p3

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->packDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    sget-object v12, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v10, v11, v12}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->openFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;

    move-result-object v7

    .line 687
    .local v7, rc:Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    :try_start_0
    move-object/from16 v0, p0

    iget v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->blockSize:I

    .line 688
    .local v8, size:I
    if-nez v8, :cond_2

    .line 689
    invoke-interface {v7}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->blockSize()I

    move-result v8

    .line 690
    if-gtz v8, :cond_5

    .line 691
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v8

    .line 694
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iput v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->blockSize:I

    .line 695
    int-to-long v10, v8

    div-long v10, p1, v10

    int-to-long v12, v8

    mul-long p1, v10, v12

    .line 702
    :cond_2
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    .line 703
    .local v4, len:J
    const-wide/16 v10, 0x0

    cmp-long v10, v4, v10

    if-gez v10, :cond_3

    .line 704
    invoke-interface {v7}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->size()J

    move-result-wide v4

    .line 705
    const-wide/16 v10, 0x0

    cmp-long v10, v10, v4

    if-gtz v10, :cond_3

    .line 706
    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    .line 709
    :cond_3
    const-wide/16 v10, 0x0

    cmp-long v10, v10, v4

    if-gtz v10, :cond_4

    int-to-long v10, v8

    add-long v10, v10, p1

    cmp-long v10, v4, v10

    if-gez v10, :cond_4

    .line 710
    sub-long v10, v4, p1

    long-to-int v8, v10

    .line 711
    :cond_4
    if-gtz v8, :cond_6

    .line 712
    new-instance v10, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->shortReadOfBlock:Ljava/lang/String;

    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-wide/16 v14, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x3

    const-wide/16 v14, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 743
    .end local v4           #len:J
    .end local v8           #size:I
    :catchall_0
    move-exception v10

    invoke-interface {v7}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->close()V

    throw v10

    .line 692
    .restart local v8       #size:I
    :cond_5
    :try_start_1
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v10

    if-ge v8, v10, :cond_1

    .line 693
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getBlockSize()I

    move-result v10

    div-int/2addr v10, v8

    mul-int/2addr v8, v10

    goto :goto_0

    .line 716
    .restart local v4       #len:J
    :cond_6
    new-array v2, v8, [B

    .line 717
    .local v2, buf:[B
    move-wide/from16 v0, p1

    invoke-interface {v7, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->position(J)V

    .line 718
    const/4 v10, 0x0

    invoke-static {v7, v2, v10, v8}, Lorg/eclipse/jgit/util/IO;->read(Ljava/nio/channels/ReadableByteChannel;[BII)I

    move-result v3

    .line 719
    .local v3, cnt:I
    if-eq v3, v8, :cond_9

    .line 720
    const-wide/16 v10, 0x0

    cmp-long v10, v10, v4

    if-gtz v10, :cond_7

    .line 721
    new-instance v10, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->get()Lorg/eclipse/jgit/internal/storage/dfs/DfsText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsText;->shortReadOfBlock:Ljava/lang/String;

    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 731
    :cond_7
    new-array v6, v3, [B

    .line 732
    .local v6, n:[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    array-length v12, v6

    invoke-static {v2, v10, v6, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 733
    move-object v2, v6

    .line 740
    .end local v6           #n:[B
    :cond_8
    :goto_1
    new-instance v9, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    move-wide/from16 v0, p1

    invoke-direct {v9, v10, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J[B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 743
    .local v9, v:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    invoke-interface {v7}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->close()V

    return-object v9

    .line 734
    .end local v9           #v:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    :cond_9
    const-wide/16 v10, 0x0

    cmp-long v10, v4, v10

    if-gez v10, :cond_8

    .line 737
    :try_start_2
    invoke-interface {v7}, Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;->size()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method representation(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)V
    .locals 18
    .parameter "r"
    .parameter "pos"
    .parameter "ctx"
    .parameter "rev"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1039
    move-wide/from16 v0, p2

    move-object/from16 v2, p1

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->offset:J

    .line 1040
    move-object/from16 v0, p4

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->tempId:[B

    .line 1041
    .local v6, ib:[B
    const/4 v7, 0x0

    const/16 v8, 0x14

    move-object/from16 v3, p0

    move-wide/from16 v4, p2

    move-object/from16 v9, p4

    invoke-direct/range {v3 .. v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 1042
    const/4 v3, 0x0

    aget-byte v3, v6, v3

    and-int/lit16 v10, v3, 0xff

    .line 1043
    .local v10, c:I
    const/4 v15, 0x1

    .line 1044
    .local v15, p:I
    shr-int/lit8 v3, v10, 0x4

    and-int/lit8 v17, v3, 0x7

    .local v17, typeCode:I
    move/from16 v16, v15

    .line 1045
    .end local v15           #p:I
    .local v16, p:I
    :goto_0
    and-int/lit16 v3, v10, 0x80

    if-eqz v3, :cond_0

    .line 1046
    add-int/lit8 v15, v16, 0x1

    .end local v16           #p:I
    .restart local v15       #p:I
    aget-byte v3, v6, v16

    and-int/lit16 v10, v3, 0xff

    move/from16 v16, v15

    .end local v15           #p:I
    .restart local v16       #p:I
    goto :goto_0

    .line 1048
    :cond_0
    move-object/from16 v0, p0

    iget-wide v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    const-wide/16 v7, 0x14

    sub-long/2addr v3, v7

    move-object/from16 v0, p5

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->findNextOffset(JJ)J

    move-result-wide v3

    sub-long v11, v3, p2

    .line 1049
    .local v11, len:J
    packed-switch v17, :pswitch_data_0

    .line 1083
    :pswitch_0
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1054
    :pswitch_1
    const/4 v3, 0x1

    move-object/from16 v0, p1

    iput v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->format:I

    .line 1055
    const/4 v3, 0x0

    move-object/from16 v0, p1

    iput-object v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 1056
    move/from16 v0, v16

    int-to-long v3, v0

    sub-long v3, v11, v3

    move-object/from16 v0, p1

    iput-wide v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->length:J

    move/from16 v15, v16

    .line 1079
    .end local v16           #p:I
    .restart local v15       #p:I
    :goto_1
    return-void

    .line 1060
    .end local v15           #p:I
    .restart local v16       #p:I
    :pswitch_2
    add-int/lit8 v15, v16, 0x1

    .end local v16           #p:I
    .restart local v15       #p:I
    aget-byte v3, v6, v16

    and-int/lit16 v10, v3, 0xff

    .line 1061
    and-int/lit8 v3, v10, 0x7f

    int-to-long v13, v3

    .local v13, ofs:J
    move/from16 v16, v15

    .line 1062
    .end local v15           #p:I
    .restart local v16       #p:I
    :goto_2
    and-int/lit16 v3, v10, 0x80

    if-eqz v3, :cond_1

    .line 1063
    const-wide/16 v3, 0x1

    add-long/2addr v13, v3

    .line 1064
    add-int/lit8 v15, v16, 0x1

    .end local v16           #p:I
    .restart local v15       #p:I
    aget-byte v3, v6, v16

    and-int/lit16 v10, v3, 0xff

    .line 1065
    const/4 v3, 0x7

    shl-long/2addr v13, v3

    .line 1066
    and-int/lit8 v3, v10, 0x7f

    int-to-long v3, v3

    add-long/2addr v13, v3

    move/from16 v16, v15

    .end local v15           #p:I
    .restart local v16       #p:I
    goto :goto_2

    .line 1068
    :cond_1
    const/4 v3, 0x0

    move-object/from16 v0, p1

    iput v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->format:I

    .line 1069
    sub-long v3, p2, v13

    move-object/from16 v0, p5

    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->findObject(J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    move-object/from16 v0, p1

    iput-object v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 1070
    move/from16 v0, v16

    int-to-long v3, v0

    sub-long v3, v11, v3

    move-object/from16 v0, p1

    iput-wide v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->length:J

    move/from16 v15, v16

    .line 1071
    .end local v16           #p:I
    .restart local v15       #p:I
    goto :goto_1

    .line 1075
    .end local v13           #ofs:J
    .end local v15           #p:I
    .restart local v16       #p:I
    :pswitch_3
    move/from16 v0, v16

    int-to-long v3, v0

    add-long v4, p2, v3

    const/4 v7, 0x0

    const/16 v8, 0x14

    move-object/from16 v3, p0

    move-object/from16 v9, p4

    invoke-direct/range {v3 .. v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->readFully(J[BIILorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 1076
    const/4 v3, 0x0

    move-object/from16 v0, p1

    iput v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->format:I

    .line 1077
    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    move-object/from16 v0, p1

    iput-object v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->baseId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 1078
    move/from16 v0, v16

    int-to-long v3, v0

    sub-long v3, v11, v3

    const-wide/16 v7, 0x14

    sub-long/2addr v3, v7

    move-object/from16 v0, p1

    iput-wide v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->length:J

    move/from16 v15, v16

    .line 1079
    .end local v16           #p:I
    .restart local v15       #p:I
    goto :goto_1

    .line 1049
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

.method resolve(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V
    .locals 1
    .parameter "ctx"
    .parameter
    .parameter "id"
    .parameter "matchLimit"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;",
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
    .line 410
    .local p2, matches:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->idx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    invoke-virtual {v0, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V

    .line 411
    return-void
.end method

.method setBlockSize(I)V
    .locals 0
    .parameter "newSize"

    .prologue
    .line 207
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->blockSize:I

    .line 208
    return-void
.end method

.method setInvalid()V
    .locals 1

    .prologue
    .line 658
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid:Z

    .line 659
    return-void
.end method

.method setPackIndex(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V
    .locals 9
    .parameter "idx"

    .prologue
    .line 211
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v6

    .line 212
    .local v6, objCnt:J
    const/16 v8, 0x1c

    .line 213
    .local v8, recSize:I
    int-to-long v0, v8

    mul-long/2addr v0, v6

    const-wide/32 v2, 0x7fffffff

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v4, v0

    .line 214
    .local v4, sz:I
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    const-wide/16 v2, -0x1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->put(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->index:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 215
    return-void
.end method
