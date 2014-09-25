.class public Lorg/eclipse/jgit/errors/PackProtocolException;
.super Lorg/eclipse/jgit/errors/TransportException;
.source "PackProtocolException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "s"
    .parameter "cause"

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/errors/PackProtocolException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 106
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V
    .locals 2
    .parameter "uri"
    .parameter "s"

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .parameter "uri"
    .parameter "s"
    .parameter "cause"

    .prologue
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 83
    return-void
.end method
