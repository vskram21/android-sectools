.class public Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;
.super Ljava/lang/Object;
.source "AdvertiseRefsHookChain.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/AdvertiseRefsHook;


# instance fields
.field private final count:I

.field private final hooks:[Lorg/eclipse/jgit/transport/AdvertiseRefsHook;


# direct methods
.method private constructor <init>([Lorg/eclipse/jgit/transport/AdvertiseRefsHook;I)V
    .locals 0
    .parameter "hooks"
    .parameter "count"

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;->hooks:[Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    .line 96
    iput p2, p0, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;->count:I

    .line 97
    return-void
.end method

.method public static newChain(Ljava/util/List;)Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/AdvertiseRefsHook;",
            ">;)",
            "Lorg/eclipse/jgit/transport/AdvertiseRefsHook;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, hooks:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/AdvertiseRefsHook;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    .line 70
    .local v4, newHooks:[Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
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

    check-cast v0, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    .line 72
    .local v0, hook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
    sget-object v5, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

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
    .end local v0           #hook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
    :cond_1
    if-nez v1, :cond_2

    .line 75
    sget-object v5, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

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
    new-instance v5, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;

    invoke-direct {v5, v4, v1}, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;-><init>([Lorg/eclipse/jgit/transport/AdvertiseRefsHook;I)V

    goto :goto_1
.end method


# virtual methods
.method public advertiseRefs(Lorg/eclipse/jgit/transport/BaseReceivePack;)V
    .locals 2
    .parameter "rp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;->count:I

    if-ge v0, v1, :cond_0

    .line 85
    iget-object v1, p0, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;->hooks:[Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->advertiseRefs(Lorg/eclipse/jgit/transport/BaseReceivePack;)V

    .line 84
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 86
    :cond_0
    return-void
.end method

.method public advertiseRefs(Lorg/eclipse/jgit/transport/UploadPack;)V
    .locals 2
    .parameter "rp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 90
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;->count:I

    if-ge v0, v1, :cond_0

    .line 91
    iget-object v1, p0, Lorg/eclipse/jgit/transport/AdvertiseRefsHookChain;->hooks:[Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->advertiseRefs(Lorg/eclipse/jgit/transport/UploadPack;)V

    .line 90
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 92
    :cond_0
    return-void
.end method
