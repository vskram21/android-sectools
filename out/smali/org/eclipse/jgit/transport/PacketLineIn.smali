.class public Lorg/eclipse/jgit/transport/PacketLineIn;
.super Ljava/lang/Object;
.source "PacketLineIn.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    }
.end annotation


# static fields
.field public static final END:Ljava/lang/String;


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final lineBuffer:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .parameter "i"

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->in:Ljava/io/InputStream;

    .line 98
    const/16 v0, 0x3e8

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    .line 99
    return-void
.end method


# virtual methods
.method readACK(Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    .locals 6
    .parameter "returnedId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x4

    const/16 v3, 0x2c

    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, line:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 104
    new-instance v2, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->expectedACKNAKFoundEOF:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    :cond_0
    const-string v2, "NAK"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 106
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->NAK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    .line 118
    :goto_0
    return-object v2

    .line 107
    :cond_1
    const-string v2, "ACK "

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 108
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromString(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v3, :cond_2

    .line 110
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    goto :goto_0

    .line 112
    :cond_2
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, arg:Ljava/lang/String;
    const-string v2, " continue"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 114
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_CONTINUE:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    goto :goto_0

    .line 115
    :cond_3
    const-string v2, " common"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 116
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_COMMON:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    goto :goto_0

    .line 117
    :cond_4
    const-string v2, " ready"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 118
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_READY:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    goto :goto_0

    .line 120
    .end local v0           #arg:Ljava/lang/String;
    :cond_5
    const-string v2, "ERR "

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 121
    new-instance v2, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 122
    :cond_6
    new-instance v2, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->expectedACKNAKGot:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method readLength()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x4

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 186
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->in:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    invoke-static {v2, v3, v8, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 188
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt16([BI)I

    move-result v1

    .line 189
    .local v1, len:I
    if-eqz v1, :cond_0

    if-ge v1, v4, :cond_0

    .line 190
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v2
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    .end local v1           #len:I
    :catch_0
    move-exception v0

    .line 193
    .local v0, err:Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->invalidPacketLineHeader:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    aget-byte v6, v6, v8

    int-to-char v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    aget-byte v6, v6, v7

    int-to-char v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    const/4 v7, 0x2

    aget-byte v6, v6, v7

    int-to-char v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    const/4 v7, 0x3

    aget-byte v6, v6, v7

    int-to-char v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 191
    .end local v0           #err:Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v1       #len:I
    :cond_0
    return v1
.end method

.method public readString()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 138
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PacketLineIn;->readLength()I

    move-result v0

    .line 139
    .local v0, len:I
    if-nez v0, :cond_0

    .line 140
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    .line 155
    :goto_0
    return-object v2

    .line 142
    :cond_0
    add-int/lit8 v0, v0, -0x4

    .line 143
    if-nez v0, :cond_1

    .line 144
    const-string v2, ""

    goto :goto_0

    .line 147
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    array-length v2, v2

    if-gt v0, v2, :cond_3

    .line 148
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    .line 152
    .local v1, raw:[B
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->in:Ljava/io/InputStream;

    invoke-static {v2, v1, v4, v0}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 153
    add-int/lit8 v2, v0, -0x1

    aget-byte v2, v1, v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_2

    .line 154
    add-int/lit8 v0, v0, -0x1

    .line 155
    :cond_2
    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v2, v1, v4, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 150
    .end local v1           #raw:[B
    :cond_3
    new-array v1, v0, [B

    .restart local v1       #raw:[B
    goto :goto_1
.end method

.method public readStringRaw()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 169
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/PacketLineIn;->readLength()I

    move-result v0

    .line 170
    .local v0, len:I
    if-nez v0, :cond_0

    .line 171
    sget-object v2, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    .line 182
    :goto_0
    return-object v2

    .line 173
    :cond_0
    add-int/lit8 v0, v0, -0x4

    .line 176
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    array-length v2, v2

    if-gt v0, v2, :cond_1

    .line 177
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->lineBuffer:[B

    .line 181
    .local v1, raw:[B
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PacketLineIn;->in:Ljava/io/InputStream;

    invoke-static {v2, v1, v3, v0}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 182
    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v2, v1, v3, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 179
    .end local v1           #raw:[B
    :cond_1
    new-array v1, v0, [B

    .restart local v1       #raw:[B
    goto :goto_1
.end method
