.class public Lorg/eclipse/jgit/transport/PostReceiveHookChain;
.super Ljava/lang/Object;
.source "PostReceiveHookChain.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PostReceiveHook;


# instance fields
.field private final count:I

.field private final hooks:[Lorg/eclipse/jgit/transport/PostReceiveHook;


# direct methods
.method private constructor <init>([Lorg/eclipse/jgit/transport/PostReceiveHook;I)V
    .locals 0
    .parameter "hooks"
    .parameter "count"

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PostReceiveHookChain;->hooks:[Lorg/eclipse/jgit/transport/PostReceiveHook;

    .line 88
    iput p2, p0, Lorg/eclipse/jgit/transport/PostReceiveHookChain;->count:I

    .line 89
    return-void
.end method

.method public static newChain(Ljava/util/List;)Lorg/eclipse/jgit/transport/PostReceiveHook;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/PostReceiveHook;",
            ">;)",
            "Lorg/eclipse/jgit/transport/PostReceiveHook;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, hooks:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/PostReceiveHook;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/eclipse/jgit/transport/PostReceiveHook;

    .line 68
    .local v4, newHooks:[Lorg/eclipse/jgit/transport/PostReceiveHook;
    const/4 v1, 0x0

    .line 69
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

    check-cast v0, Lorg/eclipse/jgit/transport/PostReceiveHook;

    .line 70
    .local v0, hook:Lorg/eclipse/jgit/transport/PostReceiveHook;
    sget-object v5, Lorg/eclipse/jgit/transport/PostReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PostReceiveHook;

    if-eq v0, v5, :cond_0

    .line 71
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .local v2, i:I
    aput-object v0, v4, v1

    move v1, v2

    .end local v2           #i:I
    .restart local v1       #i:I
    goto :goto_0

    .line 72
    .end local v0           #hook:Lorg/eclipse/jgit/transport/PostReceiveHook;
    :cond_1
    if-nez v1, :cond_2

    .line 73
    sget-object v5, Lorg/eclipse/jgit/transport/PostReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PostReceiveHook;

    .line 77
    :goto_1
    return-object v5

    .line 74
    :cond_2
    const/4 v5, 0x1

    if-ne v1, v5, :cond_3

    .line 75
    const/4 v5, 0x0

    aget-object v5, v4, v5

    goto :goto_1

    .line 77
    :cond_3
    new-instance v5, Lorg/eclipse/jgit/transport/PostReceiveHookChain;

    invoke-direct {v5, v4, v1}, Lorg/eclipse/jgit/transport/PostReceiveHookChain;-><init>([Lorg/eclipse/jgit/transport/PostReceiveHook;I)V

    goto :goto_1
.end method


# virtual methods
.method public onPostReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V
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
    .line 82
    .local p2, commands:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/transport/PostReceiveHookChain;->count:I

    if-ge v0, v1, :cond_0

    .line 83
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PostReceiveHookChain;->hooks:[Lorg/eclipse/jgit/transport/PostReceiveHook;

    aget-object v1, v1, v0

    invoke-interface {v1, p1, p2}, Lorg/eclipse/jgit/transport/PostReceiveHook;->onPostReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    :cond_0
    return-void
.end method
