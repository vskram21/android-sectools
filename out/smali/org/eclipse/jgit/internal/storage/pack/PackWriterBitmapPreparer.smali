.class Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;
.super Ljava/lang/Object;
.source "PackWriterBitmapPreparer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;,
        Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;
    }
.end annotation


# static fields
.field private static final BUILDER_BY_CARDINALITY_DSC:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

.field private final bitmapRemapper:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

.field private final commitBitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

.field private final maxCommits:I

.field private final minCommits:I

.field private final pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private final want:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 82
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->BUILDER_BY_CARDINALITY_DSC:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;)V
    .locals 2
    .parameter "reader"
    .parameter "writeBitmaps"
    .parameter "pm"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ObjectReader;",
            "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Set",
            "<+",
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
    .line 101
    .local p4, want:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const/16 v0, 0x64

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->minCommits:I

    .line 97
    const/16 v0, 0x1388

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->maxCommits:I

    .line 102
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 103
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    .line 104
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 105
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->want:Ljava/util/Set;

    .line 106
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-direct {v0, p2}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->commitBitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    .line 107
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectReader;->getBitmapIndex()Lorg/eclipse/jgit/lib/BitmapIndex;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->newPackBitmapIndex(Lorg/eclipse/jgit/lib/BitmapIndex;Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->bitmapRemapper:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    .line 109
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->bitmapRemapper:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    .line 110
    return-void
.end method

.method private findPaths(Lorg/eclipse/jgit/revwalk/RevWalk;I)Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;
    .locals 27
    .parameter "rw"
    .parameter "expectedNumCommits"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->commitBitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->newBitmapBuilder()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v23

    .line 220
    .local v23, reuseBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 221
    .local v8, reuse:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->bitmapRemapper:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;

    .line 222
    .local v13, entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;
    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;->getFlags()I

    move-result v3

    and-int/lit8 v3, v3, 0x1

    const/4 v9, 0x1

    if-ne v3, v9, :cond_0

    .line 225
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v24

    .line 226
    .local v24, ro:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, v24

    instance-of v3, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v3, :cond_0

    move-object/from16 v22, v24

    .line 227
    check-cast v22, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 228
    .local v22, rc:Lorg/eclipse/jgit/revwalk/RevCommit;
    new-instance v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;

    const/4 v9, 0x0

    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;->getFlags()I

    move-result v25

    const/16 v26, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v3, v0, v9, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;ZILorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;)V

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 231
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->bitmapRemapper:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->bitmapRemapper:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v9

    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v3, v9, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper;->ofObjectType(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v11

    .line 233
    .local v11, bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    const/4 v9, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v3, v0, v11, v9}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->addBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)V

    .line 234
    const/4 v3, 0x1

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-interface {v0, v1, v3}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->add(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z

    goto :goto_0

    .line 237
    .end local v11           #bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .end local v13           #entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexRemapper$Entry;
    .end local v22           #rc:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v24           #ro:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->clearBitmaps()V

    .line 241
    new-instance v21, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->want:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    move-object/from16 v0, v21

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 242
    .local v21, paths:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;>;"
    new-instance v4, Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->want:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-direct {v4, v3}, Ljava/util/HashSet;-><init>(I)V

    .line 243
    .local v4, peeledWant:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->want:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_2
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/eclipse/jgit/lib/AnyObjectId;

    .line 244
    .local v19, objectId:Lorg/eclipse/jgit/lib/AnyObjectId;
    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v24

    .line 245
    .restart local v24       #ro:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, v24

    instance-of v3, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v3, :cond_2

    invoke-interface/range {v23 .. v24}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-nez v3, :cond_2

    move-object/from16 v22, v24

    .line 246
    check-cast v22, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 247
    .restart local v22       #rc:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, v22

    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 248
    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 250
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->commitBitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->newBitmapBuilder()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v11

    .line 251
    .local v11, bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    move-object/from16 v0, v23

    invoke-interface {v11, v0}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .line 252
    const/4 v3, 0x1

    move-object/from16 v0, v22

    invoke-interface {v11, v0, v3}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->add(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z

    .line 253
    move-object/from16 v0, v21

    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 259
    .end local v11           #bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .end local v19           #objectId:Lorg/eclipse/jgit/lib/AnyObjectId;
    .end local v22           #rc:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v24           #ro:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_3
    move/from16 v0, p2

    new-array v5, v0, [Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 260
    .local v5, commits:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v6, v5

    .line 262
    .end local v15           #i$:Ljava/util/Iterator;
    .local v6, pos:I
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v22

    .restart local v22       #rc:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v22, :cond_6

    .line 263
    add-int/lit8 v6, v6, -0x1

    aput-object v22, v5, v6

    .line 264
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_4
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .line 265
    .local v20, path:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 266
    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v10

    .local v10, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v0, v10

    move/from16 v18, v0

    .local v18, len$:I
    const/16 v16, 0x0

    .local v16, i$:I
    :goto_3
    move/from16 v0, v16

    move/from16 v1, v18

    if-ge v0, v1, :cond_4

    aget-object v12, v10, v16

    .line 267
    .local v12, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    const/4 v3, 0x1

    move-object/from16 v0, v20

    invoke-interface {v0, v12, v3}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->add(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z

    .line 266
    add-int/lit8 v16, v16, 0x1

    goto :goto_3

    .line 271
    .end local v10           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v12           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v16           #i$:I
    .end local v18           #len$:I
    .end local v20           #path:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    const/4 v9, 0x1

    invoke-interface {v3, v9}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_2

    .line 275
    :cond_6
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    .line 276
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .restart local v15       #i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .line 277
    .restart local v11       #bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    move-object/from16 v0, v23

    invoke-interface {v11, v0}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    goto :goto_4

    .line 280
    .end local v11           #bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .end local v15           #i$:Ljava/util/Iterator;
    :cond_7
    new-instance v7, Ljava/util/ArrayList;

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v7, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 281
    .local v7, distinctPaths:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;>;"
    :cond_8
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9

    .line 282
    sget-object v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->BUILDER_BY_CARDINALITY_DSC:Ljava/util/Comparator;

    move-object/from16 v0, v21

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 283
    const/4 v3, 0x0

    move-object/from16 v0, v21

    invoke-interface {v0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .line 284
    .local v17, largest:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    move-object/from16 v0, v17

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 288
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v14, v3, -0x1

    .local v14, i:I
    :goto_5
    if-ltz v14, :cond_8

    .line 289
    move-object/from16 v0, v21

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    move-object/from16 v0, v17

    invoke-interface {v3, v0}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .line 288
    add-int/lit8 v14, v14, -0x1

    goto :goto_5

    .line 292
    .end local v14           #i:I
    .end local v17           #largest:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    :cond_9
    new-instance v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v9}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;-><init>(Ljava/util/Set;[Lorg/eclipse/jgit/revwalk/RevCommit;ILjava/util/List;Ljava/lang/Iterable;Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;)V

    return-object v3
.end method

.method private nextSelectionDistance(II)I
    .locals 7
    .parameter "idx"
    .parameter "cardinality"

    .prologue
    const/16 v6, 0x64

    .line 296
    if-le p1, p2, :cond_0

    .line 297
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 298
    :cond_0
    sub-int v0, p2, p1

    .line 299
    .local v0, idxFromStart:I
    const/16 v2, 0x64

    .line 300
    .local v2, mustRegionEnd:I
    if-gt v0, v2, :cond_1

    .line 301
    const/4 v4, 0x0

    .line 310
    :goto_0
    return v4

    .line 304
    :cond_1
    const/16 v1, 0x4e20

    .line 305
    .local v1, minRegionEnd:I
    if-gt v0, v1, :cond_2

    .line 306
    sub-int v4, v0, v2

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    goto :goto_0

    .line 309
    :cond_2
    sub-int v4, v0, v1

    const/16 v5, 0x1388

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 310
    .local v3, next:I
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_0
.end method


# virtual methods
.method doCommitSelection(I)Ljava/util/Collection;
    .locals 34
    .parameter "expectedNumCommits"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v31

    move-object/from16 v0, v31

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->selectingCommits:Ljava/lang/String;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    invoke-interface/range {v30 .. v32}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 116
    new-instance v27, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    move-object/from16 v30, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 117
    .local v27, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->findPaths(Lorg/eclipse/jgit/revwalk/RevWalk;I)Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;

    move-result-object v24

    .line 118
    .local v24, result:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 120
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitsByOldest:[Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$000(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v30

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->commitStartPos:I
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$100(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)I

    move-result v31

    sub-int v29, v30, v31

    .line 121
    .local v29, totCommits:I
    new-instance v28, Lorg/eclipse/jgit/util/BlockList;

    div-int/lit8 v30, v29, 0x64

    add-int/lit8 v30, v30, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v30

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/BlockList;-><init>(I)V

    .line 123
    .local v28, selections:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->reuse:Ljava/lang/Iterable;
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/lang/Iterable;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;

    .line 124
    .local v25, reuse:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;
    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 126
    .end local v25           #reuse:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;
    :cond_0
    if-nez v29, :cond_1

    .line 127
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->peeledWant:Ljava/util/Set;
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/util/Set;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_15

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/eclipse/jgit/lib/AnyObjectId;

    .line 128
    .local v13, id:Lorg/eclipse/jgit/lib/AnyObjectId;
    new-instance v30, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    move-object/from16 v0, v30

    move/from16 v1, v31

    move/from16 v2, v32

    move-object/from16 v3, v33

    invoke-direct {v0, v13, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;ZILorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 132
    .end local v13           #id:Lorg/eclipse/jgit/lib/AnyObjectId;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v31

    move-object/from16 v0, v31

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->selectingCommits:Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    move/from16 v2, v29

    invoke-interface {v0, v1, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 134
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->paths:Ljava/util/List;
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$500(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/util/List;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .end local v10           #i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_13

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .line 135
    .local v5, bitmapableCommits:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->cardinality()I

    move-result v7

    .line 137
    .local v7, cardinality:I
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v26, running:Ljava/util/List;,"Ljava/util/List<Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;>;"
    const/4 v14, -0x1

    .line 143
    .local v14, index:I
    const/16 v30, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->nextSelectionDistance(II)I

    move-result v21

    .line 144
    .local v21, nextIn:I
    const/16 v30, 0x1388

    move/from16 v0, v21

    move/from16 v1, v30

    if-ne v0, v1, :cond_5

    const/16 v20, 0x1

    .line 145
    .local v20, nextFlg:I
    :goto_2
    if-nez v21, :cond_6

    const/16 v19, 0x1

    .line 146
    .local v19, mustPick:Z
    :goto_3
    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_3
    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_12

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 147
    .local v6, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-interface {v5, v6}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v30

    if-eqz v30, :cond_3

    .line 150
    add-int/lit8 v14, v14, 0x1

    .line 151
    add-int/lit8 v21, v21, -0x1

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 155
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->peeledWant:Ljava/util/Set;
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/util/Set;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-interface {v0, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_7

    .line 156
    if-lez v21, :cond_4

    .line 157
    const/16 v20, 0x0

    .line 163
    :cond_4
    move/from16 v8, v20

    .line 164
    .local v8, flags:I
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->nextSelectionDistance(II)I

    move-result v21

    .line 165
    const/16 v30, 0x1388

    move/from16 v0, v21

    move/from16 v1, v30

    if-ne v0, v1, :cond_8

    const/16 v20, 0x1

    .line 166
    :goto_5
    if-nez v21, :cond_9

    const/16 v19, 0x1

    .line 168
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->commitBitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;->newBitmapBuilder()Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$CompressedBitmapBuilder;

    move-result-object v9

    .line 169
    .local v9, fullBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 170
    move-object/from16 v0, v27

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 171
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->reuse:Ljava/lang/Iterable;
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/lang/Iterable;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/eclipse/jgit/lib/AnyObjectId;

    .line 172
    .local v22, objectId:Lorg/eclipse/jgit/lib/AnyObjectId;
    move-object/from16 v0, v27

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v30

    move-object/from16 v0, v27

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_7

    .line 144
    .end local v6           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v8           #flags:I
    .end local v9           #fullBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .end local v12           #i$:Ljava/util/Iterator;
    .end local v19           #mustPick:Z
    .end local v20           #nextFlg:I
    .end local v22           #objectId:Lorg/eclipse/jgit/lib/AnyObjectId;
    :cond_5
    const/16 v20, 0x0

    goto/16 :goto_2

    .line 145
    .restart local v20       #nextFlg:I
    :cond_6
    const/16 v19, 0x0

    goto/16 :goto_3

    .line 158
    .restart local v6       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v19       #mustPick:Z
    :cond_7
    if-nez v19, :cond_4

    if-gtz v21, :cond_3

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v30

    const/16 v31, 0x1

    move/from16 v0, v30

    move/from16 v1, v31

    if-gt v0, v1, :cond_4

    const/16 v30, -0x64

    move/from16 v0, v21

    move/from16 v1, v30

    if-le v0, v1, :cond_4

    goto/16 :goto_4

    .line 165
    .restart local v8       #flags:I
    :cond_8
    const/16 v20, 0x0

    goto :goto_5

    .line 166
    :cond_9
    const/16 v19, 0x0

    goto :goto_6

    .line 173
    .restart local v9       #fullBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .restart local v12       #i$:Ljava/util/Iterator;
    :cond_a
    const/16 v30, 0x0

    move-object/from16 v0, v30

    invoke-static {v0, v9}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->newRevFilter(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v30

    move-object/from16 v0, v27

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 176
    :cond_b
    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v30

    if-nez v30, :cond_b

    .line 180
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 182
    .local v18, matches:Ljava/util/List;,"Ljava/util/List<Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;>;"
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_c
    :goto_8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_d

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/List;

    .line 183
    .local v16, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v30

    add-int/lit8 v30, v30, -0x1

    move-object/from16 v0, v16

    move/from16 v1, v30

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;

    .line 184
    .local v15, last:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;
    invoke-interface {v9, v15}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v30

    if-eqz v30, :cond_c

    .line 185
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 189
    .end local v15           #last:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;
    .end local v16           #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    :cond_d
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v30

    if-eqz v30, :cond_f

    .line 190
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .local v17, match:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    :cond_e
    new-instance v31, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->isEmpty()Z

    move-result v30

    if-nez v30, :cond_11

    const/16 v30, 0x1

    :goto_9
    const/16 v32, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v30

    move-object/from16 v2, v32

    invoke-direct {v0, v6, v1, v8, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;ZILorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v31

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, v30

    move/from16 v1, v31

    invoke-virtual {v0, v6, v9, v1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->addBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;I)V

    goto/16 :goto_4

    .line 193
    .end local v17           #match:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    :cond_f
    const/16 v30, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v30

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/List;

    .line 195
    .restart local v17       #match:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_10
    :goto_a
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_e

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/List;

    .line 196
    .restart local v16       #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v30

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v31

    move/from16 v0, v30

    move/from16 v1, v31

    if-le v0, v1, :cond_10

    .line 197
    move-object/from16 v17, v16

    goto :goto_a

    .line 200
    .end local v16           #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    :cond_11
    const/16 v30, 0x0

    goto :goto_9

    .line 204
    .end local v6           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v8           #flags:I
    .end local v9           #fullBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .end local v12           #i$:Ljava/util/Iterator;
    .end local v17           #match:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    .end local v18           #matches:Ljava/util/List;,"Ljava/util/List<Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;>;"
    :cond_12
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :goto_b
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/List;

    .line 205
    .restart local v16       #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    move-object/from16 v0, v28

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/BlockList;->addAll(Ljava/util/Collection;)Z

    goto :goto_b

    .line 207
    .end local v5           #bitmapableCommits:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .end local v7           #cardinality:I
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v14           #index:I
    .end local v16           #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    .end local v19           #mustPick:Z
    .end local v20           #nextFlg:I
    .end local v21           #nextIn:I
    .end local v26           #running:Ljava/util/List;,"Ljava/util/List<Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;>;"
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->clearBitmaps()V

    .line 210
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->peeledWant:Ljava/util/Set;
    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;->access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$WalkResult;)Ljava/util/Set;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10       #i$:Ljava/util/Iterator;
    :goto_c
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_14

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lorg/eclipse/jgit/lib/AnyObjectId;

    .line 211
    .local v23, remainingWant:Lorg/eclipse/jgit/lib/AnyObjectId;
    new-instance v30, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, v23

    move/from16 v2, v31

    move/from16 v3, v32

    move-object/from16 v4, v33

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;ZILorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 213
    .end local v23           #remainingWant:Lorg/eclipse/jgit/lib/AnyObjectId;
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 214
    :cond_15
    return-object v28
.end method

.method newBitmapWalker()Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;
    .locals 4

    .prologue
    .line 314
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;

    new-instance v1, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->bitmapIndex:Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;-><init>(Lorg/eclipse/jgit/revwalk/ObjectWalk;Lorg/eclipse/jgit/lib/BitmapIndex;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    return-object v0
.end method
