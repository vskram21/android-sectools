.class Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
.super Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;
.source "CachedObjectDirectory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$1;,
        Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;
    }
.end annotation


# instance fields
.field private alts:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

.field private unpackedObjects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;)V
    .locals 1
    .parameter "wrapped"

    .prologue
    .line 87
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;-><init>()V

    .line 88
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    .line 89
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->scanLoose()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->unpackedObjects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 90
    return-void
.end method

.method private myAlternates()[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    .locals 4

    .prologue
    .line 154
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->alts:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    if-nez v2, :cond_0

    .line 155
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    .line 156
    .local v1, src:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v2, v1

    new-array v2, v2, [Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->alts:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    .line 157
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->alts:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 158
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->alts:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    aget-object v3, v1, v0

    iget-object v3, v3, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->newCachedFileObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    move-result-object v3

    aput-object v3, v2, v0

    .line 157
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 160
    .end local v0           #i:I
    .end local v1           #src:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->alts:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    return-object v2
.end method

.method private scanLoose()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 93
    new-instance v11, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v11}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    .line 94
    .local v11, m:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;>;"
    iget-object v13, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v12

    .line 95
    .local v12, objects:Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v5

    .line 96
    .local v5, fanout:[Ljava/lang/String;
    if-nez v5, :cond_1

    .line 115
    :cond_0
    return-object v11

    .line 98
    :cond_1
    move-object v0, v5

    .local v0, arr$:[Ljava/lang/String;
    array-length v9, v0

    .local v9, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    move v7, v6

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v6           #i$:I
    .end local v9           #len$:I
    .local v7, i$:I
    :goto_0
    if-ge v7, v9, :cond_0

    aget-object v2, v0, v7

    .line 99
    .local v2, d:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x2

    if-eq v13, v14, :cond_3

    .line 98
    .end local v7           #i$:I
    :cond_2
    add-int/lit8 v6, v7, 0x1

    .restart local v6       #i$:I
    move v7, v6

    .end local v6           #i$:I
    .restart local v7       #i$:I
    goto :goto_0

    .line 101
    :cond_3
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v12, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 102
    .local v4, entries:[Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 104
    move-object v1, v4

    .local v1, arr$:[Ljava/lang/String;
    array-length v10, v1

    .local v10, len$:I
    const/4 v6, 0x0

    .end local v7           #i$:I
    .restart local v6       #i$:I
    :goto_1
    if-ge v6, v10, :cond_2

    aget-object v3, v1, v6

    .line 105
    .local v3, e:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v13

    const/16 v14, 0x26

    if-eq v13, v14, :cond_4

    .line 104
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 108
    :cond_4
    :try_start_0
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    .line 109
    .local v8, id:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v13, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;

    invoke-direct {v13, v8}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    invoke-virtual {v11, v13}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 110
    .end local v8           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v13

    goto :goto_2
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 121
    return-void
.end method

.method fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;
    .locals 1
    .parameter "id"

    .prologue
    .line 135
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method getConfig()Lorg/eclipse/jgit/lib/Config;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getConfig()Lorg/eclipse/jgit/lib/Config;

    move-result-object v0

    return-object v0
.end method

.method getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method getFS()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    return-object v0
.end method

.method getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 2
    .parameter "curs"
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    return-wide v0
.end method

.method getPacks()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 255
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPacks()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method getShallowCommits()Ljava/util/Set;
    .locals 1
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

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getShallowCommits()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 6
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 176
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->unpackedObjects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 184
    :cond_0
    :goto_0
    return v4

    .line 178
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->hasPackedObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 180
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_2

    aget-object v0, v1, v2

    .line 181
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 180
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 184
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method

.method insertUnpackedObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;Z)Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
    .locals 3
    .parameter "tmp"
    .parameter "objectId"
    .parameter "createDuplicate"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v1, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->insertUnpackedObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;Z)Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    move-result-object v0

    .line 229
    .local v0, result:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$1;->$SwitchMap$org$eclipse$jgit$internal$storage$file$FileObjectDatabase$InsertLooseObjectResult:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 239
    :goto_0
    return-object v0

    .line 232
    :pswitch_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->unpackedObjects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;

    invoke-direct {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory$UnpackedObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->addIfAbsent(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    goto :goto_0

    .line 229
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public newCachedDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;
    .locals 0

    .prologue
    .line 125
    return-object p0
.end method

.method openLooseObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 2
    .parameter "curs"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->unpackedObjects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 216
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openLooseObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 217
    .local v0, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v0, :cond_0

    .line 221
    .end local v0           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    :goto_0
    return-object v0

    .line 219
    .restart local v0       #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->scanLoose()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->unpackedObjects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 221
    .end local v0           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method openObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 6
    .parameter "curs"
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->openLooseObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    .line 191
    .local v3, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v3, :cond_0

    move-object v5, v3

    .line 201
    :goto_0
    return-object v5

    .line 193
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v5, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openPackedObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    .line 194
    if-eqz v3, :cond_1

    move-object v5, v3

    .line 195
    goto :goto_0

    .line 196
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    array-length v4, v1

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v4, :cond_3

    aget-object v0, v1, v2

    .line 197
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->openObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    .line 198
    if-eqz v3, :cond_2

    move-object v5, v3

    .line 199
    goto :goto_0

    .line 196
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 201
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    :cond_3
    const/4 v5, 0x0

    goto :goto_0
.end method

.method openPack(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .locals 1
    .parameter "pack"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openPack(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v0

    return-object v0
.end method

.method resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)V
    .locals 1
    .parameter
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    .local p1, matches:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)V

    .line 172
    return-void
.end method

.method selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 1
    .parameter "packer"
    .parameter "otp"
    .parameter "curs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 250
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;->wrapped:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 251
    return-void
.end method
