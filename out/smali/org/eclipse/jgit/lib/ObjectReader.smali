.class public abstract Lorg/eclipse/jgit/lib/ObjectReader;
.super Ljava/lang/Object;
.source "ObjectReader.java"


# static fields
.field public static final OBJ_ANY:I = -0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    const/4 v0, 0x7

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    return-object v0
.end method

.method public abbreviate(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 8
    .parameter "objectId"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x28

    const/4 v6, 0x1

    .line 125
    if-ne p2, v7, :cond_1

    .line 126
    invoke-static {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 142
    :cond_0
    return-object v0

    .line 128
    :cond_1
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 129
    .local v0, abbrev:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;

    move-result-object v3

    .line 130
    .local v3, matches:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v5

    if-ge v6, v5, :cond_0

    if-ge p2, v7, :cond_0

    .line 131
    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    .line 132
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0x8

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 133
    .local v4, n:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ObjectId;

    .line 134
    .local v1, candidate:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v5

    if-nez v5, :cond_2

    .line 135
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 137
    .end local v1           #candidate:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v6, v5, :cond_4

    .line 138
    move-object v3, v4

    goto :goto_0

    .line 140
    :cond_4
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;

    move-result-object v3

    goto :goto_0
.end method

.method public getBitmapIndex()Lorg/eclipse/jgit/lib/BitmapIndex;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 462
    const/4 v0, 0x0

    return-object v0
.end method

.method public getObjectSize(Lorg/eclipse/jgit/lib/AnyObjectId;I)J
    .locals 2
    .parameter "objectId"
    .parameter "typeHint"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 341
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectLoader;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getObjectSize(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;
    .locals 2
    .parameter
    .parameter "reportMissing"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">(",
            "Ljava/lang/Iterable",
            "<TT;>;Z)",
            "Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 362
    .local p1, objectIds:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TT;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 363
    .local v0, idItr:Ljava/util/Iterator;,"Ljava/util/Iterator<TT;>;"
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectReader$2;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/lib/ObjectReader$2;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public abstract getShallowCommits()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->has(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z

    move-result v0

    return v0
.end method

.method public has(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z
    .locals 2
    .parameter "objectId"
    .parameter "typeHint"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    const/4 v1, 0x1

    .line 212
    :goto_0
    return v1

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public abstract newReader()Lorg/eclipse/jgit/lib/ObjectReader;
.end method

.method public open(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;
    .locals 2
    .parameter
    .parameter "reportMissing"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">(",
            "Ljava/lang/Iterable",
            "<TT;>;Z)",
            "Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 280
    .local p1, objectIds:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TT;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 281
    .local v0, idItr:Ljava/util/Iterator;,"Ljava/util/Iterator<TT;>;"
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectReader$1;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/lib/ObjectReader$1;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 1
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 229
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    return-object v0
.end method

.method public abstract open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public release()V
    .locals 0

    .prologue
    .line 473
    return-void
.end method

.method public abstract resolve(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public setAvoidUnreachableObjects(Z)V
    .locals 0
    .parameter "avoid"

    .prologue
    .line 451
    return-void
.end method

.method public walkAdviceBeginCommits(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Collection;)V
    .locals 0
    .parameter "walk"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/RevWalk;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 415
    .local p2, roots:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    return-void
.end method

.method public walkAdviceBeginTrees(Lorg/eclipse/jgit/revwalk/ObjectWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 0
    .parameter "ow"
    .parameter "min"
    .parameter "max"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 432
    return-void
.end method

.method public walkAdviceEnd()V
    .locals 0

    .prologue
    .line 437
    return-void
.end method
