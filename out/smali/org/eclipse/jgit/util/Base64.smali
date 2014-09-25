.class public Lorg/eclipse/jgit/util/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final DEC:[B = null

.field private static final ENC:[B = null

.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_DEC:B = -0x1t

.field private static final INVALID_DEC:B = -0x3t

.field private static final UTF_8:Ljava/lang/String; = "UTF-8"

.field private static final WHITE_SPACE_DEC:B = -0x2t


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, -0x2

    .line 57
    :try_start_0
    const-string v2, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    sput-object v2, Lorg/eclipse/jgit/util/Base64;->ENC:[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    const/16 v2, 0x80

    new-array v2, v2, [B

    sput-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    .line 67
    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    const/4 v3, -0x3

    invoke-static {v2, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 69
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v2, 0x40

    if-ge v0, v2, :cond_0

    .line 70
    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    sget-object v3, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    aget-byte v3, v3, v0

    int-to-byte v4, v0

    aput-byte v4, v2, v3

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 62
    .end local v0           #i:I
    :catch_0
    move-exception v1

    .line 63
    .local v1, uee:Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 71
    .end local v1           #uee:Ljava/io/UnsupportedEncodingException;
    .restart local v0       #i:I
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    const/16 v3, 0x3d

    const/4 v4, -0x1

    aput-byte v4, v2, v3

    .line 73
    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    const/16 v3, 0x9

    aput-byte v5, v2, v3

    .line 74
    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    const/16 v3, 0xa

    aput-byte v5, v2, v3

    .line 75
    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    const/16 v3, 0xd

    aput-byte v5, v2, v3

    .line 76
    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    const/16 v3, 0x20

    aput-byte v5, v2, v3

    .line 77
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 4
    .parameter "s"

    .prologue
    .line 309
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 313
    .local v0, bytes:[B
    :goto_0
    const/4 v2, 0x0

    array-length v3, v0

    invoke-static {v0, v2, v3}, Lorg/eclipse/jgit/util/Base64;->decode([BII)[B

    move-result-object v2

    return-object v2

    .line 310
    .end local v0           #bytes:[B
    :catch_0
    move-exception v1

    .line 311
    .local v1, uee:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .restart local v0       #bytes:[B
    goto :goto_0
.end method

.method public static decode([BII)[B
    .locals 14
    .parameter "source"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 264
    mul-int/lit8 v9, p2, 0x3

    div-int/lit8 v9, v9, 0x4

    new-array v5, v9, [B

    .line 265
    .local v5, outBuff:[B
    const/4 v6, 0x0

    .line 267
    .local v6, outBuffPosn:I
    const/4 v9, 0x4

    new-array v0, v9, [B

    .line 268
    .local v0, b4:[B
    const/4 v1, 0x0

    .line 270
    .local v1, b4Posn:I
    move v3, p1

    .local v3, i:I
    move v2, v1

    .end local v1           #b4Posn:I
    .local v2, b4Posn:I
    :goto_0
    add-int v9, p1, p2

    if-ge v3, v9, :cond_4

    .line 271
    aget-byte v9, p0, v3

    and-int/lit8 v9, v9, 0x7f

    int-to-byte v7, v9

    .line 272
    .local v7, sbiCrop:B
    sget-object v9, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    aget-byte v8, v9, v7

    .line 274
    .local v8, sbiDecode:B
    const/4 v9, -0x1

    if-gt v9, v8, :cond_0

    .line 275
    add-int/lit8 v1, v2, 0x1

    .end local v2           #b4Posn:I
    .restart local v1       #b4Posn:I
    aput-byte v7, v0, v2

    .line 276
    const/4 v9, 0x3

    if-le v1, v9, :cond_2

    .line 277
    const/4 v9, 0x0

    invoke-static {v0, v9, v5, v6}, Lorg/eclipse/jgit/util/Base64;->decode4to3([BI[BI)I

    move-result v9

    add-int/2addr v6, v9

    .line 278
    const/4 v1, 0x0

    .line 281
    const/16 v9, 0x3d

    if-ne v7, v9, :cond_2

    .line 291
    .end local v7           #sbiCrop:B
    .end local v8           #sbiDecode:B
    :goto_1
    array-length v9, v5

    if-ne v9, v6, :cond_3

    .line 296
    .end local v5           #outBuff:[B
    :goto_2
    return-object v5

    .line 285
    .end local v1           #b4Posn:I
    .restart local v2       #b4Posn:I
    .restart local v5       #outBuff:[B
    .restart local v7       #sbiCrop:B
    .restart local v8       #sbiDecode:B
    :cond_0
    const/4 v9, -0x2

    if-eq v8, v9, :cond_1

    .line 286
    new-instance v9, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->badBase64InputCharacterAt:Ljava/lang/String;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aget-byte v13, p0, v3

    and-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    :cond_1
    move v1, v2

    .line 270
    .end local v2           #b4Posn:I
    .restart local v1       #b4Posn:I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    move v2, v1

    .end local v1           #b4Posn:I
    .restart local v2       #b4Posn:I
    goto :goto_0

    .line 294
    .end local v2           #b4Posn:I
    .end local v7           #sbiCrop:B
    .end local v8           #sbiDecode:B
    .restart local v1       #b4Posn:I
    :cond_3
    new-array v4, v6, [B

    .line 295
    .local v4, out:[B
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v5, v9, v4, v10, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v5, v4

    .line 296
    goto :goto_2

    .end local v1           #b4Posn:I
    .end local v4           #out:[B
    .restart local v2       #b4Posn:I
    :cond_4
    move v1, v2

    .end local v2           #b4Posn:I
    .restart local v1       #b4Posn:I
    goto :goto_1
.end method

.method private static decode4to3([BI[BI)I
    .locals 4
    .parameter "source"
    .parameter "srcOffset"
    .parameter "destination"
    .parameter "destOffset"

    .prologue
    const/16 v2, 0x3d

    .line 218
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    if-ne v1, v2, :cond_0

    .line 219
    sget-object v1, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    aget-byte v2, p0, p1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int v0, v1, v2

    .line 221
    .local v0, outBuff:I
    ushr-int/lit8 v1, v0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 222
    const/4 v1, 0x1

    .line 246
    :goto_0
    return v1

    .line 226
    .end local v0           #outBuff:I
    :cond_0
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    if-ne v1, v2, :cond_1

    .line 227
    sget-object v1, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    aget-byte v2, p0, p1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x6

    or-int v0, v1, v2

    .line 230
    .restart local v0       #outBuff:I
    ushr-int/lit8 v1, v0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 231
    add-int/lit8 v1, p3, 0x1

    ushr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    .line 232
    const/4 v1, 0x2

    goto :goto_0

    .line 237
    .end local v0           #outBuff:I
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    aget-byte v2, p0, p1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->DEC:[B

    add-int/lit8 v3, p1, 0x3

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    or-int v0, v1, v2

    .line 242
    .restart local v0       #outBuff:I
    shr-int/lit8 v1, v0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 243
    add-int/lit8 v1, p3, 0x1

    shr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    .line 244
    add-int/lit8 v1, p3, 0x2

    int-to-byte v2, v0

    aput-byte v2, p2, v1

    .line 246
    const/4 v1, 0x3

    goto :goto_0
.end method

.method private static encode3to4([BII[BI)V
    .locals 5
    .parameter "source"
    .parameter "srcOffset"
    .parameter "numSigBytes"
    .parameter "destination"
    .parameter "destOffset"

    .prologue
    const/16 v4, 0x3d

    .line 111
    const/4 v0, 0x0

    .line 112
    .local v0, inBuff:I
    packed-switch p2, :pswitch_data_0

    .line 125
    :goto_0
    packed-switch p2, :pswitch_data_1

    .line 147
    :goto_1
    return-void

    .line 114
    :pswitch_0
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 118
    :pswitch_1
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 122
    :pswitch_2
    aget-byte v1, p0, p1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    goto :goto_0

    .line 127
    :pswitch_3
    sget-object v1, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v2, v0, 0x12

    aget-byte v1, v1, v2

    aput-byte v1, p3, p4

    .line 128
    add-int/lit8 v1, p4, 0x1

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v3, v0, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v2, v2, v3

    aput-byte v2, p3, v1

    .line 129
    add-int/lit8 v1, p4, 0x2

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v3, v0, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v2, v2, v3

    aput-byte v2, p3, v1

    .line 130
    add-int/lit8 v1, p4, 0x3

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    and-int/lit8 v3, v0, 0x3f

    aget-byte v2, v2, v3

    aput-byte v2, p3, v1

    goto :goto_1

    .line 134
    :pswitch_4
    sget-object v1, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v2, v0, 0x12

    aget-byte v1, v1, v2

    aput-byte v1, p3, p4

    .line 135
    add-int/lit8 v1, p4, 0x1

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v3, v0, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v2, v2, v3

    aput-byte v2, p3, v1

    .line 136
    add-int/lit8 v1, p4, 0x2

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v3, v0, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v2, v2, v3

    aput-byte v2, p3, v1

    .line 137
    add-int/lit8 v1, p4, 0x3

    aput-byte v4, p3, v1

    goto :goto_1

    .line 141
    :pswitch_5
    sget-object v1, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v2, v0, 0x12

    aget-byte v1, v1, v2

    aput-byte v1, p3, p4

    .line 142
    add-int/lit8 v1, p4, 0x1

    sget-object v2, Lorg/eclipse/jgit/util/Base64;->ENC:[B

    ushr-int/lit8 v3, v0, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v2, v2, v3

    aput-byte v2, p3, v1

    .line 143
    add-int/lit8 v1, p4, 0x2

    aput-byte v4, p3, v1

    .line 144
    add-int/lit8 v1, p4, 0x3

    aput-byte v4, p3, v1

    goto/16 :goto_1

    .line 112
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 125
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public static encodeBytes([B)Ljava/lang/String;
    .locals 2
    .parameter "source"

    .prologue
    .line 157
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/eclipse/jgit/util/Base64;->encodeBytes([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BII)Ljava/lang/String;
    .locals 10
    .parameter "source"
    .parameter "off"
    .parameter "len"

    .prologue
    const/4 v7, 0x0

    .line 172
    mul-int/lit8 v6, p2, 0x4

    div-int/lit8 v3, v6, 0x3

    .line 174
    .local v3, len43:I
    rem-int/lit8 v6, p2, 0x3

    if-lez v6, :cond_0

    const/4 v6, 0x4

    :goto_0
    add-int/2addr v6, v3

    new-array v4, v6, [B

    .line 175
    .local v4, outBuff:[B
    const/4 v0, 0x0

    .line 176
    .local v0, d:I
    const/4 v1, 0x0

    .line 177
    .local v1, e:I
    add-int/lit8 v2, p2, -0x2

    .line 179
    .local v2, len2:I
    :goto_1
    if-ge v0, v2, :cond_1

    .line 180
    add-int v6, v0, p1

    const/4 v8, 0x3

    invoke-static {p0, v6, v8, v4, v1}, Lorg/eclipse/jgit/util/Base64;->encode3to4([BII[BI)V

    .line 179
    add-int/lit8 v0, v0, 0x3

    add-int/lit8 v1, v1, 0x4

    goto :goto_1

    .end local v0           #d:I
    .end local v1           #e:I
    .end local v2           #len2:I
    .end local v4           #outBuff:[B
    :cond_0
    move v6, v7

    .line 174
    goto :goto_0

    .line 182
    .restart local v0       #d:I
    .restart local v1       #e:I
    .restart local v2       #len2:I
    .restart local v4       #outBuff:[B
    :cond_1
    if-ge v0, p2, :cond_2

    .line 183
    add-int v6, v0, p1

    sub-int v8, p2, v0

    invoke-static {p0, v6, v8, v4, v1}, Lorg/eclipse/jgit/util/Base64;->encode3to4([BII[BI)V

    .line 184
    add-int/lit8 v1, v1, 0x4

    .line 188
    :cond_2
    :try_start_0
    new-instance v6, Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "UTF-8"

    invoke-direct {v6, v4, v8, v1, v9}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    :goto_2
    return-object v6

    .line 189
    :catch_0
    move-exception v5

    .line 190
    .local v5, uue:Ljava/io/UnsupportedEncodingException;
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v4, v7, v1}, Ljava/lang/String;-><init>([BII)V

    goto :goto_2
.end method
