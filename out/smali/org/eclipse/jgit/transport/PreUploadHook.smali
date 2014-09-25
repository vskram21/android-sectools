.class public interface abstract Lorg/eclipse/jgit/transport/PreUploadHook;
.super Ljava/lang/Object;
.source "PreUploadHook.java"


# static fields
.field public static final NULL:Lorg/eclipse/jgit/transport/PreUploadHook;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    new-instance v0, Lorg/eclipse/jgit/transport/PreUploadHook$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/PreUploadHook$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/PreUploadHook;->NULL:Lorg/eclipse/jgit/transport/PreUploadHook;

    return-void
.end method


# virtual methods
.method public abstract onBeginNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;I)V
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
.end method

.method public abstract onEndNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;IIZ)V
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
.end method

.method public abstract onSendPack(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;Ljava/util/Collection;)V
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
.end method
