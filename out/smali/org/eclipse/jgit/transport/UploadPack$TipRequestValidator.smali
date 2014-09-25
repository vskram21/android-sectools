.class public final Lorg/eclipse/jgit/transport/UploadPack$TipRequestValidator;
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
    name = "TipRequestValidator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V
    .locals 8
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
    .line 1121
    .local p2, wants:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack;->isBiDirectionalPipe()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1122
    new-instance v3, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;

    invoke-direct {v3}, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;-><init>()V

    invoke-virtual {v3, p1, p2}, Lorg/eclipse/jgit/transport/UploadPack$ReachableCommitTipRequestValidator;->checkWants(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/List;)V

    .line 1132
    :cond_0
    return-void

    .line 1123
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1124
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/UploadPack;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    #calls: Lorg/eclipse/jgit/transport/UploadPack;->refIdSet(Ljava/util/Collection;)Ljava/util/Set;
    invoke-static {v3}, Lorg/eclipse/jgit/transport/UploadPack;->access$000(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v2

    .line 1126
    .local v2, refIds:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1127
    .local v1, obj:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1128
    new-instance v3, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->wantNotValid:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
