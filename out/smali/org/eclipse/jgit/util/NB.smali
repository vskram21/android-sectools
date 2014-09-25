.class public final Lorg/eclipse/jgit/util/NB;
.super Ljava/lang/Object;
.source "NB.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    return-void
.end method

.method public static compareUInt32(II)I
    .locals 3
    .parameter "a"
    .parameter "b"

    .prologue
    .line 62
    ushr-int/lit8 v1, p0, 0x1

    ushr-int/lit8 v2, p1, 0x1

    sub-int v0, v1, v2

    .line 63
    .local v0, cmp:I
    if-eqz v0, :cond_0

    .line 65
    .end local v0           #cmp:I
    :goto_0
    return v0

    .restart local v0       #cmp:I
    :cond_0
    and-int/lit8 v1, p0, 0x1

    and-int/lit8 v2, p1, 0x1

    sub-int v0, v1, v2

    goto :goto_0
.end method

.method public static decodeInt32([BI)I
    .locals 3
    .parameter "intbuf"
    .parameter "offset"

    .prologue
    .line 96
    aget-byte v1, p0, p1

    shl-int/lit8 v0, v1, 0x8

    .line 98
    .local v0, r:I
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 99
    shl-int/lit8 v0, v0, 0x8

    .line 101
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 102
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    return v1
.end method

.method public static decodeInt64([BI)J
    .locals 6
    .parameter "intbuf"
    .parameter "offset"

    .prologue
    const/16 v4, 0x8

    .line 118
    aget-byte v2, p0, p1

    shl-int/lit8 v2, v2, 0x8

    int-to-long v0, v2

    .line 120
    .local v0, r:J
    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    or-long/2addr v0, v2

    .line 121
    shl-long/2addr v0, v4

    .line 123
    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    or-long/2addr v0, v2

    .line 124
    shl-long/2addr v0, v4

    .line 126
    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    or-long/2addr v0, v2

    .line 127
    shl-long/2addr v0, v4

    .line 129
    add-int/lit8 v2, p1, 0x4

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    or-long/2addr v0, v2

    .line 130
    shl-long/2addr v0, v4

    .line 132
    add-int/lit8 v2, p1, 0x5

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    or-long/2addr v0, v2

    .line 133
    shl-long/2addr v0, v4

    .line 135
    add-int/lit8 v2, p1, 0x6

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    int-to-long v2, v2

    or-long/2addr v0, v2

    .line 136
    shl-long v2, v0, v4

    add-int/lit8 v4, p1, 0x7

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    int-to-long v4, v4

    or-long/2addr v2, v4

    return-wide v2
.end method

.method public static decodeUInt16([BI)I
    .locals 2
    .parameter "intbuf"
    .parameter "offset"

    .prologue
    .line 80
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v0, v1, 0x8

    .line 81
    .local v0, r:I
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v1, v0

    return v1
.end method

.method public static decodeUInt32([BI)J
    .locals 5
    .parameter "intbuf"
    .parameter "offset"

    .prologue
    .line 151
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v0, v1, 0x8

    .line 152
    .local v0, low:I
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 153
    shl-int/lit8 v0, v0, 0x8

    .line 155
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 156
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    int-to-long v1, v1

    const/16 v3, 0x18

    shl-long/2addr v1, v3

    int-to-long v3, v0

    or-long/2addr v1, v3

    return-wide v1
.end method

.method public static decodeUInt64([BI)J
    .locals 4
    .parameter "intbuf"
    .parameter "offset"

    .prologue
    .line 171
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    invoke-static {p0, v2}, Lorg/eclipse/jgit/util/NB;->decodeUInt32([BI)J

    move-result-wide v2

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static encodeInt16([BII)V
    .locals 2
    .parameter "intbuf"
    .parameter "offset"
    .parameter "v"

    .prologue
    .line 188
    add-int/lit8 v0, p1, 0x1

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 189
    ushr-int/lit8 p2, p2, 0x8

    .line 191
    int-to-byte v0, p2

    aput-byte v0, p0, p1

    .line 192
    return-void
.end method

.method public static encodeInt32([BII)V
    .locals 2
    .parameter "intbuf"
    .parameter "offset"
    .parameter "v"

    .prologue
    .line 207
    add-int/lit8 v0, p1, 0x3

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 208
    ushr-int/lit8 p2, p2, 0x8

    .line 210
    add-int/lit8 v0, p1, 0x2

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 211
    ushr-int/lit8 p2, p2, 0x8

    .line 213
    add-int/lit8 v0, p1, 0x1

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 214
    ushr-int/lit8 p2, p2, 0x8

    .line 216
    int-to-byte v0, p2

    aput-byte v0, p0, p1

    .line 217
    return-void
.end method

.method public static encodeInt64([BIJ)V
    .locals 3
    .parameter "intbuf"
    .parameter "offset"
    .parameter "v"

    .prologue
    const/16 v2, 0x8

    .line 232
    add-int/lit8 v0, p1, 0x7

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 233
    ushr-long/2addr p2, v2

    .line 235
    add-int/lit8 v0, p1, 0x6

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 236
    ushr-long/2addr p2, v2

    .line 238
    add-int/lit8 v0, p1, 0x5

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 239
    ushr-long/2addr p2, v2

    .line 241
    add-int/lit8 v0, p1, 0x4

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 242
    ushr-long/2addr p2, v2

    .line 244
    add-int/lit8 v0, p1, 0x3

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 245
    ushr-long/2addr p2, v2

    .line 247
    add-int/lit8 v0, p1, 0x2

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 248
    ushr-long/2addr p2, v2

    .line 250
    add-int/lit8 v0, p1, 0x1

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 251
    ushr-long/2addr p2, v2

    .line 253
    long-to-int v0, p2

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 254
    return-void
.end method
