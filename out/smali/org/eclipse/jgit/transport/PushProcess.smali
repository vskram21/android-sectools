.class Lorg/eclipse/jgit/transport/PushProcess;
.super Ljava/lang/Object;
.source "PushProcess.java"


# static fields
.field static final PROGRESS_OPENING_CONNECTION:Ljava/lang/String;


# instance fields
.field private connection:Lorg/eclipse/jgit/transport/PushConnection;

.field private final out:Ljava/io/OutputStream;

.field private final toPush:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;"
        }
    .end annotation
.end field

.field private final transport:Lorg/eclipse/jgit/transport/Transport;

.field private final walker:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->openingConnection:Ljava/lang/String;

    sput-object v0, Lorg/eclipse/jgit/transport/PushProcess;->PROGRESS_OPENING_CONNECTION:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/transport/Transport;Ljava/util/Collection;)V
    .locals 1
    .parameter "transport"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/Transport;",
            "Ljava/util/Collection",
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
    .line 102
    .local p2, toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/transport/PushProcess;-><init>(Lorg/eclipse/jgit/transport/Transport;Ljava/util/Collection;Ljava/io/OutputStream;)V

    .line 103
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/transport/Transport;Ljava/util/Collection;Ljava/io/OutputStream;)V
    .locals 7
    .parameter "transport"
    .parameter
    .parameter "out"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/Transport;",
            "Ljava/util/Collection",
            "<",
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
    .line 119
    .local p2, toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v3, p1, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PushProcess;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 121
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PushProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    .line 122
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/PushProcess;->toPush:Ljava/util/Map;

    .line 123
    iput-object p3, p0, Lorg/eclipse/jgit/transport/PushProcess;->out:Ljava/io/OutputStream;

    .line 124
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 125
    .local v1, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PushProcess;->toPush:Ljava/util/Map;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 126
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->duplicateRemoteRefUpdateIsIllegal:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 129
    .end local v1           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_1
    return-void
.end method

.method private modifyUpdatesForDryRun()V
    .locals 4

    .prologue
    .line 247
    iget-object v2, p0, Lorg/eclipse/jgit/transport/PushProcess;->toPush:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

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

    check-cast v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 248
    .local v1, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getStatus()Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    if-ne v2, v3, :cond_0

    .line 249
    sget-object v2, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    goto :goto_0

    .line 250
    .end local v1           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_1
    return-void
.end method

.method private prepareRemoteUpdates()Ljava/util/Map;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    .line 185
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 186
    .local v6, result:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PushProcess;->toPush:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 187
    .local v7, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;

    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/eclipse/jgit/transport/PushConnection;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 188
    .local v1, advertisedRef:Lorg/eclipse/jgit/lib/Ref;
    if-nez v1, :cond_0

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 191
    .local v0, advertisedOld:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_1
    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v9

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 192
    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->isDelete()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 194
    sget-object v9, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->NON_EXISTING:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v7, v9}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    goto :goto_0

    .line 188
    .end local v0           #advertisedOld:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    goto :goto_1

    .line 197
    .restart local v0       #advertisedOld:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    sget-object v9, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->UP_TO_DATE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v7, v9}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    goto :goto_0

    .line 204
    :cond_2
    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->isExpectingOldObjectId()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getExpectedOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v9

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 206
    sget-object v9, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_REMOTE_CHANGED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v7, v9}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    goto :goto_0

    .line 212
    :cond_3
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v9

    invoke-virtual {v0, v9}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v9

    if-nez v9, :cond_4

    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->isDelete()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 213
    :cond_4
    invoke-virtual {v7, v12}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setFastForward(Z)V

    .line 214
    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 222
    :cond_5
    const/4 v2, 0x1

    .line 224
    .local v2, fastForward:Z
    :try_start_0
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PushProcess;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    .line 225
    .local v5, oldRev:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v9, p0, Lorg/eclipse/jgit/transport/PushProcess;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    .line 226
    .local v4, newRev:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v9, v5, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v9, :cond_6

    instance-of v9, v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v9, :cond_6

    iget-object v9, p0, Lorg/eclipse/jgit/transport/PushProcess;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    check-cast v5, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v5           #oldRev:Lorg/eclipse/jgit/revwalk/RevObject;
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v4           #newRev:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v9, v5, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v9

    if-nez v9, :cond_7

    .line 230
    :cond_6
    const/4 v2, 0x0

    .line 237
    :cond_7
    :goto_2
    invoke-virtual {v7, v2}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setFastForward(Z)V

    .line 238
    if-nez v2, :cond_8

    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->isForceUpdate()Z

    move-result v9

    if-nez v9, :cond_8

    .line 239
    sget-object v9, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v7, v9}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V

    goto/16 :goto_0

    .line 231
    :catch_0
    move-exception v8

    .line 232
    .local v8, x:Lorg/eclipse/jgit/errors/MissingObjectException;
    const/4 v2, 0x0

    .line 236
    goto :goto_2

    .line 233
    .end local v8           #x:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catch_1
    move-exception v8

    .line 234
    .local v8, x:Ljava/lang/Exception;
    new-instance v9, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v10, p0, Lorg/eclipse/jgit/transport/PushProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v10}, Lorg/eclipse/jgit/transport/Transport;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v10

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->readingObjectsFromLocalRepositoryFailed:Ljava/lang/String;

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11, v8}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 241
    .end local v8           #x:Ljava/lang/Exception;
    :cond_8
    invoke-virtual {v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getRemoteName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 243
    .end local v0           #advertisedOld:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v1           #advertisedRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v2           #fastForward:Z
    .end local v7           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    :cond_9
    return-object v6
.end method

.method private updateTrackingRefs()V
    .locals 4

    .prologue
    .line 253
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PushProcess;->toPush:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 254
    .local v1, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getStatus()Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    move-result-object v2

    .line 255
    .local v2, status:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->hasTrackingRefUpdate()Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->UP_TO_DATE:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    if-eq v2, v3, :cond_1

    sget-object v3, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->OK:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    if-ne v2, v3, :cond_0

    .line 262
    :cond_1
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/PushProcess;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->updateTrackingRef(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 263
    :catch_0
    move-exception v3

    goto :goto_0

    .line 268
    .end local v1           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    .end local v2           #status:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;
    :cond_2
    return-void
.end method


# virtual methods
.method execute(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/transport/PushResult;
    .locals 7
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 150
    :try_start_0
    sget-object v5, Lorg/eclipse/jgit/transport/PushProcess;->PROGRESS_OPENING_CONNECTION:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-interface {p1, v5, v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 153
    new-instance v2, Lorg/eclipse/jgit/transport/PushResult;

    invoke-direct {v2}, Lorg/eclipse/jgit/transport/PushResult;-><init>()V

    .line 154
    .local v2, res:Lorg/eclipse/jgit/transport/PushResult;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/Transport;->openPush()Lorg/eclipse/jgit/transport/PushConnection;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    :try_start_1
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/Transport;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;

    invoke-interface {v6}, Lorg/eclipse/jgit/transport/PushConnection;->getRefsMap()Ljava/util/Map;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/eclipse/jgit/transport/PushResult;->setAdvertisedRefs(Lorg/eclipse/jgit/transport/URIish;Ljava/util/Map;)V

    .line 158
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->toPush:Ljava/util/Map;

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/transport/PushResult;->setRemoteUpdates(Ljava/util/Map;)V

    .line 159
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 161
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PushProcess;->prepareRemoteUpdates()Ljava/util/Map;

    move-result-object v1

    .line 162
    .local v1, preprocessed:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/Transport;->isDryRun()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 163
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PushProcess;->modifyUpdatesForDryRun()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 167
    :cond_0
    :goto_0
    :try_start_2
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;

    invoke-interface {v5}, Lorg/eclipse/jgit/transport/PushConnection;->close()V

    .line 168
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;

    invoke-interface {v5}, Lorg/eclipse/jgit/transport/PushConnection;->getMessages()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/eclipse/jgit/transport/PushResult;->addMessages(Ljava/lang/String;)V

    .line 170
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/Transport;->isDryRun()Z

    move-result v5

    if-nez v5, :cond_1

    .line 171
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/PushProcess;->updateTrackingRefs()V

    .line 172
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->toPush:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    .line 173
    .local v3, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->getTrackingRefUpdate()Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    move-result-object v4

    .line 174
    .local v4, tru:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    if-eqz v4, :cond_2

    .line 175
    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/transport/PushResult;->add(Lorg/eclipse/jgit/transport/TrackingRefUpdate;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 179
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #preprocessed:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    .end local v2           #res:Lorg/eclipse/jgit/transport/PushResult;
    .end local v3           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    .end local v4           #tru:Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PushProcess;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v5

    .line 164
    .restart local v1       #preprocessed:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    .restart local v2       #res:Lorg/eclipse/jgit/transport/PushResult;
    :cond_3
    :try_start_3
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 165
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/PushProcess;->out:Ljava/io/OutputStream;

    invoke-interface {v5, p1, v1, v6}, Lorg/eclipse/jgit/transport/PushConnection;->push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 167
    .end local v1           #preprocessed:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    :catchall_1
    move-exception v5

    :try_start_4
    iget-object v6, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;

    invoke-interface {v6}, Lorg/eclipse/jgit/transport/PushConnection;->close()V

    .line 168
    iget-object v6, p0, Lorg/eclipse/jgit/transport/PushProcess;->connection:Lorg/eclipse/jgit/transport/PushConnection;

    invoke-interface {v6}, Lorg/eclipse/jgit/transport/PushConnection;->getMessages()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/eclipse/jgit/transport/PushResult;->addMessages(Ljava/lang/String;)V

    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 179
    .restart local v0       #i$:Ljava/util/Iterator;
    .restart local v1       #preprocessed:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    :cond_4
    iget-object v5, p0, Lorg/eclipse/jgit/transport/PushProcess;->walker:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    return-object v2
.end method
