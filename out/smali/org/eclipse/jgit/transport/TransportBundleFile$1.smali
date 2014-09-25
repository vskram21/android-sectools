.class final Lorg/eclipse/jgit/transport/TransportBundleFile$1;
.super Lorg/eclipse/jgit/transport/TransportProtocol;
.source "TransportBundleFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportBundleFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field private final schemeNames:[Ljava/lang/String;

.field private final schemeSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;-><init>()V

    .line 66
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "bundle"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "file"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportBundleFile$1;->schemeNames:[Ljava/lang/String;

    .line 68
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportBundleFile$1;->schemeNames:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportBundleFile$1;->schemeSet:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public canHandle(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Z
    .locals 2
    .parameter "uri"
    .parameter "local"
    .parameter "remoteName"

    .prologue
    .line 83
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

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportBundleFile$1;->getSchemes()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 89
    :cond_0
    const/4 v0, 0x0

    .line 90
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->transportProtoBundleFile:Ljava/lang/String;

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
    .line 78
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportBundleFile$1;->schemeSet:Ljava/util/Set;

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;
    .locals 4
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 111
    const-string v1, "bundle"

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    sget-object v1, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    new-instance v2, Ljava/io/File;

    const-string v3, "."

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 113
    .local v0, path:Ljava/io/File;
    new-instance v1, Lorg/eclipse/jgit/transport/TransportBundleFile;

    invoke-direct {v1, p1, v0}, Lorg/eclipse/jgit/transport/TransportBundleFile;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V

    .line 115
    .end local v0           #path:Ljava/io/File;
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lorg/eclipse/jgit/transport/TransportLocal;->PROTO_LOCAL:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/transport/TransportProtocol;->open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v1

    goto :goto_0
.end method

.method public open(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;
    .locals 4
    .parameter "uri"
    .parameter "local"
    .parameter "remoteName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 96
    const-string v1, "bundle"

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    const-string v3, "."

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 98
    .local v0, path:Ljava/io/File;
    new-instance v1, Lorg/eclipse/jgit/transport/TransportBundleFile;

    invoke-direct {v1, p2, p1, v0}, Lorg/eclipse/jgit/transport/TransportBundleFile;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V

    .line 106
    .end local v0           #path:Ljava/io/File;
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lorg/eclipse/jgit/transport/TransportLocal;->PROTO_LOCAL:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-virtual {v1, p1, p2, p3}, Lorg/eclipse/jgit/transport/TransportProtocol;->open(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v1

    goto :goto_0
.end method
