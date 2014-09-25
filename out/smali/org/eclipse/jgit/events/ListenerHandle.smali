.class public Lorg/eclipse/jgit/events/ListenerHandle;
.super Ljava/lang/Object;
.source "ListenerHandle.java"


# instance fields
.field final listener:Lorg/eclipse/jgit/events/RepositoryListener;

.field private final parent:Lorg/eclipse/jgit/events/ListenerList;

.field final type:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/eclipse/jgit/events/RepositoryListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/events/ListenerList;Ljava/lang/Class;Lorg/eclipse/jgit/events/RepositoryListener;)V
    .locals 0
    .parameter "parent"
    .parameter
    .parameter "listener"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/events/ListenerList;",
            "Ljava/lang/Class",
            "<+",
            "Lorg/eclipse/jgit/events/RepositoryListener;",
            ">;",
            "Lorg/eclipse/jgit/events/RepositoryListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 56
    .local p2, type:Ljava/lang/Class;,"Ljava/lang/Class<+Lorg/eclipse/jgit/events/RepositoryListener;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/eclipse/jgit/events/ListenerHandle;->parent:Lorg/eclipse/jgit/events/ListenerList;

    .line 58
    iput-object p2, p0, Lorg/eclipse/jgit/events/ListenerHandle;->type:Ljava/lang/Class;

    .line 59
    iput-object p3, p0, Lorg/eclipse/jgit/events/ListenerHandle;->listener:Lorg/eclipse/jgit/events/RepositoryListener;

    .line 60
    return-void
.end method


# virtual methods
.method public remove()V
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/eclipse/jgit/events/ListenerHandle;->parent:Lorg/eclipse/jgit/events/ListenerList;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/events/ListenerList;->remove(Lorg/eclipse/jgit/events/ListenerHandle;)V

    .line 65
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/eclipse/jgit/events/ListenerHandle;->type:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/events/ListenerHandle;->listener:Lorg/eclipse/jgit/events/RepositoryListener;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
