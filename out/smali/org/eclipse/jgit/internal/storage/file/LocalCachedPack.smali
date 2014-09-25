.class Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;
.super Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
.source "LocalCachedPack.java"


# instance fields
.field private final odb:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

.field private final packNames:[Ljava/lang/String;

.field private packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, packs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    const/4 v0, 0x0

    .line 68
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;-><init>()V

    .line 69
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->odb:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    .line 70
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packNames:[Ljava/lang/String;

    .line 71
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 72
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;Ljava/util/List;)V
    .locals 1
    .parameter "odb"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p2, packNames:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;-><init>()V

    .line 64
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->odb:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    .line 65
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packNames:[Ljava/lang/String;

    .line 66
    return-void
.end method

.method private getPackFile(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .locals 4
    .parameter "packName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->odb:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPacks()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 114
    .local v1, pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 115
    return-object v1

    .line 117
    .end local v1           #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_1
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->getPackFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private getPackFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "packName"

    .prologue
    .line 121
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->odb:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "pack"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 122
    .local v0, packDir:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pack-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".pack"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getPacks()[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    if-nez v2, :cond_1

    .line 104
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packNames:[Ljava/lang/String;

    array-length v2, v2

    new-array v1, v2, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 105
    .local v1, p:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packNames:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 106
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packNames:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->getPackFile(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v2

    aput-object v2, v1, v0

    .line 105
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 107
    :cond_0
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 109
    .end local v0           #i:I
    .end local v1           #p:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    return-object v2
.end method


# virtual methods
.method copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 4
    .parameter "out"
    .parameter "validate"
    .parameter "wc"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->getPacks()[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 85
    .local v3, pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v3, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 84
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 86
    .end local v3           #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_0
    return-void
.end method

.method public getObjectCount()J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    const-wide/16 v1, 0x0

    .line 77
    .local v1, cnt:J
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->getPacks()[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .line 78
    .local v5, pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getObjectCount()J

    move-result-wide v6

    add-long/2addr v1, v6

    .line 77
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 79
    .end local v5           #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_0
    return-wide v1
.end method

.method public hasObject(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)Z
    .locals 9
    .parameter "obj"
    .parameter "rep"

    .prologue
    const/4 v7, 0x0

    .line 91
    :try_start_0
    move-object v0, p2

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;

    move-object v4, v0

    .line 92
    .local v4, local:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/LocalCachedPack;->getPacks()[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v1, v2

    .line 93
    .local v5, pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    iget-object v8, v4, Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v8, v5, :cond_1

    .line 94
    const/4 v7, 0x1

    .line 98
    .end local v1           #arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v4           #local:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    .end local v5           #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_0
    :goto_1
    return v7

    .line 92
    .restart local v1       #arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .restart local v2       #i$:I
    .restart local v3       #len$:I
    .restart local v4       #local:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    .restart local v5       #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 97
    .end local v1           #arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v4           #local:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    .end local v5           #pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :catch_0
    move-exception v6

    .line 98
    .local v6, packGone:Ljava/io/FileNotFoundException;
    goto :goto_1
.end method
