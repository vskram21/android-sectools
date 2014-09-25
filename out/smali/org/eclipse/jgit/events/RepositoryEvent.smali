.class public abstract Lorg/eclipse/jgit/events/RepositoryEvent;
.super Ljava/lang/Object;
.source "RepositoryEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/eclipse/jgit/events/RepositoryListener;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private repository:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    .local p0, this:Lorg/eclipse/jgit/events/RepositoryEvent;,"Lorg/eclipse/jgit/events/RepositoryEvent<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract dispatch(Lorg/eclipse/jgit/events/RepositoryListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract getListenerType()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 74
    .local p0, this:Lorg/eclipse/jgit/events/RepositoryEvent;,"Lorg/eclipse/jgit/events/RepositoryEvent<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/events/RepositoryEvent;->repository:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public setRepository(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 68
    .local p0, this:Lorg/eclipse/jgit/events/RepositoryEvent;,"Lorg/eclipse/jgit/events/RepositoryEvent<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/events/RepositoryEvent;->repository:Lorg/eclipse/jgit/lib/Repository;

    if-nez v0, :cond_0

    .line 69
    iput-object p1, p0, Lorg/eclipse/jgit/events/RepositoryEvent;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 70
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 91
    .local p0, this:Lorg/eclipse/jgit/events/RepositoryEvent;,"Lorg/eclipse/jgit/events/RepositoryEvent<TT;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, type:Ljava/lang/String;
    iget-object v1, p0, Lorg/eclipse/jgit/events/RepositoryEvent;->repository:Lorg/eclipse/jgit/lib/Repository;

    if-nez v1, :cond_0

    .line 94
    .end local v0           #type:Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0       #type:Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/events/RepositoryEvent;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
