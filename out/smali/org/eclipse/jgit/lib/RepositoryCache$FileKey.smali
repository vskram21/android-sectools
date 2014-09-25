.class public Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
.super Ljava/lang/Object;
.source "RepositoryCache.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/RepositoryCache$Key;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/RepositoryCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileKey"
.end annotation


# instance fields
.field private final fs:Lorg/eclipse/jgit/util/FS;

.field private final path:Ljava/io/File;


# direct methods
.method protected constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 1
    .parameter "directory"
    .parameter "fs"

    .prologue
    .line 302
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 303
    invoke-static {p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->canonical(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    .line 304
    iput-object p2, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->fs:Lorg/eclipse/jgit/util/FS;

    .line 305
    return-void
.end method

.method private static canonical(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .parameter "path"

    .prologue
    .line 309
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 311
    :goto_0
    return-object v1

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    goto :goto_0
.end method

.method public static exact(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    .locals 1
    .parameter "directory"
    .parameter "fs"

    .prologue
    .line 265
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    return-object v0
.end method

.method public static isGitRepository(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Z
    .locals 2
    .parameter "dir"
    .parameter "fs"

    .prologue
    .line 357
    const-string v0, "objects"

    invoke-virtual {p1, p0, v0}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "refs"

    invoke-virtual {p1, p0, v0}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    const-string v1, "HEAD"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->isValidHead(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isValidHead(Ljava/io/File;)Z
    .locals 2
    .parameter "head"

    .prologue
    .line 363
    invoke-static {p0}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->readFirstLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 364
    .local v0, ref:Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v1, "ref: refs/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static lenient(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    .locals 2
    .parameter "directory"
    .parameter "fs"

    .prologue
    .line 288
    invoke-static {p0, p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->resolve(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;

    move-result-object v0

    .line 289
    .local v0, gitdir:Ljava/io/File;
    new-instance v1, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    if-eqz v0, :cond_0

    .end local v0           #gitdir:Ljava/io/File;
    :goto_0
    invoke-direct {v1, v0, p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    return-object v1

    .restart local v0       #gitdir:Ljava/io/File;
    :cond_0
    move-object v0, p0

    goto :goto_0
.end method

.method private static readFirstLine(Ljava/io/File;)Ljava/lang/String;
    .locals 6
    .parameter "head"

    .prologue
    const/4 v3, 0x0

    .line 370
    const/16 v4, 0x1000

    :try_start_0
    invoke-static {p0, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;I)[B

    move-result-object v0

    .line 371
    .local v0, buf:[B
    array-length v2, v0

    .line 372
    .local v2, n:I
    if-nez v2, :cond_0

    .line 378
    .end local v0           #buf:[B
    .end local v2           #n:I
    :goto_0
    return-object v3

    .line 374
    .restart local v0       #buf:[B
    .restart local v2       #n:I
    :cond_0
    add-int/lit8 v4, v2, -0x1

    aget-byte v4, v0, v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_1

    .line 375
    add-int/lit8 v2, v2, -0x1

    .line 376
    :cond_1
    const/4 v4, 0x0

    invoke-static {v0, v4, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 377
    .end local v0           #buf:[B
    .end local v2           #n:I
    :catch_0
    move-exception v1

    .line 378
    .local v1, e:Ljava/io/IOException;
    goto :goto_0
.end method

.method public static resolve(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;
    .locals 5
    .parameter "directory"
    .parameter "fs"

    .prologue
    .line 402
    invoke-static {p0, p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->isGitRepository(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 411
    .end local p0
    :goto_0
    return-object p0

    .line 404
    .restart local p0
    :cond_0
    new-instance v2, Ljava/io/File;

    const-string v3, ".git"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2, p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->isGitRepository(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 405
    new-instance v2, Ljava/io/File;

    const-string v3, ".git"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object p0, v2

    goto :goto_0

    .line 407
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 408
    .local v0, name:Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 409
    .local v1, parent:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".git"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2, p1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->isGitRepository(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 410
    new-instance p0, Ljava/io/File;

    .end local p0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".git"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0

    .line 411
    .restart local p0
    :cond_2
    const/4 p0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .parameter "o"

    .prologue
    .line 333
    instance-of v0, p1, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    check-cast p1, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    .end local p1
    iget-object v1, p1, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 317
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->hashCode()I

    move-result v0

    return v0
.end method

.method public open(Z)Lorg/eclipse/jgit/lib/Repository;
    .locals 2
    .parameter "mustExist"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->isGitRepository(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 322
    new-instance v0, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/io/File;)V

    throw v0

    .line 323
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->path:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
