.class public interface abstract Lorg/eclipse/jgit/transport/PushConnection;
.super Ljava/lang/Object;
.source "PushConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/Connection;


# virtual methods
.method public abstract push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation
.end method

.method public abstract push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
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
