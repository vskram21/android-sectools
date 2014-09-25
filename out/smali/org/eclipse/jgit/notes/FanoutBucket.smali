.class Lorg/eclipse/jgit/notes/FanoutBucket;
.super Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
.source "FanoutBucket.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;
    }
.end annotation


# static fields
.field private static final hexchar:[B


# instance fields
.field private cnt:I

.field private final table:[Lorg/eclipse/jgit/notes/NoteBucket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 254
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/notes/FanoutBucket;->hexchar:[B

    return-void

    :array_0
    .array-data 0x1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method constructor <init>(I)V
    .locals 1
    .parameter "prefixLen"

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;-><init>(I)V

    .line 99
    const/16 v0, 0x100

    new-array v0, v0, [Lorg/eclipse/jgit/notes/NoteBucket;

    iput-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    .line 100
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/notes/FanoutBucket;)[Lorg/eclipse/jgit/notes/NoteBucket;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/FanoutBucket;->cell(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    return v0
.end method

.method private build(ZLorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/TreeFormatter;
    .locals 11
    .parameter "insert"
    .parameter "inserter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 273
    new-array v1, v3, [B

    .line 274
    .local v1, nameBuf:[B
    new-instance v0, Lorg/eclipse/jgit/lib/TreeFormatter;

    invoke-direct {p0}, Lorg/eclipse/jgit/notes/FanoutBucket;->treeSize()I

    move-result v4

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/lib/TreeFormatter;-><init>(I)V

    .line 275
    .local v0, fmt:Lorg/eclipse/jgit/lib/TreeFormatter;
    iget-object v8, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 277
    .local v8, e:Lorg/eclipse/jgit/notes/NonNoteEntry;
    const/4 v7, 0x0

    .local v7, cell:I
    :goto_0
    const/16 v4, 0x100

    if-ge v7, v4, :cond_3

    .line 278
    iget-object v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aget-object v6, v4, v7

    .line 279
    .local v6, b:Lorg/eclipse/jgit/notes/NoteBucket;
    if-nez v6, :cond_0

    .line 277
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 282
    :cond_0
    sget-object v4, Lorg/eclipse/jgit/notes/FanoutBucket;->hexchar:[B

    ushr-int/lit8 v9, v7, 0x4

    aget-byte v4, v4, v9

    aput-byte v4, v1, v2

    .line 283
    const/4 v4, 0x1

    sget-object v9, Lorg/eclipse/jgit/notes/FanoutBucket;->hexchar:[B

    and-int/lit8 v10, v7, 0xf

    aget-byte v9, v9, v10

    aput-byte v9, v1, v4

    .line 285
    :goto_2
    if-eqz v8, :cond_1

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v8, v1, v2, v3, v4}, Lorg/eclipse/jgit/notes/NonNoteEntry;->pathCompare([BIILorg/eclipse/jgit/lib/FileMode;)I

    move-result v4

    if-gez v4, :cond_1

    .line 286
    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/notes/NonNoteEntry;->format(Lorg/eclipse/jgit/lib/TreeFormatter;)V

    .line 287
    iget-object v8, v8, Lorg/eclipse/jgit/notes/NonNoteEntry;->next:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_2

    .line 291
    :cond_1
    if-eqz p1, :cond_2

    .line 292
    invoke-virtual {v6, p2}, Lorg/eclipse/jgit/notes/NoteBucket;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 296
    .local v5, id:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_3
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BIILorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_1

    .line 294
    .end local v5           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    invoke-virtual {v6}, Lorg/eclipse/jgit/notes/NoteBucket;->getTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .restart local v5       #id:Lorg/eclipse/jgit/lib/ObjectId;
    goto :goto_3

    .line 299
    .end local v5           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v6           #b:Lorg/eclipse/jgit/notes/NoteBucket;
    :cond_3
    :goto_4
    if-eqz v8, :cond_4

    .line 300
    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/notes/NonNoteEntry;->format(Lorg/eclipse/jgit/lib/TreeFormatter;)V

    .line 299
    iget-object v8, v8, Lorg/eclipse/jgit/notes/NonNoteEntry;->next:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_4

    .line 301
    :cond_4
    return-object v0
.end method

.method private cell(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 1
    .parameter "id"

    .prologue
    .line 330
    iget v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->prefixLen:I

    shr-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->getByte(I)I

    move-result v0

    return v0
.end method

.method static loadIfLazy(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 1
    .parameter "b"
    .parameter "prefix"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    if-nez p0, :cond_0

    .line 126
    const/4 p0, 0x0

    .line 129
    .end local p0
    :goto_0
    return-object p0

    .line 127
    .restart local p0
    :cond_0
    instance-of v0, p0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    if-eqz v0, :cond_1

    .line 128
    check-cast p0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    goto :goto_0

    .line 129
    :cond_1
    check-cast p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;

    .end local p0
    #calls: Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->load(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    invoke-static {p0, p1, p2}, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->access$000(Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object p0

    goto :goto_0
.end method

.method private treeSize()I
    .locals 5

    .prologue
    .line 305
    iget v2, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    const/4 v4, 0x2

    invoke-static {v3, v4}, Lorg/eclipse/jgit/lib/TreeFormatter;->entrySize(Lorg/eclipse/jgit/lib/FileMode;I)I

    move-result v3

    mul-int v1, v2, v3

    .line 306
    .local v1, sz:I
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .local v0, e:Lorg/eclipse/jgit/notes/NonNoteEntry;
    :goto_0
    if-eqz v0, :cond_0

    .line 307
    invoke-virtual {v0}, Lorg/eclipse/jgit/notes/NonNoteEntry;->treeEntrySize()I

    move-result v2

    add-int/2addr v1, v2

    .line 306
    iget-object v0, v0, Lorg/eclipse/jgit/notes/NonNoteEntry;->next:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_0

    .line 308
    :cond_0
    return v1
.end method


# virtual methods
.method append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 5
    .parameter "note"

    .prologue
    .line 313
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/FanoutBucket;->cell(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v1

    .line 314
    .local v1, cell:I
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aget-object v0, v3, v1

    check-cast v0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    .line 316
    .local v0, b:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    if-nez v0, :cond_1

    .line 317
    new-instance v2, Lorg/eclipse/jgit/notes/LeafBucket;

    iget v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->prefixLen:I

    add-int/lit8 v3, v3, 0x2

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    .line 318
    .local v2, n:Lorg/eclipse/jgit/notes/LeafBucket;
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/notes/LeafBucket;->append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v4

    aput-object v4, v3, v1

    .line 319
    iget v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    .line 326
    .end local v2           #n:Lorg/eclipse/jgit/notes/LeafBucket;
    :cond_0
    :goto_0
    return-object p0

    .line 322
    :cond_1
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v2

    .line 323
    .local v2, n:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    if-eq v2, v0, :cond_0

    .line 324
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aput-object v2, v3, v1

    goto :goto_0
.end method

.method contractIfTooSmall(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 4
    .parameter "noteOn"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/notes/FanoutBucket;->estimateSize(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)I

    move-result v2

    const/16 v3, 0x100

    if-ge v2, v3, :cond_1

    .line 244
    new-instance v1, Lorg/eclipse/jgit/notes/LeafBucket;

    iget v2, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->prefixLen:I

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    .line 245
    .local v1, r:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/notes/FanoutBucket;->iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;

    move-result-object v0

    .local v0, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/notes/Note;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 246
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/notes/Note;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v1

    goto :goto_0

    .line 247
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    iput-object v2, v1, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 251
    .end local v0           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/notes/Note;>;"
    .end local v1           #r:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    :goto_1
    return-object v1

    :cond_1
    move-object v1, p0

    goto :goto_1
.end method

.method estimateSize(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)I
    .locals 7
    .parameter "noteOn"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x100

    .line 183
    const/16 v4, 0xc0

    iget v5, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    if-gt v4, v5, :cond_1

    .line 184
    const/16 v3, 0x101

    .line 204
    :cond_0
    :goto_0
    return v3

    .line 190
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    .line 191
    .local v2, id:Lorg/eclipse/jgit/lib/MutableObjectId;
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 193
    const/4 v3, 0x0

    .line 194
    .local v3, sz:I
    const/4 v1, 0x0

    .local v1, cell:I
    :goto_1
    if-ge v1, v6, :cond_0

    .line 195
    iget-object v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aget-object v0, v4, v1

    .line 196
    .local v0, b:Lorg/eclipse/jgit/notes/NoteBucket;
    if-nez v0, :cond_3

    .line 194
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 199
    :cond_3
    iget v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->prefixLen:I

    shr-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v4, v1}, Lorg/eclipse/jgit/lib/MutableObjectId;->setByte(II)V

    .line 200
    invoke-virtual {v0, v2, p2}, Lorg/eclipse/jgit/notes/NoteBucket;->estimateSize(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)I

    move-result v4

    add-int/2addr v3, v4

    .line 201
    if-ge v6, v3, :cond_2

    goto :goto_0
.end method

.method getBucket(I)Lorg/eclipse/jgit/notes/NoteBucket;
    .locals 1
    .parameter "cell"

    .prologue
    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aget-object v0, v0, p1

    return-object v0
.end method

.method getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;
    .locals 3
    .parameter "objId"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v1, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/FanoutBucket;->cell(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v2

    aget-object v0, v1, v2

    .line 115
    .local v0, b:Lorg/eclipse/jgit/notes/NoteBucket;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/notes/NoteBucket;->getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getTreeId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 4

    .prologue
    .line 264
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lorg/eclipse/jgit/notes/FanoutBucket;->build(ZLorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/TreeFormatter;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;->idFor(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 265
    :catch_0
    move-exception v0

    .line 267
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;
    .locals 2
    .parameter "objId"
    .parameter "reader"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            "Lorg/eclipse/jgit/lib/ObjectReader;",
            ")",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/notes/Note;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    .line 136
    .local v0, id:Lorg/eclipse/jgit/lib/MutableObjectId;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 138
    new-instance v1, Lorg/eclipse/jgit/notes/FanoutBucket$1;

    invoke-direct {v1, p0, v0, p2}, Lorg/eclipse/jgit/notes/FanoutBucket$1;-><init>(Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/lib/MutableObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)V

    return-object v1
.end method

.method set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 5
    .parameter "noteOn"
    .parameter "noteData"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 210
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/FanoutBucket;->cell(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v1

    .line 211
    .local v1, cell:I
    iget-object v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aget-object v0, v4, v1

    .line 213
    .local v0, b:Lorg/eclipse/jgit/notes/NoteBucket;
    if-nez v0, :cond_2

    .line 214
    if-nez p2, :cond_1

    .line 236
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 217
    .restart local p0
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/notes/LeafBucket;

    iget v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->prefixLen:I

    add-int/lit8 v3, v3, 0x2

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    .line 218
    .local v2, n:Lorg/eclipse/jgit/notes/LeafBucket;
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    invoke-virtual {v2, p1, p2, p3}, Lorg/eclipse/jgit/notes/LeafBucket;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v4

    aput-object v4, v3, v1

    .line 219
    iget v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    goto :goto_0

    .line 223
    .end local v2           #n:Lorg/eclipse/jgit/notes/LeafBucket;
    :cond_2
    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/notes/NoteBucket;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v2

    .line 224
    .local v2, n:Lorg/eclipse/jgit/notes/NoteBucket;
    if-nez v2, :cond_4

    .line 225
    iget-object v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aput-object v3, v4, v1

    .line 226
    iget v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    .line 228
    iget v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    if-nez v4, :cond_3

    move-object p0, v3

    .line 229
    goto :goto_0

    .line 231
    :cond_3
    invoke-virtual {p0, p1, p3}, Lorg/eclipse/jgit/notes/FanoutBucket;->contractIfTooSmall(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object p0

    goto :goto_0

    .line 233
    :cond_4
    if-eq v2, v0, :cond_0

    .line 234
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aput-object v2, v3, v1

    goto :goto_0
.end method

.method setBucket(ILorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "cell"
    .parameter "id"

    .prologue
    .line 103
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    new-instance v1, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;

    invoke-direct {v1, p0, p2}, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;-><init>(Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/lib/ObjectId;)V

    aput-object v1, v0, p1

    .line 104
    iget v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    .line 105
    return-void
.end method

.method setBucket(ILorg/eclipse/jgit/notes/InMemoryNoteBucket;)V
    .locals 1
    .parameter "cell"
    .parameter "bucket"

    .prologue
    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;

    aput-object p2, v0, p1

    .line 109
    iget v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket;->cnt:I

    .line 110
    return-void
.end method

.method writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "inserter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/notes/FanoutBucket;->build(ZLorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/TreeFormatter;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method
