.class public Lorg/eclipse/jgit/lib/Tree;
.super Lorg/eclipse/jgit/lib/TreeEntry;
.source "Tree.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final EMPTY_TREE:[Lorg/eclipse/jgit/lib/TreeEntry;


# instance fields
.field private contents:[Lorg/eclipse/jgit/lib/TreeEntry;

.field private final db:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/eclipse/jgit/lib/TreeEntry;

    sput-object v0, Lorg/eclipse/jgit/lib/Tree;->EMPTY_TREE:[Lorg/eclipse/jgit/lib/TreeEntry;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    const/4 v0, 0x0

    .line 178
    invoke-direct {p0, v0, v0, v0}, Lorg/eclipse/jgit/lib/TreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .line 179
    iput-object p1, p0, Lorg/eclipse/jgit/lib/Tree;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 180
    sget-object v0, Lorg/eclipse/jgit/lib/Tree;->EMPTY_TREE:[Lorg/eclipse/jgit/lib/TreeEntry;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 181
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;[B)V
    .locals 1
    .parameter "repo"
    .parameter "myId"
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 193
    invoke-direct {p0, v0, p2, v0}, Lorg/eclipse/jgit/lib/TreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .line 194
    iput-object p1, p0, Lorg/eclipse/jgit/lib/Tree;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 195
    invoke-direct {p0, p3}, Lorg/eclipse/jgit/lib/Tree;->readTree([B)V

    .line 196
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V
    .locals 1
    .parameter "parent"
    .parameter "id"
    .parameter "nameUTF8"

    .prologue
    .line 219
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/TreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .line 220
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Tree;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 221
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Tree;[B)V
    .locals 1
    .parameter "parent"
    .parameter "nameUTF8"

    .prologue
    .line 205
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/eclipse/jgit/lib/TreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .line 206
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Tree;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 207
    sget-object v0, Lorg/eclipse/jgit/lib/Tree;->EMPTY_TREE:[Lorg/eclipse/jgit/lib/TreeEntry;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 208
    return-void
.end method

.method private static final binarySearch([Lorg/eclipse/jgit/lib/TreeEntry;[BIII)I
    .locals 10
    .parameter "entries"
    .parameter "nameUTF8"
    .parameter "nameUTF8last"
    .parameter "nameStart"
    .parameter "nameEnd"

    .prologue
    .line 150
    array-length v0, p0

    if-nez v0, :cond_1

    .line 151
    const/4 v9, -0x1

    .line 165
    :cond_0
    :goto_0
    return v9

    .line 152
    :cond_1
    array-length v7, p0

    .line 153
    .local v7, high:I
    const/4 v8, 0x0

    .line 155
    .local v8, low:I
    :cond_2
    add-int v0, v8, v7

    ushr-int/lit8 v9, v0, 0x1

    .line 156
    .local v9, mid:I
    aget-object v0, p0, v9

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/TreeEntry;->getNameUTF8()[B

    move-result-object v0

    aget-object v1, p0, v9

    invoke-static {v1}, Lorg/eclipse/jgit/lib/TreeEntry;->lastChar(Lorg/eclipse/jgit/lib/TreeEntry;)I

    move-result v4

    move-object v1, p1

    move v2, p3

    move v3, p4

    move v5, p2

    invoke-static/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Tree;->compareNames([B[BIIII)I

    move-result v6

    .line 158
    .local v6, cmp:I
    if-gez v6, :cond_3

    .line 159
    add-int/lit8 v8, v9, 0x1

    .line 164
    :goto_1
    if-lt v8, v7, :cond_2

    .line 165
    add-int/lit8 v0, v8, 0x1

    neg-int v9, v0

    goto :goto_0

    .line 160
    :cond_3
    if-eqz v6, :cond_0

    .line 163
    move v7, v9

    goto :goto_1
.end method

.method public static final compareNames([B[BII)I
    .locals 6
    .parameter "a"
    .parameter "b"
    .parameter "lasta"
    .parameter "lastb"

    .prologue
    .line 87
    const/4 v2, 0x0

    array-length v3, p1

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Tree;->compareNames([B[BIIII)I

    move-result v0

    return v0
.end method

.method private static final compareNames([B[BIIII)I
    .locals 9
    .parameter "a"
    .parameter "nameUTF8"
    .parameter "nameStart"
    .parameter "nameEnd"
    .parameter "lasta"
    .parameter "lastb"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v5, -0x1

    .line 93
    const/4 v2, 0x0

    .local v2, j:I
    move v3, p2

    .local v3, k:I
    :goto_0
    array-length v8, p0

    if-ge v2, v8, :cond_3

    if-ge v3, p3, :cond_3

    .line 94
    aget-byte v8, p0, v2

    and-int/lit16 v0, v8, 0xff

    .line 95
    .local v0, aj:I
    aget-byte v8, p1, v3

    and-int/lit16 v1, v8, 0xff

    .line 96
    .local v1, bk:I
    if-ge v0, v1, :cond_1

    .line 136
    .end local v0           #aj:I
    .end local v1           #bk:I
    :cond_0
    :goto_1
    return v5

    .line 98
    .restart local v0       #aj:I
    .restart local v1       #bk:I
    :cond_1
    if-le v0, v1, :cond_2

    move v5, v6

    .line 99
    goto :goto_1

    .line 93
    :cond_2
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 101
    .end local v0           #aj:I
    .end local v1           #bk:I
    :cond_3
    array-length v8, p0

    if-ge v2, v8, :cond_5

    .line 102
    aget-byte v8, p0, v2

    and-int/lit16 v0, v8, 0xff

    .line 103
    .restart local v0       #aj:I
    if-lt v0, p5, :cond_0

    .line 105
    if-le v0, p5, :cond_4

    move v5, v6

    .line 106
    goto :goto_1

    .line 108
    :cond_4
    array-length v6, p0

    add-int/lit8 v6, v6, -0x1

    if-ne v2, v6, :cond_0

    move v5, v7

    .line 109
    goto :goto_1

    .line 113
    .end local v0           #aj:I
    :cond_5
    if-ge v3, p3, :cond_8

    .line 114
    aget-byte v8, p1, v3

    and-int/lit16 v1, v8, 0xff

    .line 115
    .restart local v1       #bk:I
    if-lt p4, v1, :cond_0

    .line 117
    if-le p4, v1, :cond_6

    move v5, v6

    .line 118
    goto :goto_1

    .line 120
    :cond_6
    add-int/lit8 v5, p3, -0x1

    if-ne v3, v5, :cond_7

    move v5, v7

    .line 121
    goto :goto_1

    :cond_7
    move v5, v6

    .line 123
    goto :goto_1

    .line 125
    .end local v1           #bk:I
    :cond_8
    if-lt p4, p5, :cond_0

    .line 127
    if-le p4, p5, :cond_9

    move v5, v6

    .line 128
    goto :goto_1

    .line 130
    :cond_9
    sub-int v4, p3, p2

    .line 131
    .local v4, namelength:I
    array-length v8, p0

    if-ne v8, v4, :cond_a

    move v5, v7

    .line 132
    goto :goto_1

    .line 133
    :cond_a
    array-length v7, p0

    if-lt v7, v4, :cond_0

    move v5, v6

    .line 136
    goto :goto_1
.end method

.method private ensureLoaded()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 505
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->isLoaded()Z

    move-result v1

    if-nez v1, :cond_0

    .line 506
    iget-object v1, p0, Lorg/eclipse/jgit/lib/Tree;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/lib/Repository;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 507
    .local v0, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/Tree;->readTree([B)V

    .line 509
    .end local v0           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    :cond_0
    return-void
.end method

.method private exists(Ljava/lang/String;B)Z
    .locals 1
    .parameter "s"
    .parameter "slast"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 435
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/lib/Tree;->findMember(Ljava/lang/String;B)Lorg/eclipse/jgit/lib/TreeEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private findMember(Ljava/lang/String;B)Lorg/eclipse/jgit/lib/TreeEntry;
    .locals 2
    .parameter "s"
    .parameter "slast"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 459
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Repository;->gitInternalSlash([B)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lorg/eclipse/jgit/lib/Tree;->findMember([BBI)Lorg/eclipse/jgit/lib/TreeEntry;

    move-result-object v0

    return-object v0
.end method

.method private findMember([BBI)Lorg/eclipse/jgit/lib/TreeEntry;
    .locals 6
    .parameter "s"
    .parameter "slast"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0x2f

    .line 467
    move v2, p3

    .local v2, slash:I
    :goto_0
    array-length v5, p1

    if-ge v2, v5, :cond_0

    aget-byte v5, p1, v2

    if-eq v5, v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 471
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Tree;->ensureLoaded()V

    .line 472
    array-length v5, p1

    if-ge v2, v5, :cond_2

    .line 473
    .local v3, xlast:B
    :goto_1
    iget-object v5, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    invoke-static {v5, p1, v3, p3, v2}, Lorg/eclipse/jgit/lib/Tree;->binarySearch([Lorg/eclipse/jgit/lib/TreeEntry;[BIII)I

    move-result v0

    .line 474
    .local v0, p:I
    if-ltz v0, :cond_1

    .line 475
    iget-object v5, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    aget-object v1, v5, v0

    .line 476
    .local v1, r:Lorg/eclipse/jgit/lib/TreeEntry;
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    if-ge v2, v5, :cond_3

    .line 477
    instance-of v5, v1, Lorg/eclipse/jgit/lib/Tree;

    if-eqz v5, :cond_1

    check-cast v1, Lorg/eclipse/jgit/lib/Tree;

    .end local v1           #r:Lorg/eclipse/jgit/lib/TreeEntry;
    add-int/lit8 v4, v2, 0x1

    invoke-direct {v1, p1, p2, v4}, Lorg/eclipse/jgit/lib/Tree;->findMember([BBI)Lorg/eclipse/jgit/lib/TreeEntry;

    move-result-object v4

    .line 481
    :cond_1
    :goto_2
    return-object v4

    .end local v0           #p:I
    .end local v3           #xlast:B
    :cond_2
    move v3, p2

    .line 472
    goto :goto_1

    .restart local v0       #p:I
    .restart local v1       #r:Lorg/eclipse/jgit/lib/TreeEntry;
    .restart local v3       #xlast:B
    :cond_3
    move-object v4, v1

    .line 479
    goto :goto_2
.end method

.method private insertEntry(ILorg/eclipse/jgit/lib/TreeEntry;)V
    .locals 5
    .parameter "p"
    .parameter "e"

    .prologue
    .line 370
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 371
    .local v0, c:[Lorg/eclipse/jgit/lib/TreeEntry;
    array-length v3, v0

    add-int/lit8 v3, v3, 0x1

    new-array v2, v3, [Lorg/eclipse/jgit/lib/TreeEntry;

    .line 372
    .local v2, n:[Lorg/eclipse/jgit/lib/TreeEntry;
    add-int/lit8 v3, p1, 0x1

    neg-int p1, v3

    .line 373
    array-length v3, v0

    add-int/lit8 v1, v3, -0x1

    .local v1, k:I
    :goto_0
    if-lt v1, p1, :cond_0

    .line 374
    add-int/lit8 v3, v1, 0x1

    aget-object v4, v0, v1

    aput-object v4, v2, v3

    .line 373
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 375
    :cond_0
    aput-object p2, v2, p1

    .line 376
    add-int/lit8 v1, p1, -0x1

    :goto_1
    if-ltz v1, :cond_1

    .line 377
    aget-object v3, v0, v1

    aput-object v3, v2, v1

    .line 376
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 378
    :cond_1
    iput-object v2, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 379
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->setModified()V

    .line 380
    return-void
.end method

.method private readTree([B)V
    .locals 19
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 512
    move-object/from16 v0, p1

    array-length v11, v0

    .line 513
    .local v11, rawSize:I
    const/4 v9, 0x0

    .line 515
    .local v9, rawPtr:I
    const/4 v7, 0x0

    .line 517
    .local v7, nextIndex:I
    :goto_0
    if-ge v9, v11, :cond_1

    .line 518
    :goto_1
    if-ge v9, v11, :cond_0

    aget-byte v13, p1, v9

    if-eqz v13, :cond_0

    .line 519
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 520
    :cond_0
    add-int/lit8 v9, v9, 0x1

    .line 521
    add-int/lit8 v9, v9, 0x14

    .line 522
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 525
    :cond_1
    new-array v12, v7, [Lorg/eclipse/jgit/lib/TreeEntry;

    .line 526
    .local v12, temp:[Lorg/eclipse/jgit/lib/TreeEntry;
    const/4 v9, 0x0

    .line 527
    const/4 v7, 0x0

    move v8, v7

    .end local v7           #nextIndex:I
    .local v8, nextIndex:I
    move v10, v9

    .line 528
    .end local v9           #rawPtr:I
    .local v10, rawPtr:I
    :goto_2
    if-ge v10, v11, :cond_d

    .line 529
    add-int/lit8 v9, v10, 0x1

    .end local v10           #rawPtr:I
    .restart local v9       #rawPtr:I
    aget-byte v1, p1, v10

    .line 530
    .local v1, c:I
    const/16 v13, 0x30

    if-lt v1, v13, :cond_2

    const/16 v13, 0x37

    if-le v1, v13, :cond_3

    .line 531
    :cond_2
    new-instance v13, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/lib/Tree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidEntryMode:Ljava/lang/String;

    invoke-direct {v13, v14, v15}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v13

    .line 532
    :cond_3
    add-int/lit8 v4, v1, -0x30

    .line 534
    .local v4, mode:I
    :goto_3
    add-int/lit8 v10, v9, 0x1

    .end local v9           #rawPtr:I
    .restart local v10       #rawPtr:I
    aget-byte v1, p1, v9

    .line 535
    const/16 v13, 0x20

    if-ne v13, v1, :cond_4

    .line 543
    const/4 v6, 0x0

    .line 544
    .local v6, nameLen:I
    :goto_4
    add-int v13, v10, v6

    aget-byte v13, p1, v13

    if-eqz v13, :cond_7

    .line 545
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 537
    .end local v6           #nameLen:I
    :cond_4
    const/16 v13, 0x30

    if-lt v1, v13, :cond_5

    const/16 v13, 0x37

    if-le v1, v13, :cond_6

    .line 538
    :cond_5
    new-instance v13, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/lib/Tree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidMode:Ljava/lang/String;

    invoke-direct {v13, v14, v15}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v13

    .line 539
    :cond_6
    shl-int/lit8 v4, v4, 0x3

    .line 540
    add-int/lit8 v13, v1, -0x30

    add-int/2addr v4, v13

    move v9, v10

    .end local v10           #rawPtr:I
    .restart local v9       #rawPtr:I
    goto :goto_3

    .line 546
    .end local v9           #rawPtr:I
    .restart local v6       #nameLen:I
    .restart local v10       #rawPtr:I
    :cond_7
    new-array v5, v6, [B

    .line 547
    .local v5, name:[B
    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v10, v5, v13, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 548
    add-int/lit8 v13, v6, 0x1

    add-int v9, v10, v13

    .line 550
    .end local v10           #rawPtr:I
    .restart local v9       #rawPtr:I
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 551
    .local v3, id:Lorg/eclipse/jgit/lib/ObjectId;
    add-int/lit8 v9, v9, 0x14

    .line 554
    sget-object v13, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v13, v4}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 555
    new-instance v2, Lorg/eclipse/jgit/lib/FileTreeEntry;

    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v5, v13}, Lorg/eclipse/jgit/lib/FileTreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[BZ)V

    .line 567
    .local v2, ent:Lorg/eclipse/jgit/lib/TreeEntry;
    :goto_5
    add-int/lit8 v7, v8, 0x1

    .end local v8           #nextIndex:I
    .restart local v7       #nextIndex:I
    aput-object v2, v12, v8

    move v8, v7

    .end local v7           #nextIndex:I
    .restart local v8       #nextIndex:I
    move v10, v9

    .line 568
    .end local v9           #rawPtr:I
    .restart local v10       #rawPtr:I
    goto :goto_2

    .line 556
    .end local v2           #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    .end local v10           #rawPtr:I
    .restart local v9       #rawPtr:I
    :cond_8
    sget-object v13, Lorg/eclipse/jgit/lib/FileMode;->EXECUTABLE_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v13, v4}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 557
    new-instance v2, Lorg/eclipse/jgit/lib/FileTreeEntry;

    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v5, v13}, Lorg/eclipse/jgit/lib/FileTreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[BZ)V

    .restart local v2       #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    goto :goto_5

    .line 558
    .end local v2           #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    :cond_9
    sget-object v13, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v13, v4}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 559
    new-instance v2, Lorg/eclipse/jgit/lib/Tree;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v5}, Lorg/eclipse/jgit/lib/Tree;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .restart local v2       #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    goto :goto_5

    .line 560
    .end local v2           #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    :cond_a
    sget-object v13, Lorg/eclipse/jgit/lib/FileMode;->SYMLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v13, v4}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v13

    if-eqz v13, :cond_b

    .line 561
    new-instance v2, Lorg/eclipse/jgit/lib/SymlinkTreeEntry;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v5}, Lorg/eclipse/jgit/lib/SymlinkTreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .restart local v2       #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    goto :goto_5

    .line 562
    .end local v2           #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    :cond_b
    sget-object v13, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v13, v4}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 563
    new-instance v2, Lorg/eclipse/jgit/lib/GitlinkTreeEntry;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3, v5}, Lorg/eclipse/jgit/lib/GitlinkTreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[B)V

    .restart local v2       #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    goto :goto_5

    .line 565
    .end local v2           #ent:Lorg/eclipse/jgit/lib/TreeEntry;
    :cond_c
    new-instance v13, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/lib/Tree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidMode2:Ljava/lang/String;

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->toOctalString(I)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v13, v14, v15}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v13

    .line 570
    .end local v1           #c:I
    .end local v3           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #mode:I
    .end local v5           #name:[B
    .end local v6           #nameLen:I
    .end local v9           #rawPtr:I
    .restart local v10       #rawPtr:I
    :cond_d
    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 571
    return-void
.end method

.method private static final substring([BII)[B
    .locals 3
    .parameter "s"
    .parameter "nameStart"
    .parameter "nameEnd"

    .prologue
    .line 141
    if-nez p1, :cond_0

    array-length v1, p0

    if-ne p1, v1, :cond_0

    .line 145
    .end local p0
    :goto_0
    return-object p0

    .line 143
    .restart local p0
    :cond_0
    sub-int v1, p2, p1

    new-array v0, v1, [B

    .line 144
    .local v0, n:[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {p0, p1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    .line 145
    goto :goto_0
.end method


# virtual methods
.method public addEntry(Lorg/eclipse/jgit/lib/TreeEntry;)V
    .locals 6
    .parameter "e"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Tree;->ensureLoaded()V

    .line 360
    iget-object v1, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->getNameUTF8()[B

    move-result-object v2

    invoke-static {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->lastChar(Lorg/eclipse/jgit/lib/TreeEntry;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->getNameUTF8()[B

    move-result-object v5

    array-length v5, v5

    invoke-static {v1, v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/Tree;->binarySearch([Lorg/eclipse/jgit/lib/TreeEntry;[BIII)I

    move-result v0

    .line 361
    .local v0, p:I
    if-gez v0, :cond_0

    .line 362
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/lib/TreeEntry;->attachParent(Lorg/eclipse/jgit/lib/Tree;)V

    .line 363
    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/lib/Tree;->insertEntry(ILorg/eclipse/jgit/lib/TreeEntry;)V

    .line 367
    return-void

    .line 365
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/EntryExistsException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/EntryExistsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public addFile(Ljava/lang/String;)Lorg/eclipse/jgit/lib/FileTreeEntry;
    .locals 2
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 263
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Repository;->gitInternalSlash([B)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/lib/Tree;->addFile([BI)Lorg/eclipse/jgit/lib/FileTreeEntry;

    move-result-object v0

    return-object v0
.end method

.method public addFile([BI)Lorg/eclipse/jgit/lib/FileTreeEntry;
    .locals 8
    .parameter "s"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2f

    const/4 v6, 0x0

    .line 281
    move v3, p2

    .local v3, slash:I
    :goto_0
    array-length v7, p1

    if-ge v3, v7, :cond_0

    aget-byte v7, p1, v3

    if-eq v7, v5, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 285
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Tree;->ensureLoaded()V

    .line 286
    array-length v7, p1

    if-ge v3, v7, :cond_1

    .line 287
    .local v5, xlast:B
    :goto_1
    iget-object v7, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    invoke-static {v7, p1, v5, p2, v3}, Lorg/eclipse/jgit/lib/Tree;->binarySearch([Lorg/eclipse/jgit/lib/TreeEntry;[BIII)I

    move-result v2

    .line 288
    .local v2, p:I
    if-ltz v2, :cond_2

    array-length v7, p1

    if-ge v3, v7, :cond_2

    iget-object v7, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    aget-object v7, v7, v2

    instance-of v7, v7, Lorg/eclipse/jgit/lib/Tree;

    if-eqz v7, :cond_2

    .line 289
    iget-object v6, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    aget-object v6, v6, v2

    check-cast v6, Lorg/eclipse/jgit/lib/Tree;

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v6, p1, v7}, Lorg/eclipse/jgit/lib/Tree;->addFile([BI)Lorg/eclipse/jgit/lib/FileTreeEntry;

    move-result-object v0

    .line 302
    :goto_2
    return-object v0

    .end local v2           #p:I
    .end local v5           #xlast:B
    :cond_1
    move v5, v6

    .line 286
    goto :goto_1

    .line 291
    .restart local v2       #p:I
    .restart local v5       #xlast:B
    :cond_2
    invoke-static {p1, p2, v3}, Lorg/eclipse/jgit/lib/Tree;->substring([BII)[B

    move-result-object v1

    .line 292
    .local v1, newName:[B
    if-ltz v2, :cond_3

    .line 293
    new-instance v6, Lorg/eclipse/jgit/errors/EntryExistsException;

    invoke-static {v1}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/EntryExistsException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 294
    :cond_3
    array-length v7, p1

    if-ge v3, v7, :cond_4

    .line 295
    new-instance v4, Lorg/eclipse/jgit/lib/Tree;

    invoke-direct {v4, p0, v1}, Lorg/eclipse/jgit/lib/Tree;-><init>(Lorg/eclipse/jgit/lib/Tree;[B)V

    .line 296
    .local v4, t:Lorg/eclipse/jgit/lib/Tree;
    invoke-direct {p0, v2, v4}, Lorg/eclipse/jgit/lib/Tree;->insertEntry(ILorg/eclipse/jgit/lib/TreeEntry;)V

    .line 297
    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v4, p1, v6}, Lorg/eclipse/jgit/lib/Tree;->addFile([BI)Lorg/eclipse/jgit/lib/FileTreeEntry;

    move-result-object v0

    goto :goto_2

    .line 299
    .end local v4           #t:Lorg/eclipse/jgit/lib/Tree;
    :cond_4
    new-instance v0, Lorg/eclipse/jgit/lib/FileTreeEntry;

    const/4 v7, 0x0

    invoke-direct {v0, p0, v7, v1, v6}, Lorg/eclipse/jgit/lib/FileTreeEntry;-><init>(Lorg/eclipse/jgit/lib/Tree;Lorg/eclipse/jgit/lib/ObjectId;[BZ)V

    .line 301
    .local v0, f:Lorg/eclipse/jgit/lib/FileTreeEntry;
    invoke-direct {p0, v2, v0}, Lorg/eclipse/jgit/lib/Tree;->insertEntry(ILorg/eclipse/jgit/lib/TreeEntry;)V

    goto :goto_2
.end method

.method public addTree(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Tree;
    .locals 2
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Repository;->gitInternalSlash([B)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/lib/Tree;->addTree([BI)Lorg/eclipse/jgit/lib/Tree;

    move-result-object v0

    return-object v0
.end method

.method public addTree([BI)Lorg/eclipse/jgit/lib/Tree;
    .locals 6
    .parameter "s"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2f

    .line 332
    move v2, p2

    .local v2, slash:I
    :goto_0
    array-length v4, p1

    if-ge v2, v4, :cond_0

    aget-byte v4, p1, v2

    if-eq v4, v5, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 336
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Tree;->ensureLoaded()V

    .line 337
    iget-object v4, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    invoke-static {v4, p1, v5, p2, v2}, Lorg/eclipse/jgit/lib/Tree;->binarySearch([Lorg/eclipse/jgit/lib/TreeEntry;[BIII)I

    move-result v1

    .line 338
    .local v1, p:I
    if-ltz v1, :cond_2

    array-length v4, p1

    if-ge v2, v4, :cond_2

    iget-object v4, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    aget-object v4, v4, v1

    instance-of v4, v4, Lorg/eclipse/jgit/lib/Tree;

    if-eqz v4, :cond_2

    .line 339
    iget-object v4, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    aget-object v4, v4, v1

    check-cast v4, Lorg/eclipse/jgit/lib/Tree;

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, p1, v5}, Lorg/eclipse/jgit/lib/Tree;->addTree([BI)Lorg/eclipse/jgit/lib/Tree;

    move-result-object v3

    .line 347
    :cond_1
    :goto_1
    return-object v3

    .line 341
    :cond_2
    invoke-static {p1, p2, v2}, Lorg/eclipse/jgit/lib/Tree;->substring([BII)[B

    move-result-object v0

    .line 342
    .local v0, newName:[B
    if-ltz v1, :cond_3

    .line 343
    new-instance v4, Lorg/eclipse/jgit/errors/EntryExistsException;

    invoke-static {v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/EntryExistsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 345
    :cond_3
    new-instance v3, Lorg/eclipse/jgit/lib/Tree;

    invoke-direct {v3, p0, v0}, Lorg/eclipse/jgit/lib/Tree;-><init>(Lorg/eclipse/jgit/lib/Tree;[B)V

    .line 346
    .local v3, t:Lorg/eclipse/jgit/lib/Tree;
    invoke-direct {p0, v1, v3}, Lorg/eclipse/jgit/lib/Tree;->insertEntry(ILorg/eclipse/jgit/lib/TreeEntry;)V

    .line 347
    array-length v4, p1

    if-eq v2, v4, :cond_1

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, p1, v4}, Lorg/eclipse/jgit/lib/Tree;->addTree([BI)Lorg/eclipse/jgit/lib/Tree;

    move-result-object v3

    goto :goto_1
.end method

.method public existsBlob(Ljava/lang/String;)Z
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 455
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/Tree;->exists(Ljava/lang/String;B)Z

    move-result v0

    return v0
.end method

.method public existsTree(Ljava/lang/String;)Z
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 445
    const/16 v0, 0x2f

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/Tree;->exists(Ljava/lang/String;B)Z

    move-result v0

    return v0
.end method

.method public findBlobMember(Ljava/lang/String;)Lorg/eclipse/jgit/lib/TreeEntry;
    .locals 1
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 492
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/Tree;->findMember(Ljava/lang/String;B)Lorg/eclipse/jgit/lib/TreeEntry;

    move-result-object v0

    return-object v0
.end method

.method public findTreeMember(Ljava/lang/String;)Lorg/eclipse/jgit/lib/TreeEntry;
    .locals 1
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 501
    const/16 v0, 0x2f

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/Tree;->findMember(Ljava/lang/String;B)Lorg/eclipse/jgit/lib/TreeEntry;

    move-result-object v0

    return-object v0
.end method

.method public format()[B
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 581
    new-instance v2, Lorg/eclipse/jgit/lib/TreeFormatter;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/TreeFormatter;-><init>()V

    .line 582
    .local v2, fmt:Lorg/eclipse/jgit/lib/TreeFormatter;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->members()[Lorg/eclipse/jgit/lib/TreeEntry;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/lib/TreeEntry;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v1, v0, v3

    .line 583
    .local v1, e:Lorg/eclipse/jgit/lib/TreeEntry;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/TreeEntry;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 584
    .local v4, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v4, :cond_0

    .line 585
    new-instance v6, Lorg/eclipse/jgit/errors/ObjectWritingException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->objectAtPathDoesNotHaveId:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/TreeEntry;->getFullName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/ObjectWritingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 588
    :cond_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/TreeEntry;->getNameUTF8()[B

    move-result-object v6

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/TreeEntry;->getMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v7

    invoke-virtual {v2, v6, v7, v4}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BLorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 582
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 590
    .end local v1           #e:Lorg/eclipse/jgit/lib/TreeEntry;
    .end local v4           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/TreeFormatter;->toByteArray()[B

    move-result-object v6

    return-object v6
.end method

.method public getMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 224
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    return-object v0
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->db:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public isLoaded()Z
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRoot()Z
    .locals 1

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->getParent()Lorg/eclipse/jgit/lib/Tree;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public memberCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 402
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Tree;->ensureLoaded()V

    .line 403
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    array-length v0, v0

    return v0
.end method

.method public members()[Lorg/eclipse/jgit/lib/TreeEntry;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Tree;->ensureLoaded()V

    .line 424
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 425
    .local v0, c:[Lorg/eclipse/jgit/lib/TreeEntry;
    array-length v3, v0

    if-eqz v3, :cond_0

    .line 426
    array-length v3, v0

    new-array v2, v3, [Lorg/eclipse/jgit/lib/TreeEntry;

    .line 427
    .local v2, r:[Lorg/eclipse/jgit/lib/TreeEntry;
    array-length v3, v0

    add-int/lit8 v1, v3, -0x1

    .local v1, k:I
    :goto_0
    if-ltz v1, :cond_1

    .line 428
    aget-object v3, v0, v1

    aput-object v3, v2, v1

    .line 427
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .end local v1           #k:I
    .end local v2           #r:[Lorg/eclipse/jgit/lib/TreeEntry;
    :cond_0
    move-object v2, v0

    .line 431
    :cond_1
    return-object v2
.end method

.method removeEntry(Lorg/eclipse/jgit/lib/TreeEntry;)V
    .locals 8
    .parameter "e"

    .prologue
    .line 383
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 384
    .local v0, c:[Lorg/eclipse/jgit/lib/TreeEntry;
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->getNameUTF8()[B

    move-result-object v4

    invoke-static {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->lastChar(Lorg/eclipse/jgit/lib/TreeEntry;)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/TreeEntry;->getNameUTF8()[B

    move-result-object v7

    array-length v7, v7

    invoke-static {v0, v4, v5, v6, v7}, Lorg/eclipse/jgit/lib/Tree;->binarySearch([Lorg/eclipse/jgit/lib/TreeEntry;[BIII)I

    move-result v3

    .line 386
    .local v3, p:I
    if-ltz v3, :cond_2

    .line 387
    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    new-array v2, v4, [Lorg/eclipse/jgit/lib/TreeEntry;

    .line 388
    .local v2, n:[Lorg/eclipse/jgit/lib/TreeEntry;
    array-length v4, v0

    add-int/lit8 v1, v4, -0x1

    .local v1, k:I
    :goto_0
    if-le v1, v3, :cond_0

    .line 389
    add-int/lit8 v4, v1, -0x1

    aget-object v5, v0, v1

    aput-object v5, v2, v4

    .line 388
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 390
    :cond_0
    add-int/lit8 v1, v3, -0x1

    :goto_1
    if-ltz v1, :cond_1

    .line 391
    aget-object v4, v0, v1

    aput-object v4, v2, v1

    .line 390
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 392
    :cond_1
    iput-object v2, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 393
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->setModified()V

    .line 395
    .end local v1           #k:I
    .end local v2           #n:[Lorg/eclipse/jgit/lib/TreeEntry;
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 594
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 595
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 596
    const-string v1, " T "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public unload()V
    .locals 2

    .prologue
    .line 249
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Tree;->isModified()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 250
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->cannotUnloadAModifiedTree:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 251
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Tree;->contents:[Lorg/eclipse/jgit/lib/TreeEntry;

    .line 252
    return-void
.end method
