.class public Lorg/eclipse/jgit/revwalk/ObjectWalk;
.super Lorg/eclipse/jgit/revwalk/RevWalk;
.source "ObjectWalk.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/ObjectWalk$1;,
        Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    }
.end annotation


# static fields
.field private static final ID_SZ:I = 0x14

.field private static final IN_PENDING:I = 0x8

.field private static final TYPE_FILE:I = 0x8

.field private static final TYPE_GITLINK:I = 0xe

.field private static final TYPE_SHIFT:I = 0xc

.field private static final TYPE_SYMLINK:I = 0xa

.field private static final TYPE_TREE:I = 0x4


# instance fields
.field private boundary:Z

.field private currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

.field private firstCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private freeVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

.field private lastCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private pathBuf:[B

.field private pathLen:I

.field private pendingObjects:Lorg/eclipse/jgit/revwalk/BlockObjQueue;

.field private rootObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 1
    .parameter "or"

    .prologue
    .line 135
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 136
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->rootObjects:Ljava/util/List;

    .line 137
    new-instance v0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pendingObjects:Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    .line 138
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    .line 139
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 123
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 124
    return-void
.end method

.method private addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "o"

    .prologue
    .line 659
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    and-int/lit8 v0, v0, 0x8

    if-nez v0, :cond_0

    .line 660
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 661
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->rootObjects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 662
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pendingObjects:Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->add(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 664
    :cond_0
    return-void
.end method

.method private enterTree(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 2
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->newTreeVisit(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    move-result-object v0

    .line 391
    .local v0, tv:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    iput-object v1, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 392
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 393
    return-object p1
.end method

.method private static findObjectId([BI)I
    .locals 2
    .parameter "buf"
    .parameter "ptr"

    .prologue
    .line 400
    :cond_0
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_1

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .line 418
    .end local p1
    .local v0, ptr:I
    :goto_0
    return v0

    .line 401
    .end local v0           #ptr:I
    .restart local p1
    :cond_1
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_2

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 402
    .end local v0           #ptr:I
    .restart local p1
    :cond_2
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_3

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 403
    .end local v0           #ptr:I
    .restart local p1
    :cond_3
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_4

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 405
    .end local v0           #ptr:I
    .restart local p1
    :cond_4
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_5

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 406
    .end local v0           #ptr:I
    .restart local p1
    :cond_5
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_6

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 407
    .end local v0           #ptr:I
    .restart local p1
    :cond_6
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_7

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 408
    .end local v0           #ptr:I
    .restart local p1
    :cond_7
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_8

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 410
    .end local v0           #ptr:I
    .restart local p1
    :cond_8
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_9

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 411
    .end local v0           #ptr:I
    .restart local p1
    :cond_9
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_a

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 412
    .end local v0           #ptr:I
    .restart local p1
    :cond_a
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_b

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 413
    .end local v0           #ptr:I
    .restart local p1
    :cond_b
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_c

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 415
    .end local v0           #ptr:I
    .restart local p1
    :cond_c
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_d

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 416
    .end local v0           #ptr:I
    .restart local p1
    :cond_d
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_e

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto/16 :goto_0

    .line 417
    .end local v0           #ptr:I
    .restart local p1
    :cond_e
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_f

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto/16 :goto_0

    .line 418
    .end local v0           #ptr:I
    .restart local p1
    :cond_f
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    if-nez v1, :cond_0

    add-int/lit8 p1, p1, 0x1

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto/16 :goto_0
.end method

.method private growPathBuf(I)V
    .locals 3
    .parameter "ptr"

    .prologue
    const/4 v2, 0x0

    .line 628
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    new-array v0, v1, [B

    .line 629
    .local v0, newBuf:[B
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    invoke-static {v1, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 630
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    .line 631
    return-void
.end method

.method private markTreeUninteresting(Lorg/eclipse/jgit/revwalk/RevTree;)V
    .locals 13
    .parameter "tree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 669
    iget v4, p1, Lorg/eclipse/jgit/revwalk/RevTree;->flags:I

    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_1

    .line 713
    :cond_0
    return-void

    .line 671
    :cond_1
    iget v4, p1, Lorg/eclipse/jgit/revwalk/RevTree;->flags:I

    or-int/lit8 v4, v4, 0x4

    iput v4, p1, Lorg/eclipse/jgit/revwalk/RevTree;->flags:I

    .line 673
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v4, p1, v12}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v3

    .line 674
    .local v3, raw:[B
    const/4 v2, 0x0

    .local v2, ptr:I
    :goto_0
    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 675
    aget-byte v0, v3, v2

    .line 676
    .local v0, c:B
    add-int/lit8 v1, v0, -0x30

    .line 678
    .local v1, mode:I
    :goto_1
    add-int/lit8 v2, v2, 0x1

    aget-byte v0, v3, v2

    .line 679
    const/16 v4, 0x20

    if-ne v4, v0, :cond_3

    .line 684
    :cond_2
    add-int/lit8 v2, v2, 0x1

    aget-byte v4, v3, v2

    if-nez v4, :cond_2

    .line 687
    add-int/lit8 v2, v2, 0x1

    .line 689
    ushr-int/lit8 v4, v1, 0xc

    sparse-switch v4, :sswitch_data_0

    .line 705
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v4, v3, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 706
    new-instance v4, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidMode3:Ljava/lang/String;

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "%o"

    new-array v8, v11, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/MutableObjectId;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v11

    const-string v7, ""

    aput-object v7, v6, v12

    const/4 v7, 0x3

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 681
    :cond_3
    shl-int/lit8 v1, v1, 0x3

    .line 682
    add-int/lit8 v4, v0, -0x30

    add-int/2addr v1, v4

    goto :goto_1

    .line 692
    :sswitch_0
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v4, v3, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 693
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->lookupBlob(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevBlob;

    move-result-object v4

    iget v5, v4, Lorg/eclipse/jgit/revwalk/RevBlob;->flags:I

    or-int/lit8 v5, v5, 0x4

    iput v5, v4, Lorg/eclipse/jgit/revwalk/RevBlob;->flags:I

    .line 711
    :goto_2
    :sswitch_1
    add-int/lit8 v2, v2, 0x14

    .line 712
    goto :goto_0

    .line 697
    :sswitch_2
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v4, v3, v2}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 698
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->lookupTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markTreeUninteresting(Lorg/eclipse/jgit/revwalk/RevTree;)V

    goto :goto_2

    .line 689
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_2
        0x8 -> :sswitch_0
        0xa -> :sswitch_0
        0xe -> :sswitch_1
    .end sparse-switch
.end method

.method private newTreeVisit(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    .locals 3
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 717
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->freeVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 718
    .local v0, tv:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    if-eqz v0, :cond_0

    .line 719
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->freeVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 720
    iput v2, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->ptr:I

    .line 721
    iput v2, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->namePtr:I

    .line 722
    iput v2, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->nameEnd:I

    .line 723
    iput v2, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->pathLen:I

    .line 727
    :goto_0
    iput-object p1, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->obj:Lorg/eclipse/jgit/revwalk/RevObject;

    .line 728
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    const/4 v2, 0x2

    invoke-virtual {v1, p1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->buf:[B

    .line 729
    return-object v0

    .line 725
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .end local v0           #tv:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;-><init>(Lorg/eclipse/jgit/revwalk/ObjectWalk$1;)V

    .restart local v0       #tv:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    goto :goto_0
.end method

.method private static parseMode([BIILorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I
    .locals 4
    .parameter "buf"
    .parameter "startPtr"
    .parameter "recEndPtr"
    .parameter "tv"

    .prologue
    const/16 v3, 0x20

    .line 423
    aget-byte v2, p0, p1

    add-int/lit8 v1, v2, -0x30

    .line 425
    .local v1, mode:I
    :goto_0
    add-int/lit8 p1, p1, 0x1

    aget-byte v0, p0, p1

    .line 426
    .local v0, c:B
    if-ne v3, v0, :cond_1

    .line 468
    :cond_0
    iput p2, p3, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->ptr:I

    .line 469
    add-int/lit8 v2, p1, 0x1

    iput v2, p3, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->namePtr:I

    .line 470
    add-int/lit8 v2, p2, -0x15

    iput v2, p3, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->nameEnd:I

    .line 471
    return v1

    .line 428
    :cond_1
    shl-int/lit8 v1, v1, 0x3

    .line 429
    add-int/lit8 v2, v0, -0x30

    add-int/2addr v1, v2

    .line 431
    add-int/lit8 p1, p1, 0x1

    aget-byte v0, p0, p1

    .line 432
    if-eq v3, v0, :cond_0

    .line 434
    shl-int/lit8 v1, v1, 0x3

    .line 435
    add-int/lit8 v2, v0, -0x30

    add-int/2addr v1, v2

    .line 437
    add-int/lit8 p1, p1, 0x1

    aget-byte v0, p0, p1

    .line 438
    if-eq v3, v0, :cond_0

    .line 440
    shl-int/lit8 v1, v1, 0x3

    .line 441
    add-int/lit8 v2, v0, -0x30

    add-int/2addr v1, v2

    .line 443
    add-int/lit8 p1, p1, 0x1

    aget-byte v0, p0, p1

    .line 444
    if-eq v3, v0, :cond_0

    .line 446
    shl-int/lit8 v1, v1, 0x3

    .line 447
    add-int/lit8 v2, v0, -0x30

    add-int/2addr v1, v2

    .line 449
    add-int/lit8 p1, p1, 0x1

    aget-byte v0, p0, p1

    .line 450
    if-eq v3, v0, :cond_0

    .line 452
    shl-int/lit8 v1, v1, 0x3

    .line 453
    add-int/lit8 v2, v0, -0x30

    add-int/2addr v1, v2

    .line 455
    add-int/lit8 p1, p1, 0x1

    aget-byte v0, p0, p1

    .line 456
    if-eq v3, v0, :cond_0

    .line 458
    shl-int/lit8 v1, v1, 0x3

    .line 459
    add-int/lit8 v2, v0, -0x30

    add-int/2addr v1, v2

    .line 461
    add-int/lit8 p1, p1, 0x1

    aget-byte v0, p0, p1

    .line 462
    if-eq v3, v0, :cond_0

    .line 464
    shl-int/lit8 v1, v1, 0x3

    .line 465
    add-int/lit8 v2, v0, -0x30

    add-int/2addr v1, v2

    .line 466
    goto :goto_0
.end method

.method private releaseTreeVisit(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)V
    .locals 1
    .parameter "tv"

    .prologue
    .line 733
    const/4 v0, 0x0

    iput-object v0, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->buf:[B

    .line 734
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->freeVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    iput-object v0, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 735
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->freeVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 736
    return-void
.end method

.method private updatePathBuf(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I
    .locals 8
    .parameter "tv"

    .prologue
    .line 599
    if-nez p1, :cond_0

    .line 600
    const/4 v0, 0x0

    .line 624
    :goto_0
    return v0

    .line 604
    :cond_0
    iget v1, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->nameEnd:I

    .line 605
    .local v1, nameEnd:I
    if-nez v1, :cond_1

    .line 606
    iget-object v6, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->updatePathBuf(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I

    move-result v0

    goto :goto_0

    .line 608
    :cond_1
    iget v4, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->pathLen:I

    .line 609
    .local v4, ptr:I
    if-nez v4, :cond_4

    .line 610
    iget-object v6, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->updatePathBuf(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I

    move-result v4

    .line 611
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    array-length v6, v6

    if-ne v4, v6, :cond_2

    .line 612
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->growPathBuf(I)V

    .line 613
    :cond_2
    if-eqz v4, :cond_3

    .line 614
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    add-int/lit8 v5, v4, 0x1

    .end local v4           #ptr:I
    .local v5, ptr:I
    const/16 v7, 0x2f

    aput-byte v7, v6, v4

    move v4, v5

    .line 615
    .end local v5           #ptr:I
    .restart local v4       #ptr:I
    :cond_3
    iput v4, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->pathLen:I

    .line 618
    :cond_4
    iget v3, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->namePtr:I

    .line 619
    .local v3, namePtr:I
    sub-int v2, v1, v3

    .line 620
    .local v2, nameLen:I
    add-int v0, v4, v2

    .line 621
    .local v0, end:I
    :goto_1
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    array-length v6, v6

    if-ge v6, v0, :cond_5

    .line 622
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->growPathBuf(I)V

    goto :goto_1

    .line 623
    :cond_5
    iget-object v6, p1, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->buf:[B

    iget-object v7, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    invoke-static {v6, v3, v7, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method


# virtual methods
.method public checkConnectivity()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 499
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 500
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_0

    .line 504
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->nextObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 505
    .local v1, o:Lorg/eclipse/jgit/revwalk/RevObject;
    if-nez v1, :cond_2

    .line 510
    return-void

    .line 507
    :cond_2
    instance-of v2, v1, Lorg/eclipse/jgit/revwalk/RevBlob;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 508
    new-instance v2, Lorg/eclipse/jgit/errors/MissingObjectException;

    const/4 v3, 0x3

    invoke-direct {v2, v1, v3}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v2
.end method

.method public dispose()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 635
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    .line 636
    new-instance v0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pendingObjects:Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    .line 637
    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->firstCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 638
    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->lastCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 639
    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 640
    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->freeVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 641
    return-void
.end method

.method public getPathBuffer()[B
    .locals 1

    .prologue
    .line 586
    iget v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    if-nez v0, :cond_0

    .line 587
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->updatePathBuf(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    .line 588
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    return-object v0
.end method

.method public getPathHashCode()I
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 543
    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 544
    .local v5, tv:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    if-nez v5, :cond_1

    .line 581
    :cond_0
    return v2

    .line 547
    :cond_1
    iget v3, v5, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->nameEnd:I

    .line 548
    .local v3, nameEnd:I
    if-nez v3, :cond_2

    .line 553
    iget-object v5, v5, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 554
    if-eqz v5, :cond_0

    .line 556
    iget v3, v5, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->nameEnd:I

    .line 562
    :cond_2
    const/16 v6, 0x10

    iget v7, v5, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->namePtr:I

    sub-int v7, v3, v7

    if-gt v6, v7, :cond_4

    .line 563
    iget-object v0, v5, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->buf:[B

    .line 564
    .local v0, buf:[B
    add-int/lit8 v4, v3, -0x10

    .line 575
    .local v4, ptr:I
    :goto_0
    const/4 v2, 0x0

    .line 576
    .local v2, hash:I
    :goto_1
    if-ge v4, v3, :cond_0

    .line 577
    aget-byte v1, v0, v4

    .line 578
    .local v1, c:B
    const/16 v6, 0x20

    if-eq v1, v6, :cond_3

    .line 579
    ushr-int/lit8 v6, v2, 0x2

    shl-int/lit8 v7, v1, 0x18

    add-int v2, v6, v7

    .line 576
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 566
    .end local v0           #buf:[B
    .end local v1           #c:B
    .end local v2           #hash:I
    .end local v4           #ptr:I
    :cond_4
    iget v3, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    .line 567
    if-nez v3, :cond_5

    .line 568
    iget-object v6, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->updatePathBuf(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I

    move-result v3

    .line 569
    iput v3, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    .line 571
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    .line 572
    .restart local v0       #buf:[B
    add-int/lit8 v6, v3, -0x10

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .restart local v4       #ptr:I
    goto :goto_0
.end method

.method public getPathLength()I
    .locals 1

    .prologue
    .line 593
    iget v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    if-nez v0, :cond_0

    .line 594
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->updatePathBuf(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    .line 595
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    return v0
.end method

.method public getPathString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 526
    iget v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    if-nez v0, :cond_0

    .line 527
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->updatePathBuf(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    .line 528
    iget v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    if-nez v0, :cond_0

    .line 529
    const/4 v0, 0x0

    .line 531
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathBuf:[B

    const/4 v1, 0x0

    iget v2, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "o"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    :goto_0
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v0, :cond_0

    .line 177
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 178
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object p1

    .line 179
    .restart local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0

    .line 182
    :cond_0
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v0, :cond_1

    .line 183
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local p1
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 186
    :goto_1
    return-void

    .line 185
    .restart local p1
    :cond_1
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_1
.end method

.method public markUninteresting(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 2
    .parameter "o"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    :goto_0
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v0, :cond_1

    .line 227
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 228
    iget-boolean v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    if-eqz v0, :cond_0

    .line 229
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 230
    :cond_0
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object p1

    .line 231
    .restart local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0

    .line 234
    :cond_1
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v0, :cond_3

    move-object v0, p1

    .line 235
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-super {p0, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 241
    :goto_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    iget-boolean v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    if-eqz v0, :cond_2

    .line 242
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 243
    :cond_2
    return-void

    .line 236
    :cond_3
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevTree;

    if-eqz v0, :cond_4

    move-object v0, p1

    .line 237
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevTree;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markTreeUninteresting(Lorg/eclipse/jgit/revwalk/RevTree;)V

    goto :goto_1

    .line 239
    :cond_4
    iget v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    goto :goto_1
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 262
    .local v0, r:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_2

    .line 263
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->firstCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v1, :cond_1

    .line 264
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->firstCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget-object v3, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->lastCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v1, p0, v2, v3}, Lorg/eclipse/jgit/lib/ObjectReader;->walkAdviceBeginTrees(Lorg/eclipse/jgit/revwalk/ObjectWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 265
    :cond_1
    const/4 v0, 0x0

    .line 277
    .end local v0           #r:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_0
    return-object v0

    .line 267
    .restart local v0       #r:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_2
    iget v1, v0, Lorg/eclipse/jgit/revwalk/RevCommit;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_3

    .line 268
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markTreeUninteresting(Lorg/eclipse/jgit/revwalk/RevTree;)V

    .line 269
    iget-boolean v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    if-eqz v1, :cond_0

    goto :goto_0

    .line 273
    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->firstCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v1, :cond_4

    .line 274
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->firstCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 275
    :cond_4
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->lastCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 276
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pendingObjects:Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->add(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0
.end method

.method public nextObject()Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pathLen:I

    .line 299
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 300
    .local v8, tv:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;
    :goto_0
    if-eqz v8, :cond_a

    .line 301
    iget-object v1, v8, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->buf:[B

    .line 302
    .local v1, buf:[B
    iget v6, v8, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->ptr:I

    .local v6, ptr:I
    :cond_0
    :sswitch_0
    array-length v9, v1

    if-ge v6, v9, :cond_8

    .line 303
    move v7, v6

    .line 304
    .local v7, startPtr:I
    invoke-static {v1, v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->findObjectId([BI)I

    move-result v6

    .line 305
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v9, v1, v6}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 306
    add-int/lit8 v6, v6, 0x14

    .line 308
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v9, v10}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 309
    .local v5, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v5, :cond_1

    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    and-int/lit8 v9, v9, 0x2

    if-nez v9, :cond_0

    .line 312
    :cond_1
    invoke-static {v1, v7, v6, v8}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseMode([BIILorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)I

    move-result v3

    .line 314
    .local v3, mode:I
    ushr-int/lit8 v9, v3, 0xc

    sparse-switch v9, :sswitch_data_0

    .line 352
    new-instance v9, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidMode3:Ljava/lang/String;

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string v13, "%o"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v13}, Lorg/eclipse/jgit/lib/MutableObjectId;->name()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    iget v13, v8, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->namePtr:I

    iget v14, v8, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->nameEnd:I

    invoke-static {v1, v13, v14}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x3

    iget-object v13, v8, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->obj:Lorg/eclipse/jgit/revwalk/RevObject;

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 317
    :sswitch_1
    if-nez v5, :cond_3

    .line 318
    new-instance v5, Lorg/eclipse/jgit/revwalk/RevBlob;

    .end local v5           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v5, v9}, Lorg/eclipse/jgit/revwalk/RevBlob;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 319
    .restart local v5       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    const/4 v9, 0x2

    iput v9, v5, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 320
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v9, v5}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 383
    .end local v1           #buf:[B
    .end local v3           #mode:I
    .end local v5           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v6           #ptr:I
    .end local v7           #startPtr:I
    :cond_2
    :goto_1
    return-object v5

    .line 323
    .restart local v1       #buf:[B
    .restart local v3       #mode:I
    .restart local v5       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    .restart local v6       #ptr:I
    .restart local v7       #startPtr:I
    :cond_3
    instance-of v9, v5, Lorg/eclipse/jgit/revwalk/RevBlob;

    if-nez v9, :cond_4

    .line 324
    new-instance v9, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    const/4 v10, 0x3

    invoke-direct {v9, v5, v10}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v9

    .line 325
    :cond_4
    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v2, v9, 0x2

    .local v2, flags:I
    iput v2, v5, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 326
    and-int/lit8 v9, v2, 0x4

    if-eqz v9, :cond_2

    .line 328
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    if-eqz v9, :cond_0

    goto :goto_1

    .line 333
    .end local v2           #flags:I
    :sswitch_2
    if-nez v5, :cond_5

    .line 334
    new-instance v5, Lorg/eclipse/jgit/revwalk/RevTree;

    .end local v5           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v5, v9}, Lorg/eclipse/jgit/revwalk/RevTree;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 335
    .restart local v5       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    const/4 v9, 0x2

    iput v9, v5, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 336
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v9, v5}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 337
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->enterTree(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    goto :goto_1

    .line 339
    :cond_5
    instance-of v9, v5, Lorg/eclipse/jgit/revwalk/RevTree;

    if-nez v9, :cond_6

    .line 340
    new-instance v9, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    const/4 v10, 0x2

    invoke-direct {v9, v5, v10}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v9

    .line 341
    :cond_6
    iget v9, v5, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v2, v9, 0x2

    .restart local v2       #flags:I
    iput v2, v5, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 342
    and-int/lit8 v9, v2, 0x4

    if-nez v9, :cond_7

    .line 343
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->enterTree(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    goto :goto_1

    .line 344
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    if-eqz v9, :cond_0

    .line 345
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->enterTree(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    goto :goto_1

    .line 361
    .end local v2           #flags:I
    .end local v3           #mode:I
    .end local v5           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v7           #startPtr:I
    :cond_8
    iget-object v9, v8, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    move-object/from16 v0, p0

    iput-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 362
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->releaseTreeVisit(Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;)V

    .line 363
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 364
    goto/16 :goto_0

    .line 372
    .end local v1           #buf:[B
    .end local v6           #ptr:I
    .local v4, o:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_9
    iget v2, v4, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 373
    .restart local v2       #flags:I
    and-int/lit8 v9, v2, 0x2

    if-eqz v9, :cond_b

    .line 367
    .end local v2           #flags:I
    .end local v4           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_a
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pendingObjects:Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->next()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    .line 368
    .restart local v4       #o:Lorg/eclipse/jgit/revwalk/RevObject;
    if-nez v4, :cond_9

    .line 369
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/ObjectReader;->walkAdviceEnd()V

    .line 370
    const/4 v5, 0x0

    goto/16 :goto_1

    .line 375
    .restart local v2       #flags:I
    :cond_b
    or-int/lit8 v2, v2, 0x2

    .line 376
    iput v2, v4, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    .line 377
    and-int/lit8 v9, v2, 0x4

    if-nez v9, :cond_d

    const/4 v9, 0x1

    :goto_2
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    or-int/2addr v9, v10

    if-eqz v9, :cond_a

    .line 378
    instance-of v9, v4, Lorg/eclipse/jgit/revwalk/RevTree;

    if-eqz v9, :cond_c

    .line 379
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->newTreeVisit(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    move-result-object v8

    .line 380
    const/4 v9, 0x0

    iput-object v9, v8, Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;->parent:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 381
    move-object/from16 v0, p0

    iput-object v8, v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    :cond_c
    move-object v5, v4

    .line 383
    goto/16 :goto_1

    .line 377
    :cond_d
    const/4 v9, 0x0

    goto :goto_2

    .line 314
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_2
        0x8 -> :sswitch_1
        0xa -> :sswitch_1
        0xe -> :sswitch_0
    .end sparse-switch
.end method

.method protected reset(I)V
    .locals 4
    .parameter "retainFlags"

    .prologue
    const/4 v3, 0x0

    .line 645
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset(I)V

    .line 647
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->rootObjects:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 648
    .local v1, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    iget v2, v1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    and-int/lit8 v2, v2, -0x9

    iput v2, v1, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    goto :goto_0

    .line 650
    .end local v1           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->rootObjects:Ljava/util/List;

    .line 651
    new-instance v2, Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    invoke-direct {v2}, Lorg/eclipse/jgit/revwalk/BlockObjQueue;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->pendingObjects:Lorg/eclipse/jgit/revwalk/BlockObjQueue;

    .line 652
    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->firstCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 653
    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->lastCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 654
    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->currVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 655
    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->freeVisit:Lorg/eclipse/jgit/revwalk/ObjectWalk$TreeVisit;

    .line 656
    return-void
.end method

.method public sort(Lorg/eclipse/jgit/revwalk/RevSort;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 247
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;)V

    .line 248
    sget-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->hasRevSort(Lorg/eclipse/jgit/revwalk/RevSort;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    .line 249
    return-void
.end method

.method public sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V
    .locals 1
    .parameter "s"
    .parameter "use"

    .prologue
    .line 253
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V

    .line 254
    sget-object v0, Lorg/eclipse/jgit/revwalk/RevSort;->BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->hasRevSort(Lorg/eclipse/jgit/revwalk/RevSort;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/revwalk/ObjectWalk;->boundary:Z

    .line 255
    return-void
.end method
