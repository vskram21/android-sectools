.class Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;
.super Ljava/lang/Object;
.source "TransportGitSsh.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/RemoteSession;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportGitSsh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExtSession"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/transport/TransportGitSsh;)V
    .locals 0
    .parameter

    .prologue
    .line 201
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/transport/TransportGitSsh;Lorg/eclipse/jgit/transport/TransportGitSsh$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 201
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;-><init>(Lorg/eclipse/jgit/transport/TransportGitSsh;)V

    return-void
.end method


# virtual methods
.method public disconnect()V
    .locals 0

    .prologue
    .line 237
    return-void
.end method

.method public exec(Ljava/lang/String;I)Ljava/lang/Process;
    .locals 8
    .parameter "command"
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 204
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v5

    const-string v6, "GIT_SSH"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 205
    .local v4, ssh:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "plink"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    .line 207
    .local v3, putty:Z
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .local v0, args:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    if-eqz v3, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "tortoiseplink"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 210
    const-string v5, "-batch"

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v5

    if-lez v5, :cond_1

    .line 212
    if-eqz v3, :cond_3

    const-string v5, "-P"

    :goto_0
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 216
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    :goto_1
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    new-instance v2, Ljava/lang/ProcessBuilder;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 222
    .local v2, pb:Ljava/lang/ProcessBuilder;
    invoke-virtual {v2, v0}, Ljava/lang/ProcessBuilder;->command(Ljava/util/List;)Ljava/lang/ProcessBuilder;

    .line 224
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    iget-object v5, v5, Lorg/eclipse/jgit/transport/TransportGitSsh;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 225
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v5

    const-string v6, "GIT_DIR"

    iget-object v7, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    iget-object v7, v7, Lorg/eclipse/jgit/transport/TransportGitSsh;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    :cond_2
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    return-object v5

    .line 212
    .end local v2           #pb:Ljava/lang/ProcessBuilder;
    :cond_3
    const-string v5, "-p"

    goto/16 :goto_0

    .line 218
    :cond_4
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;->this$0:Lorg/eclipse/jgit/transport/TransportGitSsh;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/TransportGitSsh;->getURI()Lorg/eclipse/jgit/transport/URIish;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 230
    .restart local v2       #pb:Ljava/lang/ProcessBuilder;
    :catch_0
    move-exception v1

    .line 231
    .local v1, err:Ljava/io/IOException;
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method
