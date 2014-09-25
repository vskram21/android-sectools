.class public Lorg/eclipse/jgit/events/RefsChangedEvent;
.super Lorg/eclipse/jgit/events/RepositoryEvent;
.source "RefsChangedEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/events/RepositoryEvent",
        "<",
        "Lorg/eclipse/jgit/events/RefsChangedListener;",
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
.method public dispatch(Lorg/eclipse/jgit/events/RefsChangedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 55
    invoke-interface {p1, p0}, Lorg/eclipse/jgit/events/RefsChangedListener;->onRefsChanged(Lorg/eclipse/jgit/events/RefsChangedEvent;)V

    .line 56
    return-void
.end method

.method public bridge synthetic dispatch(Lorg/eclipse/jgit/events/RepositoryListener;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 47
    check-cast p1, Lorg/eclipse/jgit/events/RefsChangedListener;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/events/RefsChangedEvent;->dispatch(Lorg/eclipse/jgit/events/RefsChangedListener;)V

    return-void
.end method

.method public getListenerType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<",
            "Lorg/eclipse/jgit/events/RefsChangedListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    const-class v0, Lorg/eclipse/jgit/events/RefsChangedListener;

    return-object v0
.end method
