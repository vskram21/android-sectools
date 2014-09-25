.class public Lorg/eclipse/jgit/notes/DefaultNoteMerger;
.super Ljava/lang/Object;
.source "DefaultNoteMerger.java"

# interfaces
.implements Lorg/eclipse/jgit/notes/NoteMerger;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public merge(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/notes/Note;
    .locals 9
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"
    .parameter "reader"
    .parameter "inserter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    if-nez p2, :cond_1

    move-object p2, p3

    .line 88
    .end local p2
    .end local p3
    :cond_0
    :goto_0
    return-object p2

    .line 75
    .restart local p2
    .restart local p3
    :cond_1
    if-eqz p3, :cond_0

    .line 78
    invoke-virtual {p2}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {p3}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 81
    invoke-virtual {p2}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {p4, v4}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 82
    .local v0, lo:Lorg/eclipse/jgit/lib/ObjectLoader;
    invoke-virtual {p3}, Lorg/eclipse/jgit/notes/Note;->getData()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {p4, v4}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    .line 83
    .local v1, lt:Lorg/eclipse/jgit/lib/ObjectLoader;
    new-instance v3, Lorg/eclipse/jgit/util/io/UnionInputStream;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/io/InputStream;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->openStream()Lorg/eclipse/jgit/lib/ObjectStream;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/util/io/UnionInputStream;-><init>([Ljava/io/InputStream;)V

    .line 86
    .local v3, union:Lorg/eclipse/jgit/util/io/UnionInputStream;
    const/4 v4, 0x3

    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getSize()J

    move-result-wide v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getSize()J

    move-result-wide v7

    add-long/2addr v5, v7

    invoke-virtual {p5, v4, v5, v6, v3}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 88
    .local v2, noteData:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance p3, Lorg/eclipse/jgit/notes/Note;

    .end local p3
    invoke-direct {p3, p2, v2}, Lorg/eclipse/jgit/notes/Note;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    invoke-virtual {v3}, Lorg/eclipse/jgit/util/io/UnionInputStream;->close()V

    move-object p2, p3

    .line 88
    goto :goto_0

    .line 90
    .end local v2           #noteData:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v4

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/io/UnionInputStream;->close()V

    throw v4
.end method
