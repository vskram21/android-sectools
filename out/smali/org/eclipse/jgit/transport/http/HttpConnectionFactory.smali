.class public interface abstract Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;
.super Ljava/lang/Object;
.source "HttpConnectionFactory.java"


# virtual methods
.method public abstract create(Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract create(Ljava/net/URL;Ljava/net/Proxy;)Lorg/eclipse/jgit/transport/http/HttpConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
