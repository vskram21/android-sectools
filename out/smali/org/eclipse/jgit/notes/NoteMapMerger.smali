.class public Lorg/eclipse/jgit/notes/NoteMapMerger;
.super Ljava/lang/Object;
.source "NoteMapMerger.java"


# static fields
.field private static final EMPTY_FANOUT:Lorg/eclipse/jgit/notes/FanoutBucket;

.field private static final EMPTY_LEAF:Lorg/eclipse/jgit/notes/LeafBucket;


# instance fields
.field private final db:Lorg/eclipse/jgit/lib/Repository;

.field private final inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

.field private final nonNotesMergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

.field private final noteMerger:Lorg/eclipse/jgit/notes/NoteMerger;

.field private final objectIdPrefix:Lorg/eclipse/jgit/lib/MutableObjectId;

.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 69
    new-instance v0, Lorg/eclipse/jgit/notes/FanoutBucket;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/notes/FanoutBucket;-><init>(I)V

    sput-object v0, Lorg/eclipse/jgit/notes/NoteMapMerger;->EMPTY_FANOUT:Lorg/eclipse/jgit/notes/FanoutBucket;

    .line 71
    new-instance v0, Lorg/eclipse/jgit/notes/LeafBucket;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    sput-object v0, Lorg/eclipse/jgit/notes/NoteMapMerger;->EMPTY_LEAF:Lorg/eclipse/jgit/notes/LeafBucket;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "db"

    .prologue
    .line 115
    new-instance v0, Lorg/eclipse/jgit/notes/DefaultNoteMerger;

    invoke-direct {v0}, Lorg/eclipse/jgit/notes/DefaultNoteMerger;-><init>()V

    sget-object v1, Lorg/eclipse/jgit/merge/MergeStrategy;->RESOLVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    invoke-direct {p0, p1, v0, v1}, Lorg/eclipse/jgit/notes/NoteMapMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/notes/NoteMerger;Lorg/eclipse/jgit/merge/MergeStrategy;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/notes/NoteMerger;Lorg/eclipse/jgit/merge/MergeStrategy;)V
    .locals 1
    .parameter "db"
    .parameter "noteMerger"
    .parameter "nonNotesMergeStrategy"

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 99
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 100
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    .line 101
    iput-object p2, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->noteMerger:Lorg/eclipse/jgit/notes/NoteMerger;

    .line 102
    iput-object p3, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->nonNotesMergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 103
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->objectIdPrefix:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 104
    return-void
.end method

.method private static addIfNotNull(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 0
    .parameter "result"
    .parameter "note"

    .prologue
    .line 309
    if-eqz p1, :cond_0

    .line 310
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object p0

    .line 312
    .end local p0
    :cond_0
    return-object p0
.end method

.method private addIfNotNull(Lorg/eclipse/jgit/notes/FanoutBucket;ILorg/eclipse/jgit/notes/NoteBucket;)V
    .locals 1
    .parameter "b"
    .parameter "cell"
    .parameter "child"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    if-nez p3, :cond_0

    .line 231
    .end local p3
    :goto_0
    return-void

    .line 227
    .restart local p3
    :cond_0
    instance-of v0, p3, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    if-eqz v0, :cond_1

    .line 228
    check-cast p3, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    .end local p3
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {p3, v0}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lorg/eclipse/jgit/notes/FanoutBucket;->setBucket(ILorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 230
    .restart local p3
    :cond_1
    invoke-virtual {p3}, Lorg/eclipse/jgit/notes/NoteBucket;->getTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lorg/eclipse/jgit/notes/FanoutBucket;->setBucket(ILorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0
.end method

.method private asFanout(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/FanoutBucket;
    .locals 1
    .parameter "bucket"

    .prologue
    .line 175
    if-nez p1, :cond_0

    .line 176
    sget-object p1, Lorg/eclipse/jgit/notes/NoteMapMerger;->EMPTY_FANOUT:Lorg/eclipse/jgit/notes/FanoutBucket;

    .line 179
    .end local p1
    :goto_0
    return-object p1

    .line 177
    .restart local p1
    :cond_0
    instance-of v0, p1, Lorg/eclipse/jgit/notes/FanoutBucket;

    if-eqz v0, :cond_1

    .line 178
    check-cast p1, Lorg/eclipse/jgit/notes/FanoutBucket;

    goto :goto_0

    .line 179
    :cond_1
    check-cast p1, Lorg/eclipse/jgit/notes/LeafBucket;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/notes/LeafBucket;->split()Lorg/eclipse/jgit/notes/FanoutBucket;

    move-result-object p1

    goto :goto_0
.end method

.method private static equals(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/notes/NoteBucket;)Z
    .locals 3
    .parameter "a"
    .parameter "b"

    .prologue
    const/4 v0, 0x1

    .line 218
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    .line 220
    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteBucket;->getTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/notes/NoteBucket;->getTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static get(Lorg/eclipse/jgit/notes/LeafBucket;I)Lorg/eclipse/jgit/notes/Note;
    .locals 1
    .parameter "b"
    .parameter "i"

    .prologue
    .line 278
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/notes/LeafBucket;->get(I)Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private merge(ILorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 4
    .parameter "treeDepth"
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    instance-of v1, p2, Lorg/eclipse/jgit/notes/FanoutBucket;

    if-nez v1, :cond_0

    instance-of v1, p3, Lorg/eclipse/jgit/notes/FanoutBucket;

    if-nez v1, :cond_0

    instance-of v1, p4, Lorg/eclipse/jgit/notes/FanoutBucket;

    if-eqz v1, :cond_1

    .line 161
    :cond_0
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->asFanout(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/FanoutBucket;

    move-result-object v1

    invoke-direct {p0, p3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->asFanout(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/FanoutBucket;

    move-result-object v2

    invoke-direct {p0, p4}, Lorg/eclipse/jgit/notes/NoteMapMerger;->asFanout(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/FanoutBucket;

    move-result-object v3

    invoke-direct {p0, p1, v1, v2, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->mergeFanoutBucket(ILorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/notes/FanoutBucket;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    .line 169
    .local v0, result:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    :goto_0
    invoke-static {p2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->nonNotes(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/NonNoteEntry;

    move-result-object v1

    invoke-static {p3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->nonNotes(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/NonNoteEntry;

    move-result-object v2

    invoke-static {p4}, Lorg/eclipse/jgit/notes/NoteMapMerger;->nonNotes(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/NonNoteEntry;

    move-result-object v3

    invoke-direct {p0, v1, v2, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->mergeNonNotes(Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;)Lorg/eclipse/jgit/notes/NonNoteEntry;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 171
    return-object v0

    .end local v0           #result:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    :cond_1
    move-object v1, p2

    .line 165
    check-cast v1, Lorg/eclipse/jgit/notes/LeafBucket;

    move-object v2, p3

    check-cast v2, Lorg/eclipse/jgit/notes/LeafBucket;

    move-object v3, p4

    check-cast v3, Lorg/eclipse/jgit/notes/LeafBucket;

    invoke-direct {p0, p1, v1, v2, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->mergeLeafBucket(ILorg/eclipse/jgit/notes/LeafBucket;Lorg/eclipse/jgit/notes/LeafBucket;Lorg/eclipse/jgit/notes/LeafBucket;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    .restart local v0       #result:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    goto :goto_0
.end method

.method private mergeFanoutBucket(ILorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/notes/FanoutBucket;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 11
    .parameter "treeDepth"
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    new-instance v4, Lorg/eclipse/jgit/notes/FanoutBucket;

    mul-int/lit8 v6, p1, 0x2

    invoke-direct {v4, v6}, Lorg/eclipse/jgit/notes/FanoutBucket;-><init>(I)V

    .line 191
    .local v4, result:Lorg/eclipse/jgit/notes/FanoutBucket;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    const/16 v6, 0x100

    if-ge v1, v6, :cond_3

    .line 192
    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/notes/FanoutBucket;->getBucket(I)Lorg/eclipse/jgit/notes/NoteBucket;

    move-result-object v0

    .line 193
    .local v0, b:Lorg/eclipse/jgit/notes/NoteBucket;
    invoke-virtual {p3, v1}, Lorg/eclipse/jgit/notes/FanoutBucket;->getBucket(I)Lorg/eclipse/jgit/notes/NoteBucket;

    move-result-object v3

    .line 194
    .local v3, o:Lorg/eclipse/jgit/notes/NoteBucket;
    invoke-virtual {p4, v1}, Lorg/eclipse/jgit/notes/FanoutBucket;->getBucket(I)Lorg/eclipse/jgit/notes/NoteBucket;

    move-result-object v5

    .line 196
    .local v5, t:Lorg/eclipse/jgit/notes/NoteBucket;
    invoke-static {v3, v5}, Lorg/eclipse/jgit/notes/NoteMapMerger;->equals(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/notes/NoteBucket;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 197
    invoke-direct {p0, v4, v1, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->addIfNotNull(Lorg/eclipse/jgit/notes/FanoutBucket;ILorg/eclipse/jgit/notes/NoteBucket;)V

    .line 191
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 199
    :cond_0
    invoke-static {v0, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->equals(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/notes/NoteBucket;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 200
    invoke-direct {p0, v4, v1, v5}, Lorg/eclipse/jgit/notes/NoteMapMerger;->addIfNotNull(Lorg/eclipse/jgit/notes/FanoutBucket;ILorg/eclipse/jgit/notes/NoteBucket;)V

    goto :goto_1

    .line 202
    :cond_1
    invoke-static {v0, v5}, Lorg/eclipse/jgit/notes/NoteMapMerger;->equals(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/notes/NoteBucket;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 203
    invoke-direct {p0, v4, v1, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->addIfNotNull(Lorg/eclipse/jgit/notes/FanoutBucket;ILorg/eclipse/jgit/notes/NoteBucket;)V

    goto :goto_1

    .line 206
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->objectIdPrefix:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v6, p1, v1}, Lorg/eclipse/jgit/lib/MutableObjectId;->setByte(II)V

    .line 207
    add-int/lit8 v6, p1, 0x1

    iget-object v7, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->objectIdPrefix:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v8, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v0, v7, v8}, Lorg/eclipse/jgit/notes/FanoutBucket;->loadIfLazy(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v7

    iget-object v8, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->objectIdPrefix:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v9, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v3, v8, v9}, Lorg/eclipse/jgit/notes/FanoutBucket;->loadIfLazy(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v8

    iget-object v9, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->objectIdPrefix:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v10, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v5, v9, v10}, Lorg/eclipse/jgit/notes/FanoutBucket;->loadIfLazy(Lorg/eclipse/jgit/notes/NoteBucket;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v9

    invoke-direct {p0, v6, v7, v8, v9}, Lorg/eclipse/jgit/notes/NoteMapMerger;->merge(ILorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v2

    .line 211
    .local v2, mergedBucket:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    invoke-virtual {v4, v1, v2}, Lorg/eclipse/jgit/notes/FanoutBucket;->setBucket(ILorg/eclipse/jgit/notes/InMemoryNoteBucket;)V

    goto :goto_1

    .line 214
    .end local v0           #b:Lorg/eclipse/jgit/notes/NoteBucket;
    .end local v2           #mergedBucket:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .end local v3           #o:Lorg/eclipse/jgit/notes/NoteBucket;
    .end local v5           #t:Lorg/eclipse/jgit/notes/NoteBucket;
    :cond_3
    iget-object v6, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->objectIdPrefix:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v7, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v4, v6, v7}, Lorg/eclipse/jgit/notes/FanoutBucket;->contractIfTooSmall(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v6

    return-object v6
.end method

.method private mergeLeafBucket(ILorg/eclipse/jgit/notes/LeafBucket;Lorg/eclipse/jgit/notes/LeafBucket;Lorg/eclipse/jgit/notes/LeafBucket;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 11
    .parameter "treeDepth"
    .parameter "bb"
    .parameter "ob"
    .parameter "tb"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    invoke-static {p2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->notNullOrEmpty(Lorg/eclipse/jgit/notes/LeafBucket;)Lorg/eclipse/jgit/notes/LeafBucket;

    move-result-object p2

    .line 237
    invoke-static {p3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->notNullOrEmpty(Lorg/eclipse/jgit/notes/LeafBucket;)Lorg/eclipse/jgit/notes/LeafBucket;

    move-result-object p3

    .line 238
    invoke-static {p4}, Lorg/eclipse/jgit/notes/NoteMapMerger;->notNullOrEmpty(Lorg/eclipse/jgit/notes/LeafBucket;)Lorg/eclipse/jgit/notes/LeafBucket;

    move-result-object p4

    .line 240
    new-instance v9, Lorg/eclipse/jgit/notes/LeafBucket;

    mul-int/lit8 v0, p1, 0x2

    invoke-direct {v9, v0}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    .line 241
    .local v9, result:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    const/4 v6, 0x0

    .local v6, bi:I
    const/4 v8, 0x0

    .local v8, oi:I
    const/4 v10, 0x0

    .line 242
    .local v10, ti:I
    :cond_0
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/notes/LeafBucket;->size()I

    move-result v0

    if-lt v6, v0, :cond_1

    invoke-virtual {p3}, Lorg/eclipse/jgit/notes/LeafBucket;->size()I

    move-result v0

    if-lt v8, v0, :cond_1

    invoke-virtual {p4}, Lorg/eclipse/jgit/notes/LeafBucket;->size()I

    move-result v0

    if-ge v10, v0, :cond_7

    .line 243
    :cond_1
    invoke-static {p2, v6}, Lorg/eclipse/jgit/notes/NoteMapMerger;->get(Lorg/eclipse/jgit/notes/LeafBucket;I)Lorg/eclipse/jgit/notes/Note;

    move-result-object v1

    .local v1, b:Lorg/eclipse/jgit/notes/Note;
    invoke-static {p3, v8}, Lorg/eclipse/jgit/notes/NoteMapMerger;->get(Lorg/eclipse/jgit/notes/LeafBucket;I)Lorg/eclipse/jgit/notes/Note;

    move-result-object v2

    .local v2, o:Lorg/eclipse/jgit/notes/Note;
    invoke-static {p4, v10}, Lorg/eclipse/jgit/notes/NoteMapMerger;->get(Lorg/eclipse/jgit/notes/LeafBucket;I)Lorg/eclipse/jgit/notes/Note;

    move-result-object v3

    .line 244
    .local v3, t:Lorg/eclipse/jgit/notes/Note;
    invoke-static {v1, v2, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->min(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v7

    .line 246
    .local v7, min:Lorg/eclipse/jgit/notes/Note;
    invoke-static {v7, v1}, Lorg/eclipse/jgit/notes/NoteMapMerger;->sameNoteOrNull(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v1

    .line 247
    invoke-static {v7, v2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->sameNoteOrNull(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v2

    .line 248
    invoke-static {v7, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->sameNoteOrNull(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v3

    .line 250
    invoke-static {v2, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->sameContent(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 251
    invoke-static {v9, v2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->addIfNotNull(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v9

    .line 263
    :goto_1
    if-eqz v1, :cond_2

    .line 264
    add-int/lit8 v6, v6, 0x1

    .line 265
    :cond_2
    if-eqz v2, :cond_3

    .line 266
    add-int/lit8 v8, v8, 0x1

    .line 267
    :cond_3
    if-eqz v3, :cond_0

    .line 268
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 253
    :cond_4
    invoke-static {v1, v2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->sameContent(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 254
    invoke-static {v9, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->addIfNotNull(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v9

    goto :goto_1

    .line 256
    :cond_5
    invoke-static {v1, v3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->sameContent(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 257
    invoke-static {v9, v2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->addIfNotNull(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v9

    goto :goto_1

    .line 260
    :cond_6
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->noteMerger:Lorg/eclipse/jgit/notes/NoteMerger;

    iget-object v4, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v5, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-interface/range {v0 .. v5}, Lorg/eclipse/jgit/notes/NoteMerger;->merge(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    invoke-static {v9, v0}, Lorg/eclipse/jgit/notes/NoteMapMerger;->addIfNotNull(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v9

    goto :goto_1

    .line 270
    .end local v1           #b:Lorg/eclipse/jgit/notes/Note;
    .end local v2           #o:Lorg/eclipse/jgit/notes/Note;
    .end local v3           #t:Lorg/eclipse/jgit/notes/Note;
    .end local v7           #min:Lorg/eclipse/jgit/notes/Note;
    :cond_7
    return-object v9
.end method

.method private mergeNonNotes(Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;)Lorg/eclipse/jgit/notes/NonNoteEntry;
    .locals 9
    .parameter "baseList"
    .parameter "oursList"
    .parameter "theirsList"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 317
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    if-nez p3, :cond_0

    .line 318
    const/4 v6, 0x0

    .line 333
    :goto_0
    return-object v6

    .line 320
    :cond_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/NoteMapMerger;->write(Lorg/eclipse/jgit/notes/NonNoteEntry;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 321
    .local v0, baseId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/notes/NoteMapMerger;->write(Lorg/eclipse/jgit/notes/NonNoteEntry;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 322
    .local v3, oursId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-direct {p0, p3}, Lorg/eclipse/jgit/notes/NoteMapMerger;->write(Lorg/eclipse/jgit/notes/NonNoteEntry;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 323
    .local v5, theirsId:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v6, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 325
    iget-object v6, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->nonNotesMergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    iget-object v7, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6, v7, v8}, Lorg/eclipse/jgit/merge/MergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;

    move-result-object v1

    .line 326
    .local v1, m:Lorg/eclipse/jgit/merge/Merger;
    instance-of v6, v1, Lorg/eclipse/jgit/merge/ThreeWayMerger;

    if-eqz v6, :cond_1

    move-object v6, v1

    .line 327
    check-cast v6, Lorg/eclipse/jgit/merge/ThreeWayMerger;

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/merge/ThreeWayMerger;->setBase(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 328
    :cond_1
    const/4 v6, 0x2

    new-array v6, v6, [Lorg/eclipse/jgit/lib/AnyObjectId;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    aput-object v5, v6, v8

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/merge/Merger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 329
    new-instance v6, Lorg/eclipse/jgit/notes/NotesMergeConflictException;

    invoke-direct {v6, p1, p2, p3}, Lorg/eclipse/jgit/notes/NotesMergeConflictException;-><init>(Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;Lorg/eclipse/jgit/notes/NonNoteEntry;)V

    throw v6

    .line 331
    :cond_2
    invoke-virtual {v1}, Lorg/eclipse/jgit/merge/Merger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 332
    .local v4, resultTreeId:Lorg/eclipse/jgit/lib/ObjectId;
    const-string v6, ""

    invoke-static {v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v2

    .line 333
    .local v2, none:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    iget-object v6, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v2, v4, v6}, Lorg/eclipse/jgit/notes/NoteParser;->parse(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_0
.end method

.method private static min(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/Note;
    .locals 2
    .parameter "b"
    .parameter "o"
    .parameter "t"

    .prologue
    .line 282
    move-object v0, p0

    .line 283
    .local v0, min:Lorg/eclipse/jgit/notes/Note;
    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/notes/Note;->compareTo(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v1

    if-gez v1, :cond_1

    .line 284
    :cond_0
    move-object v0, p1

    .line 285
    :cond_1
    if-eqz v0, :cond_2

    if-eqz p2, :cond_3

    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/notes/Note;->compareTo(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v1

    if-gez v1, :cond_3

    .line 286
    :cond_2
    move-object v0, p2

    .line 287
    :cond_3
    return-object v0
.end method

.method private static nonNotes(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/NonNoteEntry;
    .locals 1
    .parameter "b"

    .prologue
    .line 183
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_0
.end method

.method private static notNullOrEmpty(Lorg/eclipse/jgit/notes/LeafBucket;)Lorg/eclipse/jgit/notes/LeafBucket;
    .locals 0
    .parameter "b"

    .prologue
    .line 274
    if-eqz p0, :cond_0

    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    sget-object p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->EMPTY_LEAF:Lorg/eclipse/jgit/notes/LeafBucket;

    goto :goto_0
.end method

.method private static sameContent(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Z
    .locals 3
    .parameter "a"
    .parameter "b"

    .prologue
    const/4 v0, 0x1

    .line 301
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    .line 303
    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static sameNote(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Z
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    const/4 v0, 0x1

    .line 295
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    .line 297
    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-static {p0, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static sameNoteOrNull(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/Note;
    .locals 1
    .parameter "min"
    .parameter "other"

    .prologue
    .line 291
    invoke-static {p0, p1}, Lorg/eclipse/jgit/notes/NoteMapMerger;->sameNote(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;)Z

    move-result v0

    if-eqz v0, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    const/4 p1, 0x0

    goto :goto_0
.end method

.method private write(Lorg/eclipse/jgit/notes/NonNoteEntry;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "list"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 338
    new-instance v0, Lorg/eclipse/jgit/notes/LeafBucket;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    .line 339
    .local v0, b:Lorg/eclipse/jgit/notes/LeafBucket;
    iput-object p1, v0, Lorg/eclipse/jgit/notes/LeafBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 340
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/notes/LeafBucket;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public merge(Lorg/eclipse/jgit/notes/NoteMap;Lorg/eclipse/jgit/notes/NoteMap;Lorg/eclipse/jgit/notes/NoteMap;)Lorg/eclipse/jgit/notes/NoteMap;
    .locals 5
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/notes/NoteMap;->getRoot()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v2

    invoke-virtual {p2}, Lorg/eclipse/jgit/notes/NoteMap;->getRoot()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v3

    invoke-virtual {p3}, Lorg/eclipse/jgit/notes/NoteMap;->getRoot()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v4

    invoke-direct {p0, v1, v2, v3, v4}, Lorg/eclipse/jgit/notes/NoteMapMerger;->merge(ILorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/notes/InMemoryNoteBucket;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    .line 135
    .local v0, mergedBucket:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 136
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v0, v1}, Lorg/eclipse/jgit/notes/NoteMap;->newMap(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/NoteMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 138
    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 139
    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 136
    return-object v1

    .line 138
    .end local v0           #mergedBucket:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 139
    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteMapMerger;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 138
    throw v1
.end method
