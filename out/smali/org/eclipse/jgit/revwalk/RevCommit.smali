.class public Lorg/eclipse/jgit/revwalk/RevCommit;
.super Lorg/eclipse/jgit/revwalk/RevObject;
.source "RevCommit.java"


# static fields
.field static final NO_PARENTS:[Lorg/eclipse/jgit/revwalk/RevCommit; = null

.field private static final STACK_DEPTH:I = 0x1f4


# instance fields
.field private buffer:[B

.field commitTime:I

.field inDegree:I

.field parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

.field private tree:Lorg/eclipse/jgit/revwalk/RevTree;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/eclipse/jgit/revwalk/RevCommit;

    sput-object v0, Lorg/eclipse/jgit/revwalk/RevCommit;->NO_PARENTS:[Lorg/eclipse/jgit/revwalk/RevCommit;

    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 139
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevObject;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 140
    return-void
.end method

.method static carryFlags(Lorg/eclipse/jgit/revwalk/RevCommit;I)V
    .locals 2
    .parameter "c"
    .parameter "carry"

    .prologue
    .line 219
    const/4 v1, 0x0

    invoke-static {p0, p1, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->carryFlags1(Lorg/eclipse/jgit/revwalk/RevCommit;II)Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    move-result-object v0

    .line 220
    .local v0, q:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    if-eqz v0, :cond_0

    .line 221
    invoke-static {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->slowCarryFlags(Lorg/eclipse/jgit/revwalk/FIFORevQueue;I)V

    .line 222
    :cond_0
    return-void
.end method

.method private static carryFlags1(Lorg/eclipse/jgit/revwalk/RevCommit;II)Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    .locals 7
    .parameter "c"
    .parameter "carry"
    .parameter "depth"

    .prologue
    const/4 v4, 0x0

    .line 226
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 227
    .local v2, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v2, :cond_0

    array-length v5, v2

    if-nez v5, :cond_1

    .line 245
    :cond_0
    :goto_1
    return-object v4

    .line 229
    :cond_1
    array-length v5, v2

    const/4 v6, 0x1

    if-eq v5, v6, :cond_5

    .line 230
    const/16 v5, 0x1f4

    if-ne p2, v5, :cond_2

    .line 231
    invoke-static {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->defer(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    move-result-object v4

    goto :goto_1

    .line 232
    :cond_2
    const/4 v0, 0x1

    .local v0, i:I
    :goto_2
    array-length v5, v2

    if-ge v0, v5, :cond_5

    .line 233
    aget-object v1, v2, v0

    .line 234
    .local v1, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v5, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v5, p1

    if-ne v5, p1, :cond_4

    .line 232
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 236
    :cond_4
    iget v5, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/2addr v5, p1

    iput v5, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 237
    add-int/lit8 v5, p2, 0x1

    invoke-static {p0, p1, v5}, Lorg/eclipse/jgit/revwalk/RevCommit;->carryFlags1(Lorg/eclipse/jgit/revwalk/RevCommit;II)Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    move-result-object v3

    .line 238
    .local v3, q:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    if-eqz v3, :cond_3

    .line 239
    add-int/lit8 v4, v0, 0x1

    invoke-static {v3, p1, v2, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->defer(Lorg/eclipse/jgit/revwalk/FIFORevQueue;I[Lorg/eclipse/jgit/revwalk/RevCommit;I)Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    move-result-object v4

    goto :goto_1

    .line 243
    .end local v0           #i:I
    .end local v1           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #q:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    :cond_5
    const/4 v5, 0x0

    aget-object p0, v2, v5

    .line 244
    iget v5, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v5, p1

    if-eq v5, p1, :cond_0

    .line 246
    iget v5, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/2addr v5, p1

    iput v5, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    goto :goto_0
.end method

.method private static carryOneStep(Lorg/eclipse/jgit/revwalk/FIFORevQueue;ILorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "q"
    .parameter "carry"
    .parameter "c"

    .prologue
    .line 280
    iget v0, p2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/2addr v0, p1

    if-eq v0, p1, :cond_0

    .line 281
    iget v0, p2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/2addr v0, p1

    iput v0, p2, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 282
    iget-object v0, p2, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v0, :cond_0

    .line 283
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 285
    :cond_0
    return-void
.end method

.method private static defer(Lorg/eclipse/jgit/revwalk/FIFORevQueue;I[Lorg/eclipse/jgit/revwalk/RevCommit;I)Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    .locals 1
    .parameter "q"
    .parameter "carry"
    .parameter "pList"
    .parameter "i"

    .prologue
    .line 261
    const/4 v0, 0x0

    aget-object v0, p2, v0

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->carryOneStep(Lorg/eclipse/jgit/revwalk/FIFORevQueue;ILorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 265
    :goto_0
    array-length v0, p2

    if-ge p3, v0, :cond_0

    .line 266
    aget-object v0, p2, p3

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->carryOneStep(Lorg/eclipse/jgit/revwalk/FIFORevQueue;ILorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 265
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 267
    :cond_0
    return-object p0
.end method

.method private static defer(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    .locals 1
    .parameter "c"

    .prologue
    .line 251
    new-instance v0, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    .line 252
    .local v0, q:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 253
    return-object v0
.end method

.method static hasLF([BII)Z
    .locals 3
    .parameter "r"
    .parameter "b"
    .parameter "e"

    .prologue
    .line 477
    move v0, p1

    .end local p1
    .local v0, b:I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 478
    add-int/lit8 p1, v0, 0x1

    .end local v0           #b:I
    .restart local p1
    aget-byte v1, p0, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_1

    .line 479
    const/4 v1, 0x1

    .line 480
    :goto_1
    return v1

    .end local p1
    .restart local v0       #b:I
    :cond_0
    const/4 v1, 0x0

    move p1, v0

    .end local v0           #b:I
    .restart local p1
    goto :goto_1

    :cond_1
    move v0, p1

    .end local p1
    .restart local v0       #b:I
    goto :goto_0
.end method

.method public static parse(Lorg/eclipse/jgit/revwalk/RevWalk;[B)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 4
    .parameter "rw"
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 111
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;-><init>()V

    .line 112
    .local v0, fmt:Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->isRetainBody()Z

    move-result v2

    .line 113
    .local v2, retain:Z
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 114
    invoke-virtual {v0, v3, p1}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;->idFor(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 115
    .local v1, r:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v1, p0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 116
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 117
    return-object v1
.end method

.method public static parse([B)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3
    .parameter "raw"

    .prologue
    .line 87
    :try_start_0
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk;

    const/4 v1, 0x0

    check-cast v1, Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    invoke-static {v2, p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->parse(Lorg/eclipse/jgit/revwalk/RevWalk;[B)Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, ex:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static slowCarryFlags(Lorg/eclipse/jgit/revwalk/FIFORevQueue;I)V
    .locals 5
    .parameter "q"
    .parameter "carry"

    .prologue
    .line 273
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v1, :cond_1

    .line 274
    iget-object v0, v1, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 275
    .local v4, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-static {p0, p1, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->carryOneStep(Lorg/eclipse/jgit/revwalk/FIFORevQueue;ILorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 274
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 277
    .end local v0           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v4           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    return-void
.end method


# virtual methods
.method public carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 300
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    iget v2, p1, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    and-int v0, v1, v2

    .line 301
    .local v0, carry:I
    if-eqz v0, :cond_0

    .line 302
    invoke-static {p0, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->carryFlags(Lorg/eclipse/jgit/revwalk/RevCommit;I)V

    .line 303
    :cond_0
    return-void
.end method

.method final disposeBody()V
    .locals 1

    .prologue
    .line 608
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 609
    return-void
.end method

.method public final getAuthorIdent()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 3

    .prologue
    .line 395
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 396
    .local v1, raw:[B
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->author([BI)I

    move-result v0

    .line 397
    .local v0, nameB:I
    if-gez v0, :cond_0

    .line 398
    const/4 v2, 0x0

    .line 399
    :goto_0
    return-object v2

    :cond_0
    invoke-static {v1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parsePersonIdent([BI)Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v2

    goto :goto_0
.end method

.method public final getCommitTime()I
    .locals 1

    .prologue
    .line 311
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    return v0
.end method

.method public final getCommitterIdent()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 3

    .prologue
    .line 421
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 422
    .local v1, raw:[B
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->committer([BI)I

    move-result v0

    .line 423
    .local v0, nameB:I
    if-gez v0, :cond_0

    .line 424
    const/4 v2, 0x0

    .line 425
    :goto_0
    return-object v2

    :cond_0
    invoke-static {v1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parsePersonIdent([BI)Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v2

    goto :goto_0
.end method

.method public final getEncoding()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 495
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    invoke-static {v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parseEncoding([B)Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method public final getFooterLines()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/revwalk/FooterLine;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v11, 0xa

    .line 520
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 521
    .local v1, raw:[B
    array-length v0, v1

    add-int/lit8 v8, v0, -0x1

    .line 522
    .local v8, ptr:I
    :goto_0
    aget-byte v0, v1, v8

    if-ne v0, v11, :cond_0

    .line 523
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 525
    :cond_0
    const/4 v0, 0x0

    invoke-static {v1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->commitMessage([BI)I

    move-result v7

    .line 526
    .local v7, msgB:I
    new-instance v9, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {v9, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 527
    .local v9, r:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/revwalk/FooterLine;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getEncoding()Ljava/nio/charset/Charset;

    move-result-object v2

    .line 529
    .local v2, enc:Ljava/nio/charset/Charset;
    :cond_1
    :goto_1
    invoke-static {v1, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->prevLF([BI)I

    move-result v8

    .line 530
    if-gt v8, v7, :cond_3

    .line 555
    :cond_2
    invoke-static {v9}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 556
    return-object v9

    .line 533
    :cond_3
    add-int/lit8 v3, v8, 0x2

    .line 534
    .local v3, keyStart:I
    aget-byte v0, v1, v3

    if-eq v0, v11, :cond_2

    .line 537
    invoke-static {v1, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->endOfFooterLineKey([BI)I

    move-result v4

    .line 538
    .local v4, keyEnd:I
    if-ltz v4, :cond_1

    .line 543
    add-int/lit8 v5, v4, 0x1

    .line 544
    .local v5, valStart:I
    :goto_2
    array-length v0, v1

    if-ge v5, v0, :cond_4

    aget-byte v0, v1, v5

    const/16 v10, 0x20

    if-ne v0, v10, :cond_4

    .line 545
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 549
    :cond_4
    invoke-static {v1, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v6

    .line 550
    .local v6, valEnd:I
    add-int/lit8 v0, v6, -0x1

    aget-byte v0, v1, v0

    if-ne v0, v11, :cond_5

    .line 551
    add-int/lit8 v6, v6, -0x1

    .line 553
    :cond_5
    new-instance v0, Lorg/eclipse/jgit/revwalk/FooterLine;

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/revwalk/FooterLine;-><init>([BLjava/nio/charset/Charset;IIII)V

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public final getFooterLines(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .parameter "keyName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 571
    new-instance v0, Lorg/eclipse/jgit/revwalk/FooterKey;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/FooterKey;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFooterLines(Lorg/eclipse/jgit/revwalk/FooterKey;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getFooterLines(Lorg/eclipse/jgit/revwalk/FooterKey;)Ljava/util/List;
    .locals 5
    .parameter "keyName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/FooterKey;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 586
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFooterLines()Ljava/util/List;

    move-result-object v3

    .line 587
    .local v3, src:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/FooterLine;>;"
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 588
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 594
    :cond_0
    return-object v2

    .line 589
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 590
    .local v2, r:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/FooterLine;

    .line 591
    .local v0, f:Lorg/eclipse/jgit/revwalk/FooterLine;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/FooterLine;->matches(Lorg/eclipse/jgit/revwalk/FooterKey;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 592
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/FooterLine;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public final getFullMessage()Ljava/lang/String;
    .locals 4

    .prologue
    .line 439
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 440
    .local v2, raw:[B
    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->commitMessage([BI)I

    move-result v1

    .line 441
    .local v1, msgB:I
    if-gez v1, :cond_0

    .line 442
    const-string v3, ""

    .line 444
    :goto_0
    return-object v3

    .line 443
    :cond_0
    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseEncoding([B)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 444
    .local v0, enc:Ljava/nio/charset/Charset;
    array-length v3, v2

    invoke-static {v0, v2, v1, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public final getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "nth"

    .prologue
    .line 343
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public final getParentCount()I
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    array-length v0, v0

    return v0
.end method

.method public final getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    return-object v0
.end method

.method public final getRawBuffer()[B
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    return-object v0
.end method

.method public final getShortMessage()Ljava/lang/String;
    .locals 6

    .prologue
    .line 463
    iget-object v3, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 464
    .local v3, raw:[B
    const/4 v5, 0x0

    invoke-static {v3, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->commitMessage([BI)I

    move-result v1

    .line 465
    .local v1, msgB:I
    if-gez v1, :cond_1

    .line 466
    const-string v4, ""

    .line 473
    :cond_0
    :goto_0
    return-object v4

    .line 468
    :cond_1
    invoke-static {v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseEncoding([B)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 469
    .local v0, enc:Ljava/nio/charset/Charset;
    invoke-static {v3, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->endOfParagraph([BI)I

    move-result v2

    .line 470
    .local v2, msgE:I
    invoke-static {v0, v3, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v4

    .line 471
    .local v4, str:Ljava/lang/String;
    invoke-static {v3, v1, v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->hasLF([BII)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 472
    invoke-static {v4}, Lorg/eclipse/jgit/util/StringUtils;->replaceLineBreaksWithSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method public final getTree()Lorg/eclipse/jgit/revwalk/RevTree;
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    return-object v0
.end method

.method public final getType()I
    .locals 1

    .prologue
    .line 215
    const/4 v0, 0x1

    return v0
.end method

.method parseBody(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 1
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    if-nez v0, :cond_0

    .line 152
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 153
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 154
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 156
    :cond_0
    return-void
.end method

.method parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V
    .locals 12
    .parameter "walk"
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 160
    iget-boolean v8, p1, Lorg/eclipse/jgit/revwalk/RevWalk;->shallowCommitsInitialized:Z

    if-nez v8, :cond_0

    .line 161
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->initializeShallowCommits()V

    .line 163
    :cond_0
    iget-object v0, p1, Lorg/eclipse/jgit/revwalk/RevWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 164
    .local v0, idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;
    const/4 v8, 0x5

    invoke-virtual {v0, p2, v8}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromString([BI)V

    .line 165
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    .line 167
    const/16 v7, 0x2e

    .line 168
    .local v7, ptr:I
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v8, :cond_2

    .line 169
    new-array v5, v11, [Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 170
    .local v5, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    const/4 v1, 0x0

    .line 172
    .local v1, nParents:I
    :goto_0
    aget-byte v8, p2, v7

    const/16 v9, 0x70

    if-eq v8, v9, :cond_5

    .line 191
    array-length v8, v5

    if-eq v1, v8, :cond_1

    .line 192
    move-object v3, v5

    .line 193
    .local v3, old:[Lorg/eclipse/jgit/revwalk/RevCommit;
    new-array v5, v1, [Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 194
    invoke-static {v3, v10, v5, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 196
    .end local v3           #old:[Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iput-object v5, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->parents:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 200
    .end local v1           #nParents:I
    .end local v5           #pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_2
    invoke-static {p2, v7}, Lorg/eclipse/jgit/util/RawParseUtils;->committer([BI)I

    move-result v7

    .line 201
    if-lez v7, :cond_3

    .line 202
    const/16 v8, 0x3e

    invoke-static {p2, v7, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v7

    .line 205
    const/4 v8, 0x0

    invoke-static {p2, v7, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v8

    iput v8, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    .line 208
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->isRetainBody()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 209
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->buffer:[B

    .line 210
    :cond_4
    iget v8, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    or-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    .line 211
    return-void

    .line 174
    .restart local v1       #nParents:I
    .restart local v5       #pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_5
    add-int/lit8 v8, v7, 0x7

    invoke-virtual {v0, p2, v8}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromString([BI)V

    .line 175
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .line 176
    .local v4, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v1, :cond_6

    .line 177
    add-int/lit8 v2, v1, 0x1

    .end local v1           #nParents:I
    .local v2, nParents:I
    aput-object v4, v5, v1

    move v1, v2

    .line 189
    .end local v2           #nParents:I
    .restart local v1       #nParents:I
    :goto_1
    add-int/lit8 v7, v7, 0x30

    .line 190
    goto :goto_0

    .line 178
    :cond_6
    if-ne v1, v11, :cond_7

    .line 179
    const/4 v8, 0x2

    new-array v6, v8, [Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v8, v5, v10

    aput-object v8, v6, v10

    aput-object v4, v6, v11

    .line 180
    .end local v5           #pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .local v6, pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    const/4 v1, 0x2

    move-object v5, v6

    .end local v6           #pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v5       #pList:[Lorg/eclipse/jgit/revwalk/RevCommit;
    goto :goto_1

    .line 182
    :cond_7
    array-length v8, v5

    if-gt v8, v1, :cond_8

    .line 183
    move-object v3, v5

    .line 184
    .restart local v3       #old:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v8, v5

    add-int/lit8 v8, v8, 0x20

    new-array v5, v8, [Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 185
    invoke-static {v3, v10, v5, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    .end local v3           #old:[Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_8
    add-int/lit8 v2, v1, 0x1

    .end local v1           #nParents:I
    .restart local v2       #nParents:I
    aput-object v4, v5, v1

    move v1, v2

    .end local v2           #nParents:I
    .restart local v1       #nParents:I
    goto :goto_1
.end method

.method parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 1
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;)[B

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 146
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 604
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->inDegree:I

    .line 605
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x20

    .line 613
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 614
    .local v0, s:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getType()I

    move-result v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 616
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 618
    iget v1, p0, Lorg/eclipse/jgit/revwalk/RevCommit;->commitTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 619
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 620
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->appendCoreFlags(Ljava/lang/StringBuilder;)V

    .line 621
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
