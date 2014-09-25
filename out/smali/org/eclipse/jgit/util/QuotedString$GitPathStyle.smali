.class public final Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;
.super Lorg/eclipse/jgit/util/QuotedString;
.source "QuotedString.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/QuotedString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GitPathStyle"
.end annotation


# static fields
.field private static final quote:[B


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v5, 0x5c

    const/16 v4, 0x22

    const/4 v3, 0x0

    .line 215
    const/16 v1, 0x80

    new-array v1, v1, [B

    sput-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    .line 216
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/4 v2, -0x1

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 218
    const/16 v0, 0x30

    .local v0, i:I
    :goto_0
    const/16 v1, 0x39

    if-gt v0, v1, :cond_0

    .line 219
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    aput-byte v3, v1, v0

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 220
    :cond_0
    const/16 v0, 0x61

    :goto_1
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_1

    .line 221
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    aput-byte v3, v1, v0

    .line 220
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 222
    :cond_1
    const/16 v0, 0x41

    :goto_2
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_2

    .line 223
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    aput-byte v3, v1, v0

    .line 222
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 224
    :cond_2
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x20

    aput-byte v3, v1, v2

    .line 225
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x24

    aput-byte v3, v1, v2

    .line 226
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x25

    aput-byte v3, v1, v2

    .line 227
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x26

    aput-byte v3, v1, v2

    .line 228
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x2a

    aput-byte v3, v1, v2

    .line 229
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x2b

    aput-byte v3, v1, v2

    .line 230
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x2c

    aput-byte v3, v1, v2

    .line 231
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x2d

    aput-byte v3, v1, v2

    .line 232
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x2e

    aput-byte v3, v1, v2

    .line 233
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x2f

    aput-byte v3, v1, v2

    .line 234
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x3a

    aput-byte v3, v1, v2

    .line 235
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x3b

    aput-byte v3, v1, v2

    .line 236
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x3d

    aput-byte v3, v1, v2

    .line 237
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x3f

    aput-byte v3, v1, v2

    .line 238
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x40

    aput-byte v3, v1, v2

    .line 239
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x5f

    aput-byte v3, v1, v2

    .line 240
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x5e

    aput-byte v3, v1, v2

    .line 241
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x7c

    aput-byte v3, v1, v2

    .line 242
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x7e

    aput-byte v3, v1, v2

    .line 244
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/4 v2, 0x7

    const/16 v3, 0x61

    aput-byte v3, v1, v2

    .line 245
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x8

    const/16 v3, 0x62

    aput-byte v3, v1, v2

    .line 246
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0xc

    const/16 v3, 0x66

    aput-byte v3, v1, v2

    .line 247
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0xa

    const/16 v3, 0x6e

    aput-byte v3, v1, v2

    .line 248
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0xd

    const/16 v3, 0x72

    aput-byte v3, v1, v2

    .line 249
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0x9

    const/16 v3, 0x74

    aput-byte v3, v1, v2

    .line 250
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    const/16 v2, 0xb

    const/16 v3, 0x76

    aput-byte v3, v1, v2

    .line 251
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    aput-byte v5, v1, v5

    .line 252
    sget-object v1, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    aput-byte v4, v1, v4

    .line 253
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 374
    invoke-direct {p0}, Lorg/eclipse/jgit/util/QuotedString;-><init>()V

    .line 376
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/util/QuotedString$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 212
    invoke-direct {p0}, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;-><init>()V

    return-void
.end method

.method private static dq([BII)Ljava/lang/String;
    .locals 10
    .parameter "in"
    .parameter "inPtr"
    .parameter "inEnd"

    .prologue
    const/16 v9, 0x5c

    .line 299
    sub-int v8, p2, p1

    new-array v5, v8, [B

    .line 300
    .local v5, r:[B
    const/4 v6, 0x0

    .local v6, rPtr:I
    move v7, v6

    .end local v6           #rPtr:I
    .local v7, rPtr:I
    move v3, p1

    .line 301
    .end local p1
    .local v3, inPtr:I
    :goto_0
    if-ge v3, p2, :cond_3

    .line 302
    add-int/lit8 p1, v3, 0x1

    .end local v3           #inPtr:I
    .restart local p1
    aget-byte v0, p0, v3

    .line 303
    .local v0, b:B
    if-eq v0, v9, :cond_0

    .line 304
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    aput-byte v0, v5, v7

    move v7, v6

    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    move v3, p1

    .line 305
    .end local p1
    .restart local v3       #inPtr:I
    goto :goto_0

    .line 308
    .end local v3           #inPtr:I
    .restart local p1
    :cond_0
    if-ne p1, p2, :cond_1

    .line 311
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    aput-byte v9, v5, v7

    .line 371
    .end local v0           #b:B
    :goto_1
    sget-object v8, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    const/4 v9, 0x0

    invoke-static {v8, v5, v9, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v8

    return-object v8

    .line 315
    .end local v6           #rPtr:I
    .restart local v0       #b:B
    .restart local v7       #rPtr:I
    :cond_1
    add-int/lit8 v3, p1, 0x1

    .end local p1
    .restart local v3       #inPtr:I
    aget-byte v8, p0, p1

    sparse-switch v8, :sswitch_data_0

    .line 365
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    aput-byte v9, v5, v7

    .line 366
    add-int/lit8 v7, v6, 0x1

    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    add-int/lit8 v8, v3, -0x1

    aget-byte v8, p0, v8

    aput-byte v8, v5, v6

    goto :goto_0

    .line 317
    :sswitch_0
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    const/4 v8, 0x7

    aput-byte v8, v5, v7

    move v7, v6

    .line 318
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 320
    :sswitch_1
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    const/16 v8, 0x8

    aput-byte v8, v5, v7

    move v7, v6

    .line 321
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 323
    :sswitch_2
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    const/16 v8, 0xc

    aput-byte v8, v5, v7

    move v7, v6

    .line 324
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 326
    :sswitch_3
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    const/16 v8, 0xa

    aput-byte v8, v5, v7

    move v7, v6

    .line 327
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 329
    :sswitch_4
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    const/16 v8, 0xd

    aput-byte v8, v5, v7

    move v7, v6

    .line 330
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 332
    :sswitch_5
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    const/16 v8, 0x9

    aput-byte v8, v5, v7

    move v7, v6

    .line 333
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 335
    :sswitch_6
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    const/16 v8, 0xb

    aput-byte v8, v5, v7

    move v7, v6

    .line 336
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 340
    :sswitch_7
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    add-int/lit8 v8, v3, -0x1

    aget-byte v8, p0, v8

    aput-byte v8, v5, v7

    move v7, v6

    .line 341
    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    goto :goto_0

    .line 347
    :sswitch_8
    add-int/lit8 v8, v3, -0x1

    aget-byte v8, p0, v8

    add-int/lit8 v2, v8, -0x30

    .line 348
    .local v2, cp:I
    const/4 v4, 0x1

    .local v4, n:I
    move p1, v3

    .end local v3           #inPtr:I
    .restart local p1
    :goto_2
    const/4 v8, 0x3

    if-ge v4, v8, :cond_2

    if-ge p1, p2, :cond_2

    .line 349
    aget-byte v1, p0, p1

    .line 350
    .local v1, c:B
    const/16 v8, 0x30

    if-gt v8, v1, :cond_2

    const/16 v8, 0x37

    if-gt v1, v8, :cond_2

    .line 351
    shl-int/lit8 v2, v2, 0x3

    .line 352
    add-int/lit8 v8, v1, -0x30

    or-int/2addr v2, v8

    .line 353
    add-int/lit8 p1, p1, 0x1

    .line 348
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 358
    .end local v1           #c:B
    :cond_2
    add-int/lit8 v6, v7, 0x1

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    int-to-byte v8, v2

    aput-byte v8, v5, v7

    move v7, v6

    .end local v6           #rPtr:I
    .restart local v7       #rPtr:I
    move v3, p1

    .line 359
    .end local p1
    .restart local v3       #inPtr:I
    goto/16 :goto_0

    .end local v0           #b:B
    .end local v2           #cp:I
    .end local v4           #n:I
    :cond_3
    move v6, v7

    .end local v7           #rPtr:I
    .restart local v6       #rPtr:I
    move p1, v3

    .end local v3           #inPtr:I
    .restart local p1
    goto/16 :goto_1

    .line 315
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_7
        0x30 -> :sswitch_8
        0x31 -> :sswitch_8
        0x32 -> :sswitch_8
        0x33 -> :sswitch_8
        0x5c -> :sswitch_7
        0x61 -> :sswitch_0
        0x62 -> :sswitch_1
        0x66 -> :sswitch_2
        0x6e -> :sswitch_3
        0x72 -> :sswitch_4
        0x74 -> :sswitch_5
        0x76 -> :sswitch_6
    .end sparse-switch
.end method


# virtual methods
.method public dequote([BII)Ljava/lang/String;
    .locals 3
    .parameter "in"
    .parameter "inPtr"
    .parameter "inEnd"

    .prologue
    const/16 v2, 0x22

    .line 293
    const/4 v0, 0x2

    sub-int v1, p3, p2

    if-gt v0, v1, :cond_0

    aget-byte v0, p1, p2

    if-ne v0, v2, :cond_0

    add-int/lit8 v0, p3, -0x1

    aget-byte v0, p1, v0

    if-ne v0, v2, :cond_0

    .line 294
    add-int/lit8 v0, p2, 0x1

    add-int/lit8 v1, p3, -0x1

    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->dq([BII)Ljava/lang/String;

    move-result-object v0

    .line 295
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v0, p1, p2, p3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public quote(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "instr"

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x22

    .line 257
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 258
    const-string p1, "\"\""

    .line 288
    .end local p1
    :cond_0
    :goto_0
    return-object p1

    .line 259
    .restart local p1
    :cond_1
    const/4 v4, 0x1

    .line 260
    .local v4, reuse:Z
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v2

    .line 261
    .local v2, in:[B
    new-instance v3, Ljava/lang/StringBuilder;

    array-length v6, v2

    add-int/lit8 v6, v6, 0x2

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 262
    .local v3, r:Ljava/lang/StringBuilder;
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 263
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v6, v2

    if-ge v1, v6, :cond_4

    .line 264
    aget-byte v6, v2, v1

    and-int/lit16 v0, v6, 0xff

    .line 265
    .local v0, c:I
    sget-object v6, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    array-length v6, v6

    if-ge v0, v6, :cond_3

    .line 266
    sget-object v6, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote:[B

    aget-byte v5, v6, v0

    .line 267
    .local v5, style:B
    if-nez v5, :cond_2

    .line 268
    int-to-char v6, v0

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 263
    .end local v5           #style:B
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 271
    .restart local v5       #style:B
    :cond_2
    if-lez v5, :cond_3

    .line 272
    const/4 v4, 0x0

    .line 273
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 274
    int-to-char v6, v5

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 279
    .end local v5           #style:B
    :cond_3
    const/4 v4, 0x0

    .line 280
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 281
    shr-int/lit8 v6, v0, 0x6

    and-int/lit8 v6, v6, 0x3

    add-int/lit8 v6, v6, 0x30

    int-to-char v6, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 282
    shr-int/lit8 v6, v0, 0x3

    and-int/lit8 v6, v6, 0x7

    add-int/lit8 v6, v6, 0x30

    int-to-char v6, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 283
    shr-int/lit8 v6, v0, 0x0

    and-int/lit8 v6, v6, 0x7

    add-int/lit8 v6, v6, 0x30

    int-to-char v6, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 285
    .end local v0           #c:I
    :cond_4
    if-nez v4, :cond_0

    .line 287
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 288
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method
