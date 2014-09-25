.class public Lorg/eclipse/jgit/events/ListenerList;
.super Ljava/lang/Object;
.source "ListenerList.java"


# instance fields
.field private final lists:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lorg/eclipse/jgit/events/RepositoryListener;",
            ">;",
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lorg/eclipse/jgit/events/ListenerHandle;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/events/ListenerList;->lists:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method private add(Lorg/eclipse/jgit/events/ListenerHandle;)V
    .locals 4
    .parameter "handle"

    .prologue
    .line 125
    iget-object v2, p0, Lorg/eclipse/jgit/events/ListenerList;->lists:Ljava/util/concurrent/ConcurrentMap;

    iget-object v3, p1, Lorg/eclipse/jgit/events/ListenerHandle;->type:Ljava/lang/Class;

    invoke-interface {v2, v3}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 126
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/events/ListenerHandle;>;"
    if-nez v0, :cond_0

    .line 129
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 130
    .local v1, newList:Ljava/util/concurrent/CopyOnWriteArrayList;,"Ljava/util/concurrent/CopyOnWriteArrayList<Lorg/eclipse/jgit/events/ListenerHandle;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/events/ListenerList;->lists:Ljava/util/concurrent/ConcurrentMap;

    iget-object v3, p1, Lorg/eclipse/jgit/events/ListenerHandle;->type:Ljava/lang/Class;

    invoke-interface {v2, v3, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/events/ListenerHandle;>;"
    check-cast v0, Ljava/util/List;

    .line 131
    .restart local v0       #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/events/ListenerHandle;>;"
    if-nez v0, :cond_0

    .line 132
    move-object v0, v1

    .line 134
    .end local v1           #newList:Ljava/util/concurrent/CopyOnWriteArrayList;,"Ljava/util/concurrent/CopyOnWriteArrayList<Lorg/eclipse/jgit/events/ListenerHandle;>;"
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    return-void
.end method


# virtual methods
.method public addConfigChangedListener(Lorg/eclipse/jgit/events/ConfigChangedListener;)Lorg/eclipse/jgit/events/ListenerHandle;
    .locals 1
    .parameter "listener"

    .prologue
    .line 86
    const-class v0, Lorg/eclipse/jgit/events/ConfigChangedListener;

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/events/ListenerList;->addListener(Ljava/lang/Class;Lorg/eclipse/jgit/events/RepositoryListener;)Lorg/eclipse/jgit/events/ListenerHandle;

    move-result-object v0

    return-object v0
.end method

.method public addIndexChangedListener(Lorg/eclipse/jgit/events/IndexChangedListener;)Lorg/eclipse/jgit/events/ListenerHandle;
    .locals 1
    .parameter "listener"

    .prologue
    .line 63
    const-class v0, Lorg/eclipse/jgit/events/IndexChangedListener;

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/events/ListenerList;->addListener(Ljava/lang/Class;Lorg/eclipse/jgit/events/RepositoryListener;)Lorg/eclipse/jgit/events/ListenerHandle;

    move-result-object v0

    return-object v0
.end method

.method public addListener(Ljava/lang/Class;Lorg/eclipse/jgit/events/RepositoryListener;)Lorg/eclipse/jgit/events/ListenerHandle;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/eclipse/jgit/events/RepositoryListener;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;TT;)",
            "Lorg/eclipse/jgit/events/ListenerHandle;"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    .local p2, listener:Lorg/eclipse/jgit/events/RepositoryListener;,"TT;"
    new-instance v0, Lorg/eclipse/jgit/events/ListenerHandle;

    invoke-direct {v0, p0, p1, p2}, Lorg/eclipse/jgit/events/ListenerHandle;-><init>(Lorg/eclipse/jgit/events/ListenerList;Ljava/lang/Class;Lorg/eclipse/jgit/events/RepositoryListener;)V

    .line 103
    .local v0, handle:Lorg/eclipse/jgit/events/ListenerHandle;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/events/ListenerList;->add(Lorg/eclipse/jgit/events/ListenerHandle;)V

    .line 104
    return-object v0
.end method

.method public addRefsChangedListener(Lorg/eclipse/jgit/events/RefsChangedListener;)Lorg/eclipse/jgit/events/ListenerHandle;
    .locals 1
    .parameter "listener"

    .prologue
    .line 74
    const-class v0, Lorg/eclipse/jgit/events/RefsChangedListener;

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/events/ListenerList;->addListener(Ljava/lang/Class;Lorg/eclipse/jgit/events/RepositoryListener;)Lorg/eclipse/jgit/events/ListenerHandle;

    move-result-object v0

    return-object v0
.end method

.method public dispatch(Lorg/eclipse/jgit/events/RepositoryEvent;)V
    .locals 5
    .parameter "event"

    .prologue
    .line 117
    iget-object v3, p0, Lorg/eclipse/jgit/events/ListenerList;->lists:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {p1}, Lorg/eclipse/jgit/events/RepositoryEvent;->getListenerType()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 118
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/events/ListenerHandle;>;"
    if-eqz v2, :cond_0

    .line 119
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/events/ListenerHandle;

    .line 120
    .local v0, handle:Lorg/eclipse/jgit/events/ListenerHandle;
    iget-object v3, v0, Lorg/eclipse/jgit/events/ListenerHandle;->listener:Lorg/eclipse/jgit/events/RepositoryListener;

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/events/RepositoryEvent;->dispatch(Lorg/eclipse/jgit/events/RepositoryListener;)V

    goto :goto_0

    .line 122
    .end local v0           #handle:Lorg/eclipse/jgit/events/ListenerHandle;
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method remove(Lorg/eclipse/jgit/events/ListenerHandle;)V
    .locals 3
    .parameter "handle"

    .prologue
    .line 138
    iget-object v1, p0, Lorg/eclipse/jgit/events/ListenerList;->lists:Ljava/util/concurrent/ConcurrentMap;

    iget-object v2, p1, Lorg/eclipse/jgit/events/ListenerHandle;->type:Ljava/lang/Class;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 139
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/events/ListenerHandle;>;"
    if-eqz v0, :cond_0

    .line 140
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 141
    :cond_0
    return-void
.end method
