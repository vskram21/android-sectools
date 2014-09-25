.class public final Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
.super Ljava/lang/Object;
.source "AbbreviatedObjectId.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final nibbles:I

.field final w1:I

.field final w2:I

.field final w3:I

.field final w4:I

.field final w5:I


# direct methods
.method constructor <init>(IIIIII)V
    .locals 0
    .parameter "n"
    .parameter "new_1"
    .parameter "new_2"
    .parameter "new_3"
    .parameter "new_4"
    .parameter "new_5"

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    iput p1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    .line 201
    iput p2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    .line 202
    iput p3, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    .line 203
    iput p4, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    .line 204
    iput p5, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    .line 205
    iput p6, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    .line 206
    return-void
.end method

.method private static final fromHexString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 8
    .parameter "bs"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 143
    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->hexUInt32([BII)I

    move-result v2

    .line 144
    .local v2, a:I
    add-int/lit8 v0, p1, 0x8

    invoke-static {p0, v0, p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->hexUInt32([BII)I

    move-result v3

    .line 145
    .local v3, b:I
    add-int/lit8 v0, p1, 0x10

    invoke-static {p0, v0, p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->hexUInt32([BII)I

    move-result v4

    .line 146
    .local v4, c:I
    add-int/lit8 v0, p1, 0x18

    invoke-static {p0, v0, p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->hexUInt32([BII)I

    move-result v5

    .line 147
    .local v5, d:I
    add-int/lit8 v0, p1, 0x20

    invoke-static {p0, v0, p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->hexUInt32([BII)I

    move-result v6

    .line 148
    .local v6, e:I
    new-instance v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    sub-int v1, p2, p1

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;-><init>(IIIIII)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 149
    .end local v2           #a:I
    .end local v3           #b:I
    .end local v4           #c:I
    .end local v5           #d:I
    .end local v6           #e:I
    :catch_0
    move-exception v7

    .line 150
    .local v7, e1:Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v0, Lorg/eclipse/jgit/errors/InvalidObjectIdException;

    sub-int v1, p2, p1

    invoke-direct {v0, p0, p1, v1}, Lorg/eclipse/jgit/errors/InvalidObjectIdException;-><init>([BII)V

    throw v0
.end method

.method public static final fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 7
    .parameter "id"

    .prologue
    .line 122
    new-instance v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    const/16 v1, 0x28

    iget v2, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    iget v3, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    iget v4, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    iget v5, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    iget v6, p0, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;-><init>(IIIIII)V

    return-object v0
.end method

.method public static final fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 5
    .parameter "str"

    .prologue
    const/4 v4, 0x0

    .line 134
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x28

    if-le v1, v2, :cond_0

    .line 135
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->invalidId:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :cond_0
    invoke-static {p0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    .line 137
    .local v0, b:[B
    array-length v1, v0

    invoke-static {v0, v4, v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromHexString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    return-object v1
.end method

.method public static final fromString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 6
    .parameter "buf"
    .parameter "offset"
    .parameter "end"

    .prologue
    const/16 v5, 0x28

    .line 103
    sub-int v0, p2, p1

    if-le v0, v5, :cond_0

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidIdLength:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sub-int v4, p2, p1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    invoke-static {p0, p1, p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromHexString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    return-object v0
.end method

.method private static final hexUInt32([BII)I
    .locals 5
    .parameter "bs"
    .parameter "p"
    .parameter "end"

    .prologue
    const/16 v4, 0x8

    .line 155
    sub-int v3, p2, p1

    if-gt v4, v3, :cond_0

    .line 156
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v3

    .line 164
    :goto_0
    return v3

    .line 158
    :cond_0
    const/4 v2, 0x0

    .local v2, r:I
    const/4 v0, 0x0

    .local v0, n:I
    move v1, p1

    .line 159
    .end local p1
    .local v1, p:I
    :goto_1
    if-ge v0, v4, :cond_1

    if-ge v1, p2, :cond_1

    .line 160
    shl-int/lit8 v2, v2, 0x4

    .line 161
    add-int/lit8 p1, v1, 0x1

    .end local v1           #p:I
    .restart local p1
    aget-byte v3, p0, v1

    invoke-static {v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I

    move-result v3

    or-int/2addr v2, v3

    .line 162
    add-int/lit8 v0, v0, 0x1

    move v1, p1

    .end local p1
    .restart local v1       #p:I
    goto :goto_1

    .line 164
    :cond_1
    rsub-int/lit8 v3, v0, 0x8

    mul-int/lit8 v3, v3, 0x4

    shl-int v3, v2, v3

    move p1, v1

    .end local v1           #p:I
    .restart local p1
    goto :goto_0
.end method

.method public static final isId(Ljava/lang/String;)Z
    .locals 5
    .parameter "id"

    .prologue
    const/4 v2, 0x0

    .line 78
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    const/16 v3, 0x28

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 85
    :cond_0
    :goto_0
    return v2

    .line 81
    :cond_1
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 82
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-byte v3, v3

    invoke-static {v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 83
    :cond_2
    const/4 v2, 0x1

    goto :goto_0

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    goto :goto_0
.end method

.method private mask(II)I
    .locals 1
    .parameter "word"
    .parameter "v"

    .prologue
    .line 334
    iget v0, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    invoke-static {v0, p1, p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(III)I

    move-result v0

    return v0
.end method

.method static mask(III)I
    .locals 3
    .parameter "nibbles"
    .parameter "word"
    .parameter "v"

    .prologue
    .line 168
    add-int/lit8 v2, p1, -0x1

    mul-int/lit8 v0, v2, 0x8

    .line 169
    .local v0, b:I
    add-int/lit8 v2, v0, 0x8

    if-gt v2, p0, :cond_0

    .line 182
    .end local p2
    :goto_0
    return p2

    .line 175
    .restart local p2
    :cond_0
    if-gt p0, v0, :cond_1

    .line 178
    const/4 p2, 0x0

    goto :goto_0

    .line 181
    :cond_1
    sub-int v2, p0, v0

    mul-int/lit8 v2, v2, 0x4

    rsub-int/lit8 v1, v2, 0x20

    .line 182
    .local v1, s:I
    ushr-int v2, p2, v1

    shl-int p2, v2, v1

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "o"

    .prologue
    const/4 v1, 0x0

    .line 344
    instance-of v2, p1, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 345
    check-cast v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 346
    .local v0, b:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    iget v3, v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    iget v3, v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    iget v3, v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    iget v3, v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    iget v3, v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    iget v3, v0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .line 349
    .end local v0           #b:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    :cond_0
    return v1
.end method

.method public final getFirstByte()I
    .locals 1

    .prologue
    .line 330
    iget v0, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    ushr-int/lit8 v0, v0, 0x18

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 339
    iget v0, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    return v0
.end method

.method public isComplete()Z
    .locals 2

    .prologue
    .line 215
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->length()I

    move-result v0

    const/16 v1, 0x28

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 210
    iget v0, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    return v0
.end method

.method public final name()Ljava/lang/String;
    .locals 7

    .prologue
    const/16 v6, 0x20

    const/16 v5, 0x18

    const/16 v4, 0x10

    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 356
    const/16 v1, 0x28

    new-array v0, v1, [C

    .line 358
    .local v0, b:[C
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    invoke-static {v0, v3, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 359
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    if-gt v1, v2, :cond_0

    .line 360
    new-instance v1, Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    invoke-direct {v1, v0, v3, v2}, Ljava/lang/String;-><init>([CII)V

    .line 375
    :goto_0
    return-object v1

    .line 362
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    invoke-static {v0, v2, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 363
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    if-gt v1, v4, :cond_1

    .line 364
    new-instance v1, Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    invoke-direct {v1, v0, v3, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 366
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    invoke-static {v0, v4, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 367
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    if-gt v1, v5, :cond_2

    .line 368
    new-instance v1, Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    invoke-direct {v1, v0, v3, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 370
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    invoke-static {v0, v5, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 371
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    if-gt v1, v6, :cond_3

    .line 372
    new-instance v1, Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    invoke-direct {v1, v0, v3, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 374
    :cond_3
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    invoke-static {v0, v6, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->formatHexChar([CII)V

    .line 375
    new-instance v1, Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->nibbles:I

    invoke-direct {v1, v0, v3, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public final prefixCompare(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 4
    .parameter "other"

    .prologue
    .line 237
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    const/4 v2, 0x1

    iget v3, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 238
    .local v0, cmp:I
    if-eqz v0, :cond_0

    move v1, v0

    .line 253
    :goto_0
    return v1

    .line 241
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    const/4 v2, 0x2

    iget v3, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 242
    if-eqz v0, :cond_1

    move v1, v0

    .line 243
    goto :goto_0

    .line 245
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    const/4 v2, 0x3

    iget v3, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 246
    if-eqz v0, :cond_2

    move v1, v0

    .line 247
    goto :goto_0

    .line 249
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    const/4 v2, 0x4

    iget v3, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 250
    if-eqz v0, :cond_3

    move v1, v0

    .line 251
    goto :goto_0

    .line 253
    :cond_3
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    const/4 v2, 0x5

    iget v3, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v1

    goto :goto_0
.end method

.method public final prefixCompare([BI)I
    .locals 4
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 273
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    const/4 v2, 0x1

    invoke-static {p1, p2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 274
    .local v0, cmp:I
    if-eqz v0, :cond_0

    move v1, v0

    .line 289
    :goto_0
    return v1

    .line 277
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    const/4 v2, 0x2

    add-int/lit8 v3, p2, 0x4

    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 278
    if-eqz v0, :cond_1

    move v1, v0

    .line 279
    goto :goto_0

    .line 281
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    const/4 v2, 0x3

    add-int/lit8 v3, p2, 0x8

    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 282
    if-eqz v0, :cond_2

    move v1, v0

    .line 283
    goto :goto_0

    .line 285
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    const/4 v2, 0x4

    add-int/lit8 v3, p2, 0xc

    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 286
    if-eqz v0, :cond_3

    move v1, v0

    .line 287
    goto :goto_0

    .line 289
    :cond_3
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    const/4 v2, 0x5

    add-int/lit8 v3, p2, 0x10

    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v1

    goto :goto_0
.end method

.method public final prefixCompare([II)I
    .locals 4
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 309
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    const/4 v2, 0x1

    aget v3, p1, p2

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 310
    .local v0, cmp:I
    if-eqz v0, :cond_0

    move v1, v0

    .line 325
    :goto_0
    return v1

    .line 313
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    const/4 v2, 0x2

    add-int/lit8 v3, p2, 0x1

    aget v3, p1, v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 314
    if-eqz v0, :cond_1

    move v1, v0

    .line 315
    goto :goto_0

    .line 317
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    const/4 v2, 0x3

    add-int/lit8 v3, p2, 0x2

    aget v3, p1, v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 318
    if-eqz v0, :cond_2

    move v1, v0

    .line 319
    goto :goto_0

    .line 321
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    const/4 v2, 0x4

    add-int/lit8 v3, p2, 0x3

    aget v3, p1, v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v0

    .line 322
    if-eqz v0, :cond_3

    move v1, v0

    .line 323
    goto :goto_0

    .line 325
    :cond_3
    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    const/4 v2, 0x5

    add-int/lit8 v3, p2, 0x4

    aget v3, p1, v3

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->mask(II)I

    move-result v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/NB;->compareUInt32(II)I

    move-result v1

    goto :goto_0
.end method

.method public toObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6

    .prologue
    .line 220
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/eclipse/jgit/lib/ObjectId;

    iget v1, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w1:I

    iget v2, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w2:I

    iget v3, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w3:I

    iget v4, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w4:I

    iget v5, p0, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->w5:I

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(IIIII)V

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 381
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AbbreviatedObjectId["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

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
