.class public Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;
.super Ljava/lang/Object;
.source "DeltaEncoder.java"


# static fields
.field private static final MAX_COPY_CMD_SIZE:I = 0x8

.field private static final MAX_INSERT_DATA_SIZE:I = 0x7f

.field private static final MAX_V2_COPY:I = 0x10000


# instance fields
.field private final buf:[B

.field private final limit:I

.field private final out:Ljava/io/OutputStream;

.field private size:I


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;JJ)V
    .locals 7
    .parameter "out"
    .parameter "baseSize"
    .parameter "resultSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;-><init>(Ljava/io/OutputStream;JJI)V

    .line 101
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;JJI)V
    .locals 1
    .parameter "out"
    .parameter "baseSize"
    .parameter "resultSize"
    .parameter "limit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    .line 123
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->out:Ljava/io/OutputStream;

    .line 124
    iput p6, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    .line 125
    invoke-direct {p0, p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->writeVarint(J)V

    .line 126
    invoke-direct {p0, p4, p5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->writeVarint(J)V

    .line 127
    return-void
.end method

.method private encodeCopy(IJI)I
    .locals 8
    .parameter "p"
    .parameter "offset"
    .parameter "cnt"

    .prologue
    const-wide/16 v6, 0xff

    .line 256
    const/16 v1, 0x80

    .line 257
    .local v1, cmd:I
    add-int/lit8 v3, p1, 0x1

    .end local p1
    .local v3, p:I
    move v2, p1

    .line 260
    .local v2, cmdPtr:I
    and-long v4, p2, v6

    long-to-int v4, v4

    int-to-byte v0, v4

    .local v0, b:B
    if-eqz v0, :cond_0

    .line 261
    or-int/lit8 v1, v1, 0x1

    .line 262
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 p1, v3, 0x1

    .end local v3           #p:I
    .restart local p1
    aput-byte v0, v4, v3

    move v3, p1

    .line 264
    .end local p1
    .restart local v3       #p:I
    :cond_0
    const/16 v4, 0x8

    ushr-long v4, p2, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v0, v4

    if-eqz v0, :cond_1

    .line 265
    or-int/lit8 v1, v1, 0x2

    .line 266
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 p1, v3, 0x1

    .end local v3           #p:I
    .restart local p1
    aput-byte v0, v4, v3

    move v3, p1

    .line 268
    .end local p1
    .restart local v3       #p:I
    :cond_1
    const/16 v4, 0x10

    ushr-long v4, p2, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v0, v4

    if-eqz v0, :cond_2

    .line 269
    or-int/lit8 v1, v1, 0x4

    .line 270
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 p1, v3, 0x1

    .end local v3           #p:I
    .restart local p1
    aput-byte v0, v4, v3

    move v3, p1

    .line 272
    .end local p1
    .restart local v3       #p:I
    :cond_2
    const/16 v4, 0x18

    ushr-long v4, p2, v4

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v0, v4

    if-eqz v0, :cond_3

    .line 273
    or-int/lit8 v1, v1, 0x8

    .line 274
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 p1, v3, 0x1

    .end local v3           #p:I
    .restart local p1
    aput-byte v0, v4, v3

    move v3, p1

    .line 277
    .end local p1
    .restart local v3       #p:I
    :cond_3
    const/high16 v4, 0x1

    if-eq p4, v4, :cond_6

    .line 278
    and-int/lit16 v4, p4, 0xff

    int-to-byte v0, v4

    if-eqz v0, :cond_4

    .line 279
    or-int/lit8 v1, v1, 0x10

    .line 280
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 p1, v3, 0x1

    .end local v3           #p:I
    .restart local p1
    aput-byte v0, v4, v3

    move v3, p1

    .line 282
    .end local p1
    .restart local v3       #p:I
    :cond_4
    ushr-int/lit8 v4, p4, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v0, v4

    if-eqz v0, :cond_5

    .line 283
    or-int/lit8 v1, v1, 0x20

    .line 284
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 p1, v3, 0x1

    .end local v3           #p:I
    .restart local p1
    aput-byte v0, v4, v3

    move v3, p1

    .line 286
    .end local p1
    .restart local v3       #p:I
    :cond_5
    ushr-int/lit8 v4, p4, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v0, v4

    if-eqz v0, :cond_6

    .line 287
    or-int/lit8 v1, v1, 0x40

    .line 288
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 p1, v3, 0x1

    .end local v3           #p:I
    .restart local p1
    aput-byte v0, v4, v3

    .line 292
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    int-to-byte v5, v1

    aput-byte v5, v4, v2

    .line 293
    return p1

    .end local p1
    .restart local v3       #p:I
    :cond_6
    move p1, v3

    .end local v3           #p:I
    .restart local p1
    goto :goto_0
.end method

.method private writeVarint(J)V
    .locals 5
    .parameter "sz"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    const/4 v0, 0x0

    .local v0, p:I
    move v1, v0

    .line 131
    .end local v0           #p:I
    .local v1, p:I
    :goto_0
    const-wide/16 v2, 0x80

    cmp-long v2, p1, v2

    if-ltz v2, :cond_0

    .line 132
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 v0, v1, 0x1

    .end local v1           #p:I
    .restart local v0       #p:I
    long-to-int v3, p1

    and-int/lit8 v3, v3, 0x7f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 133
    const/4 v2, 0x7

    ushr-long/2addr p1, v2

    move v1, v0

    .end local v0           #p:I
    .restart local v1       #p:I
    goto :goto_0

    .line 135
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    add-int/lit8 v0, v1, 0x1

    .end local v1           #p:I
    .restart local v0       #p:I
    long-to-int v3, p1

    and-int/lit8 v3, v3, 0x7f

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 136
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    .line 137
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    if-eqz v2, :cond_1

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    if-ge v2, v3, :cond_2

    .line 138
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->out:Ljava/io/OutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 139
    :cond_2
    return-void
.end method


# virtual methods
.method public copy(JI)Z
    .locals 6
    .parameter "offset"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/high16 v5, 0x1

    const/4 v2, 0x0

    .line 224
    if-nez p3, :cond_0

    .line 252
    :goto_0
    return v1

    .line 227
    :cond_0
    const/4 v0, 0x0

    .line 233
    .local v0, p:I
    :cond_1
    :goto_1
    if-ge v5, p3, :cond_3

    .line 234
    invoke-direct {p0, v0, p1, p2, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->encodeCopy(IJI)I

    move-result v0

    .line 235
    const-wide/32 v3, 0x10000

    add-long/2addr p1, v3

    .line 236
    sub-int/2addr p3, v5

    .line 238
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    array-length v3, v3

    add-int/lit8 v4, v0, 0x8

    if-ge v3, v4, :cond_1

    .line 239
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    if-eqz v3, :cond_2

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    iget v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    add-int/2addr v4, v0

    if-ge v3, v4, :cond_2

    move v1, v2

    .line 240
    goto :goto_0

    .line 241
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->out:Ljava/io/OutputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    invoke-virtual {v3, v4, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 242
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    .line 243
    const/4 v0, 0x0

    goto :goto_1

    .line 247
    :cond_3
    invoke-direct {p0, v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->encodeCopy(IJI)I

    move-result v0

    .line 248
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    if-eqz v3, :cond_4

    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    iget v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    add-int/2addr v4, v0

    if-ge v3, v4, :cond_4

    move v1, v2

    .line 249
    goto :goto_0

    .line 250
    :cond_4
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->out:Ljava/io/OutputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->buf:[B

    invoke-virtual {v3, v4, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 251
    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    goto :goto_0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 143
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    return v0
.end method

.method public insert(Ljava/lang/String;)Z
    .locals 1
    .parameter "text"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->insert([B)Z

    move-result v0

    return v0
.end method

.method public insert([B)Z
    .locals 2
    .parameter "text"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->insert([BII)Z

    move-result v0

    return v0
.end method

.method public insert([BII)Z
    .locals 5
    .parameter "text"
    .parameter "off"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 190
    if-gtz p3, :cond_0

    .line 207
    :goto_0
    return v2

    .line 192
    :cond_0
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    if-eqz v3, :cond_2

    .line 193
    div-int/lit8 v0, p3, 0x7f

    .line 194
    .local v0, hdrs:I
    rem-int/lit8 v3, p3, 0x7f

    if-eqz v3, :cond_1

    .line 195
    add-int/lit8 v0, v0, 0x1

    .line 196
    :cond_1
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->limit:I

    iget v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    add-int/2addr v4, v0

    add-int/2addr v4, p3

    if-ge v3, v4, :cond_2

    .line 197
    const/4 v2, 0x0

    goto :goto_0

    .line 200
    .end local v0           #hdrs:I
    :cond_2
    const/16 v3, 0x7f

    invoke-static {v3, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 201
    .local v1, n:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->out:Ljava/io/OutputStream;

    int-to-byte v4, v1

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write(I)V

    .line 202
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->out:Ljava/io/OutputStream;

    invoke-virtual {v3, p1, p2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 203
    add-int/2addr p2, v1

    .line 204
    sub-int/2addr p3, v1

    .line 205
    iget v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    add-int/lit8 v4, v1, 0x1

    add-int/2addr v3, v4

    iput v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->size:I

    .line 206
    if-gtz p3, :cond_2

    goto :goto_0
.end method
