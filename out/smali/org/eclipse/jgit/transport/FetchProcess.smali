.class Lorg/eclipse/jgit/transport/FetchProcess;
.super Ljava/lang/Object;
.source "FetchProcess.java"


# instance fields
.field private final askFor:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private conn:Lorg/eclipse/jgit/transport/FetchConnection;

.field private final fetchHeadUpdates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/eclipse/jgit/transport/FetchHeadRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final have:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private localRefs:Ljava/util/Map;
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

.field private final localUpdates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/eclipse/jgit/transport/TrackingRefUpdate;",
            ">;"
        }
    .end annotation
.end field

.field private final packLocks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackLock;",
            ">;"
        }
    .end annotation
.end field

.field private final toFetch:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation
.end field

.field private final transport:Lorg/eclipse/jgit/transport/Transport;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/Transport;Ljava/util/Collection;)V
    .locals 1
    .parameter "t"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/Transport;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p2, f:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    .line 94
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->have:Ljava/util/HashSet;

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localUpdates:Ljava/util/ArrayList;

    .line 100
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->fetchHeadUpdates:Ljava/util/ArrayList;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->packLocks:Ljava/util/ArrayList;

    .line 109
    iput-object p1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    .line 110
    iput-object p2, p0, Lorg/eclipse/jgit/transport/FetchProcess;->toFetch:Ljava/util/Collection;

    .line 111
    return-void
.end method

.method private askForIsComplete()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 341
    :try_start_0
    new-instance v2, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v5, v5, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v5}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 343
    .local v2, ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :try_start_1
    iget-object v5, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/ObjectId;

    .line 344
    .local v4, want:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 349
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v4           #want:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_0
    move-exception v5

    :try_start_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->release()V

    throw v5
    :try_end_2
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 352
    .end local v2           #ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :catch_0
    move-exception v0

    .line 353
    .local v0, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    const/4 v5, 0x0

    .end local v0           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :goto_1
    return v5

    .line 345
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v2       #ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :cond_0
    :try_start_3
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 346
    .local v3, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_2

    .line 347
    .end local v3           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->checkConnectivity()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 349
    :try_start_4
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->release()V
    :try_end_4
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 351
    const/4 v5, 0x1

    goto :goto_1

    .line 354
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :catch_1
    move-exception v0

    .line 355
    .local v0, e:Ljava/io/IOException;
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->unableToCheckConnectivity:Ljava/lang/String;

    invoke-direct {v5, v6, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private closeConnection(Lorg/eclipse/jgit/transport/FetchResult;)V
    .locals 1
    .parameter "result"

    .prologue
    .line 258
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v0}, Lorg/eclipse/jgit/transport/FetchConnection;->close()V

    .line 260
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v0}, Lorg/eclipse/jgit/transport/FetchConnection;->getMessages()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/FetchResult;->addMessages(Ljava/lang/String;)V

    .line 261
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    .line 263
    :cond_0
    return-void
.end method

.method private createUpdate(Lorg/eclipse/jgit/transport/RefSpec;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    .locals 7
    .parameter "spec"
    .parameter "newId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 440
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/lib/Ref;

    .line 441
    .local v6, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v6, :cond_0

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 444
    .local v4, oldId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_0
    new-instance v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->isForceUpdate()Z

    move-result v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;-><init>(ZLjava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0

    .line 441
    .end local v4           #oldId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    goto :goto_0
.end method

.method private deleteStaleTrackingRefs(Lorg/eclipse/jgit/transport/FetchResult;Lorg/eclipse/jgit/lib/BatchRefUpdate;)V
    .locals 7
    .parameter "result"
    .parameter "batch"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 466
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 467
    .local v2, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    .line 468
    .local v3, refname:Ljava/lang/String;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->toFetch:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/RefSpec;

    .line 469
    .local v5, spec:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/transport/RefSpec;->matchDestination(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 470
    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromDestination(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v4

    .line 471
    .local v4, s:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/eclipse/jgit/transport/FetchResult;->getAdvertisedRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    if-nez v6, :cond_1

    .line 472
    invoke-direct {p0, p1, p2, v4, v2}, Lorg/eclipse/jgit/transport/FetchProcess;->deleteTrackingRef(Lorg/eclipse/jgit/transport/FetchResult;Lorg/eclipse/jgit/lib/BatchRefUpdate;Lorg/eclipse/jgit/transport/RefSpec;Lorg/eclipse/jgit/lib/Ref;)V

    goto :goto_0

    .line 477
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v3           #refname:Ljava/lang/String;
    .end local v4           #s:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v5           #spec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_2
    return-void
.end method

.method private deleteTrackingRef(Lorg/eclipse/jgit/transport/FetchResult;Lorg/eclipse/jgit/lib/BatchRefUpdate;Lorg/eclipse/jgit/transport/RefSpec;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 6
    .parameter "result"
    .parameter "batch"
    .parameter "spec"
    .parameter "localRef"

    .prologue
    .line 481
    invoke-interface {p4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    if-nez v1, :cond_0

    .line 491
    :goto_0
    return-void

    .line 483
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    const/4 v1, 0x1

    invoke-virtual {p3}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p4}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;-><init>(ZLjava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 489
    .local v0, update:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/FetchResult;->add(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)V

    .line 490
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->asReceiveCommand()Lorg/eclipse/jgit/transport/ReceiveCommand;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->addCommand(Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    goto :goto_0
.end method

.method private executeImp(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/transport/FetchResult;)V
    .locals 20
    .parameter "monitor"
    .parameter "result"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 136
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v15}, Lorg/eclipse/jgit/transport/Transport;->openFetch()Lorg/eclipse/jgit/transport/FetchConnection;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    .line 138
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v15}, Lorg/eclipse/jgit/transport/Transport;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/eclipse/jgit/transport/FetchConnection;->getRefsMap()Ljava/util/Map;

    move-result-object v16

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lorg/eclipse/jgit/transport/FetchResult;->setAdvertisedRefs(Lorg/eclipse/jgit/transport/URIish;Ljava/util/Map;)V

    .line 139
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 140
    .local v9, matched:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->toFetch:Ljava/util/Collection;

    invoke-interface {v15}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/transport/RefSpec;

    .line 141
    .local v11, spec:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v11}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v15

    if-nez v15, :cond_0

    .line 142
    new-instance v15, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v16

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->sourceRefNotSpecifiedForRefspec:Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v11, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v9           #matched:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v11           #spec:Lorg/eclipse/jgit/transport/RefSpec;
    :catchall_0
    move-exception v15

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/FetchProcess;->closeConnection(Lorg/eclipse/jgit/transport/FetchResult;)V

    throw v15

    .line 145
    .restart local v6       #i$:Ljava/util/Iterator;
    .restart local v9       #matched:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v11       #spec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_0
    :try_start_1
    invoke-virtual {v11}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 146
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9}, Lorg/eclipse/jgit/transport/FetchProcess;->expandWildcard(Lorg/eclipse/jgit/transport/RefSpec;Ljava/util/Set;)V

    goto :goto_0

    .line 148
    :cond_1
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v9}, Lorg/eclipse/jgit/transport/FetchProcess;->expandSingle(Lorg/eclipse/jgit/transport/RefSpec;Ljava/util/Set;)V

    goto :goto_0

    .line 151
    .end local v11           #spec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 152
    .local v2, additionalTags:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v15}, Lorg/eclipse/jgit/transport/Transport;->getTagOpt()Lorg/eclipse/jgit/transport/TagOpt;

    move-result-object v12

    .line 153
    .local v12, tagopt:Lorg/eclipse/jgit/transport/TagOpt;
    sget-object v15, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    if-ne v12, v15, :cond_6

    .line 154
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/transport/FetchProcess;->expandAutoFollowTags()Ljava/util/Collection;

    move-result-object v2

    .line 159
    :cond_3
    :goto_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v15}, Ljava/util/HashMap;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_7

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/transport/FetchProcess;->askForIsComplete()Z

    move-result v15

    if-nez v15, :cond_7

    .line 160
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/transport/FetchProcess;->fetchObjects(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 161
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v15}, Lorg/eclipse/jgit/transport/FetchConnection;->didFetchIncludeTags()Z

    move-result v8

    .line 166
    .local v8, includedTags:Z
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/FetchProcess;->closeConnection(Lorg/eclipse/jgit/transport/FetchResult;)V

    .line 171
    :goto_2
    sget-object v15, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    if-ne v12, v15, :cond_a

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_a

    .line 175
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->have:Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 176
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v15}, Ljava/util/HashMap;->clear()V

    .line 177
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_4
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/lib/Ref;

    .line 178
    .local v10, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    .line 179
    .local v7, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v7, :cond_5

    .line 180
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    .line 181
    :cond_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v15, v15, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v15, v7}, Lorg/eclipse/jgit/lib/Repository;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 182
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/eclipse/jgit/transport/FetchProcess;->wantTag(Lorg/eclipse/jgit/lib/Ref;)V

    goto :goto_3

    .line 155
    .end local v7           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v8           #includedTags:Z
    .end local v10           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_6
    sget-object v15, Lorg/eclipse/jgit/transport/TagOpt;->FETCH_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    if-ne v12, v15, :cond_3

    .line 156
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/transport/FetchProcess;->expandFetchTags()V

    goto :goto_1

    .line 168
    :cond_7
    const/4 v8, 0x0

    .restart local v8       #includedTags:Z
    goto :goto_2

    .line 185
    :cond_8
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v15}, Ljava/util/HashMap;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_a

    if-eqz v8, :cond_9

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/transport/FetchProcess;->askForIsComplete()Z

    move-result v15

    if-nez v15, :cond_a

    .line 186
    :cond_9
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/transport/FetchProcess;->reopenConnection()V

    .line 187
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v15}, Ljava/util/HashMap;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_a

    .line 188
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/transport/FetchProcess;->fetchObjects(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 192
    :cond_a
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/FetchProcess;->closeConnection(Lorg/eclipse/jgit/transport/FetchResult;)V

    .line 195
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v15, v15, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v15}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v15

    invoke-virtual {v15}, Lorg/eclipse/jgit/lib/RefDatabase;->newBatchUpdate()Lorg/eclipse/jgit/lib/BatchRefUpdate;

    move-result-object v15

    const/16 v16, 0x1

    invoke-virtual/range {v15 .. v16}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->setAllowNonFastForwards(Z)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    move-result-object v15

    const-string v16, "fetch"

    const/16 v17, 0x1

    invoke-virtual/range {v15 .. v17}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->setRefLogMessage(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    move-result-object v3

    .line 199
    .local v3, batch:Lorg/eclipse/jgit/lib/BatchRefUpdate;
    new-instance v14, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v15, v15, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v14, v15}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 201
    .local v14, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_2
    move-object/from16 v0, p1

    instance-of v15, v0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;

    if-eqz v15, :cond_b

    .line 202
    move-object/from16 v0, p1

    check-cast v0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;

    move-object v15, v0

    const-wide/16 v16, 0xfa

    sget-object v18, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v15 .. v18}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->setDelayStart(JLjava/util/concurrent/TimeUnit;)V

    .line 205
    :cond_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v15}, Lorg/eclipse/jgit/transport/Transport;->isRemoveDeletedRefs()Z

    move-result v15

    if-eqz v15, :cond_c

    .line 206
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/transport/FetchProcess;->deleteStaleTrackingRefs(Lorg/eclipse/jgit/transport/FetchResult;Lorg/eclipse/jgit/lib/BatchRefUpdate;)V

    .line 207
    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->localUpdates:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    .line 208
    .local v13, u:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/transport/FetchResult;->add(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)V

    .line 209
    invoke-virtual {v13}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->asReceiveCommand()Lorg/eclipse/jgit/transport/ReceiveCommand;

    move-result-object v15

    invoke-virtual {v3, v15}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->addCommand(Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/BatchRefUpdate;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    .line 225
    .end local v13           #u:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    :catch_0
    move-exception v5

    .line 226
    .local v5, err:Ljava/io/IOException;
    :try_start_3
    new-instance v15, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v16

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->failureUpdatingTrackingRef:Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v3}, Lorg/eclipse/jgit/transport/FetchProcess;->getFirstFailedRefName(Lorg/eclipse/jgit/lib/BatchRefUpdate;)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v5}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 230
    .end local v5           #err:Ljava/io/IOException;
    :catchall_1
    move-exception v15

    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v15

    .line 211
    :cond_d
    :try_start_4
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->getCommands()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_e
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 212
    .local v4, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v4, v14}, Lorg/eclipse/jgit/transport/ReceiveCommand;->updateType(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 213
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v15

    sget-object v16, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_e

    instance-of v15, v4, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;

    if-eqz v15, :cond_e

    move-object v0, v4

    check-cast v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/eclipse/jgit/transport/TrackingRefUpdate$Command;->canForceUpdate()Z

    move-result v15

    if-nez v15, :cond_e

    .line 216
    sget-object v15, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v4, v15}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_5

    .line 218
    .end local v4           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :cond_f
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v15}, Lorg/eclipse/jgit/transport/Transport;->isDryRun()Z

    move-result v15

    if-eqz v15, :cond_11

    .line 219
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->getCommands()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_10
    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_12

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 220
    .restart local v4       #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v15

    sget-object v16, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_10

    .line 221
    sget-object v15, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->OK:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v4, v15}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_6

    .line 224
    .end local v4           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :cond_11
    move-object/from16 v0, p1

    invoke-virtual {v3, v14, v0}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->execute(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 230
    :cond_12
    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 233
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/FetchProcess;->fetchHeadUpdates:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_13

    .line 235
    :try_start_5
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/FetchProcess;->updateFETCH_HEAD(Lorg/eclipse/jgit/transport/FetchResult;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 241
    :cond_13
    return-void

    .line 236
    :catch_1
    move-exception v5

    .line 237
    .restart local v5       #err:Ljava/io/IOException;
    new-instance v15, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v16

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->failureUpdatingFETCH_HEAD:Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v5}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15
.end method

.method private expandAutoFollowTags()Ljava/util/Collection;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 378
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .local v0, additionalTags:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs()Ljava/util/Map;

    move-result-object v1

    .line 380
    .local v1, haveRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v6}, Lorg/eclipse/jgit/transport/FetchConnection;->getRefs()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/Ref;

    .line 381
    .local v5, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-static {v5}, Lorg/eclipse/jgit/transport/FetchProcess;->isTag(Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 384
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 385
    .local v3, local:Lorg/eclipse/jgit/lib/Ref;
    if-nez v3, :cond_0

    .line 390
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 391
    .local v4, obj:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v4, :cond_1

    .line 392
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 394
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v6, v6, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6, v4}, Lorg/eclipse/jgit/lib/Repository;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 395
    :cond_2
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/FetchProcess;->wantTag(Lorg/eclipse/jgit/lib/Ref;)V

    goto :goto_0

    .line 397
    :cond_3
    invoke-interface {v0, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 399
    .end local v3           #local:Lorg/eclipse/jgit/lib/Ref;
    .end local v4           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_4
    return-object v0
.end method

.method private expandFetchTags()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 403
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs()Ljava/util/Map;

    move-result-object v0

    .line 404
    .local v0, haveRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v4}, Lorg/eclipse/jgit/transport/FetchConnection;->getRefs()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 405
    .local v3, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-static {v3}, Lorg/eclipse/jgit/transport/FetchProcess;->isTag(Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 407
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 408
    .local v2, local:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v2, :cond_1

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 409
    :cond_1
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/FetchProcess;->wantTag(Lorg/eclipse/jgit/lib/Ref;)V

    goto :goto_0

    .line 411
    .end local v2           #local:Lorg/eclipse/jgit/lib/Ref;
    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    return-void
.end method

.method private expandSingle(Lorg/eclipse/jgit/transport/RefSpec;Ljava/util/Set;)V
    .locals 6
    .parameter "spec"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            "Ljava/util/Set",
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
    .line 369
    .local p2, matched:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/eclipse/jgit/transport/FetchConnection;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 370
    .local v0, src:Lorg/eclipse/jgit/lib/Ref;
    if-nez v0, :cond_0

    .line 371
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->remoteDoesNotHaveSpec:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 373
    :cond_0
    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 374
    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/transport/FetchProcess;->want(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/transport/RefSpec;)V

    .line 375
    :cond_1
    return-void
.end method

.method private expandWildcard(Lorg/eclipse/jgit/transport/RefSpec;Ljava/util/Set;)V
    .locals 3
    .parameter "spec"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            "Ljava/util/Set",
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
    .line 361
    .local p2, matched:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v2}, Lorg/eclipse/jgit/transport/FetchConnection;->getRefs()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 362
    .local v1, src:Lorg/eclipse/jgit/lib/Ref;
    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/transport/RefSpec;->matchSource(Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 363
    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSource(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/eclipse/jgit/transport/FetchProcess;->want(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/transport/RefSpec;)V

    goto :goto_0

    .line 365
    .end local v1           #src:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return-void
.end method

.method private fetchObjects(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 3
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 246
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "jgit fetch "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v2, v2, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/FetchConnection;->setPackLockMessage(Ljava/lang/String;)V

    .line 247
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchProcess;->have:Ljava/util/HashSet;

    invoke-interface {v0, p1, v1, v2}, Lorg/eclipse/jgit/transport/FetchConnection;->fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->packLocks:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v1}, Lorg/eclipse/jgit/transport/FetchConnection;->getPackLocks()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 251
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/Transport;->isCheckFetchedObjects()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v0}, Lorg/eclipse/jgit/transport/FetchConnection;->didFetchTestConnectivity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/FetchProcess;->askForIsComplete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 253
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/Transport;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v1

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->peerDidNotSupplyACompleteObjectGraph:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v0

    .line 249
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->packLocks:Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v2}, Lorg/eclipse/jgit/transport/FetchConnection;->getPackLocks()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    throw v0

    .line 255
    :cond_0
    return-void
.end method

.method private static getFirstFailedRefName(Lorg/eclipse/jgit/lib/BatchRefUpdate;)Ljava/lang/String;
    .locals 4
    .parameter "batch"

    .prologue
    .line 502
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->getCommands()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 503
    .local v0, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->OK:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    if-eq v2, v3, :cond_0

    .line 504
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v2

    .line 506
    .end local v0           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :goto_0
    return-object v2

    :cond_1
    const-string v2, ""

    goto :goto_0
.end method

.method private static isTag(Ljava/lang/String;)Z
    .locals 1
    .parameter "name"

    .prologue
    .line 498
    const-string v0, "refs/tags/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isTag(Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 1
    .parameter "r"

    .prologue
    .line 494
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/transport/FetchProcess;->isTag(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private localRefs()Ljava/util/Map;
    .locals 3
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 453
    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 455
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs:Ljava/util/Map;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs:Ljava/util/Map;

    return-object v1

    .line 457
    :catch_0
    move-exception v0

    .line 458
    .local v0, err:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotListRefs:Ljava/lang/String;

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private removeFetchHeadRecord(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 3
    .parameter "want"

    .prologue
    .line 307
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchProcess;->fetchHeadUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 308
    .local v1, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/transport/FetchHeadRecord;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 309
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;

    .line 310
    .local v0, fh:Lorg/eclipse/jgit/transport/FetchHeadRecord;
    iget-object v2, v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->newValue:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 311
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 313
    .end local v0           #fh:Lorg/eclipse/jgit/transport/FetchHeadRecord;
    :cond_1
    return-void
.end method

.method private removeTrackingRefUpdate(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 3
    .parameter "want"

    .prologue
    .line 298
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 299
    .local v0, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/transport/TrackingRefUpdate;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 300
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    .line 301
    .local v1, u:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 302
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 304
    .end local v1           #u:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    :cond_1
    return-void
.end method

.method private reopenConnection()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 267
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    if-eqz v6, :cond_1

    .line 295
    :cond_0
    return-void

    .line 270
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/Transport;->openFetch()Lorg/eclipse/jgit/transport/FetchConnection;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    .line 280
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 281
    .local v0, avail:Ljava/util/HashMap;,"Ljava/util/HashMap<Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->conn:Lorg/eclipse/jgit/transport/FetchConnection;

    invoke-interface {v6}, Lorg/eclipse/jgit/transport/FetchConnection;->getRefs()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 282
    .local v3, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v0, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 284
    .end local v3           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 285
    .local v5, wants:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    .line 286
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 287
    .local v4, want:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 288
    .local v2, newRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v2, :cond_3

    .line 289
    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 291
    :cond_3
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/FetchProcess;->removeFetchHeadRecord(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 292
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/FetchProcess;->removeTrackingRefUpdate(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_1
.end method

.method private updateFETCH_HEAD(Lorg/eclipse/jgit/transport/FetchResult;)V
    .locals 7
    .parameter "result"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 316
    iget-object v5, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v5, v5, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v3

    .line 317
    .local v3, meta:Ljava/io/File;
    if-nez v3, :cond_0

    .line 337
    :goto_0
    return-void

    .line 319
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    new-instance v5, Ljava/io/File;

    const-string v6, "FETCH_HEAD"

    invoke-direct {v5, v3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v6, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v6, v6, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v6

    invoke-direct {v2, v5, v6}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 322
    .local v2, lock:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    :try_start_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 323
    new-instance v4, Ljava/io/OutputStreamWriter;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 325
    .local v4, w:Ljava/io/Writer;
    :try_start_1
    iget-object v5, p0, Lorg/eclipse/jgit/transport/FetchProcess;->fetchHeadUpdates:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;

    .line 326
    .local v0, h:Lorg/eclipse/jgit/transport/FetchHeadRecord;
    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/transport/FetchHeadRecord;->write(Ljava/io/Writer;)V

    .line 327
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/FetchResult;->add(Lorg/eclipse/jgit/transport/FetchHeadRecord;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 330
    .end local v0           #h:Lorg/eclipse/jgit/transport/FetchHeadRecord;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    :try_start_2
    invoke-virtual {v4}, Ljava/io/Writer;->close()V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 335
    .end local v4           #w:Ljava/io/Writer;
    :catchall_1
    move-exception v5

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    throw v5

    .line 330
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v4       #w:Ljava/io/Writer;
    :cond_1
    :try_start_3
    invoke-virtual {v4}, Ljava/io/Writer;->close()V

    .line 332
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commit()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 335
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v4           #w:Ljava/io/Writer;
    :cond_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    goto :goto_0
.end method

.method private want(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/transport/RefSpec;)V
    .locals 4
    .parameter "src"
    .parameter "spec"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 420
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 421
    .local v1, newId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p2}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 422
    invoke-direct {p0, p2, v1}, Lorg/eclipse/jgit/transport/FetchProcess;->createUpdate(Lorg/eclipse/jgit/transport/RefSpec;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    move-result-object v2

    .line 423
    .local v2, tru:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 436
    .end local v2           #tru:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    :goto_0
    return-void

    .line 425
    .restart local v2       #tru:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 428
    .end local v2           #tru:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v3, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    new-instance v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/FetchHeadRecord;-><init>()V

    .line 431
    .local v0, fhr:Lorg/eclipse/jgit/transport/FetchHeadRecord;
    iput-object v1, v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->newValue:Lorg/eclipse/jgit/lib/ObjectId;

    .line 432
    invoke-virtual {p2}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    const/4 v3, 0x1

    :goto_1
    iput-boolean v3, v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->notForMerge:Z

    .line 433
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    .line 434
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/Transport;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v3

    iput-object v3, v0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceURI:Lorg/eclipse/jgit/transport/URIish;

    .line 435
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->fetchHeadUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 432
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private wantTag(Lorg/eclipse/jgit/lib/Ref;)V
    .locals 2
    .parameter "r"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 414
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/RefSpec;-><init>()V

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;->setSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;->setDestination(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;->setForceUpdate(Z)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/FetchProcess;->want(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/transport/RefSpec;)V

    .line 416
    return-void
.end method


# virtual methods
.method execute(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/transport/FetchResult;)V
    .locals 5
    .parameter "monitor"
    .parameter "result"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->askFor:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 116
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 117
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->fetchHeadUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 118
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->packLocks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 119
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->localRefs:Ljava/util/Map;

    .line 122
    :try_start_0
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/FetchProcess;->executeImp(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/transport/FetchResult;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/FetchProcess;->packLocks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 126
    .local v2, lock:Lorg/eclipse/jgit/internal/storage/file/PackLock;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/PackLock;->unlock()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 127
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #lock:Lorg/eclipse/jgit/internal/storage/file/PackLock;
    :catch_0
    move-exception v0

    .line 128
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 124
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_0
    throw v3

    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    .line 125
    :try_start_2
    iget-object v4, p0, Lorg/eclipse/jgit/transport/FetchProcess;->packLocks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1       #i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 126
    .restart local v2       #lock:Lorg/eclipse/jgit/internal/storage/file/PackLock;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/PackLock;->unlock()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 127
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #lock:Lorg/eclipse/jgit/internal/storage/file/PackLock;
    :catch_1
    move-exception v0

    .line 128
    .restart local v0       #e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 131
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_1
    return-void
.end method
