.class public Lorg/eclipse/jgit/submodule/SubmoduleWalk;
.super Ljava/lang/Object;
.source "SubmoduleWalk.java"


# instance fields
.field private modulesConfig:Lorg/eclipse/jgit/lib/Config;

.field private path:Ljava/lang/String;

.field private repoConfig:Lorg/eclipse/jgit/lib/StoredConfig;

.field private final repository:Lorg/eclipse/jgit/lib/Repository;

.field private rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

.field private final walk:Lorg/eclipse/jgit/treewalk/TreeWalk;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repository"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    iput-object p1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 313
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repoConfig:Lorg/eclipse/jgit/lib/StoredConfig;

    .line 314
    new-instance v0, Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 315
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 316
    return-void
.end method

.method public static forIndex(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 4
    .parameter "repository"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v1, Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 95
    .local v1, generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v2

    .line 96
    .local v2, index:Lorg/eclipse/jgit/dircache/DirCache;
    new-instance v3, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-direct {v3, v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    return-object v1

    .line 97
    .end local v2           #index:Lorg/eclipse/jgit/dircache/DirCache;
    :catch_0
    move-exception v0

    .line 98
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->release()V

    .line 99
    throw v0
.end method

.method public static forPath(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 4
    .parameter "repository"
    .parameter "treeId"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    new-instance v2, Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 120
    .local v2, generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :try_start_0
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 121
    invoke-static {p2}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v1

    .line 122
    .local v1, filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 123
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setRootTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 124
    :cond_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 125
    iget-object v3, v2, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->isDone(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 132
    .end local v2           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :goto_0
    return-object v2

    .line 127
    .end local v1           #filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    .restart local v2       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :catch_0
    move-exception v0

    .line 128
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->release()V

    .line 129
    throw v0

    .line 131
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->release()V

    .line 132
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static forPath(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Ljava/lang/String;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 4
    .parameter "repository"
    .parameter "iterator"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    new-instance v2, Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 151
    .local v2, generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :try_start_0
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 152
    invoke-static {p2}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v1

    .line 153
    .local v1, filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 154
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->setRootTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 155
    :cond_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->next()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 156
    iget-object v3, v2, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->isDone(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 163
    .end local v2           #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :goto_0
    return-object v2

    .line 158
    .end local v1           #filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    .restart local v2       #generator:Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    :catch_0
    move-exception v0

    .line 159
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->release()V

    .line 160
    throw v0

    .line 162
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->release()V

    .line 163
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getSubmoduleDirectory(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "parent"
    .parameter "path"

    .prologue
    .line 175
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getSubmoduleRemoteUrl(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .parameter "parent"
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x5c

    const/16 v12, 0x2f

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 235
    const-string v6, "./"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "../"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 290
    .end local p1
    :goto_0
    return-object p1

    .line 238
    .restart local p1
    :cond_0
    const/4 v2, 0x0

    .line 240
    .local v2, remoteName:Ljava/lang/String;
    const-string v6, "HEAD"

    invoke-virtual {p0, v6}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 241
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_2

    .line 242
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 243
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 244
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v6

    const-string v7, "branch"

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "remote"

    invoke-virtual {v6, v7, v8, v9}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 251
    :cond_2
    if-nez v2, :cond_3

    .line 252
    const-string v2, "origin"

    .line 254
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v6

    const-string v7, "remote"

    const-string v8, "url"

    invoke-virtual {v6, v7, v2, v8}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 259
    .local v3, remoteUrl:Ljava/lang/String;
    if-nez v3, :cond_4

    .line 260
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 262
    sget-char v6, Ljava/io/File;->separatorChar:C

    if-ne v13, v6, :cond_4

    .line 263
    invoke-virtual {v3, v13, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 267
    :cond_4
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v12, :cond_5

    .line 268
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v10, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 270
    :cond_5
    const/16 v4, 0x2f

    .line 271
    .local v4, separator:C
    move-object v5, p1

    .line 272
    .local v5, submoduleUrl:Ljava/lang/String;
    :goto_1
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_9

    .line 273
    const-string v6, "./"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 274
    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 275
    :cond_6
    const-string v6, "../"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 276
    invoke-virtual {v3, v12}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 277
    .local v0, lastSeparator:I
    if-ge v0, v11, :cond_7

    .line 278
    const/16 v6, 0x3a

    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 279
    const/16 v4, 0x3a

    .line 281
    :cond_7
    if-ge v0, v11, :cond_8

    .line 282
    new-instance v6, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->submoduleParentRemoteUrlInvalid:Ljava/lang/String;

    new-array v8, v11, [Ljava/lang/Object;

    aput-object v3, v8, v10

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 285
    :cond_8
    invoke-virtual {v3, v10, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 286
    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 287
    goto :goto_1

    .line 290
    .end local v0           #lastSeparator:I
    :cond_9
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_0
.end method

.method public static getSubmoduleRepository(Ljava/io/File;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    .locals 6
    .parameter "parent"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 201
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 202
    .local v1, subWorkTree:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_0

    move-object v3, v4

    .line 212
    :goto_0
    return-object v3

    .line 204
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 206
    .local v2, workTree:Ljava/io/File;
    :try_start_0
    new-instance v3, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-direct {v3}, Lorg/eclipse/jgit/lib/RepositoryBuilder;-><init>()V

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setMustExist(Z)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    sget-object v5, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setFS(Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->build()Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/RepositoryNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 211
    :catch_0
    move-exception v0

    .local v0, e:Lorg/eclipse/jgit/errors/RepositoryNotFoundException;
    move-object v3, v4

    .line 212
    goto :goto_0
.end method

.method public static getSubmoduleRepository(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .parameter "parent"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getSubmoduleRepository(Ljava/io/File;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method

.method private lazyLoadModulesConfig()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 430
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    if-nez v0, :cond_0

    .line 431
    invoke-virtual {p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->loadModulesConfig()Lorg/eclipse/jgit/submodule/SubmoduleWalk;

    .line 432
    :cond_0
    return-void
.end method


# virtual methods
.method public getConfigUpdate()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 583
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repoConfig:Lorg/eclipse/jgit/lib/StoredConfig;

    const-string v1, "submodule"

    iget-object v2, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    const-string v3, "update"

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConfigUrl()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 555
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repoConfig:Lorg/eclipse/jgit/lib/StoredConfig;

    const-string v1, "submodule"

    iget-object v2, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    const-string v3, "url"

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDirectory()Ljava/io/File;
    .locals 2

    .prologue
    .line 490
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    iget-object v1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getSubmoduleDirectory(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getHead()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 619
    invoke-virtual {p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    .line 620
    .local v0, subRepo:Lorg/eclipse/jgit/lib/Repository;
    if-nez v0, :cond_0

    .line 621
    const/4 v1, 0x0

    .line 625
    :goto_0
    return-object v1

    .line 623
    :cond_0
    :try_start_0
    const-string v1, "HEAD"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 625
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v1
.end method

.method public getHeadRef()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 636
    invoke-virtual {p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    .line 637
    .local v1, subRepo:Lorg/eclipse/jgit/lib/Repository;
    if-nez v1, :cond_0

    .line 643
    :goto_0
    return-object v2

    .line 640
    :cond_0
    :try_start_0
    const-string v3, "HEAD"

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 641
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 643
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_0

    .end local v0           #head:Lorg/eclipse/jgit/lib/Ref;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v2
.end method

.method public getModulesPath()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 540
    invoke-direct {p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->lazyLoadModulesConfig()V

    .line 541
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    const-string v1, "submodule"

    iget-object v2, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    const-string v3, "path"

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModulesUpdate()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 596
    invoke-direct {p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->lazyLoadModulesConfig()V

    .line 597
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    const-string v1, "submodule"

    iget-object v2, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    const-string v3, "update"

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModulesUrl()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 568
    invoke-direct {p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->lazyLoadModulesConfig()V

    .line 569
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    const-string v1, "submodule"

    iget-object v2, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    const-string v3, "url"

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2

    .prologue
    .line 528
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 519
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getRemoteUrl()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 658
    invoke-virtual {p0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getModulesUrl()Ljava/lang/String;

    move-result-object v0

    .line 659
    .local v0, url:Ljava/lang/String;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v1, v0}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getSubmoduleRemoteUrl(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 609
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    iget-object v1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->getSubmoduleRepository(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method

.method public loadModulesConfig()Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 387
    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    if-nez v5, :cond_0

    .line 388
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v5

    const-string v6, ".gitmodules"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 390
    .local v4, modulesFile:Ljava/io/File;
    new-instance v0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 392
    .local v0, config:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->load()V

    .line 393
    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    .line 426
    .end local v0           #config:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .end local v4           #modulesFile:Ljava/io/File;
    :goto_0
    return-object p0

    .line 395
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 397
    .local v1, configWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 402
    const/4 v3, 0x0

    .local v3, idx:I
    :goto_1
    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->first()Z

    move-result v5

    if-nez v5, :cond_1

    .line 403
    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->back(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 402
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 407
    :cond_1
    const/4 v5, 0x0

    :try_start_1
    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 408
    const-string v5, ".gitmodules"

    invoke-static {v5}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v2

    .line 409
    .local v2, filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 410
    :cond_2
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 411
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->isDone(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 412
    new-instance v5, Lorg/eclipse/jgit/lib/BlobBasedConfig;

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-direct {v5, v6, v7, v8}, Lorg/eclipse/jgit/lib/BlobBasedConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    iput-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 419
    if-lez v3, :cond_3

    .line 420
    :try_start_2
    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 423
    :cond_3
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    goto :goto_0

    .line 417
    :cond_4
    :try_start_3
    new-instance v5, Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v5}, Lorg/eclipse/jgit/lib/Config;-><init>()V

    iput-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 419
    if-lez v3, :cond_5

    .line 420
    :try_start_4
    iget-object v5, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 423
    :cond_5
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    goto :goto_0

    .line 419
    .end local v2           #filter:Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    :catchall_0
    move-exception v5

    if-lez v3, :cond_6

    .line 420
    :try_start_5
    iget-object v6, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v6, v3}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->next(I)V

    :cond_6
    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 423
    .end local v3           #idx:I
    :catchall_1
    move-exception v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    throw v5
.end method

.method public next()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 503
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 504
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v2, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 506
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    .line 507
    const/4 v0, 0x1

    .line 510
    :goto_0
    return v0

    .line 509
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->path:Ljava/lang/String;

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 664
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    .line 665
    return-void
.end method

.method public reset()Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 1

    .prologue
    .line 478
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->repoConfig:Lorg/eclipse/jgit/lib/StoredConfig;

    .line 479
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    .line 480
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset()V

    .line 481
    return-object p0
.end method

.method public setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 1
    .parameter "filter"

    .prologue
    .line 441
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 442
    return-object p0
.end method

.method public setModulesConfig(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 0
    .parameter "config"

    .prologue
    .line 329
    iput-object p1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    .line 330
    return-object p0
.end method

.method public setRootTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 2
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    new-instance v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;-><init>()V

    .line 368
    .local v0, p:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    iget-object v1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->reset(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 369
    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 370
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    .line 371
    return-object p0
.end method

.method public setRootTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 1
    .parameter "tree"

    .prologue
    .line 347
    iput-object p1, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->rootTree:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    .line 348
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->modulesConfig:Lorg/eclipse/jgit/lib/Config;

    .line 349
    return-object p0
.end method

.method public setTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 1
    .parameter "treeId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 468
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 469
    return-object p0
.end method

.method public setTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Lorg/eclipse/jgit/submodule/SubmoduleWalk;
    .locals 1
    .parameter "iterator"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 454
    iget-object v0, p0, Lorg/eclipse/jgit/submodule/SubmoduleWalk;->walk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 455
    return-object p0
.end method
