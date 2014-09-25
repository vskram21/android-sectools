.class public Lorg/eclipse/jgit/transport/resolver/FileResolver;
.super Ljava/lang/Object;
.source "FileResolver.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/transport/resolver/RepositoryResolver",
        "<TC;>;"
    }
.end annotation


# instance fields
.field private volatile exportAll:Z

.field private final exportBase:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private final exports:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Repository;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 74
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exports:Ljava/util/Map;

    .line 76
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportBase:Ljava/util/Collection;

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .locals 0
    .parameter "basePath"
    .parameter "exportAll"

    .prologue
    .line 89
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/resolver/FileResolver;-><init>()V

    .line 90
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportDirectory(Ljava/io/File;)V

    .line 91
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/transport/resolver/FileResolver;->setExportAll(Z)V

    .line 92
    return-void
.end method

.method private static isUnreasonableName(Ljava/lang/String;)Z
    .locals 2
    .parameter "name"

    .prologue
    const/4 v0, 0x1

    .line 237
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 254
    :cond_0
    :goto_0
    return v0

    .line 240
    :cond_1
    const/16 v1, 0x5c

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_0

    .line 242
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->isAbsolute()Z

    move-result v1

    if-nez v1, :cond_0

    .line 245
    const-string v1, "../"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 247
    const-string v1, "/../"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 249
    const-string v1, "/./"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 251
    const-string v1, "//"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 254
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static nameWithDotGit(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "name"

    .prologue
    .line 231
    const-string v0, ".git"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 233
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".git"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method


# virtual methods
.method public exportDirectory(Ljava/io/File;)V
    .locals 1
    .parameter "dir"

    .prologue
    .line 199
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportBase:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 200
    return-void
.end method

.method public exportRepository(Ljava/lang/String;Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "name"
    .parameter "db"

    .prologue
    .line 187
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exports:Ljava/util/Map;

    invoke-static {p1}, Lorg/eclipse/jgit/transport/resolver/FileResolver;->nameWithDotGit(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    return-void
.end method

.method public isExportAll()Z
    .locals 1

    .prologue
    .line 156
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportAll:Z

    return v0
.end method

.method protected isExportOk(Ljava/lang/Object;Ljava/lang/String;Lorg/eclipse/jgit/lib/Repository;)Z
    .locals 3
    .parameter
    .parameter "repositoryName"
    .parameter "db"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Repository;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    .local p1, req:Ljava/lang/Object;,"TC;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/resolver/FileResolver;->isExportAll()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    const/4 v0, 0x1

    .line 227
    :goto_0
    return v0

    .line 224
    :cond_0
    invoke-virtual {p3}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 225
    new-instance v0, Ljava/io/File;

    invoke-virtual {p3}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "git-daemon-export-ok"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    goto :goto_0

    .line 227
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public open(Ljava/lang/Object;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    .locals 10
    .parameter
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;",
            "Ljava/lang/String;",
            ")",
            "Lorg/eclipse/jgit/lib/Repository;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/RepositoryNotFoundException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    .local p1, req:Ljava/lang/Object;,"TC;"
    const/4 v9, 0x1

    .line 96
    invoke-static {p2}, Lorg/eclipse/jgit/transport/resolver/FileResolver;->isUnreasonableName(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 97
    new-instance v7, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-direct {v7, p2}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 99
    :cond_0
    iget-object v7, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exports:Ljava/util/Map;

    invoke-static {p2}, Lorg/eclipse/jgit/transport/resolver/FileResolver;->nameWithDotGit(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Repository;

    .line 100
    .local v1, db:Lorg/eclipse/jgit/lib/Repository;
    if-eqz v1, :cond_1

    .line 101
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->incrementOpen()V

    move-object v2, v1

    .line 122
    .end local v1           #db:Lorg/eclipse/jgit/lib/Repository;
    .local v2, db:Lorg/eclipse/jgit/lib/Repository;
    :goto_0
    return-object v2

    .line 105
    .end local v2           #db:Lorg/eclipse/jgit/lib/Repository;
    .restart local v1       #db:Lorg/eclipse/jgit/lib/Repository;
    :cond_1
    iget-object v7, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportBase:Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 106
    .local v0, base:Ljava/io/File;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v0, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sget-object v8, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-static {v7, v8}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->resolve(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;

    move-result-object v3

    .line 107
    .local v3, dir:Ljava/io/File;
    if-eqz v3, :cond_2

    .line 111
    :try_start_0
    sget-object v7, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-static {v3, v7}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->exact(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    move-result-object v6

    .line 112
    .local v6, key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    const/4 v7, 0x1

    invoke-static {v6, v7}, Lorg/eclipse/jgit/lib/RepositoryCache;->open(Lorg/eclipse/jgit/lib/RepositoryCache$Key;Z)Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 118
    :try_start_1
    invoke-virtual {p0, p1, p2, v1}, Lorg/eclipse/jgit/transport/resolver/FileResolver;->isExportOk(Ljava/lang/Object;Ljava/lang/String;Lorg/eclipse/jgit/lib/Repository;)Z
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException; {:try_start_1 .. :try_end_1} :catch_3

    move-result v7

    if-eqz v7, :cond_3

    move-object v2, v1

    .line 122
    .end local v1           #db:Lorg/eclipse/jgit/lib/Repository;
    .restart local v2       #db:Lorg/eclipse/jgit/lib/Repository;
    goto :goto_0

    .line 113
    .end local v2           #db:Lorg/eclipse/jgit/lib/Repository;
    .end local v6           #key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    .restart local v1       #db:Lorg/eclipse/jgit/lib/Repository;
    :catch_0
    move-exception v4

    .line 114
    .local v4, e:Ljava/io/IOException;
    new-instance v7, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-direct {v7, p2, v4}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 124
    .end local v4           #e:Ljava/io/IOException;
    .restart local v6       #key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    :cond_3
    :try_start_2
    new-instance v7, Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;

    invoke-direct {v7}, Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;-><init>()V

    throw v7
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException; {:try_start_2 .. :try_end_2} :catch_3

    .line 126
    :catch_1
    move-exception v4

    .line 127
    .local v4, e:Ljava/lang/RuntimeException;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 128
    new-instance v7, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-direct {v7, p2, v4}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 130
    .end local v4           #e:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v4

    .line 131
    .local v4, e:Ljava/io/IOException;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 132
    new-instance v7, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-direct {v7, p2, v4}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 134
    .end local v4           #e:Ljava/io/IOException;
    :catch_3
    move-exception v4

    .line 135
    .local v4, e:Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 136
    throw v4

    .line 140
    .end local v0           #base:Ljava/io/File;
    .end local v3           #dir:Ljava/io/File;
    .end local v4           #e:Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;
    .end local v6           #key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    :cond_4
    iget-object v7, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportBase:Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v7

    if-ne v7, v9, :cond_5

    .line 141
    new-instance v3, Ljava/io/File;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportBase:Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/File;

    invoke-direct {v3, v7, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 142
    .restart local v3       #dir:Ljava/io/File;
    new-instance v7, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    new-instance v8, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-direct {v8, v3}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/io/File;)V

    invoke-direct {v7, p2, v8}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 146
    .end local v3           #dir:Ljava/io/File;
    :cond_5
    new-instance v7, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-direct {v7, p2}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public setExportAll(Z)V
    .locals 0
    .parameter "export"

    .prologue
    .line 172
    .local p0, this:Lorg/eclipse/jgit/transport/resolver/FileResolver;,"Lorg/eclipse/jgit/transport/resolver/FileResolver<TC;>;"
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/resolver/FileResolver;->exportAll:Z

    .line 173
    return-void
.end method
