.class public Lorg/eclipse/jgit/transport/RemoteRefUpdate;
.super Ljava/lang/Object;
.source "RemoteRefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;
    }
.end annotation


# instance fields
.field private final expectedOldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

.field private fastForward:Z

.field private final forceUpdate:Z

.field private final localDb:Lorg/eclipse/jgit/lib/Repository;

.field private localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

.field private message:Ljava/lang/String;

.field private final newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

.field private final remoteName:Ljava/lang/String;

.field private final srcRef:Ljava/lang/String;

.field private status:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

.field private final trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 8
    .parameter "localDb"
    .parameter "srcRef"
    .parameter "remoteName"
    .parameter "forceUpdate"
    .parameter "localName"
    .parameter "expectedOldObjectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    if-eqz p2, :cond_0

    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;ZLjava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 195
    return-void

    .line 192
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    goto :goto_0
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;ZLjava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 6
    .parameter "localDb"
    .parameter "srcRef"
    .parameter "srcId"
    .parameter "remoteName"
    .parameter "forceUpdate"
    .parameter "localName"
    .parameter "expectedOldObjectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 285
    if-nez p4, :cond_0

    .line 286
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->remoteNameCantBeNull:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_0
    if-nez p3, :cond_1

    if-eqz p2, :cond_1

    .line 288
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->sourceRefDoesntResolveToAnyObject:Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v1, v3

    invoke-static {v2, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 291
    :cond_1
    if-eqz p2, :cond_2

    .line 292
    iput-object p2, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->srcRef:Ljava/lang/String;

    .line 298
    :goto_0
    if-eqz p3, :cond_4

    .line 299
    iput-object p3, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 303
    :goto_1
    iput-object p4, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->remoteName:Ljava/lang/String;

    .line 304
    iput-boolean p5, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->forceUpdate:Z

    .line 305
    if-eqz p6, :cond_6

    if-eqz p1, :cond_6

    .line 306
    invoke-virtual {p1, p6}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    .line 307
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 308
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    const-string v2, "push"

    invoke-virtual {v0, v2, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 309
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 310
    new-instance v0, Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    :goto_2
    iget-object v5, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    move-object v2, p4

    move-object v3, p6

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;-><init>(ZLjava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    .line 320
    :goto_3
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localDb:Lorg/eclipse/jgit/lib/Repository;

    .line 321
    iput-object p7, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->expectedOldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 322
    sget-object v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->status:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 323
    return-void

    .line 293
    :cond_2
    if-eqz p3, :cond_3

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {p3, v0}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 294
    invoke-virtual {p3}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->srcRef:Ljava/lang/String;

    goto :goto_0

    .line 296
    :cond_3
    iput-object v2, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->srcRef:Ljava/lang/String;

    goto :goto_0

    .line 301
    :cond_4
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    goto :goto_1

    .line 310
    :cond_5
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    goto :goto_2

    .line 319
    :cond_6
    iput-object v2, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    goto :goto_3
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/Ref;Ljava/lang/String;ZLjava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 8
    .parameter "localDb"
    .parameter "srcRef"
    .parameter "remoteName"
    .parameter "forceUpdate"
    .parameter "localName"
    .parameter "expectedOldObjectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 236
    if-eqz p2, :cond_1

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    :goto_0
    if-eqz p2, :cond_0

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    :cond_0
    move-object v0, p0

    move-object v1, p1

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;ZLjava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 239
    return-void

    :cond_1
    move-object v2, v3

    .line 236
    goto :goto_0
.end method

.method public constructor <init>(Lorg/eclipse/jgit/transport/RemoteRefUpdate;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 7
    .parameter "base"
    .parameter "newExpectedOldObjectId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    iget-object v1, p1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localDb:Lorg/eclipse/jgit/lib/Repository;

    iget-object v2, p1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->srcRef:Ljava/lang/String;

    iget-object v3, p1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->remoteName:Ljava/lang/String;

    iget-boolean v4, p1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->forceUpdate:Z

    iget-object v0, p1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    if-nez v0, :cond_0

    const/4 v5, 0x0

    :goto_0
    move-object v0, p0

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 346
    return-void

    .line 343
    :cond_0
    iget-object v0, p1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->getLocalName()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method


# virtual methods
.method public getExpectedOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 353
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->expectedOldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 440
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 368
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getRemoteName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 382
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->remoteName:Ljava/lang/String;

    return-object v0
.end method

.method public getSrcRef()Ljava/lang/String;
    .locals 1

    .prologue
    .line 399
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->srcRef:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;
    .locals 1

    .prologue
    .line 422
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->status:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    return-object v0
.end method

.method public getTrackingRefUpdate()Lorg/eclipse/jgit/transport/TrackingRefUpdate;
    .locals 1

    .prologue
    .line 389
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    return-object v0
.end method

.method public hasTrackingRefUpdate()Z
    .locals 1

    .prologue
    .line 407
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDelete()Z
    .locals 2

    .prologue
    .line 375
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    return v0
.end method

.method public isExpectingOldObjectId()Z
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->expectedOldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFastForward()Z
    .locals 1

    .prologue
    .line 432
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->fastForward:Z

    return v0
.end method

.method public isForceUpdate()Z
    .locals 1

    .prologue
    .line 415
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->forceUpdate:Z

    return v0
.end method

.method setFastForward(Z)V
    .locals 0
    .parameter "fastForward"

    .prologue
    .line 448
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->fastForward:Z

    .line 449
    return-void
.end method

.method setMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 452
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->message:Ljava/lang/String;

    .line 453
    return-void
.end method

.method setStatus(Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;)V
    .locals 0
    .parameter "status"

    .prologue
    .line 444
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->status:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    .line 445
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 473
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RemoteRefUpdate[remoteName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->remoteName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->status:Lorg/eclipse/jgit/transport/RemoteRefUpdate$Status;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->expectedOldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->expectedOldObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->newObjectId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->fastForward:Z

    if-eqz v0, :cond_2

    const-string v0, ", fastForward"

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", srcRef="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->srcRef:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->forceUpdate:Z

    if-eqz v0, :cond_3

    const-string v0, ", forceUpdate"

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->message:Ljava/lang/String;

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->message:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_4
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "(null)"

    goto :goto_0

    :cond_1
    const-string v0, "(null)"

    goto :goto_1

    :cond_2
    const-string v0, ""

    goto :goto_2

    :cond_3
    const-string v0, ""

    goto :goto_3

    :cond_4
    const-string v0, "null"

    goto :goto_4
.end method

.method protected updateTrackingRef(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 2
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 464
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->isDelete()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->delete(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    .line 468
    :goto_0
    return-void

    .line 467
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->trackingRefUpdate:Lorg/eclipse/jgit/transport/TrackingRefUpdate;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;->localUpdate:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/TrackingRefUpdate;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    goto :goto_0
.end method
