.class public Lorg/eclipse/jgit/lib/BlobBasedConfig;
.super Lorg/eclipse/jgit/lib/Config;
.source "BlobBasedConfig.java"


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "base"
    .parameter "db"
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {p2, p3}, Lorg/eclipse/jgit/lib/BlobBasedConfig;->read(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;)[B

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/BlobBasedConfig;-><init>(Lorg/eclipse/jgit/lib/Config;[B)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V
    .locals 1
    .parameter "base"
    .parameter "db"
    .parameter "treeish"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-static {p2, p3, p4}, Lorg/eclipse/jgit/lib/BlobBasedConfig;->read(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/BlobBasedConfig;-><init>(Lorg/eclipse/jgit/lib/Config;[B)V

    .line 144
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;[B)V
    .locals 1
    .parameter "base"
    .parameter "blob"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/Config;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    .line 82
    invoke-static {p2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BlobBasedConfig;->fromText(Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method private static asTree(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AnyObjectId;
    .locals 1
    .parameter "or"
    .parameter "treeish"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevTree;

    if-eqz v0, :cond_0

    .line 171
    .end local p1
    :goto_0
    return-object p1

    .line 167
    .restart local p1
    :cond_0
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 169
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object p1

    goto :goto_0

    .line 171
    .restart local p1
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevTree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object p1

    goto :goto_0
.end method

.method private static read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)[B
    .locals 2
    .parameter "or"
    .parameter "blobId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    const/4 v1, 0x3

    invoke-virtual {p0, p1, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 119
    .local v0, loader:Lorg/eclipse/jgit/lib/ObjectLoader;
    const v1, 0x7fffffff

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v1

    return-object v1
.end method

.method private static read(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;)[B
    .locals 2
    .parameter "db"
    .parameter "blobId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    .line 109
    .local v0, or:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    invoke-static {v0, p1}, Lorg/eclipse/jgit/lib/BlobBasedConfig;->read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 111
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v1
.end method

.method private static read(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)[B
    .locals 6
    .parameter "db"
    .parameter "treeish"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    .line 151
    .local v0, or:Lorg/eclipse/jgit/lib/ObjectReader;
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Lorg/eclipse/jgit/lib/AnyObjectId;

    const/4 v3, 0x0

    invoke-static {v0, p1}, Lorg/eclipse/jgit/lib/BlobBasedConfig;->asTree(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AnyObjectId;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, p2, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->forPath(Lorg/eclipse/jgit/lib/ObjectReader;Ljava/lang/String;[Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/treewalk/TreeWalk;

    move-result-object v1

    .line 152
    .local v1, tree:Lorg/eclipse/jgit/treewalk/TreeWalk;
    if-nez v1, :cond_0

    .line 153
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->entryNotFoundByPath:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    .end local v1           #tree:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v2

    .line 155
    .restart local v1       #tree:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_0
    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/eclipse/jgit/lib/BlobBasedConfig;->read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 157
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    return-object v2
.end method
