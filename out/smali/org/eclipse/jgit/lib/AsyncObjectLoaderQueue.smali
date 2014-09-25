.class public interface abstract Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;
.super Ljava/lang/Object;
.source "AsyncObjectLoaderQueue.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/AsyncOperation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/eclipse/jgit/lib/ObjectId;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/lib/AsyncOperation;"
    }
.end annotation


# virtual methods
.method public abstract getCurrent()Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public abstract next()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract open()Lorg/eclipse/jgit/lib/ObjectLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
