.class abstract Lorg/eclipse/jgit/transport/BaseFetchConnection;
.super Lorg/eclipse/jgit/transport/BaseConnection;
.source "BaseFetchConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/FetchConnection;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseConnection;-><init>()V

    return-void
.end method


# virtual methods
.method public didFetchIncludeTags()Z
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation
.end method

.method public final fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V
    .locals 1
    .parameter "monitor"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 70
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/transport/BaseFetchConnection;->fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V

    .line 71
    return-void
.end method

.method public final fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V
    .locals 0
    .parameter "monitor"
    .parameter
    .parameter
    .parameter "out"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 76
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseFetchConnection;->markStartedOperation()V

    .line 77
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/BaseFetchConnection;->doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V

    .line 78
    return-void
.end method
