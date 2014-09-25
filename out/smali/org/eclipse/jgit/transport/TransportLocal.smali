.class Lorg/eclipse/jgit/transport/TransportLocal;
.super Lorg/eclipse/jgit/transport/Transport;
.source "TransportLocal.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PackTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;,
        Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;,
        Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;,
        Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;
    }
.end annotation


# static fields
.field static final PROTO_LOCAL:Lorg/eclipse/jgit/transport/TransportProtocol;


# instance fields
.field private final remoteGitDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 97
    new-instance v0, Lorg/eclipse/jgit/transport/TransportLocal$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportLocal$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportLocal;->PROTO_LOCAL:Lorg/eclipse/jgit/transport/TransportProtocol;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V
    .locals 0
    .parameter "local"
    .parameter "uri"
    .parameter "gitDir"

    .prologue
    .line 154
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 155
    iput-object p3, p0, Lorg/eclipse/jgit/transport/TransportLocal;->remoteGitDir:Ljava/io/File;

    .line 156
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V
    .locals 0
    .parameter "uri"
    .parameter "gitDir"

    .prologue
    .line 159
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 160
    iput-object p2, p0, Lorg/eclipse/jgit/transport/TransportLocal;->remoteGitDir:Ljava/io/File;

    .line 161
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/transport/TransportLocal;)Ljava/io/File;
    .locals 1
    .parameter "x0"

    .prologue
    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal;->remoteGitDir:Ljava/io/File;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 191
    return-void
.end method

.method createReceivePack(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/ReceivePack;
    .locals 1
    .parameter "dst"

    .prologue
    .line 168
    new-instance v0, Lorg/eclipse/jgit/transport/ReceivePack;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/ReceivePack;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method createUploadPack(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/UploadPack;
    .locals 1
    .parameter "dst"

    .prologue
    .line 164
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/UploadPack;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v0
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportLocal;->getOptionUploadPack()Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, up:Ljava/lang/String;
    const-string v1, "git-upload-pack"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "git upload-pack"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 175
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;-><init>(Lorg/eclipse/jgit/transport/TransportLocal;)V

    .line 176
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalFetchConnection;-><init>(Lorg/eclipse/jgit/transport/TransportLocal;)V

    goto :goto_0
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 182
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportLocal;->getOptionReceivePack()Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, rp:Ljava/lang/String;
    const-string v1, "git-receive-pack"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "git receive-pack"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 184
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;-><init>(Lorg/eclipse/jgit/transport/TransportLocal;)V

    .line 185
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/transport/TransportLocal$ForkLocalPushConnection;-><init>(Lorg/eclipse/jgit/transport/TransportLocal;)V

    goto :goto_0
.end method

.method protected spawn(Ljava/lang/String;)Ljava/lang/Process;
    .locals 7
    .parameter "cmd"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 196
    const/4 v4, 0x1

    :try_start_0
    new-array v0, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "."

    aput-object v5, v0, v4

    .line 197
    .local v0, args:[Ljava/lang/String;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportLocal;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v4

    invoke-virtual {v4, p1, v0}, Lorg/eclipse/jgit/util/FS;->runInShell(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/ProcessBuilder;

    move-result-object v3

    .line 198
    .local v3, proc:Ljava/lang/ProcessBuilder;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportLocal;->remoteGitDir:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/ProcessBuilder;->directory(Ljava/io/File;)Ljava/lang/ProcessBuilder;

    .line 201
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v1

    .line 202
    .local v1, env:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "GIT_ALTERNATE_OBJECT_DIRECTORIES"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    const-string v4, "GIT_CONFIG"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v4, "GIT_CONFIG_PARAMETERS"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const-string v4, "GIT_DIR"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v4, "GIT_WORK_TREE"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v4, "GIT_GRAFT_FILE"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    const-string v4, "GIT_INDEX_FILE"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    const-string v4, "GIT_NO_REPLACE_OBJECTS"

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    invoke-virtual {v3}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    return-object v4

    .line 212
    .end local v0           #args:[Ljava/lang/String;
    .end local v1           #env:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3           #proc:Ljava/lang/ProcessBuilder;
    :catch_0
    move-exception v2

    .line 213
    .local v2, err:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportLocal;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method
