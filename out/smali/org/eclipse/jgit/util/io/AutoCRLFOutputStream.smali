.class public Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;
.super Ljava/io/OutputStream;
.source "AutoCRLFOutputStream.java"


# static fields
.field static final BUFFER_SIZE:I = 0x1f40


# instance fields
.field private binbuf:[B

.field private binbufcnt:I

.field private buf:I

.field private isBinary:Z

.field private onebytebuf:[B

.field private final out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "out"

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buf:I

    .line 64
    const/16 v0, 0x1f40

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    .line 66
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->onebytebuf:[B

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    .line 76
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->out:Ljava/io/OutputStream;

    .line 77
    return-void
.end method

.method private buffer([BII)I
    .locals 4
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    iget v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    iget-object v3, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    array-length v3, v3

    if-le v2, v3, :cond_0

    .line 140
    .end local p3
    :goto_0
    return p3

    .line 134
    .restart local p3
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    array-length v2, v2

    iget v3, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    sub-int/2addr v2, v3

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 135
    .local v0, copy:I
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    iget v3, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    invoke-static {p1, p2, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 136
    iget v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    .line 137
    sub-int v1, p3, v0

    .line 138
    .local v1, remaining:I
    if-lez v1, :cond_1

    .line 139
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->decideMode()V

    :cond_1
    move p3, v1

    .line 140
    goto :goto_0
.end method

.method private decideMode()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    iget v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    invoke-static {v1, v2}, Lorg/eclipse/jgit/diff/RawText;->isBinary([BI)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->isBinary:Z

    .line 145
    iget v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    .line 146
    .local v0, cachedLen:I
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    .line 147
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v0}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->write([BII)V

    .line 148
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->flush()V

    .line 161
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 162
    return-void
.end method

.method public flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    iget v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbufcnt:I

    iget-object v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->binbuf:[B

    array-length v1, v1

    if-gt v0, v1, :cond_0

    .line 153
    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->decideMode()V

    .line 154
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buf:I

    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 156
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
    const/4 v2, 0x0

    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->onebytebuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 82
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->onebytebuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->write([BII)V

    .line 83
    return-void
.end method

.method public write([B)V
    .locals 3
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    const/4 v1, 0x0

    array-length v2, p1

    invoke-direct {p0, p1, v1, v2}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buffer([BII)I

    move-result v0

    .line 88
    .local v0, overflow:I
    if-lez v0, :cond_0

    .line 89
    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-virtual {p0, p1, v1, v0}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->write([BII)V

    .line 90
    :cond_0
    return-void
.end method

.method public write([BII)V
    .locals 10
    .parameter "b"
    .parameter "startOff"
    .parameter "startLen"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    const/16 v8, 0xd

    .line 95
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buffer([BII)I

    move-result v5

    .line 96
    .local v5, overflow:I
    if-gez v5, :cond_1

    .line 129
    :cond_0
    :goto_0
    return-void

    .line 98
    :cond_1
    add-int v6, p2, p3

    sub-int v4, v6, v5

    .line 99
    .local v4, off:I
    move v3, v5

    .line 100
    .local v3, len:I
    if-eqz v3, :cond_0

    .line 102
    move v2, v4

    .line 103
    .local v2, lastw:I
    iget-boolean v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->isBinary:Z

    if-eqz v6, :cond_2

    .line 104
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v6, p1, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 107
    :cond_2
    move v1, v4

    .local v1, i:I
    :goto_1
    add-int v6, v4, v3

    if-ge v1, v6, :cond_7

    .line 108
    aget-byte v0, p1, v1

    .line 109
    .local v0, c:B
    if-ne v0, v8, :cond_3

    .line 110
    iput v8, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buf:I

    .line 107
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 111
    :cond_3
    const/16 v6, 0xa

    if-ne v0, v6, :cond_6

    .line 112
    iget v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buf:I

    if-eq v6, v8, :cond_5

    .line 113
    if-ge v2, v1, :cond_4

    .line 114
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->out:Ljava/io/OutputStream;

    sub-int v7, v1, v2

    invoke-virtual {v6, p1, v2, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 116
    :cond_4
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v6, v8}, Ljava/io/OutputStream;->write(I)V

    .line 117
    move v2, v1

    .line 119
    :cond_5
    iput v9, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buf:I

    goto :goto_2

    .line 121
    :cond_6
    iput v9, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buf:I

    goto :goto_2

    .line 124
    .end local v0           #c:B
    :cond_7
    add-int v6, v4, v3

    if-ge v2, v6, :cond_8

    .line 125
    iget-object v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->out:Ljava/io/OutputStream;

    add-int v7, v4, v3

    sub-int/2addr v7, v2

    invoke-virtual {v6, p1, v2, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 127
    :cond_8
    add-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    aget-byte v6, p1, v6

    if-ne v6, v8, :cond_0

    .line 128
    iput v8, p0, Lorg/eclipse/jgit/util/io/AutoCRLFOutputStream;->buf:I

    goto :goto_0
.end method
