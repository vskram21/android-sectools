.class public Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedEvent;
.super Lorg/eclipse/jgit/events/RepositoryEvent;
.source "BeforeDfsPackIndexLoadedEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/events/RepositoryEvent",
        "<",
        "Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedListener;",
        ">;"
    }
.end annotation


# instance fields
.field private final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V
    .locals 0
    .parameter "pack"

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/eclipse/jgit/events/RepositoryEvent;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedEvent;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 66
    return-void
.end method


# virtual methods
.method public bridge synthetic dispatch(Lorg/eclipse/jgit/events/RepositoryListener;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 54
    check-cast p1, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedListener;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedEvent;->dispatch(Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedListener;)V

    return-void
.end method

.method public dispatch(Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 80
    invoke-interface {p1, p0}, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedListener;->onBeforeDfsPackIndexLoaded(Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedEvent;)V

    .line 81
    return-void
.end method

.method public getListenerType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    const-class v0, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedListener;

    return-object v0
.end method

.method public getPackFile()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/BeforeDfsPackIndexLoadedEvent;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    return-object v0
.end method
