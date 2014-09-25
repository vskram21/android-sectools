.class public interface abstract Lorg/eclipse/jgit/transport/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# virtual methods
.method public abstract close()V
.end method

.method public abstract getMessages()Ljava/lang/String;
.end method

.method public abstract getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
.end method

.method public abstract getRefs()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRefsMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end method
