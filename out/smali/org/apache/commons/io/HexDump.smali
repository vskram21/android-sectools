.class public Lorg/apache/commons/io/HexDump;
.super Ljava/lang/Object;
.source "HexDump.java"


# static fields
.field public static final EOL:Ljava/lang/String;

.field private static final _cbuffer:Ljava/lang/StringBuffer;

.field private static final _hexcodes:[C

.field private static final _lbuffer:Ljava/lang/StringBuffer;

.field private static final _shifts:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 108
    const-string v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/io/HexDump;->EOL:Ljava/lang/String;

    .line 110
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/io/HexDump;->_lbuffer:Ljava/lang/StringBuffer;

    .line 111
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/io/HexDump;->_cbuffer:Ljava/lang/StringBuffer;

    .line 112
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/commons/io/HexDump;->_hexcodes:[C

    .line 117
    new-array v0, v2, [I

    fill-array-data v0, :array_1

    sput-object v0, Lorg/apache/commons/io/HexDump;->_shifts:[I

    return-void

    .line 112
    :array_0
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
        0x41t 0x0t
        0x42t 0x0t
        0x43t 0x0t
        0x44t 0x0t
        0x45t 0x0t
        0x46t 0x0t
    .end array-data

    .line 117
    :array_1
    .array-data 0x4
        0x1ct 0x0t 0x0t 0x0t
        0x18t 0x0t 0x0t 0x0t
        0x14t 0x0t 0x0t 0x0t
        0x10t 0x0t 0x0t 0x0t
        0xct 0x0t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method private static dump(B)Ljava/lang/StringBuffer;
    .locals 5
    .parameter "value"

    .prologue
    .line 144
    sget-object v1, Lorg/apache/commons/io/HexDump;->_cbuffer:Ljava/lang/StringBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 145
    const/4 v0, 0x0

    .local v0, j:I
    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 146
    sget-object v1, Lorg/apache/commons/io/HexDump;->_cbuffer:Ljava/lang/StringBuffer;

    sget-object v2, Lorg/apache/commons/io/HexDump;->_hexcodes:[C

    sget-object v3, Lorg/apache/commons/io/HexDump;->_shifts:[I

    add-int/lit8 v4, v0, 0x6

    aget v3, v3, v4

    shr-int v3, p0, v3

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 145
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 148
    :cond_0
    sget-object v1, Lorg/apache/commons/io/HexDump;->_cbuffer:Ljava/lang/StringBuffer;

    return-object v1
.end method

.method private static dump(J)Ljava/lang/StringBuffer;
    .locals 5
    .parameter "value"

    .prologue
    .line 129
    sget-object v1, Lorg/apache/commons/io/HexDump;->_lbuffer:Ljava/lang/StringBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 130
    const/4 v0, 0x0

    .local v0, j:I
    :goto_0
    const/16 v1, 0x8

    if-ge v0, v1, :cond_0

    .line 131
    sget-object v1, Lorg/apache/commons/io/HexDump;->_lbuffer:Ljava/lang/StringBuffer;

    sget-object v2, Lorg/apache/commons/io/HexDump;->_hexcodes:[C

    sget-object v3, Lorg/apache/commons/io/HexDump;->_shifts:[I

    aget v3, v3, v0

    shr-long v3, p0, v3

    long-to-int v3, v3

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 130
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 134
    :cond_0
    sget-object v1, Lorg/apache/commons/io/HexDump;->_lbuffer:Ljava/lang/StringBuffer;

    return-object v1
.end method

.method public static dump([BJLjava/io/OutputStream;I)V
    .locals 10
    .parameter "data"
    .parameter "offset"
    .parameter "stream"
    .parameter "index"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ArrayIndexOutOfBoundsException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x10

    const/16 v8, 0x20

    .line 64
    if-ltz p4, :cond_0

    array-length v6, p0

    if-lt p4, v6, :cond_1

    .line 65
    :cond_0
    new-instance v6, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "illegal index: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, " into array of length "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    array-length v8, p0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 69
    :cond_1
    if-nez p3, :cond_2

    .line 70
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "cannot write to nullstream"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 72
    :cond_2
    int-to-long v6, p4

    add-long v2, p1, v6

    .line 73
    .local v2, display_offset:J
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v6, 0x4a

    invoke-direct {v0, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 75
    .local v0, buffer:Ljava/lang/StringBuffer;
    move v4, p4

    .local v4, j:I
    :goto_0
    array-length v6, p0

    if-ge v4, v6, :cond_8

    .line 76
    array-length v6, p0

    sub-int v1, v6, v4

    .line 78
    .local v1, chars_read:I
    if-le v1, v9, :cond_3

    .line 79
    const/16 v1, 0x10

    .line 81
    :cond_3
    invoke-static {v2, v3}, Lorg/apache/commons/io/HexDump;->dump(J)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 82
    const/4 v5, 0x0

    .local v5, k:I
    :goto_1
    if-ge v5, v9, :cond_5

    .line 83
    if-ge v5, v1, :cond_4

    .line 84
    add-int v6, v5, v4

    aget-byte v6, p0, v6

    invoke-static {v6}, Lorg/apache/commons/io/HexDump;->dump(B)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 88
    :goto_2
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 82
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 86
    :cond_4
    const-string v6, "  "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 90
    :cond_5
    const/4 v5, 0x0

    :goto_3
    if-ge v5, v1, :cond_7

    .line 91
    add-int v6, v5, v4

    aget-byte v6, p0, v6

    if-lt v6, v8, :cond_6

    add-int v6, v5, v4

    aget-byte v6, p0, v6

    const/16 v7, 0x7f

    if-ge v6, v7, :cond_6

    .line 92
    add-int v6, v5, v4

    aget-byte v6, p0, v6

    int-to-char v6, v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 90
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 94
    :cond_6
    const/16 v6, 0x2e

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 97
    :cond_7
    sget-object v6, Lorg/apache/commons/io/HexDump;->EOL:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {p3, v6}, Ljava/io/OutputStream;->write([B)V

    .line 99
    invoke-virtual {p3}, Ljava/io/OutputStream;->flush()V

    .line 100
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 101
    int-to-long v6, v1

    add-long/2addr v2, v6

    .line 75
    add-int/lit8 v4, v4, 0x10

    goto :goto_0

    .line 103
    .end local v1           #chars_read:I
    .end local v5           #k:I
    :cond_8
    return-void
.end method
