.class public interface abstract Lorg/eclipse/jgit/transport/RemoteSession;
.super Ljava/lang/Object;
.source "RemoteSession.java"


# virtual methods
.method public abstract disconnect()V
.end method

.method public abstract exec(Ljava/lang/String;I)Ljava/lang/Process;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
