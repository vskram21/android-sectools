.class public Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
.super Lorg/eclipse/jgit/lib/RefDatabase;
.source "RefDirectory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseNonTag;,
        Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LoosePeeledTag;,
        Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;,
        Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;,
        Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;,
        Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;,
        Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    }
.end annotation


# static fields
.field public static final PACKED_REFS_HEADER:Ljava/lang/String; = "# pack-refs with:"

.field public static final PACKED_REFS_PEELED:Ljava/lang/String; = " peeled"

.field public static final SYMREF:Ljava/lang/String; = "ref: "

.field private static final additionalRefsNames:[Ljava/lang/String;


# instance fields
.field private final gitDir:Ljava/io/File;

.field private final lastNotifiedModCnt:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final logWriter:Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

.field private final looseRefs:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;",
            ">;>;"
        }
    .end annotation
.end field

.field private final modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final packedRefs:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;",
            ">;"
        }
    .end annotation
.end field

.field private final packedRefsFile:Ljava/io/File;

.field private final parent:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

.field private final refsDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 128
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "MERGE_HEAD"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "FETCH_HEAD"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "ORIG_HEAD"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "CHERRY_PICK_HEAD"

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->additionalRefsNames:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V
    .locals 3
    .parameter "db"

    .prologue
    .line 171
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/RefDatabase;-><init>()V

    .line 150
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    .line 153
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefs:Ljava/util/concurrent/atomic/AtomicReference;

    .line 161
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 169
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->lastNotifiedModCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 172
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    .line 173
    .local v0, fs:Lorg/eclipse/jgit/util/FS;
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->parent:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    .line 174
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->gitDir:Ljava/io/File;

    .line 175
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->logWriter:Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    .line 176
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->gitDir:Ljava/io/File;

    const-string v2, "refs/"

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;

    .line 177
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->gitDir:Ljava/io/File;

    const-string v2, "packed-refs"

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    .line 179
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 180
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefs:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->NO_PACKED_REFS:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 181
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;)Ljava/io/File;
    .locals 1
    .parameter "x0"

    .prologue
    .line 117
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->scanRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 117
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefs:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method private commitPackedRefs(Lorg/eclipse/jgit/internal/storage/file/LockFile;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;)V
    .locals 6
    .parameter "lck"
    .parameter
    .parameter "oldPackedList"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/file/LockFile;",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 826
    .local p2, refs:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/LockFile;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;Lorg/eclipse/jgit/util/RefList;)V

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->writePackedRefs()V

    .line 851
    return-void
.end method

.method private static copy(Ljava/lang/String;II)Ljava/lang/String;
    .locals 2
    .parameter "src"
    .parameter "off"
    .parameter "end"

    .prologue
    .line 821
    new-instance v0, Ljava/lang/StringBuilder;

    sub-int v1, p2, p1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, p0, p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static delete(Ljava/io/File;I)V
    .locals 6
    .parameter "file"
    .parameter "depth"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1013
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1014
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->fileCannotBeDeleted:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1016
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 1017
    .local v0, dir:Ljava/io/File;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, p1, :cond_1

    .line 1018
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1022
    :cond_1
    return-void

    .line 1020
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 1017
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private doPeel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/ObjectIdRef;
    .locals 7
    .parameter "leaf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 480
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 482
    .local v1, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 483
    .local v0, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v2, v0, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v2, :cond_0

    .line 484
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v3

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevObject;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :goto_0
    return-object v2

    .line 487
    :cond_0
    :try_start_1
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v3

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 491
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0

    .end local v0           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v2
.end method

.method private fireRefsChanged()V
    .locals 4

    .prologue
    .line 969
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->lastNotifiedModCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    .line 970
    .local v1, last:I
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 971
    .local v0, curr:I
    if-eq v1, v0, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->lastNotifiedModCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    .line 972
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->parent:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    new-instance v3, Lorg/eclipse/jgit/events/RefsChangedEvent;

    invoke-direct {v3}, Lorg/eclipse/jgit/events/RefsChangedEvent;-><init>()V

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->fireEvent(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 973
    :cond_0
    return-void
.end method

.method private getLooseRefs()Lorg/eclipse/jgit/util/RefList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;",
            ">;"
        }
    .end annotation

    .prologue
    .line 244
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/util/RefList;

    .line 246
    .local v1, oldLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;

    invoke-direct {v2, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;-><init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/util/RefList;)V

    .line 247
    .local v2, scan:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;
    const-string v3, ""

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->scan(Ljava/lang/String;)V

    .line 250
    iget-object v3, v2, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-eqz v3, :cond_1

    .line 251
    iget-object v3, v2, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    .line 252
    .local v0, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 253
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 256
    :cond_0
    :goto_0
    return-object v0

    .line 255
    .end local v0           #loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    :cond_1
    move-object v0, v1

    .restart local v0       #loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    goto :goto_0
.end method

.method private getPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 740
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    .line 741
    .local v0, curList:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 748
    .end local v0           #curList:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    :goto_0
    return-object v0

    .line 744
    .restart local v0       #curList:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->readPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v1

    .line 745
    .local v1, newList:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->id:Lorg/eclipse/jgit/lib/ObjectId;

    iget-object v3, v1, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->id:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 747
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    :cond_1
    move-object v0, v1

    .line 748
    goto :goto_0
.end method

.method private static isSymRef([BI)Z
    .locals 4
    .parameter "buf"
    .parameter "n"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 958
    const/4 v2, 0x6

    if-ge p1, v2, :cond_0

    .line 960
    :goto_0
    return v1

    :cond_0
    aget-byte v2, p0, v1

    const/16 v3, 0x72

    if-ne v2, v3, :cond_1

    aget-byte v2, p0, v0

    const/16 v3, 0x65

    if-ne v2, v3, :cond_1

    const/4 v2, 0x2

    aget-byte v2, p0, v2

    const/16 v3, 0x66

    if-ne v2, v3, :cond_1

    const/4 v2, 0x3

    aget-byte v2, p0, v2

    const/16 v3, 0x3a

    if-ne v2, v3, :cond_1

    const/4 v2, 0x4

    aget-byte v2, p0, v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method static levelsIn(Ljava/lang/String;)I
    .locals 4
    .parameter "name"

    .prologue
    const/16 v3, 0x2f

    .line 1006
    const/4 v0, 0x0

    .line 1007
    .local v0, count:I
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .local v1, p:I
    :goto_0
    if-ltz v1, :cond_0

    .line 1008
    add-int/lit8 v0, v0, 0x1

    .line 1007
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    goto :goto_0

    .line 1009
    :cond_0
    return v0
.end method

.method private static newSymbolicRef(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;
    .locals 3
    .parameter "snapshot"
    .parameter "name"
    .parameter "target"

    .prologue
    .line 1042
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p2, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1043
    .local v0, dst:Lorg/eclipse/jgit/lib/Ref;
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;

    invoke-direct {v1, p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    return-object v1
.end method

.method private parsePackedRefs(Ljava/io/BufferedReader;)Lorg/eclipse/jgit/util/RefList;
    .locals 14
    .parameter "br"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/BufferedReader;",
            ")",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    .line 773
    new-instance v0, Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/RefList$Builder;-><init>()V

    .line 774
    .local v0, all:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v3, 0x0

    .line 775
    .local v3, last:Lorg/eclipse/jgit/lib/Ref;
    const/4 v8, 0x0

    .line 776
    .local v8, peeled:Z
    const/4 v6, 0x0

    .line 779
    .local v6, needSort:Z
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .local v7, p:Ljava/lang/String;
    if-eqz v7, :cond_6

    .line 780
    invoke-virtual {v7, v13}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x23

    if-ne v10, v11, :cond_1

    .line 781
    const-string v10, "# pack-refs with:"

    invoke-virtual {v7, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 782
    const-string v10, "# pack-refs with:"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v7, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 783
    const-string v10, " peeled"

    invoke-virtual {v7, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    goto :goto_0

    .line 788
    :cond_1
    invoke-virtual {v7, v13}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x5e

    if-ne v10, v11, :cond_3

    .line 789
    if-nez v3, :cond_2

    .line 790
    new-instance v10, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->peeledLineBeforeRef:Ljava/lang/String;

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 792
    :cond_2
    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 793
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v4, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    sget-object v10, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v12

    invoke-direct {v4, v10, v11, v12, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 795
    .end local v3           #last:Lorg/eclipse/jgit/lib/Ref;
    .local v4, last:Lorg/eclipse/jgit/lib/Ref;
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList$Builder;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v0, v10, v4}, Lorg/eclipse/jgit/util/RefList$Builder;->set(ILorg/eclipse/jgit/lib/Ref;)V

    move-object v3, v4

    .line 796
    .end local v4           #last:Lorg/eclipse/jgit/lib/Ref;
    .restart local v3       #last:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_0

    .line 799
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    const/16 v10, 0x20

    invoke-virtual {v7, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    .line 800
    .local v9, sp:I
    invoke-virtual {v7, v13, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 801
    .restart local v2       #id:Lorg/eclipse/jgit/lib/ObjectId;
    add-int/lit8 v10, v9, 0x1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    invoke-static {v7, v10, v11}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->copy(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v5

    .line 803
    .local v5, name:Ljava/lang/String;
    if-eqz v8, :cond_5

    .line 804
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    sget-object v10, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v1, v10, v5, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 807
    .local v1, cur:Lorg/eclipse/jgit/lib/ObjectIdRef;
    :goto_1
    if-eqz v3, :cond_4

    invoke-static {v3, v1}, Lorg/eclipse/jgit/lib/RefComparator;->compareTo(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)I

    move-result v10

    if-lez v10, :cond_4

    .line 808
    const/4 v6, 0x1

    .line 809
    :cond_4
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/RefList$Builder;->add(Lorg/eclipse/jgit/lib/Ref;)V

    .line 810
    move-object v3, v1

    .line 811
    goto/16 :goto_0

    .line 806
    .end local v1           #cur:Lorg/eclipse/jgit/lib/ObjectIdRef;
    :cond_5
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v10, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v1, v10, v5, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .restart local v1       #cur:Lorg/eclipse/jgit/lib/ObjectIdRef;
    goto :goto_1

    .line 813
    .end local v1           #cur:Lorg/eclipse/jgit/lib/ObjectIdRef;
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #name:Ljava/lang/String;
    .end local v9           #sp:I
    :cond_6
    if-eqz v6, :cond_7

    .line 814
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList$Builder;->sort()V

    .line 815
    :cond_7
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v10

    return-object v10
.end method

.method private peeledPackedRef(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 5
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 690
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Ref$Storage;->isPacked()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 698
    :goto_0
    return-object v0

    .line 692
    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 693
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object p1

    .line 694
    :cond_1
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 695
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 698
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0
.end method

.method private putLooseRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;)V
    .locals 3
    .parameter "ref"

    .prologue
    .line 546
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/RefList;

    .line 547
    .local v0, cList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/RefList;->put(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    .line 548
    .local v1, nList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 549
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 550
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fireRefsChanged()V

    .line 551
    return-void
.end method

.method private readPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 752
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v3

    .line 754
    .local v3, snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    .line 756
    .local v1, digest:Ljava/security/MessageDigest;
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    new-instance v5, Ljava/security/DigestInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    invoke-direct {v6, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v6, v1}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    sget-object v6, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 764
    .local v0, br:Ljava/io/BufferedReader;
    :try_start_1
    new-instance v4, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->parsePackedRefs(Ljava/io/BufferedReader;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v5

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-direct {v4, v5, v3, v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 767
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .end local v0           #br:Ljava/io/BufferedReader;
    :goto_0
    return-object v4

    .line 759
    :catch_0
    move-exception v2

    .line 761
    .local v2, noPackedRefs:Ljava/io/FileNotFoundException;
    sget-object v4, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->NO_PACKED_REFS:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    goto :goto_0

    .line 767
    .end local v2           #noPackedRefs:Ljava/io/FileNotFoundException;
    .restart local v0       #br:Ljava/io/BufferedReader;
    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v4
.end method

.method private readRef(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;
    .locals 7
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Lorg/eclipse/jgit/lib/Ref;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 854
    .local p2, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/RefList;

    .line 855
    .local v0, curList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v2

    .line 856
    .local v2, idx:I
    if-ltz v2, :cond_3

    .line 857
    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    .line 858
    .local v4, o:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    invoke-direct {p0, v4, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->scanRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    move-result-object v3

    .line 859
    .local v3, n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    if-nez v3, :cond_2

    .line 860
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 861
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 862
    :cond_0
    invoke-virtual {p2, p1}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 884
    .end local v3           #n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .end local v4           #o:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    :cond_1
    :goto_0
    return-object v3

    .line 865
    .restart local v3       #n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .restart local v4       #o:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    :cond_2
    if-eq v4, v3, :cond_1

    .line 867
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jgit/util/RefList;->set(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 868
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    goto :goto_0

    .line 872
    .end local v3           #n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .end local v4           #o:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    :cond_3
    const/4 v5, 0x0

    invoke-direct {p0, v5, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->scanRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    move-result-object v3

    .line 873
    .restart local v3       #n:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    if-nez v3, :cond_4

    .line 874
    invoke-virtual {p2, p1}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    goto :goto_0

    .line 878
    :cond_4
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    sget-object v5, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->additionalRefsNames:[Ljava/lang/String;

    array-length v5, v5

    if-ge v1, v5, :cond_5

    .line 879
    sget-object v5, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->additionalRefsNames:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 878
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 882
    :cond_5
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jgit/util/RefList;->add(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 883
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    goto :goto_0
.end method

.method private static recreate(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/lib/Ref;
    .locals 2
    .parameter "old"
    .parameter "leaf"

    .prologue
    .line 496
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 497
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->recreate(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 498
    .local v0, dst:Lorg/eclipse/jgit/lib/Ref;
    new-instance p1, Lorg/eclipse/jgit/lib/SymbolicRef;

    .end local p1
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1, v0}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    .line 500
    .end local v0           #dst:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    return-object p1
.end method

.method private resolve(Lorg/eclipse/jgit/lib/Ref;ILjava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;
    .locals 8
    .parameter "ref"
    .parameter "depth"
    .parameter "prefix"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Ref;",
            "I",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;",
            ">;",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Lorg/eclipse/jgit/lib/Ref;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p4, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .local p5, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v7, 0x0

    .line 709
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 710
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 712
    .local v1, dst:Lorg/eclipse/jgit/lib/Ref;
    const/4 v0, 0x5

    if-gt v0, p2, :cond_1

    move-object p1, v7

    .line 736
    .end local v1           #dst:Lorg/eclipse/jgit/lib/Ref;
    .end local p1
    :cond_0
    :goto_0
    return-object p1

    .line 717
    .restart local v1       #dst:Lorg/eclipse/jgit/lib/Ref;
    .restart local p1
    :cond_1
    if-eqz p4, :cond_4

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 719
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v6

    .local v6, idx:I
    if-ltz v6, :cond_3

    .line 720
    invoke-virtual {p4, v6}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 731
    .end local v6           #idx:I
    :cond_2
    :goto_1
    add-int/lit8 v2, p2, 0x1

    move-object v0, p0

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->resolve(Lorg/eclipse/jgit/lib/Ref;ILjava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 732
    if-nez v1, :cond_5

    move-object p1, v7

    .line 733
    goto :goto_0

    .line 721
    .restart local v6       #idx:I
    :cond_3
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p5, v0}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :cond_0

    .line 722
    invoke-virtual {p5, v6}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    goto :goto_1

    .line 726
    .end local v6           #idx:I
    :cond_4
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->readRef(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 727
    if-nez v1, :cond_2

    goto :goto_0

    .line 734
    :cond_5
    new-instance v0, Lorg/eclipse/jgit/lib/SymbolicRef;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    move-object p1, v0

    goto :goto_0
.end method

.method private scanRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .locals 18
    .parameter "ref"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 889
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v12

    .line 890
    .local v12, path:Ljava/io/File;
    const/4 v4, 0x0

    .line 892
    .local v4, currentSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    if-eqz p1, :cond_1

    .line 893
    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->getSnapShot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v4

    .line 894
    invoke-virtual {v4, v12}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 954
    .end local p1
    :goto_0
    return-object p1

    .line 896
    .restart local p1
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->getName()Ljava/lang/String;

    move-result-object p2

    .line 899
    :cond_1
    const/16 v7, 0x1000

    .line 901
    .local v7, limit:I
    invoke-static {v12}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v11

    .line 903
    .local v11, otherSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    const/16 v14, 0x1000

    :try_start_0
    invoke-static {v12, v14}, Lorg/eclipse/jgit/util/IO;->readSome(Ljava/io/File;I)[B
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 908
    .local v2, buf:[B
    array-length v8, v2

    .line 909
    .local v8, n:I
    if-nez v8, :cond_2

    .line 910
    const/16 p1, 0x0

    goto :goto_0

    .line 904
    .end local v2           #buf:[B
    .end local v8           #n:I
    :catch_0
    move-exception v9

    .line 905
    .local v9, noFile:Ljava/io/FileNotFoundException;
    const/16 p1, 0x0

    goto :goto_0

    .line 912
    .end local v9           #noFile:Ljava/io/FileNotFoundException;
    .restart local v2       #buf:[B
    .restart local v8       #n:I
    :cond_2
    invoke-static {v2, v8}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->isSymRef([BI)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 913
    const/16 v14, 0x1000

    if-ne v8, v14, :cond_3

    .line 914
    const/16 p1, 0x0

    goto :goto_0

    .line 917
    :cond_3
    :goto_1
    if-lez v8, :cond_4

    add-int/lit8 v14, v8, -0x1

    aget-byte v14, v2, v14

    invoke-static {v14}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 918
    add-int/lit8 v8, v8, -0x1

    goto :goto_1

    .line 919
    :cond_4
    const/4 v14, 0x6

    if-ge v8, v14, :cond_5

    .line 920
    const/4 v14, 0x0

    invoke-static {v2, v14, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v3

    .line 921
    .local v3, content:Ljava/lang/String;
    new-instance v14, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->notARef:Ljava/lang/String;

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object p2, v16, v17

    const/16 v17, 0x1

    aput-object v3, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 923
    .end local v3           #content:Ljava/lang/String;
    :cond_5
    const/4 v14, 0x5

    invoke-static {v2, v14, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v13

    .line 924
    .local v13, target:Ljava/lang/String;
    if-eqz p1, :cond_6

    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->isSymbolic()Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v14

    invoke-interface {v14}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 926
    invoke-virtual {v4, v11}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->setClean(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)V

    goto :goto_0

    .line 929
    :cond_6
    move-object/from16 v0, p2

    invoke-static {v11, v0, v13}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newSymbolicRef(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;

    move-result-object p1

    goto/16 :goto_0

    .line 932
    .end local v13           #target:Ljava/lang/String;
    :cond_7
    const/16 v14, 0x28

    if-ge v8, v14, :cond_8

    .line 933
    const/16 p1, 0x0

    goto/16 :goto_0

    .line 937
    :cond_8
    const/4 v14, 0x0

    :try_start_1
    invoke-static {v2, v14}, Lorg/eclipse/jgit/lib/ObjectId;->fromString([BI)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 938
    .local v5, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz p1, :cond_a

    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->isSymbolic()Z

    move-result v14

    if-nez v14, :cond_a

    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v14

    invoke-interface {v14}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    invoke-virtual {v14, v5}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v14

    if-eqz v14, :cond_a

    .line 940
    invoke-virtual {v4, v11}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->setClean(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 944
    .end local v5           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_1
    move-exception v10

    .line 945
    .local v10, notRef:Ljava/lang/IllegalArgumentException;
    :goto_2
    if-lez v8, :cond_9

    add-int/lit8 v14, v8, -0x1

    aget-byte v14, v2, v14

    invoke-static {v14}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 946
    add-int/lit8 v8, v8, -0x1

    goto :goto_2

    .line 947
    :cond_9
    const/4 v14, 0x0

    invoke-static {v2, v14, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v3

    .line 949
    .restart local v3       #content:Ljava/lang/String;
    new-instance v6, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->notARef:Ljava/lang/String;

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object p2, v15, v16

    const/16 v16, 0x1

    aput-object v3, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v6, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 951
    .local v6, ioException:Ljava/io/IOException;
    invoke-virtual {v6, v10}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 952
    throw v6

    .line 954
    .end local v3           #content:Ljava/lang/String;
    .end local v6           #ioException:Ljava/io/IOException;
    .end local v10           #notRef:Ljava/lang/IllegalArgumentException;
    .restart local v5       #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_a
    new-instance p1, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;

    .end local p1
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-direct {v0, v11, v1, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto/16 :goto_0
.end method

.method private upcast(Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/RefList",
            "<+",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 334
    .local p1, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<+Lorg/eclipse/jgit/lib/Ref;>;"
    return-object p1
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 201
    return-void
.end method

.method public create()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 193
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;

    const-string v2, "refs/heads/"

    const-string v3, "refs/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 194
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;

    const-string v2, "refs/tags/"

    const-string v3, "refs/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 195
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->logWriter:Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->create()Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    .line 196
    return-void
.end method

.method delete(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V
    .locals 11
    .parameter "update"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 554
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v9

    invoke-interface {v9}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 555
    .local v2, dst:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    .line 560
    .local v6, name:Ljava/lang/String;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v8

    .line 561
    .local v8, packed:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    invoke-virtual {v8, v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->contains(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 562
    new-instance v4, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v10

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v10

    invoke-direct {v4, v9, v10}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 564
    .local v4, lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v9

    if-nez v9, :cond_0

    .line 565
    new-instance v9, Lorg/eclipse/jgit/errors/LockFailedException;

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/errors/LockFailedException;-><init>(Ljava/io/File;)V

    throw v9

    .line 567
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->readPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v0

    .line 568
    .local v0, cur:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->find(Ljava/lang/String;)I

    move-result v3

    .line 569
    .local v3, idx:I
    if-ltz v3, :cond_1

    .line 570
    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v9

    invoke-direct {p0, v4, v9, v8}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->commitPackedRefs(Lorg/eclipse/jgit/internal/storage/file/LockFile;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 572
    :cond_1
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 578
    .end local v0           #cur:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    .end local v3           #idx:I
    .end local v4           #lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    :cond_2
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/util/RefList;

    .line 579
    .local v1, curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v3

    .line 580
    .restart local v3       #idx:I
    if-gez v3, :cond_4

    .line 585
    :goto_0
    invoke-static {v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->levelsIn(Ljava/lang/String;)I

    move-result v9

    add-int/lit8 v5, v9, -0x2

    .line 586
    .local v5, levels:I
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->logWriter:Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    invoke-virtual {v9, v6}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    invoke-static {v9, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Ljava/io/File;I)V

    .line 587
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v9

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/Ref$Storage;->isLoose()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 588
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->unlock()V

    .line 589
    invoke-virtual {p0, v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    invoke-static {v9, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Ljava/io/File;I)V

    .line 592
    :cond_3
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 593
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fireRefsChanged()V

    .line 594
    return-void

    .line 572
    .end local v1           #curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .end local v3           #idx:I
    .end local v5           #levels:I
    .restart local v4       #lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    :catchall_0
    move-exception v9

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    throw v9

    .line 582
    .end local v4           #lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    .restart local v1       #curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .restart local v3       #idx:I
    :cond_4
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v7

    .line 583
    .local v7, newLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v9, v1, v7}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_0
.end method

.method fileFor(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "name"

    .prologue
    .line 998
    const-string v0, "refs/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 999
    const-string v0, "refs/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1000
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1002
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->gitDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getAdditionalRefs()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 323
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 324
    .local v5, ret:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->additionalRefsNames:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 325
    .local v3, name:Ljava/lang/String;
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    .line 326
    .local v4, r:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v4, :cond_0

    .line 327
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 324
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 329
    .end local v3           #name:Ljava/lang/String;
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return-object v5
.end method

.method getLogWriter()Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->logWriter:Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    return-object v0
.end method

.method public getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 11
    .parameter "needle"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v5

    .line 262
    .local v5, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v1, 0x0

    .line 263
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    sget-object v6, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->SEARCH_PATH:[Ljava/lang/String;

    .local v6, arr$:[Ljava/lang/String;
    array-length v9, v6

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v9, :cond_0

    aget-object v10, v6, v8

    .line 265
    .local v10, prefix:Ljava/lang/String;
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->readRef(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 266
    if-eqz v1, :cond_2

    .line 267
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->resolve(Lorg/eclipse/jgit/lib/Ref;ILjava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 277
    .end local v10           #prefix:Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fireRefsChanged()V

    .line 278
    return-object v1

    .line 270
    .restart local v10       #prefix:Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 271
    .local v7, e:Ljava/io/IOException;
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ""

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v7}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Lorg/eclipse/jgit/errors/InvalidObjectIdException;

    if-nez v0, :cond_2

    .line 273
    :cond_1
    throw v7

    .line 263
    .end local v7           #e:Ljava/io/IOException;
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0
.end method

.method public getRefs(Ljava/lang/String;)Ljava/util/Map;
    .locals 12
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 283
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v5

    .line 284
    .local v5, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/util/RefList;

    .line 286
    .local v7, oldLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    new-instance v9, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;

    invoke-direct {v9, p0, v7}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;-><init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/util/RefList;)V

    .line 287
    .local v9, scan:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;
    invoke-virtual {v9, p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->scan(Ljava/lang/String;)V

    .line 290
    iget-object v0, v9, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    if-eqz v0, :cond_2

    .line 291
    iget-object v0, v9, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList$Builder;->sort()V

    .line 292
    iget-object v0, v9, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->newLoose:Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    .line 293
    .local v4, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v7, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->modCnt:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 297
    :cond_0
    :goto_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fireRefsChanged()V

    .line 299
    iget-object v10, v9, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseScanner;->symbolic:Lorg/eclipse/jgit/util/RefList$Builder;

    .line 300
    .local v10, symbolic:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v6, 0x0

    .local v6, idx:I
    :cond_1
    :goto_1
    invoke-virtual {v10}, Lorg/eclipse/jgit/util/RefList$Builder;->size()I

    move-result v0

    if-ge v6, v0, :cond_4

    .line 301
    invoke-virtual {v10, v6}, Lorg/eclipse/jgit/util/RefList$Builder;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 302
    .local v1, symbolicRef:Lorg/eclipse/jgit/lib/Ref;
    const/4 v2, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->resolve(Lorg/eclipse/jgit/lib/Ref;ILjava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v8

    .line 303
    .local v8, resolvedRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v8, :cond_3

    invoke-interface {v8}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 304
    invoke-virtual {v10, v6, v8}, Lorg/eclipse/jgit/util/RefList$Builder;->set(ILorg/eclipse/jgit/lib/Ref;)V

    .line 305
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 296
    .end local v1           #symbolicRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v4           #loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .end local v6           #idx:I
    .end local v8           #resolvedRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v10           #symbolic:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_2
    move-object v4, v7

    .restart local v4       #loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    goto :goto_0

    .line 310
    .restart local v1       #symbolicRef:Lorg/eclipse/jgit/lib/Ref;
    .restart local v6       #idx:I
    .restart local v8       #resolvedRef:Lorg/eclipse/jgit/lib/Ref;
    .restart local v10       #symbolic:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_3
    invoke-virtual {v10, v6}, Lorg/eclipse/jgit/util/RefList$Builder;->remove(I)V

    .line 311
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v11

    .line 312
    .local v11, toRemove:I
    if-ltz v11, :cond_1

    .line 313
    invoke-virtual {v4, v11}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    goto :goto_1

    .line 316
    .end local v1           #symbolicRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v8           #resolvedRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v11           #toRemove:I
    :cond_4
    invoke-virtual {v10}, Lorg/eclipse/jgit/util/RefList$Builder;->sort()V

    .line 318
    new-instance v0, Lorg/eclipse/jgit/util/RefMap;

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->upcast(Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v2

    invoke-virtual {v10}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    invoke-direct {v0, p1, v5, v2, v3}, Lorg/eclipse/jgit/util/RefMap;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V

    return-object v0
.end method

.method getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->parent:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    return-object v0
.end method

.method public isNameConflicting(Ljava/lang/String;)Z
    .locals 10
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/16 v9, 0x2f

    const/4 v7, 0x1

    .line 216
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v4

    .line 217
    .local v4, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getLooseRefs()Lorg/eclipse/jgit/util/RefList;

    move-result-object v2

    .line 220
    .local v2, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    invoke-virtual {p1, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 221
    .local v1, lastSlash:I
    :goto_0
    if-lez v1, :cond_2

    .line 222
    invoke-virtual {p1, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 223
    .local v3, needle:Ljava/lang/String;
    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/RefList;->contains(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v4, v3}, Lorg/eclipse/jgit/util/RefList;->contains(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    :cond_0
    move v6, v7

    .line 240
    .end local v3           #needle:Ljava/lang/String;
    :goto_1
    return v6

    .line 225
    .restart local v3       #needle:Ljava/lang/String;
    :cond_1
    add-int/lit8 v6, v1, -0x1

    invoke-virtual {p1, v9, v6}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    .line 226
    goto :goto_0

    .line 229
    .end local v3           #needle:Ljava/lang/String;
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 232
    .local v5, prefix:Ljava/lang/String;
    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    neg-int v0, v6

    .line 233
    .local v0, idx:I
    invoke-virtual {v4}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v6

    if-ge v0, v6, :cond_3

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v6, v7

    .line 234
    goto :goto_1

    .line 236
    :cond_3
    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    neg-int v0, v6

    .line 237
    invoke-virtual {v2}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v6

    if-ge v0, v6, :cond_4

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    invoke-interface {v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    move v6, v7

    .line 238
    goto :goto_1

    :cond_4
    move v6, v8

    .line 240
    goto :goto_1
.end method

.method log(Lorg/eclipse/jgit/lib/RefUpdate;Ljava/lang/String;Z)V
    .locals 1
    .parameter "update"
    .parameter "msg"
    .parameter "deref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 704
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->logWriter:Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->log(Lorg/eclipse/jgit/lib/RefUpdate;Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    .line 705
    return-void
.end method

.method public newRename(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;
    .locals 3
    .parameter "fromName"
    .parameter "toName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 532
    invoke-virtual {p0, p1, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    move-result-object v0

    .line 533
    .local v0, from:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;
    invoke-virtual {p0, p2, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    move-result-object v1

    .line 534
    .local v1, to:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;

    invoke-direct {v2, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;-><init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;)V

    return-object v2
.end method

.method public bridge synthetic newRename(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefRename;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newRename(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryRename;

    move-result-object v0

    return-object v0
.end method

.method newTemporaryUpdate()Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 983
    const-string v3, "renamed_"

    const-string v4, "_ref"

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->refsDir:Ljava/io/File;

    invoke-static {v3, v4, v5}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .line 984
    .local v2, tmp:Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "refs/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 985
    .local v0, name:Ljava/lang/String;
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v3, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    const/4 v4, 0x0

    invoke-direct {v1, v3, v0, v4}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 986
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    new-instance v3, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-direct {v3, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;-><init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/lib/Ref;)V

    return-object v3
.end method

.method public newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;
    .locals 9
    .parameter "name"
    .parameter "detach"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 511
    const/4 v6, 0x0

    .line 512
    .local v6, detachingSymbolicRef:Z
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v5

    .line 513
    .local v5, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->readRef(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 514
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_4

    move-object v0, p0

    move-object v4, v3

    .line 515
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->resolve(Lorg/eclipse/jgit/lib/Ref;ILjava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    move-object v7, v1

    .line 516
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .local v7, ref:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    if-nez v7, :cond_1

    .line 517
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v1, v0, p1, v3}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 523
    .end local v7           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    :goto_1
    new-instance v8, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    invoke-direct {v8, p0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;-><init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/lib/Ref;)V

    .line 524
    .local v8, refDirUpdate:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;
    if-eqz v6, :cond_0

    .line 525
    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->setDetachingSymbolicRef()V

    .line 526
    :cond_0
    return-object v8

    .line 519
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v8           #refDirUpdate:Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;
    .restart local v7       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    if-eqz p2, :cond_2

    invoke-interface {v7}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v6, 0x1

    .line 520
    :goto_2
    if-eqz v6, :cond_3

    .line 521
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {v7}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {v1, v0, p1, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .end local v7           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_1

    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v7       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    move v6, v2

    .line 519
    goto :goto_2

    :cond_3
    move-object v1, v7

    .end local v7           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_1

    :cond_4
    move-object v7, v1

    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v7       #ref:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_0
.end method

.method public bridge synthetic newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;

    move-result-object v0

    return-object v0
.end method

.method public pack(Ljava/util/List;)V
    .locals 24
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 608
    .local p1, refs:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v19

    if-nez v19, :cond_0

    .line 676
    :goto_0
    return-void

    .line 610
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->parent:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v7

    .line 613
    .local v7, fs:Lorg/eclipse/jgit/util/FS;
    new-instance v10, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-direct {v10, v0, v7}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 614
    .local v10, lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v19

    if-nez v19, :cond_1

    .line 615
    new-instance v19, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotLock:Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefsFile:Ljava/io/File;

    move-object/from16 v23, v0

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 619
    :cond_1
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->getPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v13

    .line 620
    .local v13, packed:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->readPackedRefs()Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    move-result-object v4

    .line 623
    .local v4, cur:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 624
    .local v18, refName:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->readRef(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v16

    .line 625
    .local v16, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v19

    if-nez v19, :cond_2

    .line 628
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v9

    .line 629
    .local v9, idx:I
    if-ltz v9, :cond_3

    .line 630
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->peeledPackedRef(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v9, v0}, Lorg/eclipse/jgit/util/RefList;->set(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    goto :goto_1

    .line 632
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->peeledPackedRef(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v9, v0}, Lorg/eclipse/jgit/util/RefList;->add(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    goto :goto_1

    .line 636
    .end local v9           #idx:I
    .end local v16           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v18           #refName:Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v4, v13}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->commitPackedRefs(Lorg/eclipse/jgit/internal/storage/file/LockFile;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;)V

    .line 639
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_5
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 641
    .restart local v18       #refName:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v17

    .line 642
    .local v17, refFile:Ljava/io/File;
    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 644
    new-instance v15, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->parent:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v15, v0, v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 646
    .local v15, rLck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v19

    if-eqz v19, :cond_5

    .line 649
    const/16 v19, 0x0

    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->scanRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    move-result-object v6

    .line 650
    .local v6, currentLooseRef:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    if-eqz v6, :cond_6

    invoke-interface {v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->isSymbolic()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v19

    if-eqz v19, :cond_7

    .line 668
    :cond_6
    :try_start_2
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 674
    .end local v4           #cur:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v6           #currentLooseRef:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v13           #packed:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    .end local v15           #rLck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    .end local v17           #refFile:Ljava/io/File;
    .end local v18           #refName:Ljava/lang/String;
    :catchall_0
    move-exception v19

    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    throw v19

    .line 652
    .restart local v4       #cur:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v6       #currentLooseRef:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .restart local v8       #i$:Ljava/util/Iterator;
    .restart local v13       #packed:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
    .restart local v15       #rLck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    .restart local v17       #refFile:Ljava/io/File;
    .restart local v18       #refName:Ljava/lang/String;
    :cond_7
    :try_start_3
    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v14

    .line 653
    .local v14, packedRef:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v6}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 654
    .local v3, clr_oid:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v3, :cond_9

    invoke-interface {v14}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 658
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/util/RefList;

    .line 659
    .local v5, curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v9

    .line 660
    .restart local v9       #idx:I
    if-gez v9, :cond_a

    .line 664
    :goto_3
    invoke-static/range {v18 .. v18}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->levelsIn(Ljava/lang/String;)I

    move-result v19

    add-int/lit8 v11, v19, -0x2

    .line 665
    .local v11, levels:I
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fileFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-static {v0, v11}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->delete(Ljava/io/File;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 668
    .end local v5           #curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .end local v9           #idx:I
    .end local v11           #levels:I
    :cond_9
    :try_start_4
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_2

    .line 662
    .restart local v5       #curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .restart local v9       #idx:I
    :cond_a
    :try_start_5
    invoke-virtual {v5, v9}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v12

    .line 663
    .local v12, newLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v5, v12}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result v19

    if-eqz v19, :cond_8

    goto :goto_3

    .line 668
    .end local v3           #clr_oid:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #curLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .end local v6           #currentLooseRef:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .end local v9           #idx:I
    .end local v12           #newLoose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .end local v14           #packedRef:Lorg/eclipse/jgit/lib/Ref;
    :catchall_1
    move-exception v19

    :try_start_6
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    throw v19
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 674
    .end local v15           #rLck:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    .end local v17           #refFile:Ljava/io/File;
    .end local v18           #refName:Ljava/lang/String;
    :cond_b
    invoke-virtual {v10}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    goto/16 :goto_0
.end method

.method public peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 7
    .parameter "ref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 457
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 458
    .local v3, leaf:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    if-nez v6, :cond_1

    .line 475
    .end local v3           #leaf:Lorg/eclipse/jgit/lib/Ref;
    .end local p1
    :cond_0
    :goto_0
    return-object p1

    .line 461
    .restart local v3       #leaf:Lorg/eclipse/jgit/lib/Ref;
    .restart local p1
    :cond_1
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->doPeel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/ObjectIdRef;

    move-result-object v4

    .line 465
    .local v4, newLeaf:Lorg/eclipse/jgit/lib/ObjectIdRef;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Ref$Storage;->isLoose()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 466
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/util/RefList;

    .line 467
    .local v1, curList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v2

    .line 468
    .local v2, idx:I
    if-ltz v2, :cond_2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    if-ne v6, v3, :cond_2

    .line 469
    check-cast v3, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    .end local v3           #leaf:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;->peel(Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;

    move-result-object v0

    .line 470
    .local v0, asPeeled:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    invoke-virtual {v1, v2, v0}, Lorg/eclipse/jgit/util/RefList;->set(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v5

    .line 471
    .local v5, newList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6, v1, v5}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 475
    .end local v0           #asPeeled:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .end local v1           #curList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    .end local v2           #idx:I
    .end local v5           #newList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;>;"
    :cond_2
    invoke-static {p1, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->recreate(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object p1

    goto :goto_0
.end method

.method public refresh()V
    .locals 0

    .prologue
    .line 210
    invoke-super {p0}, Lorg/eclipse/jgit/lib/RefDatabase;->refresh()V

    .line 211
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->rescan()V

    .line 212
    return-void
.end method

.method rescan()V
    .locals 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->looseRefs:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 205
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefs:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->NO_PACKED_REFS:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 206
    return-void
.end method

.method stored(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)V
    .locals 4
    .parameter "update"
    .parameter "snapshot"

    .prologue
    .line 538
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 539
    .local v1, target:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 540
    .local v0, leaf:Lorg/eclipse/jgit/lib/Ref;
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p2, v3, v1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->putLooseRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;)V

    .line 541
    return-void
.end method

.method storedSymbolicRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;)V
    .locals 1
    .parameter "u"
    .parameter "snapshot"
    .parameter "target"

    .prologue
    .line 505
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/RefDirectoryUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->newSymbolicRef(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->putLooseRef(Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;)V

    .line 506
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->fireRefsChanged()V

    .line 507
    return-void
.end method
