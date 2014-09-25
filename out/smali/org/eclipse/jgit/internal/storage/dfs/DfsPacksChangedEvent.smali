.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedEvent;
.super Lorg/eclipse/jgit/events/RepositoryEvent;
.source "DfsPacksChangedEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/events/RepositoryEvent",
        "<",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedListener;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/eclipse/jgit/events/RepositoryEvent;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic dispatch(Lorg/eclipse/jgit/events/RepositoryListener;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 49
    check-cast p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedListener;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedEvent;->dispatch(Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedListener;)V

    return-void
.end method

.method public dispatch(Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 58
    invoke-interface {p1, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedListener;->onPacksChanged(Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedEvent;)V

    .line 59
    return-void
.end method

.method public getListenerType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    const-class v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedListener;

    return-object v0
.end method
