.class public abstract Lorg/eclipse/jgit/transport/TcpTransport;
.super Lorg/eclipse/jgit/transport/Transport;
.source "TcpTransport.java"


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 0
    .parameter "local"
    .parameter "uri"

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 68
    return-void
.end method
