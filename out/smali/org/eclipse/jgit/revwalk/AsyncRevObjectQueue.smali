.class public interface abstract Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
.super Ljava/lang/Object;
.source "AsyncRevObjectQueue.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/AsyncOperation;


# virtual methods
.method public abstract next()Lorg/eclipse/jgit/revwalk/RevObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
