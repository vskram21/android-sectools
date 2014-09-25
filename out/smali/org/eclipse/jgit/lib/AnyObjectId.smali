.class public abstract Lorg/eclipse/jgit/lib/AnyObjectId;
.super Ljava/lang/Object;
.source "AnyObjectId.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/eclipse/jgit/lib/AnyObjectId;",
        ">;"
    }
.end annotation


# static fields
.field private static final hexbyte:[B

.field private static final hexchar:[C


# instance fields
.field w1:I

.field w2:I

.field w3:I

.field w4:I

.field w5:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x10

    .line 404
    new-array v0, v1, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/lib/AnyObjectId;->hexbyte:[B

    .line 475
    new-array v0, v1, [C

    fill-array-data v0, :array_1

    sput-object v0, Lorg/eclipse/jgit/lib/AnyObjectId;->hexchar:[C

    return-void

    .line 404
    nop

    :array_0
    .array-data 0x1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data

    .line 475
    :array_1
    .array-data 0x2
        0x30t 0x0t
        0x31t 0x0t
        0x32t 0x0t
        0x33t 0x0t
        0x34t 0x0t
        0x35t 0x0t
        0x36t 0x0t
        0x37t 0x0t
        0x38t 0x0t
        0x39t 0x0t
        0x61t 0x0t
        0x62t 0x0t
        0x63t 0x0t
        0x64t 0x0t
        0x65t 0x0t
        0x66t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 3
    .parameter "firstObjectId"
    .parameter "secondObjectId"

    .prologue
    const/4 v0, 0x1

    .line 73
    if-ne p0, p1, :cond_1

    .line 82
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    if-ne v1, v2, :cond_2

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    if-eq v1, v2, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static formatHexByte([BII)V
    .locals 4
    .parameter "dst"
    .parameter "p"
    .parameter "w"

    .prologue
    .line 408
    add-int/lit8 v0, p1, 0x7

    .local v0, o:I
    move v1, v0

    .line 409
    .end local v0           #o:I
    .local v1, o:I
    :goto_0
    if-lt v1, p1, :cond_0

    if-eqz p2, :cond_0

    .line 410
    add-int/lit8 v0, v1, -0x1

    .end local v1           #o:I
    .restart local v0       #o:I
    sget-object v2, Lorg/eclipse/jgit/lib/AnyObjectId;->hexbyte:[B

    and-int/lit8 v3, p2, 0xf

    aget-byte v2, v2, v3

    aput-byte v2, p0, v1

    .line 411
    ushr-int/lit8 p2, p2, 0x4

    move v1, v0

    .end local v0           #o:I
    .restart local v1       #o:I
    goto :goto_0

    .line 413
    :cond_0
    :goto_1
    if-lt v1, p1, :cond_1

    .line 414
    add-int/lit8 v0, v1, -0x1

    .end local v1           #o:I
    .restart local v0       #o:I
    const/16 v2, 0x30

    aput-byte v2, p0, v1

    move v1, v0

    .end local v0           #o:I
    .restart local v1       #o:I
    goto :goto_1

    .line 415
    :cond_1
    return-void
.end method

.method static formatHexChar([CII)V
    .locals 4
    .parameter "dst"
    .parameter "p"
    .parameter "w"

    .prologue
    .line 479
    add-int/lit8 v0, p1, 0x7

    .local v0, o:I
    move v1, v0

    .line 480
    .end local v0           #o:I
    .local v1, o:I
    :goto_0
    if-lt v1, p1, :cond_0

    if-eqz p2, :cond_0

    .line 481
    add-int/lit8 v0, v1, -0x1

    .end local v1           #o:I
    .restart local v0       #o:I
    sget-object v2, Lorg/eclipse/jgit/lib/AnyObjectId;->hexchar:[C

    and-int/lit8 v3, p2, 0xf

    aget-char v2, v2, v3

    aput-char v2, p0, v1

    .line 482
    ushr-int/lit8 p2, p2, 0x4

    move v1, v0

    .end local v0           #o:I
    .restart local v1       #o:I
    goto :goto_0

    .line 484
    :cond_0
    :goto_1
    if-lt v1, p1, :cond_1

    .line 485
    add-int/lit8 v0, v1, -0x1

    .end local v1           #o:I
    .restart local v0       #o:I
    const/16 v2, 0x30

    aput-char v2, p0, v1

    move v1, v0

    .end local v0           #o:I
    .restart local v1       #o:I
    goto :goto_1

    .line 486
    :cond_1
    return-void
.end method

.method private toHexByteArray()[B
    .locals 3

    .prologue
    .line 395
    const/16 v1, 0x28

    new-array v0, v1, [B

    .line 396
    .local v0, dst:[B
    const/4 v1, 0x0

    iget v2, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 397
    const/16 v1, 0x8

    iget v2, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 398
    const/16 v1, 0x10

    iget v2, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 399
    const/16 v1, 0x18

    iget v2, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 400
    const/16 v1, 0x20

    iget v2, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 401
    return-object v0
.end method

.method private toHexCharArray([C)V
    .locals 2
    .parameter "dst"

    .prologue
    .line 468
    const/4 v0, 0x0

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 469
    const/16 v0, 0x8

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 470
    const/16 v0, 0x10

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 471
    const/16 v0, 0x18

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 472
    const/16 v0, 0x20

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 473
    return-void
.end method

.method private toHexCharArray()[C
    .locals 2

    .prologue
    .line 462
    const/16 v1, 0x28

    new-array v0, v1, [C

    .line 463
    .local v0, dst:[C
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->toHexCharArray([C)V

    .line 464
    return-object v0
.end method

.method private static writeRawInt(Ljava/io/OutputStream;I)V
    .locals 1
    .parameter "w"
    .parameter "v"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 350
    ushr-int/lit8 v0, p1, 0x18

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 351
    ushr-int/lit8 v0, p1, 0x10

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 352
    ushr-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 353
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 354
    return-void
.end method


# virtual methods
.method public abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 7
    .parameter "len"

    .prologue
    .line 520
    const/4 v0, 0x1

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(III)I

    move-result v2

    .line 521
    .local v2, a:I
    const/4 v0, 0x2

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(III)I

    move-result v3

    .line 522
    .local v3, b:I
    const/4 v0, 0x3

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(III)I

    move-result v4

    .line 523
    .local v4, c:I
    const/4 v0, 0x4

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(III)I

    move-result v5

    .line 524
    .local v5, d:I
    const/4 v0, 0x5

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(III)I

    move-result v6

    .line 525
    .local v6, e:I
    new-instance v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;-><init>(IIIIII)V

    return-object v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    check-cast p1, Lorg/eclipse/jgit/lib/AnyObjectId;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->compareTo(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    return v0
.end method

.method public final compareTo(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 3
    .parameter "other"

    .prologue
    .line 163
    if-ne p0, p1, :cond_1

    .line 164
    const/4 v0, 0x0

    .line 184
    :cond_0
    :goto_0
    return v0

    .line 168
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 169
    .local v0, cmp:I
    if-nez v0, :cond_0

    .line 172
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 173
    if-nez v0, :cond_0

    .line 176
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 177
    if-nez v0, :cond_0

    .line 180
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 181
    if-nez v0, :cond_0

    .line 184
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    iget v2, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    goto :goto_0
.end method

.method public final compareTo([BI)I
    .locals 3
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 201
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {p1, p2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 202
    .local v0, cmp:I
    if-eqz v0, :cond_0

    move v1, v0

    .line 217
    :goto_0
    return v1

    .line 205
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    add-int/lit8 v2, p2, 0x4

    invoke-static {p1, v2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 206
    if-eqz v0, :cond_1

    move v1, v0

    .line 207
    goto :goto_0

    .line 209
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    add-int/lit8 v2, p2, 0x8

    invoke-static {p1, v2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 210
    if-eqz v0, :cond_2

    move v1, v0

    .line 211
    goto :goto_0

    .line 213
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    add-int/lit8 v2, p2, 0xc

    invoke-static {p1, v2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 214
    if-eqz v0, :cond_3

    move v1, v0

    .line 215
    goto :goto_0

    .line 217
    :cond_3
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    add-int/lit8 v2, p2, 0x10

    invoke-static {p1, v2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v1

    goto :goto_0
.end method

.method public final compareTo([II)I
    .locals 3
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 234
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    aget v2, p1, p2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 235
    .local v0, cmp:I
    if-eqz v0, :cond_0

    move v1, v0

    .line 250
    :goto_0
    return v1

    .line 238
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    add-int/lit8 v2, p2, 0x1

    aget v2, p1, v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 239
    if-eqz v0, :cond_1

    move v1, v0

    .line 240
    goto :goto_0

    .line 242
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    add-int/lit8 v2, p2, 0x2

    aget v2, p1, v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 243
    if-eqz v0, :cond_2

    move v1, v0

    .line 244
    goto :goto_0

    .line 246
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    add-int/lit8 v2, p2, 0x3

    aget v2, p1, v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 247
    if-eqz v0, :cond_3

    move v1, v0

    .line 248
    goto :goto_0

    .line 250
    :cond_3
    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    add-int/lit8 v2, p2, 0x4

    aget v2, p1, v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v1

    goto :goto_0
.end method

.method public final copy()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2

    .prologue
    .line 542
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lorg/eclipse/jgit/lib/ObjectId;

    if-ne v0, v1, :cond_0

    .line 543
    check-cast p0, Lorg/eclipse/jgit/lib/ObjectId;

    .line 544
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public copyRawTo(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "w"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 341
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->writeRawInt(Ljava/io/OutputStream;I)V

    .line 342
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->writeRawInt(Ljava/io/OutputStream;I)V

    .line 343
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->writeRawInt(Ljava/io/OutputStream;I)V

    .line 344
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->writeRawInt(Ljava/io/OutputStream;I)V

    .line 345
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->writeRawInt(Ljava/io/OutputStream;I)V

    .line 346
    return-void
.end method

.method public copyRawTo(Ljava/nio/ByteBuffer;)V
    .locals 1
    .parameter "w"

    .prologue
    .line 293
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 294
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 295
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 296
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 297
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 298
    return-void
.end method

.method public copyRawTo([BI)V
    .locals 2
    .parameter "b"
    .parameter "o"

    .prologue
    .line 309
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {p1, p2, v0}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 310
    add-int/lit8 v0, p2, 0x4

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 311
    add-int/lit8 v0, p2, 0x8

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 312
    add-int/lit8 v0, p2, 0xc

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 313
    add-int/lit8 v0, p2, 0x10

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 314
    return-void
.end method

.method public copyRawTo([II)V
    .locals 2
    .parameter "b"
    .parameter "o"

    .prologue
    .line 325
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    aput v0, p1, p2

    .line 326
    add-int/lit8 v0, p2, 0x1

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    aput v1, p1, v0

    .line 327
    add-int/lit8 v0, p2, 0x2

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    aput v1, p1, v0

    .line 328
    add-int/lit8 v0, p2, 0x3

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    aput v1, p1, v0

    .line 329
    add-int/lit8 v0, p2, 0x4

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    aput v1, p1, v0

    .line 330
    return-void
.end method

.method public copyTo(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "w"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;->toHexByteArray()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 366
    return-void
.end method

.method public copyTo(Ljava/io/Writer;)V
    .locals 1
    .parameter "w"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;->toHexCharArray()[C

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write([C)V

    .line 427
    return-void
.end method

.method public copyTo(Ljava/nio/ByteBuffer;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 391
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;->toHexByteArray()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 392
    return-void
.end method

.method public copyTo([BI)V
    .locals 2
    .parameter "b"
    .parameter "o"

    .prologue
    .line 377
    add-int/lit8 v0, p2, 0x0

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 378
    add-int/lit8 v0, p2, 0x8

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 379
    add-int/lit8 v0, p2, 0x10

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 380
    add-int/lit8 v0, p2, 0x18

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 381
    add-int/lit8 v0, p2, 0x20

    iget v1, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexByte([BII)V

    .line 382
    return-void
.end method

.method public copyTo([CLjava/io/Writer;)V
    .locals 2
    .parameter "tmp"
    .parameter "w"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 442
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toHexCharArray([C)V

    .line 443
    const/4 v0, 0x0

    const/16 v1, 0x28

    invoke-virtual {p2, p1, v0, v1}, Ljava/io/Writer;->write([CII)V

    .line 444
    return-void
.end method

.method public copyTo([CLjava/lang/StringBuilder;)V
    .locals 2
    .parameter "tmp"
    .parameter "w"

    .prologue
    .line 457
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toHexCharArray([C)V

    .line 458
    const/4 v0, 0x0

    const/16 v1, 0x28

    invoke-virtual {p2, p1, v0, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 459
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "o"

    .prologue
    .line 280
    instance-of v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;

    if-eqz v0, :cond_0

    .line 281
    check-cast p1, Lorg/eclipse/jgit/lib/AnyObjectId;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    .line 283
    :goto_0
    return v0

    .restart local p1
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "other"

    .prologue
    .line 276
    if-eqz p1, :cond_0

    invoke-static {p0, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getByte(I)I
    .locals 2
    .parameter "index"

    .prologue
    .line 131
    shr-int/lit8 v1, p1, 0x2

    packed-switch v1, :pswitch_data_0

    .line 148
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v1

    .line 133
    :pswitch_0
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    .line 151
    .local v0, w:I
    :goto_0
    and-int/lit8 v1, p1, 0x3

    rsub-int/lit8 v1, v1, 0x3

    mul-int/lit8 v1, v1, 0x8

    ushr-int v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    return v1

    .line 136
    .end local v0           #w:I
    :pswitch_1
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    .line 137
    .restart local v0       #w:I
    goto :goto_0

    .line 139
    .end local v0           #w:I
    :pswitch_2
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    .line 140
    .restart local v0       #w:I
    goto :goto_0

    .line 142
    .end local v0           #w:I
    :pswitch_3
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    .line 143
    .restart local v0       #w:I
    goto :goto_0

    .line 145
    .end local v0           #w:I
    :pswitch_4
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    .line 146
    .restart local v0       #w:I
    goto :goto_0

    .line 131
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public final getFirstByte()I
    .locals 1

    .prologue
    .line 109
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    ushr-int/lit8 v0, v0, 0x18

    return v0
.end method

.method public final getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 505
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final hashCode()I
    .locals 1

    .prologue
    .line 265
    iget v0, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    return v0
.end method

.method public final name()Ljava/lang/String;
    .locals 2

    .prologue
    .line 498
    new-instance v0, Ljava/lang/String;

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;->toHexCharArray()[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method public startsWith(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Z
    .locals 1
    .parameter "abbr"

    .prologue
    .line 261
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract toObjectId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 491
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AnyObjectId["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
