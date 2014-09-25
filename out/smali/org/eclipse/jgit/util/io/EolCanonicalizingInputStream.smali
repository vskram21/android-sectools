.class public Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;
.super Ljava/io/InputStream;
.source "EolCanonicalizingInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream$IsBinaryException;
    }
.end annotation


# instance fields
.field private abortIfBinary:Z

.field private final buf:[B

.field private cnt:I

.field private detectBinary:Z

.field private final in:Ljava/io/InputStream;

.field private isBinary:Z

.field private ptr:I

.field private final single:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 1
    .parameter "in"
    .parameter "detectBinary"

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;-><init>(Ljava/io/InputStream;ZZ)V

    .line 101
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;ZZ)V
    .locals 1
    .parameter "in"
    .parameter "detectBinary"
    .parameter "abortIfBinary"

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 59
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->single:[B

    .line 61
    const/16 v0, 0x1fa0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->buf:[B

    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->in:Ljava/io/InputStream;

    .line 117
    iput-boolean p2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->detectBinary:Z

    .line 118
    iput-boolean p3, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->abortIfBinary:Z

    .line 119
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

    .line 179
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->in:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->buf:[B

    iget-object v4, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->buf:[B

    array-length v4, v4

    invoke-virtual {v2, v3, v0, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->cnt:I

    .line 180
    iget v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->cnt:I

    if-ge v2, v1, :cond_0

    .line 189
    :goto_0
    return v0

    .line 182
    :cond_0
    iget-boolean v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->detectBinary:Z

    if-eqz v2, :cond_1

    .line 183
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->buf:[B

    iget v3, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->cnt:I

    invoke-static {v2, v3}, Lorg/eclipse/jgit/diff/RawText;->isBinary([BI)Z

    move-result v2

    iput-boolean v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->isBinary:Z

    .line 184
    iput-boolean v0, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->detectBinary:Z

    .line 185
    iget-boolean v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->isBinary:Z

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->abortIfBinary:Z

    if-eqz v2, :cond_1

    .line 186
    new-instance v0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream$IsBinaryException;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream$IsBinaryException;-><init>()V

    throw v0

    .line 188
    :cond_1
    iput v0, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    move v0, v1

    .line 189
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
    .line 175
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 176
    return-void
.end method

.method public isBinary()Z
    .locals 1

    .prologue
    .line 170
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->isBinary:Z

    return v0
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

    .line 123
    iget-object v1, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->single:[B

    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->read([BII)I

    move-result v0

    .line 124
    .local v0, read:I
    if-ne v0, v3, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->single:[B

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
    const/16 v9, 0xa

    const/16 v8, 0xd

    const/4 v4, -0x1

    .line 129
    if-nez p3, :cond_1

    .line 130
    const/4 v4, 0x0

    .line 162
    :cond_0
    :goto_0
    return v4

    .line 132
    :cond_1
    iget v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->cnt:I

    if-eq v5, v4, :cond_0

    .line 135
    move v2, p2

    .line 136
    .local v2, i:I
    add-int v1, p2, p3

    .local v1, end:I
    move v3, v2

    .line 138
    .end local v2           #i:I
    .local v3, i:I
    :goto_1
    if-ge v3, v1, :cond_7

    .line 139
    iget v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    iget v6, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->cnt:I

    if-ne v5, v6, :cond_2

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->fillBuffer()Z

    move-result v5

    if-nez v5, :cond_2

    move v2, v3

    .line 162
    .end local v3           #i:I
    .restart local v2       #i:I
    :goto_2
    if-eq v2, p2, :cond_0

    sub-int v4, v2, p2

    goto :goto_0

    .line 143
    .end local v2           #i:I
    .restart local v3       #i:I
    :cond_2
    iget-object v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->buf:[B

    iget v6, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    aget-byte v0, v5, v6

    .line 144
    .local v0, b:B
    iget-boolean v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->isBinary:Z

    if-nez v5, :cond_3

    if-eq v0, v8, :cond_4

    .line 146
    :cond_3
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aput-byte v0, p1, v3

    move v3, v2

    .line 147
    .end local v2           #i:I
    .restart local v3       #i:I
    goto :goto_1

    .line 150
    :cond_4
    iget v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    iget v6, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->cnt:I

    if-ne v5, v6, :cond_5

    invoke-direct {p0}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->fillBuffer()Z

    move-result v5

    if-nez v5, :cond_5

    .line 151
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aput-byte v8, p1, v3

    goto :goto_2

    .line 155
    .end local v2           #i:I
    .restart local v3       #i:I
    :cond_5
    iget-object v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->buf:[B

    iget v6, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    aget-byte v5, v5, v6

    if-ne v5, v9, :cond_6

    .line 156
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aput-byte v9, p1, v3

    .line 157
    iget v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;->ptr:I

    :goto_3
    move v3, v2

    .line 160
    .end local v2           #i:I
    .restart local v3       #i:I
    goto :goto_1

    .line 159
    :cond_6
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aput-byte v8, p1, v3

    goto :goto_3

    .end local v0           #b:B
    .end local v2           #i:I
    .restart local v3       #i:I
    :cond_7
    move v2, v3

    .end local v3           #i:I
    .restart local v2       #i:I
    goto :goto_2
.end method
