.class public final Lorg/eclipse/jgit/transport/UploadPack$AdvertisedRequestValidator;
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
    name = "AdvertisedRequestValidator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1087
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V
    .locals 5
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
    .line 1091
    .local p2, wants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack;->isBiDirectionalPipe()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1092
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitRequestValidator;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitRequestValidator;-><init>()V

    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitRequestValidator;->checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V

    .line 1096
    :cond_0
    return-void

    .line 1093
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1094
    new-instance v1, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/JGitText;->wantNotValid:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
