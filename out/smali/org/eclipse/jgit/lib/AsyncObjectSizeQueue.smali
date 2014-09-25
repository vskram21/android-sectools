.class public interface abstract Lorg/eclipse/jgit/lib/AsyncObjectSizeQueue;
.super Ljava/lang/Object;
.source "AsyncObjectSizeQueue.java"

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

.method public abstract getSize()J
.end method

.method public abstract next()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
