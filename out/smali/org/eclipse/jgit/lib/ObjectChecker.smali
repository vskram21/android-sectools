.class public Lorg/eclipse/jgit/lib/ObjectChecker;
.super Ljava/lang/Object;
.source "ObjectChecker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;
    }
.end annotation


# static fields
.field public static final author:[B

.field public static final committer:[B

.field public static final encoding:[B

.field public static final object:[B

.field public static final parent:[B

.field public static final tag:[B

.field public static final tagger:[B

.field public static final tree:[B

.field public static final type:[B


# instance fields
.field private allowZeroMode:Z

.field private macosx:Z

.field private final ptrout:Lorg/eclipse/jgit/util/MutableInteger;

.field private final tempId:Lorg/eclipse/jgit/lib/MutableObjectId;

.field private windows:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 76
    const-string v0, "tree "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->tree:[B

    .line 79
    const-string v0, "parent "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->parent:[B

    .line 82
    const-string v0, "author "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->author:[B

    .line 85
    const-string v0, "committer "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->committer:[B

    .line 88
    const-string v0, "encoding "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->encoding:[B

    .line 91
    const-string v0, "object "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->object:[B

    .line 94
    const-string v0, "type "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->type:[B

    .line 97
    const-string v0, "tag "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->tag:[B

    .line 100
    const-string v0, "tagger "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/ObjectChecker;->tagger:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->tempId:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 104
    new-instance v0, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->ptrout:Lorg/eclipse/jgit/util/MutableInteger;

    .line 578
    return-void
.end method

.method private static checkNotWindowsDevice([BII)V
    .locals 7
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x6f

    const/16 v5, 0x6e

    const/4 v4, 0x4

    const/16 v3, 0x2e

    const/4 v2, 0x3

    .line 475
    aget-byte v0, p0, p1

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 525
    :cond_0
    return-void

    .line 477
    :sswitch_0
    sub-int v0, p2, p1

    if-lt v0, v2, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x75

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x78

    if-ne v0, v1, :cond_0

    sub-int v0, p2, p1

    if-eq v0, v2, :cond_1

    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    if-ne v0, v3, :cond_0

    .line 481
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "invalid name \'AUX\'"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 485
    :sswitch_1
    sub-int v0, p2, p1

    if-lt v0, v2, :cond_3

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    if-ne v0, v5, :cond_3

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    if-ne v0, v6, :cond_3

    sub-int v0, p2, p1

    if-eq v0, v2, :cond_2

    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    if-ne v0, v3, :cond_3

    .line 489
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "invalid name \'CON\'"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 490
    :cond_3
    sub-int v0, p2, p1

    if-lt v0, v4, :cond_0

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x6d

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    if-ne v0, v6, :cond_0

    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->isPositiveDigit(B)Z

    move-result v0

    if-eqz v0, :cond_0

    sub-int v0, p2, p1

    if-eq v0, v4, :cond_4

    add-int/lit8 v0, p1, 0x4

    aget-byte v0, p0, v0

    if-ne v0, v3, :cond_0

    .line 495
    :cond_4
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid name \'COM"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 500
    :sswitch_2
    sub-int v0, p2, p1

    if-lt v0, v4, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x70

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x74

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->isPositiveDigit(B)Z

    move-result v0

    if-eqz v0, :cond_0

    sub-int v0, p2, p1

    if-eq v0, v4, :cond_5

    add-int/lit8 v0, p1, 0x4

    aget-byte v0, p0, v0

    if-ne v0, v3, :cond_0

    .line 505
    :cond_5
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid name \'LPT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 510
    :sswitch_3
    sub-int v0, p2, p1

    if-lt v0, v2, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x75

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x6c

    if-ne v0, v1, :cond_0

    sub-int v0, p2, p1

    if-eq v0, v2, :cond_6

    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    if-ne v0, v3, :cond_0

    .line 514
    :cond_6
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "invalid name \'NUL\'"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 518
    :sswitch_4
    sub-int v0, p2, p1

    if-lt v0, v2, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    const/16 v1, 0x72

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v0

    if-ne v0, v5, :cond_0

    sub-int v0, p2, p1

    if-eq v0, v2, :cond_7

    add-int/lit8 v0, p1, 0x3

    aget-byte v0, p0, v0

    if-ne v0, v3, :cond_0

    .line 522
    :cond_7
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "invalid name \'PRN\'"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 475
    :sswitch_data_0
    .sparse-switch
        0x61 -> :sswitch_0
        0x63 -> :sswitch_1
        0x6c -> :sswitch_2
        0x6e -> :sswitch_3
        0x70 -> :sswitch_4
    .end sparse-switch
.end method

.method private checkPathSegment2([BII)V
    .locals 5
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x2e

    .line 445
    if-ne p2, p3, :cond_0

    .line 446
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "zero length name"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 447
    :cond_0
    aget-byte v0, p1, p2

    if-ne v0, v2, :cond_1

    .line 448
    sub-int v0, p3, p2

    packed-switch v0, :pswitch_data_0

    .line 463
    :cond_1
    :pswitch_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->windows:Z

    if-eqz v0, :cond_4

    .line 465
    add-int/lit8 v0, p3, -0x1

    aget-byte v0, p1, v0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_2

    add-int/lit8 v0, p3, -0x1

    aget-byte v0, p1, v0

    if-ne v0, v2, :cond_3

    .line 466
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid name ends with \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, p3, -0x1

    aget-byte v2, p1, v2

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 450
    :pswitch_1
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "invalid name \'.\'"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 452
    :pswitch_2
    add-int/lit8 v0, p2, 0x1

    aget-byte v0, p1, v0

    if-ne v0, v2, :cond_1

    .line 453
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "invalid name \'..\'"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 456
    :pswitch_3
    add-int/lit8 v0, p2, 0x1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->isDotGit([BI)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 457
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v1, "invalid name \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 468
    :cond_3
    sub-int v0, p3, p2

    const/4 v1, 0x3

    if-lt v0, v1, :cond_4

    .line 469
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkNotWindowsDevice([BII)V

    .line 471
    :cond_4
    return-void

    .line 448
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private static duplicateName([BII)Z
    .locals 13
    .parameter "raw"
    .parameter "thisNamePos"
    .parameter "thisNameEnd"

    .prologue
    const/4 v12, 0x0

    .line 308
    array-length v11, p0

    .line 309
    .local v11, sz:I
    add-int/lit8 v0, p2, 0x1

    add-int/lit8 v9, v0, 0x14

    .line 311
    .local v9, nextPtr:I
    :goto_0
    const/4 v6, 0x0

    .local v6, nextMode:I
    move v10, v9

    .line 313
    .end local v9           #nextPtr:I
    .local v10, nextPtr:I
    :goto_1
    if-lt v10, v11, :cond_0

    move v9, v10

    .end local v10           #nextPtr:I
    .restart local v9       #nextPtr:I
    move v0, v12

    .line 338
    :goto_2
    return v0

    .line 315
    .end local v9           #nextPtr:I
    .restart local v10       #nextPtr:I
    :cond_0
    add-int/lit8 v9, v10, 0x1

    .end local v10           #nextPtr:I
    .restart local v9       #nextPtr:I
    aget-byte v7, p0, v10

    .line 316
    .local v7, c:B
    const/16 v0, 0x20

    if-ne v0, v7, :cond_1

    .line 322
    move v4, v9

    .local v4, nextNamePos:I
    move v10, v9

    .line 324
    .end local v9           #nextPtr:I
    .restart local v10       #nextPtr:I
    :goto_3
    if-ne v10, v11, :cond_2

    move v9, v10

    .end local v10           #nextPtr:I
    .restart local v9       #nextPtr:I
    move v0, v12

    .line 325
    goto :goto_2

    .line 318
    .end local v4           #nextNamePos:I
    :cond_1
    shl-int/lit8 v6, v6, 0x3

    .line 319
    add-int/lit8 v0, v7, -0x30

    add-int/2addr v6, v0

    move v10, v9

    .line 320
    .end local v9           #nextPtr:I
    .restart local v10       #nextPtr:I
    goto :goto_1

    .line 326
    .restart local v4       #nextNamePos:I
    :cond_2
    add-int/lit8 v9, v10, 0x1

    .end local v10           #nextPtr:I
    .restart local v9       #nextPtr:I
    aget-byte v7, p0, v10

    .line 327
    if-nez v7, :cond_3

    .line 330
    add-int/lit8 v0, v4, 0x1

    if-ne v0, v9, :cond_4

    move v0, v12

    .line 331
    goto :goto_2

    :cond_3
    move v10, v9

    .line 329
    .end local v9           #nextPtr:I
    .restart local v10       #nextPtr:I
    goto :goto_3

    .line 333
    .end local v10           #nextPtr:I
    .restart local v9       #nextPtr:I
    :cond_4
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v3

    add-int/lit8 v5, v9, -0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    invoke-static/range {v0 .. v6}, Lorg/eclipse/jgit/lib/ObjectChecker;->pathCompare([BIIIIII)I

    move-result v8

    .line 335
    .local v8, cmp:I
    if-gez v8, :cond_5

    move v0, v12

    .line 336
    goto :goto_2

    .line 337
    :cond_5
    if-nez v8, :cond_6

    .line 338
    const/4 v0, 0x1

    goto :goto_2

    .line 340
    :cond_6
    add-int/lit8 v9, v9, 0x14

    .line 341
    goto :goto_0
.end method

.method private id([BI)I
    .locals 2
    .parameter "raw"
    .parameter "ptr"

    .prologue
    .line 193
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->tempId:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromString([BI)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    add-int/lit8 v1, p2, 0x28

    .line 196
    :goto_0
    return v1

    .line 195
    :catch_0
    move-exception v0

    .line 196
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const/4 v1, -0x1

    goto :goto_0
.end method

.method private isDotGit([BI)Z
    .locals 6
    .parameter "buf"
    .parameter "p"

    .prologue
    const/16 v5, 0x74

    const/16 v4, 0x69

    const/16 v3, 0x67

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 544
    iget-boolean v2, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->windows:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->macosx:Z

    if-eqz v2, :cond_3

    .line 545
    :cond_0
    aget-byte v2, p1, p2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v2

    if-ne v2, v3, :cond_2

    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v2

    if-ne v2, v4, :cond_2

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectChecker;->toLower(B)C

    move-result v2

    if-ne v2, v5, :cond_2

    .line 548
    :cond_1
    :goto_0
    return v0

    :cond_2
    move v0, v1

    .line 545
    goto :goto_0

    .line 548
    :cond_3
    aget-byte v2, p1, p2

    if-ne v2, v3, :cond_4

    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    if-ne v2, v4, :cond_4

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    if-eq v2, v5, :cond_1

    :cond_4
    move v0, v1

    goto :goto_0
.end method

.method private static isInvalidOnWindows(B)Z
    .locals 2
    .parameter "c"

    .prologue
    const/4 v0, 0x1

    .line 529
    sparse-switch p0, :sswitch_data_0

    .line 540
    if-gt v0, p0, :cond_0

    const/16 v1, 0x1f

    if-gt p0, v1, :cond_0

    :goto_0
    :sswitch_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 529
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_0
        0x2a -> :sswitch_0
        0x3a -> :sswitch_0
        0x3c -> :sswitch_0
        0x3e -> :sswitch_0
        0x3f -> :sswitch_0
        0x5c -> :sswitch_0
        0x7c -> :sswitch_0
    .end sparse-switch
.end method

.method private static isPositiveDigit(B)Z
    .locals 1
    .parameter "b"

    .prologue
    .line 558
    const/16 v0, 0x31

    if-gt v0, p0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static lastPathChar(I)I
    .locals 1
    .parameter "mode"

    .prologue
    .line 288
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

.method private normalize([BII)Ljava/lang/String;
    .locals 3
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 574
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 575
    .local v0, n:Ljava/lang/String;
    iget-boolean v1, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->macosx:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker$Normalizer;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .end local v0           #n:Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method private static pathCompare([BIIIIII)I
    .locals 5
    .parameter "raw"
    .parameter "aPos"
    .parameter "aEnd"
    .parameter "aMode"
    .parameter "bPos"
    .parameter "bEnd"
    .parameter "bMode"

    .prologue
    .line 293
    move v1, p4

    .end local p4
    .local v1, bPos:I
    move v0, p1

    .end local p1
    .local v0, aPos:I
    :goto_0
    if-ge v0, p2, :cond_1

    if-ge v1, p5, :cond_1

    .line 294
    add-int/lit8 p1, v0, 0x1

    .end local v0           #aPos:I
    .restart local p1
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    add-int/lit8 p4, v1, 0x1

    .end local v1           #bPos:I
    .restart local p4
    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xff

    sub-int v2, v3, v4

    .line 295
    .local v2, cmp:I
    if-eqz v2, :cond_0

    .line 303
    .end local v2           #cmp:I
    :goto_1
    return v2

    .restart local v2       #cmp:I
    :cond_0
    move v1, p4

    .end local p4
    .restart local v1       #bPos:I
    move v0, p1

    .line 297
    .end local p1
    .restart local v0       #aPos:I
    goto :goto_0

    .line 299
    .end local v2           #cmp:I
    :cond_1
    if-ge v0, p2, :cond_2

    .line 300
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    invoke-static {p6}, Lorg/eclipse/jgit/lib/ObjectChecker;->lastPathChar(I)I

    move-result v4

    sub-int v2, v3, v4

    move p4, v1

    .end local v1           #bPos:I
    .restart local p4
    move p1, v0

    .end local v0           #aPos:I
    .restart local p1
    goto :goto_1

    .line 301
    .end local p1
    .end local p4
    .restart local v0       #aPos:I
    .restart local v1       #bPos:I
    :cond_2
    if-ge v1, p5, :cond_3

    .line 302
    invoke-static {p3}, Lorg/eclipse/jgit/lib/ObjectChecker;->lastPathChar(I)I

    move-result v3

    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xff

    sub-int v2, v3, v4

    move p4, v1

    .end local v1           #bPos:I
    .restart local p4
    move p1, v0

    .end local v0           #aPos:I
    .restart local p1
    goto :goto_1

    .line 303
    .end local p1
    .end local p4
    .restart local v0       #aPos:I
    .restart local v1       #bPos:I
    :cond_3
    const/4 v2, 0x0

    move p4, v1

    .end local v1           #bPos:I
    .restart local p4
    move p1, v0

    .end local v0           #aPos:I
    .restart local p1
    goto :goto_1
.end method

.method private personIdent([BI)I
    .locals 7
    .parameter "raw"
    .parameter "ptr"

    .prologue
    const/16 v6, 0x3e

    const/16 v4, 0x3c

    const/16 v5, 0x20

    const/4 v2, -0x1

    .line 201
    invoke-static {p1, p2, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v0

    .line 202
    .local v0, emailB:I
    if-eq v0, p2, :cond_0

    add-int/lit8 v3, v0, -0x1

    aget-byte v3, p1, v3

    if-eq v3, v4, :cond_1

    .line 221
    :cond_0
    :goto_0
    return v2

    .line 205
    :cond_1
    invoke-static {p1, v0, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v1

    .line 206
    .local v1, emailE:I
    if-eq v1, v0, :cond_0

    add-int/lit8 v3, v1, -0x1

    aget-byte v3, p1, v3

    if-ne v3, v6, :cond_0

    .line 208
    array-length v3, p1

    if-eq v1, v3, :cond_0

    aget-byte v3, p1, v1

    if-ne v3, v5, :cond_0

    .line 211
    add-int/lit8 v3, v1, 0x1

    iget-object v4, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->ptrout:Lorg/eclipse/jgit/util/MutableInteger;

    invoke-static {p1, v3, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    .line 212
    iget-object v3, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->ptrout:Lorg/eclipse/jgit/util/MutableInteger;

    iget p2, v3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 213
    add-int/lit8 v3, v1, 0x1

    if-eq v3, p2, :cond_0

    .line 215
    array-length v3, p1

    if-eq p2, v3, :cond_0

    aget-byte v3, p1, p2

    if-ne v3, v5, :cond_0

    .line 218
    add-int/lit8 v3, p2, 0x1

    iget-object v4, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->ptrout:Lorg/eclipse/jgit/util/MutableInteger;

    invoke-static {p1, v3, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    .line 219
    add-int/lit8 v3, p2, 0x1

    iget-object v4, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->ptrout:Lorg/eclipse/jgit/util/MutableInteger;

    iget v4, v4, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    if-eq v3, v4, :cond_0

    .line 221
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->ptrout:Lorg/eclipse/jgit/util/MutableInteger;

    iget v2, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    goto :goto_0
.end method

.method private scanPathSegment([BII)I
    .locals 6
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 409
    :goto_0
    if-ge p2, p3, :cond_0

    .line 410
    aget-byte v0, p1, p2

    .line 411
    .local v0, c:B
    if-nez v0, :cond_1

    .line 423
    .end local v0           #c:B
    :cond_0
    return p2

    .line 413
    .restart local v0       #c:B
    :cond_1
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_2

    .line 414
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v2, "name contains \'/\'"

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 415
    :cond_2
    iget-boolean v1, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->windows:Z

    if-eqz v1, :cond_4

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->isInvalidOnWindows(B)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 416
    const/16 v1, 0x1f

    if-le v0, v1, :cond_3

    .line 417
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v2, "name contains \'%c\'"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 419
    :cond_3
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v2, "name contains byte 0x%x"

    new-array v3, v3, [Ljava/lang/Object;

    and-int/lit16 v4, v0, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 409
    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method private static toLower(B)C
    .locals 1
    .parameter "b"

    .prologue
    .line 552
    const/16 v0, 0x41

    if-gt v0, p0, :cond_0

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_0

    .line 553
    add-int/lit8 v0, p0, 0x20

    int-to-char v0, v0

    .line 554
    :goto_0
    return v0

    :cond_0
    int-to-char v0, p0

    goto :goto_0
.end method


# virtual methods
.method public check(I[B)V
    .locals 5
    .parameter "objType"
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 171
    packed-switch p1, :pswitch_data_0

    .line 185
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidType2:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :pswitch_0
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkCommit([B)V

    .line 189
    :goto_0
    return-void

    .line 176
    :pswitch_1
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkTag([B)V

    goto :goto_0

    .line 179
    :pswitch_2
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkTree([B)V

    goto :goto_0

    .line 182
    :pswitch_3
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkBlob([B)V

    goto :goto_0

    .line 171
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method public checkBlob([B)V
    .locals 0
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 571
    return-void
.end method

.method public checkCommit([B)V
    .locals 4
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/16 v3, 0xa

    .line 233
    const/4 v0, 0x0

    .line 235
    .local v0, ptr:I
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->tree:[B

    invoke-static {p1, v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    if-gez v0, :cond_0

    .line 236
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "no tree header"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 237
    :cond_0
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->id([BI)I

    move-result v0

    if-ltz v0, :cond_1

    add-int/lit8 v1, v0, 0x1

    .end local v0           #ptr:I
    .local v1, ptr:I
    aget-byte v2, p1, v0

    if-eq v2, v3, :cond_2

    move v0, v1

    .line 238
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "invalid tree"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    :cond_2
    move v0, v1

    .line 240
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->parent:[B

    invoke-static {p1, v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_4

    .line 241
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->parent:[B

    array-length v2, v2

    add-int/2addr v0, v2

    .line 242
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->id([BI)I

    move-result v0

    if-ltz v0, :cond_3

    add-int/lit8 v1, v0, 0x1

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    aget-byte v2, p1, v0

    if-eq v2, v3, :cond_2

    move v0, v1

    .line 243
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_3
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "invalid parent"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 246
    :cond_4
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->author:[B

    invoke-static {p1, v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    if-gez v0, :cond_5

    .line 247
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "no author"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 248
    :cond_5
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->personIdent([BI)I

    move-result v0

    if-ltz v0, :cond_6

    add-int/lit8 v1, v0, 0x1

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    aget-byte v2, p1, v0

    if-eq v2, v3, :cond_7

    move v0, v1

    .line 249
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_6
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "invalid author"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 251
    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    :cond_7
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->committer:[B

    invoke-static {p1, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    if-gez v0, :cond_8

    .line 252
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "no committer"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 253
    :cond_8
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->personIdent([BI)I

    move-result v0

    if-ltz v0, :cond_9

    add-int/lit8 v1, v0, 0x1

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    aget-byte v2, p1, v0

    if-eq v2, v3, :cond_a

    move v0, v1

    .line 254
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_9
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "invalid committer"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 255
    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    :cond_a
    return-void
.end method

.method public checkPathSegment([BII)V
    .locals 3
    .parameter "raw"
    .parameter "ptr"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 437
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/ObjectChecker;->scanPathSegment([BII)I

    move-result v0

    .line 438
    .local v0, e:I
    if-ge v0, p3, :cond_0

    aget-byte v1, p1, v0

    if-nez v1, :cond_0

    .line 439
    new-instance v1, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v2, "name contains byte 0x00"

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 440
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkPathSegment2([BII)V

    .line 441
    return-void
.end method

.method public checkTag([B)V
    .locals 4
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/16 v3, 0xa

    .line 266
    const/4 v0, 0x0

    .line 268
    .local v0, ptr:I
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->object:[B

    invoke-static {p1, v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    if-gez v0, :cond_0

    .line 269
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "no object header"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 270
    :cond_0
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->id([BI)I

    move-result v0

    if-ltz v0, :cond_1

    add-int/lit8 v1, v0, 0x1

    .end local v0           #ptr:I
    .local v1, ptr:I
    aget-byte v2, p1, v0

    if-eq v2, v3, :cond_2

    move v0, v1

    .line 271
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "invalid object"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 273
    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    :cond_2
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->type:[B

    invoke-static {p1, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    if-gez v0, :cond_3

    .line 274
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "no type header"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 275
    :cond_3
    invoke-static {p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    .line 277
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->tag:[B

    invoke-static {p1, v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    if-gez v0, :cond_4

    .line 278
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "no tag header"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 279
    :cond_4
    invoke-static {p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    .line 281
    sget-object v2, Lorg/eclipse/jgit/lib/ObjectChecker;->tagger:[B

    invoke-static {p1, v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    if-lez v0, :cond_7

    .line 282
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectChecker;->personIdent([BI)I

    move-result v0

    if-ltz v0, :cond_5

    add-int/lit8 v1, v0, 0x1

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    aget-byte v2, p1, v0

    if-eq v2, v3, :cond_6

    move v0, v1

    .line 283
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_5
    new-instance v2, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v3, "invalid tagger"

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    :cond_6
    move v0, v1

    .line 285
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_7
    return-void
.end method

.method public checkTree([B)V
    .locals 14
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x30

    .line 353
    array-length v11, p1

    .line 354
    .local v11, sz:I
    const/4 v5, 0x0

    .line 355
    .local v5, ptr:I
    const/4 v1, 0x0

    .local v1, lastNameB:I
    const/4 v2, 0x0

    .local v2, lastNameE:I
    const/4 v3, 0x0

    .line 356
    .local v3, lastMode:I
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->windows:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->macosx:Z

    if-eqz v0, :cond_2

    :cond_0
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 360
    .local v9, normalized:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    :goto_0
    if-ge v5, v11, :cond_e

    .line 361
    const/4 v6, 0x0

    .local v6, thisMode:I
    move v10, v5

    .line 363
    .end local v5           #ptr:I
    .local v10, ptr:I
    :goto_1
    if-ne v10, v11, :cond_3

    .line 364
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "truncated in mode"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 356
    .end local v6           #thisMode:I
    .end local v9           #normalized:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v10           #ptr:I
    .restart local v5       #ptr:I
    :cond_2
    const/4 v9, 0x0

    goto :goto_0

    .line 365
    .end local v5           #ptr:I
    .restart local v6       #thisMode:I
    .restart local v9       #normalized:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v10       #ptr:I
    :cond_3
    add-int/lit8 v5, v10, 0x1

    .end local v10           #ptr:I
    .restart local v5       #ptr:I
    aget-byte v7, p1, v10

    .line 366
    .local v7, c:B
    const/16 v0, 0x20

    if-ne v0, v7, :cond_4

    .line 376
    invoke-static {v6}, Lorg/eclipse/jgit/lib/FileMode;->fromBits(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v0

    const/4 v12, -0x1

    if-ne v0, v12, :cond_8

    .line 377
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "invalid mode "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 368
    :cond_4
    if-lt v7, v13, :cond_5

    const/16 v0, 0x37

    if-le v7, v0, :cond_6

    .line 369
    :cond_5
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "invalid mode character"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 370
    :cond_6
    if-nez v6, :cond_7

    if-ne v7, v13, :cond_7

    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->allowZeroMode:Z

    if-nez v0, :cond_7

    .line 371
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "mode starts with \'0\'"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 372
    :cond_7
    shl-int/lit8 v6, v6, 0x3

    .line 373
    add-int/lit8 v0, v7, -0x30

    add-int/2addr v6, v0

    move v10, v5

    .line 374
    .end local v5           #ptr:I
    .restart local v10       #ptr:I
    goto :goto_1

    .line 379
    .end local v10           #ptr:I
    .restart local v5       #ptr:I
    :cond_8
    move v4, v5

    .line 380
    .local v4, thisNameB:I
    invoke-direct {p0, p1, v5, v11}, Lorg/eclipse/jgit/lib/ObjectChecker;->scanPathSegment([BII)I

    move-result v5

    .line 381
    if-eq v5, v11, :cond_9

    aget-byte v0, p1, v5

    if-eqz v0, :cond_a

    .line 382
    :cond_9
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "truncated in name"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 383
    :cond_a
    invoke-direct {p0, p1, v4, v5}, Lorg/eclipse/jgit/lib/ObjectChecker;->checkPathSegment2([BII)V

    .line 384
    if-eqz v9, :cond_b

    .line 385
    invoke-direct {p0, p1, v4, v5}, Lorg/eclipse/jgit/lib/ObjectChecker;->normalize([BII)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 386
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "duplicate entry names"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 387
    :cond_b
    invoke-static {p1, v4, v5}, Lorg/eclipse/jgit/lib/ObjectChecker;->duplicateName([BII)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 388
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "duplicate entry names"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 390
    :cond_c
    if-eqz v1, :cond_d

    move-object v0, p1

    .line 391
    invoke-static/range {v0 .. v6}, Lorg/eclipse/jgit/lib/ObjectChecker;->pathCompare([BIIIIII)I

    move-result v8

    .line 393
    .local v8, cmp:I
    if-lez v8, :cond_d

    .line 394
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "incorrectly sorted"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 397
    .end local v8           #cmp:I
    :cond_d
    move v1, v4

    .line 398
    move v2, v5

    .line 399
    move v3, v6

    .line 401
    add-int/lit8 v5, v5, 0x15

    .line 402
    if-le v5, v11, :cond_1

    .line 403
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v12, "truncated in object id"

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 405
    .end local v4           #thisNameB:I
    .end local v6           #thisMode:I
    .end local v7           #c:B
    :cond_e
    return-void
.end method

.method public setAllowLeadingZeroFileMode(Z)Lorg/eclipse/jgit/lib/ObjectChecker;
    .locals 0
    .parameter "allow"

    .prologue
    .line 123
    iput-boolean p1, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->allowZeroMode:Z

    .line 124
    return-object p0
.end method

.method public setSafeForMacOS(Z)Lorg/eclipse/jgit/lib/ObjectChecker;
    .locals 0
    .parameter "mac"

    .prologue
    .line 152
    iput-boolean p1, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->macosx:Z

    .line 153
    return-object p0
.end method

.method public setSafeForWindows(Z)Lorg/eclipse/jgit/lib/ObjectChecker;
    .locals 0
    .parameter "win"

    .prologue
    .line 137
    iput-boolean p1, p0, Lorg/eclipse/jgit/lib/ObjectChecker;->windows:Z

    .line 138
    return-object p0
.end method
