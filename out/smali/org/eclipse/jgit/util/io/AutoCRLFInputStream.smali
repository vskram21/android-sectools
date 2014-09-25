.class public Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;
.super Ljava/io/InputStream;
.source "AutoCRLFInputStream.java"


# static fields
.field static final BUFFER_SIZE:I = 0x1fa0


# instance fields
.field private final buf:[B

.field private cnt:I

.field private detectBinary:Z

.field private final in:Ljava/io/InputStream;

.field private isBinary:Z

.field private last:B

.field private ptr:I

.field private final single:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 1
    .parameter "in"
    .parameter "detectBinary"

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 64
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->single:[B

    .line 66
    const/16 v0, 0x1fa0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->buf:[B

    .line 90
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->in:Ljava/io/InputStream;

    .line 91
    iput-boolean p2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->detectBinary:Z

    .line 92
    return-void
.end method

.method private fillBuffer()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 144
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->in:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->buf:[B

    iget-object v4, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->buf:[B

    array-length v4, v4

    invoke-virtual {v2, v3, v0, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->cnt:I

    .line 145
    iget v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->cnt:I

    if-ge v2, v1, :cond_0

    .line 152
    :goto_0
    return v0

    .line 147
    :cond_0
    iget-boolean v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->detectBinary:Z

    if-eqz v2, :cond_1

    .line 148
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->buf:[B

    iget v3, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->cnt:I

    invoke-static {v2, v3}, Lorg/eclipse/jgit/diff/RawText;->isBinary([BI)Z

    move-result v2

    iput-boolean v2, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->isBinary:Z

    .line 149
    iput-boolean v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->detectBinary:Z

    .line 151
    :cond_1
    iput v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->ptr:I

    move v0, v1

    .line 152
    goto :goto_0
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
    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 141
    return-void
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 96
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->single:[B

    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->read([BII)I

    move-result v0

    .line 97
    .local v0, read:I
    if-ne v0, v3, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->single:[B

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public read([BII)I
    .locals 10
    .parameter "bs"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xd

    const/16 v8, 0xa

    const/4 v4, -0x1

    .line 102
    if-nez p3, :cond_1

    .line 103
    const/4 v4, 0x0

    .line 135
    :cond_0
    :goto_0
    return v4

    .line 105
    :cond_1
    iget v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->cnt:I

    if-eq v5, v4, :cond_0

    .line 108
    move v2, p2

    .line 109
    .local v2, i:I
    add-int v1, p2, p3

    .local v1, end:I
    move v3, v2

    .line 111
    .end local v2           #i:I
    .local v3, i:I
    :goto_1
    if-ge v3, v1, :cond_2

    .line 112
    iget v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->ptr:I

    iget v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->cnt:I

    if-ne v5, v6, :cond_3

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->fillBuffer()Z

    move-result v5

    if-nez v5, :cond_3

    .line 132
    :cond_2
    if-ne v3, p2, :cond_8

    .line 133
    .local v4, n:I
    :goto_2
    if-lez v4, :cond_0

    .line 134
    add-int/lit8 v5, v3, -0x1

    aget-byte v5, p1, v5

    iput-byte v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->last:B

    goto :goto_0

    .line 115
    .end local v4           #n:I
    :cond_3
    iget-object v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->buf:[B

    iget v6, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->ptr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->ptr:I

    aget-byte v0, v5, v6

    .line 116
    .local v0, b:B
    iget-boolean v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->isBinary:Z

    if-nez v5, :cond_4

    if-eq v0, v8, :cond_5

    .line 118
    :cond_4
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    iput-byte v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->last:B

    aput-byte v0, p1, v3

    move v3, v2

    .line 119
    .end local v2           #i:I
    .restart local v3       #i:I
    goto :goto_1

    .line 122
    :cond_5
    if-ne v0, v8, :cond_7

    .line 123
    iget-byte v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->last:B

    if-ne v5, v9, :cond_6

    .line 124
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    iput-byte v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->last:B

    aput-byte v0, p1, v3

    move v3, v2

    .line 125
    .end local v2           #i:I
    .restart local v3       #i:I
    goto :goto_1

    .line 127
    :cond_6
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    iput-byte v9, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->last:B

    aput-byte v9, p1, v3

    .line 128
    iget v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->ptr:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->ptr:I

    :goto_3
    move v3, v2

    .line 131
    .end local v2           #i:I
    .restart local v3       #i:I
    goto :goto_1

    .line 130
    :cond_7
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    iput-byte v0, p0, Lorg/eclipse/jgit/util/io/AutoCRLFInputStream;->last:B

    aput-byte v0, p1, v3

    goto :goto_3

    .line 132
    .end local v0           #b:B
    .end local v2           #i:I
    .restart local v3       #i:I
    :cond_8
    sub-int v4, v3, p2

    goto :goto_2
.end method
