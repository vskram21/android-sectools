.class public Lorg/eclipse/jgit/notes/NoteMap;
.super Ljava/lang/Object;
.source "NoteMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/notes/Note;",
        ">;"
    }
.end annotation


# instance fields
.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 0
    .parameter "reader"

    .prologue
    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    iput-object p1, p0, Lorg/eclipse/jgit/notes/NoteMap;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 198
    return-void
.end method

.method private load(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "rootTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 392
    const-string v1, ""

    invoke-static {v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 393
    .local v0, none:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v0, p1, v1}, Lorg/eclipse/jgit/notes/NoteParser;->parse(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    .line 394
    return-void
.end method

.method public static newEmptyMap()Lorg/eclipse/jgit/notes/NoteMap;
    .locals 3

    .prologue
    .line 78
    new-instance v0, Lorg/eclipse/jgit/notes/NoteMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/notes/NoteMap;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 79
    .local v0, r:Lorg/eclipse/jgit/notes/NoteMap;
    new-instance v1, Lorg/eclipse/jgit/notes/LeafBucket;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    iput-object v1, v0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    .line 80
    return-object v0
.end method

.method static newMap(Lorg/eclipse/jgit/notes/InMemoryNoteBucket;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/NoteMap;
    .locals 1
    .parameter "root"
    .parameter "reader"

    .prologue
    .line 185
    new-instance v0, Lorg/eclipse/jgit/notes/NoteMap;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/notes/NoteMap;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 186
    .local v0, map:Lorg/eclipse/jgit/notes/NoteMap;
    iput-object p0, v0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    .line 187
    return-object v0
.end method

.method public static read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/notes/NoteMap;
    .locals 1
    .parameter "reader"
    .parameter "commit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/notes/NoteMap;->read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/revwalk/RevTree;)Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v0

    return-object v0
.end method

.method public static read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/revwalk/RevTree;)Lorg/eclipse/jgit/notes/NoteMap;
    .locals 1
    .parameter "reader"
    .parameter "tree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-static {p0, p1}, Lorg/eclipse/jgit/notes/NoteMap;->readTree(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v0

    return-object v0
.end method

.method public static readTree(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/notes/NoteMap;
    .locals 1
    .parameter "reader"
    .parameter "treeId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    new-instance v0, Lorg/eclipse/jgit/notes/NoteMap;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/notes/NoteMap;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 169
    .local v0, map:Lorg/eclipse/jgit/notes/NoteMap;
    invoke-direct {v0, p1}, Lorg/eclipse/jgit/notes/NoteMap;->load(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 170
    return-object v0
.end method

.method public static shortenRefName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "noteRefName"

    .prologue
    .line 91
    const-string v0, "refs/notes/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    const-string v0, "refs/notes/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 93
    .end local p0
    :cond_0
    return-object p0
.end method


# virtual methods
.method public contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/notes/NoteMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteMap;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, p1, v2}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    .line 223
    .local v0, n:Lorg/eclipse/jgit/notes/Note;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    goto :goto_0
.end method

.method public getCachedBytes(Lorg/eclipse/jgit/lib/AnyObjectId;I)[B
    .locals 2
    .parameter "id"
    .parameter "sizeLimit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/notes/NoteMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 281
    .local v0, dataId:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v0, :cond_0

    .line 282
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v1

    .line 284
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getNote(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/notes/Note;
    .locals 2
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, p1, v1}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method getRoot()Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/notes/Note;",
            ">;"
        }
    .end annotation

    .prologue
    .line 206
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    new-instance v2, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/notes/NoteMap;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public remove(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "noteOn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/notes/NoteMap;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 368
    return-void
.end method

.method public set(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectInserter;)V
    .locals 3
    .parameter "noteOn"
    .parameter "noteData"
    .parameter "ins"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    if-eqz p2, :cond_0

    .line 346
    invoke-static {p2}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v1

    .line 347
    .local v1, dataUTF8:[B
    const/4 v2, 0x3

    invoke-virtual {p3, v2, v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 351
    .end local v1           #dataUTF8:[B
    .local v0, dataId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_0
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/notes/NoteMap;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 352
    return-void

    .line 349
    .end local v0           #dataId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    const/4 v0, 0x0

    .restart local v0       #dataId:Lorg/eclipse/jgit/lib/ObjectId;
    goto :goto_0
.end method

.method public set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 3
    .parameter "noteOn"
    .parameter "noteData"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    iget-object v2, p0, Lorg/eclipse/jgit/notes/NoteMap;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, p1, p2, v2}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    .line 313
    .local v0, newRoot:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    if-nez v0, :cond_0

    .line 314
    new-instance v0, Lorg/eclipse/jgit/notes/LeafBucket;

    .end local v0           #newRoot:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/notes/LeafBucket;-><init>(I)V

    .line 315
    .restart local v0       #newRoot:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    iget-object v1, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    iget-object v1, v1, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    iput-object v1, v0, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->nonNotes:Lorg/eclipse/jgit/notes/NonNoteEntry;

    .line 317
    :cond_0
    iput-object v0, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    .line 318
    return-void
.end method

.method public writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "inserter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 382
    iget-object v0, p0, Lorg/eclipse/jgit/notes/NoteMap;->root:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method
