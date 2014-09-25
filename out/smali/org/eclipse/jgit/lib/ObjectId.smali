.class public Lorg/eclipse/jgit/lib/ObjectId;
.super Lorg/eclipse/jgit/lib/AnyObjectId;
.source "ObjectId.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final ZEROID:Lorg/eclipse/jgit/lib/ObjectId; = null

.field private static final ZEROID_STR:Ljava/lang/String; = null

.field private static final serialVersionUID:J = 0x1L


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 67
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectId;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(IIIII)V

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectId;->ZEROID:Lorg/eclipse/jgit/lib/ObjectId;

    .line 68
    sget-object v0, Lorg/eclipse/jgit/lib/ObjectId;->ZEROID:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectId;->ZEROID_STR:Ljava/lang/String;

    .line 69
    return-void
.end method

.method constructor <init>(IIIII)V
    .locals 0
    .parameter "new_1"
    .parameter "new_2"
    .parameter "new_3"
    .parameter "new_4"
    .parameter "new_5"

    .prologue
    .line 251
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;-><init>()V

    .line 252
    iput p1, p0, Lorg/eclipse/jgit/lib/ObjectId;->w1:I

    .line 253
    iput p2, p0, Lorg/eclipse/jgit/lib/ObjectId;->w2:I

    .line 254
    iput p3, p0, Lorg/eclipse/jgit/lib/ObjectId;->w3:I

    .line 255
    iput p4, p0, Lorg/eclipse/jgit/lib/ObjectId;->w4:I

    .line 256
    iput p5, p0, Lorg/eclipse/jgit/lib/ObjectId;->w5:I

    .line 257
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "src"

    .prologue
    .line 269
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;-><init>()V

    .line 270
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w1:I

    .line 271
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w2:I

    .line 272
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w3:I

    .line 273
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w4:I

    .line 274
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w5:I

    .line 275
    return-void
.end method

.method public static equals([BI[BI)Z
    .locals 2
    .parameter "firstBuffer"
    .parameter "fi"
    .parameter "secondBuffer"
    .parameter "si"

    .prologue
    .line 130
    aget-byte v0, p0, p1

    aget-byte v1, p2, p3

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x1

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x2

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x3

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x4

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x4

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x5

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x5

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x6

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x6

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x7

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x7

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x8

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x8

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x9

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x9

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0xa

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0xa

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0xb

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0xb

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0xc

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0xc

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0xd

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0xd

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0xe

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0xe

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0xf

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0xf

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x10

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x10

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x11

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x11

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x12

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x12

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x13

    aget-byte v0, p0, v0

    add-int/lit8 v1, p3, 0x13

    aget-byte v1, p2, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static final fromHexString([BI)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 8
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 238
    :try_start_0
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v1

    .line 239
    .local v1, a:I
    add-int/lit8 v0, p1, 0x8

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v2

    .line 240
    .local v2, b:I
    add-int/lit8 v0, p1, 0x10

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v3

    .line 241
    .local v3, c:I
    add-int/lit8 v0, p1, 0x18

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v4

    .line 242
    .local v4, d:I
    add-int/lit8 v0, p1, 0x20

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v5

    .line 243
    .local v5, e:I
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(IIIII)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 244
    .end local v1           #a:I
    .end local v2           #b:I
    .end local v3           #c:I
    .end local v4           #d:I
    .end local v5           #e:I
    :catch_0
    move-exception v6

    .line 245
    .local v6, e1:Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v0, Lorg/eclipse/jgit/errors/InvalidObjectIdException;

    const/16 v7, 0x28

    invoke-direct {v0, p0, p1, v7}, Lorg/eclipse/jgit/errors/InvalidObjectIdException;-><init>([BII)V

    throw v0
.end method

.method public static final fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "bs"

    .prologue
    .line 161
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public static final fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 175
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v1

    .line 176
    .local v1, a:I
    add-int/lit8 v0, p1, 0x4

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v2

    .line 177
    .local v2, b:I
    add-int/lit8 v0, p1, 0x8

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    .line 178
    .local v3, c:I
    add-int/lit8 v0, p1, 0xc

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v4

    .line 179
    .local v4, d:I
    add-int/lit8 v0, p1, 0x10

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v5

    .line 180
    .local v5, e:I
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(IIIII)V

    return-object v0
.end method

.method public static final fromRaw([I)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "is"

    .prologue
    .line 192
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([II)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public static final fromRaw([II)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6
    .parameter "is"
    .parameter "p"

    .prologue
    .line 206
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectId;

    aget v1, p0, p1

    add-int/lit8 v2, p1, 0x1

    aget v2, p0, v2

    add-int/lit8 v3, p1, 0x2

    aget v3, p0, v3

    add-int/lit8 v4, p1, 0x3

    aget v4, p0, v4

    add-int/lit8 v5, p1, 0x4

    aget v5, p0, v5

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(IIIII)V

    return-object v0
.end method

.method public static fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "str"

    .prologue
    .line 231
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x28

    if-eq v0, v1, :cond_0

    .line 232
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 233
    :cond_0
    invoke-static {p0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromHexString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public static final fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "buf"
    .parameter "offset"

    .prologue
    .line 220
    invoke-static {p0, p1}, Lorg/eclipse/jgit/lib/ObjectId;->fromHexString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public static final isId(Ljava/lang/String;)Z
    .locals 5
    .parameter "id"

    .prologue
    const/16 v4, 0x28

    const/4 v2, 0x0

    .line 90
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v3, v4, :cond_0

    .line 98
    :goto_0
    return v2

    .line 93
    :cond_0
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v4, :cond_1

    .line 94
    :try_start_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-byte v3, v3

    invoke-static {v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 96
    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    goto :goto_0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .parameter "ois"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 291
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w1:I

    .line 292
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w2:I

    .line 293
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w3:I

    .line 294
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w4:I

    .line 295
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w5:I

    .line 296
    return-void
.end method

.method public static final toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;
    .locals 1
    .parameter "i"

    .prologue
    .line 110
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/eclipse/jgit/lib/ObjectId;->ZEROID_STR:Ljava/lang/String;

    goto :goto_0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .parameter "os"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 283
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w1:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 284
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w2:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 285
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w3:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 286
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w4:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 287
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectId;->w5:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 288
    return-void
.end method

.method public static final zeroId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 77
    sget-object v0, Lorg/eclipse/jgit/lib/ObjectId;->ZEROID:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method


# virtual methods
.method public toObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 0

    .prologue
    .line 279
    return-object p0
.end method
