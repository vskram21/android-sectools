.class public Lorg/eclipse/jgit/events/IndexChangedEvent;
.super Lorg/eclipse/jgit/events/RepositoryEvent;
.source "IndexChangedEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/events/RepositoryEvent",
        "<",
        "Lorg/eclipse/jgit/events/IndexChangedListener;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/eclipse/jgit/events/RepositoryEvent;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatch(Lorg/eclipse/jgit/events/IndexChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 55
    invoke-interface {p1, p0}, Lorg/eclipse/jgit/events/IndexChangedListener;->onIndexChanged(Lorg/eclipse/jgit/events/IndexChangedEvent;)V

    .line 56
    return-void
.end method

.method public bridge synthetic dispatch(Lorg/eclipse/jgit/events/RepositoryListener;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 47
    check-cast p1, Lorg/eclipse/jgit/events/IndexChangedListener;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/events/IndexChangedEvent;->dispatch(Lorg/eclipse/jgit/events/IndexChangedListener;)V

    return-void
.end method

.method public getListenerType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<",
            "Lorg/eclipse/jgit/events/IndexChangedListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    const-class v0, Lorg/eclipse/jgit/events/IndexChangedListener;

    return-object v0
.end method
