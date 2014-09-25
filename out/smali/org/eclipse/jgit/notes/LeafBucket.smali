.class Lorg/eclipse/jgit/notes/LeafBucket;
.super Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
.source "LeafBucket.java"


# static fields
.field static final MAX_SIZE:I = 0x100


# instance fields
.field private cnt:I

.field private notes:[Lorg/eclipse/jgit/notes/Note;


# direct methods
.method constructor <init>(I)V
    .locals 1
    .parameter "prefixLen"

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;-><init>(I)V

    .line 86
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/eclipse/jgit/notes/Note;

    iput-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    .line 87
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/notes/LeafBucket;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    return v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/notes/LeafBucket;)[Lorg/eclipse/jgit/notes/Note;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    return-object v0
.end method

.method private build()Lorg/eclipse/jgit/lib/TreeFormatter;
    .locals 9

    .prologue
    .line 190
    const/16 v2, 0x28

    new-array v1, v2, [B

    .line 191
    .local v1, nameBuf:[B
    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->prefixLen:I

    rsub-int/lit8 v3, v2, 0x28

    .line 192
    .local v3, nameLen:I
    new-instance v0, Lorg/eclipse/jgit/lib/TreeFormatter;

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/notes/LeafBucket;->treeSize(I)I

    move-result v2

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/lib/TreeFormatter;-><init>(I)V

    .line 193
    .local v0, fmt:Lorg/eclipse/jgit/lib/TreeFormatter;
    iget-object v6, p0, Lorg/eclipse/jgit/notes/LeafBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 195
    .local v6, e:Lorg/eclipse/jgit/notes/NonNoteEntry;
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    if-ge v7, v2, :cond_1

    .line 196
    iget-object v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    aget-object v8, v2, v7

    .line 198
    .local v8, n:Lorg/eclipse/jgit/notes/Note;
    const/4 v2, 0x0

    invoke-virtual {v8, v1, v2}, Lorg/eclipse/jgit/notes/Note;->copyTo([BI)V

    .line 200
    :goto_1
    if-eqz v6, :cond_0

    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->prefixLen:I

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v6, v1, v2, v3, v4}, Lorg/eclipse/jgit/notes/NonNoteEntry;->pathCompare([BIILorg/eclipse/jgit/lib/FileMode;)I

    move-result v2

    if-gez v2, :cond_0

    .line 202
    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/notes/NonNoteEntry;->format(Lorg/eclipse/jgit/lib/TreeFormatter;)V

    .line 203
    iget-object v6, v6, Lorg/eclipse/jgit/notes/NonNoteEntry;->next:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_1

    .line 206
    :cond_0
    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->prefixLen:I

    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v8}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/TreeFormatter;->append([BIILorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 195
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 209
    .end local v8           #n:Lorg/eclipse/jgit/notes/Note;
    :cond_1
    :goto_2
    if-eqz v6, :cond_2

    .line 210
    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/notes/NonNoteEntry;->format(Lorg/eclipse/jgit/lib/TreeFormatter;)V

    .line 209
    iget-object v6, v6, Lorg/eclipse/jgit/notes/NonNoteEntry;->next:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_2

    .line 211
    :cond_2
    return-object v0
.end method

.method private growIfFull()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 239
    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    array-length v1, v1

    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    if-ne v1, v2, :cond_0

    .line 240
    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [Lorg/eclipse/jgit/notes/Note;

    .line 241
    .local v0, n:[Lorg/eclipse/jgit/notes/Note;
    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    iput-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    .line 244
    .end local v0           #n:[Lorg/eclipse/jgit/notes/Note;
    :cond_0
    return-void
.end method

.method private search(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 5
    .parameter "objId"

    .prologue
    .line 90
    const/4 v2, 0x0

    .line 91
    .local v2, low:I
    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    .line 92
    .local v1, high:I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 93
    add-int v4, v2, v1

    ushr-int/lit8 v3, v4, 0x1

    .line 94
    .local v3, mid:I
    iget-object v4, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    aget-object v4, v4, v3

    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/lib/AnyObjectId;->compareTo(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 95
    .local v0, cmp:I
    if-gez v0, :cond_0

    .line 96
    move v1, v3

    goto :goto_0

    .line 97
    :cond_0
    if-nez v0, :cond_1

    .line 102
    .end local v0           #cmp:I
    .end local v3           #mid:I
    :goto_1
    return v3

    .line 100
    .restart local v0       #cmp:I
    .restart local v3       #mid:I
    :cond_1
    add-int/lit8 v2, v3, 0x1

    goto :goto_0

    .line 102
    .end local v0           #cmp:I
    .end local v3           #mid:I
    :cond_2
    add-int/lit8 v4, v2, 0x1

    neg-int v3, v4

    goto :goto_1
.end method

.method private shouldSplit()Z
    .locals 2

    .prologue
    .line 247
    const/16 v0, 0x100

    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    if-gt v0, v1, :cond_0

    iget v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->prefixLen:I

    add-int/lit8 v0, v0, 0x2

    const/16 v1, 0x28

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private treeSize(I)I
    .locals 4
    .parameter "nameLen"

    .prologue
    .line 215
    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-static {v3, p1}, Lorg/eclipse/jgit/lib/TreeFormatter;->entrySize(Lorg/eclipse/jgit/lib/FileMode;I)I

    move-result v3

    mul-int v1, v2, v3

    .line 216
    .local v1, sz:I
    iget-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .local v0, e:Lorg/eclipse/jgit/notes/NonNoteEntry;
    :goto_0
    if-eqz v0, :cond_0

    .line 217
    invoke-virtual {v0}, Lorg/eclipse/jgit/notes/NonNoteEntry;->treeEntrySize()I

    move-result v2

    add-int/2addr v1, v2

    .line 216
    iget-object v0, v0, Lorg/eclipse/jgit/notes/NonNoteEntry;->next:Lorg/eclipse/jgit/notes/NonNoteEntry;

    goto :goto_0

    .line 218
    :cond_0
    return v1
.end method


# virtual methods
.method append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 3
    .parameter "note"

    .prologue
    .line 228
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->shouldSplit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 229
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->split()Lorg/eclipse/jgit/notes/FanoutBucket;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/notes/FanoutBucket;->append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object p0

    .line 234
    .end local p0
    :goto_0
    return-object p0

    .line 232
    .restart local p0
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->growIfFull()V

    .line 233
    iget-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    aput-object p1, v0, v1

    goto :goto_0
.end method

.method estimateSize(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)I
    .locals 1
    .parameter "noteOn"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    iget v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    return v0
.end method

.method get(I)Lorg/eclipse/jgit/notes/Note;
    .locals 1
    .parameter "index"

    .prologue
    .line 112
    iget-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    aget-object v0, v0, p1

    return-object v0
.end method

.method getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;
    .locals 2
    .parameter "objId"
    .parameter "or"

    .prologue
    .line 107
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/LeafBucket;->search(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 108
    .local v0, idx:I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    aget-object v1, v1, v0

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getTreeId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2

    .prologue
    .line 186
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;-><init>()V

    invoke-direct {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->build()Lorg/eclipse/jgit/lib/TreeFormatter;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;->idFor(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;
    .locals 1
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

    .prologue
    .line 121
    new-instance v0, Lorg/eclipse/jgit/notes/LeafBucket$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/notes/LeafBucket$1;-><init>(Lorg/eclipse/jgit/notes/LeafBucket;)V

    return-object v0
.end method

.method parseOneEntry(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 4
    .parameter "noteOn"
    .parameter "noteData"

    .prologue
    .line 222
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->growIfFull()V

    .line 223
    iget-object v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    new-instance v2, Lorg/eclipse/jgit/notes/Note;

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lorg/eclipse/jgit/notes/Note;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    aput-object v2, v0, v1

    .line 224
    return-void
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
    .line 148
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/notes/LeafBucket;->search(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v0

    .line 149
    .local v0, p:I
    if-ltz v0, :cond_2

    .line 150
    if-eqz p2, :cond_1

    .line 151
    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    aget-object v1, v1, v0

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/notes/Note;->setData(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 175
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 155
    .restart local p0
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    iget v4, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    sub-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    invoke-static {v1, v2, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 156
    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    .line 157
    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    if-gtz v1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    .line 160
    :cond_2
    if-eqz p2, :cond_0

    .line 161
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->shouldSplit()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 162
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->split()Lorg/eclipse/jgit/notes/FanoutBucket;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Lorg/eclipse/jgit/notes/FanoutBucket;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object p0

    goto :goto_0

    .line 165
    :cond_3
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->growIfFull()V

    .line 166
    add-int/lit8 v1, v0, 0x1

    neg-int v0, v1

    .line 167
    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    if-ge v0, v1, :cond_4

    .line 168
    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    iget-object v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    add-int/lit8 v3, v0, 0x1

    iget v4, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 169
    :cond_4
    iget-object v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    new-instance v2, Lorg/eclipse/jgit/notes/Note;

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lorg/eclipse/jgit/notes/Note;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    aput-object v2, v1, v0

    .line 170
    iget v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    goto :goto_0
.end method

.method size()I
    .locals 1

    .prologue
    .line 116
    iget v0, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    return v0
.end method

.method split()Lorg/eclipse/jgit/notes/FanoutBucket;
    .locals 3

    .prologue
    .line 251
    new-instance v1, Lorg/eclipse/jgit/notes/FanoutBucket;

    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->prefixLen:I

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/notes/FanoutBucket;-><init>(I)V

    .line 252
    .local v1, n:Lorg/eclipse/jgit/notes/FanoutBucket;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->cnt:I

    if-ge v0, v2, :cond_0

    .line 253
    iget-object v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->notes:[Lorg/eclipse/jgit/notes/Note;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/notes/FanoutBucket;->append(Lorg/eclipse/jgit/notes/Note;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 254
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/notes/LeafBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    iput-object v2, v1, Lorg/eclipse/jgit/notes/FanoutBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 255
    return-object v1
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
    .line 181
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/LeafBucket;->build()Lorg/eclipse/jgit/lib/TreeFormatter;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method
