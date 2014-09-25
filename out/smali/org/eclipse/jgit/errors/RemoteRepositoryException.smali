.class public Lorg/eclipse/jgit/errors/RemoteRepositoryException;
.super Lorg/eclipse/jgit/errors/TransportException;
.source "RemoteRepositoryException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V
    .locals 0
    .parameter "uri"
    .parameter "message"

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    .line 69
    return-void
.end method
