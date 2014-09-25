.class public Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;
.super Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;
.source "ObjectDirectory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;,
        Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;,
        Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    }
.end annotation


# static fields
.field private static final NO_PACKS:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList; = null

.field private static final RESOLVE_ABBREV_LIMIT:I = 0x100


# instance fields
.field private final alternates:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;",
            ">;"
        }
    .end annotation
.end field

.field private final alternatesFile:Ljava/io/File;

.field private final config:Lorg/eclipse/jgit/lib/Config;

.field private final fs:Lorg/eclipse/jgit/util/FS;

.field private final infoDirectory:Ljava/io/File;

.field private final objects:Ljava/io/File;

.field private final packDirectory:Ljava/io/File;

.field private final packList:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;",
            ">;"
        }
    .end annotation
.end field

.field private shallowCommitsIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final shallowFile:Ljava/io/File;

.field private shallowFileSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

.field private final unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 103
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->DIRTY:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    const/4 v2, 0x0

    new-array v2, v2, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;[Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;[Ljava/io/File;Lorg/eclipse/jgit/util/FS;Ljava/io/File;)V
    .locals 5
    .parameter "cfg"
    .parameter "dir"
    .parameter "alternatePaths"
    .parameter "fs"
    .parameter "shallowFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;-><init>()V

    .line 129
    sget-object v2, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->DIRTY:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFileSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 153
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->config:Lorg/eclipse/jgit/lib/Config;

    .line 154
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->objects:Ljava/io/File;

    .line 155
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->objects:Ljava/io/File;

    const-string v4, "info"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->infoDirectory:Ljava/io/File;

    .line 156
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->objects:Ljava/io/File;

    const-string v4, "pack"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packDirectory:Ljava/io/File;

    .line 157
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->infoDirectory:Ljava/io/File;

    const-string v4, "alternates"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternatesFile:Ljava/io/File;

    .line 158
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v3, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    .line 159
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-direct {v2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    .line 160
    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    .line 161
    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFile:Ljava/io/File;

    .line 163
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    .line 164
    if-eqz p3, :cond_1

    .line 167
    array-length v2, p3

    new-array v0, v2, [Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    .line 168
    .local v0, alt:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, p3

    if-ge v1, v2, :cond_0

    .line 169
    aget-object v2, p3, v1

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openAlternate(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v2

    aput-object v2, v0, v1

    .line 168
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 170
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 172
    .end local v0           #alt:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    .end local v1           #i:I
    :cond_1
    return-void
.end method

.method private getLooseObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 4
    .parameter "curs"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 513
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 515
    .local v0, in:Ljava/io/FileInputStream;
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 516
    invoke-static {v0, p2, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->getSize(Ljava/io/InputStream;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v2

    .line 518
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 522
    .end local v0           #in:Ljava/io/FileInputStream;
    :goto_0
    return-wide v2

    .line 518
    .restart local v0       #in:Ljava/io/FileInputStream;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    throw v2
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 520
    .end local v0           #in:Ljava/io/FileInputStream;
    :catch_0
    move-exception v1

    .line 521
    .local v1, noFile:Ljava/io/FileNotFoundException;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->remove(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 522
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method private getLooseSizeFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 9
    .parameter "curs"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 474
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getLooseObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v3

    .line 475
    .local v3, len:J
    cmp-long v6, v7, v3

    if-gtz v6, :cond_0

    move-wide v6, v3

    .line 482
    :goto_0
    return-wide v6

    .line 477
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v5, v1

    .local v5, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v5, :cond_2

    aget-object v0, v1, v2

    .line 478
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-direct {v6, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getLooseSizeFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v3

    .line 479
    cmp-long v6, v7, v3

    if-gtz v6, :cond_1

    move-wide v6, v3

    .line 480
    goto :goto_0

    .line 477
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 482
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_2
    const-wide/16 v6, -0x1

    goto :goto_0
.end method

.method private getPackedObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 10
    .parameter "curs"
    .parameter "id"

    .prologue
    .line 489
    :cond_0
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 490
    .local v7, pList:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v0, v7, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v5, v0

    .local v5, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v5, :cond_2

    aget-object v6, v0, v2

    .line 492
    .local v6, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :try_start_0
    invoke-virtual {v6, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/PackMismatchException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-wide v3

    .line 493
    .local v3, len:J
    const-wide/16 v8, 0x0

    cmp-long v8, v8, v3

    if-gtz v8, :cond_1

    .line 507
    .end local v3           #len:J
    .end local v6           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :goto_1
    return-wide v3

    .line 495
    .restart local v6       #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :catch_0
    move-exception v1

    .line 497
    .local v1, e:Lorg/eclipse/jgit/errors/PackMismatchException;
    invoke-direct {p0, v7}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->searchPacksAgain(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 490
    .end local v1           #e:Lorg/eclipse/jgit/errors/PackMismatchException;
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 499
    :catch_1
    move-exception v1

    .line 501
    .local v1, e:Ljava/io/IOException;
    invoke-direct {p0, v6}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->removePack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    goto :goto_2

    .line 506
    .end local v1           #e:Ljava/io/IOException;
    .end local v6           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_2
    invoke-direct {p0, v7}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->searchPacksAgain(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 507
    const-wide/16 v3, -0x1

    goto :goto_1
.end method

.method private getPackedSizeFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 9
    .parameter "curs"
    .parameter "id"

    .prologue
    const-wide/16 v7, 0x0

    .line 461
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPackedObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v3

    .line 462
    .local v3, len:J
    cmp-long v6, v7, v3

    if-gtz v6, :cond_0

    move-wide v6, v3

    .line 469
    :goto_0
    return-wide v6

    .line 464
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v5, v1

    .local v5, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v5, :cond_2

    aget-object v0, v1, v2

    .line 465
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-direct {v6, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPackedSizeFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v3

    .line 466
    cmp-long v6, v7, v3

    if-gtz v6, :cond_1

    move-wide v6, v3

    .line 467
    goto :goto_0

    .line 464
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 469
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_2
    const-wide/16 v6, -0x1

    goto :goto_0
.end method

.method private hasLooseInSelfOrAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 6
    .parameter "objectId"

    .prologue
    const/4 v4, 0x1

    .line 289
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 295
    :cond_0
    :goto_0
    return v4

    .line 291
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_2

    aget-object v0, v1, v2

    .line 292
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-direct {v5, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->hasLooseInSelfOrAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 291
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 295
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private hasPackedInSelfOrAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 6
    .parameter "objectId"

    .prologue
    const/4 v4, 0x1

    .line 279
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->hasPackedObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 285
    :cond_0
    :goto_0
    return v4

    .line 281
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_2

    aget-object v0, v1, v2

    .line 282
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-direct {v5, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->hasPackedInSelfOrAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 281
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 285
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private static indexOf([Lorg/eclipse/jgit/internal/storage/file/PackFile;Lorg/eclipse/jgit/internal/storage/file/PackFile;)I
    .locals 2
    .parameter "list"
    .parameter "pack"

    .prologue
    .line 689
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 690
    aget-object v1, p0, v0

    if-ne v1, p1, :cond_0

    .line 693
    .end local v0           #i:I
    :goto_1
    return v0

    .line 689
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 693
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private insertPack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V
    .locals 12
    .parameter "pf"

    .prologue
    const/4 v11, 0x0

    .line 648
    :cond_0
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 654
    .local v6, o:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v7, v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 655
    .local v7, oldList:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 656
    .local v4, name:Ljava/lang/String;
    move-object v0, v7

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v8, v0, v1

    .line 657
    .local v8, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    sget-object v9, Lorg/eclipse/jgit/internal/storage/file/PackFile;->SORT:Ljava/util/Comparator;

    invoke-interface {v9, p1, v8}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v9

    if-gez v9, :cond_3

    .line 663
    .end local v8           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_1
    array-length v9, v7

    add-int/lit8 v9, v9, 0x1

    new-array v5, v9, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 664
    .local v5, newList:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    aput-object p1, v5, v11

    .line 665
    const/4 v9, 0x1

    array-length v10, v7

    invoke-static {v7, v11, v5, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 666
    new-instance v3, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    iget-object v9, v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-direct {v3, v9, v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;[Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 667
    .local v3, n:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v9, v6, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 668
    .end local v3           #n:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    .end local v5           #newList:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_2
    return-void

    .line 659
    .restart local v8       #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_3
    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 656
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private listPackDirectory()Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 803
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packDirectory:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 804
    .local v4, nameList:[Ljava/lang/String;
    if-nez v4, :cond_1

    .line 805
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v5

    .line 811
    :cond_0
    return-object v5

    .line 806
    :cond_1
    new-instance v5, Ljava/util/HashSet;

    array-length v6, v4

    shl-int/lit8 v6, v6, 0x1

    invoke-direct {v5, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 807
    .local v5, nameSet:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    move-object v0, v4

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 808
    .local v3, name:Ljava/lang/String;
    const-string v6, "pack-"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 809
    invoke-interface {v5, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 807
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private loadAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 833
    new-instance v1, Ljava/util/ArrayList;

    const/4 v3, 0x4

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 834
    .local v1, l:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternatesFile:Ljava/io/File;

    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->open(Ljava/io/File;)Ljava/io/BufferedReader;

    move-result-object v0

    .line 837
    .local v0, br:Ljava/io/BufferedReader;
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, line:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 838
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openAlternate(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 841
    .end local v2           #line:Ljava/lang/String;
    :catchall_0
    move-exception v3

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v3

    .restart local v2       #line:Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 843
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    return-object v3
.end method

.method private static open(Ljava/io/File;)Ljava/io/BufferedReader;
    .locals 2
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 848
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    return-object v0
.end method

.method private openAlternate(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    .locals 8
    .parameter "objdir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 858
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    .line 859
    .local v7, parent:Ljava/io/File;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-static {v7, v1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->isGitRepository(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 860
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-static {v7, v1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->exact(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;

    move-result-object v6

    .line 861
    .local v6, key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    invoke-static {v6}, Lorg/eclipse/jgit/lib/RepositoryCache;->open(Lorg/eclipse/jgit/lib/RepositoryCache$Key;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    .line 862
    .local v0, db:Lorg/eclipse/jgit/internal/storage/file/FileRepository;
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V

    .line 866
    .end local v0           #db:Lorg/eclipse/jgit/internal/storage/file/FileRepository;
    .end local v6           #key:Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;
    :goto_0
    return-object v1

    .line 865
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->config:Lorg/eclipse/jgit/lib/Config;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    move-object v2, p1

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;[Ljava/io/File;Lorg/eclipse/jgit/util/FS;Ljava/io/File;)V

    .line 866
    .local v0, db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;-><init>(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;)V

    goto :goto_0
.end method

.method private openAlternate(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    .locals 3
    .parameter "location"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 853
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->objects:Ljava/io/File;

    invoke-virtual {v1, v2, p1}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 854
    .local v0, objdir:Ljava/io/File;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openAlternate(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    return-object v1
.end method

.method private openLooseFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 6
    .parameter "curs"
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openLooseObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    .line 394
    .local v3, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v3, :cond_0

    move-object v5, v3

    .line 401
    :goto_0
    return-object v5

    .line 396
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v4, v1

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v0, v1, v2

    .line 397
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-direct {v5, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openLooseFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    .line 398
    if-eqz v3, :cond_1

    move-object v5, v3

    .line 399
    goto :goto_0

    .line 396
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 401
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private openPackedFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 6
    .parameter "curs"
    .parameter "objectId"

    .prologue
    .line 380
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openPackedObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    .line 381
    .local v3, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v3, :cond_0

    move-object v5, v3

    .line 388
    :goto_0
    return-object v5

    .line 383
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v1

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v4, v1

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v0, v1, v2

    .line 384
    .local v0, alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-direct {v5, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openPackedFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    .line 385
    if-eqz v3, :cond_1

    move-object v5, v3

    .line 386
    goto :goto_0

    .line 383
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 388
    .end local v0           #alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private removePack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V
    .locals 8
    .parameter "deadPack"

    .prologue
    const/4 v7, 0x0

    .line 673
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 675
    .local v3, o:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v4, v3, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 676
    .local v4, oldList:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-static {v4, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->indexOf([Lorg/eclipse/jgit/internal/storage/file/PackFile;Lorg/eclipse/jgit/internal/storage/file/PackFile;)I

    move-result v0

    .line 677
    .local v0, j:I
    if-gez v0, :cond_1

    .line 685
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->close()V

    .line 686
    return-void

    .line 680
    :cond_1
    array-length v5, v4

    add-int/lit8 v5, v5, -0x1

    new-array v2, v5, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 681
    .local v2, newList:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-static {v4, v7, v2, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 682
    add-int/lit8 v5, v0, 0x1

    array-length v6, v2

    sub-int/2addr v6, v0

    invoke-static {v4, v5, v2, v0, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 683
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    iget-object v5, v3, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-direct {v1, v5, v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;[Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 684
    .local v1, n:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v3, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0
.end method

.method private static reuseMap(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Ljava/util/Map;
    .locals 7
    .parameter "old"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 777
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 778
    .local v1, forReuse:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 779
    .local v4, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->invalid()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 783
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->close()V

    .line 778
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 787
    :cond_1
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 788
    .local v5, prior:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    if-eqz v5, :cond_0

    .line 795
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 796
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->close()V

    goto :goto_1

    .line 799
    .end local v4           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .end local v5           #prior:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_2
    return-object v1
.end method

.method private scanPacks(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    .locals 4
    .parameter "original"

    .prologue
    .line 697
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v3

    .line 700
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 701
    .local v1, o:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    if-eq v1, p1, :cond_1

    .line 705
    monitor-exit v3

    move-object v0, v1

    .line 711
    :goto_0
    return-object v0

    .line 707
    :cond_1
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->scanPacksImpl(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    move-result-object v0

    .line 708
    .local v0, n:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    if-ne v0, v1, :cond_2

    .line 709
    monitor-exit v3

    goto :goto_0

    .line 712
    .end local v0           #n:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    .end local v1           #o:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 710
    .restart local v0       #n:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    .restart local v1       #o:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 711
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method private scanPacksImpl(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    .locals 23
    .parameter "old"

    .prologue
    .line 716
    invoke-static/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->reuseMap(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Ljava/util/Map;

    move-result-object v7

    .line 717
    .local v7, forReuse:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packDirectory:Ljava/io/File;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v20

    .line 718
    .local v20, snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->listPackDirectory()Ljava/util/Set;

    move-result-object v14

    .line 719
    .local v14, names:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-interface {v14}, Ljava/util/Set;->size()I

    move-result v21

    shr-int/lit8 v21, v21, 0x2

    move/from16 v0, v21

    invoke-direct {v13, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 720
    .local v13, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    const/4 v8, 0x0

    .line 721
    .local v8, foundNew:Z
    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 724
    .local v11, indexName:Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v21

    const/16 v22, 0x31

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_0

    const-string v21, ".idx"

    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 727
    const/16 v21, 0x0

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v22

    add-int/lit8 v22, v22, -0x3

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v11, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 728
    .local v4, base:Ljava/lang/String;
    const/4 v6, 0x0

    .line 729
    .local v6, extensions:I
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->values()[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-result-object v3

    .local v3, arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    array-length v12, v3

    .local v12, len$:I
    const/4 v10, 0x0

    .local v10, i$:I
    :goto_1
    if-ge v10, v12, :cond_2

    aget-object v5, v3, v10

    .line 730
    .local v5, ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v14, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1

    .line 731
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v21

    or-int v6, v6, v21

    .line 729
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 734
    .end local v5           #ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    :cond_2
    sget-object v21, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v21

    and-int v21, v21, v6

    if-eqz v21, :cond_0

    .line 742
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    sget-object v22, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 743
    .local v18, packName:Ljava/lang/String;
    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 744
    .local v15, oldPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    if-eqz v15, :cond_3

    .line 745
    invoke-interface {v13, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 749
    :cond_3
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packDirectory:Ljava/io/File;

    move-object/from16 v21, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 750
    .local v17, packFile:Ljava/io/File;
    new-instance v21, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/internal/storage/file/PackFile;-><init>(Ljava/io/File;I)V

    move-object/from16 v0, v21

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 751
    const/4 v8, 0x1

    .line 752
    goto/16 :goto_0

    .line 759
    .end local v3           #arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    .end local v4           #base:Ljava/lang/String;
    .end local v6           #extensions:I
    .end local v10           #i$:I
    .end local v11           #indexName:Ljava/lang/String;
    .end local v12           #len$:I
    .end local v15           #oldPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .end local v17           #packFile:Ljava/io/File;
    .end local v18           #packName:Ljava/lang/String;
    :cond_4
    if-nez v8, :cond_5

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v21

    if-eqz v21, :cond_5

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->equals(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)Z

    move-result v21

    if-eqz v21, :cond_5

    .line 760
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->setClean(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)V

    .line 773
    .end local p1
    :goto_2
    return-object p1

    .line 764
    .restart local p1
    :cond_5
    invoke-interface {v7}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 765
    .local v16, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->close()V

    goto :goto_3

    .line 768
    .end local v16           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_6
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v21

    if-eqz v21, :cond_7

    .line 769
    new-instance p1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .end local p1
    sget-object v21, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;[Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    goto :goto_2

    .line 771
    .restart local p1
    :cond_7
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v21

    move/from16 v0, v21

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v13, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v19

    check-cast v19, [Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 772
    .local v19, r:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    sget-object v21, Lorg/eclipse/jgit/internal/storage/file/PackFile;->SORT:Ljava/util/Comparator;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 773
    new-instance p1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .end local p1
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;[Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    goto :goto_2
.end method

.method private searchPacksAgain(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Z
    .locals 2
    .parameter "old"

    .prologue
    .line 609
    iget-object v0, p1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packDirectory:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->scanPacks(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    move-result-object v0

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 9

    .prologue
    .line 200
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->clear()V

    .line 202
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 203
    .local v6, packs:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    sget-object v7, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    if-eq v6, v7, :cond_0

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v8, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    invoke-virtual {v7, v6, v8}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 204
    iget-object v1, v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v1, v2

    .line 205
    .local v5, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->close()V

    .line 204
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 209
    .end local v1           #arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v5           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_0
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    .line 210
    .local v0, alt:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    if-eqz v0, :cond_1

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v8, 0x0

    invoke-virtual {v7, v0, v8}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 211
    move-object v1, v0

    .local v1, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v3, v1

    .restart local v3       #len$:I
    const/4 v2, 0x0

    .restart local v2       #i$:I
    :goto_1
    if-ge v2, v3, :cond_1

    aget-object v4, v1, v2

    .line 212
    .local v4, od:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->close()V

    .line 211
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 214
    .end local v1           #arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v4           #od:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_1
    return-void
.end method

.method public create()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->objects:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdirs(Ljava/io/File;)V

    .line 189
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->infoDirectory:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 190
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packDirectory:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 191
    return-void
.end method

.method public exists()Z
    .locals 2

    .prologue
    .line 183
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->objects:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;
    .locals 6
    .parameter "objectId"

    .prologue
    const/4 v4, 0x2

    .line 877
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v2

    .line 878
    .local v2, n:Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 879
    .local v0, d:Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 880
    .local v1, f:Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v3
.end method

.method getConfig()Lorg/eclipse/jgit/lib/Config;
    .locals 1

    .prologue
    .line 613
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->config:Lorg/eclipse/jgit/lib/Config;

    return-object v0
.end method

.method public final getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->objects:Ljava/io/File;

    return-object v0
.end method

.method getFS()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 618
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    return-object v0
.end method

.method getObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .locals 5
    .parameter "curs"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v3, 0x0

    .line 448
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->isUnpacked(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 449
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getLooseObjectSize(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 450
    .local v0, len:J
    cmp-long v2, v3, v0

    if-gtz v2, :cond_0

    move-wide v2, v0

    .line 456
    :goto_0
    return-wide v2

    .line 453
    .end local v0           #len:J
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPackedSizeFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    .line 454
    .restart local v0       #len:J
    cmp-long v2, v3, v0

    if-gtz v2, :cond_1

    move-wide v2, v0

    .line 455
    goto :goto_0

    .line 456
    :cond_1
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getLooseSizeFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v2

    goto :goto_0
.end method

.method public getPacks()Ljava/util/Collection;
    .locals 3
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
    .line 225
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 226
    .local v0, list:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    sget-object v2, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    if-ne v0, v2, :cond_0

    .line 227
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->scanPacks(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    move-result-object v0

    .line 228
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 229
    .local v1, packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v2

    return-object v2
.end method

.method getShallowCommits()Ljava/util/Set;
    .locals 4
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
    .line 623
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFile:Ljava/io/File;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_1

    .line 624
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    .line 642
    :goto_0
    return-object v2

    .line 626
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFileSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFileSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 628
    :cond_2
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowCommitsIds:Ljava/util/Set;

    .line 630
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFile:Ljava/io/File;

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->open(Ljava/io/File;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 633
    .local v1, reader:Ljava/io/BufferedReader;
    :goto_1
    :try_start_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, line:Ljava/lang/String;
    if-eqz v0, :cond_3

    .line 634
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowCommitsIds:Ljava/util/Set;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 636
    .end local v0           #line:Ljava/lang/String;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    throw v2

    .restart local v0       #line:Ljava/lang/String;
    :cond_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 639
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFile:Ljava/io/File;

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowFileSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 642
    .end local v0           #line:Ljava/lang/String;
    .end local v1           #reader:Ljava/io/BufferedReader;
    :cond_4
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->shallowCommitsIds:Ljava/util/Set;

    goto :goto_0
.end method

.method public has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "objectId"

    .prologue
    .line 273
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->isUnpacked(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->hasPackedInSelfOrAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->hasLooseInSelfOrAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasPackedObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 7
    .parameter "objectId"

    .prologue
    .line 301
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 302
    .local v5, pList:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v0, v5, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 304
    .local v4, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :try_start_0
    invoke-virtual {v4, p1}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_1

    .line 305
    const/4 v6, 0x1

    .line 314
    .end local v4           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :goto_1
    return v6

    .line 306
    .restart local v4       #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :catch_0
    move-exception v1

    .line 310
    .local v1, e:Ljava/io/IOException;
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->removePack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 302
    .end local v1           #e:Ljava/io/IOException;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 313
    .end local v4           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_2
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->searchPacksAgain(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 314
    const/4 v6, 0x0

    goto :goto_1
.end method

.method insertUnpackedObject(Ljava/io/File;Lorg/eclipse/jgit/lib/ObjectId;Z)Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;
    .locals 4
    .parameter "tmp"
    .parameter "id"
    .parameter "createDuplicate"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    .line 559
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->isUnpacked(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 560
    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 561
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_LOOSE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    .line 605
    :goto_0
    return-object v1

    .line 563
    :cond_0
    if-nez p3, :cond_1

    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 564
    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 565
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_PACKED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    goto :goto_0

    .line 568
    :cond_1
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;

    move-result-object v0

    .line 569
    .local v0, dst:Ljava/io/File;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 574
    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 575
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_LOOSE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    goto :goto_0

    .line 577
    :cond_2
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 578
    invoke-virtual {v0}, Ljava/io/File;->setReadOnly()Z

    .line 579
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 580
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->INSERTED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    goto :goto_0

    .line 587
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;Z)V

    .line 588
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 589
    invoke-virtual {v0}, Ljava/io/File;->setReadOnly()Z

    .line 590
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 591
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->INSERTED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    goto :goto_0

    .line 594
    :cond_4
    if-nez p3, :cond_5

    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 595
    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 596
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->EXISTS_PACKED:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    goto :goto_0

    .line 604
    :cond_5
    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 605
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;->FAILURE:Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase$InsertLooseObjectResult;

    goto :goto_0
.end method

.method myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    .locals 5

    .prologue
    .line 815
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    .line 816
    .local v1, alt:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    if-nez v1, :cond_1

    .line 817
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v4

    .line 818
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, [Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-object v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 819
    if-nez v1, :cond_0

    .line 821
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->loadAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 825
    :goto_0
    :try_start_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->alternates:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 827
    :cond_0
    monitor-exit v4

    .line 829
    :cond_1
    return-object v1

    .line 822
    :catch_0
    move-exception v2

    .line 823
    .local v2, e:Ljava/io/IOException;
    const/4 v3, 0x0

    new-array v1, v3, [Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    goto :goto_0

    .line 827
    .end local v2           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method

.method public newCachedDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;
    .locals 1

    .prologue
    .line 923
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->newCachedFileObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    move-result-object v0

    return-object v0
.end method

.method newCachedFileObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;
    .locals 1

    .prologue
    .line 927
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/CachedObjectDirectory;-><init>(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;)V

    return-object v0
.end method

.method public newInserter()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;
    .locals 2

    .prologue
    .line 195
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->config:Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;Lorg/eclipse/jgit/lib/Config;)V

    return-object v0
.end method

.method public bridge synthetic newInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->newInserter()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectoryInserter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 1

    .prologue
    .line 102
    invoke-super {p0}, Lorg/eclipse/jgit/internal/storage/file/FileObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    return-object v0
.end method

.method openLooseObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 4
    .parameter "curs"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 432
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;

    move-result-object v2

    .line 433
    .local v2, path:Ljava/io/File;
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 435
    .local v0, in:Ljava/io/FileInputStream;
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 436
    invoke-static {v0, v2, p2, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->open(Ljava/io/InputStream;Ljava/io/File;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 438
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 442
    .end local v0           #in:Ljava/io/FileInputStream;
    .end local v2           #path:Ljava/io/File;
    :goto_0
    return-object v3

    .line 438
    .restart local v0       #in:Ljava/io/FileInputStream;
    .restart local v2       #path:Ljava/io/File;
    :catchall_0
    move-exception v3

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    throw v3
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 440
    .end local v0           #in:Ljava/io/FileInputStream;
    .end local v2           #path:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 441
    .local v1, noFile:Ljava/io/FileNotFoundException;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->remove(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 442
    const/4 v3, 0x0

    goto :goto_0
.end method

.method openObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 2
    .parameter "curs"
    .parameter "objectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->unpackedObjectCache:Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObjectCache;->isUnpacked(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 368
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openLooseObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 369
    .local v0, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 375
    :goto_0
    return-object v1

    .line 372
    .end local v0           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openPackedFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 373
    .restart local v0       #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v0, :cond_1

    move-object v1, v0

    .line 374
    goto :goto_0

    .line 375
    :cond_1
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openLooseFromSelfOrAlternate(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    goto :goto_0
.end method

.method public openPack(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .locals 13
    .parameter "pack"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 244
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    .line 245
    .local v7, p:Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    const/16 v10, 0x32

    if-ne v9, v10, :cond_0

    const-string v9, "pack-"

    invoke-virtual {v7, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v9, ".pack"

    invoke-virtual {v7, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 246
    :cond_0
    new-instance v9, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->notAValidPack:Ljava/lang/String;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    aput-object p1, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 251
    :cond_1
    sget-object v9, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v9}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v9

    sget-object v10, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v10

    or-int v3, v9, v10

    .line 252
    .local v3, extensions:I
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x4

    invoke-virtual {v7, v12, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 253
    .local v1, base:Ljava/lang/String;
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->values()[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_3

    aget-object v2, v0, v4

    .line 254
    .local v2, ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v9

    and-int/2addr v9, v3

    if-nez v9, :cond_2

    .line 255
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 256
    .local v6, name:Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v10

    invoke-direct {v9, v10, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 257
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getBit()I

    move-result v9

    or-int/2addr v3, v9

    .line 253
    .end local v6           #name:Ljava/lang/String;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 261
    .end local v2           #ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    :cond_3
    new-instance v8, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    invoke-direct {v8, p1, v3}, Lorg/eclipse/jgit/internal/storage/file/PackFile;-><init>(Ljava/io/File;I)V

    .line 262
    .local v8, res:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-direct {p0, v8}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->insertPack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    .line 263
    return-object v8
.end method

.method openPackedObject(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    .locals 8
    .parameter "curs"
    .parameter "objectId"

    .prologue
    .line 408
    :cond_0
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 409
    .local v6, pList:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v0, v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v4, :cond_2

    aget-object v5, v0, v2

    .line 411
    .local v5, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :try_start_0
    invoke-virtual {v5, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->get(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/PackMismatchException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 412
    .local v3, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    if-eqz v3, :cond_1

    .line 426
    .end local v3           #ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    .end local v5           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :goto_1
    return-object v3

    .line 414
    .restart local v5       #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :catch_0
    move-exception v1

    .line 416
    .local v1, e:Lorg/eclipse/jgit/errors/PackMismatchException;
    invoke-direct {p0, v6}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->searchPacksAgain(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 409
    .end local v1           #e:Lorg/eclipse/jgit/errors/PackMismatchException;
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 418
    :catch_1
    move-exception v1

    .line 420
    .local v1, e:Ljava/io/IOException;
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->removePack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    goto :goto_2

    .line 425
    .end local v1           #e:Ljava/io/IOException;
    .end local v5           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_2
    invoke-direct {p0, v6}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->searchPacksAgain(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 426
    const/4 v3, 0x0

    goto :goto_1
.end method

.method resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)V
    .locals 17
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
    .line 322
    .local p1, matches:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->size()I

    move-result v11

    .line 325
    .local v11, oldSize:I
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 326
    .local v13, pList:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    iget-object v3, v13, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .local v3, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v9, v3

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v9, :cond_3

    aget-object v12, v3, v8

    .line 328
    .local v12, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    const/16 v14, 0x100

    :try_start_0
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v12, v0, v1, v14}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 334
    :goto_1
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->size()I

    move-result v14

    const/16 v15, 0x100

    if-le v14, v15, :cond_2

    .line 362
    .end local v3           #arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .end local v12           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_1
    :goto_2
    return-void

    .line 329
    .restart local v3       #arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .restart local v12       #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :catch_0
    move-exception v4

    .line 332
    .local v4, e:Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->removePack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    goto :goto_1

    .line 326
    .end local v4           #e:Ljava/io/IOException;
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 337
    .end local v12           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_3
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->size()I

    move-result v14

    if-ne v14, v11, :cond_4

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->searchPacksAgain(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 339
    :cond_4
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    const/16 v16, 0x2

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 340
    .local v7, fanOut:Ljava/lang/String;
    new-instance v14, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v15

    invoke-direct {v14, v15, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v6

    .line 341
    .local v6, entries:[Ljava/lang/String;
    if-eqz v6, :cond_8

    .line 342
    move-object v3, v6

    .local v3, arr$:[Ljava/lang/String;
    array-length v9, v3

    const/4 v8, 0x0

    :goto_3
    if-ge v8, v9, :cond_8

    aget-object v4, v3, v8

    .line 343
    .local v4, e:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v15, 0x26

    if-eq v14, v15, :cond_6

    .line 342
    :cond_5
    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 346
    :cond_6
    :try_start_1
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 347
    .local v5, entId:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v14

    if-nez v14, :cond_7

    .line 348
    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 352
    :cond_7
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->size()I

    move-result v14

    const/16 v15, 0x100

    if-le v14, v15, :cond_5

    goto :goto_2

    .line 349
    .end local v5           #entId:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_1
    move-exception v10

    .line 350
    .local v10, notId:Ljava/lang/IllegalArgumentException;
    goto :goto_4

    .line 357
    .end local v3           #arr$:[Ljava/lang/String;
    .end local v4           #e:Ljava/lang/String;
    .end local v10           #notId:Ljava/lang/IllegalArgumentException;
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v3

    .local v3, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v9, v3

    const/4 v8, 0x0

    :goto_5
    if-ge v8, v9, :cond_1

    aget-object v2, v3, v8

    .line 358
    .local v2, alt:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v14, v2, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v14, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;)V

    .line 359
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->size()I

    move-result v14

    const/16 v15, 0x100

    if-gt v14, v15, :cond_1

    .line 357
    add-int/lit8 v8, v8, 0x1

    goto :goto_5
.end method

.method selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)V
    .locals 9
    .parameter "packer"
    .parameter "otp"
    .parameter "curs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 529
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    .line 531
    .local v6, pList:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;
    :goto_0
    iget-object v0, v6, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/PackFile;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_1

    aget-object v5, v0, v3

    .line 533
    .local v5, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :try_start_0
    invoke-virtual {v5, p3, p2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->representation(Lorg/eclipse/jgit/internal/storage/file/WindowCursor;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;

    move-result-object v7

    .line 534
    .local v7, rep:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    if-eqz v7, :cond_0

    .line 535
    invoke-virtual {p1, p2, v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->select(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/PackMismatchException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 531
    .end local v7           #rep:Lorg/eclipse/jgit/internal/storage/file/LocalObjectRepresentation;
    :cond_0
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 536
    :catch_0
    move-exception v1

    .line 539
    .local v1, e:Lorg/eclipse/jgit/errors/PackMismatchException;
    invoke-direct {p0, v6}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->scanPacks(Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;)Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$PackList;

    move-result-object v6

    .line 540
    goto :goto_0

    .line 541
    .end local v1           #e:Lorg/eclipse/jgit/errors/PackMismatchException;
    :catch_1
    move-exception v1

    .line 544
    .local v1, e:Ljava/io/IOException;
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->removePack(Lorg/eclipse/jgit/internal/storage/file/PackFile;)V

    goto :goto_2

    .line 550
    .end local v1           #e:Ljava/io/IOException;
    .end local v5           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v4, v0

    const/4 v3, 0x0

    :goto_3
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 551
    .local v2, h:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v8, v2, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;->db:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v8, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/file/WindowCursor;)V

    .line 550
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 552
    .end local v2           #h:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 268
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ObjectDirectory["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
