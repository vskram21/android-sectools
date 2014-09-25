.class Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;
.super Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;
.source "PackBitmapIndexV1.java"


# static fields
.field static final MAGIC:[B = null

.field private static final MAX_XOR_OFFSET:I = 0x7e

.field static final OPT_FULL:I = 0x1


# instance fields
.field private final bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final blobs:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private final commits:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private final packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

.field private final reverseIndex:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

.field private final tags:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private final trees:Lcom/googlecode/javaewah/EWAHCompressedBitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->MAGIC:[B

    return-void

    nop

    :array_0
    .array-data 0x1
        0x42t
        0x49t
        0x54t
        0x4dt
    .end array-data
.end method

.method constructor <init>(Ljava/io/InputStream;Lorg/eclipse/jgit/internal/storage/file/PackIndex;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)V
    .locals 27
    .parameter "fd"
    .parameter "packIndex"
    .parameter "reverseIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    new-instance v22, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct/range {v22 .. v22}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;-><init>(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)V

    .line 86
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    .line 87
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->reverseIndex:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    .line 88
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->getBitmaps()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 90
    const/16 v22, 0x20

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v18, v0

    .line 91
    .local v18, scratch:[B
    const/16 v22, 0x0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 94
    const/4 v9, 0x0

    .local v9, i:I
    :goto_0
    sget-object v22, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->MAGIC:[B

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_1

    .line 95
    aget-byte v22, v18, v9

    sget-object v23, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->MAGIC:[B

    aget-byte v23, v23, v9

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_0

    .line 96
    sget-object v22, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->MAGIC:[B

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    new-array v5, v0, [B

    .line 97
    .local v5, actual:[B
    const/16 v22, 0x0

    const/16 v23, 0x0

    sget-object v24, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->MAGIC:[B

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, v18

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v0, v1, v5, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 98
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->expectedGot:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    sget-object v26, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->MAGIC:[B

    invoke-static/range {v26 .. v26}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x1

    invoke-static {v5}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 94
    .end local v5           #actual:[B
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 105
    :cond_1
    const/16 v22, 0x4

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/NB;->decodeUInt16([BI)I

    move-result v19

    .line 106
    .local v19, version:I
    const/16 v22, 0x1

    move/from16 v0, v19

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    .line 107
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->unsupportedPackIndexVersion:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 112
    :cond_2
    const/16 v22, 0x6

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/NB;->decodeUInt16([BI)I

    move-result v15

    .line 113
    .local v15, opts:I
    packed-switch v15, :pswitch_data_0

    .line 118
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->expectedGot:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const/16 v26, 0x1

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 124
    :pswitch_0
    const/16 v22, 0x8

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v12

    .line 125
    .local v12, numEntries:J
    const-wide/32 v22, 0x7fffffff

    cmp-long v22, v12, v22

    if-lez v22, :cond_3

    .line 126
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->indexFileIsTooLargeForJgit:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 129
    :cond_3
    const/16 v22, 0x14

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->packChecksum:[B

    .line 130
    const/16 v22, 0xc

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->packChecksum:[B

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->packChecksum:[B

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move-object/from16 v0, v18

    move/from16 v1, v22

    move-object/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 133
    new-instance v7, Lorg/eclipse/jgit/internal/storage/file/SimpleDataInput;

    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Lorg/eclipse/jgit/internal/storage/file/SimpleDataInput;-><init>(Ljava/io/InputStream;)V

    .line 134
    .local v7, dataInput:Lorg/eclipse/jgit/internal/storage/file/SimpleDataInput;
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->readBitmap(Ljava/io/DataInput;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->commits:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 135
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->readBitmap(Ljava/io/DataInput;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->trees:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 136
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->readBitmap(Ljava/io/DataInput;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->blobs:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 137
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->readBitmap(Ljava/io/DataInput;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->tags:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 142
    const/16 v22, 0x7e

    move/from16 v0, v22

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    move-object/from16 v16, v0

    .line 143
    .local v16, recentBitmaps:[Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    const/4 v9, 0x0

    :goto_1
    long-to-int v0, v12

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_9

    .line 144
    const/16 v22, 0x0

    const/16 v23, 0x6

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 145
    const/16 v22, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v11

    .line 146
    .local v11, nthObjectId:I
    const/16 v22, 0x4

    aget-byte v21, v18, v22

    .line 147
    .local v21, xorOffset:I
    const/16 v22, 0x5

    aget-byte v8, v18, v22

    .line 148
    .local v8, flags:I
    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->readBitmap(Ljava/io/DataInput;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v6

    .line 150
    .local v6, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    if-gez v11, :cond_4

    .line 151
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->invalidId:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 153
    :cond_4
    if-gez v21, :cond_5

    .line 154
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->invalidId:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 156
    :cond_5
    const/16 v22, 0x7e

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_6

    .line 157
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->expectedLessThanGot:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const/16 v26, 0x7e

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 161
    :cond_6
    move/from16 v0, v21

    if-le v0, v9, :cond_7

    .line 162
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->expectedLessThanGot:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 166
    :cond_7
    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    .line 167
    .local v14, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v20, 0x0

    .line 168
    .local v20, xorBitmap:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    if-lez v21, :cond_8

    .line 169
    sub-int v10, v9, v21

    .line 170
    .local v10, index:I
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v22, v0

    rem-int v22, v10, v22

    aget-object v20, v16, v22

    .line 171
    if-nez v20, :cond_8

    .line 172
    new-instance v22, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v23

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->invalidId:Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 177
    .end local v10           #index:I
    :cond_8
    new-instance v17, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-direct {v0, v14, v6, v1, v8}, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;I)V

    .line 179
    .local v17, sb:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->bitmaps:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 180
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v22, v0

    rem-int v22, v9, v22

    aput-object v17, v16, v22

    .line 143
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 182
    .end local v6           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v8           #flags:I
    .end local v11           #nthObjectId:I
    .end local v14           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v17           #sb:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    .end local v20           #xorBitmap:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;
    .end local v21           #xorOffset:I
    :cond_9
    return-void

    .line 113
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private static readBitmap(Ljava/io/DataInput;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "dataInput"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 240
    new-instance v0, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-direct {v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;-><init>()V

    .line 241
    .local v0, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    invoke-virtual {v0, p0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->deserialize(Ljava/io/DataInput;)V

    .line 242
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    const/4 v0, 0x0

    .line 224
    instance-of v1, p1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;

    if-eqz v1, :cond_0

    .line 225
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->getPackIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    check-cast p1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->getPackIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    .line 226
    :cond_0
    return v0
.end method

.method public findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 4
    .parameter "objectId"

    .prologue
    .line 186
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 187
    .local v0, offset:J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 188
    const/4 v2, -0x1

    .line 189
    :goto_0
    return v2

    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->reverseIndex:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    invoke-virtual {v2, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->findPostion(J)I

    move-result v2

    goto :goto_0
.end method

.method public getObject(I)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "position"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 194
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->reverseIndex:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;->findObjectByPosition(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 195
    .local v0, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v0, :cond_0

    .line 196
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 197
    :cond_0
    return-object v0
.end method

.method public getObjectCount()I
    .locals 2

    .prologue
    .line 202
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method getPackIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->packIndex:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->getPackIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public ofObjectType(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1
    .parameter "bitmap"
    .parameter "type"

    .prologue
    .line 208
    packed-switch p2, :pswitch_data_0

    .line 218
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 210
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->blobs:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    .line 216
    :goto_0
    return-object v0

    .line 212
    :pswitch_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->trees:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_0

    .line 214
    :pswitch_2
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->commits:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_0

    .line 216
    :pswitch_3
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->tags:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    invoke-virtual {v0, p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->and(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    goto :goto_0

    .line 208
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
