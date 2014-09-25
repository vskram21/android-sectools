.class public Lorg/eclipse/jgit/lib/MutableObjectId;
.super Lorg/eclipse/jgit/lib/AnyObjectId;
.source "MutableObjectId.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;-><init>()V

    .line 65
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/MutableObjectId;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/AnyObjectId;-><init>()V

    .line 74
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 75
    return-void
.end method

.method private fromHexString([BI)V
    .locals 3
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 239
    :try_start_0
    invoke-static {p1, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w1:I

    .line 240
    add-int/lit8 v1, p2, 0x8

    invoke-static {p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w2:I

    .line 241
    add-int/lit8 v1, p2, 0x10

    invoke-static {p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w3:I

    .line 242
    add-int/lit8 v1, p2, 0x18

    invoke-static {p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w4:I

    .line 243
    add-int/lit8 v1, p2, 0x20

    invoke-static {p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt32([BI)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w5:I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    return-void

    .line 244
    :catch_0
    move-exception v0

    .line 245
    .local v0, e1:Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Lorg/eclipse/jgit/errors/InvalidObjectIdException;

    const/16 v2, 0x28

    invoke-direct {v1, p1, p2, v2}, Lorg/eclipse/jgit/errors/InvalidObjectIdException;-><init>([BII)V

    throw v1
.end method

.method private static set(III)I
    .locals 2
    .parameter "w"
    .parameter "index"
    .parameter "value"

    .prologue
    .line 115
    and-int/lit16 p2, p2, 0xff

    .line 117
    packed-switch p1, :pswitch_data_0

    .line 127
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 119
    :pswitch_0
    const v0, 0xffffff

    and-int/2addr v0, p0

    shl-int/lit8 v1, p2, 0x18

    or-int/2addr v0, v1

    .line 125
    :goto_0
    return v0

    .line 121
    :pswitch_1
    const v0, -0xff0001

    and-int/2addr v0, p0

    shl-int/lit8 v1, p2, 0x10

    or-int/2addr v0, v1

    goto :goto_0

    .line 123
    :pswitch_2
    const v0, -0xff01

    and-int/2addr v0, p0

    shl-int/lit8 v1, p2, 0x8

    or-int/2addr v0, v1

    goto :goto_0

    .line 125
    :pswitch_3
    and-int/lit16 v0, p0, -0x100

    or-int/2addr v0, p2

    goto :goto_0

    .line 117
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 133
    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w1:I

    .line 134
    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w2:I

    .line 135
    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w3:I

    .line 136
    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w4:I

    .line 137
    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w5:I

    .line 138
    return-void
.end method

.method public fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "src"

    .prologue
    .line 147
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w1:I

    .line 148
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w2:I

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w2:I

    .line 149
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w3:I

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w3:I

    .line 150
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w4:I

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w4:I

    .line 151
    iget v0, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w5:I

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w5:I

    .line 152
    return-void
.end method

.method public fromRaw([B)V
    .locals 1
    .parameter "bs"

    .prologue
    .line 162
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 163
    return-void
.end method

.method public fromRaw([BI)V
    .locals 1
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 175
    invoke-static {p1, p2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w1:I

    .line 176
    add-int/lit8 v0, p2, 0x4

    invoke-static {p1, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w2:I

    .line 177
    add-int/lit8 v0, p2, 0x8

    invoke-static {p1, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w3:I

    .line 178
    add-int/lit8 v0, p2, 0xc

    invoke-static {p1, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w4:I

    .line 179
    add-int/lit8 v0, p2, 0x10

    invoke-static {p1, v0}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w5:I

    .line 180
    return-void
.end method

.method public fromRaw([I)V
    .locals 1
    .parameter "ints"

    .prologue
    .line 190
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([II)V

    .line 191
    return-void
.end method

.method public fromRaw([II)V
    .locals 1
    .parameter "ints"
    .parameter "p"

    .prologue
    .line 204
    aget v0, p1, p2

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w1:I

    .line 205
    add-int/lit8 v0, p2, 0x1

    aget v0, p1, v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w2:I

    .line 206
    add-int/lit8 v0, p2, 0x2

    aget v0, p1, v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w3:I

    .line 207
    add-int/lit8 v0, p2, 0x3

    aget v0, p1, v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w4:I

    .line 208
    add-int/lit8 v0, p2, 0x4

    aget v0, p1, v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w5:I

    .line 209
    return-void
.end method

.method public fromString(Ljava/lang/String;)V
    .locals 4
    .parameter "str"

    .prologue
    const/4 v3, 0x0

    .line 231
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x28

    if-eq v0, v1, :cond_0

    .line 232
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidId:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 234
    :cond_0
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0, v3}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromHexString([BI)V

    .line 235
    return-void
.end method

.method public fromString([BI)V
    .locals 0
    .parameter "buf"
    .parameter "offset"

    .prologue
    .line 221
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromHexString([BI)V

    .line 222
    return-void
.end method

.method public setByte(II)V
    .locals 2
    .parameter "index"
    .parameter "value"

    .prologue
    .line 93
    shr-int/lit8 v0, p1, 0x2

    packed-switch v0, :pswitch_data_0

    .line 110
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 95
    :pswitch_0
    iget v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w1:I

    and-int/lit8 v1, p1, 0x3

    invoke-static {v0, v1, p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->set(III)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w1:I

    .line 112
    :goto_0
    return-void

    .line 98
    :pswitch_1
    iget v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w2:I

    and-int/lit8 v1, p1, 0x3

    invoke-static {v0, v1, p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->set(III)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w2:I

    goto :goto_0

    .line 101
    :pswitch_2
    iget v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w3:I

    and-int/lit8 v1, p1, 0x3

    invoke-static {v0, v1, p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->set(III)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w3:I

    goto :goto_0

    .line 104
    :pswitch_3
    iget v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w4:I

    and-int/lit8 v1, p1, 0x3

    invoke-static {v0, v1, p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->set(III)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w4:I

    goto :goto_0

    .line 107
    :pswitch_4
    iget v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w5:I

    and-int/lit8 v1, p1, 0x3

    invoke-static {v0, v1, p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->set(III)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/MutableObjectId;->w5:I

    goto :goto_0

    .line 93
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public toObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 252
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectId;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0
.end method
