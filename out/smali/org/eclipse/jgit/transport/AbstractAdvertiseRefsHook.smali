.class public abstract Lorg/eclipse/jgit/transport/AbstractAdvertiseRefsHook;
.super Ljava/lang/Object;
.source "AbstractAdvertiseRefsHook.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/AdvertiseRefsHook;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public advertiseRefs(Lorg/eclipse/jgit/transport/BaseReceivePack;)V
    .locals 4
    .parameter "receivePack"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/transport/AbstractAdvertiseRefsHook;->getAdvertisedRefs(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/revwalk/RevWalk;)Ljava/util/Map;

    move-result-object v1

    .line 70
    .local v1, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/transport/AbstractAdvertiseRefsHook;->getAdvertisedHaves(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/revwalk/RevWalk;)Ljava/util/Set;

    move-result-object v0

    .line 72
    .local v0, haves:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-virtual {p1, v1, v0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->setAdvertisedRefs(Ljava/util/Map;Ljava/util/Set;)V

    .line 73
    return-void
.end method

.method public advertiseRefs(Lorg/eclipse/jgit/transport/UploadPack;)V
    .locals 2
    .parameter "uploadPack"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack;->getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/AbstractAdvertiseRefsHook;->getAdvertisedRefs(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/revwalk/RevWalk;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/transport/UploadPack;->setAdvertisedRefs(Ljava/util/Map;)V

    .line 64
    return-void
.end method

.method protected getAdvertisedHaves(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/revwalk/RevWalk;)Ljava/util/Set;
    .locals 1
    .parameter "repository"
    .parameter "revWalk"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Lorg/eclipse/jgit/revwalk/RevWalk;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 105
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract getAdvertisedRefs(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/revwalk/RevWalk;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Lorg/eclipse/jgit/revwalk/RevWalk;",
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
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation
.end method
