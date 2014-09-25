.class public Lorg/eclipse/jgit/transport/http/JDKHttpConnectionFactory;
.super Ljava/lang/Object;
.source "JDKHttpConnectionFactory.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;
    .locals 1
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    new-instance v0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;-><init>(Ljava/net/URL;)V

    return-object v0
.end method

.method public create(Ljava/net/URL;Ljava/net/Proxy;)Lorg/eclipse/jgit/transport/http/HttpConnection;
    .locals 1
    .parameter "url"
    .parameter "proxy"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;-><init>(Ljava/net/URL;Ljava/net/Proxy;)V

    return-object v0
.end method
