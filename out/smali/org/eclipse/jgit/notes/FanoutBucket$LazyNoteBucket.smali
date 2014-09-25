.class Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;
.super Lorg/eclipse/jgit/notes/NoteBucket;
.source "FanoutBucket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/notes/FanoutBucket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LazyNoteBucket"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

.field private final treeId:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter
    .parameter "treeId"

    .prologue
    .line 336
    iput-object p1, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    invoke-direct {p0}, Lorg/eclipse/jgit/notes/NoteBucket;-><init>()V

    .line 337
    iput-object p2, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 338
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 333
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->load(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    return-object v0
.end method

.method private load(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 4
    .parameter "prefix"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 374
    iget-object v2, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    iget v2, v2, Lorg/eclipse/jgit/notes/FanoutBucket;->prefixLen:I

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/lib/AnyObjectId;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 375
    .local v0, p:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    iget-object v2, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-static {v0, v2, p2}, Lorg/eclipse/jgit/notes/NoteParser;->parse(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v1

    .line 376
    .local v1, self:Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    iget-object v2, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    #getter for: Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;
    invoke-static {v2}, Lorg/eclipse/jgit/notes/FanoutBucket;->access$100(Lorg/eclipse/jgit/notes/FanoutBucket;)[Lorg/eclipse/jgit/notes/NoteBucket;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    #calls: Lorg/eclipse/jgit/notes/FanoutBucket;->cell(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    invoke-static {v3, p1}, Lorg/eclipse/jgit/notes/FanoutBucket;->access$200(Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v3

    aput-object v1, v2, v3

    .line 377
    return-object v1
.end method


# virtual methods
.method estimateSize(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)I
    .locals 1
    .parameter "objId"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->load(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->estimateSize(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)I

    move-result v0

    return v0
.end method

.method getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;
    .locals 1
    .parameter "objId"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->load(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method getTreeId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 369
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->load(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .locals 1
    .parameter "noteOn"
    .parameter "noteData"
    .parameter "or"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    invoke-direct {p0, p1, p3}, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->load(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/notes/InMemoryNoteBucket;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;

    move-result-object v0

    return-object v0
.end method

.method writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "inserter"

    .prologue
    .line 364
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket$LazyNoteBucket;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method
