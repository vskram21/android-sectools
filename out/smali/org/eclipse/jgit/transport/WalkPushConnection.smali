.class Lorg/eclipse/jgit/transport/WalkPushConnection;
.super Lorg/eclipse/jgit/transport/BaseConnection;
.source "WalkPushConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PushConnection;


# instance fields
.field private final dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

.field private final local:Lorg/eclipse/jgit/lib/Repository;

.field private newRefs:Ljava/util/Map;
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

.field private packNames:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private packedRefUpdates:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;"
        }
    .end annotation
.end field

.field private final transport:Lorg/eclipse/jgit/transport/Transport;

.field private final uri:Lorg/eclipse/jgit/transport/URIish;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/WalkTransport;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)V
    .locals 1
    .parameter "walkTransport"
    .parameter "w"

    .prologue
    .line 130
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseConnection;-><init>()V

    .line 131
    check-cast p1, Lorg/eclipse/jgit/transport/Transport;

    .end local p1
    iput-object p1, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    .line 132
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/Transport;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    .line 134
    iput-object p2, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    .line 135
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/transport/WalkPushConnection;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    .locals 1
    .parameter "x0"

    .prologue
    .line 98
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    return-object v0
.end method

.method private createNewRepository(Ljava/util/List;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 363
    .local p1, updates:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ref: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Lorg/eclipse/jgit/transport/WalkPushConnection;->pickHEAD(Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 364
    .local v3, ref:Ljava/lang/String;
    invoke-static {v3}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    .line 365
    .local v0, bytes:[B
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    const-string v5, "../HEAD"

    invoke-virtual {v4, v5, v0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 371
    :try_start_1
    const-string v1, "[core]\n\trepositoryformatversion = 0\n"

    .line 373
    .local v1, config:Ljava/lang/String;
    const-string v4, "[core]\n\trepositoryformatversion = 0\n"

    invoke-static {v4}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    .line 374
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    const-string v5, "../config"

    invoke-virtual {v4, v5, v0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;[B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 378
    return-void

    .line 366
    .end local v0           #bytes:[B
    .end local v1           #config:Ljava/lang/String;
    .end local v3           #ref:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 367
    .local v2, e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateHEAD:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 375
    .end local v2           #e:Ljava/io/IOException;
    .restart local v0       #bytes:[B
    .restart local v3       #ref:Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 376
    .restart local v2       #e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateConfig:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private deleteCommand(Lorg/eclipse/jgit/transport/RemoteRefUpdate;)V
    .locals 4
    .parameter "u"

    .prologue
    .line 314
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->newRefs:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 315
    .local v1, r:Lorg/eclipse/jgit/lib/Ref;
    if-nez v1, :cond_0

    .line 318
    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 341
    :goto_0
    return-void

    .line 322
    :cond_0
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Ref$Storage;->isPacked()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 323
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packedRefUpdates:Ljava/util/Collection;

    invoke-interface {v2, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 325
    :cond_1
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Ref$Storage;->isLoose()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 327
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->deleteRef(Ljava/lang/String;)V

    .line 328
    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 336
    :cond_2
    :goto_1
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->deleteRefLog(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 337
    :catch_0
    move-exception v0

    .line 338
    .local v0, e:Ljava/io/IOException;
    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 339
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setMessage(Ljava/lang/String;)V

    goto :goto_0

    .line 329
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 330
    .restart local v0       #e:Ljava/io/IOException;
    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 331
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setMessage(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private isNewRepository()Z
    .locals 1

    .prologue
    .line 356
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/WalkPushConnection;->getRefsMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static pickHEAD(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 385
    .local p0, updates:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 386
    .local v2, u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v1

    .line 387
    .local v1, n:Ljava/lang/String;
    const-string v3, "refs/heads/master"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 399
    .end local v1           #n:Ljava/lang/String;
    .end local v2           #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :goto_0
    return-object v1

    .line 394
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 395
    .restart local v2       #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v1

    .line 396
    .restart local v1       #n:Ljava/lang/String;
    const-string v3, "refs/heads/"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 399
    .end local v1           #n:Ljava/lang/String;
    .end local v2           #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_3
    const/4 v3, 0x0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private safeDelete(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 302
    if-eqz p1, :cond_0

    .line 304
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->deleteFile(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    :cond_0
    :goto_0
    return-void

    .line 305
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private sendpack(Ljava/util/List;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 22
    .parameter
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 220
    .local p1, updates:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    const/4 v14, 0x0

    .line 221
    .local v14, pathPack:Ljava/lang/String;
    const/4 v13, 0x0

    .line 223
    .local v13, pathIdx:Ljava/lang/String;
    new-instance v16, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/transport/Transport;->getPackConfig()Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 226
    .local v16, writer:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :try_start_0
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 227
    .local v9, need:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 228
    .local v5, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 229
    .local v15, r:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v15}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v9, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 291
    .end local v5           #have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v9           #need:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .end local v15           #r:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :catch_0
    move-exception v4

    .line 292
    .local v4, err:Ljava/io/IOException;
    :try_start_1
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/eclipse/jgit/transport/WalkPushConnection;->safeDelete(Ljava/lang/String;)V

    .line 293
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/eclipse/jgit/transport/WalkPushConnection;->safeDelete(Ljava/lang/String;)V

    .line 295
    new-instance v18, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    move-object/from16 v19, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotStoreObjects:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v18
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 297
    .end local v4           #err:Ljava/io/IOException;
    :catchall_0
    move-exception v18

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    throw v18

    .line 230
    .restart local v5       #have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .restart local v6       #i$:Ljava/util/Iterator;
    .restart local v9       #need:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :cond_0
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/transport/WalkPushConnection;->getRefs()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/lib/Ref;

    .line 231
    .local v15, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v5, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 232
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    if-eqz v18, :cond_1

    .line 233
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v5, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 235
    .end local v15           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v9, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 241
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-wide v18

    const-wide/16 v20, 0x0

    cmp-long v18, v18, v20

    if-nez v18, :cond_3

    .line 297
    :goto_2
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 299
    return-void

    .line 244
    :cond_3
    :try_start_3
    new-instance v18, Ljava/util/LinkedHashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    .line 245
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->getPackNames()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 246
    .local v8, n:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v8, v8}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 248
    .end local v8           #n:Ljava/lang/String;
    :cond_4
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "pack-"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->computeName()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 249
    .local v3, base:Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ".pack"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 250
    .local v12, packName:Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "pack/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 251
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "pack/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ".idx"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    if-eqz v18, :cond_5

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeInfoPacks(Ljava/util/Collection;)V

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->deleteFile(Ljava/lang/String;)V

    .line 265
    :cond_5
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Put "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x0

    const/16 v20, 0xc

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 266
    .local v17, wt:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "..pack"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-virtual {v0, v14, v1, v2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v10

    .line 268
    .local v10, os:Ljava/io/OutputStream;
    :try_start_4
    new-instance v11, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v11, v10}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 269
    .end local v10           #os:Ljava/io/OutputStream;
    .local v11, os:Ljava/io/OutputStream;
    :try_start_5
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v11}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 271
    :try_start_6
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "..idx"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-virtual {v0, v13, v1, v2}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeFile(Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    move-result-object v10

    .line 276
    .end local v11           #os:Ljava/io/OutputStream;
    .restart local v10       #os:Ljava/io/OutputStream;
    :try_start_7
    new-instance v11, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v11, v10}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 277
    .end local v10           #os:Ljava/io/OutputStream;
    .restart local v11       #os:Ljava/io/OutputStream;
    :try_start_8
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeIndex(Ljava/io/OutputStream;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 279
    :try_start_9
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    .line 286
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 287
    .local v7, infoPacks:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeInfoPacks(Ljava/util/Collection;)V

    goto/16 :goto_2

    .line 271
    .end local v7           #infoPacks:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v11           #os:Ljava/io/OutputStream;
    .restart local v10       #os:Ljava/io/OutputStream;
    :catchall_1
    move-exception v18

    :goto_4
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    throw v18

    .line 279
    :catchall_2
    move-exception v18

    :goto_5
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    throw v18
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    .end local v10           #os:Ljava/io/OutputStream;
    .restart local v11       #os:Ljava/io/OutputStream;
    :catchall_3
    move-exception v18

    move-object v10, v11

    .end local v11           #os:Ljava/io/OutputStream;
    .restart local v10       #os:Ljava/io/OutputStream;
    goto :goto_5

    .line 271
    .end local v10           #os:Ljava/io/OutputStream;
    .restart local v11       #os:Ljava/io/OutputStream;
    :catchall_4
    move-exception v18

    move-object v10, v11

    .end local v11           #os:Ljava/io/OutputStream;
    .restart local v10       #os:Ljava/io/OutputStream;
    goto :goto_4
.end method

.method private updateCommand(Lorg/eclipse/jgit/transport/RemoteRefUpdate;)V
    .locals 7
    .parameter "u"

    .prologue
    .line 345
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->writeRef(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 346
    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->newRefs:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v4, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    sget-object v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 353
    :goto_0
    return-void

    .line 349
    :catch_0
    move-exception v0

    .line 350
    .local v0, e:Ljava/io/IOException;
    sget-object v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 351
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setMessage(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->dest:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->close()V

    .line 216
    return-void
.end method

.method public push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;)V
    .locals 1
    .parameter "monitor"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 140
    .local p2, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jgit/transport/WalkPushConnection;->push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V

    .line 141
    return-void
.end method

.method public push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V
    .locals 9
    .parameter "monitor"
    .parameter
    .parameter "out"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 146
    .local p2, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/WalkPushConnection;->markStartedOperation()V

    .line 147
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packNames:Ljava/util/LinkedHashMap;

    .line 148
    new-instance v6, Ljava/util/TreeMap;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/WalkPushConnection;->getRefsMap()Ljava/util/Map;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    iput-object v6, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->newRefs:Ljava/util/Map;

    .line 149
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v6, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packedRefUpdates:Ljava/util/Collection;

    .line 155
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v5, updates:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 157
    .local v4, u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v2

    .line 158
    .local v2, n:Ljava/lang/String;
    const-string v6, "refs/"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 159
    :cond_0
    sget-object v6, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 160
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->funnyRefname:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setMessage(Ljava/lang/String;)V

    goto :goto_0

    .line 164
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 165
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/WalkPushConnection;->deleteCommand(Lorg/eclipse/jgit/transport/RemoteRefUpdate;)V

    goto :goto_0

    .line 167
    :cond_2
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 174
    .end local v2           #n:Ljava/lang/String;
    .end local v4           #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_3
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    .line 175
    invoke-direct {p0, v5, p1}, Lorg/eclipse/jgit/transport/WalkPushConnection;->sendpack(Ljava/util/List;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 176
    :cond_4
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 177
    .restart local v4       #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/WalkPushConnection;->updateCommand(Lorg/eclipse/jgit/transport/RemoteRefUpdate;)V

    goto :goto_1

    .line 182
    .end local v4           #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_5
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkPushConnection;->isNewRepository()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 183
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/WalkPushConnection;->createNewRepository(Ljava/util/List;)V

    .line 185
    :cond_6
    new-instance v3, Lorg/eclipse/jgit/transport/WalkPushConnection$1;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->newRefs:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v3, p0, v6}, Lorg/eclipse/jgit/transport/WalkPushConnection$1;-><init>(Lorg/eclipse/jgit/transport/WalkPushConnection;Ljava/util/Collection;)V

    .line 192
    .local v3, refWriter:Lorg/eclipse/jgit/lib/RefWriter;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packedRefUpdates:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8

    .line 194
    :try_start_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefWriter;->writePackedRefs()V

    .line 195
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packedRefUpdates:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 196
    .restart local v4       #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    sget-object v6, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 197
    .end local v4           #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :catch_0
    move-exception v0

    .line 198
    .local v0, err:Ljava/io/IOException;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->packedRefUpdates:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 199
    .restart local v4       #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    sget-object v6, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    .line 200
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setMessage(Ljava/lang/String;)V

    goto :goto_3

    .line 202
    .end local v4           #u:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_7
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->failedUpdatingRefs:Ljava/lang/String;

    invoke-direct {v6, v7, v8, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 207
    .end local v0           #err:Ljava/io/IOException;
    :cond_8
    :try_start_1
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefWriter;->writeInfoRefs()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 211
    return-void

    .line 208
    :catch_1
    move-exception v0

    .line 209
    .restart local v0       #err:Ljava/io/IOException;
    new-instance v6, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->failedUpdatingRefs:Ljava/lang/String;

    invoke-direct {v6, v7, v8, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method
