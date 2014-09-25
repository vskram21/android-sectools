.class public Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
.super Lorg/eclipse/jgit/errors/TransportException;
.source "NoRemoteRepositoryException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V
    .locals 0
    .parameter "uri"
    .parameter "s"

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    .line 64
    return-void
.end method
