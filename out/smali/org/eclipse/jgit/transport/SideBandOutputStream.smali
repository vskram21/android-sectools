.class public Lorg/eclipse/jgit/transport/SideBandOutputStream;
.super Ljava/io/OutputStream;
.source "SideBandOutputStream.java"


# static fields
.field public static final CH_DATA:I = 0x1

.field public static final CH_ERROR:I = 0x3

.field public static final CH_PROGRESS:I = 0x2

.field static final HDR_SIZE:I = 0x5

.field public static final MAX_BUF:I = 0xfff0

.field public static final SMALL_BUF:I = 0x3e8


# instance fields
.field private final buffer:[B

.field private cnt:I

.field private final out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(IILjava/io/OutputStream;)V
    .locals 8
    .parameter "chan"
    .parameter "sz"
    .parameter "os"

    .prologue
    const v7, 0xfff0

    const/4 v2, 0x2

    const/4 v6, 0x5

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 105
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 106
    if-lez p1, :cond_0

    const/16 v0, 0xff

    if-le p1, v0, :cond_1

    .line 107
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->channelMustBeInRange0_255:Ljava/lang/String;

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_1
    if-gt p2, v6, :cond_2

    .line 111
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->packetSizeMustBeAtLeast:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_2
    if-ge v7, p2, :cond_3

    .line 115
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->packetSizeMustBeAtMost:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_3
    iput-object p3, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->out:Ljava/io/OutputStream;

    .line 120
    new-array v0, p2, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    .line 121
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    const/4 v1, 0x4

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 122
    iput v6, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    .line 123
    return-void
.end method

.method private writeBuffer()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    iget v1, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    invoke-static {v0, v1}, Lorg/eclipse/jgit/transport/PacketLineOut;->formatLength([BI)V

    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    const/4 v2, 0x0

    iget v3, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 172
    const/4 v0, 0x5

    iput v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    .line 173
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->flushBuffer()V

    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 134
    return-void
.end method

.method flushBuffer()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    const/4 v0, 0x5

    iget v1, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    if-ge v0, v1, :cond_0

    .line 127
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->writeBuffer()V

    .line 128
    :cond_0
    return-void
.end method

.method public write(I)V
    .locals 3
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    iget v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    iget-object v1, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 165
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->writeBuffer()V

    .line 166
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    iget v1, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 167
    return-void
.end method

.method public write([BII)V
    .locals 6
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x5

    .line 138
    :goto_0
    if-lez p3, :cond_2

    .line 139
    iget-object v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    array-length v2, v2

    iget v3, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    sub-int v0, v2, v3

    .line 140
    .local v0, capacity:I
    iget v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    if-ne v2, v5, :cond_0

    if-ge v0, p3, :cond_0

    .line 143
    iget-object v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    array-length v3, v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/PacketLineOut;->formatLength([BI)V

    .line 144
    iget-object v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->out:Ljava/io/OutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 145
    iget-object v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v2, p1, p2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 146
    add-int/2addr p2, v0

    .line 147
    sub-int/2addr p3, v0

    goto :goto_0

    .line 150
    :cond_0
    if-nez v0, :cond_1

    .line 151
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->writeBuffer()V

    .line 153
    :cond_1
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 154
    .local v1, n:I
    iget-object v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->buffer:[B

    iget v3, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    invoke-static {p1, p2, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    iget v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/eclipse/jgit/transport/SideBandOutputStream;->cnt:I

    .line 156
    add-int/2addr p2, v1

    .line 157
    sub-int/2addr p3, v1

    goto :goto_0

    .line 160
    .end local v0           #capacity:I
    .end local v1           #n:I
    :cond_2
    return-void
.end method
