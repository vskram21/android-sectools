.class public Lorg/eclipse/jgit/lib/RepositoryCache;
.super Ljava/lang/Object;
.source "RepositoryCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/RepositoryCache$1;,
        Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;,
        Lorg/eclipse/jgit/lib/RepositoryCache$Key;,
        Lorg/eclipse/jgit/lib/RepositoryCache$Lock;
    }
.end annotation


# static fields
.field private static final cache:Lorg/eclipse/jgit/lib/RepositoryCache;


# instance fields
.field private final cacheMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/eclipse/jgit/lib/RepositoryCache$Key;",
            "Ljava/lang/ref/Reference",
            "<",
            "Lorg/eclipse/jgit/lib/Repository;",
            ">;>;"
        }
    .end annotation
.end field

.field private final openLocks:[Lorg/eclipse/jgit/lib/RepositoryCache$Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryCache;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/RepositoryCache;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/lib/RepositoryCache;->cache:Lorg/eclipse/jgit/lib/RepositoryCache;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->cacheMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 157
    const/4 v1, 0x4

    new-array v1, v1, [Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    iput-object v1, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->openLocks:[Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    .line 158
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->openLocks:[Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 159
    iget-object v1, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->openLocks:[Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    new-instance v2, Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/lib/RepositoryCache$Lock;-><init>(Lorg/eclipse/jgit/lib/RepositoryCache$1;)V

    aput-object v2, v1, v0

    .line 158
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 160
    :cond_0
    return-void
.end method

.method public static clear()V
    .locals 1

    .prologue
    .line 148
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryCache;->cache:Lorg/eclipse/jgit/lib/RepositoryCache;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/RepositoryCache;->clearAll()V

    .line 149
    return-void
.end method

.method private clearAll()V
    .locals 5

    .prologue
    .line 198
    const/4 v3, 0x0

    .local v3, stage:I
    :goto_0
    const/4 v4, 0x2

    if-ge v3, v4, :cond_2

    .line 199
    iget-object v4, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->cacheMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 200
    .local v2, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/RepositoryCache$Key;Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;>;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 201
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 202
    .local v1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/RepositoryCache$Key;Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/ref/Reference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/Repository;

    .line 203
    .local v0, db:Lorg/eclipse/jgit/lib/Repository;
    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 205
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 198
    .end local v0           #db:Lorg/eclipse/jgit/lib/Repository;
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/RepositoryCache$Key;Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;>;"
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 208
    .end local v2           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Lorg/eclipse/jgit/lib/RepositoryCache$Key;Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;>;>;"
    :cond_2
    return-void
.end method

.method public static close(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 3
    .parameter "db"

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 141
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->exact(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    move-result-object v0

    .line 142
    .local v0, key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    sget-object v1, Lorg/eclipse/jgit/lib/RepositoryCache;->cache:Lorg/eclipse/jgit/lib/RepositoryCache;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/lib/RepositoryCache;->unregisterRepository(Lorg/eclipse/jgit/lib/RepositoryCache$Key;)V

    .line 144
    .end local v0           #key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    :cond_0
    return-void
.end method

.method private lockFor(Lorg/eclipse/jgit/lib/RepositoryCache$Key;)Lorg/eclipse/jgit/lib/RepositoryCache$Lock;
    .locals 3
    .parameter "location"

    .prologue
    .line 211
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->openLocks:[Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    ushr-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->openLocks:[Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    array-length v2, v2

    rem-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static open(Lorg/eclipse/jgit/lib/RepositoryCache$Key;)Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .parameter "location"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/RepositoryNotFoundException;
        }
    .end annotation

    .prologue
    .line 81
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/eclipse/jgit/lib/RepositoryCache;->open(Lorg/eclipse/jgit/lib/RepositoryCache$Key;Z)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method

.method public static open(Lorg/eclipse/jgit/lib/RepositoryCache$Key;Z)Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .parameter "location"
    .parameter "mustExist"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    sget-object v0, Lorg/eclipse/jgit/lib/RepositoryCache;->cache:Lorg/eclipse/jgit/lib/RepositoryCache;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/lib/RepositoryCache;->openRepository(Lorg/eclipse/jgit/lib/RepositoryCache$Key;Z)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method

.method private openRepository(Lorg/eclipse/jgit/lib/RepositoryCache$Key;Z)Lorg/eclipse/jgit/lib/Repository;
    .locals 7
    .parameter "location"
    .parameter "mustExist"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 164
    iget-object v4, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->cacheMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/Reference;

    .line 165
    .local v2, ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Repository;

    move-object v1, v4

    .line 166
    .local v1, db:Lorg/eclipse/jgit/lib/Repository;
    :goto_0
    if-nez v1, :cond_1

    .line 167
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/RepositoryCache;->lockFor(Lorg/eclipse/jgit/lib/RepositoryCache$Key;)Lorg/eclipse/jgit/lib/RepositoryCache$Lock;

    move-result-object v6

    monitor-enter v6

    .line 168
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->cacheMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/ref/Reference;

    move-object v2, v0

    .line 169
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Repository;

    move-object v1, v4

    .line 170
    :goto_1
    if-nez v1, :cond_0

    .line 171
    invoke-interface {p1, p2}, Lorg/eclipse/jgit/lib/RepositoryCache$Key;->open(Z)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    .line 172
    new-instance v3, Ljava/lang/ref/SoftReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    .end local v2           #ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    .local v3, ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    :try_start_1
    iget-object v4, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->cacheMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v2, v3

    .line 175
    .end local v3           #ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    .restart local v2       #ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    :cond_0
    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->incrementOpen()V

    .line 178
    return-object v1

    .end local v1           #db:Lorg/eclipse/jgit/lib/Repository;
    :cond_2
    move-object v1, v5

    .line 165
    goto :goto_0

    .restart local v1       #db:Lorg/eclipse/jgit/lib/Repository;
    :cond_3
    move-object v1, v5

    .line 169
    goto :goto_1

    .line 175
    :catchall_0
    move-exception v4

    :goto_2
    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v4

    .end local v2           #ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    .restart local v3       #ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3           #ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    .restart local v2       #ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    goto :goto_2
.end method

.method public static register(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 3
    .parameter "db"

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 125
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->exact(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    move-result-object v0

    .line 126
    .local v0, key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    sget-object v1, Lorg/eclipse/jgit/lib/RepositoryCache;->cache:Lorg/eclipse/jgit/lib/RepositoryCache;

    invoke-direct {v1, v0, p0}, Lorg/eclipse/jgit/lib/RepositoryCache;->registerRepository(Lorg/eclipse/jgit/lib/RepositoryCache$Key;Lorg/eclipse/jgit/lib/Repository;)V

    .line 128
    .end local v0           #key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    :cond_0
    return-void
.end method

.method private registerRepository(Lorg/eclipse/jgit/lib/RepositoryCache$Key;Lorg/eclipse/jgit/lib/Repository;)V
    .locals 4
    .parameter "location"
    .parameter "db"

    .prologue
    .line 182
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/Repository;->incrementOpen()V

    .line 183
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    .line 184
    .local v0, newRef:Ljava/lang/ref/SoftReference;,"Ljava/lang/ref/SoftReference<Lorg/eclipse/jgit/lib/Repository;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->cacheMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/Reference;

    .line 185
    .local v2, oldRef:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Repository;

    move-object v1, v3

    .line 186
    .local v1, oldDb:Lorg/eclipse/jgit/lib/Repository;
    :goto_0
    if-eqz v1, :cond_0

    .line 187
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 188
    :cond_0
    return-void

    .line 185
    .end local v1           #oldDb:Lorg/eclipse/jgit/lib/Repository;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private unregisterRepository(Lorg/eclipse/jgit/lib/RepositoryCache$Key;)V
    .locals 3
    .parameter "location"

    .prologue
    .line 191
    iget-object v2, p0, Lorg/eclipse/jgit/lib/RepositoryCache;->cacheMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/Reference;

    .line 192
    .local v1, oldRef:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Lorg/eclipse/jgit/lib/Repository;>;"
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Repository;

    move-object v0, v2

    .line 193
    .local v0, oldDb:Lorg/eclipse/jgit/lib/Repository;
    :goto_0
    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 195
    :cond_0
    return-void

    .line 192
    .end local v0           #oldDb:Lorg/eclipse/jgit/lib/Repository;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
