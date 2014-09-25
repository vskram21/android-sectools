.class final Lorg/eclipse/jgit/notes/NoteParser;
.super Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
.source "NoteParser.java"


# instance fields
.field private firstNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

.field private lastNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

.field private final pathPadding:I

.field private final prefixLen:I


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 5
    .parameter "prefix"
    .parameter "r"
    .parameter "t"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 104
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>([BLorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 105
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->length()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->prefixLen:I

    .line 109
    iget v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->prefixLen:I

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathPadding:I

    .line 110
    iget v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathPadding:I

    if-lez v0, :cond_0

    .line 111
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->path:[B

    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->path:[B

    iget v3, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathPadding:I

    iget v4, p0, Lorg/eclipse/jgit/notes/NoteParser;->prefixLen:I

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 112
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 109
    goto :goto_0
.end method

.method private isHex()Z
    .locals 3

    .prologue
    .line 210
    :try_start_0
    iget v1, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathOffset:I

    .local v1, i:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathLen:I

    if-ge v1, v2, :cond_0

    .line 211
    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->path:[B

    aget-byte v2, v2, v1

    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 212
    :cond_0
    const/4 v2, 0x1

    .line 214
    .end local v1           #i:I
    :goto_1
    return v2

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, fail:Ljava/lang/ArrayIndexOutOfBoundsException;
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private isTree()Z
    .locals 2

    .prologue
    .line 205
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget v1, p0, Lorg/eclipse/jgit/notes/NoteParser;->mode:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    return v0
.end method

.method private parse()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 2

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->parseTree()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    .line 116
    .local v0, r:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteParser;->firstNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

    iput-object v1, v0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 117
    return-object v0
.end method

.method static parse(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 1
    .parameter "prefix"
    .parameter "treeId"
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v0, Lorg/eclipse/jgit/notes/NoteParser;

    invoke-direct {v0, p0, p2, p1}, Lorg/eclipse/jgit/notes/NoteParser;-><init>(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-direct {v0}, Lorg/eclipse/jgit/notes/NoteParser;->parse()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    return-object v0
.end method

.method private parseFanoutCell()I
    .locals 5

    .prologue
    const/4 v1, -0x1

    .line 177
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->getNameLength()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->isTree()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 179
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->path:[B

    iget v3, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathOffset:I

    add-int/lit8 v3, v3, 0x0

    aget-byte v2, v2, v3

    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I

    move-result v2

    shl-int/lit8 v2, v2, 0x4

    iget-object v3, p0, Lorg/eclipse/jgit/notes/NoteParser;->path:[B

    iget v4, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathOffset:I

    add-int/lit8 v4, v4, 0x1

    aget-byte v3, v3, v4

    invoke-static {v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    or-int/2addr v1, v2

    .line 185
    :cond_0
    :goto_0
    return v1

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, notHex:Ljava/lang/ArrayIndexOutOfBoundsException;
    goto :goto_0
.end method

.method private parseFanoutTree()Lorg/eclipse/jgit/notes/FanoutBucket;
    .locals 3

    .prologue
    .line 163
    new-instance v1, Lorg/eclipse/jgit/notes/FanoutBucket;

    iget v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->prefixLen:I

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/notes/FanoutBucket;-><init>(I)V

    .line 165
    .local v1, fanout:Lorg/eclipse/jgit/notes/FanoutBucket;
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->eof()Z

    move-result v2

    if-nez v2, :cond_1

    .line 166
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->parseFanoutCell()I

    move-result v0

    .line 167
    .local v0, cell:I
    if-ltz v0, :cond_0

    .line 168
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/eclipse/jgit/notes/FanoutBucket;->setBucket(ILorg/eclipse/jgit/lib/ObjectId;)V

    .line 165
    :goto_1
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/notes/NoteParser;->next(I)V

    goto :goto_0

    .line 170
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->storeNonNote()V

    goto :goto_1

    .line 173
    .end local v0           #cell:I
    :cond_1
    return-object v1
.end method

.method private parseLeafTree()Lorg/eclipse/jgit/notes/LeafBucket;
    .locals 3

    .prologue
    .line 137
    new-instance v1, Lorg/eclipse/jgit/notes/LeafBucket;

    iget v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->prefixLen:I

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    .line 138
    .local v1, leaf:Lorg/eclipse/jgit/notes/LeafBucket;
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    .line 140
    .local v0, idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->eof()Z

    move-result v2

    if-nez v2, :cond_1

    .line 141
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/notes/NoteParser;->parseObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 142
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/eclipse/jgit/notes/LeafBucket;->parseOneEntry(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 140
    :goto_1
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/notes/NoteParser;->next(I)V

    goto :goto_0

    .line 144
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->storeNonNote()V

    goto :goto_1

    .line 147
    :cond_1
    return-object v1
.end method

.method private parseObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;)Z
    .locals 4
    .parameter "id"

    .prologue
    const/4 v1, 0x0

    .line 151
    iget v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathLen:I

    iget v3, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathPadding:I

    add-int/lit8 v3, v3, 0x28

    if-ne v2, v3, :cond_0

    .line 153
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteParser;->path:[B

    iget v3, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathPadding:I

    invoke-virtual {p1, v2, v3}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromString([BI)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    const/4 v1, 0x1

    .line 159
    :cond_0
    :goto_0
    return v1

    .line 155
    :catch_0
    move-exception v0

    .line 156
    .local v0, notHex:Ljava/lang/ArrayIndexOutOfBoundsException;
    goto :goto_0
.end method

.method private parseTree()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 2

    .prologue
    .line 121
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->eof()Z

    move-result v0

    if-nez v0, :cond_2

    .line 122
    iget v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathLen:I

    iget v1, p0, Lorg/eclipse/jgit/notes/NoteParser;->pathPadding:I

    add-int/lit8 v1, v1, 0x28

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->isHex()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->parseLeafTree()Lorg/eclipse/jgit/notes/LeafBucket;

    move-result-object v0

    .line 133
    :goto_1
    return-object v0

    .line 125
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->getNameLength()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->isHex()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->isTree()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->parseFanoutTree()Lorg/eclipse/jgit/notes/FanoutBucket;

    move-result-object v0

    goto :goto_1

    .line 129
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteParser;->storeNonNote()V

    .line 121
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/notes/NoteParser;->next(I)V

    goto :goto_0

    .line 133
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/notes/LeafBucket;

    iget v1, p0, Lorg/eclipse/jgit/notes/NoteParser;->prefixLen:I

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    goto :goto_1
.end method

.method private storeNonNote()V
    .locals 5

    .prologue
    .line 190
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 191
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    .line 193
    .local v1, fileMode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/NoteParser;->getNameLength()I

    move-result v4

    new-array v3, v4, [B

    .line 194
    .local v3, name:[B
    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lorg/eclipse/jgit/notes/NoteParser;->getName([BI)V

    .line 196
    new-instance v0, Lorg/eclipse/jgit/notes/NonNoteEntry;

    invoke-direct {v0, v3, v1, v2}, Lorg/eclipse/jgit/notes/NonNoteEntry;-><init>([BLorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 197
    .local v0, ent:Lorg/eclipse/jgit/notes/NonNoteEntry;
    iget-object v4, p0, Lorg/eclipse/jgit/notes/NoteParser;->firstNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

    if-nez v4, :cond_0

    .line 198
    iput-object v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->firstNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 199
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/notes/NoteParser;->lastNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

    if-eqz v4, :cond_1

    .line 200
    iget-object v4, p0, Lorg/eclipse/jgit/notes/NoteParser;->lastNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

    iput-object v0, v4, Lorg/eclipse/jgit/notes/NonNoteEntry;->next:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 201
    :cond_1
    iput-object v0, p0, Lorg/eclipse/jgit/notes/NoteParser;->lastNonNote:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 202
    return-void
.end method
