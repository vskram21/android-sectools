.class public Lorg/eclipse/jgit/transport/PreUploadHookChain;
.super Ljava/lang/Object;
.source "PreUploadHookChain.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PreUploadHook;


# instance fields
.field private final count:I

.field private final hooks:[Lorg/eclipse/jgit/transport/PreUploadHook;


# direct methods
.method private constructor <init>([Lorg/eclipse/jgit/transport/PreUploadHook;I)V
    .locals 0
    .parameter "hooks"
    .parameter "count"

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->hooks:[Lorg/eclipse/jgit/transport/PreUploadHook;

    .line 107
    iput p2, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->count:I

    .line 108
    return-void
.end method

.method public static newChain(Ljava/util/List;)Lorg/eclipse/jgit/transport/PreUploadHook;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/PreUploadHook;",
            ">;)",
            "Lorg/eclipse/jgit/transport/PreUploadHook;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, hooks:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/PreUploadHook;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/eclipse/jgit/transport/PreUploadHook;

    .line 70
    .local v4, newHooks:[Lorg/eclipse/jgit/transport/PreUploadHook;
    const/4 v1, 0x0

    .line 71
    .local v1, i:I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/PreUploadHook;

    .line 72
    .local v0, hook:Lorg/eclipse/jgit/transport/PreUploadHook;
    sget-object v5, Lorg/eclipse/jgit/transport/PreUploadHook;->NULL:Lorg/eclipse/jgit/transport/PreUploadHook;

    if-eq v0, v5, :cond_0

    .line 73
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .local v2, i:I
    aput-object v0, v4, v1

    move v1, v2

    .end local v2           #i:I
    .restart local v1       #i:I
    goto :goto_0

    .line 74
    .end local v0           #hook:Lorg/eclipse/jgit/transport/PreUploadHook;
    :cond_1
    if-nez v1, :cond_2

    .line 75
    sget-object v5, Lorg/eclipse/jgit/transport/PreUploadHook;->NULL:Lorg/eclipse/jgit/transport/PreUploadHook;

    .line 79
    :goto_1
    return-object v5

    .line 76
    :cond_2
    const/4 v5, 0x1

    if-ne v1, v5, :cond_3

    .line 77
    const/4 v5, 0x0

    aget-object v5, v4, v5

    goto :goto_1

    .line 79
    :cond_3
    new-instance v5, Lorg/eclipse/jgit/transport/PreUploadHookChain;

    invoke-direct {v5, v4, v1}, Lorg/eclipse/jgit/transport/PreUploadHookChain;-><init>([Lorg/eclipse/jgit/transport/PreUploadHook;I)V

    goto :goto_1
.end method


# virtual methods
.method public onBeginNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;I)V
    .locals 2
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
    .line 85
    .local p2, wants:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->count:I

    if-ge v0, v1, :cond_0

    .line 86
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->hooks:[Lorg/eclipse/jgit/transport/PreUploadHook;

    aget-object v1, v1, v0

    invoke-interface {v1, p1, p2, p3}, Lorg/eclipse/jgit/transport/PreUploadHook;->onBeginNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;I)V

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 87
    :cond_0
    return-void
.end method

.method public onEndNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;IIZ)V
    .locals 7
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
    .line 93
    .local p2, wants:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    iget v0, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->count:I

    if-ge v6, v0, :cond_0

    .line 94
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->hooks:[Lorg/eclipse/jgit/transport/PreUploadHook;

    aget-object v0, v0, v6

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/eclipse/jgit/transport/PreUploadHook;->onEndNegotiateRound(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;IIZ)V

    .line 93
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 95
    :cond_0
    return-void
.end method

.method public onSendPack(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 2
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
    .line 101
    .local p2, wants:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p3, haves:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->count:I

    if-ge v0, v1, :cond_0

    .line 102
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PreUploadHookChain;->hooks:[Lorg/eclipse/jgit/transport/PreUploadHook;

    aget-object v1, v1, v0

    invoke-interface {v1, p1, p2, p3}, Lorg/eclipse/jgit/transport/PreUploadHook;->onSendPack(Lorg/eclipse/jgit/transport/UploadPack;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 101
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 103
    :cond_0
    return-void
.end method
