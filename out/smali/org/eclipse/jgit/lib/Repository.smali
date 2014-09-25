.class public abstract Lorg/eclipse/jgit/lib/Repository;
.super Ljava/lang/Object;
.source "Repository.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final globalListeners:Lorg/eclipse/jgit/events/ListenerList;


# instance fields
.field private final fs:Lorg/eclipse/jgit/util/FS;

.field private final gitDir:Ljava/io/File;

.field private final indexFile:Ljava/io/File;

.field private final myListeners:Lorg/eclipse/jgit/events/ListenerList;

.field private final useCnt:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final workTree:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 103
    const-class v0, Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/eclipse/jgit/lib/Repository;->$assertionsDisabled:Z

    .line 104
    new-instance v0, Lorg/eclipse/jgit/events/ListenerList;

    invoke-direct {v0}, Lorg/eclipse/jgit/events/ListenerList;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/lib/Repository;->globalListeners:Lorg/eclipse/jgit/events/ListenerList;

    return-void

    .line 103
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V
    .locals 2
    .parameter "options"

    .prologue
    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->useCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 119
    new-instance v0, Lorg/eclipse/jgit/events/ListenerList;

    invoke-direct {v0}, Lorg/eclipse/jgit/events/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->myListeners:Lorg/eclipse/jgit/events/ListenerList;

    .line 134
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->gitDir:Ljava/io/File;

    .line 135
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->fs:Lorg/eclipse/jgit/util/FS;

    .line 136
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->workTree:Ljava/io/File;

    .line 137
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getIndexFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->indexFile:Ljava/io/File;

    .line 138
    return-void
.end method

.method public static getGlobalListenerList()Lorg/eclipse/jgit/events/ListenerList;
    .locals 1

    .prologue
    .line 108
    sget-object v0, Lorg/eclipse/jgit/lib/Repository;->globalListeners:Lorg/eclipse/jgit/events/ListenerList;

    return-object v0
.end method

.method static gitInternalSlash([B)[B
    .locals 4
    .parameter "bytes"

    .prologue
    const/16 v3, 0x2f

    .line 1057
    sget-char v1, Ljava/io/File;->separatorChar:C

    if-ne v1, v3, :cond_1

    .line 1062
    :cond_0
    return-object p0

    .line 1059
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 1060
    aget-byte v1, p0, v0

    sget-char v2, Ljava/io/File;->separatorChar:C

    if-ne v1, v2, :cond_2

    .line 1061
    aput-byte v3, p0, v0

    .line 1059
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static isAllHex(Ljava/lang/String;I)Z
    .locals 2
    .parameter "str"
    .parameter "ptr"

    .prologue
    .line 720
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 721
    add-int/lit8 v0, p1, 0x1

    .end local p1
    .local v0, ptr:I
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Repository;->isHex(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 722
    const/4 v1, 0x0

    move p1, v0

    .line 724
    .end local v0           #ptr:I
    .restart local p1
    :goto_1
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_1

    .end local p1
    .restart local v0       #ptr:I
    :cond_1
    move p1, v0

    .end local v0           #ptr:I
    .restart local p1
    goto :goto_0
.end method

.method private static isHex(C)Z
    .locals 1
    .parameter "c"

    .prologue
    .line 714
    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v0, 0x39

    if-le p0, v0, :cond_2

    :cond_0
    const/16 v0, 0x61

    if-gt v0, p0, :cond_1

    const/16 v0, 0x66

    if-le p0, v0, :cond_2

    :cond_1
    const/16 v0, 0x41

    if-gt v0, p0, :cond_3

    const/16 v0, 0x46

    if-gt p0, v0, :cond_3

    :cond_2
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isValidRefName(Ljava/lang/String;)Z
    .locals 9
    .parameter "refName"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1151
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 1152
    .local v4, len:I
    if-nez v4, :cond_1

    .line 1199
    :cond_0
    :goto_0
    :sswitch_0
    return v7

    .line 1154
    :cond_1
    const-string v8, ".lock"

    invoke-virtual {p0, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1160
    :try_start_0
    invoke-static {p0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkValidPath(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/dircache/InvalidPathException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1165
    const/4 v1, 0x1

    .line 1166
    .local v1, components:I
    const/4 v5, 0x0

    .line 1167
    .local v5, p:C
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v4, :cond_3

    .line 1168
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1169
    .local v0, c:C
    const/16 v8, 0x20

    if-le v0, v8, :cond_0

    .line 1171
    sparse-switch v0, :sswitch_data_0

    .line 1197
    :cond_2
    :goto_2
    move v5, v0

    .line 1167
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1161
    .end local v0           #c:C
    .end local v1           #components:I
    .end local v3           #i:I
    .end local v5           #p:C
    :catch_0
    move-exception v2

    .line 1162
    .local v2, e:Lorg/eclipse/jgit/dircache/InvalidPathException;
    goto :goto_0

    .line 1173
    .end local v2           #e:Lorg/eclipse/jgit/dircache/InvalidPathException;
    .restart local v0       #c:C
    .restart local v1       #components:I
    .restart local v3       #i:I
    .restart local v5       #p:C
    :sswitch_1
    sparse-switch v5, :sswitch_data_1

    .line 1177
    add-int/lit8 v8, v4, -0x1

    if-ne v3, v8, :cond_2

    goto :goto_0

    .line 1181
    :sswitch_2
    if-eqz v3, :cond_0

    add-int/lit8 v8, v4, -0x1

    if-eq v3, v8, :cond_0

    .line 1183
    const/16 v8, 0x2f

    if-eq v5, v8, :cond_0

    .line 1185
    add-int/lit8 v1, v1, 0x1

    .line 1186
    goto :goto_2

    .line 1188
    :sswitch_3
    const/16 v8, 0x40

    if-ne v5, v8, :cond_2

    goto :goto_0

    .line 1199
    .end local v0           #c:C
    :cond_3
    if-le v1, v6, :cond_4

    :goto_3
    move v7, v6

    goto :goto_0

    :cond_4
    move v6, v7

    goto :goto_3

    .line 1171
    :sswitch_data_0
    .sparse-switch
        0x2a -> :sswitch_0
        0x2e -> :sswitch_1
        0x2f -> :sswitch_2
        0x3a -> :sswitch_0
        0x3f -> :sswitch_0
        0x5b -> :sswitch_0
        0x5c -> :sswitch_0
        0x5e -> :sswitch_0
        0x7b -> :sswitch_3
        0x7e -> :sswitch_0
        0x7f -> :sswitch_0
    .end sparse-switch

    .line 1173
    :sswitch_data_1
    .sparse-switch
        0x0 -> :sswitch_0
        0x2e -> :sswitch_0
        0x2f -> :sswitch_0
    .end sparse-switch
.end method

.method private parseSimple(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 2
    .parameter "rw"
    .parameter "revstr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 728
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/lib/Repository;->resolveSimple(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 729
    .local v0, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v0, :cond_0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private readCommitMsgFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "msgFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1541
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v2

    if-nez v2, :cond_1

    .line 1542
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/errors/NoWorkTreeException;

    invoke-direct {v2}, Lorg/eclipse/jgit/errors/NoWorkTreeException;-><init>()V

    throw v2

    .line 1544
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1546
    .local v1, mergeMsgFile:Ljava/io/File;
    :try_start_0
    invoke-static {v1}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 1549
    :goto_0
    return-object v2

    .line 1547
    :catch_0
    move-exception v0

    .line 1549
    .local v0, e:Ljava/io/FileNotFoundException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private readGitDirectoryFile(Ljava/lang/String;)[B
    .locals 5
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1574
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v4

    invoke-direct {v0, v4, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1576
    .local v0, file:Ljava/io/File;
    :try_start_0
    invoke-static {v0}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v2

    .line 1577
    .local v2, raw:[B
    array-length v4, v2
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v4, :cond_0

    .line 1579
    .end local v2           #raw:[B
    :goto_0
    return-object v2

    .restart local v2       #raw:[B
    :cond_0
    move-object v2, v3

    .line 1577
    goto :goto_0

    .line 1578
    .end local v2           #raw:[B
    :catch_0
    move-exception v1

    .local v1, notFound:Ljava/io/FileNotFoundException;
    move-object v2, v3

    .line 1579
    goto :goto_0
.end method

.method private resolve(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Ljava/lang/Object;
    .locals 35
    .parameter "rw"
    .parameter "revstr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v27

    .line 427
    .local v27, revChars:[C
    const/16 v26, 0x0

    .line 428
    .local v26, rev:Lorg/eclipse/jgit/revwalk/RevObject;
    const/16 v18, 0x0

    .line 429
    .local v18, name:Ljava/lang/String;
    const/4 v7, 0x0

    .line 430
    .local v7, done:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v11, v0, :cond_3a

    .line 431
    aget-char v31, v27, v11

    sparse-switch v31, :sswitch_data_0

    .line 695
    if-eqz v26, :cond_2

    .line 696
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 433
    :sswitch_0
    if-nez v26, :cond_3

    .line 434
    if-nez v18, :cond_0

    .line 435
    if-nez v7, :cond_1

    .line 436
    new-instance v18, Ljava/lang/String;

    .end local v18           #name:Ljava/lang/String;
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v7, v11}, Ljava/lang/String;-><init>([CII)V

    .line 441
    .restart local v18       #name:Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/Repository;->parseSimple(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 442
    const/16 v18, 0x0

    .line 443
    if-nez v26, :cond_3

    .line 444
    const/16 v31, 0x0

    .line 710
    :goto_1
    return-object v31

    .line 438
    :cond_1
    add-int/lit8 v7, v11, 0x1

    .line 430
    :cond_2
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 446
    :cond_3
    add-int/lit8 v31, v11, 0x1

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v32, v0

    move/from16 v0, v31

    move/from16 v1, v32

    if-ge v0, v1, :cond_12

    .line 447
    add-int/lit8 v31, v11, 0x1

    aget-char v31, v27, v31

    sparse-switch v31, :sswitch_data_1

    .line 513
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 514
    move-object/from16 v0, v26

    instance-of v0, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    move/from16 v31, v0

    if-eqz v31, :cond_11

    move-object/from16 v4, v26

    .line 515
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 516
    .local v4, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v31

    if-nez v31, :cond_10

    .line 517
    const/16 v26, 0x0

    .line 536
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_3
    add-int/lit8 v7, v11, 0x1

    .line 537
    goto :goto_2

    .line 459
    :sswitch_1
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v26

    .line 460
    add-int/lit8 v14, v11, 0x1

    .local v14, j:I
    :goto_4
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v14, v0, :cond_4

    .line 461
    aget-char v31, v27, v14

    invoke-static/range {v31 .. v31}, Ljava/lang/Character;->isDigit(C)Z

    move-result v31

    if-nez v31, :cond_6

    .line 464
    :cond_4
    new-instance v19, Ljava/lang/String;

    add-int/lit8 v31, v11, 0x1

    sub-int v32, v14, v11

    add-int/lit8 v32, v32, -0x1

    move-object/from16 v0, v19

    move-object/from16 v1, v27

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    .line 468
    .local v19, parentnum:Ljava/lang/String;
    :try_start_0
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v20

    .line 474
    .local v20, pnum:I
    if-eqz v20, :cond_5

    move-object/from16 v4, v26

    .line 475
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 476
    .restart local v4       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v31

    move/from16 v0, v20

    move/from16 v1, v31

    if-le v0, v1, :cond_7

    .line 477
    const/16 v26, 0x0

    .line 481
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_5
    :goto_5
    add-int/lit8 v11, v14, -0x1

    .line 482
    move v7, v14

    .line 483
    goto :goto_3

    .line 460
    .end local v19           #parentnum:Ljava/lang/String;
    .end local v20           #pnum:I
    :cond_6
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 469
    .restart local v19       #parentnum:Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 470
    .local v8, e:Ljava/lang/NumberFormatException;
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v32

    move-object/from16 v0, v32

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->invalidCommitParentNumber:Ljava/lang/String;

    move-object/from16 v32, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v31

    .line 479
    .end local v8           #e:Ljava/lang/NumberFormatException;
    .restart local v4       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v20       #pnum:I
    :cond_7
    add-int/lit8 v31, v20, -0x1

    move/from16 v0, v31

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v26

    goto :goto_5

    .line 486
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v14           #j:I
    .end local v19           #parentnum:Ljava/lang/String;
    .end local v20           #pnum:I
    :sswitch_2
    const/4 v13, 0x0

    .line 487
    .local v13, item:Ljava/lang/String;
    add-int/lit8 v15, v11, 0x2

    .local v15, k:I
    :goto_6
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v15, v0, :cond_8

    .line 488
    aget-char v31, v27, v15

    const/16 v32, 0x7d

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_a

    .line 489
    new-instance v13, Ljava/lang/String;

    .end local v13           #item:Ljava/lang/String;
    add-int/lit8 v31, v11, 0x2

    sub-int v32, v15, v11

    add-int/lit8 v32, v32, -0x2

    move-object/from16 v0, v27

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v13, v0, v1, v2}, Ljava/lang/String;-><init>([CII)V

    .line 493
    .restart local v13       #item:Ljava/lang/String;
    :cond_8
    move v11, v15

    .line 494
    if-eqz v13, :cond_f

    .line 495
    const-string v31, "tree"

    move-object/from16 v0, v31

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_b

    .line 496
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v26

    .line 510
    :cond_9
    :goto_7
    move v7, v15

    .line 511
    goto/16 :goto_3

    .line 487
    :cond_a
    add-int/lit8 v15, v15, 0x1

    goto :goto_6

    .line 497
    :cond_b
    const-string v31, "commit"

    move-object/from16 v0, v31

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_c

    .line 498
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v26

    goto :goto_7

    .line 499
    :cond_c
    const-string v31, "blob"

    move-object/from16 v0, v31

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_d

    .line 500
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 501
    move-object/from16 v0, v26

    instance-of v0, v0, Lorg/eclipse/jgit/revwalk/RevBlob;

    move/from16 v31, v0

    if-nez v31, :cond_9

    .line 502
    new-instance v31, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    const-string v32, "blob"

    move-object/from16 v0, v31

    move-object/from16 v1, v26

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v31

    .line 504
    :cond_d
    const-string v31, ""

    move-object/from16 v0, v31

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_e

    .line 505
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    goto :goto_7

    .line 507
    :cond_e
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 509
    :cond_f
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 519
    .end local v13           #item:Ljava/lang/String;
    .end local v15           #k:I
    .restart local v4       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_10
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v26

    goto/16 :goto_3

    .line 521
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_11
    new-instance v31, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    const-string v32, "commit"

    move-object/from16 v0, v31

    move-object/from16 v1, v26

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v31

    .line 525
    :cond_12
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 526
    move-object/from16 v0, v26

    instance-of v0, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    move/from16 v31, v0

    if-eqz v31, :cond_14

    move-object/from16 v4, v26

    .line 527
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 528
    .restart local v4       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v31

    if-nez v31, :cond_13

    .line 529
    const/16 v26, 0x0

    goto/16 :goto_3

    .line 531
    :cond_13
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v26

    goto/16 :goto_3

    .line 533
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_14
    new-instance v31, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    const-string v32, "commit"

    move-object/from16 v0, v31

    move-object/from16 v1, v26

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v31

    .line 539
    :sswitch_3
    if-nez v26, :cond_17

    .line 540
    if-nez v18, :cond_15

    .line 541
    if-nez v7, :cond_16

    .line 542
    new-instance v18, Ljava/lang/String;

    .end local v18           #name:Ljava/lang/String;
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v7, v11}, Ljava/lang/String;-><init>([CII)V

    .line 547
    .restart local v18       #name:Ljava/lang/String;
    :cond_15
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/Repository;->parseSimple(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 548
    const/16 v18, 0x0

    .line 549
    if-nez v26, :cond_17

    .line 550
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 544
    :cond_16
    add-int/lit8 v7, v11, 0x1

    .line 545
    goto/16 :goto_2

    .line 552
    :cond_17
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 553
    move-object/from16 v0, v26

    instance-of v0, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    move/from16 v31, v0

    if-nez v31, :cond_18

    .line 554
    new-instance v31, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;

    const-string v32, "commit"

    move-object/from16 v0, v31

    move-object/from16 v1, v26

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v31

    .line 557
    :cond_18
    add-int/lit8 v16, v11, 0x1

    .local v16, l:I
    :goto_8
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v16

    move/from16 v1, v31

    if-ge v0, v1, :cond_19

    .line 558
    aget-char v31, v27, v16

    invoke-static/range {v31 .. v31}, Ljava/lang/Character;->isDigit(C)Z

    move-result v31

    if-nez v31, :cond_1b

    .line 562
    :cond_19
    sub-int v31, v16, v11

    const/16 v32, 0x1

    move/from16 v0, v31

    move/from16 v1, v32

    if-le v0, v1, :cond_1c

    .line 563
    new-instance v6, Ljava/lang/String;

    add-int/lit8 v31, v11, 0x1

    sub-int v32, v16, v11

    add-int/lit8 v32, v32, -0x1

    move-object/from16 v0, v27

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v6, v0, v1, v2}, Ljava/lang/String;-><init>([CII)V

    .line 565
    .local v6, distnum:Ljava/lang/String;
    :try_start_1
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v5

    .line 572
    .end local v6           #distnum:Ljava/lang/String;
    .local v5, dist:I
    :goto_9
    if-lez v5, :cond_1a

    move-object/from16 v4, v26

    .line 573
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 574
    .restart local v4       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v31

    if-nez v31, :cond_1d

    .line 575
    const/16 v26, 0x0

    .line 583
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1a
    add-int/lit8 v11, v16, -0x1

    .line 584
    move/from16 v7, v16

    .line 585
    goto/16 :goto_2

    .line 557
    .end local v5           #dist:I
    :cond_1b
    add-int/lit8 v16, v16, 0x1

    goto :goto_8

    .line 566
    .restart local v6       #distnum:Ljava/lang/String;
    :catch_1
    move-exception v8

    .line 567
    .restart local v8       #e:Ljava/lang/NumberFormatException;
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v32

    move-object/from16 v0, v32

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->invalidAncestryLength:Ljava/lang/String;

    move-object/from16 v32, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v31

    .line 571
    .end local v6           #distnum:Ljava/lang/String;
    .end local v8           #e:Ljava/lang/NumberFormatException;
    :cond_1c
    const/4 v5, 0x1

    .restart local v5       #dist:I
    goto :goto_9

    .line 578
    .restart local v4       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1d
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .line 579
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 580
    move-object/from16 v26, v4

    .line 581
    add-int/lit8 v5, v5, -0x1

    .line 582
    goto :goto_9

    .line 587
    .end local v4           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v5           #dist:I
    .end local v16           #l:I
    :sswitch_4
    if-eqz v26, :cond_1e

    .line 588
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 589
    :cond_1e
    add-int/lit8 v31, v11, 0x1

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v32, v0

    move/from16 v0, v31

    move/from16 v1, v32

    if-ge v0, v1, :cond_1f

    add-int/lit8 v31, v11, 0x1

    aget-char v31, v27, v31

    const/16 v32, 0x7b

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_2

    .line 592
    :cond_1f
    const/16 v28, 0x0

    .line 593
    .local v28, time:Ljava/lang/String;
    add-int/lit8 v17, v11, 0x2

    .local v17, m:I
    :goto_a
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v17

    move/from16 v1, v31

    if-ge v0, v1, :cond_20

    .line 594
    aget-char v31, v27, v17

    const/16 v32, 0x7d

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_23

    .line 595
    new-instance v28, Ljava/lang/String;

    .end local v28           #time:Ljava/lang/String;
    add-int/lit8 v31, v11, 0x2

    sub-int v32, v17, v11

    add-int/lit8 v32, v32, -0x2

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    .line 599
    .restart local v28       #time:Ljava/lang/String;
    :cond_20
    if-eqz v28, :cond_33

    .line 600
    const-string v31, "upstream"

    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_29

    .line 601
    if-nez v18, :cond_21

    .line 602
    new-instance v18, Ljava/lang/String;

    .end local v18           #name:Ljava/lang/String;
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v7, v11}, Ljava/lang/String;-><init>([CII)V

    .line 603
    .restart local v18       #name:Ljava/lang/String;
    :cond_21
    const-string v31, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_22

    .line 606
    const-string v18, "HEAD"

    .line 607
    :cond_22
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "x/"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_24

    .line 608
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 593
    :cond_23
    add-int/lit8 v17, v17, 0x1

    goto :goto_a

    .line 609
    :cond_24
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v22

    .line 610
    .local v22, ref:Lorg/eclipse/jgit/lib/Ref;
    const/16 v18, 0x0

    .line 611
    if-nez v22, :cond_25

    .line 612
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 613
    :cond_25
    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v31

    if-eqz v31, :cond_26

    .line 614
    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v22

    .line 615
    :cond_26
    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v18

    .line 619
    :try_start_2
    new-instance v25, Lorg/eclipse/jgit/transport/RemoteConfig;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v31

    const-string v32, "origin"

    move-object/from16 v0, v25

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_2

    .line 624
    .local v25, remoteConfig:Lorg/eclipse/jgit/transport/RemoteConfig;
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v31

    const-string v32, "branch"

    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    const-string v34, "merge"

    invoke-virtual/range {v31 .. v34}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 629
    .local v24, remoteBranchName:Ljava/lang/String;
    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/transport/RemoteConfig;->getFetchRefSpecs()Ljava/util/List;

    move-result-object v10

    .line 631
    .local v10, fetchRefSpecs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, i$:Ljava/util/Iterator;
    :cond_27
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v31

    if-eqz v31, :cond_28

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lorg/eclipse/jgit/transport/RefSpec;

    .line 632
    .local v23, refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual/range {v23 .. v24}, Lorg/eclipse/jgit/transport/RefSpec;->matchSource(Ljava/lang/String;)Z

    move-result v31

    if-eqz v31, :cond_27

    .line 633
    invoke-virtual/range {v23 .. v24}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v9

    .line 635
    .local v9, expandFromSource:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v18

    .line 639
    .end local v9           #expandFromSource:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v23           #refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_28
    if-nez v18, :cond_2b

    .line 640
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 621
    .end local v10           #fetchRefSpecs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    .end local v12           #i$:Ljava/util/Iterator;
    .end local v24           #remoteBranchName:Ljava/lang/String;
    .end local v25           #remoteConfig:Lorg/eclipse/jgit/transport/RemoteConfig;
    :catch_2
    move-exception v8

    .line 622
    .local v8, e:Ljava/net/URISyntaxException;
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 641
    .end local v8           #e:Ljava/net/URISyntaxException;
    .end local v22           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_29
    const-string v31, "^-\\d+$"

    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v31

    if-eqz v31, :cond_2d

    .line 642
    if-eqz v18, :cond_2a

    .line 643
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 645
    :cond_2a
    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v31

    neg-int v0, v0

    move/from16 v31, v0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->resolveReflogCheckout(I)Ljava/lang/String;

    move-result-object v21

    .line 647
    .local v21, previousCheckout:Ljava/lang/String;
    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v31

    if-eqz v31, :cond_2c

    .line 648
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/Repository;->parseSimple(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 669
    .end local v21           #previousCheckout:Ljava/lang/String;
    :cond_2b
    :goto_b
    move/from16 v11, v17

    goto/16 :goto_2

    .line 650
    .restart local v21       #previousCheckout:Ljava/lang/String;
    :cond_2c
    move-object/from16 v18, v21

    goto :goto_b

    .line 653
    .end local v21           #previousCheckout:Ljava/lang/String;
    :cond_2d
    if-nez v18, :cond_2e

    .line 654
    new-instance v18, Ljava/lang/String;

    .end local v18           #name:Ljava/lang/String;
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v7, v11}, Ljava/lang/String;-><init>([CII)V

    .line 655
    .restart local v18       #name:Ljava/lang/String;
    :cond_2e
    const-string v31, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_2f

    .line 656
    const-string v18, "HEAD"

    .line 657
    :cond_2f
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "x/"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_30

    .line 658
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 659
    :cond_30
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v22

    .line 660
    .restart local v22       #ref:Lorg/eclipse/jgit/lib/Ref;
    const/16 v18, 0x0

    .line 661
    if-nez v22, :cond_31

    .line 662
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 665
    :cond_31
    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v31

    if-eqz v31, :cond_32

    .line 666
    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v22

    .line 667
    :cond_32
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Repository;->resolveReflog(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/Ref;Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v26

    goto :goto_b

    .line 671
    .end local v22           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_33
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 675
    .end local v17           #m:I
    .end local v28           #time:Ljava/lang/String;
    :sswitch_5
    if-nez v26, :cond_36

    .line 676
    if-nez v18, :cond_34

    .line 677
    new-instance v18, Ljava/lang/String;

    .end local v18           #name:Ljava/lang/String;
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v7, v11}, Ljava/lang/String;-><init>([CII)V

    .line 678
    .restart local v18       #name:Ljava/lang/String;
    :cond_34
    const-string v31, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_35

    .line 679
    const-string v18, "HEAD"

    .line 680
    :cond_35
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/Repository;->parseSimple(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v26

    .line 681
    const/16 v18, 0x0

    .line 683
    :cond_36
    if-nez v26, :cond_37

    .line 684
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 685
    :cond_37
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v29

    .line 686
    .local v29, tree:Lorg/eclipse/jgit/revwalk/RevTree;
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    add-int/lit8 v31, v31, -0x1

    move/from16 v0, v31

    if-ne v11, v0, :cond_38

    .line 687
    invoke-virtual/range {v29 .. v29}, Lorg/eclipse/jgit/revwalk/RevTree;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v31

    goto/16 :goto_1

    .line 689
    :cond_38
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v31

    new-instance v32, Ljava/lang/String;

    add-int/lit8 v33, v11, 0x1

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v34, v0

    sub-int v34, v34, v11

    add-int/lit8 v34, v34, -0x1

    move-object/from16 v0, v32

    move-object/from16 v1, v27

    move/from16 v2, v33

    move/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    const/16 v33, 0x1

    move/from16 v0, v33

    new-array v0, v0, [Lorg/eclipse/jgit/lib/AnyObjectId;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    aput-object v29, v33, v34

    invoke-static/range {v31 .. v33}, Lorg/eclipse/jgit/treewalk/TreeWalk;->forPath(Lorg/eclipse/jgit/lib/ObjectReader;Ljava/lang/String;[Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/TreeWalk;

    move-result-object v30

    .line 692
    .local v30, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    if-eqz v30, :cond_39

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v31

    goto/16 :goto_1

    :cond_39
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 699
    .end local v29           #tree:Lorg/eclipse/jgit/revwalk/RevTree;
    .end local v30           #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_3a
    if-eqz v26, :cond_3b

    .line 700
    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/revwalk/RevObject;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v31

    goto/16 :goto_1

    .line 701
    :cond_3b
    if-eqz v18, :cond_3c

    move-object/from16 v31, v18

    .line 702
    goto/16 :goto_1

    .line 703
    :cond_3c
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v31

    move/from16 v0, v31

    if-ne v7, v0, :cond_3d

    .line 704
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 705
    :cond_3d
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 706
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "x/"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_3e

    .line 707
    new-instance v31, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v31

    .line 708
    :cond_3e
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v31

    if-eqz v31, :cond_3f

    move-object/from16 v31, v18

    .line 709
    goto/16 :goto_1

    .line 710
    :cond_3f
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->resolveSimple(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v31

    goto/16 :goto_1

    .line 431
    :sswitch_data_0
    .sparse-switch
        0x3a -> :sswitch_5
        0x40 -> :sswitch_4
        0x5e -> :sswitch_0
        0x7e -> :sswitch_3
    .end sparse-switch

    .line 447
    :sswitch_data_1
    .sparse-switch
        0x30 -> :sswitch_1
        0x31 -> :sswitch_1
        0x32 -> :sswitch_1
        0x33 -> :sswitch_1
        0x34 -> :sswitch_1
        0x35 -> :sswitch_1
        0x36 -> :sswitch_1
        0x37 -> :sswitch_1
        0x38 -> :sswitch_1
        0x39 -> :sswitch_1
        0x7b -> :sswitch_2
    .end sparse-switch
.end method

.method private resolveAbbreviation(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 5
    .parameter "revstr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/AmbiguousObjectException;
        }
    .end annotation

    .prologue
    .line 794
    invoke-static {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 795
    .local v0, id:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v2

    .line 797
    .local v2, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;

    move-result-object v1

    .line 798
    .local v1, matches:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {v1}, Ljava/util/Collection;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_0

    .line 799
    const/4 v3, 0x0

    .line 805
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    :goto_0
    return-object v3

    .line 800
    :cond_0
    :try_start_1
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 801
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 805
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    goto :goto_0

    .line 803
    :cond_1
    :try_start_2
    new-instance v3, Lorg/eclipse/jgit/errors/AmbiguousObjectException;

    invoke-direct {v3, v0, v1}, Lorg/eclipse/jgit/errors/AmbiguousObjectException;-><init>(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/util/Collection;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 805
    .end local v1           #matches:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v3
.end method

.method private resolveReflog(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/Ref;Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 10
    .parameter "rw"
    .parameter "ref"
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 776
    :try_start_0
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 781
    .local v2, number:I
    sget-boolean v4, Lorg/eclipse/jgit/lib/Repository;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    if-gez v2, :cond_0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 777
    .end local v2           #number:I
    :catch_0
    move-exception v1

    .line 778
    .local v1, nfe:Ljava/lang/NumberFormatException;
    new-instance v4, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->invalidReflogRevision:Ljava/lang/String;

    new-array v6, v9, [Ljava/lang/Object;

    aput-object p3, v6, v8

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 782
    .end local v1           #nfe:Ljava/lang/NumberFormatException;
    .restart local v2       #number:I
    :cond_0
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/lib/Repository;->getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;

    move-result-object v3

    .line 783
    .local v3, reader:Lorg/eclipse/jgit/lib/ReflogReader;
    invoke-interface {v3, v2}, Lorg/eclipse/jgit/lib/ReflogReader;->getReverseEntry(I)Lorg/eclipse/jgit/lib/ReflogEntry;

    move-result-object v0

    .line 784
    .local v0, entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    if-nez v0, :cond_1

    .line 785
    new-instance v4, Lorg/eclipse/jgit/errors/RevisionSyntaxException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->reflogEntryNotFound:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/RevisionSyntaxException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 789
    :cond_1
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ReflogEntry;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    return-object v4
.end method

.method private resolveReflogCheckout(I)Ljava/lang/String;
    .locals 6
    .parameter "checkoutNo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 761
    const-string v5, "HEAD"

    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/lib/Repository;->getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;

    move-result-object v5

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/ReflogReader;->getReverseEntries()Ljava/util/List;

    move-result-object v4

    .line 763
    .local v4, reflogEntries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ReflogEntry;

    .line 764
    .local v2, entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/ReflogEntry;->parseCheckout()Lorg/eclipse/jgit/lib/CheckoutEntry;

    move-result-object v0

    .line 765
    .local v0, checkout:Lorg/eclipse/jgit/lib/CheckoutEntry;
    if-eqz v0, :cond_0

    .line 766
    add-int/lit8 v1, p1, -0x1

    .end local p1
    .local v1, checkoutNo:I
    const/4 v5, 0x1

    if-ne p1, v5, :cond_2

    .line 767
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/CheckoutEntry;->getFromBranch()Ljava/lang/String;

    move-result-object v5

    move p1, v1

    .line 769
    .end local v0           #checkout:Lorg/eclipse/jgit/lib/CheckoutEntry;
    .end local v1           #checkoutNo:I
    .end local v2           #entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    .restart local p1
    :goto_1
    return-object v5

    :cond_1
    const/4 v5, 0x0

    goto :goto_1

    .end local p1
    .restart local v0       #checkout:Lorg/eclipse/jgit/lib/CheckoutEntry;
    .restart local v1       #checkoutNo:I
    .restart local v2       #entry:Lorg/eclipse/jgit/lib/ReflogEntry;
    :cond_2
    move p1, v1

    .end local v1           #checkoutNo:I
    .restart local p1
    goto :goto_0
.end method

.method private resolveSimple(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 5
    .parameter "revstr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 733
    invoke-static {p1}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 734
    invoke-static {p1}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 756
    :goto_0
    return-object v3

    .line 736
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "x/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 737
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/lib/RefDatabase;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 738
    .local v1, r:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_1

    .line 739
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    goto :goto_0

    .line 742
    .end local v1           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    invoke-static {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->isId(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 743
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/Repository;->resolveAbbreviation(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    goto :goto_0

    .line 745
    :cond_2
    const-string v3, "-g"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 746
    .local v0, dashg:I
    add-int/lit8 v3, v0, 0x5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_3

    if-ltz v0, :cond_3

    add-int/lit8 v3, v0, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lorg/eclipse/jgit/lib/Repository;->isHex(C)Z

    move-result v3

    if-eqz v3, :cond_3

    add-int/lit8 v3, v0, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lorg/eclipse/jgit/lib/Repository;->isHex(C)Z

    move-result v3

    if-eqz v3, :cond_3

    add-int/lit8 v3, v0, 0x4

    invoke-static {p1, v3}, Lorg/eclipse/jgit/lib/Repository;->isAllHex(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 751
    add-int/lit8 v3, v0, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 752
    .local v2, s:Ljava/lang/String;
    invoke-static {v2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->isId(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 753
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/lib/Repository;->resolveAbbreviation(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    goto :goto_0

    .line 756
    .end local v2           #s:Ljava/lang/String;
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static shortenRefName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "refName"

    .prologue
    .line 1268
    const-string v0, "refs/heads/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1269
    const-string v0, "refs/heads/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 1274
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 1270
    .restart local p0
    :cond_1
    const-string v0, "refs/tags/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1271
    const-string v0, "refs/tags/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 1272
    :cond_2
    const-string v0, "refs/remotes/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1273
    const-string v0, "refs/remotes/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static stripWorkDir(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    .locals 8
    .parameter "workDir"
    .parameter "file"

    .prologue
    const/16 v7, 0x2f

    .line 1211
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 1212
    .local v2, filePath:Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 1214
    .local v4, workDirPath:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-le v5, v6, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    sget-char v6, Ljava/io/File;->separatorChar:C

    if-ne v5, v6, :cond_0

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 1217
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->isAbsolute()Z

    move-result v5

    if-eqz v5, :cond_2

    move-object v1, p0

    .line 1218
    .local v1, absWd:Ljava/io/File;
    :goto_0
    invoke-virtual {p1}, Ljava/io/File;->isAbsolute()Z

    move-result v5

    if-eqz v5, :cond_3

    move-object v0, p1

    .line 1219
    .local v0, absFile:Ljava/io/File;
    :goto_1
    if-ne v1, p0, :cond_4

    if-ne v0, p1, :cond_4

    .line 1220
    const-string v3, ""

    .line 1227
    .end local v0           #absFile:Ljava/io/File;
    .end local v1           #absWd:Ljava/io/File;
    :cond_1
    :goto_2
    return-object v3

    .line 1217
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    goto :goto_0

    .line 1218
    .restart local v1       #absWd:Ljava/io/File;
    :cond_3
    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    goto :goto_1

    .line 1221
    .restart local v0       #absFile:Ljava/io/File;
    :cond_4
    invoke-static {v1, v0}, Lorg/eclipse/jgit/lib/Repository;->stripWorkDir(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 1224
    .end local v0           #absFile:Ljava/io/File;
    .end local v1           #absWd:Ljava/io/File;
    :cond_5
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 1225
    .local v3, relName:Ljava/lang/String;
    sget-char v5, Ljava/io/File;->separatorChar:C

    if-eq v5, v7, :cond_1

    .line 1226
    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    goto :goto_2
.end method

.method private writeCommitMsg(Ljava/io/File;Ljava/lang/String;)V
    .locals 2
    .parameter "msgFile"
    .parameter "msg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1554
    if-eqz p2, :cond_0

    .line 1555
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1557
    .local v0, fos:Ljava/io/FileOutputStream;
    :try_start_0
    const-string v1, "UTF-8"

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1559
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 1564
    .end local v0           #fos:Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 1559
    .restart local v0       #fos:Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    throw v1

    .line 1562
    .end local v0           #fos:Ljava/io/FileOutputStream;
    :cond_0
    const/4 v1, 0x4

    invoke-static {p1, v1}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    goto :goto_0
.end method

.method private writeHeadsFile(Ljava/util/List;Ljava/lang/String;)V
    .locals 5
    .parameter
    .parameter "filename"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1595
    .local p1, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v4

    invoke-direct {v1, v4, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1596
    .local v1, headsFile:Ljava/io/File;
    if-eqz p1, :cond_1

    .line 1597
    new-instance v0, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1600
    .local v0, bos:Ljava/io/BufferedOutputStream;
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1601
    .local v3, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo(Ljava/io/OutputStream;)V

    .line 1602
    const/16 v4, 0xa

    invoke-virtual {v0, v4}, Ljava/io/BufferedOutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1605
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V

    throw v4

    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V

    .line 1610
    .end local v0           #bos:Ljava/io/BufferedOutputStream;
    .end local v2           #i$:Ljava/util/Iterator;
    :goto_1
    return-void

    .line 1608
    :cond_1
    const/4 v4, 0x4

    invoke-static {v1, v4}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 816
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->useCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 817
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->doClose()V

    .line 819
    :cond_0
    return-void
.end method

.method public create()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/Repository;->create(Z)V

    .line 171
    return-void
.end method

.method public abstract create(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected doClose()V
    .locals 1

    .prologue
    .line 827
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectDatabase;->close()V

    .line 828
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefDatabase;->close()V

    .line 829
    return-void
.end method

.method public fireEvent(Lorg/eclipse/jgit/events/RepositoryEvent;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/events/RepositoryEvent",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, event:Lorg/eclipse/jgit/events/RepositoryEvent;,"Lorg/eclipse/jgit/events/RepositoryEvent<*>;"
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/events/RepositoryEvent;->setRepository(Lorg/eclipse/jgit/lib/Repository;)V

    .line 156
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->myListeners:Lorg/eclipse/jgit/events/ListenerList;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/events/ListenerList;->dispatch(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 157
    sget-object v0, Lorg/eclipse/jgit/lib/Repository;->globalListeners:Lorg/eclipse/jgit/events/ListenerList;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/events/ListenerList;->dispatch(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 158
    return-void
.end method

.method public getAdditionalHaves()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 898
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getAllRefs()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 920
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 922
    :goto_0
    return-object v1

    .line 921
    :catch_0
    move-exception v0

    .line 922
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    goto :goto_0
.end method

.method public getAllRefsByPeeledObjectId()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 967
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getAllRefs()Ljava/util/Map;

    move-result-object v0

    .line 968
    .local v0, allRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v5, Ljava/util/HashMap;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v7

    invoke-direct {v5, v7}, Ljava/util/HashMap;-><init>(I)V

    .line 969
    .local v5, ret:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;>;"
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 970
    .local v4, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/lib/Repository;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    .line 971
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 972
    .local v6, target:Lorg/eclipse/jgit/lib/AnyObjectId;
    if-nez v6, :cond_1

    .line 973
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 975
    :cond_1
    invoke-static {v4}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 976
    .local v2, oset:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    if-eqz v2, :cond_0

    .line 978
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_2

    .line 980
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .end local v2           #oset:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    .local v3, oset:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    move-object v2, v3

    .line 982
    .end local v3           #oset:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v2       #oset:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_2
    invoke-interface {v5, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 983
    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 986
    .end local v2           #oset:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v4           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v6           #target:Lorg/eclipse/jgit/lib/AnyObjectId;
    :cond_3
    return-object v5
.end method

.method public getBranch()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 881
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getFullBranch()Ljava/lang/String;

    move-result-object v0

    .line 882
    .local v0, name:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 883
    invoke-static {v0}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 884
    .end local v0           #name:Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public abstract getConfig()Lorg/eclipse/jgit/lib/StoredConfig;
.end method

.method public getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->gitDir:Ljava/io/File;

    return-object v0
.end method

.method public getFS()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->fs:Lorg/eclipse/jgit/util/FS;

    return-object v0
.end method

.method public getFullBranch()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 859
    const-string v2, "HEAD"

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 860
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    if-nez v0, :cond_1

    .line 866
    :cond_0
    :goto_0
    return-object v1

    .line 862
    :cond_1
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 863
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 864
    :cond_2
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 865
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getIndexFile()Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 996
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 997
    new-instance v0, Lorg/eclipse/jgit/errors/NoWorkTreeException;

    invoke-direct {v0}, Lorg/eclipse/jgit/errors/NoWorkTreeException;-><init>()V

    throw v0

    .line 998
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->indexFile:Ljava/io/File;

    return-object v0
.end method

.method public getListenerList()Lorg/eclipse/jgit/events/ListenerList;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->myListeners:Lorg/eclipse/jgit/events/ListenerList;

    return-object v0
.end method

.method public abstract getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;
.end method

.method public getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 912
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/RefDatabase;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public abstract getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;
.end method

.method public abstract getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getRemoteName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "refName"

    .prologue
    .line 1303
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRemoteNames()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1304
    .local v1, remote:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "refs/remotes/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1305
    .local v2, remotePrefix:Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1308
    .end local v1           #remote:Ljava/lang/String;
    .end local v2           #remotePrefix:Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getRemoteNames()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1656
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    const-string v1, "remote"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->getSubsections(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;
    .locals 3

    .prologue
    .line 1069
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1070
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->BARE:Lorg/eclipse/jgit/lib/RepositoryState;

    .line 1136
    :goto_0
    return-object v0

    .line 1073
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v1

    const-string v2, ".dotest"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1074
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

    goto :goto_0

    .line 1075
    :cond_2
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, ".dotest-merge"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1076
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_INTERACTIVE:Lorg/eclipse/jgit/lib/RepositoryState;

    goto :goto_0

    .line 1079
    :cond_3
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "rebase-apply/rebasing"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1080
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

    goto :goto_0

    .line 1081
    :cond_4
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "rebase-apply/applying"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1082
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->APPLY:Lorg/eclipse/jgit/lib/RepositoryState;

    goto :goto_0

    .line 1083
    :cond_5
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "rebase-apply"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1084
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING:Lorg/eclipse/jgit/lib/RepositoryState;

    goto :goto_0

    .line 1086
    :cond_6
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "rebase-merge/interactive"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1087
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_INTERACTIVE:Lorg/eclipse/jgit/lib/RepositoryState;

    goto :goto_0

    .line 1088
    :cond_7
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "rebase-merge"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1089
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REBASING_MERGE:Lorg/eclipse/jgit/lib/RepositoryState;

    goto/16 :goto_0

    .line 1092
    :cond_8
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "MERGE_HEAD"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1095
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->hasUnmergedPaths()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1097
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1099
    :catch_0
    move-exception v0

    .line 1104
    :cond_9
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING:Lorg/eclipse/jgit/lib/RepositoryState;

    goto/16 :goto_0

    .line 1107
    :cond_a
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "BISECT_LOG"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1108
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->BISECTING:Lorg/eclipse/jgit/lib/RepositoryState;

    goto/16 :goto_0

    .line 1110
    :cond_b
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "CHERRY_PICK_HEAD"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1112
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->hasUnmergedPaths()Z

    move-result v0

    if-nez v0, :cond_c

    .line 1114
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 1116
    :catch_1
    move-exception v0

    .line 1120
    :cond_c
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING:Lorg/eclipse/jgit/lib/RepositoryState;

    goto/16 :goto_0

    .line 1123
    :cond_d
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "REVERT_HEAD"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1125
    :try_start_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCache;->hasUnmergedPaths()Z

    move-result v0

    if-nez v0, :cond_e

    .line 1127
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 1129
    :catch_2
    move-exception v0

    .line 1133
    :cond_e
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING:Lorg/eclipse/jgit/lib/RepositoryState;

    goto/16 :goto_0

    .line 1136
    :cond_f
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryState;->SAFE:Lorg/eclipse/jgit/lib/RepositoryState;

    goto/16 :goto_0
.end method

.method public getTags()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 933
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v1

    const-string v2, "refs/tags/"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 935
    :goto_0
    return-object v1

    .line 934
    :catch_0
    move-exception v0

    .line 935
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    goto :goto_0
.end method

.method public getWorkTree()Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 1245
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1246
    new-instance v0, Lorg/eclipse/jgit/errors/NoWorkTreeException;

    invoke-direct {v0}, Lorg/eclipse/jgit/errors/NoWorkTreeException;-><init>()V

    throw v0

    .line 1247
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->workTree:Ljava/io/File;

    return-object v0
.end method

.method public hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 2
    .parameter "objectId"

    .prologue
    .line 227
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectDatabase;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 230
    :goto_0
    return v1

    .line 228
    :catch_0
    move-exception v0

    .line 230
    .local v0, e:Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public incrementOpen()V
    .locals 1

    .prologue
    .line 811
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->useCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 812
    return-void
.end method

.method public isBare()Z
    .locals 1

    .prologue
    .line 1234
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository;->workTree:Ljava/io/File;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoWorkTreeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1047
    new-instance v0, Lorg/eclipse/jgit/lib/Repository$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/Repository$1;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 1053
    .local v0, l:Lorg/eclipse/jgit/events/IndexChangedListener;
    invoke-static {p0, v0}, Lorg/eclipse/jgit/dircache/DirCache;->lock(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/events/IndexChangedListener;)Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v1

    return-object v1
.end method

.method public newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    .locals 1

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    return-object v0
.end method

.method public newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 1

    .prologue
    .line 202
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    return-object v0
.end method

.method public abstract notifyIndexChanged()V
.end method

.method public open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 1
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 250
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectDatabase;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 1
    .parameter "objectId"
    .parameter "typeHint"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/ObjectDatabase;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 2
    .parameter "ref"

    .prologue
    .line 954
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RefDatabase;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    .line 959
    .end local p1
    :goto_0
    return-object p1

    .line 955
    .restart local p1
    :catch_0
    move-exception v0

    .line 959
    .local v0, e:Ljava/io/IOException;
    goto :goto_0
.end method

.method public readCherryPickHead()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 1413
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1414
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/NoWorkTreeException;

    invoke-direct {v1}, Lorg/eclipse/jgit/errors/NoWorkTreeException;-><init>()V

    throw v1

    .line 1416
    :cond_1
    const-string v1, "CHERRY_PICK_HEAD"

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/Repository;->readGitDirectoryFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1417
    .local v0, raw:[B
    if-nez v0, :cond_2

    .line 1418
    const/4 v1, 0x0

    .line 1420
    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    goto :goto_0
.end method

.method public readDirCache()Lorg/eclipse/jgit/dircache/DirCache;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoWorkTreeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1021
    invoke-static {p0}, Lorg/eclipse/jgit/dircache/DirCache;->read(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    return-object v0
.end method

.method public readMergeCommitMsg()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 1335
    const-string v0, "MERGE_MSG"

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/Repository;->readCommitMsgFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readMergeHeads()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 1369
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1370
    :cond_0
    new-instance v3, Lorg/eclipse/jgit/errors/NoWorkTreeException;

    invoke-direct {v3}, Lorg/eclipse/jgit/errors/NoWorkTreeException;-><init>()V

    throw v3

    .line 1372
    :cond_1
    const-string v3, "MERGE_HEAD"

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/lib/Repository;->readGitDirectoryFile(Ljava/lang/String;)[B

    move-result-object v2

    .line 1373
    .local v2, raw:[B
    if-nez v2, :cond_3

    .line 1374
    const/4 v0, 0x0

    .line 1382
    :cond_2
    return-object v0

    .line 1376
    :cond_3
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 1377
    .local v0, heads:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v1, 0x0

    .local v1, p:I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 1378
    invoke-static {v2, v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 1379
    add-int/lit8 v3, v1, 0x28

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    goto :goto_0
.end method

.method public readOrigHead()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 1500
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1501
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/NoWorkTreeException;

    invoke-direct {v1}, Lorg/eclipse/jgit/errors/NoWorkTreeException;-><init>()V

    throw v1

    .line 1503
    :cond_1
    const-string v1, "ORIG_HEAD"

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/Repository;->readGitDirectoryFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1504
    .local v0, raw:[B
    if-eqz v0, :cond_2

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public readRebaseTodo(Ljava/lang/String;Z)Ljava/util/List;
    .locals 1
    .parameter "path"
    .parameter "includeComments"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/RebaseTodoLine;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1629
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoFile;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/RebaseTodoFile;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/RebaseTodoFile;->readRebaseTodo(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readRevertHead()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/NoWorkTreeException;
        }
    .end annotation

    .prologue
    .line 1435
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1436
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/NoWorkTreeException;

    invoke-direct {v1}, Lorg/eclipse/jgit/errors/NoWorkTreeException;-><init>()V

    throw v1

    .line 1438
    :cond_1
    const-string v1, "REVERT_HEAD"

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/Repository;->readGitDirectoryFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1439
    .local v0, raw:[B
    if-nez v0, :cond_2

    .line 1440
    const/4 v1, 0x0

    .line 1441
    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    goto :goto_0
.end method

.method public readSquashCommitMsg()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1520
    const-string v0, "SQUASH_MSG"

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/Repository;->readCommitMsgFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public renameRef(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefRename;
    .locals 1
    .parameter "fromRef"
    .parameter "toRef"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 328
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/RefDatabase;->newRename(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefRename;

    move-result-object v0

    return-object v0
.end method

.method public resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 4
    .parameter "revstr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/AmbiguousObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/RevisionSyntaxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 383
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 385
    .local v2, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-direct {p0, v2, p1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 386
    .local v1, resolved:Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 387
    check-cast v1, Ljava/lang/String;

    .end local v1           #resolved:Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 388
    .local v0, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 393
    :goto_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .end local v0           #ref:Lorg/eclipse/jgit/lib/Ref;
    :goto_1
    return-object v3

    .line 388
    .restart local v0       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 390
    .end local v0           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #resolved:Ljava/lang/Object;
    :cond_1
    :try_start_1
    check-cast v1, Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    .end local v1           #resolved:Ljava/lang/Object;
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    move-object v3, v1

    goto :goto_1

    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v3
.end method

.method public abstract scanForRepoChanges()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public shortenRemoteBranchName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "refName"

    .prologue
    .line 1286
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRemoteNames()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1287
    .local v1, remote:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "refs/remotes/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1288
    .local v2, remotePrefix:Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1289
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 1291
    .end local v1           #remote:Ljava/lang/String;
    .end local v2           #remotePrefix:Ljava/lang/String;
    :goto_0
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public simplify(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "revstr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/AmbiguousObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 412
    .local v1, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-direct {p0, v1, p1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 413
    .local v0, resolved:Ljava/lang/Object;
    if-eqz v0, :cond_1

    .line 414
    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 415
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 420
    .end local v0           #resolved:Ljava/lang/Object;
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :goto_0
    return-object v0

    .line 417
    .restart local v0       #resolved:Ljava/lang/Object;
    :cond_0
    :try_start_1
    check-cast v0, Lorg/eclipse/jgit/lib/AnyObjectId;

    .end local v0           #resolved:Ljava/lang/Object;
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->getName()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 420
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0

    .line 418
    .restart local v0       #resolved:Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    .line 420
    .end local v0           #resolved:Ljava/lang/Object;
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 834
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 835
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 839
    .local v0, desc:Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Repository["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 837
    .end local v0           #desc:Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #desc:Ljava/lang/String;
    goto :goto_0
.end method

.method public updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;
    .locals 1
    .parameter "ref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 294
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v0

    return-object v0
.end method

.method public updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;
    .locals 1
    .parameter "ref"
    .parameter "detach"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/RefDatabase;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v0

    return-object v0
.end method

.method public writeCherryPickHead(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "head"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1454
    if-eqz p1, :cond_0

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 1456
    .local v0, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_0
    const-string v1, "CHERRY_PICK_HEAD"

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeHeadsFile(Ljava/util/List;Ljava/lang/String;)V

    .line 1457
    return-void

    .line 1454
    .end local v0           #heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public writeMergeCommitMsg(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1351
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/Repository;->gitDir:Ljava/io/File;

    const-string v2, "MERGE_MSG"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1352
    .local v0, mergeMsgFile:Ljava/io/File;
    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/lib/Repository;->writeCommitMsg(Ljava/io/File;Ljava/lang/String;)V

    .line 1353
    return-void
.end method

.method public writeMergeHeads(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1397
    .local p1, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const-string v0, "MERGE_HEAD"

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/Repository;->writeHeadsFile(Ljava/util/List;Ljava/lang/String;)V

    .line 1398
    return-void
.end method

.method public writeOrigHead(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "head"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1483
    if-eqz p1, :cond_0

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 1485
    .local v0, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_0
    const-string v1, "ORIG_HEAD"

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeHeadsFile(Ljava/util/List;Ljava/lang/String;)V

    .line 1486
    return-void

    .line 1483
    .end local v0           #heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public writeRebaseTodoFile(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 1
    .parameter "path"
    .parameter
    .parameter "append"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/RebaseTodoLine;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1648
    .local p2, steps:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/RebaseTodoLine;>;"
    new-instance v0, Lorg/eclipse/jgit/lib/RebaseTodoFile;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/RebaseTodoFile;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/lib/RebaseTodoFile;->writeRebaseTodoFile(Ljava/lang/String;Ljava/util/List;Z)V

    .line 1649
    return-void
.end method

.method public writeRevertHead(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "head"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1469
    if-eqz p1, :cond_0

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 1471
    .local v0, heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_0
    const-string v1, "REVERT_HEAD"

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeHeadsFile(Ljava/util/List;Ljava/lang/String;)V

    .line 1472
    return-void

    .line 1469
    .end local v0           #heads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public writeSquashCommitMsg(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1536
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/Repository;->gitDir:Ljava/io/File;

    const-string v2, "SQUASH_MSG"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1537
    .local v0, squashMsgFile:Ljava/io/File;
    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/lib/Repository;->writeCommitMsg(Ljava/io/File;Ljava/lang/String;)V

    .line 1538
    return-void
.end method
