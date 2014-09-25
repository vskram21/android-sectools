.class public Lorg/eclipse/jgit/dircache/DirCacheTree;
.super Ljava/lang/Object;
.source "DirCacheTree.java"


# static fields
.field private static final NO_CHILDREN:[Lorg/eclipse/jgit/dircache/DirCacheTree;

.field private static final NO_NAME:[B

.field private static final TREE_CMP:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/dircache/DirCacheTree;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private childCnt:I

.field private children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

.field private encodedName:[B

.field private entrySpan:I

.field private id:Lorg/eclipse/jgit/lib/ObjectId;

.field private parent:Lorg/eclipse/jgit/dircache/DirCacheTree;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 78
    new-array v0, v1, [B

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCacheTree;->NO_NAME:[B

    .line 80
    new-array v0, v1, [Lorg/eclipse/jgit/dircache/DirCacheTree;

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCacheTree;->NO_CHILDREN:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 82
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheTree$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/dircache/DirCacheTree$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/dircache/DirCacheTree;->TREE_CMP:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    sget-object v0, Lorg/eclipse/jgit/dircache/DirCacheTree;->NO_NAME:[B

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    .line 122
    sget-object v0, Lorg/eclipse/jgit/dircache/DirCacheTree;->NO_CHILDREN:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 123
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    .line 124
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    .line 125
    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/dircache/DirCacheTree;[BII)V
    .locals 2
    .parameter "myParent"
    .parameter "path"
    .parameter "pathOff"
    .parameter "pathLen"

    .prologue
    const/4 v1, 0x0

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    iput-object p1, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->parent:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 130
    new-array v0, p4, [B

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    .line 131
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    invoke-static {p2, p3, v0, v1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 132
    sget-object v0, Lorg/eclipse/jgit/dircache/DirCacheTree;->NO_CHILDREN:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 133
    iput v1, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    .line 134
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    .line 135
    return-void
.end method

.method constructor <init>([BLorg/eclipse/jgit/util/MutableInteger;Lorg/eclipse/jgit/dircache/DirCacheTree;)V
    .locals 9
    .parameter "in"
    .parameter "off"
    .parameter "myParent"

    .prologue
    const/4 v8, 0x0

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    iput-object p3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->parent:Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 141
    iget v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    invoke-static {p1, v5, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->next([BIC)I

    move-result v3

    .line 142
    .local v3, ptr:I
    iget v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    sub-int v5, v3, v5

    add-int/lit8 v2, v5, -0x1

    .line 143
    .local v2, nameLen:I
    if-lez v2, :cond_2

    .line 144
    new-array v5, v2, [B

    iput-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    .line 145
    iget v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    invoke-static {p1, v5, v6, v8, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    :goto_0
    invoke-static {p1, v3, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v5

    iput v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    .line 150
    iget v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    invoke-static {p1, v5, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v4

    .line 151
    .local v4, subcnt:I
    iget v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    const/16 v6, 0xa

    invoke-static {p1, v5, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->next([BIC)I

    move-result v5

    iput v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 153
    iget v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    if-ltz v5, :cond_0

    .line 157
    iget v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    invoke-static {p1, v5}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 158
    iget v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v5, v5, 0x14

    iput v5, p2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 161
    :cond_0
    if-lez v4, :cond_5

    .line 162
    const/4 v0, 0x1

    .line 163
    .local v0, alreadySorted:Z
    new-array v5, v4, [Lorg/eclipse/jgit/dircache/DirCacheTree;

    iput-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 164
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v4, :cond_3

    .line 165
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-direct {v6, p1, p2, p0}, Lorg/eclipse/jgit/dircache/DirCacheTree;-><init>([BLorg/eclipse/jgit/util/MutableInteger;Lorg/eclipse/jgit/dircache/DirCacheTree;)V

    aput-object v6, v5, v1

    .line 172
    if-eqz v0, :cond_1

    if-lez v1, :cond_1

    sget-object v5, Lorg/eclipse/jgit/dircache/DirCacheTree;->TREE_CMP:Ljava/util/Comparator;

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    add-int/lit8 v7, v1, -0x1

    aget-object v6, v6, v7

    iget-object v7, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    aget-object v7, v7, v1

    invoke-interface {v5, v6, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    if-lez v5, :cond_1

    .line 174
    const/4 v0, 0x0

    .line 164
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 147
    .end local v0           #alreadySorted:Z
    .end local v1           #i:I
    .end local v4           #subcnt:I
    :cond_2
    sget-object v5, Lorg/eclipse/jgit/dircache/DirCacheTree;->NO_NAME:[B

    iput-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    goto :goto_0

    .line 176
    .restart local v0       #alreadySorted:Z
    .restart local v1       #i:I
    .restart local v4       #subcnt:I
    :cond_3
    if-nez v0, :cond_4

    .line 177
    iget-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    sget-object v6, Lorg/eclipse/jgit/dircache/DirCacheTree;->TREE_CMP:Ljava/util/Comparator;

    invoke-static {v5, v8, v4, v6}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 183
    .end local v0           #alreadySorted:Z
    .end local v1           #i:I
    :cond_4
    :goto_2
    iput v4, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    .line 184
    return-void

    .line 181
    :cond_5
    sget-object v5, Lorg/eclipse/jgit/dircache/DirCacheTree;->NO_CHILDREN:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    iput-object v5, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    goto :goto_2
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/dircache/DirCacheTree;)[B
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    return-object v0
.end method

.method private appendName(Ljava/lang/StringBuilder;)V
    .locals 2
    .parameter "r"

    .prologue
    const/16 v1, 0x2f

    .line 382
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->parent:Lorg/eclipse/jgit/dircache/DirCacheTree;

    if-eqz v0, :cond_1

    .line 383
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->parent:Lorg/eclipse/jgit/dircache/DirCacheTree;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/dircache/DirCacheTree;->appendName(Ljava/lang/StringBuilder;)V

    .line 384
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getNameString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 390
    :cond_0
    :goto_0
    return-void

    .line 386
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->nameLength()I

    move-result v0

    if-lez v0, :cond_0

    .line 387
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getNameString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private computeSize([Lorg/eclipse/jgit/dircache/DirCacheEntry;IILorg/eclipse/jgit/lib/ObjectInserter;)I
    .locals 10
    .parameter "cache"
    .parameter "cIdx"
    .parameter "pathOffset"
    .parameter "ow"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/UnmergedPathException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    iget v8, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    add-int v2, p2, v8

    .line 350
    .local v2, endIdx:I
    const/4 v0, 0x0

    .line 351
    .local v0, childIdx:I
    move v3, p2

    .line 352
    .local v3, entryIdx:I
    const/4 v5, 0x0

    .line 354
    .local v5, size:I
    :goto_0
    if-ge v3, v2, :cond_2

    .line 355
    aget-object v1, p1, v3

    .line 356
    .local v1, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v8

    if-eqz v8, :cond_0

    .line 357
    new-instance v8, Lorg/eclipse/jgit/errors/UnmergedPathException;

    invoke-direct {v8, v1}, Lorg/eclipse/jgit/errors/UnmergedPathException;-><init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    throw v8

    .line 359
    :cond_0
    iget-object v4, v1, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 360
    .local v4, ep:[B
    iget v8, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    if-ge v0, v8, :cond_1

    .line 361
    iget-object v8, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    aget-object v6, v8, v0

    .line 362
    .local v6, st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    array-length v8, v4

    invoke-virtual {v6, v4, p3, v8}, Lorg/eclipse/jgit/dircache/DirCacheTree;->contains([BII)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 363
    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheTree;->nameLength()I

    move-result v8

    add-int/2addr v8, p3

    add-int/lit8 v7, v8, 0x1

    .line 364
    .local v7, stOffset:I
    invoke-virtual {v6, p1, v3, v7, p4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->writeTree([Lorg/eclipse/jgit/dircache/DirCacheEntry;IILorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    .line 366
    sget-object v8, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheTree;->nameLength()I

    move-result v9

    invoke-static {v8, v9}, Lorg/eclipse/jgit/lib/TreeFormatter;->entrySize(Lorg/eclipse/jgit/lib/FileMode;I)I

    move-result v8

    add-int/2addr v5, v8

    .line 368
    iget v8, v6, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    add-int/2addr v3, v8

    .line 369
    add-int/lit8 v0, v0, 0x1

    .line 370
    goto :goto_0

    .line 374
    .end local v6           #st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    .end local v7           #stOffset:I
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v8

    array-length v9, v4

    sub-int/2addr v9, p3

    invoke-static {v8, v9}, Lorg/eclipse/jgit/lib/TreeFormatter;->entrySize(Lorg/eclipse/jgit/lib/FileMode;I)I

    move-result v8

    add-int/2addr v5, v8

    .line 375
    add-int/lit8 v3, v3, 0x1

    .line 376
    goto :goto_0

    .line 378
    .end local v1           #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v4           #ep:[B
    :cond_2
    return v5
.end method

.method private insertChild(ILorg/eclipse/jgit/dircache/DirCacheTree;)V
    .locals 6
    .parameter "stIdx"
    .parameter "st"

    .prologue
    const/4 v5, 0x0

    .line 495
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 496
    .local v1, c:[Lorg/eclipse/jgit/dircache/DirCacheTree;
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    add-int/lit8 v3, v3, 0x1

    array-length v4, v1

    if-gt v3, v4, :cond_1

    .line 497
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    if-ge p1, v3, :cond_0

    .line 498
    add-int/lit8 v3, p1, 0x1

    iget v4, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 499
    :cond_0
    aput-object p2, v1, p1

    .line 500
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    .line 513
    :goto_0
    return-void

    .line 504
    :cond_1
    array-length v2, v1

    .line 505
    .local v2, n:I
    add-int/lit8 v3, v2, 0x1

    new-array v0, v3, [Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 506
    .local v0, a:[Lorg/eclipse/jgit/dircache/DirCacheTree;
    if-lez p1, :cond_2

    .line 507
    invoke-static {v1, v5, v0, v5, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 508
    :cond_2
    aput-object p2, v0, p1

    .line 509
    if-ge p1, v2, :cond_3

    .line 510
    add-int/lit8 v3, p1, 0x1

    sub-int v4, v2, p1

    invoke-static {v1, p1, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 511
    :cond_3
    iput-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    .line 512
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    goto :goto_0
.end method

.method private static namecmp([BILorg/eclipse/jgit/dircache/DirCacheTree;)I
    .locals 8
    .parameter "a"
    .parameter "aPos"
    .parameter "ct"

    .prologue
    const/4 v5, -0x1

    .line 532
    if-nez p2, :cond_1

    .line 545
    :cond_0
    :goto_0
    return v5

    .line 534
    :cond_1
    iget-object v1, p2, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    .line 535
    .local v1, b:[B
    array-length v0, p0

    .line 536
    .local v0, aLen:I
    array-length v2, v1

    .line 537
    .local v2, bLen:I
    const/4 v3, 0x0

    .line 538
    .local v3, bPos:I
    :goto_1
    if-ge p1, v0, :cond_3

    if-ge v3, v2, :cond_3

    .line 539
    aget-byte v6, p0, p1

    and-int/lit16 v6, v6, 0xff

    aget-byte v7, v1, v3

    and-int/lit16 v7, v7, 0xff

    sub-int v4, v6, v7

    .line 540
    .local v4, cmp:I
    if-eqz v4, :cond_2

    move v5, v4

    .line 541
    goto :goto_0

    .line 538
    :cond_2
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 543
    .end local v4           #cmp:I
    :cond_3
    if-ne v3, v2, :cond_4

    .line 544
    aget-byte v6, p0, p1

    const/16 v7, 0x2f

    if-ne v6, v7, :cond_0

    const/4 v5, 0x0

    goto :goto_0

    .line 545
    :cond_4
    sub-int v5, v0, v2

    goto :goto_0
.end method

.method static peq([B[BI)Z
    .locals 3
    .parameter "a"
    .parameter "b"
    .parameter "aLen"

    .prologue
    const/4 v0, 0x0

    .line 523
    array-length v1, p1

    if-ge v1, p2, :cond_1

    .line 528
    :cond_0
    :goto_0
    return v0

    .line 525
    :cond_1
    add-int/lit8 p2, p2, -0x1

    :goto_1
    if-ltz p2, :cond_2

    .line 526
    aget-byte v1, p0, p2

    aget-byte v2, p1, p2

    if-ne v1, v2, :cond_0

    .line 525
    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    .line 528
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private removeChild(I)V
    .locals 5
    .parameter "stIdx"

    .prologue
    .line 516
    iget v1, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    add-int/lit8 v0, v1, -0x1

    iput v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    .line 517
    .local v0, n:I
    if-ge p1, v0, :cond_0

    .line 518
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    add-int/lit8 v2, p1, 0x1

    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    sub-int v4, v0, p1

    invoke-static {v1, v2, v3, p1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 519
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 520
    return-void
.end method

.method private static slash([BI)I
    .locals 3
    .parameter "a"
    .parameter "aPos"

    .prologue
    .line 549
    array-length v0, p0

    .line 550
    .local v0, aLen:I
    :goto_0
    if-ge p1, v0, :cond_1

    .line 551
    aget-byte v1, p0, p1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 553
    .end local p1
    :goto_1
    return p1

    .line 550
    .restart local p1
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 553
    :cond_1
    const/4 p1, -0x1

    goto :goto_1
.end method


# virtual methods
.method final contains([BII)Z
    .locals 6
    .parameter "a"
    .parameter "aOff"
    .parameter "aLen"

    .prologue
    const/4 v3, 0x0

    .line 397
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    .line 398
    .local v0, e:[B
    array-length v1, v0

    .line 399
    .local v1, eLen:I
    const/4 v2, 0x0

    .local v2, eOff:I
    :goto_0
    if-ge v2, v1, :cond_2

    if-ge p2, p3, :cond_2

    .line 400
    aget-byte v4, v0, v2

    aget-byte v5, p1, p2

    if-eq v4, v5, :cond_1

    .line 404
    :cond_0
    :goto_1
    return v3

    .line 399
    :cond_1
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 402
    :cond_2
    if-eq p2, p3, :cond_0

    .line 404
    aget-byte v4, p1, p2

    const/16 v5, 0x2f

    if-ne v4, v5, :cond_0

    const/4 v3, 0x1

    goto :goto_1
.end method

.method public getChild(I)Lorg/eclipse/jgit/dircache/DirCacheTree;
    .locals 1
    .parameter "i"

    .prologue
    .line 249
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getChildCount()I
    .locals 1

    .prologue
    .line 238
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    return v0
.end method

.method public getEntrySpan()I
    .locals 1

    .prologue
    .line 229
    iget v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    return v0
.end method

.method public getNameString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 267
    iget-object v1, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 268
    .local v0, bb:Ljava/nio/ByteBuffer;
    sget-object v1, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getPathString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 284
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 285
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->appendName(Ljava/lang/StringBuilder;)V

    .line 286
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isValid()Z
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final nameLength()I
    .locals 1

    .prologue
    .line 393
    iget-object v0, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    array-length v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 558
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->getNameString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method validate([Lorg/eclipse/jgit/dircache/DirCacheEntry;III)V
    .locals 8
    .parameter "cache"
    .parameter "cCnt"
    .parameter "cIdx"
    .parameter "pathOff"

    .prologue
    .line 428
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    if-ltz v6, :cond_1

    .line 492
    :cond_0
    return-void

    .line 435
    :cond_1
    const/4 v6, 0x0

    iput v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    .line 436
    if-eqz p2, :cond_0

    .line 442
    aget-object v6, p1, p3

    iget-object v2, v6, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 443
    .local v2, firstPath:[B
    const/4 v5, 0x0

    .line 444
    .local v5, stIdx:I
    :goto_0
    if-ge p3, p2, :cond_2

    .line 445
    aget-object v6, p1, p3

    iget-object v1, v6, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 446
    .local v1, currPath:[B
    if-lez p4, :cond_3

    invoke-static {v2, v1, p4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->peq([B[BI)Z

    move-result v6

    if-nez v6, :cond_3

    .line 490
    .end local v1           #currPath:[B
    :cond_2
    :goto_1
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    if-ge v5, v6, :cond_0

    .line 491
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    add-int/lit8 v6, v6, -0x1

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/dircache/DirCacheTree;->removeChild(I)V

    goto :goto_1

    .line 453
    .restart local v1       #currPath:[B
    :cond_3
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    if-ge v5, v6, :cond_4

    iget-object v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    aget-object v4, v6, v5

    .line 454
    .local v4, st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    :goto_2
    invoke-static {v1, p4, v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->namecmp([BILorg/eclipse/jgit/dircache/DirCacheTree;)I

    move-result v0

    .line 455
    .local v0, cc:I
    if-lez v0, :cond_5

    .line 458
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/dircache/DirCacheTree;->removeChild(I)V

    goto :goto_0

    .line 453
    .end local v0           #cc:I
    .end local v4           #st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    :cond_4
    const/4 v4, 0x0

    goto :goto_2

    .line 462
    .restart local v0       #cc:I
    .restart local v4       #st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    :cond_5
    if-gez v0, :cond_7

    .line 463
    invoke-static {v1, p4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->slash([BI)I

    move-result v3

    .line 464
    .local v3, p:I
    if-gez v3, :cond_6

    .line 468
    add-int/lit8 p3, p3, 0x1

    .line 469
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    goto :goto_0

    .line 475
    :cond_6
    new-instance v4, Lorg/eclipse/jgit/dircache/DirCacheTree;

    .end local v4           #st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    sub-int v6, v3, p4

    invoke-direct {v4, p0, v1, p4, v6}, Lorg/eclipse/jgit/dircache/DirCacheTree;-><init>(Lorg/eclipse/jgit/dircache/DirCacheTree;[BII)V

    .line 476
    .restart local v4       #st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    invoke-direct {p0, v5, v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->insertChild(ILorg/eclipse/jgit/dircache/DirCacheTree;)V

    .line 481
    .end local v3           #p:I
    :cond_7
    invoke-virtual {v4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->nameLength()I

    move-result v6

    add-int/2addr v6, p4

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v4, p1, p2, p3, v6}, Lorg/eclipse/jgit/dircache/DirCacheTree;->validate([Lorg/eclipse/jgit/dircache/DirCacheEntry;III)V

    .line 482
    iget v6, v4, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    add-int/2addr p3, v6

    .line 483
    iget v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    iget v7, v4, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    add-int/2addr v6, v7

    iput v6, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    .line 484
    add-int/lit8 v5, v5, 0x1

    .line 485
    goto :goto_0
.end method

.method write([BLjava/io/OutputStream;)V
    .locals 4
    .parameter "tmp"
    .parameter "os"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 187
    array-length v1, p1

    .line 188
    .local v1, ptr:I
    add-int/lit8 v1, v1, -0x1

    const/16 v2, 0xa

    aput-byte v2, p1, v1

    .line 189
    iget v2, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    invoke-static {p1, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->formatBase10([BII)I

    move-result v1

    .line 190
    add-int/lit8 v1, v1, -0x1

    const/16 v2, 0x20

    aput-byte v2, p1, v1

    .line 191
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->isValid()Z

    move-result v2

    if-eqz v2, :cond_1

    iget v2, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    :goto_0
    invoke-static {p1, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->formatBase10([BII)I

    move-result v1

    .line 192
    add-int/lit8 v1, v1, -0x1

    aput-byte v3, p1, v1

    .line 194
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    invoke-virtual {p2, v2}, Ljava/io/OutputStream;->write([B)V

    .line 195
    array-length v2, p1

    sub-int/2addr v2, v1

    invoke-virtual {p2, p1, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 196
    invoke-virtual {p0}, Lorg/eclipse/jgit/dircache/DirCacheTree;->isValid()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v2, p1, v3}, Lorg/eclipse/jgit/lib/ObjectId;->copyRawTo([BI)V

    .line 198
    const/16 v2, 0x14

    invoke-virtual {p2, p1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 200
    :cond_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v2, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    if-ge v0, v2, :cond_2

    .line 201
    iget-object v2, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheTree;->write([BLjava/io/OutputStream;)V

    .line 200
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 191
    .end local v0           #i:I
    :cond_1
    const/4 v2, -0x1

    goto :goto_0

    .line 202
    .restart local v0       #i:I
    :cond_2
    return-void
.end method

.method writeTree([Lorg/eclipse/jgit/dircache/DirCacheEntry;IILorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 13
    .parameter "cache"
    .parameter "cIdx"
    .parameter "pathOffset"
    .parameter "ow"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/UnmergedPathException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 316
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v3, :cond_2

    .line 317
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    add-int v10, p2, v3

    .line 318
    .local v10, endIdx:I
    new-instance v1, Lorg/eclipse/jgit/lib/TreeFormatter;

    invoke-direct/range {p0 .. p4}, Lorg/eclipse/jgit/dircache/DirCacheTree;->computeSize([Lorg/eclipse/jgit/dircache/DirCacheEntry;IILorg/eclipse/jgit/lib/ObjectInserter;)I

    move-result v3

    invoke-direct {v1, v3}, Lorg/eclipse/jgit/lib/TreeFormatter;-><init>(I)V

    .line 320
    .local v1, fmt:Lorg/eclipse/jgit/lib/TreeFormatter;
    const/4 v8, 0x0

    .line 321
    .local v8, childIdx:I
    move v11, p2

    .line 323
    .local v11, entryIdx:I
    :goto_0
    if-ge v11, v10, :cond_1

    .line 324
    aget-object v9, p1, v11

    .line 325
    .local v9, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v2, v9, Lorg/eclipse/jgit/dircache/DirCacheEntry;->path:[B

    .line 326
    .local v2, ep:[B
    iget v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->childCnt:I

    if-ge v8, v3, :cond_0

    .line 327
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->children:[Lorg/eclipse/jgit/dircache/DirCacheTree;

    aget-object v12, v3, v8

    .line 328
    .local v12, st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    array-length v3, v2

    move/from16 v0, p3

    invoke-virtual {v12, v2, v0, v3}, Lorg/eclipse/jgit/dircache/DirCacheTree;->contains([BII)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 329
    iget-object v3, v12, Lorg/eclipse/jgit/dircache/DirCacheTree;->encodedName:[B

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v5, v12, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v1, v3, v4, v5}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BLorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 330
    iget v3, v12, Lorg/eclipse/jgit/dircache/DirCacheTree;->entrySpan:I

    add-int/2addr v11, v3

    .line 331
    add-int/lit8 v8, v8, 0x1

    .line 332
    goto :goto_0

    .line 336
    .end local v12           #st:Lorg/eclipse/jgit/dircache/DirCacheTree;
    :cond_0
    array-length v3, v2

    sub-int v4, v3, p3

    invoke-virtual {v9}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v5

    invoke-virtual {v9}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idBuffer()[B

    move-result-object v6

    invoke-virtual {v9}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->idOffset()I

    move-result v7

    move/from16 v3, p3

    invoke-virtual/range {v1 .. v7}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BIILorg/eclipse/jgit/lib/FileMode;[BI)V

    .line 338
    add-int/lit8 v11, v11, 0x1

    .line 339
    goto :goto_0

    .line 341
    .end local v2           #ep:[B
    .end local v9           #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_1
    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 343
    .end local v1           #fmt:Lorg/eclipse/jgit/lib/TreeFormatter;
    .end local v8           #childIdx:I
    .end local v10           #endIdx:I
    .end local v11           #entryIdx:I
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/dircache/DirCacheTree;->id:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v3
.end method
