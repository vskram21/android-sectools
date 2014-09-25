.class public interface abstract Lcom/jcraft/jsch/MAC;
.super Ljava/lang/Object;
.source "MAC.java"


# virtual methods
.method public abstract doFinal([BI)V
.end method

.method public abstract getBlockSize()I
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract init([B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract update(I)V
.end method

.method public abstract update([BII)V
.end method
