.class public Lorg/eclipse/jgit/transport/PushResult;
.super Lorg/eclipse/jgit/transport/OperationResult;
.source "PushResult.java"


# instance fields
.field private remoteUpdates:Ljava/util/Map;
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


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/OperationResult;-><init>()V

    .line 59
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PushResult;->remoteUpdates:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getRemoteUpdate(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    .locals 1
    .parameter "refName"

    .prologue
    .line 85
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PushResult;->remoteUpdates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    return-object v0
.end method

.method public getRemoteUpdates()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PushResult;->remoteUpdates:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method setRemoteUpdates(Ljava/util/Map;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, remoteUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PushResult;->remoteUpdates:Ljava/util/Map;

    .line 91
    return-void
.end method
