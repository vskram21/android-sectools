.class final Lorg/eclipse/jgit/internal/storage/file/WindowCursor;
.super Lorg/eclipse/jgit/lib/ObjectReader;
.source "WindowCursor.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;


# instance fields
.field private baseCache:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

.field final db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

.field private inf:Ljava/util/zip/Inflater;

.field final tempId:[B

.field private window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectReader;-><init>()V

    .line 82
    const/16 v0, 0x14

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->tempId:[B

    .line 93
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    .line 94
    return-void
.end method

.method private prepareInflater()V
    .locals 1

    .prologue
    .line 341
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    if-nez v0, :cond_0

    .line 342
    invoke-static {}, Lorg/eclipse/jgit/lib/InflaterCache;->get()Ljava/util/zip/Inflater;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    .line 345
    :goto_0
    return-void

    .line 344
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->reset()V

    goto :goto_0
.end method


# virtual methods
.method copy(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BII)I
    .locals 9
    .parameter "pack"
    .parameter "position"
    .parameter "dstbuf"
    .parameter "dstoff"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    iget-wide v6, p1, Lorg/eclipse/jgit/internal/storage/file/PackFile;->length:J

    .line 224
    .local v6, length:J
    move v5, p6

    .line 225
    .local v5, need:I
    :goto_0
    if-lez v5, :cond_0

    cmp-long v0, p2, v6

    if-gez v0, :cond_0

    .line 226
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 227
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-wide v1, p2

    move-object v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->copy(J[BII)I

    move-result v8

    .line 228
    .local v8, r:I
    int-to-long v0, v8

    add-long/2addr p2, v0

    .line 229
    add-int/2addr p5, v8

    .line 230
    sub-int/2addr v5, v8

    .line 231
    goto :goto_0

    .line 232
    .end local v8           #r:I
    :cond_0
    sub-int v0, p6, v5

    return v0
.end method

.method public copyObjectAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Z)V
    .locals 2
    .parameter "out"
    .parameter "otp"
    .parameter "validate"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
        }
    .end annotation

    .prologue
    .line 189
    move-object v0, p2

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;

    .line 190
    .local v0, src:Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    invoke-virtual {v1, p1, v0, p3, p0}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 191
    return-void
.end method

.method copyPackAsIs(Lorg/eclipse/jgit/internal/storage/file/PackFile;JZLorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V
    .locals 18
    .parameter "pack"
    .parameter "length"
    .parameter "validate"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    const/4 v7, 0x0

    .line 243
    .local v7, md:Ljava/security/MessageDigest;
    if-eqz p4, :cond_1

    .line 244
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v7

    .line 245
    invoke-virtual/range {p5 .. p5}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->getCopyBuffer()[B

    move-result-object v11

    .line 246
    .local v11, buf:[B
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 247
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    const/4 v3, 0x0

    const/4 v8, 0x0

    const/16 v9, 0xc

    invoke-virtual {v2, v3, v11, v8, v9}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->copy(I[BII)I

    move-result v2

    const/16 v3, 0xc

    if-eq v2, v3, :cond_0

    .line 248
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->setInvalid()V

    .line 249
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packfileIsTruncated:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 251
    :cond_0
    const/4 v2, 0x0

    const/16 v3, 0xc

    invoke-virtual {v7, v11, v2, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 254
    .end local v11           #buf:[B
    :cond_1
    const-wide/16 v4, 0xc

    .line 255
    .local v4, position:J
    const-wide/16 v2, 0x20

    sub-long v16, p2, v2

    .line 256
    .local v16, remaining:J
    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v16

    if-gez v2, :cond_2

    .line 257
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 259
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    iget-wide v2, v2, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->start:J

    sub-long v2, v4, v2

    long-to-int v15, v2

    .line 260
    .local v15, ptr:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->size()I

    move-result v2

    sub-int/2addr v2, v15

    int-to-long v2, v2

    move-wide/from16 v0, v16

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v6, v2

    .line 261
    .local v6, n:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-object/from16 v3, p5

    invoke-virtual/range {v2 .. v7}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->write(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;JILjava/security/MessageDigest;)V

    .line 262
    int-to-long v2, v6

    add-long/2addr v4, v2

    .line 263
    int-to-long v2, v6

    sub-long v16, v16, v2

    .line 264
    goto :goto_0

    .line 266
    .end local v6           #n:I
    .end local v15           #ptr:I
    :cond_2
    if-eqz v7, :cond_4

    .line 267
    const/16 v2, 0x14

    new-array v11, v2, [B

    .line 268
    .restart local v11       #buf:[B
    invoke-virtual {v7}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v14

    .line 270
    .local v14, actHash:[B
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 271
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    const/4 v12, 0x0

    const/16 v13, 0x14

    move-wide v9, v4

    invoke-virtual/range {v8 .. v13}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->copy(J[BII)I

    move-result v2

    const/16 v3, 0x14

    if-eq v2, v3, :cond_3

    .line 272
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->setInvalid()V

    .line 273
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packfileIsTruncated:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 275
    :cond_3
    invoke-static {v14, v11}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_4

    .line 276
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->setInvalid()V

    .line 277
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packfileCorruptionDetected:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v3, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 282
    .end local v11           #buf:[B
    .end local v14           #actHash:[B
    :cond_4
    return-void
.end method

.method public copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/CachedPack;Z)V
    .locals 0
    .parameter "out"
    .parameter "pack"
    .parameter "validate"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    check-cast p2, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;

    .end local p2
    invoke-virtual {p2, p1, p3, p0}, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 238
    return-void
.end method

.method public getBitmapIndex()Lorg/eclipse/jgit/lib/BitmapIndex;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getPacks()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 110
    .local v2, pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v1

    .line 111
    .local v1, index:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    if-eqz v1, :cond_0

    .line 112
    new-instance v3, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-direct {v3, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V

    .line 114
    .end local v1           #index:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .end local v2           #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :goto_0
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getCachedPacksAndUpdate(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Ljava/util/Collection;
    .locals 5
    .parameter "needBitmap"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/CachedPack;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getPacks()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 120
    .local v2, pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getBitmapIndex()Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v1

    .line 121
    .local v1, index:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    invoke-interface {p1, v1}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->removeAllOrNone(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 122
    new-instance v3, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;-><init>(Ljava/util/List;)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 125
    .end local v1           #index:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .end local v2           #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :goto_0
    return-object v3

    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_0
.end method

.method getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->baseCache:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    if-nez v0, :cond_0

    .line 98
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->baseCache:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    .line 99
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->baseCache:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    return-object v0
.end method

.method public getObjectSize(Lorg/eclipse/jgit/lib/AnyObjectId;I)J
    .locals 5
    .parameter "objectId"
    .parameter "typeHint"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v2, p0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 165
    .local v0, sz:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    .line 166
    const/4 v2, -0x1

    if-ne p2, v2, :cond_0

    .line 167
    new-instance v2, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    const-string v4, "unknown"

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v2

    .line 168
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v2, v3, p2}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v2

    .line 170
    :cond_1
    return-wide v0
.end method

.method public getShallowCommits()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->getShallowCommits()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method getStreamFileThreshold()I
    .locals 1

    .prologue
    .line 362
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->getStreamFileThreshold()I

    move-result v0

    return v0
.end method

.method public has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    return v0
.end method

.method inflate(Lorg/eclipse/jgit/internal/storage/file/PackFile;J[BI)I
    .locals 4
    .parameter "pack"
    .parameter "position"
    .parameter "dstbuf"
    .parameter "dstoff"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    .line 307
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->prepareInflater()V

    .line 308
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 309
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2, p2, p3, v3}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->setInput(JLjava/util/zip/Inflater;)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr p2, v2

    .line 311
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    array-length v3, p4

    sub-int/2addr v3, p5

    invoke-virtual {v2, p4, p5, v3}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v1

    .line 312
    .local v1, n:I
    if-nez v1, :cond_1

    .line 313
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 314
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 315
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2, p2, p3, v3}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->setInput(JLjava/util/zip/Inflater;)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr p2, v2

    .line 321
    :cond_1
    add-int/2addr p5, v1

    .line 322
    array-length v2, p4

    if-lt p5, v2, :cond_0

    move v0, p5

    .line 323
    .end local p5
    .local v0, dstoff:I
    :goto_0
    return v0

    .line 316
    .end local v0           #dstoff:I
    .restart local p5
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->finished()Z

    move-result v2

    if-eqz v2, :cond_3

    move v0, p5

    .line 317
    .end local p5
    .restart local v0       #dstoff:I
    goto :goto_0

    .line 319
    .end local v0           #dstoff:I
    .restart local p5
    :cond_3
    new-instance v2, Ljava/util/zip/DataFormatException;

    invoke-direct {v2}, Ljava/util/zip/DataFormatException;-><init>()V

    throw v2
.end method

.method inflater()Ljava/util/zip/Inflater;
    .locals 1

    .prologue
    .line 336
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->prepareInflater()V

    .line 337
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    return-object v0
.end method

.method public newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;
    .locals 1
    .parameter "objectId"
    .parameter "type"

    .prologue
    .line 174
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    return-object v0
.end method

.method public bridge synthetic newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/file/LocalObjectToPack;

    move-result-object v0

    return-object v0
.end method

.method public newReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 2

    .prologue
    .line 104
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 4
    .parameter "objectId"
    .parameter "typeHint"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 145
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v1, p0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->openObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 146
    .local v0, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-nez v0, :cond_1

    .line 147
    if-ne p2, v2, :cond_0

    .line 148
    new-instance v1, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    const-string v3, "unknown"

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v1

    .line 149
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v1

    .line 151
    :cond_1
    if-eq p2, v2, :cond_2

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getType()I

    move-result v1

    if-eq v1, p2, :cond_2

    .line 152
    new-instance v1, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v1

    .line 153
    :cond_2
    return-object v0
.end method

.method pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V
    .locals 2
    .parameter "pack"
    .parameter "position"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    .line 350
    .local v0, w:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->contains(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Z

    move-result v1

    if-nez v1, :cond_1

    .line 356
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    .line 357
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->get(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    .line 359
    :cond_1
    return-void
.end method

.method quickCopy(Lorg/eclipse/jgit/internal/storage/file/PackFile;JJ)Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;
    .locals 3
    .parameter "p"
    .parameter "pos"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 328
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->pin(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)V

    .line 329
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    instance-of v0, v0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    const-wide/16 v1, 0x1

    sub-long v1, p4, v1

    add-long/2addr v1, p2

    invoke-virtual {v0, p1, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->contains(Lorg/eclipse/jgit/internal/storage/file/PackFile;J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 331
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/ByteArrayWindow;

    .line 332
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 367
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->window:Lorg/eclipse/jgit/internal/storage/file/ByteWindow;

    .line 368
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->baseCache:Lorg/eclipse/jgit/internal/storage/file/DeltaBaseCache;

    .line 370
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/InflaterCache;->release(Ljava/util/zip/Inflater;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 372
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    .line 374
    return-void

    .line 372
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inf:Ljava/util/zip/Inflater;

    throw v0
.end method

.method public resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;
    .locals 2
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->isComplete()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 132
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 135
    :goto_0
    return-object v0

    .line 133
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 134
    .local v0, matches:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v1, v0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)V

    goto :goto_0
.end method

.method public selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/Iterable;)V
    .locals 3
    .parameter "packer"
    .parameter "monitor"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 180
    .local p3, objects:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 181
    .local v1, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    invoke-virtual {v2, p1, v1, p0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 182
    const/4 v2, 0x1

    invoke-interface {p2, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_0

    .line 184
    .end local v1           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_0
    return-void
.end method

.method public writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V
    .locals 3
    .parameter "out"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 196
    .local v1, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeObject(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    goto :goto_0

    .line 197
    .end local v1           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_0
    return-void
.end method
