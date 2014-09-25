.class Lorg/eclipse/jgit/transport/WalkFetchConnection;
.super Lorg/eclipse/jgit/transport/BaseFetchConnection;
.source "WalkFetchConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;
    }
.end annotation


# instance fields
.field private final COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final IN_WORK_QUEUE:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final LOCALLY_SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final fetchErrors:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;>;"
        }
    .end annotation
.end field

.field private final idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

.field private final inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

.field private lastRemoteIdx:I

.field private final local:Lorg/eclipse/jgit/lib/Repository;

.field private final localCommitQueue:Lorg/eclipse/jgit/revwalk/DateRevQueue;

.field private lockMessage:Ljava/lang/String;

.field private final noAlternatesYet:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;",
            ">;"
        }
    .end annotation
.end field

.field private final noPacksYet:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;",
            ">;"
        }
    .end annotation
.end field

.field private final objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

.field private final packLocks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackLock;",
            ">;"
        }
    .end annotation
.end field

.field private final packsConsidered:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private final remotes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;",
            ">;"
        }
    .end annotation
.end field

.field private final revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

.field private final treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

.field private final unfetchedPacks:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;",
            ">;"
        }
    .end annotation
.end field

.field private workQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/WalkTransport;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)V
    .locals 3
    .parameter "t"
    .parameter "w"

    .prologue
    .line 193
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseFetchConnection;-><init>()V

    .line 172
    new-instance v1, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    move-object v0, p1

    .line 194
    check-cast v0, Lorg/eclipse/jgit/transport/Transport;

    .line 195
    .local v0, wt:Lorg/eclipse/jgit/transport/Transport;
    iget-object v1, v0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    .line 196
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/Transport;->isCheckFetchedObjects()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/ObjectChecker;-><init>()V

    :goto_0
    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

    .line 197
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    .line 198
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 200
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->remotes:Ljava/util/List;

    .line 201
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->remotes:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->unfetchedPacks:Ljava/util/LinkedList;

    .line 204
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->packsConsidered:Ljava/util/Set;

    .line 206
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noPacksYet:Ljava/util/LinkedList;

    .line 207
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noPacksYet:Ljava/util/LinkedList;

    invoke-virtual {v1, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 209
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noAlternatesYet:Ljava/util/LinkedList;

    .line 210
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noAlternatesYet:Ljava/util/LinkedList;

    invoke-virtual {v1, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 212
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->fetchErrors:Ljava/util/HashMap;

    .line 213
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->packLocks:Ljava/util/List;

    .line 215
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 216
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 217
    new-instance v1, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 218
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v2, "COMPLETE"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 219
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v2, "IN_WORK_QUEUE"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->IN_WORK_QUEUE:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 220
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v2, "LOCALLY_SEEN"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->LOCALLY_SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 222
    new-instance v1, Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-direct {v1}, Lorg/eclipse/jgit/revwalk/DateRevQueue;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->localCommitQueue:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    .line 223
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    .line 224
    return-void

    .line 196
    :cond_0
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .parameter "x0"

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/ObjectInserter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/ObjectChecker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

    return-object v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->lockMessage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->packLocks:Ljava/util/List;

    return-object v0
.end method

.method private alreadyHave(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 6
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 484
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/ObjectReader;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 485
    :catch_0
    move-exception v0

    .line 486
    .local v0, error:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotReadObject:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private downloadLooseObject(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)Z
    .locals 7
    .parameter "id"
    .parameter "looseName"
    .parameter "remote"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 594
    :try_start_0
    invoke-virtual {p3, p2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->toArray()[B

    move-result-object v0

    .line 595
    .local v0, compressed:[B
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->verifyAndInsertLooseObject(Lorg/eclipse/jgit/lib/AnyObjectId;[B)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 602
    .end local v0           #compressed:[B
    :goto_0
    return v2

    .line 597
    :catch_0
    move-exception v1

    .line 601
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->recordError(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/Throwable;)V

    move v2, v3

    .line 602
    goto :goto_0

    .line 603
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v1

    .line 604
    .local v1, e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->cannotDownload:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-static {v5, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private downloadObject(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 21
    .parameter "pm"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 395
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->alreadyHave(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 451
    :cond_0
    :goto_0
    return-void

    .line 403
    :cond_1
    invoke-direct/range {p0 .. p2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->downloadPackedObject(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v17

    if-nez v17, :cond_0

    .line 409
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v10

    .line 410
    .local v10, idStr:Ljava/lang/String;
    const/16 v17, 0x0

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 411
    .local v14, subdir:Ljava/lang/String;
    const/16 v17, 0x2

    move/from16 v0, v17

    invoke-virtual {v10, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 412
    .local v7, file:Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 414
    .local v11, looseName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget v8, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->lastRemoteIdx:I

    .local v8, i:I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->remotes:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_3

    .line 415
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->remotes:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v11, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->downloadLooseObject(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 416
    move-object/from16 v0, p0

    iput v8, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->lastRemoteIdx:I

    goto :goto_0

    .line 414
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 420
    :cond_3
    const/4 v8, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->lastRemoteIdx:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v8, v0, :cond_5

    .line 421
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->remotes:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v11, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->downloadLooseObject(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 422
    move-object/from16 v0, p0

    iput v8, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->lastRemoteIdx:I

    goto/16 :goto_0

    .line 420
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 435
    .local v16, wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :catch_0
    move-exception v5

    .line 438
    .local v5, e:Ljava/io/IOException;
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->recordError(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 441
    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 429
    .end local v5           #e:Ljava/io/IOException;
    .end local v16           #wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noPacksYet:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_8

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noPacksYet:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    .line 433
    .restart local v16       #wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :try_start_1
    const-string v17, "Listing packs"

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 434
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->getPackNames()Ljava/util/Collection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v13

    .line 441
    .local v13, packNameList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 444
    if-eqz v13, :cond_5

    invoke-interface {v13}, Ljava/util/Collection;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_5

    .line 446
    invoke-interface {v13}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_6
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 447
    .local v12, packName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->packsConsidered:Ljava/util/Set;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 448
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->unfetchedPacks:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    new-instance v18, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2, v12}, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;-><init>(Lorg/eclipse/jgit/transport/WalkFetchConnection;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v18}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 441
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v12           #packName:Ljava/lang/String;
    .end local v13           #packNameList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :catchall_0
    move-exception v17

    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v17

    .line 450
    .restart local v9       #i$:Ljava/util/Iterator;
    .restart local v13       #packNameList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_7
    invoke-direct/range {p0 .. p2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->downloadPackedObject(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v17

    if-eqz v17, :cond_5

    goto/16 :goto_0

    .line 456
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v13           #packNameList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v16           #wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->expandOneAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/Collection;

    move-result-object v3

    .line 457
    .local v3, al:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;>;"
    if-eqz v3, :cond_9

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_9

    .line 458
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    .line 459
    .local v4, alt:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->remotes:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noPacksYet:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 461
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noAlternatesYet:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 468
    .end local v4           #alt:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    .end local v9           #i$:Ljava/util/Iterator;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->fetchErrors:Ljava/util/HashMap;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 471
    .local v6, failures:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Throwable;>;"
    new-instance v15, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v17

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotGet:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v15, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    .line 472
    .local v15, te:Lorg/eclipse/jgit/errors/TransportException;
    if-eqz v6, :cond_a

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_a

    .line 473
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_b

    .line 474
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Throwable;

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/eclipse/jgit/errors/TransportException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 478
    :cond_a
    :goto_5
    throw v15

    .line 476
    :cond_b
    new-instance v17, Lorg/eclipse/jgit/errors/CompoundException;

    move-object/from16 v0, v17

    invoke-direct {v0, v6}, Lorg/eclipse/jgit/errors/CompoundException;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/eclipse/jgit/errors/TransportException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    goto :goto_5
.end method

.method private downloadPackedObject(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 12
    .parameter "monitor"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 496
    iget-object v8, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->unfetchedPacks:Ljava/util/LinkedList;

    invoke-virtual {v8}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 497
    .local v4, packItr:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v8

    if-nez v8, :cond_1

    .line 498
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;

    .line 500
    .local v3, pack:Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;
    :try_start_0
    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->openIndex(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 512
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 581
    .end local v3           #pack:Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;
    :cond_1
    :goto_1
    return v6

    .line 501
    .restart local v3       #pack:Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;
    :catch_0
    move-exception v1

    .line 507
    .local v1, err:Ljava/io/IOException;
    invoke-direct {p0, p2, v1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->recordError(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/Throwable;)V

    .line 508
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 520
    .end local v1           #err:Ljava/io/IOException;
    :cond_2
    iget-object v8, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v8, p2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 531
    :try_start_1
    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->downloadPack(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 548
    :try_start_2
    iget-object v8, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    if-eqz v8, :cond_3

    .line 549
    iget-object v8, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v8}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 553
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 556
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->alreadyHave(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 561
    new-instance v8, Ljava/io/FileNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->objectNotFoundIn:Ljava/lang/String;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v6

    iget-object v11, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->packName:Ljava/lang/String;

    aput-object v11, v10, v7

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p2, v8}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->recordError(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 550
    :catch_1
    move-exception v0

    .line 551
    .local v0, e:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 532
    .end local v0           #e:Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 538
    .restart local v1       #err:Ljava/io/IOException;
    :try_start_3
    invoke-direct {p0, p2, v1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->recordError(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 548
    :try_start_4
    iget-object v8, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    if-eqz v8, :cond_4

    .line 549
    iget-object v8, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v8}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 553
    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 550
    :catch_3
    move-exception v0

    .line 551
    .restart local v0       #e:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 547
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #err:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    .line 548
    :try_start_5
    iget-object v7, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    if-eqz v7, :cond_5

    .line 549
    iget-object v7, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v7}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 553
    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    throw v6

    .line 550
    :catch_4
    move-exception v0

    .line 551
    .restart local v0       #e:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 568
    .end local v0           #e:Ljava/io/IOException;
    :cond_6
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->swapFetchQueue()Ljava/util/Iterator;

    move-result-object v5

    .line 569
    .local v5, pending:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 570
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 571
    .local v2, p:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v6, v3, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 572
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    .line 573
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->process(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_2

    .line 575
    :cond_7
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .end local v2           #p:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_8
    move v6, v7

    .line 578
    goto/16 :goto_1
.end method

.method private expandOneAlternate(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/Collection;
    .locals 5
    .parameter "id"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;",
            ">;"
        }
    .end annotation

    .prologue
    .line 654
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noAlternatesYet:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 655
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->noAlternatesYet:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    .line 657
    .local v2, wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :try_start_0
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->listingAlternates:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-interface {p2, v3, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 658
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->getAlternates()Ljava/util/Collection;

    move-result-object v0

    .line 660
    .local v0, altList:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    .line 667
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 670
    .end local v0           #altList:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;>;"
    .end local v2           #wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :goto_1
    return-object v0

    .line 667
    .restart local v0       #altList:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;>;"
    .restart local v2       #wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :cond_0
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    goto :goto_0

    .line 662
    .end local v0           #altList:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;>;"
    :catch_0
    move-exception v1

    .line 665
    .local v1, e:Ljava/io/IOException;
    :try_start_1
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->recordError(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 667
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    goto :goto_0

    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v3

    .line 670
    .end local v2           #wrr:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private markLocalCommitsComplete(I)V
    .locals 8
    .parameter "until"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 720
    :cond_0
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->localCommitQueue:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->peek()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 721
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v6

    if-ge v6, p1, :cond_2

    .line 722
    :cond_1
    return-void

    .line 723
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->localCommitQueue:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 725
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->markTreeComplete(Lorg/eclipse/jgit/revwalk/RevTree;)V

    .line 726
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .line 727
    .local v5, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->pushLocalCommit(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 726
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 729
    .end local v0           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v1           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catch_0
    move-exception v2

    .line 730
    .local v2, err:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->localObjectsIncomplete:Ljava/lang/String;

    invoke-direct {v6, v7, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method

.method private markLocalObjComplete(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 2
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 697
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 698
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 699
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local p1
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object p1

    .line 700
    .restart local p1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0

    .line 703
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 714
    .end local p1
    :goto_1
    return-void

    .line 705
    .restart local p1
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    goto :goto_1

    .line 708
    :pswitch_1
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local p1
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->pushLocalCommit(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_1

    .line 711
    .restart local p1
    :pswitch_2
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevTree;

    .end local p1
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->markTreeComplete(Lorg/eclipse/jgit/revwalk/RevTree;)V

    goto :goto_1

    .line 703
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private markLocalRefsComplete(Ljava/util/Set;)V
    .locals 11
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .local p1, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v8, 0x1

    const/4 v10, 0x0

    .line 676
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 680
    .local v5, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 682
    .local v3, r:Lorg/eclipse/jgit/lib/Ref;
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->markLocalObjComplete(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 683
    :catch_0
    move-exception v4

    .line 684
    .local v4, readError:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->localRefIsMissingObjects:Ljava/lang/String;

    new-array v8, v8, [Ljava/lang/Object;

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 677
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v4           #readError:Ljava/io/IOException;
    .end local v5           #refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :catch_1
    move-exception v0

    .line 678
    .local v0, e:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 687
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v5       #refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 689
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_2
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->markLocalObjComplete(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 690
    :catch_2
    move-exception v4

    .line 691
    .restart local v4       #readError:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->transportExceptionMissingAssumed:Ljava/lang/String;

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 694
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #readError:Ljava/io/IOException;
    :cond_1
    return-void
.end method

.method private markTreeComplete(Lorg/eclipse/jgit/revwalk/RevTree;)V
    .locals 8
    .parameter "tree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 746
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/revwalk/RevTree;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 777
    :cond_0
    return-void

    .line 748
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/revwalk/RevTree;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 749
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 750
    :cond_2
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 751
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    .line 752
    .local v0, mode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v2

    .line 754
    .local v2, sType:I
    packed-switch v2, :pswitch_data_0

    .line 770
    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 772
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3, v4, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 773
    new-instance v3, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidMode3:Ljava/lang/String;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/MutableObjectId;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevTree;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 756
    :pswitch_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3, v4, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 757
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3, v4, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    goto :goto_0

    .line 761
    :pswitch_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3, v4, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 762
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3, v4, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 763
    .local v1, o:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 764
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 765
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->enterSubtree()V

    goto/16 :goto_0

    .line 754
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private needs(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "obj"

    .prologue
    .line 385
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 391
    :cond_0
    :goto_0
    return-void

    .line 387
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->IN_WORK_QUEUE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 388
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->IN_WORK_QUEUE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 389
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private process(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 8
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 290
    :try_start_0
    instance-of v3, p1, Lorg/eclipse/jgit/revwalk/RevObject;

    if-eqz v3, :cond_2

    .line 291
    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevObject;

    move-object v2, v0

    .line 292
    .local v2, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 325
    :goto_0
    return-void

    .line 294
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 318
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unknownObjectType:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 296
    .end local v2           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_2
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v2

    .line 297
    .restart local v2       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 300
    .end local v2           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catch_0
    move-exception v1

    .line 301
    .local v1, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->cannotRead:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 306
    .end local v1           #e:Ljava/io/IOException;
    .restart local v2       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :pswitch_0
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->processBlob(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 324
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->fetchErrors:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 309
    :pswitch_1
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->processTree(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_1

    .line 312
    :pswitch_2
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->processCommit(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_1

    .line 315
    :pswitch_3
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->processTag(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_1

    .line 304
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private processBlob(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 8
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 329
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    const/4 v2, 0x3

    invoke-virtual {v1, p1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->has(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 330
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 339
    return-void

    .line 332
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotReadBlob:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/eclipse/jgit/errors/MissingObjectException;

    const-string v4, "blob"

    invoke-direct {v3, p1, v4}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    :catch_0
    move-exception v0

    .line 336
    .local v0, error:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotReadBlob:Ljava/lang/String;

    new-array v3, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private processCommit(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 6
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 370
    move-object v1, p1

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 371
    .local v1, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v5

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->markLocalCommitsComplete(I)V

    .line 372
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->needs(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 373
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 374
    .local v4, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->needs(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 373
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 375
    .end local v4           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 376
    return-void
.end method

.method private processTag(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 2
    .parameter "obj"

    .prologue
    .line 379
    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevTag;

    .line 380
    .local v0, tag:Lorg/eclipse/jgit/revwalk/RevTag;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->needs(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 381
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 382
    return-void
.end method

.method private processTree(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 10
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 343
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 344
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 345
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    .line 346
    .local v1, mode:Lorg/eclipse/jgit/lib/FileMode;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/FileMode;->getObjectType()I

    move-result v2

    .line 348
    .local v2, sType:I
    packed-switch v2, :pswitch_data_0

    .line 356
    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 358
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 359
    new-instance v3, Lorg/eclipse/jgit/errors/CorruptObjectException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->invalidModeFor:Ljava/lang/String;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/MutableObjectId;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    .end local v1           #mode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v2           #sType:I
    :catch_0
    move-exception v0

    .line 364
    .local v0, ioe:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->cannotReadTree:Ljava/lang/String;

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 351
    .end local v0           #ioe:Ljava/io/IOException;
    .restart local v1       #mode:Lorg/eclipse/jgit/lib/FileMode;
    .restart local v2       #sType:I
    :pswitch_0
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 352
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3, v4, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->needs(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 366
    .end local v1           #mode:Lorg/eclipse/jgit/lib/FileMode;
    .end local v2           #sType:I
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 367
    return-void

    .line 348
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private pushLocalCommit(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 736
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->LOCALLY_SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 743
    :goto_0
    return-void

    .line 738
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 739
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->LOCALLY_SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 740
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 741
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 742
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->localCommitQueue:Lorg/eclipse/jgit/revwalk/DateRevQueue;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/DateRevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0
.end method

.method private queueWants(Ljava/util/Collection;)V
    .locals 11
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 267
    .local p1, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 268
    .local v3, inWorkQueue:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/Ref;

    .line 269
    .local v5, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 271
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    .line 272
    .local v4, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 274
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 275
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->IN_WORK_QUEUE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 276
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    invoke-virtual {v6, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 278
    .end local v4           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catch_0
    move-exception v0

    .line 279
    .local v0, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 280
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 281
    .end local v0           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catch_1
    move-exception v0

    .line 282
    .local v0, e:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->cannotRead:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 285
    .end local v0           #e:Ljava/io/IOException;
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return-void
.end method

.method private recordError(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/Throwable;)V
    .locals 3
    .parameter "id"
    .parameter "what"

    .prologue
    .line 780
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 781
    .local v1, objId:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->fetchErrors:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 782
    .local v0, errors:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Throwable;>;"
    if-nez v0, :cond_0

    .line 783
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #errors:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Throwable;>;"
    const/4 v2, 0x2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 784
    .restart local v0       #errors:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Throwable;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->fetchErrors:Ljava/util/HashMap;

    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 786
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 787
    return-void
.end method

.method private swapFetchQueue()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 585
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 586
    .local v0, r:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    .line 587
    return-object v0
.end method

.method private verifyAndInsertLooseObject(Lorg/eclipse/jgit/lib/AnyObjectId;[B)V
    .locals 11
    .parameter "id"
    .parameter "compressed"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 612
    :try_start_0
    invoke-static {p2, p1}, Lorg/eclipse/jgit/internal/storage/file/UnpackedObject;->parse([BLorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/CorruptObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 631
    .local v5, uol:Lorg/eclipse/jgit/lib/ObjectLoader;
    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectLoader;->getType()I

    move-result v4

    .line 632
    .local v4, type:I
    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v3

    .line 633
    .local v3, raw:[B
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

    if-eqz v6, :cond_0

    .line 635
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-virtual {v6, v4, v3}, Lorg/eclipse/jgit/lib/ObjectChecker;->check(I[B)V
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/CorruptObjectException; {:try_start_1 .. :try_end_1} :catch_1

    .line 642
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v6, v4, v3}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 643
    .local v0, act:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 644
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->incorrectHashFor:Ljava/lang/String;

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {v4}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    array-length v10, p2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 613
    .end local v0           #act:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #raw:[B
    .end local v4           #type:I
    .end local v5           #uol:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catch_0
    move-exception v2

    .line 626
    .local v2, parsingError:Lorg/eclipse/jgit/errors/CorruptObjectException;
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .line 627
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1, v2}, Ljava/io/FileNotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 628
    throw v1

    .line 636
    .end local v1           #e:Ljava/io/FileNotFoundException;
    .end local v2           #parsingError:Lorg/eclipse/jgit/errors/CorruptObjectException;
    .restart local v3       #raw:[B
    .restart local v4       #type:I
    .restart local v5       #uol:Lorg/eclipse/jgit/lib/ObjectLoader;
    :catch_1
    move-exception v1

    .line 637
    .local v1, e:Lorg/eclipse/jgit/errors/CorruptObjectException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->transportExceptionInvalid:Ljava/lang/String;

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v4}, Lorg/eclipse/jgit/lib/Constants;->typeString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-virtual {v1}, Lorg/eclipse/jgit/errors/CorruptObjectException;->getMessage()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 649
    .end local v1           #e:Lorg/eclipse/jgit/errors/CorruptObjectException;
    .restart local v0       #act:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 650
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4

    .prologue
    .line 255
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 256
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 257
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->unfetchedPacks:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;

    .line 258
    .local v1, p:Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;
    iget-object v3, v1, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    if-eqz v3, :cond_0

    .line 259
    iget-object v3, v1, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 261
    .end local v1           #p:Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->remotes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    .line 262
    .local v2, r:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->close()V

    goto :goto_1

    .line 263
    .end local v2           #r:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    :cond_2
    return-void
.end method

.method public didFetchTestConnectivity()Z
    .locals 1

    .prologue
    .line 227
    const/4 v0, 0x1

    return v0
.end method

.method protected doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V
    .locals 3
    .parameter "monitor"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 234
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-direct {p0, p3}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->markLocalRefsComplete(Ljava/util/Set;)V

    .line 235
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->queueWants(Ljava/util/Collection;)V

    .line 237
    :goto_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 238
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->workQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ObjectId;

    .line 239
    .local v0, id:Lorg/eclipse/jgit/lib/ObjectId;
    instance-of v1, v0, Lorg/eclipse/jgit/revwalk/RevObject;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevObject;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->COMPLETE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 240
    :cond_0
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->downloadObject(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 241
    :cond_1
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->process(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 243
    .end local v0           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    return-void
.end method

.method public getPackLocks()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackLock;",
            ">;"
        }
    .end annotation

    .prologue
    .line 246
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->packLocks:Ljava/util/List;

    return-object v0
.end method

.method public setPackLockMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 250
    iput-object p1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection;->lockMessage:Ljava/lang/String;

    .line 251
    return-void
.end method
