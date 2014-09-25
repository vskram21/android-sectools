.class final Lorg/eclipse/jgit/transport/PreUploadHook$1;
.super Ljava/lang/Object;
.source "PreUploadHook.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PreUploadHook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PreUploadHook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBeginNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;I)V
    .locals 0
    .parameter "up"
    .parameter
    .parameter "cntOffered"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/UploadPack;",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 65
    .local p2, wants:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    return-void
.end method

.method public onEndNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;IIZ)V
    .locals 0
    .parameter "up"
    .parameter
    .parameter "cntCommon"
    .parameter "cntNotFound"
    .parameter "ready"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/UploadPack;",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;IIZ)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 72
    .local p2, wants:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    return-void
.end method

.method public onSendPack(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 0
    .parameter "up"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/UploadPack;",
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
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 79
    .local p2, wants:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p3, haves:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    return-void
.end method
