.class public interface abstract Lcom/jcraft/jsch/GSSContext;
.super Ljava/lang/Object;
.source "GSSContext.java"


# virtual methods
.method public abstract create(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation
.end method

.method public abstract dispose()V
.end method

.method public abstract getMIC([BII)[B
.end method

.method public abstract init([BII)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation
.end method

.method public abstract isEstablished()Z
.end method
