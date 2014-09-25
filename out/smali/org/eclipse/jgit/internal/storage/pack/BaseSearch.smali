.class Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;
.super Ljava/lang/Object;
.source "BaseSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;
    }
.end annotation


# static fields
.field private static final M_BLOB:I

.field private static final M_TREE:I


# instance fields
.field private final alreadyProcessed:Lorg/eclipse/jgit/internal/storage/pack/IntSet;

.field private final baseTrees:[Lorg/eclipse/jgit/lib/ObjectId;

.field private final edgeObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;"
        }
    .end annotation
.end field

.field private final idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

.field private final objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;"
        }
    .end annotation
.end field

.field private final parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

.field private final progress:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private final treeCache:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v0

    sput v0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->M_BLOB:I

    .line 69
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v0

    sput v0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->M_TREE:I

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;Ljava/util/List;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 1
    .parameter "countingMonitor"
    .parameter
    .parameter
    .parameter
    .parameter "or"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevTree;",
            ">;",
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;",
            "Lorg/eclipse/jgit/lib/ObjectReader;",
            ")V"
        }
    .end annotation

    .prologue
    .line 91
    .local p2, bases:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/revwalk/RevTree;>;"
    .local p3, objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    .local p4, edges:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->progress:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 93
    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 94
    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectId;

    invoke-interface {p2, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/ObjectId;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->baseTrees:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 95
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 96
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->edgeObjects:Ljava/util/List;

    .line 98
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/IntSet;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/pack/IntSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->alreadyProcessed:Lorg/eclipse/jgit/internal/storage/pack/IntSet;

    .line 99
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->treeCache:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 100
    new-instance v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    .line 101
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 102
    return-void
.end method

.method private add(Lorg/eclipse/jgit/lib/AnyObjectId;II)V
    .locals 3
    .parameter "id"
    .parameter "objectType"
    .parameter "pathHash"

    .prologue
    .line 179
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    .line 180
    .local v0, obj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setEdge()V

    .line 181
    invoke-virtual {v0, p3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setPathHash(I)V

    .line 183
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->addIfAbsent(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 184
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->edgeObjects:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->progress:Lorg/eclipse/jgit/lib/ProgressMonitor;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 187
    :cond_0
    return-void
.end method

.method private static modeForType(I)I
    .locals 1
    .parameter "typeCode"

    .prologue
    .line 160
    packed-switch p0, :pswitch_data_0

    .line 168
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 162
    :pswitch_0
    sget v0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->M_TREE:I

    goto :goto_0

    .line 165
    :pswitch_1
    sget v0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->M_BLOB:I

    goto :goto_0

    .line 160
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static nextSlash([BII)I
    .locals 2
    .parameter "pathBuf"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 173
    :goto_0
    if-ge p1, p2, :cond_0

    aget-byte v0, p0, p1

    const/16 v1, 0x2f

    if-eq v0, v1, :cond_0

    .line 174
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 175
    :cond_0
    return p1
.end method

.method private readTree(Lorg/eclipse/jgit/lib/AnyObjectId;)[B
    .locals 5
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->treeCache:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;

    .line 192
    .local v2, tree:Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;
    if-eqz v2, :cond_0

    .line 193
    iget-object v0, v2, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;->buf:[B

    .line 198
    :goto_0
    return-object v0

    .line 195
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    const/4 v4, 0x2

    invoke-virtual {v3, p1, v4}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    .line 196
    .local v1, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    const v3, 0x7fffffff

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v0

    .line 197
    .local v0, buf:[B
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->treeCache:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    new-instance v4, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;

    invoke-direct {v4, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;[B)V

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    goto :goto_0
.end method


# virtual methods
.method addBase(I[BII)V
    .locals 15
    .parameter "objectType"
    .parameter "pathBuf"
    .parameter "pathLen"
    .parameter "pathHash"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->modeForType(I)I

    move-result v11

    .line 107
    .local v11, tailMode:I
    if-nez v11, :cond_1

    .line 157
    :cond_0
    return-void

    .line 110
    :cond_1
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->alreadyProcessed:Lorg/eclipse/jgit/internal/storage/pack/IntSet;

    move/from16 v0, p4

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/internal/storage/pack/IntSet;->add(I)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 113
    if-nez p3, :cond_2

    .line 114
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->baseTrees:[Lorg/eclipse/jgit/lib/ObjectId;

    .local v2, arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    array-length v7, v2

    .local v7, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v7, :cond_0

    aget-object v10, v2, v6

    .line 115
    .local v10, root:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v12, 0x2

    move/from16 v0, p4

    invoke-direct {p0, v10, v12, v0}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->add(Lorg/eclipse/jgit/lib/AnyObjectId;II)V

    .line 114
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 119
    .end local v2           #arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    .end local v6           #i$:I
    .end local v7           #len$:I
    .end local v10           #root:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    const/4 v12, 0x0

    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v0, v12, v1}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->nextSlash([BII)I

    move-result v5

    .line 121
    .local v5, firstSlash:I
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->baseTrees:[Lorg/eclipse/jgit/lib/ObjectId;

    .restart local v2       #arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    array-length v7, v2

    .restart local v7       #len$:I
    const/4 v6, 0x0

    .restart local v6       #i$:I
    :goto_1
    if-ge v6, v7, :cond_0

    aget-object v10, v2, v6

    .line 122
    .restart local v10       #root:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v9, 0x0

    .line 123
    .local v9, ptr:I
    move v4, v5

    .line 124
    .local v4, end:I
    move/from16 v0, p3

    if-eq v4, v0, :cond_3

    sget v8, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->M_TREE:I

    .line 126
    .local v8, mode:I
    :goto_2
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {p0, v10}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->readTree(Lorg/eclipse/jgit/lib/AnyObjectId;)[B

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset([B)V

    .line 127
    :goto_3
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->eof()Z

    move-result v12

    if-nez v12, :cond_5

    .line 128
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-object/from16 v0, p2

    invoke-virtual {v12, v0, v9, v4, v8}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->pathCompare([BIII)I

    move-result v3

    .line 130
    .local v3, cmp:I
    if-gez v3, :cond_4

    .line 131
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->next()Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    goto :goto_3

    .end local v3           #cmp:I
    .end local v8           #mode:I
    :cond_3
    move v8, v11

    .line 124
    goto :goto_2

    .line 135
    .restart local v3       #cmp:I
    .restart local v8       #mode:I
    :cond_4
    if-lez v3, :cond_6

    .line 121
    .end local v3           #cmp:I
    :cond_5
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 138
    .restart local v3       #cmp:I
    :cond_6
    move/from16 v0, p3

    if-ne v4, v0, :cond_7

    .line 139
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v12}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v12

    invoke-virtual {v12}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v12

    move/from16 v0, p1

    if-ne v12, v0, :cond_5

    .line 140
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v13, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idBuffer()[B

    move-result-object v13

    iget-object v14, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v14}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idOffset()I

    move-result v14

    invoke-virtual {v12, v13, v14}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 141
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    move/from16 v0, p1

    move/from16 v1, p4

    invoke-direct {p0, v12, v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->add(Lorg/eclipse/jgit/lib/AnyObjectId;II)V

    goto :goto_4

    .line 146
    :cond_7
    sget-object v12, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v13, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryRawMode()I

    move-result v13

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 149
    add-int/lit8 v9, v4, 0x1

    .line 150
    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v0, v9, v1}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->nextSlash([BII)I

    move-result v4

    .line 151
    move/from16 v0, p3

    if-eq v4, v0, :cond_8

    sget v8, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->M_TREE:I

    .line 153
    :goto_5
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v13, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idBuffer()[B

    move-result-object v13

    iget-object v14, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v14}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idOffset()I

    move-result v14

    invoke-virtual {v12, v13, v14}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromRaw([BI)V

    .line 154
    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->parser:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    iget-object v13, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {p0, v13}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->readTree(Lorg/eclipse/jgit/lib/AnyObjectId;)[B

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset([B)V

    goto/16 :goto_3

    :cond_8
    move v8, v11

    .line 151
    goto :goto_5
.end method
