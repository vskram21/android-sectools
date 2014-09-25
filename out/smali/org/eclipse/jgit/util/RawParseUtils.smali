.class public final Lorg/eclipse/jgit/util/RawParseUtils;
.super Ljava/lang/Object;
.source "RawParseUtils.java"


# static fields
.field public static final UTF8_CHARSET:Ljava/nio/charset/Charset;

.field private static final base10byte:[B

.field private static final digits10:[B

.field private static final digits16:[B

.field private static final encodingAliases:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/nio/charset/Charset;",
            ">;"
        }
    .end annotation
.end field

.field private static final footerLineKeyChars:[B


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    const/16 v5, 0x39

    const/4 v4, 0x1

    .line 73
    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    sput-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    .line 84
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->encodingAliases:Ljava/util/Map;

    .line 85
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->encodingAliases:Ljava/util/Map;

    const-string v2, "latin-1"

    const-string v3, "ISO-8859-1"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const/16 v1, 0x3a

    new-array v1, v1, [B

    sput-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits10:[B

    .line 88
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits10:[B

    invoke-static {v1, v6}, Ljava/util/Arrays;->fill([BB)V

    .line 89
    const/16 v0, 0x30

    .local v0, i:C
    :goto_0
    if-gt v0, v5, :cond_0

    .line 90
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits10:[B

    add-int/lit8 v2, v0, -0x30

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 89
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_0

    .line 92
    :cond_0
    const/16 v1, 0x67

    new-array v1, v1, [B

    sput-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    .line 93
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    invoke-static {v1, v6}, Ljava/util/Arrays;->fill([BB)V

    .line 94
    const/16 v0, 0x30

    :goto_1
    if-gt v0, v5, :cond_1

    .line 95
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v2, v0, -0x30

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 94
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_1

    .line 96
    :cond_1
    const/16 v0, 0x61

    :goto_2
    const/16 v1, 0x66

    if-gt v0, v1, :cond_2

    .line 97
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v2, v0, -0x61

    add-int/lit8 v2, v2, 0xa

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 96
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_2

    .line 98
    :cond_2
    const/16 v0, 0x41

    :goto_3
    const/16 v1, 0x46

    if-gt v0, v1, :cond_3

    .line 99
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v2, v0, -0x41

    add-int/lit8 v2, v2, 0xa

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 98
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_3

    .line 101
    :cond_3
    const/16 v1, 0x7b

    new-array v1, v1, [B

    sput-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->footerLineKeyChars:[B

    .line 102
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->footerLineKeyChars:[B

    const/16 v2, 0x2d

    aput-byte v4, v1, v2

    .line 103
    const/16 v0, 0x30

    :goto_4
    if-gt v0, v5, :cond_4

    .line 104
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->footerLineKeyChars:[B

    aput-byte v4, v1, v0

    .line 103
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_4

    .line 105
    :cond_4
    const/16 v0, 0x41

    :goto_5
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_5

    .line 106
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->footerLineKeyChars:[B

    aput-byte v4, v1, v0

    .line 105
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_5

    .line 107
    :cond_5
    const/16 v0, 0x61

    :goto_6
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_6

    .line 108
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->footerLineKeyChars:[B

    aput-byte v4, v1, v0

    .line 107
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_6

    .line 131
    :cond_6
    const/16 v1, 0xa

    new-array v1, v1, [B

    fill-array-data v1, :array_0

    sput-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->base10byte:[B

    return-void

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
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1098
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1100
    return-void
.end method

.method public static final author([BI)I
    .locals 3
    .parameter "b"
    .parameter "ptr"

    .prologue
    .line 567
    array-length v0, p0

    .line 568
    .local v0, sz:I
    if-nez p1, :cond_0

    .line 569
    add-int/lit8 p1, p1, 0x2e

    .line 570
    :cond_0
    :goto_0
    if-ge p1, v0, :cond_1

    aget-byte v1, p0, p1

    const/16 v2, 0x70

    if-ne v1, v2, :cond_1

    .line 571
    add-int/lit8 p1, p1, 0x30

    goto :goto_0

    .line 572
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/lib/ObjectChecker;->author:[B

    invoke-static {p0, p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    return v1
.end method

.method private static charsetForAlias(Ljava/lang/String;)Ljava/nio/charset/Charset;
    .locals 2
    .parameter "name"

    .prologue
    .line 1095
    sget-object v0, Lorg/eclipse/jgit/util/RawParseUtils;->encodingAliases:Ljava/util/Map;

    invoke-static {p0}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public static final commitMessage([BI)I
    .locals 3
    .parameter "b"
    .parameter "ptr"

    .prologue
    .line 1024
    array-length v0, p0

    .line 1025
    .local v0, sz:I
    if-nez p1, :cond_0

    .line 1026
    add-int/lit8 p1, p1, 0x2e

    .line 1027
    :cond_0
    :goto_0
    if-ge p1, v0, :cond_1

    aget-byte v1, p0, p1

    const/16 v2, 0x70

    if-ne v1, v2, :cond_1

    .line 1028
    add-int/lit8 p1, p1, 0x30

    goto :goto_0

    .line 1033
    :cond_1
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->tagMessage([BI)I

    move-result v1

    return v1
.end method

.method public static final committer([BI)I
    .locals 3
    .parameter "b"
    .parameter "ptr"

    .prologue
    .line 589
    array-length v0, p0

    .line 590
    .local v0, sz:I
    if-nez p1, :cond_0

    .line 591
    add-int/lit8 p1, p1, 0x2e

    .line 592
    :cond_0
    :goto_0
    if-ge p1, v0, :cond_1

    aget-byte v1, p0, p1

    const/16 v2, 0x70

    if-ne v1, v2, :cond_1

    .line 593
    add-int/lit8 p1, p1, 0x30

    goto :goto_0

    .line 594
    :cond_1
    if-ge p1, v0, :cond_2

    aget-byte v1, p0, p1

    const/16 v2, 0x61

    if-ne v1, v2, :cond_2

    .line 595
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    .line 596
    :cond_2
    sget-object v1, Lorg/eclipse/jgit/lib/ObjectChecker;->committer:[B

    invoke-static {p0, p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    return v1
.end method

.method private static decode(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .parameter "b"
    .parameter "charset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/CharacterCodingException;
        }
    .end annotation

    .prologue
    .line 1006
    invoke-virtual {p1}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    .line 1007
    .local v0, d:Ljava/nio/charset/CharsetDecoder;
    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 1008
    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 1009
    invoke-virtual {v0, p0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static decode(Ljava/nio/charset/Charset;[B)Ljava/lang/String;
    .locals 2
    .parameter "cs"
    .parameter "buffer"

    .prologue
    .line 885
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;
    .locals 2
    .parameter "cs"
    .parameter "buffer"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 909
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/eclipse/jgit/util/RawParseUtils;->decodeNoFallback(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 914
    :goto_0
    return-object v1

    .line 910
    :catch_0
    move-exception v0

    .line 914
    .local v0, e:Ljava/nio/charset/CharacterCodingException;
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/util/RawParseUtils;->extractBinaryString([BII)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static decode([B)Ljava/lang/String;
    .locals 2
    .parameter "buffer"

    .prologue
    .line 847
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decode([BII)Ljava/lang/String;
    .locals 1
    .parameter "buffer"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 868
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v0, p0, p1, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decodeNoFallback(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;
    .locals 4
    .parameter "cs"
    .parameter "buffer"
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/CharacterCodingException;
        }
    .end annotation

    .prologue
    .line 942
    sub-int v3, p3, p2

    invoke-static {p1, p2, v3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 943
    .local v0, b:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 950
    :try_start_0
    sget-object v3, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 972
    :goto_0
    return-object v3

    .line 951
    :catch_0
    move-exception v2

    .line 952
    .local v2, e:Ljava/nio/charset/CharacterCodingException;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 955
    sget-object v3, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v3}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 960
    :try_start_1
    invoke-static {v0, p0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    goto :goto_0

    .line 961
    :catch_1
    move-exception v2

    .line 962
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 969
    :cond_0
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    .line 970
    .local v1, defcs:Ljava/nio/charset/Charset;
    invoke-virtual {v1, p0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    sget-object v3, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v3}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 972
    :try_start_2
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v3

    goto :goto_0

    .line 973
    :catch_2
    move-exception v2

    .line 974
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 978
    :cond_1
    new-instance v3, Ljava/nio/charset/CharacterCodingException;

    invoke-direct {v3}, Ljava/nio/charset/CharacterCodingException;-><init>()V

    throw v3
.end method

.method public static final encoding([BI)I
    .locals 3
    .parameter "b"
    .parameter "ptr"

    .prologue
    .line 641
    array-length v0, p0

    .line 642
    .local v0, sz:I
    :goto_0
    if-ge p1, v0, :cond_1

    .line 643
    aget-byte v1, p0, p1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 644
    const/4 v1, -0x1

    .line 649
    :goto_1
    return v1

    .line 645
    :cond_0
    aget-byte v1, p0, p1

    const/16 v2, 0x65

    if-ne v1, v2, :cond_2

    .line 649
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/lib/ObjectChecker;->encoding:[B

    invoke-static {p0, p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    goto :goto_1

    .line 647
    :cond_2
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    goto :goto_0
.end method

.method public static endOfFooterLineKey([BI)I
    .locals 4
    .parameter "raw"
    .parameter "ptr"

    .prologue
    const/4 v2, -0x1

    .line 822
    :goto_0
    :try_start_0
    aget-byte v0, p0, p1

    .line 823
    .local v0, c:B
    sget-object v3, Lorg/eclipse/jgit/util/RawParseUtils;->footerLineKeyChars:[B

    aget-byte v3, v3, v0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v3, :cond_1

    .line 824
    const/16 v3, 0x3a

    if-ne v0, v3, :cond_0

    .line 831
    .end local v0           #c:B
    .end local p1
    :goto_1
    return p1

    .restart local v0       #c:B
    .restart local p1
    :cond_0
    move p1, v2

    .line 826
    goto :goto_1

    .line 828
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 829
    goto :goto_0

    .line 830
    .end local v0           #c:B
    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    move p1, v2

    .line 831
    goto :goto_1
.end method

.method public static final endOfParagraph([BI)I
    .locals 5
    .parameter "b"
    .parameter "start"

    .prologue
    const/16 v4, 0xd

    const/16 v3, 0xa

    .line 1073
    move v0, p1

    .line 1074
    .local v0, ptr:I
    array-length v1, p0

    .line 1075
    .local v1, sz:I
    :goto_0
    if-ge v0, v1, :cond_0

    aget-byte v2, p0, v0

    if-eq v2, v3, :cond_0

    aget-byte v2, p0, v0

    if-eq v2, v4, :cond_0

    .line 1076
    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    goto :goto_0

    .line 1077
    :cond_0
    if-le v0, p1, :cond_1

    add-int/lit8 v2, v0, -0x1

    aget-byte v2, p0, v2

    if-ne v2, v3, :cond_1

    .line 1078
    add-int/lit8 v0, v0, -0x1

    .line 1079
    :cond_1
    if-le v0, p1, :cond_2

    add-int/lit8 v2, v0, -0x1

    aget-byte v2, p0, v2

    if-ne v2, v4, :cond_2

    .line 1080
    add-int/lit8 v0, v0, -0x1

    .line 1081
    :cond_2
    return v0
.end method

.method public static extractBinaryString([BII)Ljava/lang/String;
    .locals 3
    .parameter "buffer"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 998
    new-instance v1, Ljava/lang/StringBuilder;

    sub-int v2, p2, p1

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 999
    .local v1, r:Ljava/lang/StringBuilder;
    move v0, p1

    .local v0, i:I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 1000
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 999
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1001
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static formatBase10([BII)I
    .locals 4
    .parameter "b"
    .parameter "o"
    .parameter "value"

    .prologue
    .line 169
    if-nez p2, :cond_0

    .line 170
    add-int/lit8 p1, p1, -0x1

    const/16 v2, 0x30

    aput-byte v2, p0, p1

    move v1, p1

    .line 182
    .end local p1
    .local v1, o:I
    :goto_0
    return v1

    .line 173
    .end local v1           #o:I
    .restart local p1
    :cond_0
    if-gez p2, :cond_2

    const/4 v0, 0x1

    .line 174
    .local v0, isneg:Z
    :goto_1
    if-eqz v0, :cond_1

    .line 175
    neg-int p2, p2

    .line 176
    :cond_1
    :goto_2
    if-eqz p2, :cond_3

    .line 177
    add-int/lit8 p1, p1, -0x1

    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->base10byte:[B

    rem-int/lit8 v3, p2, 0xa

    aget-byte v2, v2, v3

    aput-byte v2, p0, p1

    .line 178
    div-int/lit8 p2, p2, 0xa

    goto :goto_2

    .line 173
    .end local v0           #isneg:Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 180
    .restart local v0       #isneg:Z
    :cond_3
    if-eqz v0, :cond_4

    .line 181
    add-int/lit8 p1, p1, -0x1

    const/16 v2, 0x2d

    aput-byte v2, p0, p1

    :cond_4
    move v1, p1

    .line 182
    .end local p1
    .restart local v1       #o:I
    goto :goto_0
.end method

.method private static lastIndexOfTrim([BCI)I
    .locals 2
    .parameter "raw"
    .parameter "ch"
    .parameter "pos"

    .prologue
    .line 1085
    :goto_0
    if-ltz p2, :cond_0

    aget-byte v0, p0, p2

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    .line 1086
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    .line 1088
    :cond_0
    :goto_1
    if-ltz p2, :cond_1

    aget-byte v0, p0, p2

    if-eq v0, p1, :cond_1

    .line 1089
    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    .line 1091
    :cond_1
    return p2
.end method

.method public static final lineMap([BII)Lorg/eclipse/jgit/util/IntList;
    .locals 3
    .parameter "buf"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 545
    new-instance v0, Lorg/eclipse/jgit/util/IntList;

    sub-int v1, p2, p1

    div-int/lit8 v1, v1, 0x24

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/IntList;-><init>(I)V

    .line 546
    .local v0, map:Lorg/eclipse/jgit/util/IntList;
    const/4 v1, 0x1

    const/high16 v2, -0x8000

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/IntList;->fillTo(II)V

    .line 547
    :goto_0
    if-ge p1, p2, :cond_0

    .line 548
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 547
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    goto :goto_0

    .line 549
    :cond_0
    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/util/IntList;->add(I)V

    .line 550
    return-object v0
.end method

.method public static final match([BI[B)I
    .locals 4
    .parameter "b"
    .parameter "ptr"
    .parameter "src"

    .prologue
    const/4 v1, -0x1

    .line 123
    array-length v2, p2

    add-int/2addr v2, p1

    array-length v3, p0

    if-le v2, v3, :cond_1

    .line 128
    :cond_0
    :goto_0
    return v1

    .line 125
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p2

    if-ge v0, v2, :cond_2

    .line 126
    aget-byte v2, p0, p1

    aget-byte v3, p2, v0

    if-ne v2, v3, :cond_0

    .line 125
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_2
    move v1, p1

    .line 128
    goto :goto_0
.end method

.method public static final next([BIC)I
    .locals 3
    .parameter "b"
    .parameter "ptr"
    .parameter "chrA"

    .prologue
    .line 411
    array-length v1, p0

    .local v1, sz:I
    move v0, p1

    .line 412
    .end local p1
    .local v0, ptr:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 413
    add-int/lit8 p1, v0, 0x1

    .end local v0           #ptr:I
    .restart local p1
    aget-byte v2, p0, v0

    if-ne v2, p2, :cond_1

    move v0, p1

    .line 416
    .end local p1
    :goto_1
    return v0

    .restart local v0       #ptr:I
    :cond_0
    move p1, v0

    .end local v0           #ptr:I
    .restart local p1
    goto :goto_1

    :cond_1
    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0
.end method

.method public static final nextLF([BI)I
    .locals 1
    .parameter "b"
    .parameter "ptr"

    .prologue
    .line 431
    const/16 v0, 0xa

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->next([BIC)I

    move-result v0

    return v0
.end method

.method public static final nextLF([BIC)I
    .locals 4
    .parameter "b"
    .parameter "ptr"
    .parameter "chrA"

    .prologue
    .line 448
    array-length v2, p0

    .local v2, sz:I
    move v1, p1

    .line 449
    .end local p1
    .local v1, ptr:I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 450
    add-int/lit8 p1, v1, 0x1

    .end local v1           #ptr:I
    .restart local p1
    aget-byte v0, p0, v1

    .line 451
    .local v0, c:B
    if-eq v0, p2, :cond_0

    const/16 v3, 0xa

    if-ne v0, v3, :cond_1

    :cond_0
    move v1, p1

    .line 454
    .end local v0           #c:B
    .end local p1
    :goto_1
    return v1

    .restart local v0       #c:B
    .restart local p1
    :cond_1
    move v1, p1

    .line 453
    .end local p1
    .restart local v1       #ptr:I
    goto :goto_0

    .end local v0           #c:B
    :cond_2
    move p1, v1

    .line 454
    .end local v1           #ptr:I
    .restart local p1
    goto :goto_1
.end method

.method public static final parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I
    .locals 6
    .parameter "b"
    .parameter "ptr"
    .parameter "ptrResult"

    .prologue
    .line 205
    const/4 v0, 0x0

    .line 206
    .local v0, r:I
    const/4 v1, 0x0

    .line 208
    .local v1, sign:I
    :try_start_0
    array-length v2, p0

    .line 209
    .local v2, sz:I
    :goto_0
    if-ge p1, v2, :cond_0

    aget-byte v4, p0, p1

    const/16 v5, 0x20

    if-ne v4, v5, :cond_0

    .line 210
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 211
    :cond_0
    if-lt p1, v2, :cond_1

    .line 212
    const/4 v4, 0x0

    .line 236
    .end local v2           #sz:I
    :goto_1
    return v4

    .line 214
    .restart local v2       #sz:I
    :cond_1
    aget-byte v4, p0, p1

    packed-switch v4, :pswitch_data_0

    .line 224
    :goto_2
    :pswitch_0
    if-ge p1, v2, :cond_2

    .line 225
    sget-object v4, Lorg/eclipse/jgit/util/RawParseUtils;->digits10:[B

    aget-byte v5, p0, p1

    aget-byte v3, v4, v5
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    .local v3, v:B
    if-gez v3, :cond_4

    .line 234
    .end local v2           #sz:I
    .end local v3           #v:B
    :cond_2
    :goto_3
    if-eqz p2, :cond_3

    .line 235
    iput p1, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 236
    :cond_3
    if-gez v1, :cond_5

    neg-int v4, v0

    goto :goto_1

    .line 216
    .restart local v2       #sz:I
    :pswitch_1
    const/4 v1, -0x1

    .line 217
    add-int/lit8 p1, p1, 0x1

    .line 218
    goto :goto_2

    .line 220
    :pswitch_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 228
    .restart local v3       #v:B
    :cond_4
    mul-int/lit8 v4, v0, 0xa

    add-int v0, v4, v3

    .line 229
    add-int/lit8 p1, p1, 0x1

    .line 230
    goto :goto_2

    .end local v2           #sz:I
    .end local v3           #v:B
    :cond_5
    move v4, v0

    .line 236
    goto :goto_1

    .line 231
    :catch_0
    move-exception v4

    goto :goto_3

    .line 214
    nop

    :pswitch_data_0
    .packed-switch 0x2b
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static parseEncoding([B)Ljava/nio/charset/Charset;
    .locals 7
    .parameter "b"

    .prologue
    .line 666
    const/4 v5, 0x0

    invoke-static {p0, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->encoding([BI)I

    move-result v3

    .line 667
    .local v3, enc:I
    if-gez v3, :cond_1

    .line 668
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    .line 681
    :cond_0
    :goto_0
    return-object v0

    .line 669
    :cond_1
    invoke-static {p0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v4

    .line 670
    .local v4, lf:I
    sget-object v5, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    add-int/lit8 v6, v4, -0x1

    invoke-static {v5, p0, v3, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v2

    .line 672
    .local v2, decoded:Ljava/lang/String;
    :try_start_0
    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_0
    .catch Ljava/nio/charset/IllegalCharsetNameException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    goto :goto_0

    .line 673
    :catch_0
    move-exception v1

    .line 674
    .local v1, badName:Ljava/nio/charset/IllegalCharsetNameException;
    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->charsetForAlias(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 675
    .local v0, aliased:Ljava/nio/charset/Charset;
    if-nez v0, :cond_0

    .line 677
    throw v1

    .line 678
    .end local v0           #aliased:Ljava/nio/charset/Charset;
    .end local v1           #badName:Ljava/nio/charset/IllegalCharsetNameException;
    :catch_1
    move-exception v1

    .line 679
    .local v1, badName:Ljava/nio/charset/UnsupportedCharsetException;
    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->charsetForAlias(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 680
    .restart local v0       #aliased:Ljava/nio/charset/Charset;
    if-nez v0, :cond_0

    .line 682
    throw v1
.end method

.method public static final parseHexInt16([BI)I
    .locals 3
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 309
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    aget-byte v2, p0, p1

    aget-byte v1, v1, v2

    shl-int/lit8 v0, v1, 0x4

    .line 311
    .local v0, r:I
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v1, v1, v2

    or-int/2addr v0, v1

    .line 312
    shl-int/lit8 v0, v0, 0x4

    .line 314
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aget-byte v1, v1, v2

    or-int/2addr v0, v1

    .line 315
    shl-int/lit8 v0, v0, 0x4

    .line 317
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    aget-byte v1, v1, v2

    or-int/2addr v0, v1

    .line 318
    if-gez v0, :cond_0

    .line 319
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 320
    :cond_0
    return v0
.end method

.method public static final parseHexInt32([BI)I
    .locals 4
    .parameter "bs"
    .parameter "p"

    .prologue
    .line 339
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    aget-byte v3, p0, p1

    aget-byte v2, v2, v3

    shl-int/lit8 v1, v2, 0x4

    .line 341
    .local v1, r:I
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    or-int/2addr v1, v2

    .line 342
    shl-int/lit8 v1, v1, 0x4

    .line 344
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    or-int/2addr v1, v2

    .line 345
    shl-int/lit8 v1, v1, 0x4

    .line 347
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v3, p1, 0x3

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    or-int/2addr v1, v2

    .line 348
    shl-int/lit8 v1, v1, 0x4

    .line 350
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v3, p1, 0x4

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    or-int/2addr v1, v2

    .line 351
    shl-int/lit8 v1, v1, 0x4

    .line 353
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v3, p1, 0x5

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    or-int/2addr v1, v2

    .line 354
    shl-int/lit8 v1, v1, 0x4

    .line 356
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v3, p1, 0x6

    aget-byte v3, p0, v3

    aget-byte v2, v2, v3

    or-int/2addr v1, v2

    .line 358
    sget-object v2, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    add-int/lit8 v3, p1, 0x7

    aget-byte v3, p0, v3

    aget-byte v0, v2, v3

    .line 359
    .local v0, last:I
    if-ltz v1, :cond_0

    if-gez v0, :cond_1

    .line 360
    :cond_0
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v2

    .line 361
    :cond_1
    shl-int/lit8 v2, v1, 0x4

    or-int/2addr v2, v0

    return v2
.end method

.method public static final parseHexInt4(B)I
    .locals 2
    .parameter "digit"

    .prologue
    .line 374
    sget-object v1, Lorg/eclipse/jgit/util/RawParseUtils;->digits16:[B

    aget-byte v0, v1, p0

    .line 375
    .local v0, r:B
    if-gez v0, :cond_0

    .line 376
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 377
    :cond_0
    return v0
.end method

.method public static final parseLongBase10([BILorg/eclipse/jgit/util/MutableInteger;)J
    .locals 9
    .parameter "b"
    .parameter "ptr"
    .parameter "ptrResult"

    .prologue
    .line 259
    const-wide/16 v0, 0x0

    .line 260
    .local v0, r:J
    const/4 v2, 0x0

    .line 262
    .local v2, sign:I
    :try_start_0
    array-length v3, p0

    .line 263
    .local v3, sz:I
    :goto_0
    if-ge p1, v3, :cond_0

    aget-byte v5, p0, p1

    const/16 v6, 0x20

    if-ne v5, v6, :cond_0

    .line 264
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 265
    :cond_0
    if-lt p1, v3, :cond_1

    .line 266
    const-wide/16 v5, 0x0

    .line 290
    .end local v3           #sz:I
    :goto_1
    return-wide v5

    .line 268
    .restart local v3       #sz:I
    :cond_1
    aget-byte v5, p0, p1

    packed-switch v5, :pswitch_data_0

    .line 278
    :goto_2
    :pswitch_0
    if-ge p1, v3, :cond_2

    .line 279
    sget-object v5, Lorg/eclipse/jgit/util/RawParseUtils;->digits10:[B

    aget-byte v6, p0, p1

    aget-byte v4, v5, v6
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 280
    .local v4, v:B
    if-gez v4, :cond_4

    .line 288
    .end local v3           #sz:I
    .end local v4           #v:B
    :cond_2
    :goto_3
    if-eqz p2, :cond_3

    .line 289
    iput p1, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 290
    :cond_3
    if-gez v2, :cond_5

    neg-long v5, v0

    goto :goto_1

    .line 270
    .restart local v3       #sz:I
    :pswitch_1
    const/4 v2, -0x1

    .line 271
    add-int/lit8 p1, p1, 0x1

    .line 272
    goto :goto_2

    .line 274
    :pswitch_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 282
    .restart local v4       #v:B
    :cond_4
    const-wide/16 v5, 0xa

    mul-long/2addr v5, v0

    int-to-long v7, v4

    add-long v0, v5, v7

    .line 283
    add-int/lit8 p1, p1, 0x1

    .line 284
    goto :goto_2

    .end local v3           #sz:I
    .end local v4           #v:B
    :cond_5
    move-wide v5, v0

    .line 290
    goto :goto_1

    .line 285
    :catch_0
    move-exception v5

    goto :goto_3

    .line 268
    nop

    :pswitch_data_0
    .packed-switch 0x2b
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static parsePersonIdent(Ljava/lang/String;)Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 2
    .parameter "in"

    .prologue
    .line 698
    invoke-static {p0}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parsePersonIdent([BI)Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v0

    return-object v0
.end method

.method public static parsePersonIdent([BI)Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 14
    .parameter "raw"
    .parameter "nameB"

    .prologue
    .line 720
    invoke-static {p0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseEncoding([B)Ljava/nio/charset/Charset;

    move-result-object v6

    .line 721
    .local v6, cs:Ljava/nio/charset/Charset;
    const/16 v0, 0x3c

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v7

    .line 722
    .local v7, emailB:I
    const/16 v0, 0x3e

    invoke-static {p0, v7, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v8

    .line 723
    .local v8, emailE:I
    array-length v0, p0

    if-ge v7, v0, :cond_0

    aget-byte v0, p0, v7

    const/16 v3, 0xa

    if-eq v0, v3, :cond_0

    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    if-lt v8, v0, :cond_1

    add-int/lit8 v0, v8, -0x1

    aget-byte v0, p0, v0

    const/16 v3, 0x3e

    if-eq v0, v3, :cond_1

    .line 725
    :cond_0
    const/4 v0, 0x0

    .line 752
    :goto_0
    return-object v0

    .line 727
    :cond_1
    add-int/lit8 v0, v7, -0x2

    if-lt v0, p1, :cond_2

    add-int/lit8 v0, v7, -0x2

    aget-byte v0, p0, v0

    const/16 v3, 0x20

    if-ne v0, v3, :cond_2

    add-int/lit8 v9, v7, -0x2

    .line 729
    .local v9, nameEnd:I
    :goto_1
    invoke-static {v6, p0, p1, v9}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v1

    .line 730
    .local v1, name:Ljava/lang/String;
    add-int/lit8 v0, v8, -0x1

    invoke-static {v6, p0, v7, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v2

    .line 740
    .local v2, email:Ljava/lang/String;
    const/16 v0, 0x20

    add-int/lit8 v3, v8, -0x1

    invoke-static {p0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-static {p0, v0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->lastIndexOfTrim([BCI)I

    move-result v0

    add-int/lit8 v10, v0, 0x1

    .line 742
    .local v10, tzBegin:I
    if-gt v10, v8, :cond_3

    .line 743
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    goto :goto_0

    .line 727
    .end local v1           #name:Ljava/lang/String;
    .end local v2           #email:Ljava/lang/String;
    .end local v9           #nameEnd:I
    .end local v10           #tzBegin:I
    :cond_2
    add-int/lit8 v9, v7, -0x1

    goto :goto_1

    .line 745
    .restart local v1       #name:Ljava/lang/String;
    .restart local v2       #email:Ljava/lang/String;
    .restart local v9       #nameEnd:I
    .restart local v10       #tzBegin:I
    :cond_3
    const/16 v0, 0x20

    add-int/lit8 v3, v10, -0x1

    invoke-static {p0, v0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->lastIndexOfTrim([BCI)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 747
    .local v13, whenBegin:I
    add-int/lit8 v0, v10, -0x1

    if-lt v13, v0, :cond_4

    .line 748
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    goto :goto_0

    .line 750
    :cond_4
    const/4 v0, 0x0

    invoke-static {p0, v13, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseLongBase10([BILorg/eclipse/jgit/util/MutableInteger;)J

    move-result-wide v11

    .line 751
    .local v11, when:J
    invoke-static {p0, v10}, Lorg/eclipse/jgit/util/RawParseUtils;->parseTimeZoneOffset([BI)I

    move-result v5

    .line 752
    .local v5, tz:I
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    const-wide/16 v3, 0x3e8

    mul-long/2addr v3, v11

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    goto :goto_0
.end method

.method public static parsePersonIdentOnly([BI)Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 12
    .parameter "raw"
    .parameter "nameB"

    .prologue
    .line 774
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v9

    .line 775
    .local v9, stop:I
    const/16 v0, 0x3c

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v6

    .line 776
    .local v6, emailB:I
    const/16 v0, 0x3e

    invoke-static {p0, v6, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v7

    .line 779
    .local v7, emailE:I
    if-ge v7, v9, :cond_0

    .line 780
    add-int/lit8 v0, v7, -0x1

    invoke-static {p0, v6, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v2

    .line 784
    .local v2, email:Ljava/lang/String;
    :goto_0
    if-ge v6, v9, :cond_1

    .line 785
    add-int/lit8 v0, v6, -0x2

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v1

    .line 789
    .local v1, name:Ljava/lang/String;
    :goto_1
    new-instance v8, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v8}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    .line 792
    .local v8, ptrout:Lorg/eclipse/jgit/util/MutableInteger;
    if-ge v7, v9, :cond_2

    .line 793
    add-int/lit8 v0, v7, 0x1

    invoke-static {p0, v0, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->parseLongBase10([BILorg/eclipse/jgit/util/MutableInteger;)J

    move-result-wide v10

    .line 794
    .local v10, when:J
    iget v0, v8, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseTimeZoneOffset([BI)I

    move-result v5

    .line 799
    .local v5, tz:I
    :goto_2
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    const-wide/16 v3, 0x3e8

    mul-long/2addr v3, v10

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    return-object v0

    .line 782
    .end local v1           #name:Ljava/lang/String;
    .end local v2           #email:Ljava/lang/String;
    .end local v5           #tz:I
    .end local v8           #ptrout:Lorg/eclipse/jgit/util/MutableInteger;
    .end local v10           #when:J
    :cond_0
    const-string v2, "invalid"

    .restart local v2       #email:Ljava/lang/String;
    goto :goto_0

    .line 787
    :cond_1
    invoke-static {p0, p1, v9}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #name:Ljava/lang/String;
    goto :goto_1

    .line 796
    .restart local v8       #ptrout:Lorg/eclipse/jgit/util/MutableInteger;
    :cond_2
    const-wide/16 v10, 0x0

    .line 797
    .restart local v10       #when:J
    const/4 v5, 0x0

    .restart local v5       #tz:I
    goto :goto_2
.end method

.method public static final parseTimeZoneOffset([BI)I
    .locals 4
    .parameter "b"
    .parameter "ptr"

    .prologue
    .line 393
    const/4 v3, 0x0

    invoke-static {p0, p1, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v2

    .line 394
    .local v2, v:I
    rem-int/lit8 v1, v2, 0x64

    .line 395
    .local v1, tzMins:I
    div-int/lit8 v0, v2, 0x64

    .line 396
    .local v0, tzHours:I
    mul-int/lit8 v3, v0, 0x3c

    add-int/2addr v3, v1

    return v3
.end method

.method public static final prev([BIC)I
    .locals 2
    .parameter "b"
    .parameter "ptr"
    .parameter "chrA"

    .prologue
    .line 469
    array-length v1, p0

    if-ne p1, v1, :cond_1

    .line 470
    add-int/lit8 p1, p1, -0x1

    move v0, p1

    .line 471
    .end local p1
    .local v0, ptr:I
    :goto_0
    if-ltz v0, :cond_0

    .line 472
    add-int/lit8 p1, v0, -0x1

    .end local v0           #ptr:I
    .restart local p1
    aget-byte v1, p0, v0

    if-ne v1, p2, :cond_1

    move v0, p1

    .line 475
    .end local p1
    :goto_1
    return v0

    .restart local v0       #ptr:I
    :cond_0
    move p1, v0

    .end local v0           #ptr:I
    .restart local p1
    goto :goto_1

    :cond_1
    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0
.end method

.method public static final prevLF([BI)I
    .locals 1
    .parameter "b"
    .parameter "ptr"

    .prologue
    .line 490
    const/16 v0, 0xa

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->prev([BIC)I

    move-result v0

    return v0
.end method

.method public static final prevLF([BIC)I
    .locals 3
    .parameter "b"
    .parameter "ptr"
    .parameter "chrA"

    .prologue
    .line 508
    array-length v2, p0

    if-ne p1, v2, :cond_3

    .line 509
    add-int/lit8 p1, p1, -0x1

    move v1, p1

    .line 510
    .end local p1
    .local v1, ptr:I
    :goto_0
    if-ltz v1, :cond_2

    .line 511
    add-int/lit8 p1, v1, -0x1

    .end local v1           #ptr:I
    .restart local p1
    aget-byte v0, p0, v1

    .line 512
    .local v0, c:B
    if-eq v0, p2, :cond_0

    const/16 v2, 0xa

    if-ne v0, v2, :cond_1

    :cond_0
    move v1, p1

    .line 515
    .end local v0           #c:B
    .end local p1
    :goto_1
    return v1

    .restart local v0       #c:B
    .restart local p1
    :cond_1
    move v1, p1

    .line 514
    .end local p1
    .restart local v1       #ptr:I
    goto :goto_0

    .end local v0           #c:B
    :cond_2
    move p1, v1

    .line 515
    .end local v1           #ptr:I
    .restart local p1
    goto :goto_1

    :cond_3
    move v1, p1

    .end local p1
    .restart local v1       #ptr:I
    goto :goto_0
.end method

.method public static final tagMessage([BI)I
    .locals 3
    .parameter "b"
    .parameter "ptr"

    .prologue
    const/16 v2, 0xa

    .line 1048
    array-length v0, p0

    .line 1049
    .local v0, sz:I
    if-nez p1, :cond_0

    .line 1050
    add-int/lit8 p1, p1, 0x30

    .line 1051
    :cond_0
    :goto_0
    if-ge p1, v0, :cond_1

    aget-byte v1, p0, p1

    if-eq v1, v2, :cond_1

    .line 1052
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    goto :goto_0

    .line 1053
    :cond_1
    if-ge p1, v0, :cond_2

    aget-byte v1, p0, p1

    if-ne v1, v2, :cond_2

    .line 1054
    add-int/lit8 v1, p1, 0x1

    .line 1055
    :goto_1
    return v1

    :cond_2
    const/4 v1, -0x1

    goto :goto_1
.end method

.method public static final tagger([BI)I
    .locals 5
    .parameter "b"
    .parameter "ptr"

    .prologue
    const/4 v2, -0x1

    .line 613
    array-length v1, p0

    .line 614
    .local v1, sz:I
    if-nez p1, :cond_0

    .line 615
    add-int/lit8 p1, p1, 0x30

    .line 616
    :cond_0
    :goto_0
    if-ge p1, v1, :cond_3

    .line 617
    aget-byte v3, p0, p1

    const/16 v4, 0xa

    if-ne v3, v4, :cond_2

    move v0, v2

    .line 624
    :cond_1
    :goto_1
    return v0

    .line 619
    :cond_2
    sget-object v3, Lorg/eclipse/jgit/lib/ObjectChecker;->tagger:[B

    invoke-static {p0, p1, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    .line 620
    .local v0, m:I
    if-gez v0, :cond_1

    .line 622
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    .line 623
    goto :goto_0

    .end local v0           #m:I
    :cond_3
    move v0, v2

    .line 624
    goto :goto_1
.end method
