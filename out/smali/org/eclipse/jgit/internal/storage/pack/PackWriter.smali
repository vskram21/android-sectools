.class public Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
.super Ljava/lang/Object;
.source "PackWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/PackWriter$5;,
        Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;,
        Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;,
        Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;,
        Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;,
        Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    }
.end annotation


# static fields
.field private static final PACK_VERSION_GENERATED:I = 0x2

.field private static final instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final instancesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private cachedPacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/CachedPack;",
            ">;"
        }
    .end annotation
.end field

.field private canBuildBitmaps:Z

.field private final config:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field private crc32:Ljava/util/zip/CRC32;

.field private deltaBaseAsOffset:Z

.field private depth:I

.field private edgeObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;"
        }
    .end annotation
.end field

.field private excludeInPackLast:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

.field private excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

.field private haveObjects:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

.field private ignoreMissingUninteresting:Z

.field private indexDisabled:Z

.field private myDeflater:Ljava/util/zip/Deflater;

.field private final objectsLists:[Lorg/eclipse/jgit/util/BlockList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/eclipse/jgit/util/BlockList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;"
        }
    .end annotation
.end field

.field private final objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;"
        }
    .end annotation
.end field

.field private packcsum:[B

.field private pruneCurrentObjectList:Z

.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private reuseDeltaCommits:Z

.field private reuseDeltas:Z

.field private final reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

.field private reuseValidate:Z

.field private final selfRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            ">;"
        }
    .end annotation
.end field

.field private shallowPack:Z

.field private sortedByName:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;"
        }
    .end annotation
.end field

.field private final state:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;

.field private final stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

.field private tagTargets:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private thin:Z

.field private typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

.field private unshallowObjects:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private useBitmaps:Z

.field private useCachedPacks:Z

.field private writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 170
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->instances:Ljava/util/Map;

    .line 173
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->instancesIterable:Ljava/lang/Iterable;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 1
    .parameter "reader"

    .prologue
    .line 315
    new-instance v0, Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-direct {v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 316
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 302
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 303
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 1
    .parameter "repo"
    .parameter "reader"

    .prologue
    .line 330
    new-instance v0, Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-direct {p0, v0, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 331
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 5
    .parameter "config"
    .parameter "reader"

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/util/BlockList;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    .line 217
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    new-instance v1, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    aput-object v1, v0, v3

    .line 218
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    new-instance v1, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    aput-object v1, v0, v4

    .line 219
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v1, 0x3

    new-instance v2, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    aput-object v2, v0, v1

    .line 220
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v1, 0x4

    new-instance v2, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    aput-object v2, v0, v1

    .line 223
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    .line 226
    new-instance v0, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->edgeObjects:Ljava/util/List;

    .line 231
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    .line 233
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->tagTargets:Ljava/util/Set;

    .line 274
    iput-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ignoreMissingUninteresting:Z

    .line 345
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 346
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 347
    instance-of v0, p2, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    if-eqz v0, :cond_0

    .line 348
    check-cast p2, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    .end local p2
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    .line 352
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isDeltaBaseAsOffset()Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->deltaBaseAsOffset:Z

    .line 353
    invoke-virtual {p1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseDeltas()Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltas:Z

    .line 354
    iput-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseValidate:Z

    .line 355
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    .line 356
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;-><init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->state:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;

    .line 357
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->selfRef:Ljava/lang/ref/WeakReference;

    .line 358
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->instances:Ljava/util/Map;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->selfRef:Ljava/lang/ref/WeakReference;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    return-void

    .line 350
    .restart local p2
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    goto :goto_0
.end method

.method static synthetic access$000()Ljava/util/Map;
    .locals 1

    .prologue
    .line 155
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->instances:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)Lorg/eclipse/jgit/storage/pack/PackConfig;
    .locals 1
    .parameter "x0"

    .prologue
    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    return-object v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)[Lorg/eclipse/jgit/util/BlockList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    return-object v0
.end method

.method private addObject(Lorg/eclipse/jgit/lib/AnyObjectId;II)V
    .locals 2
    .parameter "src"
    .parameter "type"
    .parameter "pathHashCode"

    .prologue
    .line 1915
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    if-eqz v1, :cond_0

    .line 1916
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    invoke-interface {v1, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->newObjectToPack(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v0

    .line 1919
    .local v0, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :goto_0
    invoke-virtual {v0, p3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setPathHash(I)V

    .line 1920
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v1, v1, p2

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 1921
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    .line 1922
    return-void

    .line 1918
    .end local v0           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    .restart local v0       #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    goto :goto_0
.end method

.method private addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V
    .locals 1
    .parameter "object"
    .parameter "pathHashCode"

    .prologue
    .line 1909
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v0

    invoke-direct {p0, p1, v0, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/lib/AnyObjectId;II)V

    .line 1910
    return-void
.end method

.method private beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V
    .locals 5
    .parameter "phase"
    .parameter "monitor"
    .parameter "cnt"

    .prologue
    .line 934
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->state:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;

    #setter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;
    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->access$102(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 936
    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$5;->$SwitchMap$org$eclipse$jgit$internal$storage$pack$PackWriter$PackingPhase:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 956
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->illegalPackingPhase:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 938
    :pswitch_0
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v0, v1, Lorg/eclipse/jgit/internal/JGitText;->countingObjects:Ljava/lang/String;

    .line 959
    .local v0, task:Ljava/lang/String;
    :goto_0
    long-to-int v1, p3

    invoke-interface {p2, v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 960
    return-void

    .line 941
    .end local v0           #task:Ljava/lang/String;
    :pswitch_1
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v0, v1, Lorg/eclipse/jgit/internal/JGitText;->searchForSizes:Ljava/lang/String;

    .line 942
    .restart local v0       #task:Ljava/lang/String;
    goto :goto_0

    .line 944
    .end local v0           #task:Ljava/lang/String;
    :pswitch_2
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v0, v1, Lorg/eclipse/jgit/internal/JGitText;->searchForReuse:Ljava/lang/String;

    .line 945
    .restart local v0       #task:Ljava/lang/String;
    goto :goto_0

    .line 947
    .end local v0           #task:Ljava/lang/String;
    :pswitch_3
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v0, v1, Lorg/eclipse/jgit/internal/JGitText;->compressingObjects:Ljava/lang/String;

    .line 948
    .restart local v0       #task:Ljava/lang/String;
    goto :goto_0

    .line 950
    .end local v0           #task:Ljava/lang/String;
    :pswitch_4
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v0, v1, Lorg/eclipse/jgit/internal/JGitText;->writingObjects:Ljava/lang/String;

    .line 951
    .restart local v0       #task:Ljava/lang/String;
    goto :goto_0

    .line 953
    .end local v0           #task:Ljava/lang/String;
    :pswitch_5
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v0, v1, Lorg/eclipse/jgit/internal/JGitText;->buildingBitmaps:Ljava/lang/String;

    .line 954
    .restart local v0       #task:Ljava/lang/String;
    goto :goto_0

    .line 936
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private buffer(Lorg/eclipse/jgit/lib/AnyObjectId;)[B
    .locals 2
    .parameter "objId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1618
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-static {v0, v1, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->buffer(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)[B

    move-result-object v0

    return-object v0
.end method

.method static buffer(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)[B
    .locals 2
    .parameter "config"
    .parameter "or"
    .parameter "objId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1628
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getBigFileThreshold()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v0

    return-object v0
.end method

.method private cutDeltaChains(Lorg/eclipse/jgit/util/BlockList;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/BlockList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1146
    .local p1, list:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v6}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getMaxDeltaDepth()I

    move-result v4

    .line 1147
    .local v4, max:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v6

    add-int/lit8 v3, v6, -0x1

    .local v3, idx:I
    :goto_0
    if-ltz v3, :cond_3

    .line 1148
    const/4 v1, 0x0

    .line 1149
    .local v1, d:I
    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/util/BlockList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v0

    .line 1150
    .local v0, b:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :goto_1
    if-eqz v0, :cond_0

    .line 1151
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getChainLength()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 1147
    :cond_0
    :goto_2
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 1153
    :cond_1
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setChainLength(I)V

    .line 1154
    if-lt v1, v4, :cond_2

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1155
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reselectNonDelta(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    goto :goto_2

    .line 1158
    :cond_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v0

    goto :goto_1

    .line 1161
    .end local v0           #b:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    .end local v1           #d:I
    :cond_3
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v6}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isDeltaCompress()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1162
    invoke-virtual {p1}, Lorg/eclipse/jgit/util/BlockList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1163
    .local v5, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearChainLength()V

    goto :goto_3

    .line 1165
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v5           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_4
    return-void
.end method

.method private deflater()Ljava/util/zip/Deflater;
    .locals 2

    .prologue
    .line 1632
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->myDeflater:Ljava/util/zip/Deflater;

    if-nez v0, :cond_0

    .line 1633
    new-instance v0, Ljava/util/zip/Deflater;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getCompressionLevel()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/zip/Deflater;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->myDeflater:Ljava/util/zip/Deflater;

    .line 1634
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->myDeflater:Ljava/util/zip/Deflater;

    return-object v0
.end method

.method private delta(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    .locals 4
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1605
    new-instance v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBaseId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->buffer(Lorg/eclipse/jgit/lib/AnyObjectId;)[B

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;-><init>([B)V

    .line 1606
    .local v1, index:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->buffer(Lorg/eclipse/jgit/lib/AnyObjectId;)[B

    move-result-object v2

    .line 1612
    .local v2, res:[B
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    array-length v3, v2

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;-><init>(I)V

    .line 1613
    .local v0, delta:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    invoke-virtual {v1, v0, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->encode(Ljava/io/OutputStream;[B)V

    .line 1614
    return-object v0
.end method

.method private endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 0
    .parameter "monitor"

    .prologue
    .line 963
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 964
    return-void
.end method

.method private static ensureSet(Ljava/util/Collection;)Ljava/util/Set;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 722
    .local p0, objs:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    instance-of v1, p0, Ljava/util/Set;

    if-eqz v1, :cond_0

    move-object v0, p0

    .line 723
    check-cast v0, Ljava/util/Set;

    .line 728
    .local v0, set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_0
    return-object v0

    .line 724
    .end local v0           #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_0
    if-nez p0, :cond_1

    .line 725
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    .restart local v0       #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    goto :goto_0

    .line 727
    .end local v0           #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .restart local v0       #set:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    goto :goto_0
.end method

.method private exclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 7
    .parameter "objectId"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1925
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    if-nez v6, :cond_1

    .line 1935
    :cond_0
    :goto_0
    return v4

    .line 1927
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPackLast:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    invoke-interface {v6, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v4, v5

    .line 1928
    goto :goto_0

    .line 1929
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v3, :cond_0

    aget-object v2, v0, v1

    .line 1930
    .local v2, idx:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    invoke-interface {v2, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1931
    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPackLast:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    move v4, v5

    .line 1932
    goto :goto_0

    .line 1929
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private findObjectsNeedingDelta([Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)I
    .locals 4
    .parameter "list"
    .parameter "cnt"
    .parameter "type"

    .prologue
    .line 1301
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v3, v3, p3

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/BlockList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1302
    .local v2, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDoNotDelta()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1304
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1306
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setWeight(I)V

    .line 1307
    add-int/lit8 v0, p2, 0x1

    .end local p2
    .local v0, cnt:I
    aput-object v2, p1, p2

    move p2, v0

    .line 1308
    .end local v0           #cnt:I
    .restart local p2
    goto :goto_0

    .line 1309
    .end local v2           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_1
    return p2
.end method

.method private findObjectsToPack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/revwalk/ObjectWalk;Ljava/util/Set;Ljava/util/Set;)V
    .locals 41
    .parameter "countingMonitor"
    .parameter "walker"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Lorg/eclipse/jgit/revwalk/ObjectWalk;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
        }
    .end annotation

    .prologue
    .line 1647
    .local p3, want:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p4, have:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 1648
    .local v17, countingStart:J
    sget-object v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COUNTING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v4, v1, v6, v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V

    .line 1650
    if-nez p4, :cond_0

    .line 1651
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object p4

    .line 1653
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    new-instance v6, Ljava/util/HashSet;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v6}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->interestingObjects:Ljava/util/Set;

    .line 1654
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    new-instance v6, Ljava/util/HashSet;

    move-object/from16 v0, p4

    invoke-direct {v6, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v6}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->uninterestingObjects:Ljava/util/Set;

    .line 1656
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->setRetainBody(Z)V

    .line 1658
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v4}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isBuildBitmaps()Z

    move-result v4

    if-eqz v4, :cond_2

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->shallowPack:Z

    if-nez v4, :cond_2

    invoke-interface/range {p4 .. p4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    if-eqz v4, :cond_1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    array-length v4, v4

    if-nez v4, :cond_2

    :cond_1
    const/4 v4, 0x1

    :goto_0
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->canBuildBitmaps:Z

    .line 1662
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->shallowPack:Z

    if-nez v4, :cond_3

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->useBitmaps:Z

    if-eqz v4, :cond_3

    .line 1663
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectReader;->getBitmapIndex()Lorg/eclipse/jgit/lib/BitmapIndex;

    move-result-object v11

    .line 1664
    .local v11, bitmapIndex:Lorg/eclipse/jgit/lib/BitmapIndex;
    if-eqz v11, :cond_3

    .line 1665
    new-instance v12, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-direct {v12, v0, v11, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;-><init>(Lorg/eclipse/jgit/revwalk/ObjectWalk;Lorg/eclipse/jgit/lib/BitmapIndex;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1667
    .local v12, bitmapWalker:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-direct {v0, v12, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->findObjectsToPackUsingBitmaps(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;Ljava/util/Set;Ljava/util/Set;)V

    .line 1668
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1669
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long v6, v6, v17

    iput-wide v6, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeCounting:J

    .line 1842
    .end local v11           #bitmapIndex:Lorg/eclipse/jgit/lib/BitmapIndex;
    .end local v12           #bitmapWalker:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;
    :goto_1
    return-void

    .line 1658
    :cond_2
    const/4 v4, 0x0

    goto :goto_0

    .line 1674
    :cond_3
    new-instance v10, Ljava/util/ArrayList;

    invoke-interface/range {p3 .. p3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-interface/range {p4 .. p4}, Ljava/util/Set;->size()I

    move-result v6

    add-int/2addr v4, v6

    invoke-direct {v10, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1675
    .local v10, all:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    move-object/from16 v0, p3

    invoke-interface {v10, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1676
    move-object/from16 v0, p4

    invoke-interface {v10, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1678
    const-string v4, "include"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v27

    .line 1679
    .local v27, include:Lorg/eclipse/jgit/revwalk/RevFlag;
    const-string v4, "added"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v9

    .line 1681
    .local v9, added:Lorg/eclipse/jgit/revwalk/RevFlag;
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1683
    invoke-interface/range {p4 .. p4}, Ljava/util/Set;->size()I

    move-result v21

    .line 1684
    .local v21, haveEst:I
    invoke-interface/range {p4 .. p4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1685
    sget-object v4, Lorg/eclipse/jgit/revwalk/RevSort;->COMMIT_TIME_DESC:Lorg/eclipse/jgit/revwalk/RevSort;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;)V

    .line 1692
    :cond_4
    :goto_2
    new-instance v39, Ljava/util/ArrayList;

    invoke-interface/range {p3 .. p3}, Ljava/util/Set;->size()I

    move-result v4

    move-object/from16 v0, v39

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1693
    .local v39, wantObjs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    new-instance v22, Ljava/util/ArrayList;

    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1694
    .local v22, haveObjs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    new-instance v40, Ljava/util/ArrayList;

    invoke-interface/range {p3 .. p3}, Ljava/util/Set;->size()I

    move-result v4

    move-object/from16 v0, v40

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1696
    .local v40, wantTags:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevTag;>;"
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;

    move-result-object v37

    .line 1700
    .local v37, q:Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
    :cond_5
    :goto_3
    :try_start_0
    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->next()Lorg/eclipse/jgit/revwalk/RevObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v29

    .line 1701
    .local v29, o:Lorg/eclipse/jgit/revwalk/RevObject;
    if-nez v29, :cond_7

    .line 1719
    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    .line 1722
    invoke-interface/range {v40 .. v40}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c

    .line 1723
    new-instance v10, Ljava/util/ArrayList;

    .end local v10           #all:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface/range {v40 .. v40}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v10, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1724
    .restart local v10       #all:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface/range {v40 .. v40}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .local v24, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v38

    check-cast v38, Lorg/eclipse/jgit/revwalk/RevTag;

    .line 1725
    .local v38, tag:Lorg/eclipse/jgit/revwalk/RevTag;
    invoke-virtual/range {v38 .. v38}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    invoke-interface {v10, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 1687
    .end local v22           #haveObjs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    .end local v24           #i$:Ljava/util/Iterator;
    .end local v29           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v37           #q:Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
    .end local v38           #tag:Lorg/eclipse/jgit/revwalk/RevTag;
    .end local v39           #wantObjs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    .end local v40           #wantTags:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevTag;>;"
    :cond_6
    sget-object v4, Lorg/eclipse/jgit/revwalk/RevSort;->TOPO:Lorg/eclipse/jgit/revwalk/RevSort;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;)V

    .line 1688
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->thin:Z

    if-eqz v4, :cond_4

    .line 1689
    sget-object v4, Lorg/eclipse/jgit/revwalk/RevSort;->BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4, v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V

    goto :goto_2

    .line 1703
    .restart local v22       #haveObjs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    .restart local v29       #o:Lorg/eclipse/jgit/revwalk/RevObject;
    .restart local v37       #q:Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
    .restart local v39       #wantObjs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    .restart local v40       #wantTags:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevTag;>;"
    :cond_7
    :try_start_1
    move-object/from16 v0, p4

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1704
    move-object/from16 v0, v22

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1705
    :cond_8
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1706
    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1707
    move-object/from16 v0, v39

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1708
    move-object/from16 v0, v29

    instance-of v4, v0, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v4, :cond_5

    .line 1709
    check-cast v29, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local v29           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, v40

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1711
    :catch_0
    move-exception v20

    .line 1712
    .local v20, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :try_start_2
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ignoreMissingUninteresting:Z

    if-eqz v4, :cond_9

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/errors/MissingObjectException;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 1715
    :cond_9
    throw v20
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1719
    .end local v20           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catchall_0
    move-exception v4

    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    throw v4

    .line 1726
    .restart local v24       #i$:Ljava/util/Iterator;
    .restart local v29       #o:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_a
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;

    move-result-object v37

    .line 1728
    :cond_b
    :try_start_3
    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->next()Lorg/eclipse/jgit/revwalk/RevObject;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v4

    if-nez v4, :cond_b

    .line 1732
    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    .line 1736
    .end local v24           #i$:Ljava/util/Iterator;
    :cond_c
    move-object/from16 v0, p2

    instance-of v4, v0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;

    if-eqz v4, :cond_e

    move-object/from16 v19, p2

    .line 1737
    check-cast v19, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;

    .line 1738
    .local v19, depthWalk:Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;
    invoke-interface/range {v39 .. v39}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .restart local v24       #i$:Ljava/util/Iterator;
    :goto_5
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 1739
    .local v30, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, v19

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->markRoot(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_5

    .line 1732
    .end local v19           #depthWalk:Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;
    .end local v30           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catchall_1
    move-exception v4

    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    throw v4

    .line 1740
    .restart local v19       #depthWalk:Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;
    :cond_d
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->unshallowObjects:Ljava/util/Collection;

    if-eqz v4, :cond_f

    .line 1741
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->unshallowObjects:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :goto_6
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1742
    .local v26, id:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->markUnshallow(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_6

    .line 1745
    .end local v19           #depthWalk:Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;
    .end local v24           #i$:Ljava/util/Iterator;
    .end local v26           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_e
    invoke-interface/range {v39 .. v39}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .restart local v24       #i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 1746
    .restart local v30       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_7

    .line 1748
    .end local v30           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_f
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :goto_8
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 1749
    .restart local v30       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_8

    .line 1751
    .end local v30           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_10
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v4}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchWindowSize()I

    move-result v28

    .line 1752
    .local v28, maxBases:I
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 1753
    .local v5, baseTrees:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/revwalk/RevTree;>;"
    new-instance v16, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct/range {v16 .. v16}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    .line 1755
    .local v16, commits:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    :cond_11
    :goto_9
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    .local v13, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v13, :cond_13

    .line 1756
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->exclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_11

    .line 1758
    sget-object v4, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v13, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 1759
    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v4

    move/from16 v0, v28

    if-gt v4, v0, :cond_11

    .line 1760
    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 1764
    :cond_12
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/util/BlockList;->add(Ljava/lang/Object;)Z

    .line 1765
    const/4 v4, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_9

    .line 1768
    :cond_13
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->shallowPack:Z

    if-eqz v4, :cond_14

    .line 1769
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/util/BlockList;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :goto_a
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 1770
    .local v14, cmit:Lorg/eclipse/jgit/revwalk/RevCommit;
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V

    goto :goto_a

    .line 1773
    .end local v14           #cmit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_14
    const/4 v15, 0x0

    .line 1774
    .local v15, commitCnt:I
    const/16 v36, 0x0

    .line 1775
    .local v36, putTagTargets:Z
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/util/BlockList;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .end local v24           #i$:Ljava/util/Iterator;
    :cond_15
    :goto_b
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 1776
    .restart local v14       #cmit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v14, v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-nez v4, :cond_16

    .line 1777
    invoke-virtual {v14, v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1778
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V

    .line 1779
    add-int/lit8 v15, v15, 0x1

    .line 1782
    :cond_16
    const/16 v23, 0x0

    .local v23, i:I
    :goto_c
    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v4

    move/from16 v0, v23

    if-ge v0, v4, :cond_18

    .line 1783
    move/from16 v0, v23

    invoke-virtual {v14, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v31

    .line 1784
    .local v31, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-nez v4, :cond_17

    sget-object v4, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-nez v4, :cond_17

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->exclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_17

    .line 1786
    move-object/from16 v0, v31

    invoke-virtual {v0, v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1787
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V

    .line 1788
    add-int/lit8 v15, v15, 0x1

    .line 1782
    :cond_17
    add-int/lit8 v23, v23, 0x1

    goto :goto_c

    .line 1792
    .end local v31           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_18
    if-nez v36, :cond_15

    const/16 v4, 0x1000

    if-ge v4, v15, :cond_15

    .line 1793
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->tagTargets:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v25

    .local v25, i$:Ljava/util/Iterator;
    :cond_19
    :goto_d
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1a

    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1794
    .restart local v26       #id:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->lookupOrNull(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v30

    .line 1795
    .restart local v30       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, v30

    instance-of v4, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v4, :cond_19

    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-eqz v4, :cond_19

    sget-object v4, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    move-object/from16 v0, v30

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-nez v4, :cond_19

    move-object/from16 v0, v30

    invoke-virtual {v0, v9}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-nez v4, :cond_19

    .line 1799
    move-object/from16 v0, v30

    invoke-virtual {v0, v9}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1800
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V

    goto :goto_d

    .line 1803
    .end local v26           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v30           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_1a
    const/16 v36, 0x1

    goto/16 :goto_b

    .line 1807
    .end local v14           #cmit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v15           #commitCnt:I
    .end local v23           #i:I
    .end local v25           #i$:Ljava/util/Iterator;
    .end local v36           #putTagTargets:Z
    :cond_1b
    const/16 v16, 0x0

    .line 1809
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->thin:Z

    if-eqz v4, :cond_1d

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1d

    .line 1810
    new-instance v3, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->edgeObjects:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v8}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;-><init>(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;Ljava/util/List;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 1813
    .local v3, bases:Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;
    :cond_1c
    :goto_e
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->nextObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v29

    if-eqz v29, :cond_1e

    .line 1814
    sget-object v4, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-nez v4, :cond_1c

    .line 1816
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->exclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_1c

    .line 1819
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->getPathHashCode()I

    move-result v34

    .line 1820
    .local v34, pathHash:I
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->getPathBuffer()[B

    move-result-object v33

    .line 1821
    .local v33, pathBuf:[B
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->getPathLength()I

    move-result v35

    .line 1822
    .local v35, pathLen:I
    invoke-virtual/range {v29 .. v29}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v4

    move-object/from16 v0, v33

    move/from16 v1, v35

    move/from16 v2, v34

    invoke-virtual {v3, v4, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;->addBase(I[BII)V

    .line 1823
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v34

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V

    .line 1824
    const/4 v4, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_e

    .line 1828
    .end local v3           #bases:Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;
    .end local v33           #pathBuf:[B
    .end local v34           #pathHash:I
    .end local v35           #pathLen:I
    :cond_1d
    :goto_f
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->nextObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v29

    if-eqz v29, :cond_1e

    .line 1829
    sget-object v4, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v4

    if-nez v4, :cond_1d

    .line 1831
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->exclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_1d

    .line 1833
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->getPathHashCode()I

    move-result v4

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V

    .line 1834
    const/4 v4, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_f

    .line 1838
    :cond_1e
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .restart local v24       #i$:Ljava/util/Iterator;
    :goto_10
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;

    .line 1839
    .local v32, pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    invoke-virtual/range {v32 .. v32}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;->getObjectCount()J

    move-result-wide v6

    long-to-int v4, v6

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_10

    .line 1840
    .end local v32           #pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    :cond_1f
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1841
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long v6, v6, v17

    iput-wide v6, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeCounting:J

    goto/16 :goto_1
.end method

.method private findObjectsToPackUsingBitmaps(Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;Ljava/util/Set;Ljava/util/Set;)V
    .locals 8
    .parameter "bitmapWalker"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1849
    .local p2, want:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v6, 0x0

    invoke-virtual {p1, p3, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->findObjects(Ljava/util/Set;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    move-result-object v0

    .line 1850
    .local v0, haveBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->reset()V

    .line 1851
    invoke-virtual {p1, p2, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->findObjects(Ljava/util/Set;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    move-result-object v5

    .line 1852
    .local v5, wantBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    invoke-interface {v5, v0}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    move-result-object v2

    .line 1854
    .local v2, needBitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    iget-boolean v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->useCachedPacks:Z

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    array-length v6, v6

    if-nez v6, :cond_1

    .line 1856
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    invoke-interface {v7, v2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->getCachedPacksAndUpdate(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1859
    :cond_1
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/BitmapObject;

    .line 1860
    .local v3, obj:Lorg/eclipse/jgit/lib/BitmapObject;
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/BitmapObject;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 1861
    .local v4, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->exclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1862
    invoke-interface {v2, v4}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->remove(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_0

    .line 1865
    :cond_2
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/BitmapObject;->getType()I

    move-result v6

    const/4 v7, 0x0

    invoke-direct {p0, v4, v6, v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/lib/AnyObjectId;II)V

    goto :goto_0

    .line 1868
    .end local v3           #obj:Lorg/eclipse/jgit/lib/BitmapObject;
    .end local v4           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    iget-boolean v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->thin:Z

    if-eqz v6, :cond_4

    .line 1869
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->haveObjects:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .line 1870
    :cond_4
    return-void
.end method

.method public static getInstances()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->instancesIterable:Ljava/lang/Iterable;

    return-object v0
.end method

.method private final have(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "ptr"
    .parameter "objectId"

    .prologue
    .line 2004
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->haveObjects:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->haveObjects:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    invoke-interface {v0, p2}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private parallelDeltaSearch(Lorg/eclipse/jgit/lib/ProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V
    .locals 20
    .parameter "monitor"
    .parameter "list"
    .parameter "cnt"
    .parameter "threads"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1361
    new-instance v6, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-direct {v6, v3}, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;)V

    .line 1362
    .local v6, dc:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;
    new-instance v7, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;

    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;-><init>(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1363
    .local v7, pm:Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;
    new-instance v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    const/4 v9, 0x0

    move/from16 v3, p4

    move-object/from16 v8, p2

    move/from16 v10, p3

    invoke-direct/range {v2 .. v10}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;-><init>(ILorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V

    .line 1366
    .local v2, taskBlock:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->partitionTasks()V

    .line 1367
    sget-object v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COMPRESSING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->cost()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v3, v1, v4, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V

    .line 1368
    iget-object v3, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v7, v3}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->startWorkers(I)V

    .line 1370
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v3}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v14

    .line 1371
    .local v14, executor:Ljava/util/concurrent/Executor;
    new-instance v3, Ljava/util/ArrayList;

    move/from16 v0, p4

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v3}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v13

    .line 1373
    .local v13, errors:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Throwable;>;"
    instance-of v3, v14, Ljava/util/concurrent/ExecutorService;

    if-eqz v3, :cond_0

    .line 1375
    check-cast v14, Ljava/util/concurrent/ExecutorService;

    .end local v14           #executor:Ljava/util/concurrent/Executor;
    invoke-static {v14, v7, v2, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->runTasks(Ljava/util/concurrent/ExecutorService;Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;Ljava/util/List;)V

    .line 1423
    :goto_0
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8

    .line 1424
    const/4 v3, 0x0

    invoke-interface {v13, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Throwable;

    .line 1425
    .local v12, err:Ljava/lang/Throwable;
    instance-of v3, v12, Ljava/lang/Error;

    if-eqz v3, :cond_5

    .line 1426
    check-cast v12, Ljava/lang/Error;

    .end local v12           #err:Ljava/lang/Throwable;
    throw v12

    .line 1376
    .restart local v14       #executor:Ljava/util/concurrent/Executor;
    :cond_0
    if-nez v14, :cond_3

    .line 1379
    invoke-static/range {p4 .. p4}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v18

    .line 1381
    .local v18, pool:Ljava/util/concurrent/ExecutorService;
    :try_start_0
    move-object/from16 v0, v18

    invoke-static {v0, v7, v2, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->runTasks(Ljava/util/concurrent/ExecutorService;Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1383
    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 1386
    :cond_1
    const-wide/16 v3, 0x3c

    :try_start_1
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    invoke-interface {v0, v3, v4, v5}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 1388
    :catch_0
    move-exception v11

    .line 1389
    .local v11, e:Ljava/lang/InterruptedException;
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->packingCancelledDuringObjectsWriting:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1383
    .end local v11           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v3

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 1386
    :cond_2
    const-wide/16 v4, 0x3c

    :try_start_2
    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    invoke-interface {v0, v4, v5, v8}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    move-result v4

    if-eqz v4, :cond_2

    .line 1389
    throw v3

    .line 1388
    :catch_1
    move-exception v11

    .line 1389
    .restart local v11       #e:Ljava/lang/InterruptedException;
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->packingCancelledDuringObjectsWriting:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1398
    .end local v11           #e:Ljava/lang/InterruptedException;
    .end local v18           #pool:Ljava/util/concurrent/ExecutorService;
    :cond_3
    iget-object v3, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;

    .line 1399
    .local v19, task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    new-instance v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v3, v0, v1, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;-><init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;Ljava/util/List;)V

    invoke-interface {v14, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 1410
    .end local v19           #task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    :cond_4
    :try_start_3
    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->waitForCompletion()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 1411
    :catch_2
    move-exception v17

    .line 1415
    .local v17, ie:Ljava/lang/InterruptedException;
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->packingCancelledDuringObjectsWriting:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1427
    .end local v14           #executor:Ljava/util/concurrent/Executor;
    .end local v16           #i$:Ljava/util/Iterator;
    .end local v17           #ie:Ljava/lang/InterruptedException;
    .restart local v12       #err:Ljava/lang/Throwable;
    :cond_5
    instance-of v3, v12, Ljava/lang/RuntimeException;

    if-eqz v3, :cond_6

    .line 1428
    check-cast v12, Ljava/lang/RuntimeException;

    .end local v12           #err:Ljava/lang/Throwable;
    throw v12

    .line 1429
    .restart local v12       #err:Ljava/lang/Throwable;
    :cond_6
    instance-of v3, v12, Ljava/io/IOException;

    if-eqz v3, :cond_7

    .line 1430
    check-cast v12, Ljava/io/IOException;

    .end local v12           #err:Ljava/lang/Throwable;
    throw v12

    .line 1432
    .restart local v12       #err:Ljava/lang/Throwable;
    :cond_7
    new-instance v15, Ljava/io/IOException;

    invoke-virtual {v12}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v15, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1433
    .local v15, fail:Ljava/io/IOException;
    invoke-virtual {v15, v12}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 1434
    throw v15

    .line 1436
    .end local v12           #err:Ljava/lang/Throwable;
    .end local v15           #fail:Ljava/io/IOException;
    :cond_8
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1437
    return-void
.end method

.method private static pruneEdgesFromObjectList(Ljava/util/List;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1873
    .local p0, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 1874
    .local v2, size:I
    const/4 v3, 0x0

    .line 1875
    .local v3, src:I
    const/4 v0, 0x0

    .line 1877
    .local v0, dst:I
    :goto_0
    if-ge v3, v2, :cond_2

    .line 1878
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1879
    .local v1, obj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1877
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1881
    :cond_0
    if-eq v0, v3, :cond_1

    .line 1882
    invoke-interface {p0, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1883
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1886
    .end local v1           #obj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_2
    :goto_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_3

    .line 1887
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {p0, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_2

    .line 1888
    :cond_3
    return-void
.end method

.method private reselectNonDelta(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 4
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1313
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearDeltaBase()V

    .line 1314
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    .line 1315
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltas:Z

    .line 1316
    .local v0, old:Z
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltas:Z

    .line 1317
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    sget-object v2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v1, p0, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/Iterable;)V

    .line 1320
    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltas:Z

    .line 1321
    return-void
.end method

.method private reuseDeltaFor(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Z
    .locals 3
    .parameter "otp"

    .prologue
    const/4 v1, 0x1

    .line 2068
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v0

    .line 2069
    .local v0, type:I
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_1

    .line 2075
    :cond_0
    :goto_0
    return v1

    .line 2071
    :cond_1
    if-ne v0, v1, :cond_2

    .line 2072
    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltaCommits:Z

    goto :goto_0

    .line 2073
    :cond_2
    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    .line 2074
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static runTasks(Ljava/util/concurrent/ExecutorService;Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;Ljava/util/List;)V
    .locals 8
    .parameter "pool"
    .parameter "pm"
    .parameter "tb"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ExecutorService;",
            "Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;",
            "Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1442
    .local p3, errors:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Throwable;>;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v6, p2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1443
    .local v2, futures:Ljava/util/List;,"Ljava/util/List<Ljava/util/concurrent/Future<*>;>;"
    iget-object v6, p2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->tasks:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;

    .line 1444
    .local v5, task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    invoke-interface {p0, v5}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1447
    .end local v5           #task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->waitForCompletion()V

    .line 1448
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1450
    .local v0, f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<*>;"
    :try_start_1
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 1451
    :catch_0
    move-exception v1

    .line 1452
    .local v1, failed:Ljava/util/concurrent/ExecutionException;
    :try_start_2
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    invoke-interface {p3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 1455
    .end local v0           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<*>;"
    .end local v1           #failed:Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v4

    .line 1456
    .local v4, ie:Ljava/lang/InterruptedException;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    .line 1457
    .restart local v0       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<*>;"
    const/4 v6, 0x1

    invoke-interface {v0, v6}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_2

    .line 1458
    .end local v0           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<*>;"
    :cond_1
    new-instance v6, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->packingCancelledDuringObjectsWriting:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1461
    .end local v4           #ie:Ljava/lang/InterruptedException;
    :cond_2
    return-void
.end method

.method private searchForDeltas(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 26
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1174
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    move-object/from16 v23, v0

    const/16 v24, 0x2

    aget-object v23, v23, v24

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    move-object/from16 v24, v0

    const/16 v25, 0x3

    aget-object v24, v24, v25

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v24

    add-int v23, v23, v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->edgeObjects:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v24

    add-int v23, v23, v24

    move/from16 v0, v23

    new-array v12, v0, [Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1178
    .local v12, list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    const/4 v5, 0x0

    .line 1179
    .local v5, cnt:I
    const/16 v23, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v12, v5, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->findObjectsNeedingDelta([Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)I

    move-result v5

    .line 1180
    const/16 v23, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v12, v5, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->findObjectsNeedingDelta([Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)I

    move-result v5

    .line 1181
    if-nez v5, :cond_1

    .line 1298
    :cond_0
    return-void

    .line 1183
    :cond_1
    move v13, v5

    .line 1189
    .local v13, nonEdgeCnt:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->edgeObjects:Ljava/util/List;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1190
    .local v7, eo:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setWeight(I)V

    .line 1191
    add-int/lit8 v6, v5, 0x1

    .end local v5           #cnt:I
    .local v6, cnt:I
    aput-object v7, v12, v5

    move v5, v6

    .line 1192
    .end local v6           #cnt:I
    .restart local v5       #cnt:I
    goto :goto_0

    .line 1201
    .end local v7           #eo:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    .line 1202
    .local v19, sizingStart:J
    sget-object v23, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->GETTING_SIZES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    int-to-long v0, v5

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, p1

    move-wide/from16 v3, v24

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V

    .line 1203
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    move-object/from16 v23, v0

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    invoke-interface {v0, v1, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x0

    invoke-virtual/range {v23 .. v25}, Lorg/eclipse/jgit/lib/ObjectReader;->getObjectSize(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;

    move-result-object v18

    .line 1206
    .local v18, sizeQueue:Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;,"Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getBigFileThreshold()I

    move-result v23

    const v24, 0x7fffffff

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->min(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v23

    move/from16 v0, v23

    int-to-long v10, v0

    .line 1211
    .local v10, limit:J
    :goto_1
    :try_start_1
    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;->next()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v23

    if-nez v23, :cond_6

    .line 1243
    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;->release()V

    .line 1245
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1246
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v23, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    sub-long v24, v24, v19

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeSearchingForSizes:J

    .line 1253
    const/16 v23, 0x0

    new-instance v24, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$3;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$3;-><init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V

    move/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v12, v0, v5, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 1282
    :goto_2
    if-lez v5, :cond_9

    add-int/lit8 v23, v5, -0x1

    aget-object v23, v12, v23

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDoNotDelta()Z

    move-result v23

    if-eqz v23, :cond_9

    .line 1283
    add-int/lit8 v23, v5, -0x1

    aget-object v23, v12, v23

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v23

    if-nez v23, :cond_3

    .line 1284
    add-int/lit8 v13, v13, -0x1

    .line 1285
    :cond_3
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 1213
    :catch_0
    move-exception v14

    .line 1214
    .local v14, notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    const/16 v23, 0x1

    :try_start_2
    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 1215
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ignoreMissingUninteresting:Z

    move/from16 v23, v0

    if-eqz v23, :cond_5

    .line 1216
    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;->getCurrent()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1217
    .local v15, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    if-eqz v15, :cond_4

    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v23

    if-eqz v23, :cond_4

    .line 1218
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDoNotDelta()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 1243
    .end local v10           #limit:J
    .end local v14           #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    .end local v15           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :catchall_0
    move-exception v23

    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;->release()V

    throw v23

    .line 1222
    .restart local v10       #limit:J
    .restart local v14       #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    .restart local v15       #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_4
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-object/from16 v23, v0

    invoke-virtual {v14}, Lorg/eclipse/jgit/errors/MissingObjectException;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v15

    .end local v15           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    check-cast v15, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1223
    .restart local v15       #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    if-eqz v15, :cond_5

    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v23

    if-eqz v23, :cond_5

    .line 1224
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDoNotDelta()V

    goto/16 :goto_1

    .line 1228
    .end local v15           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_5
    throw v14

    .line 1231
    .end local v14           #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    :cond_6
    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;->getCurrent()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1232
    .restart local v15       #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    if-nez v15, :cond_7

    .line 1233
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-object/from16 v23, v0

    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v15

    .end local v15           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    check-cast v15, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1235
    .restart local v15       #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_7
    invoke-interface/range {v18 .. v18}, Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;->getSize()J

    move-result-wide v21

    .line 1236
    .local v21, sz:J
    const-wide/16 v23, 0x10

    cmp-long v23, v23, v21

    if-gez v23, :cond_8

    cmp-long v23, v21, v10

    if-gez v23, :cond_8

    .line 1237
    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-virtual {v15, v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setWeight(I)V

    .line 1240
    :goto_3
    const/16 v23, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto/16 :goto_1

    .line 1239
    :cond_8
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDoNotDelta()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 1287
    .end local v15           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    .end local v21           #sz:J
    :cond_9
    if-eqz v5, :cond_0

    .line 1290
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 1291
    .local v16, searchStart:J
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v12, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForDeltas(Lorg/eclipse/jgit/lib/ProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;I)V

    .line 1292
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iput v13, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->deltaSearchNonEdgeObjects:I

    .line 1293
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v23, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    sub-long v24, v24, v16

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeCompressing:J

    .line 1295
    const/4 v8, 0x0

    .local v8, i:I
    :goto_4
    if-ge v8, v5, :cond_0

    .line 1296
    aget-object v23, v12, v8

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v23

    if-nez v23, :cond_a

    aget-object v23, v12, v8

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v23

    if-eqz v23, :cond_a

    .line 1297
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->deltasFound:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, 0x1

    move/from16 v0, v24

    move-object/from16 v1, v23

    iput v0, v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->deltasFound:I

    .line 1295
    :cond_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_4
.end method

.method private searchForDeltas(Lorg/eclipse/jgit/lib/ProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;I)V
    .locals 2
    .parameter "monitor"
    .parameter "list"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/LargeObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1327
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getThreads()I

    move-result v0

    .line 1328
    .local v0, threads:I
    if-nez v0, :cond_0

    .line 1329
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    .line 1330
    :cond_0
    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchWindowSize()I

    move-result v1

    if-gt p3, v1, :cond_2

    .line 1331
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->singleThreadDeltaSearch(Lorg/eclipse/jgit/lib/ProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;I)V

    .line 1334
    :goto_0
    return-void

    .line 1333
    :cond_2
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->parallelDeltaSearch(Lorg/eclipse/jgit/lib/ProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V

    goto :goto_0
.end method

.method private searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 11
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    const/4 v7, 0x1

    const/4 v9, 0x3

    const/4 v8, 0x2

    .line 1098
    const-wide/16 v0, 0x0

    .line 1099
    .local v0, cnt:J
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v7

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v0, v5

    .line 1100
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v8

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v0, v5

    .line 1101
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v9

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v0, v5

    .line 1102
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v10

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v0, v5

    .line 1104
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1105
    .local v2, start:J
    sget-object v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->FINDING_SOURCES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    invoke-direct {p0, v5, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V

    .line 1106
    const-wide/16 v5, 0x1000

    cmp-long v5, v0, v5

    if-gtz v5, :cond_2

    .line 1108
    new-instance v4, Lorg/eclipse/jgit/util/BlockList;

    long-to-int v5, v0

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/util/BlockList;-><init>(I)V

    .line 1109
    .local v4, tmp:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v10

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/BlockList;->addAll(Lorg/eclipse/jgit/util/BlockList;)V

    .line 1110
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v7

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/BlockList;->addAll(Lorg/eclipse/jgit/util/BlockList;)V

    .line 1111
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v8

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/BlockList;->addAll(Lorg/eclipse/jgit/util/BlockList;)V

    .line 1112
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v9

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/BlockList;->addAll(Lorg/eclipse/jgit/util/BlockList;)V

    .line 1113
    invoke-direct {p0, p1, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/List;)V

    .line 1114
    iget-boolean v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneCurrentObjectList:Z

    if-eqz v5, :cond_0

    .line 1116
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v7

    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneEdgesFromObjectList(Ljava/util/List;)V

    .line 1117
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v8

    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneEdgesFromObjectList(Ljava/util/List;)V

    .line 1118
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v9

    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneEdgesFromObjectList(Ljava/util/List;)V

    .line 1119
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v10

    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneEdgesFromObjectList(Ljava/util/List;)V

    .line 1127
    .end local v4           #tmp:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    :cond_0
    :goto_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1128
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    iput-wide v6, v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeSearchingForReuse:J

    .line 1130
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseDeltas()Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getCutDeltaChains()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1131
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v8

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cutDeltaChains(Lorg/eclipse/jgit/util/BlockList;)V

    .line 1132
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v9

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cutDeltaChains(Lorg/eclipse/jgit/util/BlockList;)V

    .line 1134
    :cond_1
    return-void

    .line 1122
    :cond_2
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v10

    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/List;)V

    .line 1123
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v7

    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/List;)V

    .line 1124
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v8

    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/List;)V

    .line 1125
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v5, v5, v9

    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/List;)V

    goto :goto_0
.end method

.method private searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/List;)V
    .locals 1
    .parameter "monitor"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;
        }
    .end annotation

    .prologue
    .line 1138
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneCurrentObjectList:Z

    .line 1139
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    invoke-interface {v0, p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/Iterable;)V

    .line 1140
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneCurrentObjectList:Z

    if-eqz v0, :cond_0

    .line 1141
    invoke-static {p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneEdgesFromObjectList(Ljava/util/List;)V

    .line 1142
    :cond_0
    return-void
.end method

.method private singleThreadDeltaSearch(Lorg/eclipse/jgit/lib/ProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;I)V
    .locals 17
    .parameter "monitor"
    .parameter "list"
    .parameter "cnt"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1338
    const-wide/16 v15, 0x0

    .line 1339
    .local v15, totalWeight:J
    const/4 v13, 0x0

    .local v13, i:I
    :goto_0
    move/from16 v0, p3

    if-ge v13, v0, :cond_1

    .line 1340
    aget-object v14, p2, v13

    .line 1341
    .local v14, o:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v14}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v14}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->doNotAttemptDelta()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1342
    invoke-virtual {v14}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v15, v2

    .line 1339
    :cond_0
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 1345
    .end local v14           #o:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_1
    const-wide/16 v7, 0x1

    .line 1346
    .local v7, bytesPerUnit:J
    :goto_1
    const-wide/32 v2, 0x900000

    div-long v4, v15, v7

    cmp-long v2, v2, v4

    if-gtz v2, :cond_2

    .line 1347
    const/16 v2, 0xa

    shl-long/2addr v7, v2

    goto :goto_1

    .line 1348
    :cond_2
    div-long v2, v15, v7

    long-to-int v12, v2

    .line 1349
    .local v12, cost:I
    rem-long v2, v15, v7

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_3

    .line 1350
    add-int/lit8 v12, v12, 0x1

    .line 1352
    :cond_3
    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COMPRESSING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    int-to-long v3, v12

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v2, v1, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V

    .line 1353
    new-instance v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    new-instance v4, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    const/4 v10, 0x0

    move-object/from16 v6, p1

    move-object/from16 v9, p2

    move/from16 v11, p3

    invoke-direct/range {v2 .. v11}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ProgressMonitor;J[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->search()V

    .line 1356
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1357
    return-void
.end method

.method private sortByName()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 915
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    if-nez v1, :cond_0

    .line 916
    const/4 v0, 0x0

    .line 917
    .local v0, cnt:I
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v1, v1, v3

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 918
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 919
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v1, v1, v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 920
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v1, v1, v6

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 922
    new-instance v1, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/util/BlockList;-><init>(I)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    .line 923
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v2, v2, v3

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 924
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v2, v2, v4

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 925
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v2, v2, v5

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 926
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v2, v2, v6

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 927
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 929
    .end local v0           #cnt:I
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortedByName:Ljava/util/List;

    return-object v1
.end method

.method private writeBase(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 1
    .parameter "out"
    .parameter "base"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1555
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isWritten()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1556
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObjectImpl(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 1557
    :cond_0
    return-void
.end method

.method private writeChecksum(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V
    .locals 1
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1638
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->getDigest()[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->packcsum:[B

    .line 1639
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->packcsum:[B

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([B)V

    .line 1640
    return-void
.end method

.method private writeDeltaObjectDeflate(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 12
    .parameter "out"
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1576
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v5

    invoke-direct {p0, p1, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBase(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 1578
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v5}, Ljava/util/zip/CRC32;->reset()V

    .line 1579
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v5

    invoke-virtual {p2, v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setOffset(J)V

    .line 1581
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->popCachedDelta()Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;

    move-result-object v3

    .line 1582
    .local v3, ref:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    if-eqz v3, :cond_0

    .line 1583
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    .line 1584
    .local v4, zbuf:[B
    if-eqz v4, :cond_0

    .line 1585
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getCachedSize()I

    move-result v5

    int-to-long v5, v5

    invoke-virtual {p1, p2, v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 1586
    invoke-virtual {p1, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([B)V

    .line 1601
    .end local v4           #zbuf:[B
    :goto_0
    return-void

    .line 1591
    :cond_0
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->delta(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    move-result-object v1

    .line 1592
    .local v1, delta:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
    invoke-virtual {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->length()J

    move-result-wide v5

    invoke-virtual {p1, p2, v5, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 1594
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->deflater()Ljava/util/zip/Deflater;

    move-result-object v0

    .line 1595
    .local v0, deflater:Ljava/util/zip/Deflater;
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    .line 1596
    new-instance v2, Ljava/util/zip/DeflaterOutputStream;

    invoke-direct {v2, p1, v0}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)V

    .line 1597
    .local v2, dst:Ljava/util/zip/DeflaterOutputStream;
    const/4 v5, 0x0

    invoke-virtual {v1, v2, v5}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1598
    invoke-virtual {v2}, Ljava/util/zip/DeflaterOutputStream;->finish()V

    .line 1599
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    iget-wide v6, v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntDeltas:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntDeltas:J

    .line 1600
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    iget-wide v6, v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->deltaBytes:J

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v8

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v10

    sub-long/2addr v8, v10

    add-long/2addr v6, v8

    iput-wide v6, v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->deltaBytes:J

    goto :goto_0
.end method

.method private writeObjectImpl(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 11
    .parameter "out"
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x1

    .line 1496
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->wantWrite()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1502
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reselectNonDelta(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 1504
    :cond_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->markWantWrite()V

    .line 1506
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isReuseAsIs()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1507
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBase(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 1508
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isWritten()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1551
    :cond_1
    :goto_1
    return-void

    .line 1511
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->reset()V

    .line 1512
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v2

    invoke-virtual {p2, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setOffset(J)V

    .line 1514
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseValidate:Z

    invoke-interface {v2, p1, p2, v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->copyObjectAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Z)V

    .line 1515
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->endObject()V

    .line 1516
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {p2, v2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setCRC(I)V

    .line 1517
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    iget-wide v3, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedObjects:J

    add-long/2addr v3, v9

    iput-wide v3, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedObjects:J

    .line 1518
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1519
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    iget-wide v3, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedDeltas:J

    add-long/2addr v3, v9

    iput-wide v3, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedDeltas:J

    .line 1520
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    iget-wide v3, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->deltaBytes:J

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v5

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v7

    sub-long/2addr v5, v7

    add-long/2addr v3, v5

    iput-wide v3, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->deltaBytes:J
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1523
    :catch_0
    move-exception v1

    .line 1524
    .local v1, gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    .line 1525
    const-wide/16 v2, 0x0

    invoke-virtual {p2, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setOffset(J)V

    .line 1526
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearDeltaBase()V

    .line 1527
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    .line 1528
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    sget-object v3, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    invoke-static {p2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v2, p0, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->selectObjectRepresentation(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/Iterable;)V

    goto :goto_0

    .line 1536
    :cond_3
    new-instance v0, Lorg/eclipse/jgit/errors/CorruptObjectException;

    const-string v2, ""

    invoke-direct {v0, p2, v2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    .line 1537
    .local v0, coe:Lorg/eclipse/jgit/errors/CorruptObjectException;
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 1538
    throw v0

    .line 1545
    .end local v0           #coe:Lorg/eclipse/jgit/errors/CorruptObjectException;
    .end local v1           #gone:Lorg/eclipse/jgit/errors/StoredObjectRepresentationNotAvailableException;
    :cond_4
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1546
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeDeltaObjectDeflate(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 1549
    :goto_2
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->endObject()V

    .line 1550
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {p2, v2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setCRC(I)V

    goto/16 :goto_1

    .line 1548
    :cond_5
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeWholeObjectDeflate(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    goto :goto_2
.end method

.method private writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V
    .locals 2
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1464
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V

    .line 1465
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V

    .line 1466
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V

    .line 1467
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V

    .line 1468
    return-void
.end method

.method private writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V
    .locals 9
    .parameter "out"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1472
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1487
    :goto_0
    return-void

    .line 1475
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    iget-object v5, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    const/4 v4, 0x0

    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v4

    aget-object v4, v5, v4

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    .line 1476
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v0

    .line 1478
    .local v0, beginOffset:J
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    if-eqz v4, :cond_2

    .line 1479
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    invoke-interface {v4, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Ljava/util/List;)V

    .line 1485
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    iget-wide v5, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->bytes:J

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v7

    sub-long/2addr v7, v0

    add-long/2addr v5, v7

    iput-wide v5, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->bytes:J

    .line 1486
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->typeStats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    int-to-long v5, v5

    iput-wide v5, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntObjects:J

    goto :goto_0

    .line 1481
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1482
    .local v3, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeObject(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    goto :goto_1
.end method

.method private writeWholeObjectDeflate(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 5
    .parameter "out"
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1561
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->deflater()Ljava/util/zip/Deflater;

    move-result-object v0

    .line 1562
    .local v0, deflater:Ljava/util/zip/Deflater;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v4

    invoke-virtual {v3, p2, v4}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    .line 1564
    .local v2, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->crc32:Ljava/util/zip/CRC32;

    invoke-virtual {v3}, Ljava/util/zip/CRC32;->reset()V

    .line 1565
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v3

    invoke-virtual {p2, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setOffset(J)V

    .line 1566
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectLoader;->getSize()J

    move-result-wide v3

    invoke-virtual {p1, p2, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V

    .line 1568
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    .line 1569
    new-instance v1, Ljava/util/zip/DeflaterOutputStream;

    invoke-direct {v1, p1, v0}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)V

    .line 1570
    .local v1, dst:Ljava/util/zip/DeflaterOutputStream;
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->copyTo(Ljava/io/OutputStream;)V

    .line 1571
    invoke-virtual {v1}, Ljava/util/zip/DeflaterOutputStream;->finish()V

    .line 1572
    return-void
.end method


# virtual methods
.method public addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "object"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
        }
    .end annotation

    .prologue
    .line 1904
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->exclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1905
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;I)V

    .line 1906
    :cond_0
    return-void
.end method

.method public computeName()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 7

    .prologue
    const/16 v6, 0x14

    const/4 v5, 0x0

    .line 836
    new-array v0, v6, [B

    .line 837
    .local v0, buf:[B
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v2

    .line 838
    .local v2, md:Ljava/security/MessageDigest;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortByName()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 839
    .local v3, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    invoke-virtual {v3, v0, v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->copyRawTo([BI)V

    .line 840
    invoke-virtual {v2, v0, v5, v6}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 842
    .end local v3           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_0
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    return-object v4
.end method

.method public excludeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;)V
    .locals 4
    .parameter "idx"

    .prologue
    const/4 v3, 0x0

    .line 609
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    if-nez v2, :cond_0

    .line 610
    const/4 v2, 0x1

    new-array v2, v2, [Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    aput-object p1, v2, v3

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 611
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPackLast:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 619
    :goto_0
    return-void

    .line 613
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    array-length v0, v2

    .line 614
    .local v0, cnt:I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 615
    .local v1, newList:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 616
    aput-object p1, v1, v0

    .line 617
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    goto :goto_0
.end method

.method public get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    .locals 2
    .parameter "id"

    .prologue
    .line 825
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 826
    .local v0, obj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v1

    if-nez v1, :cond_0

    .end local v0           #obj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :goto_0
    return-object v0

    .restart local v0       #obj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getIndexVersion()I
    .locals 6

    .prologue
    .line 855
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getIndexVersion()I

    move-result v2

    .line 856
    .local v2, indexVersion:I
    if-gtz v2, :cond_0

    .line 857
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    .local v0, arr$:[Lorg/eclipse/jgit/util/BlockList;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v4, v0, v1

    .line 858
    .local v4, objs:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    invoke-static {v4}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->oldestPossibleFormat(Ljava/util/List;)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 857
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 861
    .end local v0           #arr$:[Lorg/eclipse/jgit/util/BlockList;
    .end local v1           #i$:I
    .end local v3           #len$:I
    .end local v4           #objs:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    :cond_0
    return v2
.end method

.method public getObjectCount()J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 557
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    iget-wide v4, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalObjects:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 558
    const-wide/16 v1, 0x0

    .line 560
    .local v1, objCnt:J
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v5, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v1, v4

    .line 561
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v5, 0x2

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v1, v4

    .line 562
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v5, 0x3

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v1, v4

    .line 563
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    const/4 v5, 0x4

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v1, v4

    .line 565
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;

    .line 566
    .local v3, pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;->getObjectCount()J

    move-result-wide v4

    add-long/2addr v1, v4

    goto :goto_0

    .line 569
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #objCnt:J
    .end local v3           #pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    iget-wide v1, v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalObjects:J

    :cond_1
    return-wide v1
.end method

.method public getObjectSet()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 585
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 586
    new-instance v7, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->cachedPacksPreventsListingObjects:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 589
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {v5}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;-><init>()V

    .line 591
    .local v5, objs:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    .local v0, arr$:[Lorg/eclipse/jgit/util/BlockList;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    move v2, v1

    .end local v1           #i$:I
    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 592
    .local v4, objList:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    if-eqz v4, :cond_1

    .line 593
    invoke-virtual {v4}, Lorg/eclipse/jgit/util/BlockList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local v2           #i$:I
    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 594
    .local v6, otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    new-instance v7, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$2;

    invoke-direct {v7, p0, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$2;-><init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    invoke-virtual {v5, v7}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->add(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)V

    goto :goto_1

    .line 591
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v6           #otp:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_1
    add-int/lit8 v1, v2, 0x1

    .local v1, i$:I
    move v2, v1

    .end local v1           #i$:I
    .restart local v2       #i$:I
    goto :goto_0

    .line 599
    .end local v4           #objList:Lorg/eclipse/jgit/util/BlockList;,"Lorg/eclipse/jgit/util/BlockList<Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;>;"
    :cond_2
    return-object v5
.end method

.method public getState()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;
    .locals 1

    .prologue
    .line 1084
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->state:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->snapshot()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;

    move-result-object v0

    return-object v0
.end method

.method public getStatistics()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    .locals 1

    .prologue
    .line 1079
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    return-object v0
.end method

.method public isDeltaBaseAsOffset()Z
    .locals 1

    .prologue
    .line 372
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->deltaBaseAsOffset:Z

    return v0
.end method

.method public isIgnoreMissingUninteresting()Z
    .locals 1

    .prologue
    .line 503
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ignoreMissingUninteresting:Z

    return v0
.end method

.method public isIndexDisabled()Z
    .locals 1

    .prologue
    .line 484
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->indexDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isReuseDeltaCommits()Z
    .locals 1

    .prologue
    .line 397
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltaCommits:Z

    return v0
.end method

.method public isReuseValidatingObjects()Z
    .locals 1

    .prologue
    .line 418
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseValidate:Z

    return v0
.end method

.method public isThin()Z
    .locals 1

    .prologue
    .line 436
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->thin:Z

    return v0
.end method

.method public isUseBitmaps()Z
    .locals 1

    .prologue
    .line 471
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->useBitmaps:Z

    return v0
.end method

.method public isUseCachedPacks()Z
    .locals 1

    .prologue
    .line 453
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->useCachedPacks:Z

    return v0
.end method

.method public prepareBitmapIndex(Lorg/eclipse/jgit/lib/ProgressMonitor;)Z
    .locals 14
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 2025
    iget-boolean v10, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->canBuildBitmaps:Z

    if-eqz v10, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J

    move-result-wide v10

    const-wide/32 v12, 0x7fffffff

    cmp-long v10, v10, v12

    if-gtz v10, :cond_0

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1

    :cond_0
    move v8, v9

    .line 2064
    :goto_0
    return v8

    .line 2029
    :cond_1
    if-nez p1, :cond_2

    .line 2030
    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 2032
    :cond_2
    new-instance v10, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortByName()Ljava/util/List;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;-><init>(Ljava/util/List;)V

    iput-object v10, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    .line 2033
    new-instance v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v11, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    iget-object v12, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    iget-object v12, v12, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->interestingObjects:Ljava/util/Set;

    invoke-direct {v1, v10, v11, p1, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;)V

    .line 2036
    .local v1, bitmapPreparer:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;
    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;

    aget-object v10, v10, v8

    invoke-virtual {v10}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    .line 2037
    .local v5, numCommits:I
    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->doCommitSelection(I)Ljava/util/Collection;

    move-result-object v6

    .line 2040
    .local v6, selectedCommits:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;>;"
    sget-object v10, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->BUILDING_BITMAPS:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v11

    int-to-long v11, v11

    invoke-direct {p0, v10, p1, v11, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V

    .line 2042
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->newBitmapWalker()Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;

    move-result-object v7

    .line 2043
    .local v7, walker:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;
    const/4 v4, 0x0

    .line 2044
    .local v4, last:Lorg/eclipse/jgit/lib/AnyObjectId;
    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;

    .line 2045
    .local v2, cmit:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->isReuseWalker()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 2046
    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->reset()V

    .line 2050
    :goto_2
    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->findObjects(Ljava/util/Set;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    move-result-object v0

    .line 2053
    .local v0, bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    if-eqz v4, :cond_4

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->isReuseWalker()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v0, v4}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 2054
    new-instance v10, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->bitmapMissingObject:Ljava/lang/String;

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->name()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v9

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v12, v8

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v10, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 2048
    .end local v0           #bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    :cond_3
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;->newBitmapWalker()Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;

    move-result-object v7

    goto :goto_2

    .line 2057
    .restart local v0       #bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    :cond_4
    move-object v4, v2

    .line 2058
    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->build()Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;

    move-result-object v11

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->getFlags()I

    move-result v12

    invoke-virtual {v10, v2, v11, v12}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->addBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;I)V

    .line 2060
    invoke-interface {p1, v8}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_1

    .line 2063
    .end local v0           #bitmap:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    .end local v2           #cmit:Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;
    :cond_5
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    goto/16 :goto_0
.end method

.method public preparePack(Ljava/util/Iterator;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevObject;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 646
    .local p1, objectsSource:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 647
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevObject;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0

    .line 649
    :cond_0
    return-void
.end method

.method public preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 2
    .parameter "countingMonitor"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 679
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p3, have:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-static {p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ensureSet(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v0

    invoke-static {p3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ensureSet(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 680
    return-void
.end method

.method public preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V
    .locals 3
    .parameter "countingMonitor"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 758
    .local p2, want:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->shallowPack:Z

    if-eqz v1, :cond_0

    .line 759
    new-instance v0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->depth:I

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;I)V

    .line 762
    .local v0, ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :goto_0
    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/revwalk/ObjectWalk;Ljava/util/Set;Ljava/util/Set;)V

    .line 763
    return-void

    .line 761
    .end local v0           #ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .restart local v0       #ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    goto :goto_0
.end method

.method public preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/revwalk/ObjectWalk;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 2
    .parameter "countingMonitor"
    .parameter "walk"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Lorg/eclipse/jgit/revwalk/ObjectWalk;",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 714
    .local p3, interestingObjects:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p4, uninterestingObjects:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-static {p3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ensureSet(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v0

    invoke-static {p4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ensureSet(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/revwalk/ObjectWalk;Ljava/util/Set;Ljava/util/Set;)V

    .line 717
    return-void
.end method

.method public preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/revwalk/ObjectWalk;Ljava/util/Set;Ljava/util/Set;)V
    .locals 2
    .parameter "countingMonitor"
    .parameter "walk"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Lorg/eclipse/jgit/revwalk/ObjectWalk;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 795
    .local p3, interestingObjects:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p4, uninterestingObjects:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    if-nez p1, :cond_0

    .line 796
    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 797
    :cond_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->shallowPack:Z

    if-eqz v0, :cond_1

    instance-of v0, p2, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;

    if-nez v0, :cond_1

    .line 798
    new-instance p2, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;

    .end local p2
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->depth:I

    invoke-direct {p2, v0, v1}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;I)V

    .line 799
    .restart local p2
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->findObjectsToPack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/revwalk/ObjectWalk;Ljava/util/Set;Ljava/util/Set;)V

    .line 801
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 1089
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 1090
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->myDeflater:Ljava/util/zip/Deflater;

    if-eqz v0, :cond_0

    .line 1091
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->myDeflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 1092
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->myDeflater:Ljava/util/zip/Deflater;

    .line 1094
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->instances:Ljava/util/Map;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->selfRef:Ljava/lang/ref/WeakReference;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1095
    return-void
.end method

.method public select(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)V
    .locals 9
    .parameter "otp"
    .parameter "next"

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 1951
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;->getFormat()I

    move-result v2

    .line 1953
    .local v2, nFmt:I
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_5

    .line 1954
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2001
    :cond_0
    :goto_0
    return-void

    .line 1956
    :cond_1
    if-ne v2, v7, :cond_4

    move v8, v7

    :goto_1
    if-nez v2, :cond_2

    move v6, v7

    :cond_2
    or-int/2addr v6, v8

    if-eqz v6, :cond_5

    .line 1957
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;

    .line 1958
    .local v4, pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    invoke-virtual {v4, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;->hasObject(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1959
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setEdge()V

    .line 1960
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearDeltaBase()V

    .line 1961
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    .line 1962
    iput-boolean v7, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->pruneCurrentObjectList:Z

    goto :goto_0

    .end local v1           #i$:Ljava/util/Iterator;
    .end local v4           #pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    :cond_4
    move v8, v6

    .line 1956
    goto :goto_1

    .line 1969
    :cond_5
    if-nez v2, :cond_8

    iget-boolean v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltas:Z

    if-eqz v6, :cond_8

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltaFor(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1970
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;->getDeltaBase()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 1971
    .local v0, baseId:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 1972
    .local v5, ptr:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    if-eqz v5, :cond_6

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v6

    if-nez v6, :cond_6

    .line 1973
    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1974
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setReuseAsIs()V

    .line 1999
    .end local v0           #baseId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #ptr:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :goto_2
    iget-boolean v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltas:Z

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;->wasDeltaAttempted()Z

    move-result v7

    and-int/2addr v6, v7

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDeltaAttempted(Z)V

    .line 2000
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->select(Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)V

    goto :goto_0

    .line 1975
    .restart local v0       #baseId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v5       #ptr:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_6
    iget-boolean v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->thin:Z

    if-eqz v6, :cond_7

    invoke-direct {p0, v5, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->have(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1976
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setDeltaBase(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1977
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setReuseAsIs()V

    goto :goto_2

    .line 1979
    :cond_7
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearDeltaBase()V

    .line 1980
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    goto :goto_2

    .line 1982
    .end local v0           #baseId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #ptr:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    :cond_8
    if-ne v2, v7, :cond_a

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v6}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseObjects()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 1983
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;->getWeight()I

    move-result v3

    .line 1984
    .local v3, nWeight:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isReuseAsIs()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v6

    if-nez v6, :cond_9

    .line 1988
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v6

    if-le v6, v3, :cond_0

    .line 1991
    :cond_9
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearDeltaBase()V

    .line 1992
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setReuseAsIs()V

    .line 1993
    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->setWeight(I)V

    goto :goto_2

    .line 1995
    .end local v3           #nWeight:I
    :cond_a
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearDeltaBase()V

    .line 1996
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->clearReuseAsIs()V

    goto :goto_2
.end method

.method public setDeltaBaseAsOffset(Z)V
    .locals 0
    .parameter "deltaBaseAsOffset"

    .prologue
    .line 387
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->deltaBaseAsOffset:Z

    .line 388
    return-void
.end method

.method public setIgnoreMissingUninteresting(Z)V
    .locals 0
    .parameter "ignore"

    .prologue
    .line 514
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->ignoreMissingUninteresting:Z

    .line 515
    return-void
.end method

.method public setIndexDisabled(Z)V
    .locals 0
    .parameter "noIndex"

    .prologue
    .line 492
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->indexDisabled:Z

    .line 493
    return-void
.end method

.method public setReuseDeltaCommits(Z)V
    .locals 0
    .parameter "reuse"

    .prologue
    .line 408
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltaCommits:Z

    .line 409
    return-void
.end method

.method public setReuseValidatingObjects(Z)V
    .locals 0
    .parameter "validate"

    .prologue
    .line 431
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseValidate:Z

    .line 432
    return-void
.end method

.method public setShallowPack(ILjava/util/Collection;)V
    .locals 1
    .parameter "depth"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 544
    .local p2, unshallow:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->shallowPack:Z

    .line 545
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->depth:I

    .line 546
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->unshallowObjects:Ljava/util/Collection;

    .line 547
    return-void
.end method

.method public setTagTargets(Ljava/util/Set;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 530
    .local p1, objects:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->tagTargets:Ljava/util/Set;

    .line 531
    return-void
.end method

.method public setThin(Z)V
    .locals 0
    .parameter "packthin"

    .prologue
    .line 448
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->thin:Z

    .line 449
    return-void
.end method

.method public setUseBitmaps(Z)V
    .locals 0
    .parameter "useBitmaps"

    .prologue
    .line 479
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->useBitmaps:Z

    .line 480
    return-void
.end method

.method public setUseCachedPacks(Z)V
    .locals 0
    .parameter "useCached"

    .prologue
    .line 466
    iput-boolean p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->useCachedPacks:Z

    .line 467
    return-void
.end method

.method public willInclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 2
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 813
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsMap:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .line 814
    .local v0, obj:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public writeBitmapIndex(Ljava/io/OutputStream;)V
    .locals 8
    .parameter "bitmapIndexStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 905
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    if-nez v3, :cond_0

    .line 906
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->bitmapsMustBePrepared:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 908
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 909
    .local v1, writeStart:J
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;-><init>(Ljava/io/OutputStream;)V

    .line 910
    .local v0, iw:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBitmaps:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->packcsum:[B

    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->write(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;[B)V

    .line 911
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    iget-wide v4, v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeWriting:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    add-long/2addr v4, v6

    iput-wide v4, v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeWriting:J

    .line 912
    return-void
.end method

.method public writeIndex(Ljava/io/OutputStream;)V
    .locals 8
    .parameter "indexStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 879
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->isIndexDisabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 880
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->cachedPacksPreventsIndexCreation:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 882
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 883
    .local v1, writeStart:J
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getIndexVersion()I

    move-result v3

    invoke-static {p1, v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->createVersion(Ljava/io/OutputStream;I)Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;

    move-result-object v0

    .line 885
    .local v0, iw:Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->sortByName()Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->packcsum:[B

    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->write(Ljava/util/List;[B)V

    .line 886
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    iget-wide v4, v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeWriting:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    add-long/2addr v4, v6

    iput-wide v4, v3, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeWriting:J

    .line 887
    return-void
.end method

.method writeObject(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 1
    .parameter "out"
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1490
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isWritten()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1491
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObjectImpl(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 1492
    :cond_0
    return-void
.end method

.method public writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    .locals 23
    .parameter "compressMonitor"
    .parameter "writeMonitor"
    .parameter "packStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 993
    if-nez p1, :cond_0

    .line 994
    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 995
    :cond_0
    if-nez p2, :cond_1

    .line 996
    sget-object p2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 998
    :cond_1
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPacks:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 999
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeInPackLast:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 1001
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    move-object/from16 v18, v0

    if-eqz v18, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseDeltas:Z

    move/from16 v18, v0

    if-nez v18, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isReuseObjects()Z

    move-result v18

    if-nez v18, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_8

    :cond_2
    const/4 v10, 0x1

    .line 1006
    .local v10, needSearchForReuse:Z
    :goto_0
    move-object/from16 v0, p1

    instance-of v0, v0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;

    move/from16 v18, v0

    if-eqz v18, :cond_4

    .line 1007
    const-wide/16 v4, 0x3e8

    .line 1008
    .local v4, delay:J
    if-eqz v10, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isDeltaCompress()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 1009
    const-wide/16 v4, 0x1f4

    :cond_3
    move-object/from16 v18, p1

    .line 1010
    check-cast v18, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;

    sget-object v19, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v4, v5, v1}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->setDelayStart(JLjava/util/concurrent/TimeUnit;)V

    .line 1015
    .end local v4           #delay:J
    :cond_4
    if-eqz v10, :cond_5

    .line 1016
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForReuse(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1017
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isDeltaCompress()Z

    move-result v18

    if-eqz v18, :cond_6

    .line 1018
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForDeltas(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1020
    :cond_6
    new-instance v18, Ljava/util/zip/CRC32;

    invoke-direct/range {v18 .. v18}, Ljava/util/zip/CRC32;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->crc32:Ljava/util/zip/CRC32;

    .line 1021
    new-instance v13, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->isIndexDisabled()Z

    move-result v18

    if-eqz v18, :cond_9

    .end local p3
    :goto_1
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p0

    invoke-direct {v13, v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;-><init>(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V

    .line 1028
    .local v13, out:Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J

    move-result-wide v11

    .line 1029
    .local v11, objCnt:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput-wide v11, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalObjects:J

    .line 1030
    sget-object v18, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->WRITING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v11, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->beginPhase(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;Lorg/eclipse/jgit/lib/ProgressMonitor;J)V

    .line 1031
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 1033
    .local v16, writeStart:J
    const/16 v18, 0x2

    move/from16 v0, v18

    invoke-virtual {v13, v0, v11, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeFileHeader(IJ)V

    .line 1034
    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->flush()V

    .line 1036
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V

    .line 1037
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->edgeObjects:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_b

    .line 1038
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    .local v3, arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    array-length v9, v3

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_2
    if-ge v8, v9, :cond_b

    aget-object v15, v3, v8

    .line 1039
    .local v15, typeStat:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    if-nez v15, :cond_a

    .line 1038
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 1001
    .end local v3           #arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    .end local v8           #i$:I
    .end local v9           #len$:I
    .end local v10           #needSearchForReuse:Z
    .end local v11           #objCnt:J
    .end local v13           #out:Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;
    .end local v15           #typeStat:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    .end local v16           #writeStart:J
    .restart local p3
    :cond_8
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 1021
    .restart local v10       #needSearchForReuse:Z
    :cond_9
    new-instance v18, Ljava/util/zip/CheckedOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->crc32:Ljava/util/zip/CRC32;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Ljava/util/zip/CheckedOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Checksum;)V

    move-object/from16 p3, v18

    goto :goto_1

    .line 1041
    .end local p3
    .restart local v3       #arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    .restart local v8       #i$:I
    .restart local v9       #len$:I
    .restart local v11       #objCnt:J
    .restart local v13       #out:Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;
    .restart local v15       #typeStat:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    .restart local v16       #writeStart:J
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->thinPackBytes:J

    move-wide/from16 v19, v0

    iget-wide v0, v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->bytes:J

    move-wide/from16 v21, v0

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->thinPackBytes:J

    goto :goto_3

    .line 1045
    .end local v3           #arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    .end local v8           #i$:I
    .end local v9           #len$:I
    .end local v15           #typeStat:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;

    .line 1046
    .local v14, pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    invoke-virtual {v14}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;->getDeltaCount()J

    move-result-wide v6

    .line 1047
    .local v6, deltaCnt:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedObjects:J

    move-wide/from16 v19, v0

    invoke-virtual {v14}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;->getObjectCount()J

    move-result-wide v21

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedObjects:J

    .line 1048
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedDeltas:J

    move-wide/from16 v19, v0

    add-long v19, v19, v6

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedDeltas:J

    .line 1049
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalDeltas:J

    move-wide/from16 v19, v0

    add-long v19, v19, v6

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalDeltas:J

    .line 1050
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseSupport:Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reuseValidate:Z

    move/from16 v19, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-interface {v0, v13, v14, v1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectReuseAsIs;->copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/CachedPack;Z)V

    goto :goto_4

    .line 1052
    .end local v6           #deltaCnt:J
    .end local v14           #pack:Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
    :cond_c
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeChecksum(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;)V

    .line 1053
    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->flush()V

    .line 1054
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    sub-long v19, v19, v16

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->timeWriting:J

    .line 1055
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    invoke-virtual {v13}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->length()J

    move-result-wide v19

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalBytes:J

    .line 1056
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->cachedPacks:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedPacks:Ljava/util/Collection;

    .line 1057
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->depth:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->depth:I

    .line 1059
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->objectTypes:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;

    .restart local v3       #arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    array-length v9, v3

    .restart local v9       #len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_5
    if-ge v8, v9, :cond_e

    aget-object v15, v3, v8

    .line 1060
    .restart local v15       #typeStat:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    if-nez v15, :cond_d

    .line 1059
    :goto_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 1062
    :cond_d
    iget-wide v0, v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntDeltas:J

    move-wide/from16 v18, v0

    iget-wide v0, v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedDeltas:J

    move-wide/from16 v20, v0

    add-long v18, v18, v20

    move-wide/from16 v0, v18

    iput-wide v0, v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntDeltas:J

    .line 1064
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedObjects:J

    move-wide/from16 v19, v0

    iget-wide v0, v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedObjects:J

    move-wide/from16 v21, v0

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedObjects:J

    .line 1065
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedDeltas:J

    move-wide/from16 v19, v0

    iget-wide v0, v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->reusedDeltas:J

    move-wide/from16 v21, v0

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->reusedDeltas:J

    .line 1066
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalDeltas:J

    move-wide/from16 v19, v0

    iget-wide v0, v15, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;->cntDeltas:J

    move-wide/from16 v21, v0

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v18

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->totalDeltas:J

    goto :goto_6

    .line 1069
    .end local v15           #typeStat:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics$ObjectType;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 1070
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->endPhase(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 1071
    return-void
.end method
