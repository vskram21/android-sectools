.class public Lorg/eclipse/jgit/lib/TreeFormatter;
.super Ljava/lang/Object;
.source "TreeFormatter.java"


# instance fields
.field private buf:[B

.field private overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

.field private ptr:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 98
    const/16 v0, 0x2000

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/TreeFormatter;-><init>(I)V

    .line 99
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "size"

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    .line 111
    return-void
.end method

.method public static entrySize(Lorg/eclipse/jgit/lib/FileMode;I)I
    .locals 1
    .parameter "mode"
    .parameter "nameLen"

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileMode;->copyToLength()I

    move-result v0

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x14

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method private fmtBuf([BIILorg/eclipse/jgit/lib/FileMode;)Z
    .locals 4
    .parameter "nameBuf"
    .parameter "namePos"
    .parameter "nameLen"
    .parameter "mode"

    .prologue
    const/4 v0, 0x0

    .line 248
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    array-length v1, v1

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-static {p4, p3}, Lorg/eclipse/jgit/lib/TreeFormatter;->entrySize(Lorg/eclipse/jgit/lib/FileMode;I)I

    move-result v3

    add-int/2addr v2, v3

    if-ge v1, v2, :cond_1

    .line 258
    :cond_0
    :goto_0
    return v0

    .line 251
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-virtual {p4, v1, v2}, Lorg/eclipse/jgit/lib/FileMode;->copyTo([BI)V

    .line 252
    iget v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-virtual {p4}, Lorg/eclipse/jgit/lib/FileMode;->copyToLength()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    .line 253
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    const/16 v3, 0x20

    aput-byte v3, v1, v2

    .line 255
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 256
    iget v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    .line 257
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    aput-byte v0, v1, v2

    .line 258
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private fmtOverflowBuffer([BIILorg/eclipse/jgit/lib/FileMode;)V
    .locals 4
    .parameter "nameBuf"
    .parameter "namePos"
    .parameter "nameLen"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 263
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    if-eqz v0, :cond_0

    .line 264
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    const v1, 0x7fffffff

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    .line 265
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-virtual {v0, v1, v3, v2}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->write([BII)V

    .line 266
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    .line 269
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {p4, v0}, Lorg/eclipse/jgit/lib/FileMode;->copyTo(Ljava/io/OutputStream;)V

    .line 270
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->write(I)V

    .line 271
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->write([BII)V

    .line 272
    iget-object v0, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->write(I)V

    .line 273
    return-void
.end method


# virtual methods
.method public append(Ljava/lang/String;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "name"
    .parameter "mode"
    .parameter "id"

    .prologue
    .line 160
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BLorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 161
    return-void
.end method

.method public append(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevBlob;)V
    .locals 1
    .parameter "name"
    .parameter "blob"

    .prologue
    .line 146
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p0, p1, v0, p2}, Lorg/eclipse/jgit/lib/TreeFormatter;->append(Ljava/lang/String;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 147
    return-void
.end method

.method public append(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "name"
    .parameter "commit"

    .prologue
    .line 122
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p0, p1, v0, p2}, Lorg/eclipse/jgit/lib/TreeFormatter;->append(Ljava/lang/String;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 123
    return-void
.end method

.method public append(Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevTree;)V
    .locals 1
    .parameter "name"
    .parameter "tree"

    .prologue
    .line 134
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p0, p1, v0, p2}, Lorg/eclipse/jgit/lib/TreeFormatter;->append(Ljava/lang/String;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 135
    return-void
.end method

.method public append([BIILorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 3
    .parameter "nameBuf"
    .parameter "namePos"
    .parameter "nameLen"
    .parameter "mode"
    .parameter "id"

    .prologue
    .line 196
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/TreeFormatter;->fmtBuf([BIILorg/eclipse/jgit/lib/FileMode;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 197
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-virtual {p5, v1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copyRawTo([BI)V

    .line 198
    iget v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    add-int/lit8 v1, v1, 0x14

    iput v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    .line 209
    :goto_0
    return-void

    .line 202
    :cond_0
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/TreeFormatter;->fmtOverflowBuffer([BIILorg/eclipse/jgit/lib/FileMode;)V

    .line 203
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {p5, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copyRawTo(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 204
    :catch_0
    move-exception v0

    .line 206
    .local v0, badBuffer:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public append([BIILorg/eclipse/jgit/lib/FileMode;[BI)V
    .locals 4
    .parameter "nameBuf"
    .parameter "namePos"
    .parameter "nameLen"
    .parameter "mode"
    .parameter "idBuf"
    .parameter "idPos"

    .prologue
    const/16 v3, 0x14

    .line 231
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/TreeFormatter;->fmtBuf([BIILorg/eclipse/jgit/lib/FileMode;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 232
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-static {p5, p6, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    iget v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    add-int/lit8 v1, v1, 0x14

    iput v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    .line 244
    :goto_0
    return-void

    .line 237
    :cond_0
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/lib/TreeFormatter;->fmtOverflowBuffer([BIILorg/eclipse/jgit/lib/FileMode;)V

    .line 238
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    const/16 v2, 0x14

    invoke-virtual {v1, p5, p6, v2}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 239
    :catch_0
    move-exception v0

    .line 241
    .local v0, badBuffer:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public append([BLorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 6
    .parameter "name"
    .parameter "mode"
    .parameter "id"

    .prologue
    .line 175
    const/4 v2, 0x0

    array-length v3, p1

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BIILorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 176
    return-void
.end method

.method public computeId(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 7
    .parameter "ins"

    .prologue
    const/4 v6, 0x2

    .line 299
    iget-object v3, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    if-eqz v3, :cond_0

    .line 300
    iget-object v3, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    const/4 v4, 0x0

    iget v5, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-virtual {p1, v6, v3, v4, v5}, Lorg/eclipse/jgit/lib/ObjectInserter;->idFor(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 304
    :goto_0
    return-object v3

    .line 302
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->length()J

    move-result-wide v1

    .line 304
    .local v1, len:J
    const/4 v3, 0x2

    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->openInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-virtual {p1, v3, v1, v2, v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->idFor(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 305
    :catch_0
    move-exception v0

    .line 307
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public insertTo(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6
    .parameter "ins"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    .line 285
    iget-object v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    if-eqz v2, :cond_0

    .line 286
    iget-object v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    const/4 v3, 0x0

    iget v4, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-virtual {p1, v5, v2, v3, v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 289
    :goto_0
    return-object v2

    .line 288
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->length()J

    move-result-wide v0

    .line 289
    .local v0, len:J
    iget-object v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->openInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {p1, v5, v0, v1, v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    goto :goto_0
.end method

.method public toByteArray()[B
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 322
    iget-object v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    if-eqz v2, :cond_0

    .line 323
    iget v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    new-array v1, v2, [B

    .line 324
    .local v1, r:[B
    iget-object v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->buf:[B

    iget v3, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->ptr:I

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 329
    .end local v1           #r:[B
    :goto_0
    return-object v1

    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/lib/TreeFormatter;->overflowBuffer:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 330
    :catch_0
    move-exception v0

    .line 332
    .local v0, err:Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .prologue
    const/16 v8, 0x20

    const/16 v7, 0xa

    .line 339
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/TreeFormatter;->toByteArray()[B

    move-result-object v4

    .line 341
    .local v4, raw:[B
    new-instance v2, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>()V

    .line 342
    .local v2, p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset([B)V

    .line 344
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 345
    .local v3, r:Ljava/lang/StringBuilder;
    const-string v5, "Tree={"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->eof()Z

    move-result v5

    if-nez v5, :cond_0

    .line 347
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 349
    :try_start_0
    new-instance v5, Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-direct {v5}, Lorg/eclipse/jgit/lib/ObjectChecker;-><init>()V

    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkTree([B)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/CorruptObjectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 355
    :cond_0
    :goto_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->eof()Z

    move-result v5

    if-nez v5, :cond_1

    .line 356
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    .line 357
    .local v1, mode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 358
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 359
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 361
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 363
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryPathString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 365
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->next()Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    goto :goto_0

    .line 350
    .end local v1           #mode:Lorg/eclipse/jgit/lib/FileMode;
    :catch_0
    move-exception v0

    .line 351
    .local v0, error:Lorg/eclipse/jgit/errors/CorruptObjectException;
    const-string v5, "*** ERROR: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lorg/eclipse/jgit/errors/CorruptObjectException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 367
    .end local v0           #error:Lorg/eclipse/jgit/errors/CorruptObjectException;
    :cond_1
    const-string v5, "}"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
