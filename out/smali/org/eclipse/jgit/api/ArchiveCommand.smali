.class public Lorg/eclipse/jgit/api/ArchiveCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ArchiveCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/ArchiveCommand$Format;,
        Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;,
        Lorg/eclipse/jgit/api/ArchiveCommand$UnsupportedFormatException;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/io/OutputStream;",
        ">;"
    }
.end annotation


# static fields
.field private static final formats:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private format:Ljava/lang/String;

.field private out:Ljava/io/OutputStream;

.field private paths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private prefix:Ljava/lang/String;

.field private suffix:Ljava/lang/String;

.field private tree:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 213
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/api/ArchiveCommand;->formats:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 340
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 331
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->paths:Ljava/util/List;

    .line 341
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/ArchiveCommand;->setCallable(Z)V

    .line 342
    return-void
.end method

.method private static formatBySuffix(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand$Format;
    .locals 6
    .parameter "filenameSuffix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/eclipse/jgit/api/ArchiveCommand$Format",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/ArchiveCommand$UnsupportedFormatException;
        }
    .end annotation

    .prologue
    .line 310
    if-eqz p0, :cond_2

    .line 311
    sget-object v5, Lorg/eclipse/jgit/api/ArchiveCommand;->formats:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;

    .line 312
    .local v0, entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    iget-object v1, v0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    .line 313
    .local v1, fmt:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<*>;"
    invoke-interface {v1}, Lorg/eclipse/jgit/api/ArchiveCommand$Format;->suffixes()Ljava/lang/Iterable;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 314
    .local v4, sfx:Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 317
    .end local v0           #entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    .end local v1           #fmt:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<*>;"
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #sfx:Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_2
    const-string v5, "tar"

    invoke-static {v5}, Lorg/eclipse/jgit/api/ArchiveCommand;->lookupFormat(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    move-result-object v1

    goto :goto_0
.end method

.method private static lookupFormat(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand$Format;
    .locals 2
    .parameter "formatName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/eclipse/jgit/api/ArchiveCommand$Format",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/ArchiveCommand$UnsupportedFormatException;
        }
    .end annotation

    .prologue
    .line 321
    sget-object v1, Lorg/eclipse/jgit/api/ArchiveCommand;->formats:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;

    .line 322
    .local v0, entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    if-nez v0, :cond_0

    .line 323
    new-instance v1, Lorg/eclipse/jgit/api/ArchiveCommand$UnsupportedFormatException;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/api/ArchiveCommand$UnsupportedFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 324
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    return-object v1
.end method

.method public static registerFormat(Ljava/lang/String;Lorg/eclipse/jgit/api/ArchiveCommand$Format;)V
    .locals 6
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/api/ArchiveCommand$Format",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, fmt:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<*>;"
    const/4 v4, 0x1

    .line 262
    if-nez p1, :cond_0

    .line 263
    new-instance v2, Ljava/lang/NullPointerException;

    invoke-direct {v2}, Ljava/lang/NullPointerException;-><init>()V

    throw v2

    .line 267
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/api/ArchiveCommand;->formats:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;

    .line 268
    .local v1, old:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    if-nez v1, :cond_1

    .line 269
    new-instance v0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;

    invoke-direct {v0, p1, v4}, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;-><init>(Lorg/eclipse/jgit/api/ArchiveCommand$Format;I)V

    .line 277
    .local v0, entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    :goto_0
    sget-object v2, Lorg/eclipse/jgit/api/ArchiveCommand;->formats:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v2, p0, v1, v0}, Lorg/eclipse/jgit/api/ArchiveCommand;->replace(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 278
    return-void

    .line 272
    .end local v0           #entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    :cond_1
    iget-object v2, v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 273
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->archiveFormatAlreadyRegistered:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 276
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;

    iget-object v2, v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    iget v3, v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->refcnt:I

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;-><init>(Lorg/eclipse/jgit/api/ArchiveCommand$Format;I)V

    .restart local v0       #entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    goto :goto_0
.end method

.method private static replace(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/ConcurrentMap",
            "<TK;TV;>;TK;TV;TV;)Z"
        }
    .end annotation

    .prologue
    .local p0, map:Ljava/util/concurrent/ConcurrentMap;,"Ljava/util/concurrent/ConcurrentMap<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, oldValue:Ljava/lang/Object;,"TV;"
    .local p3, newValue:Ljava/lang/Object;,"TV;"
    const/4 v0, 0x1

    .line 228
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 236
    :cond_0
    :goto_0
    return v0

    .line 231
    :cond_1
    if-nez p2, :cond_2

    .line 232
    invoke-interface {p0, p1, p3}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 233
    :cond_2
    if-nez p3, :cond_3

    .line 234
    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 236
    :cond_3
    invoke-interface {p0, p1, p2, p3}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static unregisterFormat(Ljava/lang/String;)V
    .locals 6
    .parameter "name"

    .prologue
    const/4 v4, 0x1

    .line 295
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/api/ArchiveCommand;->formats:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;

    .line 296
    .local v1, old:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    if-nez v1, :cond_1

    .line 297
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->archiveFormatAlreadyAbsent:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 300
    :cond_1
    iget v2, v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->refcnt:I

    if-ne v2, v4, :cond_2

    .line 301
    const/4 v0, 0x0

    .line 305
    .local v0, entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    :goto_0
    sget-object v2, Lorg/eclipse/jgit/api/ArchiveCommand;->formats:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v2, p0, v1, v0}, Lorg/eclipse/jgit/api/ArchiveCommand;->replace(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 306
    return-void

    .line 304
    .end local v0           #entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;

    iget-object v2, v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->format:Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    iget v3, v1, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;->refcnt:I

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;-><init>(Lorg/eclipse/jgit/api/ArchiveCommand$Format;I)V

    .restart local v0       #entry:Lorg/eclipse/jgit/api/ArchiveCommand$FormatEntry;
    goto :goto_0
.end method

.method private writeArchive(Lorg/eclipse/jgit/api/ArchiveCommand$Format;)Ljava/io/OutputStream;
    .locals 11
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Closeable;",
            ">(",
            "Lorg/eclipse/jgit/api/ArchiveCommand$Format",
            "<TT;>;)",
            "Ljava/io/OutputStream;"
        }
    .end annotation

    .prologue
    .line 345
    .local p1, fmt:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<TT;>;"
    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->prefix:Ljava/lang/String;

    if-nez v9, :cond_3

    const-string v5, ""

    .line 346
    .local v5, pfx:Ljava/lang/String;
    :goto_0
    new-instance v8, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 348
    .local v8, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_0
    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->out:Ljava/io/OutputStream;

    invoke-interface {p1, v9}, Lorg/eclipse/jgit/api/ArchiveCommand$Format;->createArchiveOutputStream(Ljava/io/OutputStream;)Ljava/io/Closeable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 350
    .local v4, outa:Ljava/io/Closeable;,"TT;"
    :try_start_1
    new-instance v1, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    .line 351
    .local v1, idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;
    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v6

    .line 352
    .local v6, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    new-instance v7, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v9

    invoke-direct {v7, v9}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 354
    .local v7, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->tree:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v7, v9}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 355
    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->paths:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_0

    .line 356
    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->paths:Ljava/util/List;

    invoke-static {v9}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 358
    :cond_0
    :goto_1
    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 359
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 360
    .local v3, name:Ljava/lang/String;
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    .line 362
    .local v2, mode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isSubtree()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 363
    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->enterSubtree()V

    .line 365
    :cond_1
    sget-object v9, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v2, v9, :cond_2

    .line 368
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    .line 370
    :cond_2
    sget-object v9, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v2, v9, :cond_4

    .line 371
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {p1, v4, v9, v2, v10}, Lorg/eclipse/jgit/api/ArchiveCommand$Format;->putEntry(Ljava/io/Closeable;Ljava/lang/String;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectLoader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 379
    .end local v1           #idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;
    .end local v2           #mode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v3           #name:Ljava/lang/String;
    .end local v6           #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    .end local v7           #rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catchall_0
    move-exception v9

    :try_start_2
    iget-object v10, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->out:Ljava/io/OutputStream;

    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    throw v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 382
    .end local v4           #outa:Ljava/io/Closeable;,"TT;"
    :catch_0
    move-exception v0

    .line 384
    .local v0, e:Ljava/io/IOException;
    :try_start_3
    new-instance v9, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfArchiveCommand:Ljava/lang/String;

    invoke-direct {v9, v10, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 387
    .end local v0           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v9

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    throw v9

    .line 345
    .end local v5           #pfx:Ljava/lang/String;
    .end local v8           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_3
    iget-object v5, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->prefix:Ljava/lang/String;

    goto/16 :goto_0

    .line 374
    .restart local v1       #idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;
    .restart local v2       #mode:Lorg/eclipse/jgit/lib/FileMode;
    .restart local v3       #name:Ljava/lang/String;
    .restart local v4       #outa:Ljava/io/Closeable;,"TT;"
    .restart local v5       #pfx:Ljava/lang/String;
    .restart local v6       #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    .restart local v7       #rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v8       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_4
    const/4 v9, 0x0

    :try_start_4
    invoke-virtual {v8, v1, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 375
    invoke-virtual {v6, v1}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v9

    invoke-interface {p1, v4, v3, v2, v9}, Lorg/eclipse/jgit/api/ArchiveCommand$Format;->putEntry(Ljava/io/Closeable;Ljava/lang/String;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectLoader;)V

    goto :goto_1

    .line 377
    .end local v2           #mode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v3           #name:Ljava/lang/String;
    :cond_5
    invoke-interface {v4}, Ljava/io/Closeable;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 379
    :try_start_5
    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->out:Ljava/io/OutputStream;

    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 381
    iget-object v9, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->out:Ljava/io/OutputStream;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 387
    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    return-object v9
.end method


# virtual methods
.method public call()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 396
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ArchiveCommand;->checkCallable()V

    .line 399
    iget-object v1, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->format:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 400
    iget-object v1, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->suffix:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/api/ArchiveCommand;->formatBySuffix(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    move-result-object v0

    .line 403
    .local v0, fmt:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<*>;"
    :goto_0
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/api/ArchiveCommand;->writeArchive(Lorg/eclipse/jgit/api/ArchiveCommand$Format;)Ljava/io/OutputStream;

    move-result-object v1

    return-object v1

    .line 402
    .end local v0           #fmt:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<*>;"
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->format:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/api/ArchiveCommand;->lookupFormat(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand$Format;

    move-result-object v0

    .restart local v0       #fmt:Lorg/eclipse/jgit/api/ArchiveCommand$Format;,"Lorg/eclipse/jgit/api/ArchiveCommand$Format<*>;"
    goto :goto_0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ArchiveCommand;->call()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public setFilename(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand;
    .locals 4
    .parameter "filename"

    .prologue
    .line 442
    const/16 v2, 0x2f

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 443
    .local v1, slash:I
    const/16 v2, 0x2e

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 445
    .local v0, dot:I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 446
    const-string v2, ""

    iput-object v2, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->suffix:Ljava/lang/String;

    .line 449
    :goto_0
    return-object p0

    .line 448
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->suffix:Ljava/lang/String;

    goto :goto_0
.end method

.method public setFormat(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand;
    .locals 0
    .parameter "fmt"

    .prologue
    .line 470
    iput-object p1, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->format:Ljava/lang/String;

    .line 471
    return-object p0
.end method

.method public setOutputStream(Ljava/io/OutputStream;)Lorg/eclipse/jgit/api/ArchiveCommand;
    .locals 0
    .parameter "out"

    .prologue
    .line 458
    iput-object p1, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->out:Ljava/io/OutputStream;

    .line 459
    return-object p0
.end method

.method public varargs setPaths([Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand;
    .locals 1
    .parameter "paths"

    .prologue
    .line 489
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->paths:Ljava/util/List;

    .line 490
    return-object p0
.end method

.method public setPrefix(Ljava/lang/String;)Lorg/eclipse/jgit/api/ArchiveCommand;
    .locals 0
    .parameter "prefix"

    .prologue
    .line 428
    iput-object p1, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->prefix:Ljava/lang/String;

    .line 429
    return-object p0
.end method

.method public setTree(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/api/ArchiveCommand;
    .locals 1
    .parameter "tree"

    .prologue
    .line 412
    if-nez p1, :cond_0

    .line 413
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 415
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/api/ArchiveCommand;->tree:Lorg/eclipse/jgit/lib/ObjectId;

    .line 416
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/ArchiveCommand;->setCallable(Z)V

    .line 417
    return-object p0
.end method
