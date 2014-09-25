.class public abstract Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
.super Ljava/lang/Object;
.source "AbstractTreeIterator.java"


# static fields
.field protected static final DEFAULT_PATH_SIZE:I = 0x80

.field protected static final zeroid:[B


# instance fields
.field matchShift:I

.field matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

.field protected mode:I

.field final parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

.field protected path:[B

.field protected pathLen:I

.field protected final pathOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 87
    const/16 v0, 0x14

    new-array v0, v0, [B

    sput-object v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->zeroid:[B

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 144
    const/16 v0, 0x80

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 145
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    .line 146
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 6
    .parameter "prefix"

    .prologue
    const/16 v5, 0x80

    const/16 v4, 0x2f

    const/4 v3, 0x0

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 166
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 169
    sget-object v1, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {p1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/charset/Charset;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 170
    .local v0, b:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    .line 171
    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 172
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 173
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v2, v2, -0x1

    aget-byte v1, v1, v2

    if-eq v1, v4, :cond_0

    .line 174
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    aput-byte v4, v1, v2

    .line 175
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    iput v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    .line 180
    .end local v0           #b:Ljava/nio/ByteBuffer;
    :goto_0
    return-void

    .line 177
    :cond_1
    new-array v1, v5, [B

    iput-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 178
    iput v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    goto :goto_0
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V
    .locals 5
    .parameter "p"

    .prologue
    const/16 v4, 0x2f

    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 221
    iget-object v1, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iput-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 222
    iget v1, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    .line 225
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    add-int/lit8 v2, v2, -0x1

    const/16 v3, 0x2f

    aput-byte v3, v1, v2
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_0
    return-void

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    iget v1, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->growPath(I)V

    .line 228
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    add-int/lit8 v2, v2, -0x1

    aput-byte v4, v1, v2

    goto :goto_0
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;[BI)V
    .locals 0
    .parameter "p"
    .parameter "childPath"
    .parameter "childPathOffset"

    .prologue
    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 251
    iput-object p2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 252
    iput p3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    .line 253
    return-void
.end method

.method protected constructor <init>([B)V
    .locals 4
    .parameter "prefix"

    .prologue
    const/16 v1, 0x80

    const/16 v3, 0x2f

    const/4 v2, 0x0

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 200
    if-eqz p1, :cond_1

    array-length v0, p1

    if-lez v0, :cond_1

    .line 201
    array-length v0, p1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    .line 202
    iget v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v0, v0, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 203
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v1, v1, -0x1

    aget-byte v0, v0, v1

    if-eq v0, v3, :cond_0

    .line 205
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    aput-byte v3, v0, v1

    .line 206
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    iput v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    .line 211
    :goto_0
    return-void

    .line 208
    :cond_1
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 209
    iput v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    goto :goto_0
.end method

.method private static alreadyMatch(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 360
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 361
    .local v0, ap:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v1, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 362
    .local v1, bp:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    if-eqz v0, :cond_0

    if-nez v1, :cond_1

    .line 363
    :cond_0
    const/4 v2, 0x0

    .line 365
    :goto_1
    return v2

    .line 364
    :cond_1
    iget-object v2, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v3, v1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v2, v3, :cond_2

    .line 365
    iget v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    goto :goto_1

    .line 366
    :cond_2
    move-object p0, v0

    .line 367
    move-object p1, v1

    .line 368
    goto :goto_0
.end method

.method private static lastPathChar(I)I
    .locals 1
    .parameter "mode"

    .prologue
    .line 372
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x2f

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private pathCompare([BIIII)I
    .locals 5
    .parameter "b"
    .parameter "bPos"
    .parameter "bEnd"
    .parameter "bMode"
    .parameter "aPos"

    .prologue
    .line 341
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 342
    .local v0, a:[B
    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    .line 344
    .local v1, aEnd:I
    :goto_0
    if-ge p5, v1, :cond_1

    if-ge p2, p3, :cond_1

    .line 345
    aget-byte v3, v0, p5

    and-int/lit16 v3, v3, 0xff

    aget-byte v4, p1, p2

    and-int/lit16 v4, v4, 0xff

    sub-int v2, v3, v4

    .line 346
    .local v2, cmp:I
    if-eqz v2, :cond_0

    .line 354
    .end local v2           #cmp:I
    :goto_1
    return v2

    .line 344
    .restart local v2       #cmp:I
    :cond_0
    add-int/lit8 p5, p5, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 350
    .end local v2           #cmp:I
    :cond_1
    if-ge p5, v1, :cond_2

    .line 351
    aget-byte v3, v0, p5

    and-int/lit16 v3, v3, 0xff

    invoke-static {p4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->lastPathChar(I)I

    move-result v4

    sub-int v2, v3, v4

    goto :goto_1

    .line 352
    :cond_2
    if-ge p2, p3, :cond_3

    .line 353
    iget v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->lastPathChar(I)I

    move-result v3

    aget-byte v4, p1, p2

    and-int/lit16 v4, v4, 0xff

    sub-int v2, v3, v4

    goto :goto_1

    .line 354
    :cond_3
    iget v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->lastPathChar(I)I

    move-result v3

    invoke-static {p4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->lastPathChar(I)I

    move-result v4

    sub-int v2, v3, v4

    goto :goto_1
.end method

.method private setPathCapacity(II)V
    .locals 4
    .parameter "capacity"
    .parameter "len"

    .prologue
    const/4 v3, 0x0

    .line 294
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 295
    .local v1, o:[B
    new-array v0, p1, [B

    .line 296
    .local v0, n:[B
    invoke-static {v1, v3, v0, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 297
    move-object v2, p0

    .local v2, p:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_0
    if-eqz v2, :cond_0

    iget-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    if-ne v3, v1, :cond_0

    .line 298
    iput-object v0, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 297
    iget-object v2, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_0

    .line 299
    :cond_0
    return-void
.end method


# virtual methods
.method public abstract back(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation
.end method

.method public createEmptyTreeIterator()Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;
    .locals 1

    .prologue
    .line 511
    new-instance v0, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    return-object v0
.end method

.method public abstract createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 1
    .parameter "reader"
    .parameter "idBuffer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 535
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    return-object v0
.end method

.method protected ensurePathCapacity(II)V
    .locals 4
    .parameter "capacity"
    .parameter "len"

    .prologue
    .line 275
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    array-length v3, v3

    if-lt v3, p1, :cond_0

    .line 283
    :goto_0
    return-void

    .line 277
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 278
    .local v2, o:[B
    array-length v0, v2

    .line 279
    .local v0, current:I
    move v1, v0

    .line 280
    .local v1, newCapacity:I
    :goto_1
    if-ge v1, p1, :cond_1

    if-lez v1, :cond_1

    .line 281
    shl-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 282
    :cond_1
    invoke-direct {p0, v1, p2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->setPathCapacity(II)V

    goto :goto_0
.end method

.method public abstract eof()Z
.end method

.method public abstract first()Z
.end method

.method public getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 415
    iget v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-static {v0}, Lorg/eclipse/jgit/lib/FileMode;->fromBits(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    return-object v0
.end method

.method public getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2

    .prologue
    .line 400
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getEntryObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;)V
    .locals 2
    .parameter "out"

    .prologue
    .line 410
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 411
    return-void
.end method

.method public getEntryPathBuffer()[B
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    return-object v0
.end method

.method public getEntryPathHashCode()I
    .locals 5

    .prologue
    .line 454
    const/4 v1, 0x0

    .line 455
    .local v1, hash:I
    const/4 v3, 0x0

    iget v4, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    add-int/lit8 v4, v4, -0x10

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .local v2, i:I
    :goto_0
    iget v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    if-ge v2, v3, :cond_1

    .line 456
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    aget-byte v0, v3, v2

    .line 457
    .local v0, c:B
    const/16 v3, 0x20

    if-eq v0, v3, :cond_0

    .line 458
    ushr-int/lit8 v3, v1, 0x2

    shl-int/lit8 v4, v0, 0x18

    add-int v1, v3, v4

    .line 455
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 460
    .end local v0           #c:B
    :cond_1
    return v1
.end method

.method public getEntryPathLength()I
    .locals 1

    .prologue
    .line 442
    iget v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    return v0
.end method

.method public getEntryPathString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 425
    invoke-static {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->pathOf(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEntryRawMode()I
    .locals 1

    .prologue
    .line 420
    iget v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    return v0
.end method

.method public getName([BI)V
    .locals 4
    .parameter "buffer"
    .parameter "offset"

    .prologue
    .line 679
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    iget v2, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    iget v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    sub-int/2addr v2, v3

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 680
    return-void
.end method

.method public getNameLength()I
    .locals 2

    .prologue
    .line 654
    iget v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    iget v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getNameOffset()I
    .locals 1

    .prologue
    .line 664
    iget v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    return v0
.end method

.method protected growPath(I)V
    .locals 1
    .parameter "len"

    .prologue
    .line 263
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->setPathCapacity(II)V

    .line 264
    return-void
.end method

.method public abstract hasId()Z
.end method

.method public abstract idBuffer()[B
.end method

.method public idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z
    .locals 4
    .parameter "otherIterator"

    .prologue
    .line 387
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/ObjectId;->equals([BI[BI)Z

    move-result v0

    return v0
.end method

.method public abstract idOffset()I
.end method

.method public abstract next(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation
.end method

.method public pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I
    .locals 1
    .parameter "p"

    .prologue
    .line 310
    iget v0, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;I)I

    move-result v0

    return v0
.end method

.method pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;I)I
    .locals 6
    .parameter "p"
    .parameter "pMode"

    .prologue
    .line 318
    invoke-static {p0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->alreadyMatch(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    move-result v2

    .line 319
    .local v2, cPos:I
    iget-object v1, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    iget v3, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    move-object v0, p0

    move v4, p2

    move v5, v2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare([BIIII)I

    move-result v0

    return v0
.end method

.method public pathCompare([BIII)I
    .locals 6
    .parameter "buf"
    .parameter "pos"
    .parameter "end"
    .parameter "mode"

    .prologue
    .line 337
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare([BIIII)I

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 550
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->first()Z

    move-result v0

    if-nez v0, :cond_0

    .line 551
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->back(I)V

    goto :goto_0

    .line 552
    :cond_0
    return-void
.end method

.method public skip()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 636
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    .line 637
    return-void
.end method

.method public stopWalk()V
    .locals 0

    .prologue
    .line 648
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 685
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryPathString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
