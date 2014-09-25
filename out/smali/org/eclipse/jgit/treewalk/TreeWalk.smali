.class public Lorg/eclipse/jgit/treewalk/TreeWalk;
.super Ljava/lang/Object;
.source "TreeWalk.java"


# static fields
.field private static final NO_TREES:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;


# instance fields
.field private advance:Z

.field currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

.field private depth:I

.field private filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

.field private final idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

.field private postChildren:Z

.field private postOrderTraversal:Z

.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private recursive:Z

.field trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    sput-object v0, Lorg/eclipse/jgit/treewalk/TreeWalk;->NO_TREES:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 1
    .parameter "or"

    .prologue
    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 236
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 237
    sget-object v0, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 238
    sget-object v0, Lorg/eclipse/jgit/treewalk/TreeWalk;->NO_TREES:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 239
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 226
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 227
    return-void
.end method

.method private exitSubtree()V
    .locals 8

    .prologue
    .line 971
    iget v6, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    .line 972
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v6, v6

    if-ge v1, v6, :cond_0

    .line 973
    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v7, v7, v1

    iget-object v7, v7, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aput-object v7, v6, v1

    .line 972
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 975
    :cond_0
    const/4 v4, 0x0

    .line 976
    .local v4, minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_4

    aget-object v5, v0, v2

    .line 977
    .local v5, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v6, v5, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eq v6, v5, :cond_2

    .line 976
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 979
    :cond_2
    if-eqz v4, :cond_3

    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    move-result v6

    if-gez v6, :cond_1

    .line 980
    :cond_3
    move-object v4, v5

    goto :goto_2

    .line 982
    .end local v5           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_4
    iput-object v4, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 983
    return-void
.end method

.method public static varargs forPath(Lorg/eclipse/jgit/lib/ObjectReader;Ljava/lang/String;[Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/TreeWalk;
    .locals 3
    .parameter "reader"
    .parameter "path"
    .parameter "trees"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v1, Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 117
    .local v1, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v0

    .line 118
    .local v0, f:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 119
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset([Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 120
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 122
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 123
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->isDone(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 129
    .end local v1           #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :goto_1
    return-object v1

    .line 125
    .restart local v1       #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isSubtree()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 126
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->enterSubtree()V

    goto :goto_0

    .line 129
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static forPath(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/revwalk/RevTree;)Lorg/eclipse/jgit/treewalk/TreeWalk;
    .locals 2
    .parameter "db"
    .parameter "path"
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
    .line 196
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->forPath(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;[Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/TreeWalk;

    move-result-object v0

    return-object v0
.end method

.method public static varargs forPath(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;[Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/TreeWalk;
    .locals 2
    .parameter "db"
    .parameter "path"
    .parameter "trees"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    .line 162
    .local v0, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    invoke-static {v0, p1, p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->forPath(Lorg/eclipse/jgit/lib/ObjectReader;Ljava/lang/String;[Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 164
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v1
.end method

.method private parserFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .locals 2
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 987
    new-instance v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>()V

    .line 988
    .local v0, p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, v1, p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 989
    return-object v0
.end method

.method static pathOf(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Ljava/lang/String;
    .locals 4
    .parameter "t"

    .prologue
    .line 993
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    const/4 v2, 0x0

    iget v3, p0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static pathOf([BII)Ljava/lang/String;
    .locals 1
    .parameter "buf"
    .parameter "pos"
    .parameter "end"

    .prologue
    .line 997
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v0, p0, p1, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I
    .locals 1
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 468
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->parserFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    move-result v0

    return v0
.end method

.method public addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I
    .locals 4
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 493
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v0, v2

    .line 494
    .local v0, n:I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 496
    .local v1, newTrees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 497
    aput-object p1, v1, v0

    .line 498
    const/4 v2, 0x0

    iput-object v2, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 499
    iput v3, p1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    .line 501
    iput-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 502
    return v0
.end method

.method public enterSubtree()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 906
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 907
    .local v0, ch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v5, v5

    new-array v4, v5, [Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 908
    .local v4, tmp:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v5, v5

    if-ge v1, v5, :cond_1

    .line 909
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v3, v5, v1

    .line 911
    .local v3, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v5, v3, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v5, v0, :cond_0

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget v6, v3, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 912
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3, v5, v6}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->createSubtreeIterator(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    .line 915
    .local v2, n:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_1
    aput-object v2, v4, v1

    .line 908
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 914
    .end local v2           #n:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->createEmptyTreeIterator()Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    move-result-object v2

    .restart local v2       #n:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    goto :goto_1

    .line 917
    .end local v2           #n:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v3           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    iget v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    .line 918
    iput-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z

    .line 919
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v6, v6

    invoke-static {v4, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 920
    return-void
.end method

.method public getDepth()I
    .locals 1

    .prologue
    .line 858
    iget v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    return v0
.end method

.method public getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;
    .locals 1
    .parameter "nth"

    .prologue
    .line 632
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/FileMode;->fromBits(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    return-object v0
.end method

.method public getFilter()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    return-object v0
.end method

.method public getNameString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 722
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 723
    .local v2, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget v1, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    .line 724
    .local v1, off:I
    iget v0, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    .line 725
    .local v0, end:I
    sget-object v3, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    iget-object v4, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    invoke-static {v3, v4, v1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "nth"

    .prologue
    .line 653
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v0, v1, p1

    .line 654
    .local v0, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v1, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    goto :goto_0
.end method

.method public getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V
    .locals 3
    .parameter "out"
    .parameter "nth"

    .prologue
    .line 674
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v0, v1, p2

    .line 675
    .local v0, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v1, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v1, v2, :cond_0

    .line 676
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;)V

    .line 679
    :goto_0
    return-void

    .line 678
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/MutableObjectId;->clear()V

    goto :goto_0
.end method

.method public getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    return-object v0
.end method

.method public getPathLength()I
    .locals 1

    .prologue
    .line 763
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget v0, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    return v0
.end method

.method public getPathString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 741
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-static {v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->pathOf(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRawMode(I)I
    .locals 3
    .parameter "nth"

    .prologue
    .line 617
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v0, v1, p1

    .line 618
    .local v0, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v1, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v1, v2, :cond_0

    iget v1, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getRawPath()[B
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 752
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 753
    .local v2, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget v0, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    .line 754
    .local v0, n:I
    new-array v1, v0, [B

    .line 755
    .local v1, r:[B
    iget-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    invoke-static {v3, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 756
    return-object v1
.end method

.method public getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 3
    .parameter "nth"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;",
            ">(I",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 600
    .local p2, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v0, v1, p1

    .line 601
    .local v0, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v1, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v1, v2, :cond_0

    .end local v0           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_0
    return-object v0

    .restart local v0       #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTreeCount()I
    .locals 1

    .prologue
    .line 511
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v0, v0

    return v0
.end method

.method public idEqual(II)Z
    .locals 5
    .parameter "nthA"
    .parameter "nthB"

    .prologue
    const/4 v3, 0x0

    .line 693
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 694
    .local v2, ch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v0, v4, p1

    .line 695
    .local v0, a:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v1, v4, p2

    .line 696
    .local v1, b:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v4, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eq v4, v2, :cond_1

    iget-object v4, v1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eq v4, v2, :cond_1

    .line 701
    const/4 v3, 0x1

    .line 707
    :cond_0
    :goto_0
    return v3

    .line 703
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->hasId()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->hasId()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 705
    iget-object v4, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v4, v2, :cond_0

    iget-object v4, v1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v4, v2, :cond_0

    .line 706
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v3

    goto :goto_0
.end method

.method public isPathPrefix([BI)I
    .locals 10
    .parameter "p"
    .parameter "pLen"

    .prologue
    const/16 v9, 0x2f

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 785
    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 786
    .local v4, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v0, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 787
    .local v0, c:[B
    iget v1, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    .line 790
    .local v1, cLen:I
    const/4 v3, 0x0

    .local v3, ci:I
    :goto_0
    if-ge v3, v1, :cond_2

    if-ge v3, p2, :cond_2

    .line 791
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    aget-byte v8, p1, v3

    and-int/lit16 v8, v8, 0xff

    sub-int v2, v7, v8

    .line 792
    .local v2, c_value:I
    if-eqz v2, :cond_1

    move v5, v2

    .line 814
    .end local v2           #c_value:I
    :cond_0
    :goto_1
    return v5

    .line 790
    .restart local v2       #c_value:I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 796
    .end local v2           #c_value:I
    :cond_2
    if-ge v3, v1, :cond_3

    .line 801
    aget-byte v7, v0, v3

    if-eq v7, v9, :cond_0

    move v5, v6

    goto :goto_1

    .line 804
    :cond_3
    if-ge v3, p2, :cond_0

    .line 809
    aget-byte v7, p1, v3

    if-eq v7, v9, :cond_0

    move v5, v6

    goto :goto_1
.end method

.method public isPathSuffix([BI)Z
    .locals 7
    .parameter "p"
    .parameter "pLen"

    .prologue
    const/4 v4, 0x0

    .line 835
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 836
    .local v3, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v0, v3, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->path:[B

    .line 837
    .local v0, c:[B
    iget v1, v3, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathLen:I

    .line 839
    .local v1, cLen:I
    const/4 v2, 0x1

    .local v2, i:I
    :goto_0
    if-gt v2, p2, :cond_2

    .line 841
    if-le v2, v1, :cond_1

    .line 849
    :cond_0
    :goto_1
    return v4

    .line 844
    :cond_1
    sub-int v5, v1, v2

    aget-byte v5, v0, v5

    sub-int v6, p2, v2

    aget-byte v6, p1, v6

    if-ne v5, v6, :cond_0

    .line 839
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 849
    :cond_2
    const/4 v4, 0x1

    goto :goto_1
.end method

.method public isPostChildren()Z
    .locals 1

    .prologue
    .line 882
    iget-boolean v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->postChildren:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isSubtree()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPostOrderTraversal()Z
    .locals 1

    .prologue
    .line 333
    iget-boolean v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->postOrderTraversal:Z

    return v0
.end method

.method public isRecursive()Z
    .locals 1

    .prologue
    .line 298
    iget-boolean v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->recursive:Z

    return v0
.end method

.method public isSubtree()Z
    .locals 2

    .prologue
    .line 871
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iget v1, v1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    return v0
.end method

.method min()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 924
    const/4 v1, 0x0

    .line 925
    .local v1, i:I
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v2, v5, v1

    .line 926
    .local v2, minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v5

    if-eqz v5, :cond_0

    add-int/lit8 v1, v1, 0x1

    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v5, v5

    if-ge v1, v5, :cond_0

    .line 927
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v2, v5, v1

    goto :goto_0

    .line 928
    :cond_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v3, v2

    .line 945
    .end local v2           #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .local v3, minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_1
    return-object v3

    .line 931
    .end local v3           #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v2       #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    iput-object v2, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 932
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v5, v5

    if-ge v1, v5, :cond_4

    .line 933
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v4, v5, v1

    .line 934
    .local v4, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v5

    if-nez v5, :cond_2

    .line 936
    invoke-virtual {v4, v2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathCompare(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    move-result v0

    .line 937
    .local v0, cmp:I
    if-gez v0, :cond_3

    .line 938
    iput-object v4, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 939
    move-object v2, v4

    goto :goto_2

    .line 940
    :cond_3
    if-nez v0, :cond_2

    .line 941
    iput-object v2, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_2

    .end local v0           #cmp:I
    .end local v4           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_4
    move-object v3, v2

    .line 945
    .end local v2           #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v3       #minRef:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    goto :goto_1
.end method

.method public next()Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 537
    :try_start_0
    iget-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z

    if-eqz v7, :cond_0

    .line 538
    const/4 v7, 0x0

    iput-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z

    .line 539
    const/4 v7, 0x0

    iput-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->postChildren:Z

    .line 540
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->popEntriesEqual()V

    .line 544
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->min()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v4

    .line 545
    .local v4, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->eof()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 546
    iget v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    if-lez v7, :cond_2

    .line 547
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->exitSubtree()V

    .line 548
    iget-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->postOrderTraversal:Z

    if-eqz v7, :cond_1

    .line 549
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z

    .line 550
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->postChildren:Z

    .line 576
    .end local v4           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_1
    return v5

    .line 553
    .restart local v4       #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->popEntriesEqual()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/StopWalkException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 573
    .end local v4           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :catch_0
    move-exception v3

    .line 574
    .local v3, stop:Lorg/eclipse/jgit/errors/StopWalkException;
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_2
    if-ge v1, v2, :cond_6

    aget-object v4, v0, v1

    .line 575
    .restart local v4       #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->stopWalk()V

    .line 574
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .end local v0           #arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #stop:Lorg/eclipse/jgit/errors/StopWalkException;
    :cond_2
    move v5, v6

    .line 556
    goto :goto_1

    .line 559
    :cond_3
    :try_start_1
    iput-object v4, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 560
    iget-object v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v7, p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 561
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->skipEntriesEqual()V

    goto :goto_0

    .line 565
    :cond_4
    iget-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->recursive:Z

    if-eqz v7, :cond_5

    sget-object v7, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget v8, v4, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->mode:I

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 566
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->enterSubtree()V

    goto :goto_0

    .line 570
    :cond_5
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/StopWalkException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .end local v4           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v0       #arr$:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v1       #i$:I
    .restart local v2       #len$:I
    .restart local v3       #stop:Lorg/eclipse/jgit/errors/StopWalkException;
    :cond_6
    move v5, v6

    .line 576
    goto :goto_1
.end method

.method popEntriesEqual()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 949
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 950
    .local v0, ch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 951
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v2, v3, v1

    .line 952
    .local v2, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v3, v0, :cond_0

    .line 953
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    .line 954
    const/4 v3, 0x0

    iput-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 950
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 957
    .end local v2           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 254
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 349
    sget-object v0, Lorg/eclipse/jgit/treewalk/TreeWalk;->NO_TREES:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 350
    iput-boolean v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z

    .line 351
    iput v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    .line 352
    return-void
.end method

.method public reset(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 4
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 374
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v1, v1

    if-ne v1, v2, :cond_2

    .line 375
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v0, v1, v3

    .line 376
    .local v0, o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_0
    iget-object v1, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eqz v1, :cond_0

    .line 377
    iget-object v0, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_0

    .line 378
    :cond_0
    instance-of v1, v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    if-eqz v1, :cond_1

    .line 379
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 380
    iput v3, v0, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    move-object v1, v0

    .line 381
    check-cast v1, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, v2, p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 382
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aput-object v0, v1, v3

    .line 390
    .end local v0           #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_1
    iput-boolean v3, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z

    .line 391
    iput v3, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    .line 392
    return-void

    .line 384
    .restart local v0       #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->parserFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v2

    aput-object v2, v1, v3

    goto :goto_1

    .line 387
    .end local v0           #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_2
    new-array v1, v2, [Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->parserFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v2

    aput-object v2, v1, v3

    iput-object v1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_1
.end method

.method public varargs reset([Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 9
    .parameter "ids"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 414
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v3, v5

    .line 415
    .local v3, oldLen:I
    array-length v1, p1

    .line 416
    .local v1, newLen:I
    if-ne v1, v3, :cond_0

    iget-object v4, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 418
    .local v4, r:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 421
    if-ge v0, v3, :cond_2

    .line 422
    iget-object v5, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v2, v5, v0

    .line 423
    .local v2, o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :goto_2
    iget-object v5, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-eqz v5, :cond_1

    .line 424
    iget-object v2, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->parent:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_2

    .line 416
    .end local v0           #i:I
    .end local v2           #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v4           #r:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_0
    new-array v4, v1, [Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    goto :goto_0

    .line 425
    .restart local v0       #i:I
    .restart local v2       #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v4       #r:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    instance-of v5, v2, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    if-eqz v5, :cond_2

    iget v5, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->pathOffset:I

    if-nez v5, :cond_2

    .line 426
    const/4 v5, 0x0

    iput-object v5, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 427
    iput v8, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matchShift:I

    move-object v5, v2

    .line 428
    check-cast v5, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    iget-object v6, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    aget-object v7, p1, v0

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 429
    aput-object v2, v4, v0

    .line 418
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 434
    .end local v2           #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_2
    aget-object v5, p1, v0

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->parserFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-result-object v2

    .line 435
    .restart local v2       #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    aput-object v2, v4, v0

    goto :goto_3

    .line 438
    .end local v2           #o:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_3
    iput-object v4, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 439
    iput-boolean v8, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->advance:Z

    .line 440
    iput v8, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->depth:I

    .line 441
    return-void
.end method

.method public setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 0
    .parameter "newFilter"

    .prologue
    .line 286
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 287
    return-void

    .line 286
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ALL:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    goto :goto_0
.end method

.method public setPostOrderTraversal(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 344
    iput-boolean p1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->postOrderTraversal:Z

    .line 345
    return-void
.end method

.method public setRecursive(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 314
    iput-boolean p1, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->recursive:Z

    .line 315
    return-void
.end method

.method skipEntriesEqual()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 960
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->currentHead:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 961
    .local v0, ch:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 962
    iget-object v3, p0, Lorg/eclipse/jgit/treewalk/TreeWalk;->trees:[Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    aget-object v2, v3, v1

    .line 963
    .local v2, t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    iget-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-ne v3, v0, :cond_0

    .line 964
    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->skip()V

    .line 965
    const/4 v3, 0x0

    iput-object v3, v2, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->matches:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 961
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 968
    .end local v2           #t:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    :cond_1
    return-void
.end method
