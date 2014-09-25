.class public Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
.super Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
.source "CanonicalTreeParser.java"


# static fields
.field private static final EMPTY:[B


# instance fields
.field private currPtr:I

.field private nextPtr:I

.field private prevPtr:I

.field private raw:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->EMPTY:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>()V

    .line 76
    sget-object v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->EMPTY:[B

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset([B)V

    .line 77
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)V

    .line 109
    return-void
.end method

.method public constructor <init>([BLorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "prefix"
    .parameter "reader"
    .parameter "treeId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;-><init>([B)V

    .line 104
    invoke-virtual {p0, p2, p3}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 105
    return-void
.end method

.method private parseEntry()V
    .locals 6

    .prologue
    .line 341
    iget v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 342
    .local v2, ptr:I
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    add-int/lit8 v3, v2, 0x1

    .end local v2           #ptr:I
    .local v3, ptr:I
    aget-byte v0, v5, v2

    .line 343
    .local v0, c:B
    add-int/lit8 v4, v0, -0x30

    .local v4, tmp:I
    move v2, v3

    .line 345
    .end local v3           #ptr:I
    .restart local v2       #ptr:I
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    add-int/lit8 v3, v2, 0x1

    .end local v2           #ptr:I
    .restart local v3       #ptr:I
    aget-byte v0, v5, v2

    .line 346
    const/16 v5, 0x20

    if-ne v5, v0, :cond_0

    .line 351
    iput v4, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->mode:I

    .line 353
    iget v4, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->pathOffset:I

    move v2, v3

    .line 355
    .end local v3           #ptr:I
    .restart local v2       #ptr:I
    :goto_1
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    add-int/lit8 v3, v2, 0x1

    .end local v2           #ptr:I
    .restart local v3       #ptr:I
    aget-byte v0, v5, v2

    .line 356
    if-nez v0, :cond_1

    .line 365
    iput v4, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->pathLen:I

    .line 366
    add-int/lit8 v5, v3, 0x14

    iput v5, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    .line 367
    return-void

    .line 348
    :cond_0
    shl-int/lit8 v4, v4, 0x3

    .line 349
    add-int/lit8 v5, v0, -0x30

    add-int/2addr v4, v5

    move v2, v3

    .end local v3           #ptr:I
    .restart local v2       #ptr:I
    goto :goto_0

    .line 359
    .end local v2           #ptr:I
    .restart local v3       #ptr:I
    :cond_1
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->path:[B

    aput-byte v0, v5, v4
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    :goto_2
    add-int/lit8 v4, v4, 0x1

    move v2, v3

    .end local v3           #ptr:I
    .restart local v2       #ptr:I
    goto :goto_1

    .line 360
    .end local v2           #ptr:I
    .restart local v3       #ptr:I
    :catch_0
    move-exception v1

    .line 361
    .local v1, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->growPath(I)V

    .line 362
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->path:[B

    aput-byte v0, v5, v4

    goto :goto_2
.end method


# virtual methods
.method public back(I)V
    .locals 6
    .parameter "delta"

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v3, 0x1

    .line 306
    if-ne p1, v3, :cond_1

    iget v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    if-ltz v2, :cond_1

    .line 310
    iget v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    iput v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 311
    iput v4, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    .line 312
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->eof()Z

    move-result v2

    if-nez v2, :cond_0

    .line 313
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parseEntry()V

    .line 338
    :cond_0
    :goto_0
    return-void

    .line 315
    :cond_1
    if-gtz p1, :cond_2

    .line 316
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v2, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v2

    .line 323
    :cond_2
    add-int/lit8 v2, p1, 0x1

    new-array v1, v2, [I

    .line 324
    .local v1, trace:[I
    invoke-static {v1, v4}, Ljava/util/Arrays;->fill([II)V

    .line 325
    const/4 v0, 0x0

    .line 326
    .local v0, ptr:I
    :goto_1
    iget v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    if-eq v0, v2, :cond_4

    .line 327
    invoke-static {v1, v3, v1, v5, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 328
    aput v0, v1, p1

    .line 329
    :goto_2
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    aget-byte v2, v2, v0

    if-eqz v2, :cond_3

    .line 330
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 331
    :cond_3
    add-int/lit8 v0, v0, 0x15

    goto :goto_1

    .line 333
    :cond_4
    aget v2, v1, v3

    if-ne v2, v4, :cond_5

    .line 334
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v2, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v2

    .line 335
    :cond_5
    aget v2, v1, v5

    iput v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    .line 336
    aget v2, v1, v3

    iput v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 337
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parseEntry()V

    goto :goto_0
.end method

.method public bridge synthetic createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v0

    return-object v0
.end method

.method public createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .locals 1
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v0

    return-object v0
.end method

.method public createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .locals 3
    .parameter "reader"
    .parameter "idBuffer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idBuffer()[B

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idOffset()I

    move-result v2

    invoke-virtual {p2, v1, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 210
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->mode:I

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 211
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 212
    .local v0, me:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v1, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    const-string v2, "tree"

    invoke-direct {v1, v0, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v1

    .line 214
    .end local v0           #me:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->createSubtreeIterator0(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v1

    return-object v1
.end method

.method public final createSubtreeIterator0(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .locals 1
    .parameter "reader"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    new-instance v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)V

    .line 236
    .local v0, p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 237
    return-object v0
.end method

.method public eof()Z
    .locals 2

    .prologue
    .line 272
    iget v0, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public first()Z
    .locals 1

    .prologue
    .line 268
    iget v0, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getParent()Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    check-cast v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    return-object v0
.end method

.method public hasId()Z
    .locals 1

    .prologue
    .line 247
    const/4 v0, 0x1

    return v0
.end method

.method public idBuffer()[B
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    return-object v0
.end method

.method public idOffset()I
    .locals 1

    .prologue
    .line 257
    iget v0, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    add-int/lit8 v0, v0, -0x14

    return v0
.end method

.method public next()Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .locals 3

    .prologue
    .line 165
    move-object v0, p0

    .line 167
    .local v0, p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    :goto_0
    iget v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    iget-object v2, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    array-length v2, v2

    if-ne v1, v2, :cond_1

    .line 169
    iget-object v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-nez v1, :cond_0

    .line 170
    iget v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    iput v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 180
    :goto_1
    return-object v0

    .line 173
    :cond_0
    iget-object v0, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .end local v0           #p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    check-cast v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    .line 174
    .restart local v0       #p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    goto :goto_0

    .line 177
    :cond_1
    iget v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    iput v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    .line 178
    iget v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    iput v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 179
    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parseEntry()V

    goto :goto_1
.end method

.method public next(I)V
    .locals 3
    .parameter "delta"

    .prologue
    .line 277
    const/4 v2, 0x1

    if-ne p1, v2, :cond_1

    .line 280
    iget v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    iput v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    .line 281
    iget v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    iput v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 282
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->eof()Z

    move-result v2

    if-nez v2, :cond_0

    .line 283
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parseEntry()V

    .line 302
    :cond_0
    :goto_0
    return-void

    .line 289
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    array-length v0, v2

    .line 290
    .local v0, end:I
    iget v1, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    .line 291
    .local v1, ptr:I
    :goto_1
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_3

    if-eq v1, v0, :cond_3

    .line 292
    iput v1, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    .line 293
    :goto_2
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    aget-byte v2, v2, v1

    if-eqz v2, :cond_2

    .line 294
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 295
    :cond_2
    add-int/lit8 v1, v1, 0x15

    goto :goto_1

    .line 297
    :cond_3
    if-eqz p1, :cond_4

    .line 298
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v2, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v2

    .line 299
    :cond_4
    iput v1, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 300
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->eof()Z

    move-result v2

    if-nez v2, :cond_0

    .line 301
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parseEntry()V

    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 262
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->first()Z

    move-result v0

    if-nez v0, :cond_0

    .line 263
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset([B)V

    .line 264
    :cond_0
    return-void
.end method

.method public reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "reader"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    const/4 v0, 0x2

    invoke-virtual {p1, p2, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset([B)V

    .line 203
    return-void
.end method

.method public reset([B)V
    .locals 2
    .parameter "treeData"

    .prologue
    const/4 v1, 0x0

    .line 127
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->raw:[B

    .line 128
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->prevPtr:I

    .line 129
    iput v1, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->currPtr:I

    .line 130
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->eof()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    iput v1, p0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->nextPtr:I

    .line 134
    :goto_0
    return-void

    .line 133
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parseEntry()V

    goto :goto_0
.end method

.method public resetRoot(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .locals 2
    .parameter "reader"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    move-object v0, p0

    .line 157
    .local v0, p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    :goto_0
    iget-object v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eqz v1, :cond_0

    .line 158
    iget-object v0, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .end local v0           #p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    check-cast v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    .restart local v0       #p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    goto :goto_0

    .line 159
    :cond_0
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 160
    return-object v0
.end method
