.class public Lorg/eclipse/jgit/dircache/DirCacheCheckout;
.super Ljava/lang/Object;
.source "DirCacheCheckout.java"


# instance fields
.field private builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

.field private conflicts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private dc:Lorg/eclipse/jgit/dircache/DirCache;

.field private failOnConflict:Z

.field private headCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

.field private mergeCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

.field private removed:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private repo:Lorg/eclipse/jgit/lib/Repository;

.field private toBeDeleted:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private updated:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

.field private workingTree:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 6
    .parameter "repo"
    .parameter "dc"
    .parameter "mergeCommitTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    const/4 v2, 0x0

    new-instance v5, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    invoke-direct {v5, p1}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 229
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 6
    .parameter "repo"
    .parameter "dc"
    .parameter "mergeCommitTree"
    .parameter "workingTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 211
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 6
    .parameter "repo"
    .parameter "headCommitTree"
    .parameter "dc"
    .parameter "mergeCommitTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v5, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    invoke-direct {v5, p1}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 191
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 1
    .parameter "repo"
    .parameter "headCommitTree"
    .parameter "dc"
    .parameter "mergeCommitTree"
    .parameter "workingTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->updated:Ljava/util/HashMap;

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    .line 109
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->failOnConflict:Z

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->toBeDeleted:Ljava/util/ArrayList;

    .line 166
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    .line 167
    iput-object p3, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    .line 168
    iput-object p2, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->headCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    .line 169
    iput-object p4, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->mergeCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    .line 170
    iput-object p5, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->workingTree:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 171
    return-void
.end method

.method private addTree(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 1
    .parameter "tw"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    if-nez p2, :cond_0

    .line 262
    new-instance v0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>()V

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 265
    :goto_0
    return-void

    .line 264
    :cond_0
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    goto :goto_0
.end method

.method public static checkValidPath(Ljava/lang/String;)V
    .locals 7
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/dircache/InvalidPathException;
        }
    .end annotation

    .prologue
    .line 1262
    new-instance v5, Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-direct {v5}, Lorg/eclipse/jgit/lib/ObjectChecker;-><init>()V

    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->isWindows()Z

    move-result v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/ObjectChecker;->setSafeForWindows(Z)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v5

    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/SystemReader;->isMacOS()Z

    move-result v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/ObjectChecker;->setSafeForMacOS(Z)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v1

    .line 1266
    .local v1, chk:Lorg/eclipse/jgit/lib/ObjectChecker;
    invoke-static {p0}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    .line 1267
    .local v0, bytes:[B
    const/4 v4, 0x0

    .line 1269
    .local v4, segmentStart:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    :try_start_0
    array-length v5, v0

    if-ge v3, v5, :cond_1

    .line 1270
    aget-byte v5, v0, v3

    const/16 v6, 0x2f

    if-ne v5, v6, :cond_0

    .line 1271
    invoke-virtual {v1, v0, v4, v3}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkPathSegment([BII)V

    .line 1272
    add-int/lit8 v4, v3, 0x1

    .line 1269
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1275
    :cond_1
    array-length v5, v0

    invoke-virtual {v1, v0, v4, v5}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkPathSegment([BII)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/CorruptObjectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1279
    return-void

    .line 1276
    :catch_0
    move-exception v2

    .line 1277
    .local v2, e:Lorg/eclipse/jgit/errors/CorruptObjectException;
    new-instance v5, Lorg/eclipse/jgit/dircache/InvalidPathException;

    invoke-virtual {v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/dircache/InvalidPathException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private static checkValidPath(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)V
    .locals 4
    .parameter "t"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/dircache/InvalidPathException;
        }
    .end annotation

    .prologue
    .line 1246
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/ObjectChecker;-><init>()V

    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/SystemReader;->isWindows()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectChecker;->setSafeForWindows(Z)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v2

    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/SystemReader;->isMacOS()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectChecker;->setSafeForMacOS(Z)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v0

    .line 1249
    .local v0, chk:Lorg/eclipse/jgit/lib/ObjectChecker;
    move-object v1, p0

    .local v1, i:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    :goto_0
    if-eqz v1, :cond_0

    .line 1250
    invoke-static {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkValidPathSegment(Lorg/eclipse/jgit/lib/ObjectChecker;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)V

    .line 1249
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getParent()Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v1

    goto :goto_0

    .line 1251
    :cond_0
    return-void
.end method

.method private static checkValidPathSegment(Lorg/eclipse/jgit/lib/ObjectChecker;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)V
    .locals 6
    .parameter "chk"
    .parameter "t"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/dircache/InvalidPathException;
        }
    .end annotation

    .prologue
    .line 1284
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getNameOffset()I

    move-result v4

    .line 1285
    .local v4, ptr:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getNameLength()I

    move-result v5

    add-int v0, v4, v5

    .line 1286
    .local v0, end:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryPathBuffer()[B

    move-result-object v5

    invoke-virtual {p0, v5, v4, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkPathSegment([BII)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/CorruptObjectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1293
    return-void

    .line 1287
    .end local v0           #end:I
    .end local v4           #ptr:I
    :catch_0
    move-exception v1

    .line 1288
    .local v1, err:Lorg/eclipse/jgit/errors/CorruptObjectException;
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryPathString()Ljava/lang/String;

    move-result-object v3

    .line 1289
    .local v3, path:Ljava/lang/String;
    new-instance v2, Lorg/eclipse/jgit/dircache/InvalidPathException;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/dircache/InvalidPathException;-><init>(Ljava/lang/String;)V

    .line 1290
    .local v2, i:Lorg/eclipse/jgit/dircache/InvalidPathException;
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/dircache/InvalidPathException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 1291
    throw v2
.end method

.method public static checkoutEntry(Lorg/eclipse/jgit/lib/Repository;Ljava/io/File;Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 2
    .parameter "repository"
    .parameter "f"
    .parameter "entry"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1162
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    .line 1164
    .local v0, or:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    invoke-static {p0, p1, p2, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkoutEntry(Lorg/eclipse/jgit/lib/Repository;Ljava/io/File;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1166
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 1168
    return-void

    .line 1166
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v1
.end method

.method public static checkoutEntry(Lorg/eclipse/jgit/lib/Repository;Ljava/io/File;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 16
    .parameter "repo"
    .parameter "f"
    .parameter "entry"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1194
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v5

    .line 1195
    .local v5, ol:Lorg/eclipse/jgit/lib/ObjectLoader;
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    .line 1196
    .local v7, parentDir:Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    .line 1197
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v4

    .line 1198
    .local v4, fs:Lorg/eclipse/jgit/util/FS;
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v11

    sget-object v12, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v11, v12}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    .line 1199
    .local v6, opt:Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v11

    sget-object v12, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v11, v12, :cond_0

    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getSymLinks()Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    move-result-object v11

    sget-object v12, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    if-ne v11, v12, :cond_0

    .line 1201
    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectLoader;->getBytes()[B

    move-result-object v1

    .line 1202
    .local v1, bytes:[B
    invoke-static {v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v9

    .line 1203
    .local v9, target:Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v9}, Lorg/eclipse/jgit/util/FS;->createSymLink(Ljava/io/File;Ljava/lang/String;)V

    .line 1204
    array-length v11, v1

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    .line 1205
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/util/FS;->lastModified(Ljava/io/File;)J

    move-result-wide v11

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 1237
    .end local v1           #bytes:[B
    .end local v9           #target:Ljava/lang/String;
    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->lastModified()J

    move-result-wide v11

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 1238
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getAutoCRLF()Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    move-result-object v11

    sget-object v12, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    if-eq v11, v12, :cond_4

    .line 1239
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->length()J

    move-result-wide v11

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(J)V

    .line 1242
    :goto_1
    return-void

    .line 1207
    :cond_0
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "._"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-static {v11, v12, v7}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v10

    .line 1209
    .local v10, tmpFile:Ljava/io/File;
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1211
    .local v8, rawChannel:Ljava/io/FileOutputStream;
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getAutoCRLF()Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    move-result-object v11

    sget-object v12, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    if-ne v11, v12, :cond_2

    .line 1212
    new-instance v2, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;

    invoke-direct {v2, v8}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1216
    .local v2, channel:Ljava/io/OutputStream;
    :goto_2
    :try_start_0
    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/lib/ObjectLoader;->copyTo(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1218
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 1220
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->isFileMode()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/FS;->supportsExecute()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 1221
    sget-object v11, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getRawMode()I

    move-result v12

    invoke-virtual {v11, v12}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 1222
    invoke-virtual {v4, v10}, Lorg/eclipse/jgit/util/FS;->canExecute(Ljava/io/File;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 1223
    const/4 v11, 0x1

    invoke-virtual {v4, v10, v11}, Lorg/eclipse/jgit/util/FS;->setExecute(Ljava/io/File;Z)Z

    .line 1230
    :cond_1
    :goto_3
    :try_start_1
    move-object/from16 v0, p1

    invoke-static {v10, v0}, Lorg/eclipse/jgit/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1231
    :catch_0
    move-exception v3

    .line 1232
    .local v3, e:Ljava/io/IOException;
    new-instance v11, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->renameFileFailed:Ljava/lang/String;

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1214
    .end local v2           #channel:Ljava/io/OutputStream;
    .end local v3           #e:Ljava/io/IOException;
    :cond_2
    move-object v2, v8

    .restart local v2       #channel:Ljava/io/OutputStream;
    goto :goto_2

    .line 1218
    :catchall_0
    move-exception v11

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    throw v11

    .line 1225
    :cond_3
    invoke-virtual {v4, v10}, Lorg/eclipse/jgit/util/FS;->canExecute(Ljava/io/File;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 1226
    const/4 v11, 0x0

    invoke-virtual {v4, v10, v11}, Lorg/eclipse/jgit/util/FS;->setExecute(Ljava/io/File;Z)Z

    goto :goto_3

    .line 1241
    .end local v2           #channel:Ljava/io/OutputStream;
    .end local v8           #rawChannel:Ljava/io/FileOutputStream;
    .end local v10           #tmpFile:Ljava/io/File;
    :cond_4
    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectLoader;->getSize()J

    move-result-wide v11

    long-to-int v11, v11

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    goto/16 :goto_1
.end method

.method private cleanUpConflicts()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CheckoutConflictException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 1035
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1036
    .local v0, c:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v5

    invoke-direct {v1, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1037
    .local v1, conflict:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_0

    .line 1038
    new-instance v5, Lorg/eclipse/jgit/errors/CheckoutConflictException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->cannotDeleteFile:Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v0, v7, v9

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/errors/CheckoutConflictException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1040
    :cond_0
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removeEmptyParents(Ljava/io/File;)V

    goto :goto_0

    .line 1042
    .end local v0           #c:Ljava/lang/String;
    .end local v1           #conflict:Ljava/io/File;
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1043
    .local v4, r:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v5

    invoke-direct {v2, v5, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1044
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1045
    new-instance v5, Lorg/eclipse/jgit/errors/CheckoutConflictException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->cannotDeleteFile:Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/errors/CheckoutConflictException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1048
    :cond_2
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removeEmptyParents(Ljava/io/File;)V

    goto :goto_1

    .line 1050
    .end local v2           #file:Ljava/io/File;
    .end local v4           #r:Ljava/lang/String;
    :cond_3
    return-void
.end method

.method private conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V
    .locals 3
    .parameter "path"
    .parameter "e"
    .parameter "h"
    .parameter "m"

    .prologue
    const/4 v2, 0x1

    .line 973
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 976
    if-eqz p2, :cond_0

    .line 977
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;I)V

    .line 978
    .local v0, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v0, p2, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->copyMetaData(Lorg/eclipse/jgit/dircache/DirCacheEntry;Z)V

    .line 979
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 982
    .end local v0           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    if-eqz p3, :cond_1

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 983
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryPathString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;I)V

    .line 984
    .restart local v0       #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 985
    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 986
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 989
    .end local v0           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_1
    if-eqz p4, :cond_2

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 990
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {p4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryPathString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;I)V

    .line 991
    .restart local v0       #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {p4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 992
    invoke-virtual {p4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 993
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 995
    .end local v0           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_2
    return-void
.end method

.method private doCheckout()Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CheckoutConflictException;,
            Lorg/eclipse/jgit/errors/IndexWriteException;
        }
    .end annotation

    .prologue
    .line 403
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->toBeDeleted:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 404
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v8

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v5

    .line 406
    .local v5, objectReader:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->headCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v8, :cond_0

    .line 407
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->preScanTwoTrees()V

    .line 411
    :goto_0
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_2

    .line 412
    iget-boolean v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->failOnConflict:Z

    if-eqz v8, :cond_1

    .line 413
    new-instance v9, Lorg/eclipse/jgit/errors/CheckoutConflictException;

    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    iget-object v10, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    new-array v10, v10, [Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-direct {v9, v8}, Lorg/eclipse/jgit/errors/CheckoutConflictException;-><init>([Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 466
    :catchall_0
    move-exception v8

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v8

    .line 409
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->prescanOneTree()V

    goto :goto_0

    .line 415
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->cleanUpConflicts()V

    .line 419
    :cond_2
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v8}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->finish()V

    .line 421
    const/4 v1, 0x0

    .line 422
    .local v1, file:Ljava/io/File;
    const/4 v4, 0x0

    .line 426
    .local v4, last:Ljava/lang/String;
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v2, v8, -0x1

    .local v2, i:I
    :goto_1
    if-ltz v2, :cond_6

    .line 427
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 428
    .local v7, r:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    .end local v1           #file:Ljava/io/File;
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v8

    invoke-direct {v1, v8, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 429
    .restart local v1       #file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v8

    if-nez v8, :cond_4

    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v8

    invoke-virtual {v8, v1}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 435
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v8

    invoke-virtual {v8, v1}, Lorg/eclipse/jgit/util/FS;->isDirectory(Ljava/io/File;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 436
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->toBeDeleted:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 426
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 438
    :cond_4
    if-eqz v4, :cond_5

    invoke-static {v7, v4}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isSamePrefix(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 439
    new-instance v8, Ljava/io/File;

    iget-object v9, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v9

    invoke-direct {v8, v9, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v8}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removeEmptyParents(Ljava/io/File;)V

    .line 440
    :cond_5
    move-object v4, v7

    goto :goto_2

    .line 443
    .end local v7           #r:Ljava/lang/String;
    :cond_6
    if-eqz v1, :cond_7

    .line 444
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removeEmptyParents(Ljava/io/File;)V

    .line 446
    :cond_7
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->updated:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_8
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 448
    .local v6, path:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    .end local v1           #file:Ljava/io/File;
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v8

    invoke-direct {v1, v8, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 449
    .restart local v1       #file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    move-result v8

    if-nez v8, :cond_9

    .line 453
    :cond_9
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v8, v6}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(Ljava/lang/String;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 456
    .local v0, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    sget-object v8, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getRawMode()I

    move-result v9

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v8

    if-nez v8, :cond_8

    .line 459
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v8, v1, v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkoutEntry(Lorg/eclipse/jgit/lib/Repository;Ljava/io/File;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V

    goto :goto_3

    .line 463
    .end local v0           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v6           #path:Ljava/lang/String;
    :cond_a
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v8}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z

    move-result v8

    if-nez v8, :cond_b

    .line 464
    new-instance v8, Lorg/eclipse/jgit/errors/IndexWriteException;

    invoke-direct {v8}, Lorg/eclipse/jgit/errors/IndexWriteException;-><init>()V

    throw v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 466
    :cond_b
    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 468
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->toBeDeleted:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-nez v8, :cond_c

    const/4 v8, 0x1

    :goto_4
    return v8

    :cond_c
    const/4 v8, 0x0

    goto :goto_4
.end method

.method private equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z
    .locals 2
    .parameter "id1"
    .parameter "mode1"
    .parameter "id2"
    .parameter "mode2"

    .prologue
    const/4 v0, 0x0

    .line 499
    invoke-virtual {p2, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 501
    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1, p3}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    goto :goto_0

    :cond_2
    if-nez p3, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private isModifiedSubtree_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Z
    .locals 7
    .parameter "path"
    .parameter "tree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1112
    new-instance v2, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 1114
    .local v2, tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;
    :try_start_0
    new-instance v5, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 1115
    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 1116
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->setRecursive(Z)V

    .line 1117
    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 1118
    :cond_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->next()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1119
    const/4 v5, 0x0

    const-class v6, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {v2, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    .line 1121
    .local v0, dcIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/4 v5, 0x1

    const-class v6, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v2, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 1123
    .local v1, treeIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    if-eqz v0, :cond_1

    if-nez v1, :cond_2

    .line 1132
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    .end local v0           #dcIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v1           #treeIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_0
    return v3

    .line 1125
    .restart local v0       #dcIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v1       #treeIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryRawMode()I

    move-result v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryRawMode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v6

    if-eq v5, v6, :cond_3

    .line 1132
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    goto :goto_0

    .line 1127
    :cond_3
    :try_start_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 1132
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    goto :goto_0

    .end local v0           #dcIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v1           #treeIt:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_4
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    move v3, v4

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    throw v3
.end method

.method private isModifiedSubtree_IndexWorkingtree(Ljava/lang/String;)Z
    .locals 8
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1063
    new-instance v1, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 1065
    .local v1, tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;
    :try_start_0
    new-instance v5, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 1066
    new-instance v5, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 1067
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->setRecursive(Z)V

    .line 1068
    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 1071
    :cond_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->next()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1072
    const/4 v5, 0x0

    const-class v6, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {v1, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 1073
    .local v0, dcIt:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    const/4 v5, 0x1

    const-class v6, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v1, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1074
    .local v2, wtIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    if-eqz v0, :cond_1

    if-nez v2, :cond_2

    .line 1083
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    .end local v0           #dcIt:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v2           #wtIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :goto_0
    return v3

    .line 1076
    .restart local v0       #dcIt:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .restart local v2       #wtIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v5

    const/4 v6, 0x1

    iget-object v7, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v7

    invoke-virtual {v2, v5, v6, v7}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v5

    if-eqz v5, :cond_0

    .line 1083
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    goto :goto_0

    .end local v0           #dcIt:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v2           #wtIt:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :cond_3
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    move v3, v4

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->release()V

    throw v3
.end method

.method private isModified_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;)Z
    .locals 2
    .parameter "path"
    .parameter "iId"
    .parameter "iMode"
    .parameter "tId"
    .parameter "tMode"
    .parameter "rootTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1090
    if-eq p3, p5, :cond_1

    .line 1096
    :cond_0
    :goto_0
    return v0

    .line 1092
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    if-eqz p2, :cond_2

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1094
    :cond_2
    invoke-direct {p0, p1, p6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModifiedSubtree_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Z

    move-result v0

    goto :goto_0

    .line 1096
    :cond_3
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isSamePrefix(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .parameter "a"
    .parameter "b"

    .prologue
    const/16 v2, 0x2f

    const/4 v4, 0x0

    .line 472
    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 473
    .local v0, as:I
    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 474
    .local v1, bs:I
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method

.method private keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 998
    if-eqz p1, :cond_0

    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 999
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 1000
    :cond_0
    return-void
.end method

.method private remove(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 1003
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1004
    return-void
.end method

.method private removeEmptyParents(Ljava/io/File;)V
    .locals 2
    .parameter "f"

    .prologue
    .line 478
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 480
    .local v0, parentFile:Ljava/io/File;
    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 481
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_1

    .line 485
    :cond_0
    return-void

    .line 483
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method private update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V
    .locals 2
    .parameter "path"
    .parameter "mId"
    .parameter "mode"

    .prologue
    .line 1007
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1008
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->updated:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1009
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;I)V

    .line 1010
    .local v0, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1011
    invoke-virtual {v0, p3}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 1012
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 1014
    .end local v0           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_0
    return-void
.end method


# virtual methods
.method public checkout()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 394
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->doCheckout()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 396
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    throw v0
.end method

.method public getConflicts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getRemoved()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getToBeDeleted()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->toBeDeleted:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getUpdated()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->updated:Ljava/util/HashMap;

    return-object v0
.end method

.method public preScanTwoTrees()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 239
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 240
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->updated:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 241
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 242
    new-instance v0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    .line 243
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 245
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->headCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->addTree(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 246
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->mergeCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->addTree(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 247
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 248
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->workingTree:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 250
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->next()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 251
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v1, 0x0

    const-class v2, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v2, 0x1

    const-class v3, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v3, 0x2

    const-class v4, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v4, 0x3

    const-class v5, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->processEntry(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 255
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isSubtree()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->enterSubtree()V

    goto :goto_0

    .line 258
    :cond_1
    return-void
.end method

.method public prescanOneTree()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 280
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->updated:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 281
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 283
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->dc:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 285
    new-instance v0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    .line 286
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->mergeCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->addTree(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 287
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 288
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->workingTree:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 290
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->next()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 291
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v1, 0x0

    const-class v2, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v2, 0x1

    const-class v3, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v3, 0x2

    const-class v4, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->processEntry(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 294
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isSubtree()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->enterSubtree()V

    goto :goto_0

    .line 297
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->removed:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 298
    return-void
.end method

.method processEntry(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 5
    .parameter "m"
    .parameter "i"
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 311
    if-eqz p1, :cond_9

    .line 312
    invoke-static {p1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkValidPath(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)V

    .line 315
    if-nez p2, :cond_2

    .line 317
    if-eqz p3, :cond_1

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored()Z

    move-result v1

    if-nez v1, :cond_1

    .line 320
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    :cond_0
    :goto_0
    return-void

    .line 322
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryPathString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto :goto_0

    .line 324
    :cond_2
    if-eqz p3, :cond_3

    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 327
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryPathString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto :goto_0

    .line 329
    :cond_4
    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 331
    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v3

    invoke-virtual {p3, v1, v2, v3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v1

    if-eqz v1, :cond_6

    .line 336
    :cond_5
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryPathString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto :goto_0

    .line 341
    :cond_6
    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 342
    .local v0, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLastModified()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_7

    .line 343
    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLastModified()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 344
    :cond_7
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_0

    .line 348
    .end local v0           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_8
    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_0

    .line 352
    :cond_9
    if-eqz p3, :cond_0

    .line 354
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isDirectoryFileConflict()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 355
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 359
    :cond_a
    if-eqz p2, :cond_0

    .line 363
    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getEntryPathString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->remove(Ljava/lang/String;)V

    .line 364
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflicts:Ljava/util/ArrayList;

    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getEntryPathString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method processEntry(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 19
    .parameter "h"
    .parameter "m"
    .parameter "i"
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 523
    if-eqz p3, :cond_2

    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v17

    .line 525
    .local v17, dce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :goto_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    .line 527
    .local v5, name:Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 528
    invoke-static/range {p2 .. p2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkValidPath(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)V

    .line 530
    :cond_0
    if-nez p3, :cond_3

    if-nez p2, :cond_3

    if-nez p1, :cond_3

    .line 532
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isDirectoryFileConflict()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 534
    const/4 v4, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v4, v10, v11}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    .line 963
    :cond_1
    :goto_1
    :sswitch_0
    return-void

    .line 523
    .end local v5           #name:Ljava/lang/String;
    .end local v17           #dce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_2
    const/16 v17, 0x0

    goto :goto_0

    .line 540
    .restart local v5       #name:Ljava/lang/String;
    .restart local v17       #dce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_3
    if-nez p3, :cond_8

    const/4 v6, 0x0

    .line 541
    .local v6, iId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_2
    if-nez p2, :cond_9

    const/4 v8, 0x0

    .line 542
    .local v8, mId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_3
    if-nez p1, :cond_a

    const/4 v14, 0x0

    .line 543
    .local v14, hId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_4
    if-nez p3, :cond_b

    const/4 v7, 0x0

    .line 544
    .local v7, iMode:Lorg/eclipse/jgit/lib/FileMode;
    :goto_5
    if-nez p2, :cond_c

    const/4 v9, 0x0

    .line 545
    .local v9, mMode:Lorg/eclipse/jgit/lib/FileMode;
    :goto_6
    if-nez p1, :cond_d

    const/4 v15, 0x0

    .line 594
    .local v15, hMode:Lorg/eclipse/jgit/lib/FileMode;
    :goto_7
    const/16 v18, 0x0

    .line 595
    .local v18, ffMask:I
    if-eqz p1, :cond_4

    .line 596
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v4, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    const/16 v18, 0xd00

    .line 597
    :cond_4
    :goto_8
    if-eqz p3, :cond_5

    .line 598
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    const/16 v4, 0xd0

    :goto_9
    or-int v18, v18, v4

    .line 599
    :cond_5
    if-eqz p2, :cond_6

    .line 600
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v4, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v4, 0xd

    :goto_a
    or-int v18, v18, v4

    .line 604
    :cond_6
    move/from16 v0, v18

    and-int/lit16 v4, v0, 0x222

    if-eqz v4, :cond_18

    and-int/lit8 v4, v18, 0xf

    const/16 v10, 0xd

    if-eq v4, v10, :cond_7

    move/from16 v0, v18

    and-int/lit16 v4, v0, 0xf0

    const/16 v10, 0xd0

    if-eq v4, v10, :cond_7

    move/from16 v0, v18

    and-int/lit16 v4, v0, 0xf00

    const/16 v10, 0xd00

    if-ne v4, v10, :cond_18

    .line 611
    :cond_7
    sparse-switch v18, :sswitch_data_0

    .line 678
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_1

    .line 540
    .end local v6           #iId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v7           #iMode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v8           #mId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v9           #mMode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v14           #hId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v15           #hMode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v18           #ffMask:I
    :cond_8
    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    goto :goto_2

    .line 541
    .restart local v6       #iId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_9
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    goto :goto_3

    .line 542
    .restart local v8       #mId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    goto :goto_4

    .line 543
    .restart local v14       #hId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_b
    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v7

    goto :goto_5

    .line 544
    .restart local v7       #iMode:Lorg/eclipse/jgit/lib/FileMode;
    :cond_c
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v9

    goto :goto_6

    .line 545
    .restart local v9       #mMode:Lorg/eclipse/jgit/lib/FileMode;
    :cond_d
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v15

    goto :goto_7

    .line 596
    .restart local v15       #hMode:Lorg/eclipse/jgit/lib/FileMode;
    .restart local v18       #ffMask:I
    :cond_e
    const/16 v18, 0xf00

    goto :goto_8

    .line 598
    :cond_f
    const/16 v4, 0xf0

    goto :goto_9

    .line 600
    :cond_10
    const/16 v4, 0xf

    goto :goto_a

    .line 613
    :sswitch_1
    if-eqz p4, :cond_11

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModifiedSubtree_IndexWorkingtree(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 614
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 616
    :cond_11
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto/16 :goto_1

    .line 621
    :sswitch_2
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_1

    .line 624
    :sswitch_3
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->remove(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 627
    :sswitch_4
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v7, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 628
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_1

    .line 630
    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 642
    :sswitch_5
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto/16 :goto_1

    .line 646
    :sswitch_6
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 649
    :sswitch_7
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 650
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModifiedSubtree_IndexWorkingtree(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 651
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 653
    :cond_13
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto/16 :goto_1

    .line 655
    :cond_14
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 658
    :sswitch_8
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_1

    .line 661
    :sswitch_9
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15, v6, v7}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 662
    if-eqz p4, :cond_15

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v10

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4, v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 665
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 667
    :cond_15
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->remove(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 669
    :cond_16
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 672
    :sswitch_a
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModifiedSubtree_IndexWorkingtree(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_17

    .line 673
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto/16 :goto_1

    .line 675
    :cond_17
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 684
    :cond_18
    move/from16 v0, v18

    and-int/lit16 v4, v0, 0x222

    if-nez v4, :cond_19

    if-eqz p4, :cond_1

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 688
    :cond_19
    const/16 v4, 0xf

    move/from16 v0, v18

    if-ne v0, v4, :cond_1a

    if-eqz p4, :cond_1a

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 690
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v5, v4, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 694
    :cond_1a
    if-nez p3, :cond_20

    .line 698
    if-eqz p4, :cond_1c

    .line 700
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v4, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1c

    .line 703
    if-eqz v8, :cond_1b

    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v10

    move-object/from16 v0, p0

    invoke-direct {v0, v8, v9, v4, v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v4

    if-nez v4, :cond_1c

    .line 706
    :cond_1b
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v5, v4, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 724
    :cond_1c
    if-nez p1, :cond_1d

    .line 730
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto/16 :goto_1

    .line 731
    :cond_1d
    if-nez p2, :cond_1e

    .line 737
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->remove(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 746
    :cond_1e
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 747
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_1

    .line 749
    :cond_1f
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 753
    :cond_20
    if-nez p1, :cond_26

    .line 770
    if-eqz p2, :cond_21

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->mergeCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModified_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;)Z

    move-result v4

    if-nez v4, :cond_25

    .line 776
    :cond_21
    if-nez p2, :cond_24

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isDirectoryFileConflict()Z

    move-result v4

    if-eqz v4, :cond_24

    .line 781
    if-eqz v17, :cond_23

    if-eqz p4, :cond_22

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v10

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4, v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v4

    if-eqz v4, :cond_23

    .line 792
    :cond_22
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 802
    :cond_23
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->remove(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 810
    :cond_24
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_1

    .line 817
    :cond_25
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 818
    :cond_26
    if-nez p2, :cond_2b

    .line 834
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v7, v4, :cond_27

    .line 840
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->remove(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 845
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->headCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v16, v0

    move-object/from16 v10, p0

    move-object v11, v5

    move-object v12, v6

    move-object v13, v7

    invoke-direct/range {v10 .. v16}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModified_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;)Z

    move-result v4

    if-nez v4, :cond_2a

    .line 851
    if-eqz p4, :cond_29

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v10

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4, v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 860
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_28

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 868
    :cond_28
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 876
    :cond_29
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->remove(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 885
    :cond_2a
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 891
    :cond_2b
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->equalIdAndMode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v4

    if-nez v4, :cond_2c

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->headCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v16, v0

    move-object/from16 v10, p0

    move-object v11, v5

    move-object v12, v6

    move-object v13, v7

    invoke-direct/range {v10 .. v16}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModified_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;)Z

    move-result v4

    if-eqz v4, :cond_2c

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->mergeCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModified_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 899
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 907
    :cond_2c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->headCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v16, v0

    move-object/from16 v10, p0

    move-object v11, v5

    move-object v12, v6

    move-object v13, v7

    invoke-direct/range {v10 .. v16}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModified_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;)Z

    move-result v4

    if-nez v4, :cond_2f

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->mergeCommitTree:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->isModified_IndexTree(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectId;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 915
    if-eqz v17, :cond_2d

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 925
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto/16 :goto_1

    .line 926
    :cond_2d
    if-eqz v17, :cond_2e

    if-eqz p4, :cond_2e

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->walk:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v10

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v4, v10}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 935
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v5, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->conflict(Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    goto/16 :goto_1

    .line 944
    :cond_2e
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->update(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;)V

    goto/16 :goto_1

    .line 959
    :cond_2f
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_1

    .line 611
    :sswitch_data_0
    .sparse-switch
        0xdf -> :sswitch_a
        0xfd -> :sswitch_6
        0xd0f -> :sswitch_5
        0xddf -> :sswitch_1
        0xdf0 -> :sswitch_6
        0xdfd -> :sswitch_2
        0xdff -> :sswitch_4
        0xf0d -> :sswitch_3
        0xfd0 -> :sswitch_8
        0xfdd -> :sswitch_0
        0xfdf -> :sswitch_7
        0xffd -> :sswitch_9
    .end sparse-switch
.end method

.method public setFailOnConflict(Z)V
    .locals 0
    .parameter "failOnConflict"

    .prologue
    .line 1024
    iput-boolean p1, p0, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->failOnConflict:Z

    .line 1025
    return-void
.end method
