.class abstract Lorg/eclipse/jgit/notes/NoteBucket;
.super Ljava/lang/Object;
.source "NoteBucket.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract estimateSize(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract getNote(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/Note;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract getTreeId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method abstract iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;
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
.end method

.method abstract set(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/notes/InMemoryNoteBucket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
