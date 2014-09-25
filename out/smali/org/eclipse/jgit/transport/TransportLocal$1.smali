.class final Lorg/eclipse/jgit/transport/TransportLocal$1;
.super Lorg/eclipse/jgit/transport/TransportProtocol;
.source "TransportLocal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportLocal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 97
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;-><init>()V

    return-void
.end method


# virtual methods
.method public canHandle(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Z
    .locals 2
    .parameter "uri"
    .parameter "local"
    .parameter "remoteName"

    .prologue
    .line 109
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportLocal$1;->getSchemes()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 115
    :cond_0
    const/4 v0, 0x0

    .line 116
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->transportProtoLocal:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemes()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    const-string v0, "file"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;
    .locals 5
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 137
    sget-object v2, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    new-instance v3, Ljava/io/File;

    const-string v4, "."

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 140
    .local v1, path:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 141
    new-instance v2, Lorg/eclipse/jgit/transport/TransportBundleFile;

    invoke-direct {v2, p1, v1}, Lorg/eclipse/jgit/transport/TransportBundleFile;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V

    .line 147
    :goto_0
    return-object v2

    .line 143
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->resolve(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;

    move-result-object v0

    .line 144
    .local v0, gitDir:Ljava/io/File;
    if-nez v0, :cond_1

    .line 145
    new-instance v2, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->notFound:Ljava/lang/String;

    invoke-direct {v2, p1, v3}, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v2

    .line 147
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/transport/TransportLocal;

    invoke-direct {v2, p1, v0}, Lorg/eclipse/jgit/transport/TransportLocal;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V

    goto :goto_0
.end method

.method public open(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;
    .locals 5
    .parameter "uri"
    .parameter "local"
    .parameter "remoteName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    .line 123
    .local v1, localPath:Ljava/io/File;
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v3

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 126
    .local v2, path:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 127
    new-instance v3, Lorg/eclipse/jgit/transport/TransportBundleFile;

    invoke-direct {v3, p2, p1, v2}, Lorg/eclipse/jgit/transport/TransportBundleFile;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V

    .line 132
    :goto_1
    return-object v3

    .line 122
    .end local v1           #localPath:Ljava/io/File;
    .end local v2           #path:Ljava/io/File;
    :cond_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v1

    goto :goto_0

    .line 129
    .restart local v1       #localPath:Ljava/io/File;
    .restart local v2       #path:Ljava/io/File;
    :cond_1
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->resolve(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;

    move-result-object v0

    .line 130
    .local v0, gitDir:Ljava/io/File;
    if-nez v0, :cond_2

    .line 131
    new-instance v3, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->notFound:Ljava/lang/String;

    invoke-direct {v3, p1, v4}, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v3

    .line 132
    :cond_2
    new-instance v3, Lorg/eclipse/jgit/transport/TransportLocal;

    invoke-direct {v3, p2, p1, v0}, Lorg/eclipse/jgit/transport/TransportLocal;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V

    goto :goto_1
.end method
