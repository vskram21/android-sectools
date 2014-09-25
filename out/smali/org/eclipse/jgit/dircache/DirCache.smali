.class public Lorg/eclipse/jgit/dircache/DirCache;
.super Ljava/lang/Object;
.source "DirCache.java"


# static fields
.field static final ENT_CMP:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/dircache/DirCacheEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static final EXT_TREE:I = 0x54524545

.field private static final NO_CHECKSUM:[B

.field private static final NO_ENTRIES:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

.field private static final SIG_DIRC:[B


# instance fields
.field private entryCnt:I

.field private final fs:Lorg/eclipse/jgit/util/FS;

.field private indexChangedListener:Lorg/eclipse/jgit/events/IndexChangedListener;

.field private final liveFile:Ljava/io/File;

.field private myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

.field private readIndexChecksum:[B

.field private repository:Lorg/eclipse/jgit/lib/Repository;

.field private snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

.field private sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

.field private tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

.field private writeIndexChecksum:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 101
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCache;->SIG_DIRC:[B

    .line 105
    new-array v0, v1, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCache;->NO_ENTRIES:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 107
    new-array v0, v1, [B

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCache;->NO_CHECKSUM:[B

    .line 109
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCache$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/dircache/DirCache$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCache;->ENT_CMP:Ljava/util/Comparator;

    return-void

    .line 101
    nop

    :array_0
    .array-data 0x1
        0x44t
        0x49t
        0x52t
        0x43t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter "indexLocation"
    .parameter "fs"

    .prologue
    .line 351
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 352
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    .line 353
    iput-object p2, p0, Lorg/eclipse/jgit/dircache/DirCache;->fs:Lorg/eclipse/jgit/util/FS;

    .line 354
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCache;->clear()V

    .line 355
    return-void
.end method

.method static cmp(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    array-length v1, v1

    invoke-static {v0, v1, p1}, Lorg/eclipse/jgit/dircache/DirCache;->cmp([BILorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v0

    return v0
.end method

.method static cmp([BILorg/eclipse/jgit/dircache/DirCacheEntry;)I
    .locals 2
    .parameter "aPath"
    .parameter "aLen"
    .parameter "b"

    .prologue
    .line 123
    iget-object v0, p2, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    iget-object v1, p2, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    array-length v1, v1

    invoke-static {p0, p1, v0, v1}, Lorg/eclipse/jgit/dircache/DirCache;->cmp([BI[BI)I

    move-result v0

    return v0
.end method

.method static cmp([BI[BI)I
    .locals 4
    .parameter "aPath"
    .parameter "aLen"
    .parameter "bPath"
    .parameter "bLen"

    .prologue
    .line 128
    const/4 v0, 0x0

    .local v0, cPos:I
    :goto_0
    if-ge v0, p1, :cond_1

    if-ge v0, p3, :cond_1

    .line 129
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    aget-byte v3, p2, v0

    and-int/lit16 v3, v3, 0xff

    sub-int v1, v2, v3

    .line 130
    .local v1, cmp:I
    if-eqz v1, :cond_0

    .line 133
    .end local v1           #cmp:I
    :goto_1
    return v1

    .line 128
    .restart local v1       #cmp:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 133
    .end local v1           #cmp:I
    :cond_1
    sub-int v1, p1, p3

    goto :goto_1
.end method

.method private static formatExtensionName([B)Ljava/lang/String;
    .locals 5
    .parameter "hdr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 558
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x4

    const-string v4, "ISO-8859-1"

    invoke-direct {v1, p0, v2, v3, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static is_DIRC([B)Z
    .locals 4
    .parameter "hdr"

    .prologue
    const/4 v1, 0x0

    .line 562
    array-length v2, p0

    sget-object v3, Lorg/eclipse/jgit/dircache/DirCache;->SIG_DIRC:[B

    array-length v3, v3

    if-ge v2, v3, :cond_1

    .line 567
    :cond_0
    :goto_0
    return v1

    .line 564
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    sget-object v2, Lorg/eclipse/jgit/dircache/DirCache;->SIG_DIRC:[B

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 565
    aget-byte v2, p0, v0

    sget-object v3, Lorg/eclipse/jgit/dircache/DirCache;->SIG_DIRC:[B

    aget-byte v3, v3, v0

    if-ne v2, v3, :cond_0

    .line 564
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 567
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static lock(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/dircache/DirCache;
    .locals 3
    .parameter "indexLocation"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCache;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/dircache/DirCache;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 223
    .local v0, c:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->lock()Z

    move-result v2

    if-nez v2, :cond_0

    .line 224
    new-instance v2, Lorg/eclipse/jgit/errors/LockFailedException;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/errors/LockFailedException;-><init>(Ljava/io/File;)V

    throw v2

    .line 227
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->read()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    .line 239
    return-object v0

    .line 228
    :catch_0
    move-exception v1

    .line 229
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 230
    throw v1

    .line 231
    .end local v1           #e:Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 232
    .local v1, e:Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 233
    throw v1

    .line 234
    .end local v1           #e:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v1

    .line 235
    .local v1, e:Ljava/lang/Error;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 236
    throw v1
.end method

.method public static lock(Ljava/io/File;Lorg/eclipse/jgit/util/FS;Lorg/eclipse/jgit/events/IndexChangedListener;)Lorg/eclipse/jgit/dircache/DirCache;
    .locals 1
    .parameter "indexLocation"
    .parameter "fs"
    .parameter "indexChangedListener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 301
    invoke-static {p0, p1}, Lorg/eclipse/jgit/dircache/DirCache;->lock(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    .line 302
    .local v0, c:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-direct {v0, p2}, Lorg/eclipse/jgit/dircache/DirCache;->registerIndexChangedListener(Lorg/eclipse/jgit/events/IndexChangedListener;)V

    .line 303
    return-object v0
.end method

.method public static lock(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/events/IndexChangedListener;)Lorg/eclipse/jgit/dircache/DirCache;
    .locals 3
    .parameter "repository"
    .parameter "indexChangedListener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 267
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getIndexFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-static {v1, v2, p1}, Lorg/eclipse/jgit/dircache/DirCache;->lock(Ljava/io/File;Lorg/eclipse/jgit/util/FS;Lorg/eclipse/jgit/events/IndexChangedListener;)Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    .line 269
    .local v0, c:Lorg/eclipse/jgit/dircache/DirCache;
    iput-object p0, v0, Lorg/eclipse/jgit/dircache/DirCache;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 270
    return-object v0
.end method

.method public static newInCore()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 144
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCache;

    invoke-direct {v0, v1, v1}, Lorg/eclipse/jgit/dircache/DirCache;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    return-object v0
.end method

.method public static read(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/dircache/DirCache;
    .locals 1
    .parameter "indexLocation"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCache;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/dircache/DirCache;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 194
    .local v0, c:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->read()V

    .line 195
    return-object v0
.end method

.method public static read(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/dircache/DirCache;
    .locals 3
    .parameter "repository"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getIndexFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/dircache/DirCache;->read(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    .line 167
    .local v0, c:Lorg/eclipse/jgit/dircache/DirCache;
    iput-object p0, v0, Lorg/eclipse/jgit/dircache/DirCache;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 168
    return-object v0
.end method

.method private readFrom(Ljava/io/InputStream;)V
    .locals 21
    .parameter "inStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 450
    new-instance v4, Ljava/io/BufferedInputStream;

    move-object/from16 v0, p1

    invoke-direct {v4, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 451
    .local v4, in:Ljava/io/BufferedInputStream;
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v5

    .line 455
    .local v5, md:Ljava/security/MessageDigest;
    const/16 v1, 0x14

    new-array v11, v1, [B

    .line 456
    .local v11, hdr:[B
    const/4 v1, 0x0

    const/16 v8, 0xc

    invoke-static {v4, v11, v1, v8}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 457
    const/4 v1, 0x0

    const/16 v8, 0xc

    invoke-virtual {v5, v11, v1, v8}, Ljava/security/MessageDigest;->update([BII)V

    .line 458
    invoke-static {v11}, Lorg/eclipse/jgit/dircache/DirCache;->is_DIRC([B)Z

    move-result v1

    if-nez v1, :cond_0

    .line 459
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->notADIRCFile:Ljava/lang/String;

    invoke-direct {v1, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 460
    :cond_0
    const/4 v1, 0x4

    invoke-static {v11, v1}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v18

    .line 461
    .local v18, ver:I
    const/4 v14, 0x0

    .line 462
    .local v14, extended:Z
    const/4 v1, 0x3

    move/from16 v0, v18

    if-ne v0, v1, :cond_2

    .line 463
    const/4 v14, 0x1

    .line 467
    :cond_1
    const/16 v1, 0x8

    invoke-static {v11, v1}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    .line 468
    move-object/from16 v0, p0

    iget v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-gez v1, :cond_3

    .line 469
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->DIRCHasTooManyEntries:Ljava/lang/String;

    invoke-direct {v1, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 464
    :cond_2
    const/4 v1, 0x2

    move/from16 v0, v18

    if-eq v0, v1, :cond_1

    .line 465
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->unknownDIRCVersion:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v1, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 471
    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 472
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified()J

    move-result-wide v8

    const-wide/16 v19, 0x3e8

    div-long v8, v8, v19

    long-to-int v6, v8

    .line 473
    .local v6, smudge_s:I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified()J

    move-result-wide v8

    const-wide/16 v19, 0x3e8

    rem-long v8, v8, v19

    long-to-int v1, v8

    const v8, 0xf4240

    mul-int v7, v1, v8

    .line 477
    .local v7, smudge_ns:I
    invoke-static {v14}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getMaximumInfoLength(Z)I

    move-result v16

    .line 478
    .local v16, infoLength:I
    move-object/from16 v0, p0

    iget v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    mul-int v1, v1, v16

    new-array v2, v1, [B

    .line 479
    .local v2, infos:[B
    move-object/from16 v0, p0

    iget v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    new-array v1, v1, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 481
    new-instance v3, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v3}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    .line 482
    .local v3, infoAt:Lorg/eclipse/jgit/util/MutableInteger;
    const/4 v15, 0x0

    .local v15, i:I
    :goto_0
    move-object/from16 v0, p0

    iget v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-ge v15, v1, :cond_5

    .line 483
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-direct/range {v1 .. v7}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([BLorg/eclipse/jgit/util/MutableInteger;Ljava/io/InputStream;Ljava/security/MessageDigest;II)V

    aput-object v1, v8, v15

    .line 482
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 508
    .local v12, sz:J
    :cond_4
    long-to-int v1, v12

    new-array v0, v1, [B

    move-object/from16 v17, v0

    .line 509
    .local v17, raw:[B
    const/4 v1, 0x0

    move-object/from16 v0, v17

    array-length v8, v0

    move-object/from16 v0, v17

    invoke-static {v4, v0, v1, v8}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 510
    const/4 v1, 0x0

    move-object/from16 v0, v17

    array-length v8, v0

    move-object/from16 v0, v17

    invoke-virtual {v5, v0, v1, v8}, Ljava/security/MessageDigest;->update([BII)V

    .line 511
    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheTree;

    new-instance v8, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v8}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    const/4 v9, 0x0

    move-object/from16 v0, v17

    invoke-direct {v1, v0, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheTree;-><init>([BLorg/eclipse/jgit/util/MutableInteger;Lorg/eclipse/jgit/dircache/DirCacheTree;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 488
    .end local v12           #sz:J
    .end local v17           #raw:[B
    :cond_5
    :goto_1
    const/16 v1, 0x15

    invoke-virtual {v4, v1}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 489
    const/4 v1, 0x0

    const/16 v8, 0x14

    invoke-static {v4, v11, v1, v8}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 490
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->read()I

    move-result v1

    if-gez v1, :cond_6

    .line 533
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->readIndexChecksum:[B

    .line 534
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/eclipse/jgit/dircache/DirCache;->readIndexChecksum:[B

    invoke-static {v1, v11}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_8

    .line 535
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->DIRCChecksumMismatch:Ljava/lang/String;

    invoke-direct {v1, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 496
    :cond_6
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->reset()V

    .line 497
    const/4 v1, 0x0

    const/16 v8, 0x8

    invoke-virtual {v5, v11, v1, v8}, Ljava/security/MessageDigest;->update([BII)V

    .line 498
    const-wide/16 v8, 0x8

    invoke-static {v4, v8, v9}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 500
    const/4 v1, 0x4

    invoke-static {v11, v1}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v12

    .line 501
    .restart local v12       #sz:J
    const/4 v1, 0x0

    invoke-static {v11, v1}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 515
    const/4 v1, 0x0

    aget-byte v1, v11, v1

    const/16 v8, 0x41

    if-lt v1, v8, :cond_7

    const/4 v1, 0x0

    aget-byte v1, v11, v1

    const/16 v8, 0x5a

    if-gt v1, v8, :cond_7

    move-object/from16 v8, p0

    move-object v9, v4

    move-object v10, v5

    .line 521
    invoke-direct/range {v8 .. v13}, Lorg/eclipse/jgit/dircache/DirCache;->skipOptionalExtension(Ljava/io/InputStream;Ljava/security/MessageDigest;[BJ)V

    goto :goto_1

    .line 503
    :pswitch_0
    const-wide/32 v8, 0x7fffffff

    cmp-long v1, v8, v12

    if-gez v1, :cond_4

    .line 504
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->DIRCExtensionIsTooLargeAt:Ljava/lang/String;

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v11}, Lorg/eclipse/jgit/dircache/DirCache;->formatExtensionName([B)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v9, v10

    const/4 v10, 0x1

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    aput-object v19, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v1, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 527
    :cond_7
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->DIRCExtensionNotSupportedByThisVersion:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v11}, Lorg/eclipse/jgit/dircache/DirCache;->formatExtensionName([B)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v1, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 537
    .end local v12           #sz:J
    :cond_8
    return-void

    .line 501
    :pswitch_data_0
    .packed-switch 0x54524545
        :pswitch_0
    .end packed-switch
.end method

.method private registerIndexChangedListener(Lorg/eclipse/jgit/events/IndexChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 950
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCache;->indexChangedListener:Lorg/eclipse/jgit/events/IndexChangedListener;

    .line 951
    return-void
.end method

.method private requireLocked(Lorg/eclipse/jgit/internal/storage/file/LockFile;)V
    .locals 5
    .parameter "tmp"

    .prologue
    .line 712
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    if-nez v0, :cond_0

    .line 713
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->dirCacheIsNotLocked:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 714
    :cond_0
    if-nez p1, :cond_1

    .line 715
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->dirCacheFileIsNotLocked:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 717
    :cond_1
    return-void
.end method

.method private skipOptionalExtension(Ljava/io/InputStream;Ljava/security/MessageDigest;[BJ)V
    .locals 7
    .parameter "in"
    .parameter "md"
    .parameter "hdr"
    .parameter "sz"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 542
    const/16 v2, 0x1000

    new-array v0, v2, [B

    .line 543
    .local v0, b:[B
    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v2, v2, p4

    if-gez v2, :cond_1

    .line 544
    array-length v2, v0

    int-to-long v2, v2

    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {p1, v0, v6, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 545
    .local v1, n:I
    if-gez v1, :cond_0

    .line 546
    new-instance v2, Ljava/io/EOFException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->shortReadOfOptionalDIRCExtensionExpectedAnotherBytes:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p3}, Lorg/eclipse/jgit/dircache/DirCache;->formatExtensionName([B)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    const/4 v5, 0x1

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 551
    :cond_0
    invoke-virtual {p2, v0, v6, v1}, Ljava/security/MessageDigest;->update([BII)V

    .line 552
    int-to-long v2, v1

    sub-long/2addr p4, v2

    .line 553
    goto :goto_0

    .line 554
    .end local v1           #n:I
    :cond_1
    return-void
.end method

.method private updateSmudgedEntries()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 959
    new-instance v5, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCache;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 960
    .local v5, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    new-instance v4, Ljava/util/ArrayList;

    const/16 v6, 0x80

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 962
    .local v4, paths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    :try_start_0
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-ge v2, v6, :cond_1

    .line 963
    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v6, v6, v2

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isSmudged()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 964
    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v6, v6, v2

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 962
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 965
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-eqz v6, :cond_2

    .line 988
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    .line 990
    :goto_1
    return-void

    .line 967
    :cond_2
    :try_start_1
    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 969
    new-instance v3, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-direct {v3, p0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    .line 970
    .local v3, iIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    new-instance v1, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCache;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v6}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 971
    .local v1, fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 972
    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 973
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 974
    :cond_3
    :goto_2
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 975
    const/4 v6, 0x0

    const-class v7, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v3

    .end local v3           #iIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    check-cast v3, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 976
    .restart local v3       #iIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-eqz v3, :cond_3

    .line 978
    const/4 v6, 0x1

    const-class v7, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    .end local v1           #fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    check-cast v1, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    .line 979
    .restart local v1       #fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    if-eqz v1, :cond_3

    .line 981
    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 982
    .local v0, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isSmudged()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 983
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryLength()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(J)V

    .line 984
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryLastModified()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 988
    .end local v0           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v1           #fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    .end local v3           #iIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    :catchall_0
    move-exception v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    throw v6

    .restart local v1       #fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    .restart local v3       #iIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    :cond_4
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    goto :goto_1
.end method


# virtual methods
.method public builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .locals 2

    .prologue
    .line 366
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    add-int/lit8 v1, v1, 0x10

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;-><init>(Lorg/eclipse/jgit/dircache/DirCache;I)V

    return-object v0
.end method

.method public clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 441
    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 442
    sget-object v0, Lorg/eclipse/jgit/dircache/DirCache;->NO_ENTRIES:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 443
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    .line 444
    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 445
    sget-object v0, Lorg/eclipse/jgit/dircache/DirCache;->NO_CHECKSUM:[B

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->readIndexChecksum:[B

    .line 446
    return-void
.end method

.method public commit()Z
    .locals 3

    .prologue
    .line 699
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 700
    .local v0, tmp:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCache;->requireLocked(Lorg/eclipse/jgit/internal/storage/file/LockFile;)V

    .line 701
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 702
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commit()Z

    move-result v1

    if-nez v1, :cond_0

    .line 703
    const/4 v1, 0x0

    .line 708
    :goto_0
    return v1

    .line 704
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getCommitSnapshot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 705
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->indexChangedListener:Lorg/eclipse/jgit/events/IndexChangedListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->readIndexChecksum:[B

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->writeIndexChecksum:[B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_1

    .line 707
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->indexChangedListener:Lorg/eclipse/jgit/events/IndexChangedListener;

    new-instance v2, Lorg/eclipse/jgit/events/IndexChangedEvent;

    invoke-direct {v2}, Lorg/eclipse/jgit/events/IndexChangedEvent;-><init>()V

    invoke-interface {v1, v2}, Lorg/eclipse/jgit/events/IndexChangedListener;->onIndexChanged(Lorg/eclipse/jgit/events/IndexChangedEvent;)V

    .line 708
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public editor()Lorg/eclipse/jgit/dircache/DirCacheEditor;
    .locals 2

    .prologue
    .line 378
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEditor;

    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    add-int/lit8 v1, v1, 0x10

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEditor;-><init>(Lorg/eclipse/jgit/dircache/DirCache;I)V

    return-object v0
.end method

.method public findEntry(Ljava/lang/String;)I
    .locals 2
    .parameter "path"

    .prologue
    .line 743
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    .line 744
    .local v0, p:[B
    array-length v1, v0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/dircache/DirCache;->findEntry([BI)I

    move-result v1

    return v1
.end method

.method public findEntry([BI)I
    .locals 6
    .parameter "p"
    .parameter "pLen"

    .prologue
    .line 767
    const/4 v2, 0x0

    .line 768
    .local v2, low:I
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    .line 769
    .local v1, high:I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 770
    add-int v4, v2, v1

    ushr-int/lit8 v3, v4, 0x1

    .line 771
    .local v3, mid:I
    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v4, v4, v3

    invoke-static {p1, p2, v4}, Lorg/eclipse/jgit/dircache/DirCache;->cmp([BILorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v0

    .line 772
    .local v0, cmp:I
    if-gez v0, :cond_0

    .line 773
    move v1, v3

    goto :goto_0

    .line 774
    :cond_0
    if-nez v0, :cond_1

    .line 775
    :goto_1
    if-lez v3, :cond_3

    iget-object v4, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    add-int/lit8 v5, v3, -0x1

    aget-object v4, v4, v5

    invoke-static {p1, p2, v4}, Lorg/eclipse/jgit/dircache/DirCache;->cmp([BILorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v4

    if-nez v4, :cond_3

    .line 776
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 779
    :cond_1
    add-int/lit8 v2, v3, 0x1

    goto :goto_0

    .line 781
    .end local v0           #cmp:I
    .end local v3           #mid:I
    :cond_2
    add-int/lit8 v4, v2, 0x1

    neg-int v3, v4

    :cond_3
    return v3
.end method

.method public getCacheTree(Z)Lorg/eclipse/jgit/dircache/DirCacheTree;
    .locals 4
    .parameter "build"

    .prologue
    const/4 v3, 0x0

    .line 903
    if-eqz p1, :cond_1

    .line 904
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-nez v0, :cond_0

    .line 905
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-direct {v0}, Lorg/eclipse/jgit/dircache/DirCacheTree;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 906
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    invoke-virtual {v0, v1, v2, v3, v3}, Lorg/eclipse/jgit/dircache/DirCacheTree;->validate([Lorg/eclipse/jgit/dircache/DirCacheEntry;III)V

    .line 908
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    return-object v0
.end method

.method public getEntriesWithin(Ljava/lang/String;)[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 8
    .parameter "path"

    .prologue
    const/4 v7, 0x0

    .line 866
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_0

    .line 867
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    array-length v5, v5

    new-array v4, v5, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 868
    .local v4, r:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    array-length v6, v6

    invoke-static {v5, v7, v4, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 882
    :goto_0
    return-object v4

    .line 871
    .end local v4           #r:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 872
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 873
    :cond_1
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v2

    .line 874
    .local v2, p:[B
    array-length v3, v2

    .line 876
    .local v3, pLen:I
    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/dircache/DirCache;->findEntry([BI)I

    move-result v0

    .line 877
    .local v0, eIdx:I
    if-gez v0, :cond_2

    .line 878
    add-int/lit8 v5, v0, 0x1

    neg-int v0, v5

    .line 879
    :cond_2
    invoke-virtual {p0, v2, v3, v0}, Lorg/eclipse/jgit/dircache/DirCache;->nextEntry([BII)I

    move-result v1

    .line 880
    .local v1, lastIdx:I
    sub-int v5, v1, v0

    new-array v4, v5, [Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 881
    .restart local v4       #r:[Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    array-length v6, v4

    invoke-static {v5, v0, v4, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public getEntry(I)Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 1
    .parameter "i"

    .prologue
    .line 843
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getEntry(Ljava/lang/String;)Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 2
    .parameter "path"

    .prologue
    .line 854
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/dircache/DirCache;->findEntry(Ljava/lang/String;)I

    move-result v0

    .line 855
    .local v0, i:I
    if-gez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v1, v1, v0

    goto :goto_0
.end method

.method public getEntryCount()I
    .locals 1

    .prologue
    .line 832
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    return v0
.end method

.method public hasUnmergedPaths()Z
    .locals 2

    .prologue
    .line 941
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-ge v0, v1, :cond_1

    .line 942
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v1

    if-lez v1, :cond_0

    .line 943
    const/4 v1, 0x1

    .line 946
    :goto_1
    return v1

    .line 941
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 946
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public isOutdated()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 434
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 436
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public lock()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 580
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    if-nez v2, :cond_0

    .line 581
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->dirCacheDoesNotHaveABackingFile:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 582
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCache;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 583
    .local v0, tmp:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 584
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setNeedStatInformation(Z)V

    .line 585
    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 588
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public nextEntry(I)I
    .locals 4
    .parameter "position"

    .prologue
    .line 796
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v0, v3, p1

    .line 797
    .local v0, last:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    add-int/lit8 v2, p1, 0x1

    .line 798
    .local v2, nextIdx:I
    :goto_0
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-ge v2, v3, :cond_0

    .line 799
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v1, v3, v2

    .line 800
    .local v1, next:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/dircache/DirCache;->cmp(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)I

    move-result v3

    if-eqz v3, :cond_1

    .line 805
    .end local v1           #next:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    return v2

    .line 802
    .restart local v1       #next:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_1
    move-object v0, v1

    .line 803
    add-int/lit8 v2, v2, 0x1

    .line 804
    goto :goto_0
.end method

.method nextEntry([BII)I
    .locals 2
    .parameter "p"
    .parameter "pLen"
    .parameter "nextIdx"

    .prologue
    .line 809
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-ge p3, v1, :cond_0

    .line 810
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v0, v1, p3

    .line 811
    .local v0, next:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v1, v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    invoke-static {p1, v1, p2}, Lorg/eclipse/jgit/dircache/DirCacheTree;->peq([B[BI)Z

    move-result v1

    if-nez v1, :cond_1

    .line 815
    .end local v0           #next:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    return p3

    .line 813
    .restart local v0       #next:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_1
    add-int/lit8 p3, p3, 0x1

    .line 814
    goto :goto_0
.end method

.method public read()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 402
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    if-nez v2, :cond_0

    .line 403
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->dirCacheDoesNotHaveABackingFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 404
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    .line 405
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCache;->clear()V

    .line 427
    :cond_1
    :goto_0
    return-void

    .line 406
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 408
    :cond_3
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 410
    .local v1, inStream:Ljava/io/FileInputStream;
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCache;->clear()V

    .line 411
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/dircache/DirCache;->readFrom(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 414
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 425
    .end local v1           #inStream:Ljava/io/FileInputStream;
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->liveFile:Ljava/io/File;

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    goto :goto_0

    .line 413
    .restart local v1       #inStream:Ljava/io/FileInputStream;
    :catchall_0
    move-exception v2

    .line 414
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    .line 417
    :goto_2
    :try_start_4
    throw v2
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .line 419
    .end local v1           #inStream:Ljava/io/FileInputStream;
    :catch_0
    move-exception v0

    .line 423
    .local v0, fnfe:Ljava/io/FileNotFoundException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCache;->clear()V

    goto :goto_1

    .line 415
    .end local v0           #fnfe:Ljava/io/FileNotFoundException;
    .restart local v1       #inStream:Ljava/io/FileInputStream;
    :catch_1
    move-exception v2

    goto :goto_1

    :catch_2
    move-exception v3

    goto :goto_2
.end method

.method replace([Lorg/eclipse/jgit/dircache/DirCacheEntry;I)V
    .locals 1
    .parameter "e"
    .parameter "cnt"

    .prologue
    .line 382
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 383
    iput p2, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    .line 384
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 385
    return-void
.end method

.method toArray(I[Lorg/eclipse/jgit/dircache/DirCacheEntry;II)V
    .locals 1
    .parameter "i"
    .parameter "dst"
    .parameter "off"
    .parameter "cnt"

    .prologue
    .line 887
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-static {v0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 888
    return-void
.end method

.method public unlock()V
    .locals 2

    .prologue
    .line 725
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 726
    .local v0, tmp:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    if-eqz v0, :cond_0

    .line 727
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 728
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 730
    :cond_0
    return-void
.end method

.method public write()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 607
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    .line 608
    .local v1, tmp:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/dircache/DirCache;->requireLocked(Lorg/eclipse/jgit/internal/storage/file/LockFile;)V

    .line 610
    :try_start_0
    new-instance v2, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/dircache/DirCache;->writeTo(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    .line 621
    return-void

    .line 611
    :catch_0
    move-exception v0

    .line 612
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 613
    throw v0

    .line 614
    .end local v0           #err:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 615
    .local v0, err:Ljava/lang/RuntimeException;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 616
    throw v0

    .line 617
    .end local v0           #err:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v0

    .line 618
    .local v0, err:Ljava/lang/Error;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 619
    throw v0
.end method

.method writeTo(Ljava/io/OutputStream;)V
    .locals 14
    .parameter "os"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 624
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v4

    .line 625
    .local v4, foot:Ljava/security/MessageDigest;
    new-instance v1, Ljava/security/DigestOutputStream;

    invoke-direct {v1, p1, v4}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 627
    .local v1, dos:Ljava/security/DigestOutputStream;
    const/4 v3, 0x0

    .line 628
    .local v3, extended:Z
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    iget v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-ge v5, v10, :cond_0

    .line 629
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v10, v10, v5

    invoke-virtual {v10}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isExtended()Z

    move-result v10

    or-int/2addr v3, v10

    .line 628
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 633
    :cond_0
    const/16 v10, 0x80

    new-array v8, v10, [B

    .line 634
    .local v8, tmp:[B
    sget-object v10, Lorg/eclipse/jgit/dircache/DirCache;->SIG_DIRC:[B

    const/4 v11, 0x0

    const/4 v12, 0x0

    sget-object v13, Lorg/eclipse/jgit/dircache/DirCache;->SIG_DIRC:[B

    array-length v13, v13

    invoke-static {v10, v11, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 635
    const/4 v11, 0x4

    if-eqz v3, :cond_3

    const/4 v10, 0x3

    :goto_1
    invoke-static {v8, v11, v10}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 636
    const/16 v10, 0x8

    iget v11, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    invoke-static {v8, v10, v11}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 637
    const/4 v10, 0x0

    const/16 v11, 0xc

    invoke-virtual {v1, v8, v10, v11}, Ljava/security/DigestOutputStream;->write([BII)V

    .line 643
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    if-eqz v10, :cond_4

    .line 648
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->createCommitSnapshot()V

    .line 649
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->myLock:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getCommitSnapshot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v10

    iput-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 650
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    long-to-int v7, v10

    .line 651
    .local v7, smudge_s:I
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->lastModified()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    rem-long/2addr v10, v12

    long-to-int v10, v10

    const v11, 0xf4240

    mul-int v6, v10, v11

    .line 660
    .local v6, smudge_ns:I
    :goto_2
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v10, :cond_5

    const/4 v9, 0x1

    .line 662
    .local v9, writeTree:Z
    :goto_3
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->repository:Lorg/eclipse/jgit/lib/Repository;

    if-eqz v10, :cond_1

    iget v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-lez v10, :cond_1

    .line 663
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCache;->updateSmudgedEntries()V

    .line 665
    :cond_1
    const/4 v5, 0x0

    :goto_4
    iget v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->entryCnt:I

    if-ge v5, v10, :cond_6

    .line 666
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    aget-object v2, v10, v5

    .line 667
    .local v2, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v2, v7, v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->mightBeRacilyClean(II)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 668
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->smudgeRacilyClean()V

    .line 669
    :cond_2
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->write(Ljava/io/OutputStream;)V

    .line 665
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 635
    .end local v2           #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v6           #smudge_ns:I
    .end local v7           #smudge_s:I
    .end local v9           #writeTree:Z
    :cond_3
    const/4 v10, 0x2

    goto :goto_1

    .line 654
    :cond_4
    const/4 v6, 0x0

    .line 655
    .restart local v6       #smudge_ns:I
    const/4 v7, 0x0

    .restart local v7       #smudge_s:I
    goto :goto_2

    .line 660
    :cond_5
    const/4 v9, 0x0

    goto :goto_3

    .line 672
    .restart local v9       #writeTree:Z
    :cond_6
    if-eqz v9, :cond_7

    .line 673
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;-><init>()V

    .line 674
    .local v0, bb:Lorg/eclipse/jgit/util/TemporaryBuffer;
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->tree:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-virtual {v10, v8, v0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->write([BLjava/io/OutputStream;)V

    .line 675
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->close()V

    .line 677
    const/4 v10, 0x0

    const v11, 0x54524545

    invoke-static {v8, v10, v11}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 678
    const/4 v10, 0x4

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->length()J

    move-result-wide v11

    long-to-int v11, v11

    invoke-static {v8, v10, v11}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 679
    const/4 v10, 0x0

    const/16 v11, 0x8

    invoke-virtual {v1, v8, v10, v11}, Ljava/security/DigestOutputStream;->write([BII)V

    .line 680
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Lorg/eclipse/jgit/util/TemporaryBuffer;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 682
    .end local v0           #bb:Lorg/eclipse/jgit/util/TemporaryBuffer;
    :cond_7
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v10

    iput-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->writeIndexChecksum:[B

    .line 683
    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCache;->writeIndexChecksum:[B

    invoke-virtual {p1, v10}, Ljava/io/OutputStream;->write([B)V

    .line 684
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 685
    return-void
.end method

.method public writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "ow"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/UnmergedPathException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 930
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/dircache/DirCache;->getCacheTree(Z)Lorg/eclipse/jgit/dircache/DirCacheTree;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCache;->sortedEntries:[Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v0, v1, v2, v2, p1}, Lorg/eclipse/jgit/dircache/DirCacheTree;->writeTree([Lorg/eclipse/jgit/dircache/DirCacheEntry;IILorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method
