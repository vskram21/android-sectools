.class public interface abstract Lorg/eclipse/jgit/transport/FetchConnection;
.super Ljava/lang/Object;
.source "FetchConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/Connection;


# virtual methods
.method public abstract didFetchIncludeTags()Z
.end method

.method public abstract didFetchTestConnectivity()Z
.end method

.method public abstract fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V
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

.method public abstract fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V
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
.end method

.method public abstract getPackLocks()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackLock;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setPackLockMessage(Ljava/lang/String;)V
.end method
