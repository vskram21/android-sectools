.class public Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;
.super Ljava/lang/Object;
.source "UnpackedObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 358
    return-void
.end method

.method static synthetic access$100(Ljava/io/InputStream;Ljava/util/zip/Inflater;Lorg/eclipse/jgit/lib/AnyObjectId;[B)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-static {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->checkValidEndOfStream(Ljava/io/InputStream;Ljava/util/zip/Inflater;Lorg/eclipse/jgit/lib/AnyObjectId;[B)V

    return-void
.end method

.method static synthetic access$200(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->buffer(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300([B)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->isStandardFormat([B)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 77
    invoke-static {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->inflate(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/io/InputStream;[BII)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-static {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->readSome(Ljava/io/InputStream;[BII)I

    move-result v0

    return v0
.end method

.method private static buffer(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;
    .locals 2
    .parameter "in"

    .prologue
    .line 341
    new-instance v0, Ljava/io/BufferedInputStream;

    const/16 v1, 0x2000

    invoke-direct {v0, p0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v0
.end method

.method private static checkValidEndOfStream(Ljava/io/InputStream;Ljava/util/zip/Inflater;Lorg/eclipse/jgit/lib/AnyObjectId;[B)V
    .locals 4
    .parameter "in"
    .parameter "inf"
    .parameter "id"
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 244
    :goto_0
    :try_start_0
    invoke-virtual {p1, p3}, Ljava/util/zip/Inflater;->inflate([B)I
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 249
    .local v1, r:I
    if-eqz v1, :cond_0

    .line 250
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectIncorrectLength:Ljava/lang/String;

    invoke-direct {v2, p2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 245
    .end local v1           #r:I
    :catch_0
    move-exception v0

    .line 246
    .local v0, e:Ljava/util/zip/DataFormatException;
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectBadStream:Ljava/lang/String;

    invoke-direct {v2, p2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 253
    .end local v0           #e:Ljava/util/zip/DataFormatException;
    .restart local v1       #r:I
    :cond_0
    invoke-virtual {p1}, Ljava/util/zip/Inflater;->finished()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 254
    invoke-virtual {p1}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_5

    .line 255
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectBadStream:Ljava/lang/String;

    invoke-direct {v2, p2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 260
    :cond_2
    invoke-virtual {p1}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v2

    if-nez v2, :cond_3

    .line 261
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectBadStream:Ljava/lang/String;

    invoke-direct {v2, p2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 264
    :cond_3
    invoke-virtual {p0, p3}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 265
    if-gtz v1, :cond_4

    .line 266
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectBadStream:Ljava/lang/String;

    invoke-direct {v2, p2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v2

    .line 268
    :cond_4
    const/4 v2, 0x0

    invoke-virtual {p1, p3, v2, v1}, Ljava/util/zip/Inflater;->setInput([BII)V

    goto :goto_0

    .line 270
    :cond_5
    return-void
.end method

.method static getSize(Ljava/io/InputStream;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)J
    .locals 13
    .parameter "in"
    .parameter "id"
    .parameter "wc"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    :try_start_0
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->buffer(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;

    move-result-object p0

    .line 198
    const/16 v11, 0x14

    invoke-virtual {p0, v11}, Ljava/io/InputStream;->mark(I)V

    .line 199
    const/16 v11, 0x40

    new-array v3, v11, [B

    .line 200
    .local v3, hdr:[B
    const/4 v11, 0x0

    const/4 v12, 0x2

    invoke-static {p0, v3, v11, v12}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 202
    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->isStandardFormat([B)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 203
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    .line 204
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inflater()Ljava/util/zip/Inflater;

    move-result-object v4

    .line 205
    .local v4, inf:Ljava/util/zip/Inflater;
    invoke-static {p0, v4}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->inflate(Ljava/io/InputStream;Ljava/util/zip/Inflater;)Ljava/util/zip/InflaterInputStream;

    move-result-object v10

    .line 206
    .local v10, zIn:Ljava/io/InputStream;
    const/4 v11, 0x0

    const/16 v12, 0x40

    invoke-static {v10, v3, v11, v12}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->readSome(Ljava/io/InputStream;[BII)I

    move-result v0

    .line 207
    .local v0, avail:I
    const/4 v11, 0x5

    if-ge v0, v11, :cond_0

    .line 208
    new-instance v11, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectNoHeader:Ljava/lang/String;

    invoke-direct {v11, p1, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v11
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    .end local v0           #avail:I
    .end local v3           #hdr:[B
    .end local v4           #inf:Ljava/util/zip/Inflater;
    .end local v10           #zIn:Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 233
    .local v1, badStream:Ljava/util/zip/ZipException;
    new-instance v11, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectBadStream:Ljava/lang/String;

    invoke-direct {v11, p1, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v11

    .line 211
    .end local v1           #badStream:Ljava/util/zip/ZipException;
    .restart local v0       #avail:I
    .restart local v3       #hdr:[B
    .restart local v4       #inf:Ljava/util/zip/Inflater;
    .restart local v10       #zIn:Ljava/io/InputStream;
    :cond_0
    :try_start_1
    new-instance v5, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v5}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    .line 212
    .local v5, p:Lorg/eclipse/jgit/util/MutableInteger;
    const/16 v11, 0x20

    invoke-static {p1, v3, v11, v5}, Lorg/eclipse/jgit/lib/Constants;->decodeTypeString(Lorg/eclipse/jgit/lib/AnyObjectId;[BBLorg/eclipse/jgit/util/MutableInteger;)I

    .line 213
    iget v11, v5, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    invoke-static {v3, v11, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->parseLongBase10([BILorg/eclipse/jgit/util/MutableInteger;)J

    move-result-wide v8

    .line 214
    .local v8, size:J
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-gez v11, :cond_2

    .line 215
    new-instance v11, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectNegativeSize:Ljava/lang/String;

    invoke-direct {v11, p1, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v11

    .line 220
    .end local v0           #avail:I
    .end local v4           #inf:Ljava/util/zip/Inflater;
    .end local v5           #p:Lorg/eclipse/jgit/util/MutableInteger;
    .end local v8           #size:J
    .end local v10           #zIn:Ljava/io/InputStream;
    :cond_1
    const/4 v11, 0x2

    const/16 v12, 0x12

    invoke-static {p0, v3, v11, v12}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->readSome(Ljava/io/InputStream;[BII)I

    .line 221
    const/4 v11, 0x0

    aget-byte v11, v3, v11

    and-int/lit16 v2, v11, 0xff

    .line 222
    .local v2, c:I
    and-int/lit8 v11, v2, 0xf

    int-to-long v8, v11

    .line 223
    .restart local v8       #size:J
    const/4 v7, 0x4

    .line 224
    .local v7, shift:I
    const/4 v5, 0x1

    .local v5, p:I
    move v6, v5

    .line 225
    .end local v5           #p:I
    .local v6, p:I
    :goto_0
    and-int/lit16 v11, v2, 0x80

    if-eqz v11, :cond_2

    .line 226
    add-int/lit8 v5, v6, 0x1

    .end local v6           #p:I
    .restart local v5       #p:I
    aget-byte v11, v3, v6
    :try_end_1
    .catch Ljava/util/zip/ZipException; {:try_start_1 .. :try_end_1} :catch_0

    and-int/lit16 v2, v11, 0xff

    .line 227
    and-int/lit8 v11, v2, 0x7f

    int-to-long v11, v11

    shl-long/2addr v11, v7

    add-long/2addr v8, v11

    .line 228
    add-int/lit8 v7, v7, 0x7

    move v6, v5

    .end local v5           #p:I
    .restart local v6       #p:I
    goto :goto_0

    .line 230
    .end local v2           #c:I
    .end local v6           #p:I
    .end local v7           #shift:I
    :cond_2
    return-wide v8
.end method

.method private static inflate(Ljava/io/InputStream;JLorg/eclipse/jgit/lib/ObjectId;)Ljava/io/InputStream;
    .locals 6
    .parameter "in"
    .parameter "size"
    .parameter "id"

    .prologue
    .line 306
    invoke-static {}, Lorg/eclipse/jgit/lib/InflaterCache;->get()Ljava/util/zip/Inflater;

    move-result-object v2

    .line 307
    .local v2, inf:Ljava/util/zip/Inflater;
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;

    move-object v1, p0

    move-wide v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;JLorg/eclipse/jgit/lib/ObjectId;)V

    return-object v0
.end method

.method private static inflate(Ljava/io/InputStream;Ljava/util/zip/Inflater;)Ljava/util/zip/InflaterInputStream;
    .locals 2
    .parameter "in"
    .parameter "inf"

    .prologue
    .line 337
    new-instance v0, Ljava/util/zip/InflaterInputStream;

    const/16 v1, 0x2000

    invoke-direct {v0, p0, p1, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;I)V

    return-object v0
.end method

.method private static isStandardFormat([B)Z
    .locals 5
    .parameter "hdr"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 300
    aget-byte v3, p0, v2

    and-int/lit16 v0, v3, 0xff

    .line 301
    .local v0, fb:I
    and-int/lit16 v3, v0, 0x8f

    const/16 v4, 0x8

    if-ne v3, v4, :cond_0

    shl-int/lit8 v3, v0, 0x8

    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v3, v4

    rem-int/lit8 v3, v3, 0x1f

    if-nez v3, :cond_0

    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method static open(Ljava/io/InputStream;Ljava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 24
    .parameter "in"
    .parameter "path"
    .parameter "id"
    .parameter "wc"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    :try_start_0
    invoke-static/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->buffer(Ljava/io/InputStream;)Ljava/io/BufferedInputStream;

    move-result-object p0

    .line 106
    const/16 v4, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->mark(I)V

    .line 107
    const/16 v4, 0x40

    new-array v0, v4, [B

    move-object/from16 v17, v0

    .line 108
    .local v17, hdr:[B
    const/4 v4, 0x0

    const/4 v8, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v1, v4, v8}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 110
    invoke-static/range {v17 .. v17}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->isStandardFormat([B)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 111
    invoke-virtual/range {p0 .. p0}, Ljava/io/InputStream;->reset()V

    .line 112
    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inflater()Ljava/util/zip/Inflater;

    move-result-object v18

    .line 113
    .local v18, inf:Ljava/util/zip/Inflater;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->inflate(Ljava/io/InputStream;Ljava/util/zip/Inflater;)Ljava/util/zip/InflaterInputStream;

    move-result-object v23

    .line 114
    .local v23, zIn:Ljava/io/InputStream;
    const/4 v4, 0x0

    const/16 v8, 0x40

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-static {v0, v1, v4, v8}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->readSome(Ljava/io/InputStream;[BII)I

    move-result v12

    .line 115
    .local v12, avail:I
    const/4 v4, 0x5

    if-ge v12, v4, :cond_0

    .line 116
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectNoHeader:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .end local v12           #avail:I
    .end local v17           #hdr:[B
    .end local v18           #inf:Ljava/util/zip/Inflater;
    .end local v23           #zIn:Ljava/io/InputStream;
    :catch_0
    move-exception v13

    .line 189
    .local v13, badStream:Ljava/util/zip/ZipException;
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectBadStream:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v4

    .line 119
    .end local v13           #badStream:Ljava/util/zip/ZipException;
    .restart local v12       #avail:I
    .restart local v17       #hdr:[B
    .restart local v18       #inf:Ljava/util/zip/Inflater;
    .restart local v23       #zIn:Ljava/io/InputStream;
    :cond_0
    :try_start_1
    new-instance v20, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct/range {v20 .. v20}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    .line 120
    .local v20, p:Lorg/eclipse/jgit/util/MutableInteger;
    const/16 v4, 0x20

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    move-object/from16 v2, v20

    invoke-static {v0, v1, v4, v2}, Lorg/eclipse/jgit/lib/Constants;->decodeTypeString(Lorg/eclipse/jgit/lib/AnyObjectId;[BBLorg/eclipse/jgit/util/MutableInteger;)I

    move-result v5

    .line 121
    .local v5, type:I
    move-object/from16 v0, v20

    iget v4, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v4, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseLongBase10([BILorg/eclipse/jgit/util/MutableInteger;)J

    move-result-wide v6

    .line 122
    .local v6, size:J
    const-wide/16 v8, 0x0

    cmp-long v4, v6, v8

    if-gez v4, :cond_1

    .line 123
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectNegativeSize:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v4

    .line 125
    :cond_1
    move-object/from16 v0, v20

    iget v4, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v8, v4, 0x1

    move-object/from16 v0, v20

    iput v8, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    aget-byte v4, v17, v4

    if-eqz v4, :cond_2

    .line 126
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectGarbageAfterSize:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v4

    .line 128
    :cond_2
    if-nez p1, :cond_3

    const-wide/32 v8, 0x7fffffff

    cmp-long v4, v8, v6

    if-gez v4, :cond_3

    .line 130
    new-instance v16, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;

    invoke-direct/range {v16 .. v16}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;-><init>()V

    .line 131
    .local v16, e:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 132
    throw v16

    .line 134
    .end local v16           #e:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;
    :cond_3
    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->getStreamFileThreshold()I

    move-result v4

    int-to-long v8, v4

    cmp-long v4, v6, v8

    if-ltz v4, :cond_4

    if-nez p1, :cond_6

    .line 135
    :cond_4
    long-to-int v4, v6

    new-array v15, v4, [B

    .line 136
    .local v15, data:[B
    move-object/from16 v0, v20

    iget v4, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    sub-int v19, v12, v4

    .line 137
    .local v19, n:I
    if-lez v19, :cond_5

    .line 138
    move-object/from16 v0, v20

    iget v4, v0, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    const/4 v8, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-static {v0, v4, v15, v8, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 139
    :cond_5
    array-length v4, v15

    sub-int v4, v4, v19

    move-object/from16 v0, v23

    move/from16 v1, v19

    invoke-static {v0, v15, v1, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 140
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, p2

    move-object/from16 v3, v17

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->checkValidEndOfStream(Ljava/io/InputStream;Ljava/util/zip/Inflater;Lorg/eclipse/jgit/lib/AnyObjectId;[B)V

    .line 141
    new-instance v4, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;

    invoke-direct {v4, v5, v15}, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;-><init>(I[B)V

    .line 186
    .end local v12           #avail:I
    .end local v15           #data:[B
    .end local v18           #inf:Ljava/util/zip/Inflater;
    .end local v19           #n:I
    .end local v20           #p:Lorg/eclipse/jgit/util/MutableInteger;
    .end local v23           #zIn:Ljava/io/InputStream;
    :goto_0
    return-object v4

    .line 143
    .restart local v12       #avail:I
    .restart local v18       #inf:Ljava/util/zip/Inflater;
    .restart local v20       #p:Lorg/eclipse/jgit/util/MutableInteger;
    .restart local v23       #zIn:Ljava/io/InputStream;
    :cond_6
    new-instance v4, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;

    move-object/from16 v0, p3

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    const/4 v11, 0x0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;-><init>(IJLjava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;)V

    goto :goto_0

    .line 146
    .end local v5           #type:I
    .end local v6           #size:J
    .end local v12           #avail:I
    .end local v18           #inf:Ljava/util/zip/Inflater;
    .end local v20           #p:Lorg/eclipse/jgit/util/MutableInteger;
    .end local v23           #zIn:Ljava/io/InputStream;
    :cond_7
    const/4 v4, 0x2

    const/16 v8, 0x12

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v1, v4, v8}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->readSome(Ljava/io/InputStream;[BII)I

    .line 147
    const/4 v4, 0x0

    aget-byte v4, v17, v4

    and-int/lit16 v14, v4, 0xff

    .line 148
    .local v14, c:I
    shr-int/lit8 v4, v14, 0x4

    and-int/lit8 v5, v4, 0x7

    .line 149
    .restart local v5       #type:I
    and-int/lit8 v4, v14, 0xf

    int-to-long v6, v4

    .line 150
    .restart local v6       #size:J
    const/16 v22, 0x4

    .line 151
    .local v22, shift:I
    const/16 v20, 0x1

    .local v20, p:I
    move/from16 v21, v20

    .line 152
    .end local v20           #p:I
    .local v21, p:I
    :goto_1
    and-int/lit16 v4, v14, 0x80

    if-eqz v4, :cond_8

    .line 153
    add-int/lit8 v20, v21, 0x1

    .end local v21           #p:I
    .restart local v20       #p:I
    aget-byte v4, v17, v21

    and-int/lit16 v14, v4, 0xff

    .line 154
    and-int/lit8 v4, v14, 0x7f

    int-to-long v8, v4

    shl-long v8, v8, v22

    add-long/2addr v6, v8

    .line 155
    add-int/lit8 v22, v22, 0x7

    move/from16 v21, v20

    .end local v20           #p:I
    .restart local v21       #p:I
    goto :goto_1

    .line 158
    :cond_8
    packed-switch v5, :pswitch_data_0

    .line 166
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v8}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    throw v4

    .line 170
    :pswitch_0
    if-nez p1, :cond_9

    const-wide/32 v8, 0x7fffffff

    cmp-long v4, v8, v6

    if-gez v4, :cond_9

    .line 172
    new-instance v16, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;

    invoke-direct/range {v16 .. v16}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;-><init>()V

    .line 173
    .restart local v16       #e:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 174
    throw v16

    .line 176
    .end local v16           #e:Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;
    :cond_9
    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->getStreamFileThreshold()I

    move-result v4

    int-to-long v8, v4

    cmp-long v4, v6, v8

    if-ltz v4, :cond_a

    if-nez p1, :cond_b

    .line 177
    :cond_a
    invoke-virtual/range {p0 .. p0}, Ljava/io/InputStream;->reset()V

    .line 178
    move/from16 v0, v21

    int-to-long v8, v0

    move-object/from16 v0, p0

    invoke-static {v0, v8, v9}, Lorg/eclipse/jgit/util/IO;->skipFully(Ljava/io/InputStream;J)V

    .line 179
    invoke-virtual/range {p3 .. p3}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->inflater()Ljava/util/zip/Inflater;

    move-result-object v18

    .line 180
    .restart local v18       #inf:Ljava/util/zip/Inflater;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->inflate(Ljava/io/InputStream;Ljava/util/zip/Inflater;)Ljava/util/zip/InflaterInputStream;

    move-result-object v23

    .line 181
    .restart local v23       #zIn:Ljava/io/InputStream;
    long-to-int v4, v6

    new-array v15, v4, [B

    .line 182
    .restart local v15       #data:[B
    const/4 v4, 0x0

    array-length v8, v15

    move-object/from16 v0, v23

    invoke-static {v0, v15, v4, v8}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 183
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, p2

    move-object/from16 v3, v17

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->checkValidEndOfStream(Ljava/io/InputStream;Ljava/util/zip/Inflater;Lorg/eclipse/jgit/lib/AnyObjectId;[B)V

    .line 184
    new-instance v4, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;

    invoke-direct {v4, v5, v15}, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;-><init>(I[B)V

    goto/16 :goto_0

    .line 186
    .end local v15           #data:[B
    .end local v18           #inf:Ljava/util/zip/Inflater;
    .end local v23           #zIn:Ljava/io/InputStream;
    :cond_b
    new-instance v4, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;

    move-object/from16 v0, p3

    iget-object v10, v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->db:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;

    const/4 v11, 0x0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$LargeObject;-><init>(IJLjava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Lorg/eclipse/jgit/internal/storage/file/UnpackedObject$1;)V
    :try_end_1
    .catch Ljava/util/zip/ZipException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 158
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static parse([BLorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 3
    .parameter "raw"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 94
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;)V

    .line 96
    .local v0, wc:Lorg/eclipse/jgit/internal/storage/file/WindowCursor;
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const/4 v2, 0x0

    invoke-static {v1, v2, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->open(Ljava/io/InputStream;Ljava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 98
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->release()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCursor;->release()V

    throw v1
.end method

.method private static readSome(Ljava/io/InputStream;[BII)I
    .locals 2
    .parameter "in"
    .parameter "hdr"
    .parameter "off"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 346
    const/4 v0, 0x0

    .line 347
    .local v0, avail:I
    :goto_0
    if-lez p3, :cond_0

    .line 348
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 349
    .local v1, n:I
    if-gez v1, :cond_1

    .line 355
    .end local v1           #n:I
    :cond_0
    return v0

    .line 351
    .restart local v1       #n:I
    :cond_1
    add-int/2addr v0, v1

    .line 352
    add-int/2addr p2, v1

    .line 353
    sub-int/2addr p3, v1

    .line 354
    goto :goto_0
.end method
