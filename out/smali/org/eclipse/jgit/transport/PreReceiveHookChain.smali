.class public Lorg/eclipse/jgit/transport/PreReceiveHookChain;
.super Ljava/lang/Object;
.source "PreReceiveHookChain.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PreReceiveHook;


# instance fields
.field private final count:I

.field private final hooks:[Lorg/eclipse/jgit/transport/PreReceiveHook;


# direct methods
.method private constructor <init>([Lorg/eclipse/jgit/transport/PreReceiveHook;I)V
    .locals 0
    .parameter "hooks"
    .parameter "count"

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PreReceiveHookChain;->hooks:[Lorg/eclipse/jgit/transport/PreReceiveHook;

    .line 87
    iput p2, p0, Lorg/eclipse/jgit/transport/PreReceiveHookChain;->count:I

    .line 88
    return-void
.end method

.method public static newChain(Ljava/util/List;)Lorg/eclipse/jgit/transport/PreReceiveHook;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/PreReceiveHook;",
            ">;)",
            "Lorg/eclipse/jgit/transport/PreReceiveHook;"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, hooks:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/PreReceiveHook;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/eclipse/jgit/transport/PreReceiveHook;

    .line 67
    .local v4, newHooks:[Lorg/eclipse/jgit/transport/PreReceiveHook;
    const/4 v1, 0x0

    .line 68
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

    check-cast v0, Lorg/eclipse/jgit/transport/PreReceiveHook;

    .line 69
    .local v0, hook:Lorg/eclipse/jgit/transport/PreReceiveHook;
    sget-object v5, Lorg/eclipse/jgit/transport/PreReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PreReceiveHook;

    if-eq v0, v5, :cond_0

    .line 70
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .local v2, i:I
    aput-object v0, v4, v1

    move v1, v2

    .end local v2           #i:I
    .restart local v1       #i:I
    goto :goto_0

    .line 71
    .end local v0           #hook:Lorg/eclipse/jgit/transport/PreReceiveHook;
    :cond_1
    if-nez v1, :cond_2

    .line 72
    sget-object v5, Lorg/eclipse/jgit/transport/PreReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PreReceiveHook;

    .line 76
    :goto_1
    return-object v5

    .line 73
    :cond_2
    const/4 v5, 0x1

    if-ne v1, v5, :cond_3

    .line 74
    const/4 v5, 0x0

    aget-object v5, v4, v5

    goto :goto_1

    .line 76
    :cond_3
    new-instance v5, Lorg/eclipse/jgit/transport/PreReceiveHookChain;

    invoke-direct {v5, v4, v1}, Lorg/eclipse/jgit/transport/PreReceiveHookChain;-><init>([Lorg/eclipse/jgit/transport/PreReceiveHook;I)V

    goto :goto_1
.end method


# virtual methods
.method public onPreReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V
    .locals 2
    .parameter "rp"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/ReceivePack;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p2, commands:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/transport/PreReceiveHookChain;->count:I

    if-ge v0, v1, :cond_0

    .line 82
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PreReceiveHookChain;->hooks:[Lorg/eclipse/jgit/transport/PreReceiveHook;

    aget-object v1, v1, v0

    invoke-interface {v1, p1, p2}, Lorg/eclipse/jgit/transport/PreReceiveHook;->onPreReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 83
    :cond_0
    return-void
.end method
