.class public Lorg/eclipse/jgit/transport/UploadPack;
.super Ljava/lang/Object;
.source "UploadPack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/UploadPack$1;,
        Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;,
        Lorg/eclipse/jgit/transport/UploadPack$AnyRequestValidator;,
        Lorg/eclipse/jgit/transport/UploadPack$FirstLine;,
        Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitRequestValidator;,
        Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;,
        Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;,
        Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;,
        Lorg/eclipse/jgit/transport/UploadPack$TipRequestValidator;
    }
.end annotation


# instance fields
.field private final COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final SATISFIED:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final SAVE:Lorg/eclipse/jgit/revwalk/RevFlagSet;

.field private final WANT:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

.field private advertised:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private biDirectionalPipe:Z

.field private final clientShallowCommits:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final commonBase:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevObject;",
            ">;"
        }
    .end annotation
.end field

.field private final db:Lorg/eclipse/jgit/lib/Repository;

.field private depth:I

.field private logger:Lorg/eclipse/jgit/transport/UploadPackLogger;

.field private msgOut:Ljava/io/OutputStream;

.field private multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

.field private noDone:Z

.field private okToGiveUp:Ljava/lang/Boolean;

.field private oldestTime:I

.field private options:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field private pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

.field private pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

.field private preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

.field private rawIn:Ljava/io/InputStream;

.field private rawOut:Ljava/io/OutputStream;

.field private refFilter:Lorg/eclipse/jgit/transport/RefFilter;

.field private refs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

.field private sentReady:Z

.field private statistics:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

.field private timeout:I

.field private timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

.field private transferConfig:Lorg/eclipse/jgit/transport/TransferConfig;

.field private final unshallowCommits:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final walk:Lorg/eclipse/jgit/revwalk/RevWalk;

.field private final wantAll:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevObject;",
            ">;"
        }
    .end annotation
.end field

.field private final wantIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "copyFrom"

    .prologue
    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    .line 240
    sget-object v0, Lorg/eclipse/jgit/util/io/NullOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    .line 246
    sget-object v0, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    .line 249
    sget-object v0, Lorg/eclipse/jgit/transport/RefFilter;->DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    .line 252
    sget-object v0, Lorg/eclipse/jgit/transport/PreUploadHook;->NULL:Lorg/eclipse/jgit/transport/PreUploadHook;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    .line 258
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    .line 261
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    .line 264
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    .line 267
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->clientShallowCommits:Ljava/util/Set;

    .line 270
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->unshallowCommits:Ljava/util/List;

    .line 300
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    .line 302
    sget-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    .line 308
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPackLogger;->NULL:Lorg/eclipse/jgit/transport/UploadPackLogger;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->logger:Lorg/eclipse/jgit/transport/UploadPackLogger;

    .line 317
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 318
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 319
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 321
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v1, "WANT"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->WANT:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 322
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v1, "PEER_HAS"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 323
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v1, "COMMON"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 324
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v1, "SATISFIED"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->SATISFIED:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 325
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 327
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/RevFlagSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->SAVE:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    .line 328
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->SAVE:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->WANT:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 329
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->SAVE:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 330
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->SAVE:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 331
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->SAVE:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->SATISFIED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevFlagSet;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    .line 333
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->setTransferConfig(Lorg/eclipse/jgit/transport/TransferConfig;)V

    .line 334
    return-void
.end method

.method static synthetic access$000(Ljava/util/Collection;)Ljava/util/Set;
    .locals 1
    .parameter "x0"

    .prologue
    .line 105
    invoke-static {p0}, Lorg/eclipse/jgit/transport/UploadPack;->refIdSet(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/List;Ljava/util/Set;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-static {p0, p1, p2}, Lorg/eclipse/jgit/transport/UploadPack;->checkNotAdvertisedWants(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/List;Ljava/util/Set;)V

    return-void
.end method

.method private addCommonBase(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "o"

    .prologue
    .line 1204
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1205
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1206
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1207
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUp:Ljava/lang/Boolean;

    .line 1209
    :cond_0
    return-void
.end method

.method private static checkNotAdvertisedWants(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/List;Ljava/util/Set;)V
    .locals 12
    .parameter "walk"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revwalk/RevWalk;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Set",
            "<",
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
    .local p1, notAdvertisedWants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p2, reachableFrom:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v11, 0x0

    const/4 v9, 0x1

    .line 1170
    invoke-virtual {p0, p1, v9}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;

    move-result-object v6

    .line 1173
    .local v6, q:Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
    :goto_0
    :try_start_0
    invoke-interface {v6}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->next()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    .local v5, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v5, :cond_1

    .line 1174
    instance-of v7, v5, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v7, :cond_0

    .line 1175
    new-instance v7, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->wantNotValid:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1179
    .end local v5           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catch_0
    move-exception v4

    .line 1180
    .local v4, notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    :try_start_1
    invoke-virtual {v4}, Lorg/eclipse/jgit/errors/MissingObjectException;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 1181
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v7, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->wantNotValid:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v4}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1184
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catchall_0
    move-exception v7

    invoke-interface {v6}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    throw v7

    .line 1177
    .restart local v5       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_0
    :try_start_2
    check-cast v5, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v5           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 1184
    .restart local v5       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_1
    invoke-interface {v6}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    .line 1186
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1188
    .restart local v2       #id:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_3
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_3
    .catch Lorg/eclipse/jgit/errors/IncorrectObjectTypeException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 1189
    :catch_1
    move-exception v3

    .line 1190
    .local v3, notCommit:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    goto :goto_1

    .line 1194
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #notCommit:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 1195
    .local v0, bad:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v0, :cond_3

    .line 1196
    new-instance v7, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->wantNotValid:Ljava/lang/String;

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1200
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 1201
    return-void
.end method

.method private getAdvertisedOrDefaultRefs()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 655
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 656
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->setAdvertisedRefs(Ljava/util/Map;)V

    .line 657
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    return-object v0
.end method

.method private negotiate()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 886
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUp:Ljava/lang/Boolean;

    .line 888
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 889
    .local v1, last:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v3, Ljava/util/ArrayList;

    const/16 v6, 0x40

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 893
    .local v3, peerHas:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_0
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 905
    .local v2, line:Ljava/lang/String;
    sget-object v6, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    if-ne v2, v6, :cond_6

    .line 906
    invoke-direct {p0, v3, v1}, Lorg/eclipse/jgit/transport/UploadPack;->processHaveLines(Ljava/util/List;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 907
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    sget-object v7, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    if-eq v6, v7, :cond_1

    .line 908
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    const-string v7, "NAK\n"

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 909
    :cond_1
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->noDone:Z

    if-eqz v6, :cond_4

    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->sentReady:Z

    if-eqz v6, :cond_4

    .line 910
    iget-object v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ACK "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 929
    .end local v2           #line:Ljava/lang/String;
    :cond_2
    :goto_1
    return v4

    .line 894
    :catch_0
    move-exception v0

    .line 900
    .local v0, eof:Ljava/io/EOFException;
    iget-boolean v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    if-nez v4, :cond_3

    iget v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    if-lez v4, :cond_3

    move v4, v5

    .line 901
    goto :goto_1

    .line 902
    :cond_3
    throw v0

    .line 913
    .end local v0           #eof:Ljava/io/EOFException;
    .restart local v2       #line:Ljava/lang/String;
    :cond_4
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    if-nez v6, :cond_5

    move v4, v5

    .line 914
    goto :goto_1

    .line 915
    :cond_5
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/PacketLineOut;->flush()V

    goto :goto_0

    .line 917
    :cond_6
    const-string v6, "have "

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x2d

    if-ne v6, v7, :cond_7

    .line 918
    const/4 v6, 0x5

    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 920
    :cond_7
    const-string v6, "done"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 921
    invoke-direct {p0, v3, v1}, Lorg/eclipse/jgit/transport/UploadPack;->processHaveLines(Ljava/util/List;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 923
    iget-object v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 924
    iget-object v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    const-string v6, "NAK\n"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    goto :goto_1

    .line 926
    :cond_8
    iget-object v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    sget-object v6, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    if-eq v5, v6, :cond_2

    .line 927
    iget-object v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ACK "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    goto :goto_1

    .line 932
    :cond_9
    new-instance v6, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->expectedGot:Ljava/lang/String;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const-string v9, "have"

    aput-object v9, v8, v5

    aput-object v2, v8, v4

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v4}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private okToGiveUp()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/PackProtocolException;
        }
    .end annotation

    .prologue
    .line 1212
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUp:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 1213
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUpImp()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUp:Ljava/lang/Boolean;

    .line 1214
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUp:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private okToGiveUpImp()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/PackProtocolException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1218
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1226
    :goto_0
    return v3

    .line 1222
    :cond_0
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 1223
    .local v2, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/UploadPack;->wantSatisfied(Lorg/eclipse/jgit/revwalk/RevObject;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .line 1226
    .end local v2           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_2
    const/4 v3, 0x1

    goto :goto_0

    .line 1227
    .end local v1           #i$:Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 1228
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->internalRevisionError:Ljava/lang/String;

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private parseWants()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 1040
    const/4 v2, 0x0

    .line 1041
    .local v2, notAdvertisedWants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1042
    .local v4, obj:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertised:Ljava/util/Set;

    invoke-interface {v6, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1043
    if-nez v2, :cond_1

    .line 1044
    new-instance v2, Ljava/util/ArrayList;

    .end local v2           #notAdvertisedWants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1045
    .restart local v2       #notAdvertisedWants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_1
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1048
    .end local v4           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    if-eqz v2, :cond_3

    .line 1049
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    invoke-interface {v6, p0, v2}, Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;->checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V

    .line 1051
    :cond_3
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    invoke-virtual {v6, v7, v8}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;

    move-result-object v5

    .line 1054
    .local v5, q:Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
    :cond_4
    :goto_1
    :try_start_0
    invoke-interface {v5}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->next()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    .local v4, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v4, :cond_6

    .line 1055
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/UploadPack;->want(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 1057
    instance-of v6, v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v6, :cond_5

    .line 1058
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->SATISFIED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1059
    :cond_5
    instance-of v6, v4, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v6, :cond_4

    .line 1060
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v6, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    .line 1061
    instance-of v6, v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v6, :cond_4

    .line 1062
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/UploadPack;->want(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1066
    .end local v4           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catch_0
    move-exception v3

    .line 1067
    .local v3, notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    :try_start_1
    invoke-virtual {v3}, Lorg/eclipse/jgit/errors/MissingObjectException;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 1068
    .local v1, id:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v6, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->wantNotValid:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v3}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1071
    .end local v1           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catchall_0
    move-exception v6

    invoke-interface {v5}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    throw v6

    .line 1065
    .restart local v4       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_6
    :try_start_2
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    invoke-interface {v6}, Ljava/util/Set;->clear()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1071
    invoke-interface {v5}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    .line 1073
    return-void
.end method

.method private processHaveLines(Ljava/util/List;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 15
    .parameter
    .parameter "last"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ")",
            "Lorg/eclipse/jgit/lib/ObjectId;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 939
    .local p1, peerHas:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v1, p0, v2, v3}, Lorg/eclipse/jgit/transport/PreUploadHook;->onBeginNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;I)V

    .line 940
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 941
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->parseWants()V

    .line 942
    :cond_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    move-object/from16 v11, p2

    .line 1036
    .end local p2
    .local v11, last:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_0
    return-object v11

    .line 945
    .end local v11           #last:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local p2
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->sentReady:Z

    .line 946
    const/4 v4, 0x0

    .line 947
    .local v4, haveCnt:I
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->setAvoidUnreachableObjects(Z)V

    .line 948
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const/4 v2, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;

    move-result-object v14

    .line 953
    .local v14, q:Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
    :cond_2
    :goto_1
    :try_start_0
    invoke-interface {v14}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->next()Lorg/eclipse/jgit/revwalk/RevObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v13

    .line 957
    .local v13, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    if-nez v13, :cond_5

    .line 993
    invoke-interface {v14}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    .line 994
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->setAvoidUnreachableObjects(Z)V

    .line 997
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v1

    sub-int v5, v1, v4

    .line 1003
    .local v5, missCnt:I
    const/4 v8, 0x0

    .line 1004
    .local v8, didOkToGiveUp:Z
    if-lez v5, :cond_3

    .line 1005
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v9, v1, -0x1

    .local v9, i:I
    :goto_2
    if-ltz v9, :cond_3

    .line 1006
    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1007
    .local v10, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupOrNull(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    if-nez v1, :cond_9

    .line 1008
    const/4 v8, 0x1

    .line 1009
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUp()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1010
    sget-object v1, Lorg/eclipse/jgit/transport/UploadPack$1;->$SwitchMap$org$eclipse$jgit$transport$GitProtocolConstants$MultiAck:[I

    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 1027
    .end local v9           #i:I
    .end local v10           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    :goto_3
    :pswitch_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    sget-object v2, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->DETAILED:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    if-ne v1, v2, :cond_4

    if-nez v8, :cond_4

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->okToGiveUp()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1028
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1029
    .restart local v10       #id:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->sentReady:Z

    .line 1030
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ready\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 1031
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->sentReady:Z

    .line 1034
    .end local v10           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_4
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->sentReady:Z

    move-object v2, p0

    invoke-interface/range {v1 .. v6}, Lorg/eclipse/jgit/transport/PreUploadHook;->onEndNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;IIZ)V

    .line 1035
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->clear()V

    move-object/from16 v11, p2

    .line 1036
    .end local p2
    .restart local v11       #last:Lorg/eclipse/jgit/lib/ObjectId;
    goto/16 :goto_0

    .line 954
    .end local v5           #missCnt:I
    .end local v8           #didOkToGiveUp:Z
    .end local v11           #last:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v13           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    .restart local p2
    :catch_0
    move-exception v12

    .line 955
    .local v12, notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    goto/16 :goto_1

    .line 960
    .end local v12           #notFound:Lorg/eclipse/jgit/errors/MissingObjectException;
    .restart local v13       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_5
    move-object/from16 p2, v13

    .line 961
    add-int/lit8 v4, v4, 0x1

    .line 963
    :try_start_1
    instance-of v1, v13, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v1, :cond_7

    .line 964
    move-object v0, v13

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object v7, v0

    .line 965
    .local v7, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->oldestTime:I

    if-eqz v1, :cond_6

    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v1

    iget v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->oldestTime:I

    if-ge v1, v2, :cond_7

    .line 966
    :cond_6
    invoke-virtual {v7}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->oldestTime:I

    .line 969
    .end local v7           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_7
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v13, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 972
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v13, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 973
    instance-of v1, v13, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v1, :cond_8

    .line 974
    move-object v0, v13

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object v1, v0

    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 975
    :cond_8
    invoke-direct {p0, v13}, Lorg/eclipse/jgit/transport/UploadPack;->addCommonBase(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 979
    sget-object v1, Lorg/eclipse/jgit/transport/UploadPack$1;->$SwitchMap$org$eclipse$jgit$transport$GitProtocolConstants$MultiAck:[I

    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1

    goto/16 :goto_1

    .line 981
    :pswitch_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 982
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    .line 993
    .end local v13           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catchall_0
    move-exception v1

    invoke-interface {v14}, Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;->release()V

    .line 994
    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectReader;->setAvoidUnreachableObjects(Z)V

    throw v1

    .line 985
    .restart local v13       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :pswitch_2
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " continue\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 988
    :pswitch_3
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " common\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_1

    .line 1014
    .restart local v5       #missCnt:I
    .restart local v8       #didOkToGiveUp:Z
    .restart local v9       #i:I
    .restart local v10       #id:Lorg/eclipse/jgit/lib/ObjectId;
    :pswitch_4
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " continue\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1017
    :pswitch_5
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACK "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ready\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 1018
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->sentReady:Z

    goto/16 :goto_3

    .line 1005
    :cond_9
    add-int/lit8 v9, v9, -0x1

    goto/16 :goto_2

    .line 1010
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 979
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private processShallow()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 738
    new-instance v1, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v4

    iget v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    invoke-direct {v1, v4, v5}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;I)V

    .line 742
    .local v1, depthWalk:Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/ObjectId;

    .line 744
    .local v3, o:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_0
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->markRoot(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/IncorrectObjectTypeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 745
    :catch_0
    move-exception v4

    goto :goto_0

    .line 751
    .end local v3           #o:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    :goto_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/DepthWalk$RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    .local v3, o:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v3, :cond_2

    move-object v0, v3

    .line 752
    check-cast v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    .line 756
    .local v0, c:Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->getDepth()I

    move-result v4

    iget v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    if-ne v4, v5, :cond_1

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->clientShallowCommits:Ljava/util/Set;

    invoke-interface {v4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 757
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "shallow "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 761
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->getDepth()I

    move-result v4

    iget v5, p0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    if-ge v4, v5, :cond_0

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->clientShallowCommits:Ljava/util/Set;

    invoke-interface {v4, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 762
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->unshallowCommits:Ljava/util/List;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 763
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unshallow "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    goto :goto_1

    .line 767
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;
    :cond_2
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 768
    return-void
.end method

.method private recvWants()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2d

    .line 844
    const/4 v2, 0x1

    .line 848
    .local v2, isFirst:Z
    :goto_0
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 855
    .local v3, line:Ljava/lang/String;
    sget-object v4, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    if-ne v3, v4, :cond_1

    .line 883
    .end local v3           #line:Ljava/lang/String;
    :cond_0
    return-void

    .line 849
    :catch_0
    move-exception v0

    .line 850
    .local v0, eof:Ljava/io/EOFException;
    if-nez v2, :cond_0

    .line 852
    throw v0

    .line 858
    .end local v0           #eof:Ljava/io/EOFException;
    .restart local v3       #line:Ljava/lang/String;
    :cond_1
    const-string v4, "deepen "

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 859
    const/4 v4, 0x7

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    goto :goto_0

    .line 863
    :cond_2
    const-string v4, "shallow "

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 864
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->clientShallowCommits:Ljava/util/Set;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 868
    :cond_3
    const-string v4, "want "

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v4, v6, :cond_5

    .line 869
    :cond_4
    new-instance v4, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->expectedGot:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "want"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v3, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 871
    :cond_5
    if-eqz v2, :cond_6

    .line 872
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v6, :cond_7

    .line 873
    new-instance v1, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;

    invoke-direct {v1, v3}, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;-><init>(Ljava/lang/String;)V

    .line 874
    .local v1, firstLine:Lorg/eclipse/jgit/transport/UploadPack$FirstLine;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->getOptions()Ljava/util/Set;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    .line 875
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/UploadPack$FirstLine;->getLine()Ljava/lang/String;

    move-result-object v3

    .line 880
    .end local v1           #firstLine:Lorg/eclipse/jgit/transport/UploadPack$FirstLine;
    :cond_6
    :goto_1
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    const/4 v5, 0x5

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 881
    const/4 v2, 0x0

    .line 882
    goto/16 :goto_0

    .line 877
    :cond_7
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    goto :goto_1
.end method

.method private static refIdSet(Ljava/util/Collection;)Ljava/util/Set;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 721
    .local p0, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(I)V

    .line 722
    .local v1, ids:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 723
    .local v2, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 724
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 726
    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return-object v1
.end method

.method private reportErrorDuringNegotiate(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 731
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ERR "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 735
    :goto_0
    return-void

    .line 732
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private reportInternalServerErrorOverSideband()Z
    .locals 5

    .prologue
    .line 1297
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    const/4 v2, 0x3

    const/16 v3, 0x3e8

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    invoke-direct {v1, v2, v3, v4}, Lorg/eclipse/jgit/transport/SideBandOutputStream;-><init>(IILjava/io/OutputStream;)V

    .line 1301
    .local v1, err:Lorg/eclipse/jgit/transport/SideBandOutputStream;
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->internalServerError:Ljava/lang/String;

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->write([B)V

    .line 1302
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1303
    const/4 v2, 0x1

    .line 1306
    .end local v1           #err:Lorg/eclipse/jgit/transport/SideBandOutputStream;
    :goto_0
    return v2

    .line 1304
    :catch_0
    move-exception v0

    .line 1306
    .local v0, cannotReport:Ljava/lang/Throwable;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private sendPack()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1254
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    const-string v7, "side-band"

    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    const-string v7, "side-band-64k"

    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    :cond_0
    move v3, v5

    .line 1257
    .local v3, sideband:Z
    :goto_0
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    if-nez v6, :cond_2

    .line 1260
    iget-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawIn:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 1261
    .local v0, eof:I
    if-ltz v0, :cond_2

    .line 1262
    new-instance v6, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->expectedEOFReceived:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\\x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v4

    invoke-static {v7, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v6

    .end local v0           #eof:I
    .end local v3           #sideband:Z
    :cond_1
    move v3, v4

    .line 1254
    goto :goto_0

    .line 1267
    .restart local v3       #sideband:Z
    :cond_2
    if-eqz v3, :cond_6

    .line 1269
    const/4 v4, 0x1

    :try_start_0
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/UploadPack;->sendPack(Z)V
    :try_end_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_3

    .line 1292
    :goto_1
    return-void

    .line 1270
    :catch_0
    move-exception v2

    .line 1272
    .local v2, noPack:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    throw v2

    .line 1273
    .end local v2           #noPack:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    :catch_1
    move-exception v1

    .line 1274
    .local v1, err:Ljava/io/IOException;
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->reportInternalServerErrorOverSideband()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1275
    new-instance v4, Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;

    invoke-direct {v4, v1}, Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 1277
    :cond_3
    throw v1

    .line 1278
    .end local v1           #err:Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 1279
    .local v1, err:Ljava/lang/RuntimeException;
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->reportInternalServerErrorOverSideband()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1280
    new-instance v4, Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;

    invoke-direct {v4, v1}, Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 1282
    :cond_4
    throw v1

    .line 1283
    .end local v1           #err:Ljava/lang/RuntimeException;
    :catch_3
    move-exception v1

    .line 1284
    .local v1, err:Ljava/lang/Error;
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->reportInternalServerErrorOverSideband()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1285
    new-instance v4, Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;

    invoke-direct {v4, v1}, Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 1287
    :cond_5
    throw v1

    .line 1290
    .end local v1           #err:Ljava/lang/Error;
    :cond_6
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/UploadPack;->sendPack(Z)V

    goto :goto_1
.end method

.method private sendPack(Z)V
    .locals 23
    .parameter "sideband"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1311
    sget-object v15, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 1312
    .local v15, pm:Lorg/eclipse/jgit/lib/ProgressMonitor;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    .line 1314
    .local v13, packOut:Ljava/io/OutputStream;
    if-eqz p1, :cond_1

    .line 1315
    const/16 v4, 0x3e8

    .line 1316
    .local v4, bufsz:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    move-object/from16 v20, v0

    const-string v21, "side-band-64k"

    invoke-interface/range {v20 .. v21}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 1317
    const v4, 0xfff0

    .line 1319
    :cond_0
    new-instance v13, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    .end local v13           #packOut:Ljava/io/OutputStream;
    const/16 v20, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    move-object/from16 v21, v0

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v13, v0, v4, v1}, Lorg/eclipse/jgit/transport/SideBandOutputStream;-><init>(IILjava/io/OutputStream;)V

    .line 1321
    .restart local v13       #packOut:Ljava/io/OutputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    move-object/from16 v20, v0

    const-string v21, "no-progress"

    invoke-interface/range {v20 .. v21}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_1

    .line 1322
    new-instance v20, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    const/16 v21, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v4, v2}, Lorg/eclipse/jgit/transport/SideBandOutputStream;-><init>(IILjava/io/OutputStream;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    .line 1324
    new-instance v15, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;

    .end local v15           #pm:Lorg/eclipse/jgit/lib/ProgressMonitor;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-direct {v15, v0}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;-><init>(Ljava/io/OutputStream;)V

    .line 1329
    .end local v4           #bufsz:I
    .restart local v15       #pm:Lorg/eclipse/jgit/lib/ProgressMonitor;
    :cond_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_4

    .line 1330
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/jgit/transport/PreUploadHook;->onSendPack(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 1334
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1348
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/transport/UploadPack;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 1349
    .local v5, cfg:Lorg/eclipse/jgit/storage/pack/PackConfig;
    if-nez v5, :cond_2

    .line 1350
    new-instance v5, Lorg/eclipse/jgit/storage/pack/PackConfig;

    .end local v5           #cfg:Lorg/eclipse/jgit/storage/pack/PackConfig;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 1351
    .restart local v5       #cfg:Lorg/eclipse/jgit/storage/pack/PackConfig;
    :cond_2
    new-instance v16, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v20

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v5, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 1353
    .local v16, pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    const/16 v20, 0x1

    :try_start_1
    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setIndexDisabled(Z)V

    .line 1354
    const/16 v20, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setUseCachedPacks(Z)V

    .line 1355
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    move/from16 v20, v0

    if-nez v20, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->clientShallowCommits:Ljava/util/Set;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_6

    const/16 v20, 0x1

    :goto_1
    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setUseBitmaps(Z)V

    .line 1356
    const/16 v20, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseDeltaCommits(Z)V

    .line 1357
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    move-object/from16 v20, v0

    const-string v21, "ofs-delta"

    invoke-interface/range {v20 .. v21}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setDeltaBaseAsOffset(Z)V

    .line 1358
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    move-object/from16 v20, v0

    const-string v21, "thin-pack"

    invoke-interface/range {v20 .. v21}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setThin(Z)V

    .line 1359
    const/16 v20, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseValidatingObjects(Z)V

    .line 1361
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    move-object/from16 v20, v0

    if-eqz v20, :cond_9

    .line 1362
    new-instance v19, Ljava/util/HashSet;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashSet;-><init>()V

    .line 1363
    .local v19, tagTargets:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/eclipse/jgit/lib/Ref;

    .line 1364
    .local v17, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    if-eqz v20, :cond_7

    .line 1365
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 1425
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v17           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v19           #tagTargets:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :catchall_0
    move-exception v20

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    throw v20

    .line 1332
    .end local v5           #cfg:Lorg/eclipse/jgit/storage/pack/PackConfig;
    .end local v16           #pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/jgit/transport/PreUploadHook;->onSendPack(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;Ljava/util/Collection;)V
    :try_end_2
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 1335
    :catch_0
    move-exception v9

    .line 1336
    .local v9, noPack:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    if-eqz p1, :cond_5

    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v20

    if-eqz v20, :cond_5

    .line 1337
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->setOutput()V

    .line 1339
    new-instance v6, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    const/16 v20, 0x3

    const/16 v21, 0x3e8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    move-object/from16 v22, v0

    move/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v6, v0, v1, v2}, Lorg/eclipse/jgit/transport/SideBandOutputStream;-><init>(IILjava/io/OutputStream;)V

    .line 1342
    .local v6, err:Lorg/eclipse/jgit/transport/SideBandOutputStream;
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->write([B)V

    .line 1343
    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->flush()V

    .line 1345
    .end local v6           #err:Lorg/eclipse/jgit/transport/SideBandOutputStream;
    :cond_5
    throw v9

    .line 1355
    .end local v9           #noPack:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    .restart local v5       #cfg:Lorg/eclipse/jgit/storage/pack/PackConfig;
    .restart local v16       #pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :cond_6
    const/16 v20, 0x0

    goto/16 :goto_1

    .line 1366
    .restart local v7       #i$:Ljava/util/Iterator;
    .restart local v17       #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v19       #tagTargets:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_7
    :try_start_3
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    if-eqz v20, :cond_3

    .line 1368
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v20

    const-string v21, "refs/heads/"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 1369
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 1371
    .end local v17           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_8
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setTagTargets(Ljava/util/Set;)V

    .line 1374
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v19           #tagTargets:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_9
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    move/from16 v20, v0

    if-lez v20, :cond_a

    .line 1375
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->unshallowCommits:Ljava/util/List;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setShallowPack(ILjava/util/Collection;)V

    .line 1377
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v18, v0

    .line 1378
    .local v18, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_e

    .line 1379
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v15, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 1388
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    move-object/from16 v20, v0

    const-string v21, "include-tag"

    invoke-interface/range {v20 .. v21}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    move-object/from16 v20, v0

    if-eqz v20, :cond_10

    .line 1389
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7       #i$:Ljava/util/Iterator;
    :cond_b
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_10

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/eclipse/jgit/lib/Ref;

    .line 1390
    .restart local v17       #ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    .line 1393
    .local v11, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_f

    .line 1394
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_b

    .line 1402
    :cond_c
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v20

    if-nez v20, :cond_d

    .line 1403
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v17

    .line 1405
    :cond_d
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    .line 1406
    .local v14, peeledId:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v14, :cond_b

    .line 1409
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    .line 1410
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->willInclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v20

    if-eqz v20, :cond_b

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->willInclude(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v20

    if-nez v20, :cond_b

    .line 1411
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v20

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_4

    .line 1381
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v11           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v14           #peeledId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v17           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 1383
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/revwalk/RevWalk;->toObjectWalkWithSameObjects()Lorg/eclipse/jgit/revwalk/ObjectWalk;

    move-result-object v12

    .line 1384
    .local v12, ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->commonBase:Ljava/util/Set;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v15, v12, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/revwalk/ObjectWalk;Ljava/util/Set;Ljava/util/Set;)V

    .line 1385
    move-object/from16 v18, v12

    goto/16 :goto_3

    .line 1397
    .end local v12           #ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    .restart local v7       #i$:Ljava/util/Iterator;
    .restart local v11       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v17       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_f
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupOrNull(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v10

    .line 1398
    .local v10, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v10, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->WANT:Lorg/eclipse/jgit/revwalk/RevFlag;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v20

    if-eqz v20, :cond_c

    goto/16 :goto_4

    .line 1415
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v10           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v11           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v17           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_10
    sget-object v20, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v15, v1, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V

    .line 1416
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getStatistics()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/transport/UploadPack;->statistics:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    .line 1418
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    move-object/from16 v20, v0

    sget-object v21, Lorg/eclipse/jgit/util/io/NullOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_11

    .line 1419
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getStatistics()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;->getMessage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0xa

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1420
    .local v8, msg:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    move-object/from16 v20, v0

    invoke-static {v8}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/OutputStream;->write([B)V

    .line 1421
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1425
    .end local v8           #msg:Ljava/lang/String;
    :cond_11
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 1428
    if-eqz p1, :cond_12

    .line 1429
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 1431
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->statistics:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v20, v0

    if-eqz v20, :cond_13

    .line 1432
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->logger:Lorg/eclipse/jgit/transport/UploadPackLogger;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/UploadPack;->statistics:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-object/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Lorg/eclipse/jgit/transport/UploadPackLogger;->onPackStatistics(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;)V

    .line 1433
    :cond_13
    return-void
.end method

.method private service()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 661
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    if-eqz v0, :cond_1

    .line 662
    new-instance v0, Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/RefAdvertiser$PacketLineOutRefAdvertiser;-><init>(Lorg/eclipse/jgit/transport/PacketLineOut;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->sendAdvertisedRefs(Lorg/eclipse/jgit/transport/RefAdvertiser;)V

    .line 670
    :goto_0
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->recvWants()V

    .line 671
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 672
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    const/4 v2, 0x0

    invoke-interface {v0, p0, v1, v2}, Lorg/eclipse/jgit/transport/PreUploadHook;->onBeginNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;I)V

    .line 673
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantIds:Ljava/util/Set;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lorg/eclipse/jgit/transport/PreUploadHook;->onEndNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;IIZ)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/PackProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_4

    .line 718
    :cond_0
    :goto_1
    return-void

    .line 663
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    instance-of v0, v0, Lorg/eclipse/jgit/transport/UploadPack$AnyRequestValidator;

    if-eqz v0, :cond_2

    .line 664
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertised:Ljava/util/Set;

    goto :goto_0

    .line 666
    :cond_2
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->getAdvertisedOrDefaultRefs()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/transport/UploadPack;->refIdSet(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertised:Ljava/util/Set;

    goto :goto_0

    .line 677
    :cond_3
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    const-string v1, "multi_ack_detailed"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 678
    sget-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->DETAILED:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    .line 679
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    const-string v1, "no-done"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->noDone:Z

    .line 685
    :goto_2
    iget v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->depth:I

    if-eqz v0, :cond_4

    .line 686
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->processShallow()V

    .line 687
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->clientShallowCommits:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 688
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->clientShallowCommits:Ljava/util/Set;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->assumeShallow(Ljava/util/Collection;)V

    .line 689
    :cond_5
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->negotiate()Z
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/PackProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_4

    move-result v7

    .line 716
    .local v7, sendPack:Z
    if-eqz v7, :cond_0

    .line 717
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->sendPack()V

    goto :goto_1

    .line 680
    .end local v7           #sendPack:Z
    :cond_6
    :try_start_2
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    const-string v1, "multi_ack"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 681
    sget-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->CONTINUE:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;
    :try_end_2
    .catch Lorg/eclipse/jgit/errors/PackProtocolException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_2

    .line 690
    :catch_0
    move-exception v6

    .line 691
    .local v6, err:Lorg/eclipse/jgit/errors/PackProtocolException;
    invoke-virtual {v6}, Lorg/eclipse/jgit/errors/PackProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->reportErrorDuringNegotiate(Ljava/lang/String;)V

    .line 692
    throw v6

    .line 683
    .end local v6           #err:Lorg/eclipse/jgit/errors/PackProtocolException;
    :cond_7
    :try_start_3
    sget-object v0, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;
    :try_end_3
    .catch Lorg/eclipse/jgit/errors/PackProtocolException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_2

    .line 694
    :catch_1
    move-exception v6

    .line 695
    .local v6, err:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->isOutput()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 697
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ERR "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 698
    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->setOutput()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_5

    .line 703
    :cond_8
    :goto_3
    throw v6

    .line 705
    .end local v6           #err:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    :catch_2
    move-exception v6

    .line 706
    .local v6, err:Ljava/io/IOException;
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->internalServerError:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->reportErrorDuringNegotiate(Ljava/lang/String;)V

    .line 707
    throw v6

    .line 708
    .end local v6           #err:Ljava/io/IOException;
    :catch_3
    move-exception v6

    .line 709
    .local v6, err:Ljava/lang/RuntimeException;
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->internalServerError:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->reportErrorDuringNegotiate(Ljava/lang/String;)V

    .line 710
    throw v6

    .line 711
    .end local v6           #err:Ljava/lang/RuntimeException;
    :catch_4
    move-exception v6

    .line 712
    .local v6, err:Ljava/lang/Error;
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->internalServerError:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->reportErrorDuringNegotiate(Ljava/lang/String;)V

    .line 713
    throw v6

    .line 699
    .local v6, err:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    :catch_5
    move-exception v0

    goto :goto_3
.end method

.method private want(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "obj"

    .prologue
    .line 1076
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->WANT:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1077
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->WANT:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 1078
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->wantAll:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1080
    :cond_0
    return-void
.end method

.method private wantSatisfied(Lorg/eclipse/jgit/revwalk/RevObject;)Z
    .locals 7
    .parameter "want"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 1233
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->SATISFIED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    .line 1250
    :goto_0
    return v1

    .line 1236
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->SAVE:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->resetRetain(Lorg/eclipse/jgit/revwalk/RevFlagSet;)V

    .line 1237
    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object v1, p1

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 1238
    iget v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->oldestTime:I

    if-eqz v1, :cond_1

    .line 1239
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->oldestTime:I

    int-to-long v3, v3

    const-wide/16 v5, 0x3e8

    mul-long/2addr v3, v5

    invoke-static {v3, v4}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->after(J)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 1241
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 1242
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_2

    .line 1250
    const/4 v1, 0x0

    goto :goto_0

    .line 1244
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->PEER_HAS:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1245
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->addCommonBase(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 1246
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->SATISFIED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    move v1, v2

    .line 1247
    goto :goto_0
.end method


# virtual methods
.method public getAdvertiseRefsHook()Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
    .locals 1

    .prologue
    .line 479
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    return-object v0
.end method

.method public final getAdvertisedRefs()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 353
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    return-object v0
.end method

.method public getLogger()Lorg/eclipse/jgit/transport/UploadPackLogger;
    .locals 1

    .prologue
    .line 559
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->logger:Lorg/eclipse/jgit/transport/UploadPackLogger;

    return-object v0
.end method

.method public getMessageOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 840
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    return-object v0
.end method

.method public getPackStatistics()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    .locals 1

    .prologue
    .line 651
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->statistics:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    return-object v0
.end method

.method public getPreUploadHook()Lorg/eclipse/jgit/transport/PreUploadHook;
    .locals 1

    .prologue
    .line 521
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    return-object v0
.end method

.method public getRefFilter()Lorg/eclipse/jgit/transport/RefFilter;
    .locals 1

    .prologue
    .line 484
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    return-object v0
.end method

.method public final getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public getRequestPolicy()Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;
    .locals 1

    .prologue
    .line 422
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    instance-of v0, v0, Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;

    if-eqz v0, :cond_0

    .line 423
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ADVERTISED:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    .line 432
    :goto_0
    return-object v0

    .line 424
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    instance-of v0, v0, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitRequestValidator;

    if-eqz v0, :cond_1

    .line 425
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->REACHABLE_COMMIT:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    goto :goto_0

    .line 426
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    instance-of v0, v0, Lorg/eclipse/jgit/transport/UploadPack$TipRequestValidator;

    if-eqz v0, :cond_2

    .line 427
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    goto :goto_0

    .line 428
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    instance-of v0, v0, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;

    if-eqz v0, :cond_3

    .line 429
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->REACHABLE_COMMIT_TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    goto :goto_0

    .line 430
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    instance-of v0, v0, Lorg/eclipse/jgit/transport/UploadPack$AnyRequestValidator;

    if-eqz v0, :cond_4

    .line 431
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ANY:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    goto :goto_0

    .line 432
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;
    .locals 1

    .prologue
    .line 343
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 381
    iget v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->timeout:I

    return v0
.end method

.method public isBiDirectionalPipe()Z
    .locals 1

    .prologue
    .line 401
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    return v0
.end method

.method public isSideBand()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/RequestNotYetReadException;
        }
    .end annotation

    .prologue
    .line 584
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 585
    new-instance v0, Lorg/eclipse/jgit/transport/RequestNotYetReadException;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/RequestNotYetReadException;-><init>()V

    throw v0

    .line 586
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    const-string v1, "side-band"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->options:Ljava/util/Set;

    const-string v1, "side-band-64k"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

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

.method public sendAdvertisedRefs(Lorg/eclipse/jgit/transport/RefAdvertiser;)V
    .locals 4
    .parameter "adv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 783
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    invoke-interface {v2, p0}, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->advertiseRefs(Lorg/eclipse/jgit/transport/UploadPack;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_0 .. :try_end_0} :catch_0

    .line 792
    iget-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->init(Lorg/eclipse/jgit/lib/Repository;)V

    .line 793
    const-string v2, "include-tag"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 794
    const-string v2, "multi_ack_detailed"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 795
    const-string v2, "multi_ack"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 796
    const-string v2, "ofs-delta"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 797
    const-string v2, "side-band"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 798
    const-string v2, "side-band-64k"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 799
    const-string v2, "thin-pack"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 800
    const-string v2, "no-progress"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 801
    const-string v2, "shallow"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 802
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    if-nez v2, :cond_0

    .line 803
    const-string v2, "no-done"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 804
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/UploadPack;->getRequestPolicy()Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    move-result-object v1

    .line 805
    .local v1, policy:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;
    sget-object v2, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    if-eq v1, v2, :cond_1

    sget-object v2, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->REACHABLE_COMMIT_TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    if-eq v1, v2, :cond_1

    if-nez v1, :cond_2

    .line 808
    :cond_1
    const-string v2, "allow-tip-sha1-in-want"

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 809
    :cond_2
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->setDerefTags(Z)V

    .line 810
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->getAdvertisedOrDefaultRefs()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->send(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertised:Ljava/util/Set;

    .line 811
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefAdvertiser;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 812
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    const-string v3, "capabilities^{}"

    invoke-virtual {p1, v2, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseId(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    .line 813
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefAdvertiser;->end()V

    .line 814
    return-void

    .line 784
    .end local v1           #policy:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;
    :catch_0
    move-exception v0

    .line 785
    .local v0, fail:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 786
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ERR "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->writeOne(Ljava/lang/CharSequence;)V

    .line 787
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->setOutput()V

    .line 789
    :cond_4
    throw v0
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 3
    .parameter "what"

    .prologue
    .line 829
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 833
    :goto_0
    return-void

    .line 830
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setAdvertiseRefsHook(Lorg/eclipse/jgit/transport/AdvertiseRefsHook;)V
    .locals 1
    .parameter "advertiseRefsHook"

    .prologue
    .line 498
    if-eqz p1, :cond_0

    .line 499
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    .line 502
    :goto_0
    return-void

    .line 501
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    goto :goto_0
.end method

.method public setAdvertisedRefs(Ljava/util/Map;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 369
    .local p1, allRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    if-eqz p1, :cond_0

    .line 370
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    .line 373
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    sget-object v1, Lorg/eclipse/jgit/transport/RefFilter;->DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;

    if-ne v0, v1, :cond_1

    .line 374
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->transferConfig:Lorg/eclipse/jgit/transport/TransferConfig;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransferConfig;->getRefFilter()Lorg/eclipse/jgit/transport/RefFilter;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/RefFilter;->filter(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    .line 377
    :goto_1
    return-void

    .line 372
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getAllRefs()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    goto :goto_0

    .line 376
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/RefFilter;->filter(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->refs:Ljava/util/Map;

    goto :goto_1
.end method

.method public setBiDirectionalPipe(Z)V
    .locals 0
    .parameter "twoWay"

    .prologue
    .line 414
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->biDirectionalPipe:Z

    .line 415
    return-void
.end method

.method public setLogger(Lorg/eclipse/jgit/transport/UploadPackLogger;)V
    .locals 0
    .parameter "logger"

    .prologue
    .line 569
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->logger:Lorg/eclipse/jgit/transport/UploadPackLogger;

    .line 570
    return-void
.end method

.method public setPackConfig(Lorg/eclipse/jgit/storage/pack/PackConfig;)V
    .locals 0
    .parameter "pc"

    .prologue
    .line 542
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 543
    return-void
.end method

.method public setPreUploadHook(Lorg/eclipse/jgit/transport/PreUploadHook;)V
    .locals 0
    .parameter "hook"

    .prologue
    .line 531
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->preUploadHook:Lorg/eclipse/jgit/transport/PreUploadHook;

    .line 532
    return-void

    .line 531
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/transport/PreUploadHook;->NULL:Lorg/eclipse/jgit/transport/PreUploadHook;

    goto :goto_0
.end method

.method public setRefFilter(Lorg/eclipse/jgit/transport/RefFilter;)V
    .locals 0
    .parameter "refFilter"

    .prologue
    .line 516
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    .line 517
    return-void

    .line 516
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/transport/RefFilter;->DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;

    goto :goto_0
.end method

.method public setRequestPolicy(Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;)V
    .locals 2
    .parameter "policy"

    .prologue
    .line 447
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$1;->$SwitchMap$org$eclipse$jgit$transport$UploadPack$RequestPolicy:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 450
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    .line 465
    :goto_0
    return-void

    .line 453
    :pswitch_0
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitRequestValidator;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitRequestValidator;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    goto :goto_0

    .line 456
    :pswitch_1
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$TipRequestValidator;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPack$TipRequestValidator;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    goto :goto_0

    .line 459
    :pswitch_2
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    goto :goto_0

    .line 462
    :pswitch_3
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$AnyRequestValidator;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPack$AnyRequestValidator;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    goto :goto_0

    .line 447
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public setRequestValidator(Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;)V
    .locals 0
    .parameter "validator"

    .prologue
    .line 473
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->requestValidator:Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;

    .line 475
    return-void

    .line 473
    .restart local p1
    :cond_0
    new-instance p1, Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;

    .end local p1
    invoke-direct {p1}, Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;-><init>()V

    goto :goto_0
.end method

.method public setTimeout(I)V
    .locals 0
    .parameter "seconds"

    .prologue
    .line 393
    iput p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->timeout:I

    .line 394
    return-void
.end method

.method public setTransferConfig(Lorg/eclipse/jgit/transport/TransferConfig;)V
    .locals 1
    .parameter "tc"

    .prologue
    .line 552
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->transferConfig:Lorg/eclipse/jgit/transport/TransferConfig;

    .line 553
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->transferConfig:Lorg/eclipse/jgit/transport/TransferConfig;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransferConfig;->isAllowTipSha1InWant()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->TIP:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    :goto_1
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/UploadPack;->setRequestPolicy(Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;)V

    .line 555
    return-void

    .line 552
    .restart local p1
    :cond_0
    new-instance p1, Lorg/eclipse/jgit/transport/TransferConfig;

    .end local p1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UploadPack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {p1, v0}, Lorg/eclipse/jgit/transport/TransferConfig;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    goto :goto_0

    .line 553
    :cond_1
    sget-object v0, Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;->ADVERTISED:Lorg/eclipse/jgit/transport/UploadPack$RequestPolicy;

    goto :goto_1
.end method

.method public upload(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    .locals 7
    .parameter "input"
    .parameter "output"
    .parameter "messages"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 610
    :try_start_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawIn:Ljava/io/InputStream;

    .line 611
    iput-object p2, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    .line 612
    if-eqz p3, :cond_0

    .line 613
    iput-object p3, p0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    .line 615
    :cond_0
    iget v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->timeout:I

    if-lez v3, :cond_1

    .line 616
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 617
    .local v0, caller:Ljava/lang/Thread;
    new-instance v3, Lorg/eclipse/jgit/util/io/InterruptTimer;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-Timer"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/util/io/InterruptTimer;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 618
    new-instance v1, Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawIn:Ljava/io/InputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-direct {v1, v3, v4}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;-><init>(Ljava/io/InputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V

    .line 619
    .local v1, i:Lorg/eclipse/jgit/util/io/TimeoutInputStream;
    new-instance v2, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;-><init>(Ljava/io/OutputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V

    .line 620
    .local v2, o:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;
    iget v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->timeout:I

    mul-int/lit16 v3, v3, 0x3e8

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    .line 621
    iget v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->timeout:I

    mul-int/lit16 v3, v3, 0x3e8

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->setTimeout(I)V

    .line 622
    iput-object v1, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawIn:Ljava/io/InputStream;

    .line 623
    iput-object v2, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    .line 626
    .end local v0           #caller:Ljava/lang/Thread;
    .end local v1           #i:Lorg/eclipse/jgit/util/io/TimeoutInputStream;
    .end local v2           #o:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;
    :cond_1
    new-instance v3, Lorg/eclipse/jgit/transport/PacketLineIn;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawIn:Ljava/io/InputStream;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/transport/PacketLineIn;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    .line 627
    new-instance v3, Lorg/eclipse/jgit/transport/PacketLineOut;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->rawOut:Ljava/io/OutputStream;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/transport/PacketLineOut;-><init>(Ljava/io/OutputStream;)V

    iput-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 628
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/UploadPack;->service()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 630
    sget-object v3, Lorg/eclipse/jgit/util/io/NullOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;

    iput-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    .line 631
    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 632
    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    if-eqz v3, :cond_2

    .line 634
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/io/InterruptTimer;->terminate()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 636
    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 640
    :cond_2
    return-void

    .line 636
    :catchall_0
    move-exception v3

    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    throw v3

    .line 630
    :catchall_1
    move-exception v3

    sget-object v4, Lorg/eclipse/jgit/util/io/NullOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/NullOutputStream;

    iput-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->msgOut:Ljava/io/OutputStream;

    .line 631
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 632
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    if-eqz v4, :cond_3

    .line 634
    :try_start_2
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/io/InterruptTimer;->terminate()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 636
    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    :cond_3
    throw v3

    :catchall_2
    move-exception v3

    iput-object v6, p0, Lorg/eclipse/jgit/transport/UploadPack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    throw v3
.end method
