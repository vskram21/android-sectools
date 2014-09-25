.class public abstract Lorg/eclipse/jgit/transport/BaseConnection;
.super Ljava/lang/Object;
.source "BaseConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/Connection;


# instance fields
.field private advertisedRefs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private messageWriter:Ljava/io/Writer;

.field private startedOperation:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->advertisedRefs:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method protected available(Ljava/util/Map;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, all:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->advertisedRefs:Ljava/util/Map;

    .line 103
    return-void
.end method

.method public abstract close()V
.end method

.method protected getMessageWriter()Ljava/io/Writer;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->messageWriter:Ljava/io/Writer;

    if-nez v0, :cond_0

    .line 126
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/BaseConnection;->setMessageWriter(Ljava/io/Writer;)V

    .line 127
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->messageWriter:Ljava/io/Writer;

    return-object v0
.end method

.method public getMessages()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->messageWriter:Ljava/io/Writer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->messageWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public final getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 1
    .parameter "name"

    .prologue
    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->advertisedRefs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method public final getRefs()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->advertisedRefs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getRefsMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->advertisedRefs:Ljava/util/Map;

    return-object v0
.end method

.method protected markStartedOperation()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->startedOperation:Z

    if-eqz v0, :cond_0

    .line 114
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->onlyOneOperationCallPerConnectionIsSupported:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->startedOperation:Z

    .line 117
    return-void
.end method

.method protected setMessageWriter(Ljava/io/Writer;)V
    .locals 2
    .parameter "writer"

    .prologue
    .line 139
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseConnection;->messageWriter:Ljava/io/Writer;

    if-eqz v0, :cond_0

    .line 140
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->writerAlreadyInitialized:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseConnection;->messageWriter:Ljava/io/Writer;

    .line 142
    return-void
.end method
