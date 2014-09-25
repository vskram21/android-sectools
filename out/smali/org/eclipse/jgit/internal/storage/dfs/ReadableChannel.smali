.class public interface abstract Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
.super Ljava/lang/Object;
.source "ReadableChannel.java"

# interfaces
.implements Ljava/nio/channels/ReadableByteChannel;


# virtual methods
.method public abstract blockSize()I
.end method

.method public abstract position()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract position(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract size()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
