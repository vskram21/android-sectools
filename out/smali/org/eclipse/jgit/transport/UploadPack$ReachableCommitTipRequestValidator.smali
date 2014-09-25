.class public final Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;
.super Ljava/lang/Object;
.source "UploadPack.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/UploadPack$RequestValidator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/UploadPack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReachableCommitTipRequestValidator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V
    .locals 3
    .parameter "up"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/UploadPack;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/PackProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1144
    .local p2, wants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack;->getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    #calls: Lorg/eclipse/jgit/transport/UploadPack;->refIdSet(Ljava/util/Collection;)Ljava/util/Set;
    invoke-static {v1}, Lorg/eclipse/jgit/transport/UploadPack;->access$000(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v1

    #calls: Lorg/eclipse/jgit/transport/UploadPack;->checkNotAdvertisedWants(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/List;Ljava/util/Set;)V
    invoke-static {v0, p2, v1}, Lorg/eclipse/jgit/transport/UploadPack;->access$100(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/List;Ljava/util/Set;)V

    .line 1146
    return-void
.end method
