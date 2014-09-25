.class public final Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;
.super Lorg/eclipse/jgit/lib/ObjectReader;
.source "DfsReader.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;
    }
.end annotation


# static fields
.field private static final FOUND_OBJECT_SORT:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final OFFSET_SORT:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private avoidUnreachable:Z

.field private baseCache:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

.field private block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

.field final db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

.field private inf:Ljava/util/zip/Inflater;

.field private last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

.field final tempId:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 228
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->FOUND_OBJECT_SORT:Ljava/util/Comparator;

    .line 446
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$4;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$4;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->OFFSET_SORT:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectReader;-><init>()V

    .line 100
    const/16 v0, 0x14

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->tempId:[B

    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    .line 117
    return-void
.end method

.method private findAll(Ljava/lang/Iterable;)Ljava/lang/Iterable;
    .locals 17
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">(",
            "Ljava/lang/Iterable",
            "<TT;>;)",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject",
            "<TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 260
    .local p1, objectIds:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TT;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .local v16, r:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v15

    .line 262
    .local v15, packList:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v1, v15

    if-nez v1, :cond_0

    .line 263
    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 264
    .local v2, t:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;-><init>(Lorg/eclipse/jgit/lib/ObjectId;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 268
    .end local v2           #t:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    .end local v13           #i$:Ljava/util/Iterator;
    :cond_0
    const/4 v3, 0x0

    .line 269
    .local v3, lastIdx:I
    aget-object v4, v15, v3

    .line 270
    .local v4, lastPack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->avoidUnreachable:Z

    .line 272
    .local v14, noGarbage:Z
    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 274
    .restart local v2       #t:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    :try_start_0
    move-object/from16 v0, p0

    invoke-virtual {v4, v0, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->findOffset(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v5

    .line 275
    .local v5, p:J
    const-wide/16 v7, 0x0

    cmp-long v1, v7, v5

    if-gez v1, :cond_1

    .line 276
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    invoke-direct/range {v1 .. v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;-><init>(Lorg/eclipse/jgit/lib/ObjectId;ILorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 279
    .end local v5           #p:J
    :catch_0
    move-exception v1

    .line 283
    :cond_1
    const/4 v9, 0x0

    .local v9, i:I
    :goto_2
    array-length v1, v15

    if-ge v9, v1, :cond_5

    .line 284
    if-ne v9, v3, :cond_3

    .line 283
    :cond_2
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 286
    :cond_3
    aget-object v10, v15, v9

    .line 287
    .local v10, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    if-eqz v14, :cond_4

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->isGarbage()Z

    move-result v1

    if-nez v1, :cond_2

    .line 290
    :cond_4
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v10, v0, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->findOffset(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v5

    .line 291
    .restart local v5       #p:J
    const-wide/16 v7, 0x0

    cmp-long v1, v7, v5

    if-gez v1, :cond_2

    .line 292
    new-instance v7, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    move-object v8, v2

    move-wide v11, v5

    invoke-direct/range {v7 .. v12}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;-><init>(Lorg/eclipse/jgit/lib/ObjectId;ILorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 293
    move v3, v9

    .line 294
    move-object v4, v10

    goto :goto_1

    .line 302
    .end local v5           #p:J
    .end local v10           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_5
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;-><init>(Lorg/eclipse/jgit/lib/ObjectId;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 305
    .end local v2           #t:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    .end local v9           #i:I
    :cond_6
    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->FOUND_OBJECT_SORT:Ljava/util/Comparator;

    move-object/from16 v0, v16

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 306
    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 307
    .end local v3           #lastIdx:I
    .end local v4           #lastPack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v14           #noGarbage:Z
    :cond_7
    return-object v16

    .line 297
    .restart local v2       #t:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    .restart local v3       #lastIdx:I
    .restart local v4       #lastPack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .restart local v9       #i:I
    .restart local v10       #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .restart local v14       #noGarbage:Z
    :catch_1
    move-exception v1

    goto :goto_3
.end method

.method private findAllFromPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Ljava/lang/Iterable;)Ljava/util/List;
    .locals 8
    .parameter "pack"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 476
    .local p2, objects:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    new-instance v5, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v5}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    .line 477
    .local v5, tmp:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;>;"
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v1

    .line 478
    .local v1, idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 479
    .local v2, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v3

    .line 480
    .local v3, p:J
    const-wide/16 v6, 0x0

    cmp-long v6, v6, v3

    if-gez v6, :cond_0

    .line 481
    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setOffset(J)V

    .line 482
    check-cast v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;

    .end local v2           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 485
    .end local v3           #p:J
    :cond_1
    return-object v5
.end method

.method private prepareInflater()V
    .locals 1

    .prologue
    .line 654
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    if-nez v0, :cond_0

    .line 655
    invoke-static {}, Lorg/eclipse/jgit/lib/InflaterCache;->get()Ljava/util/zip/Inflater;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    .line 658
    :goto_0
    return-void

    .line 657
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->reset()V

    goto :goto_0
.end method


# virtual methods
.method copy(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J[BII)I
    .locals 9
    .parameter "pack"
    .parameter "position"
    .parameter "dstbuf"
    .parameter "dstoff"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 530
    if-nez p6, :cond_0

    .line 531
    const/4 v0, 0x0

    .line 547
    :goto_0
    return v0

    .line 533
    :cond_0
    iget-wide v6, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    .line 534
    .local v6, length:J
    const-wide/16 v0, 0x0

    cmp-long v0, v0, v6

    if-gtz v0, :cond_1

    cmp-long v0, v6, p2

    if-gtz v0, :cond_1

    .line 535
    const/4 v0, 0x0

    goto :goto_0

    .line 537
    :cond_1
    move v5, p6

    .line 539
    .local v5, need:I
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 540
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-wide v1, p2

    move-object v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->copy(J[BII)I

    move-result v8

    .line 541
    .local v8, r:I
    int-to-long v0, v8

    add-long/2addr p2, v0

    .line 542
    add-int/2addr p5, v8

    .line 543
    sub-int/2addr v5, v8

    .line 544
    const-wide/16 v0, 0x0

    cmp-long v0, v6, v0

    if-gez v0, :cond_3

    .line 545
    iget-wide v6, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->length:J

    .line 546
    :cond_3
    if-lez v5, :cond_4

    cmp-long v0, p2, v6

    if-ltz v0, :cond_2

    .line 547
    :cond_4
    sub-int v0, p6, v5

    goto :goto_0
.end method

.method public copyObjectAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Z)V
    .locals 2
    .parameter "out"
    .parameter "otp"
    .parameter "validate"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
        }
    .end annotation

    .prologue
    .line 491
    move-object v0, p2

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;

    .line 492
    .local v0, src:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v1, p1, v0, p3, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;ZLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 493
    return-void
.end method

.method copyPackAsIs(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JZLorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V
    .locals 18
    .parameter "pack"
    .parameter "length"
    .parameter "validate"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 552
    const/4 v7, 0x0

    .line 553
    .local v7, md:Ljava/security/MessageDigest;
    if-eqz p4, :cond_1

    .line 554
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v7

    .line 555
    invoke-virtual/range {p5 .. p5}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->getCopyBuffer()[B

    move-result-object v11

    .line 556
    .local v11, buf:[B
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 557
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    const/4 v3, 0x0

    const/4 v8, 0x0

    const/16 v9, 0xc

    invoke-virtual {v2, v3, v11, v8, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->copy(I[BII)I

    move-result v2

    const/16 v3, 0xc

    if-eq v2, v3, :cond_0

    .line 558
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setInvalid()V

    .line 559
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packfileIsTruncated:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 561
    :cond_0
    const/4 v2, 0x0

    const/16 v3, 0xc

    invoke-virtual {v7, v11, v2, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 564
    .end local v11           #buf:[B
    :cond_1
    const-wide/16 v4, 0xc

    .line 565
    .local v4, position:J
    const-wide/16 v2, 0x20

    sub-long v16, p2, v2

    .line 566
    .local v16, remaining:J
    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v16

    if-gez v2, :cond_2

    .line 567
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 569
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    iget-wide v2, v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->start:J

    sub-long v2, v4, v2

    long-to-int v15, v2

    .line 570
    .local v15, ptr:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->size()I

    move-result v2

    sub-int/2addr v2, v15

    int-to-long v2, v2

    move-wide/from16 v0, v16

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v6, v2

    .line 571
    .local v6, n:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-object/from16 v3, p5

    invoke-virtual/range {v2 .. v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->write(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;JILjava/security/MessageDigest;)V

    .line 572
    int-to-long v2, v6

    add-long/2addr v4, v2

    .line 573
    int-to-long v2, v6

    sub-long v16, v16, v2

    .line 574
    goto :goto_0

    .line 576
    .end local v6           #n:I
    .end local v15           #ptr:I
    :cond_2
    if-eqz v7, :cond_4

    .line 577
    const/16 v2, 0x14

    new-array v11, v2, [B

    .line 578
    .restart local v11       #buf:[B
    invoke-virtual {v7}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v14

    .line 580
    .local v14, actHash:[B
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 581
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    const/4 v12, 0x0

    const/16 v13, 0x14

    move-wide v9, v4

    invoke-virtual/range {v8 .. v13}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->copy(J[BII)I

    move-result v2

    const/16 v3, 0x14

    if-eq v2, v3, :cond_3

    .line 582
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setInvalid()V

    .line 583
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packfileIsTruncated:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 585
    :cond_3
    invoke-static {v14, v11}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_4

    .line 586
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->setInvalid()V

    .line 587
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->packfileCorruptionDetected:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v10

    sget-object v12, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v10, v12}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v3, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 592
    .end local v11           #buf:[B
    .end local v14           #actHash:[B
    :cond_4
    return-void
.end method

.method public copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/CachedPack;Z)V
    .locals 0
    .parameter "out"
    .parameter "pack"
    .parameter "validate"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 503
    check-cast p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;

    .end local p2
    invoke-virtual {p2, p1, p3, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;->copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 504
    return-void
.end method

.method public getBitmapIndex()Lorg/eclipse/jgit/lib/BitmapIndex;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 146
    .local v4, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v4, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getBitmapIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v1

    .line 147
    .local v1, bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    if-eqz v1, :cond_0

    .line 148
    new-instance v5, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-direct {v5, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V

    .line 150
    .end local v1           #bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .end local v4           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :goto_1
    return-object v5

    .line 145
    .restart local v1       #bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .restart local v4       #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 150
    .end local v1           #bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .end local v4           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public getCachedPacksAndUpdate(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Ljava/util/Collection;
    .locals 6
    .parameter "needBitmap"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/CachedPack;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 156
    .local v4, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v4, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getBitmapIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;

    move-result-object v1

    .line 157
    .local v1, bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    invoke-interface {p1, v1}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->removeAllOrNone(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 158
    new-instance v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;

    invoke-direct {v5, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 161
    .end local v1           #bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .end local v4           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :goto_1
    return-object v5

    .line 155
    .restart local v1       #bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .restart local v4       #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 161
    .end local v1           #bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .end local v4           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    goto :goto_1
.end method

.method getDeltaBaseCache()Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->baseCache:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    if-nez v0, :cond_0

    .line 125
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->baseCache:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    .line 126
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->baseCache:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    return-object v0
.end method

.method public getObjectSize(Lorg/eclipse/jgit/lib/AnyObjectId;I)J
    .locals 9
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
    const-wide/16 v7, 0x0

    .line 421
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-eqz v6, :cond_0

    .line 422
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v6, p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getObjectSize(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v4

    .line 423
    .local v4, sz:J
    cmp-long v6, v7, v4

    if-gtz v6, :cond_0

    .line 433
    :goto_0
    return-wide v4

    .line 427
    .end local v4           #sz:J
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_3

    aget-object v3, v0, v1

    .line 428
    .local v3, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-ne v3, v6, :cond_2

    .line 427
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 430
    :cond_2
    invoke-virtual {v3, p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getObjectSize(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v4

    .line 431
    .restart local v4       #sz:J
    cmp-long v6, v7, v4

    if-gtz v6, :cond_1

    .line 432
    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    goto :goto_0

    .line 437
    .end local v3           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v4           #sz:J
    :cond_3
    const/4 v6, -0x1

    if-ne p2, v6, :cond_4

    .line 438
    new-instance v6, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    const-string v8, "unknown"

    invoke-direct {v6, v7, v8}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v6

    .line 439
    :cond_4
    new-instance v6, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-direct {v6, v7, p2}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v6
.end method

.method public getObjectSize(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;
    .locals 6
    .parameter
    .parameter "reportMissing"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">(",
            "Ljava/lang/Iterable",
            "<TT;>;Z)",
            "Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 366
    .local p1, objectIds:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TT;>;"
    const/4 v1, 0x0

    .line 368
    .local v1, error:Ljava/io/IOException;
    :try_start_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->findAll(Ljava/lang/Iterable;)Ljava/lang/Iterable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 374
    .local v4, order:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    :goto_0
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 375
    .local v3, idItr:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    move-object v2, v1

    .line 376
    .local v2, findAllError:Ljava/io/IOException;
    new-instance v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$3;

    invoke-direct {v5, p0, v3, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$3;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Ljava/util/Iterator;Ljava/io/IOException;)V

    return-object v5

    .line 369
    .end local v2           #findAllError:Ljava/io/IOException;
    .end local v3           #idItr:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    .end local v4           #order:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    :catch_0
    move-exception v0

    .line 370
    .local v0, e:Ljava/io/IOException;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    .line 371
    .restart local v4       #order:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    move-object v1, v0

    goto :goto_0
.end method

.method getOptions()Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getReaderOptions()Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    move-result-object v0

    return-object v0
.end method

.method public getShallowCommits()Ljava/util/Set;
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
    .line 225
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method getStreamFileThreshold()I
    .locals 1

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->getOptions()Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->getStreamFileThreshold()I

    move-result v0

    return v0
.end method

.method public has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 7
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 183
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v6, p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->hasObject(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 194
    :goto_0
    return v5

    .line 185
    :cond_0
    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->avoidUnreachable:Z

    .line 186
    .local v3, noGarbage:Z
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_3

    aget-object v4, v0, v1

    .line 187
    .local v4, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-eq v4, v6, :cond_1

    if-eqz v3, :cond_2

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->isGarbage()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 186
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 189
    :cond_2
    invoke-virtual {v4, p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->hasObject(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 190
    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    goto :goto_0

    .line 194
    .end local v4           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_3
    const/4 v5, 0x0

    goto :goto_0
.end method

.method inflate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J[BZ)I
    .locals 4
    .parameter "pack"
    .parameter "position"
    .parameter "dstbuf"
    .parameter "headerOnly"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    .line 617
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->prepareInflater()V

    .line 618
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 619
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2, v3, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->setInput(Ljava/util/zip/Inflater;J)V

    .line 620
    const/4 v0, 0x0

    .line 622
    .local v0, dstoff:I
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    array-length v3, p4

    sub-int/2addr v3, v0

    invoke-virtual {v2, p4, v0, v3}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v1

    .line 623
    .local v1, n:I
    if-nez v1, :cond_3

    .line 624
    if-eqz p5, :cond_1

    array-length v2, p4

    if-ne v0, v2, :cond_1

    .line 633
    :cond_0
    return v0

    .line 626
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 627
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    invoke-virtual {v2, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->remaining(J)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr p2, v2

    .line 628
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 629
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2, v3, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->setInput(Ljava/util/zip/Inflater;J)V

    goto :goto_0

    .line 632
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->finished()Z

    move-result v2

    if-nez v2, :cond_0

    .line 634
    new-instance v2, Ljava/util/zip/DataFormatException;

    invoke-direct {v2}, Ljava/util/zip/DataFormatException;-><init>()V

    throw v2

    .line 636
    :cond_3
    add-int/2addr v0, v1

    .line 637
    goto :goto_0
.end method

.method inflater()Ljava/util/zip/Inflater;
    .locals 1

    .prologue
    .line 649
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->prepareInflater()V

    .line 650
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    return-object v0
.end method

.method public newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;
    .locals 1
    .parameter "objectId"
    .parameter "type"

    .prologue
    .line 443
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    return-object v0
.end method

.method public bridge synthetic newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 98
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;

    move-result-object v0

    return-object v0
.end method

.method public newReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 2

    .prologue
    .line 135
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V

    return-object v0
.end method

.method public open(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;
    .locals 6
    .parameter
    .parameter "reportMissing"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">(",
            "Ljava/lang/Iterable",
            "<TT;>;Z)",
            "Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 314
    .local p1, objectIds:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TT;>;"
    const/4 v1, 0x0

    .line 316
    .local v1, error:Ljava/io/IOException;
    :try_start_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->findAll(Ljava/lang/Iterable;)Ljava/lang/Iterable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 322
    .local v4, order:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    :goto_0
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 323
    .local v3, idItr:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    move-object v2, v1

    .line 324
    .local v2, findAllError:Ljava/io/IOException;
    new-instance v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;

    invoke-direct {v5, p0, v3, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$2;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Ljava/util/Iterator;Ljava/io/IOException;)V

    return-object v5

    .line 317
    .end local v2           #findAllError:Ljava/io/IOException;
    .end local v3           #idItr:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    .end local v4           #order:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    :catch_0
    move-exception v0

    .line 318
    .local v0, e:Ljava/io/IOException;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    .line 319
    .restart local v4       #order:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;>;"
    move-object v1, v0

    goto :goto_0
.end method

.method public open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 9
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
    .line 201
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-eqz v6, :cond_0

    .line 202
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v6, p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->get(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    .line 203
    .local v2, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v2, :cond_0

    .line 214
    :goto_0
    return-object v2

    .line 207
    .end local v2           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    :cond_0
    iget-boolean v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->avoidUnreachable:Z

    .line 208
    .local v4, noGarbage:Z
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v3, :cond_3

    aget-object v5, v0, v1

    .line 209
    .local v5, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-eq v5, v6, :cond_1

    if-eqz v4, :cond_2

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->isGarbage()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 208
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 211
    :cond_2
    invoke-virtual {v5, p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->get(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    .line 212
    .restart local v2       #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v2, :cond_1

    .line 213
    iput-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    goto :goto_0

    .line 218
    .end local v2           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    .end local v5           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_3
    const/4 v6, -0x1

    if-ne p2, v6, :cond_4

    .line 219
    new-instance v6, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    const-string v8, "unknown"

    invoke-direct {v6, v7, v8}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v6

    .line 220
    :cond_4
    new-instance v6, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-direct {v6, v7, p2}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v6
.end method

.method pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V
    .locals 2
    .parameter "pack"
    .parameter "position"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 661
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 662
    .local v0, b:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    if-eqz v0, :cond_0

    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    invoke-virtual {v0, v1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->contains(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Z

    move-result v1

    if-nez v1, :cond_1

    .line 667
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 668
    invoke-virtual {p1, p2, p3, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getOrLoadBlock(JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 670
    :cond_1
    return-void
.end method

.method quickCopy(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;JJ)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;
    .locals 4
    .parameter "p"
    .parameter "pos"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 642
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->pin(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V

    .line 643
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    iget-object v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->key:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    const-wide/16 v2, 0x1

    sub-long v2, p4, v2

    add-long/2addr v2, p2

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;->contains(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 644
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 645
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 675
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->last:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 676
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->block:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlock;

    .line 677
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->baseCache:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;

    .line 679
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/InflaterCache;->release(Ljava/util/zip/Inflater;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 681
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    .line 683
    return-void

    .line 681
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->inf:Ljava/util/zip/Inflater;

    throw v0
.end method

.method public resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;
    .locals 8
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x100

    .line 167
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->isComplete()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 168
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    .line 178
    :cond_0
    :goto_0
    return-object v3

    .line 169
    :cond_1
    iget-boolean v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->avoidUnreachable:Z

    .line 170
    .local v4, noGarbage:Z
    new-instance v3, Ljava/util/HashSet;

    const/4 v6, 0x4

    invoke-direct {v3, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 171
    .local v3, matches:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v5, v0, v1

    .line 172
    .local v5, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    if-eqz v4, :cond_3

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->isGarbage()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 171
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 174
    :cond_3
    invoke-virtual {v5, p0, v3, p1, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->resolve(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V

    .line 175
    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v6

    if-gt v7, v6, :cond_2

    goto :goto_0
.end method

.method public selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/Iterable;)V
    .locals 12
    .parameter "packer"
    .parameter "monitor"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 455
    .local p3, objects:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->db:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v6

    .local v6, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v9, v6

    .local v9, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    move v8, v7

    .end local v7           #i$:I
    .local v8, i$:I
    :goto_0
    if-ge v8, v9, :cond_3

    aget-object v0, v6, v8

    .line 456
    .local v0, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-direct {p0, v0, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->findAllFromPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v11

    .line 457
    .local v11, tmp:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;>;"
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 455
    .end local v8           #i$:I
    :cond_0
    add-int/lit8 v7, v8, 0x1

    .restart local v7       #i$:I
    move v8, v7

    .end local v7           #i$:I
    .restart local v8       #i$:I
    goto :goto_0

    .line 459
    :cond_1
    sget-object v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->OFFSET_SORT:Ljava/util/Comparator;

    invoke-static {v11, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 460
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getReverseIdx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    move-result-object v5

    .line 461
    .local v5, rev:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    .line 462
    .local v1, rep:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .end local v8           #i$:I
    .local v7, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;

    .line 463
    .local v10, otp:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;
    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->getOffset()J

    move-result-wide v2

    move-object v4, p0

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->representation(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)V

    .line 464
    const-wide/16 v2, 0x0

    invoke-virtual {v10, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->setOffset(J)V

    .line 465
    invoke-virtual {p1, v10, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->select(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)V

    .line 466
    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->isFound()Z

    move-result v2

    if-nez v2, :cond_2

    .line 467
    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->setFound()V

    .line 468
    const/4 v2, 0x1

    invoke-interface {p2, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_1

    .line 472
    .end local v0           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v1           #rep:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;
    .end local v5           #rev:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v10           #otp:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;
    .end local v11           #tmp:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;>;"
    .restart local v8       #i$:I
    :cond_3
    return-void
.end method

.method public setAvoidUnreachableObjects(Z)V
    .locals 0
    .parameter "avoid"

    .prologue
    .line 140
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->avoidUnreachable:Z

    .line 141
    return-void
.end method

.method public writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V
    .locals 3
    .parameter "out"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 497
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 498
    .local v1, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeObject(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    goto :goto_0

    .line 499
    .end local v1           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_0
    return-void
.end method
