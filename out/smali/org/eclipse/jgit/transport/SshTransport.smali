.class public abstract Lorg/eclipse/jgit/transport/SshTransport;
.super Lorg/eclipse/jgit/transport/TcpTransport;
.source "SshTransport.java"


# instance fields
.field private sch:Lorg/eclipse/jgit/transport/SshSessionFactory;

.field private sock:Lorg/eclipse/jgit/transport/RemoteSession;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 1
    .parameter "local"
    .parameter "uri"

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/TcpTransport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 80
    invoke-static {}, Lorg/eclipse/jgit/transport/SshSessionFactory;->getInstance()Lorg/eclipse/jgit/transport/SshSessionFactory;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/SshTransport;->sch:Lorg/eclipse/jgit/transport/SshSessionFactory;

    .line 81
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    if-eqz v0, :cond_0

    .line 130
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SshTransport;->sch:Lorg/eclipse/jgit/transport/SshSessionFactory;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/SshSessionFactory;->releaseSession(Lorg/eclipse/jgit/transport/RemoteSession;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    iput-object v2, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    .line 135
    :cond_0
    return-void

    .line 132
    :catchall_0
    move-exception v0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    throw v0
.end method

.method protected getSession()Lorg/eclipse/jgit/transport/RemoteSession;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 116
    iget-object v1, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    if-eqz v1, :cond_0

    .line 117
    iget-object v1, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    .line 123
    :goto_0
    return-object v1

    .line 119
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/SshTransport;->getTimeout()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/SshTransport;->getTimeout()I

    move-result v1

    mul-int/lit16 v0, v1, 0x3e8

    .line 121
    .local v0, tms:I
    :goto_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/SshTransport;->sch:Lorg/eclipse/jgit/transport/SshSessionFactory;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/SshTransport;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/SshTransport;->getCredentialsProvider()Lorg/eclipse/jgit/transport/CredentialsProvider;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/SshTransport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4, v0}, Lorg/eclipse/jgit/transport/SshSessionFactory;->getSession(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;I)Lorg/eclipse/jgit/transport/RemoteSession;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    .line 123
    iget-object v1, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    goto :goto_0

    .line 119
    .end local v0           #tms:I
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getSshSessionFactory()Lorg/eclipse/jgit/transport/SshSessionFactory;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SshTransport;->sch:Lorg/eclipse/jgit/transport/SshSessionFactory;

    return-object v0
.end method

.method public setSshSessionFactory(Lorg/eclipse/jgit/transport/SshSessionFactory;)V
    .locals 2
    .parameter "factory"

    .prologue
    .line 93
    if-nez p1, :cond_0

    .line 94
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->theFactoryMustNotBeNull:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/SshTransport;->sock:Lorg/eclipse/jgit/transport/RemoteSession;

    if-eqz v0, :cond_1

    .line 96
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->anSSHSessionHasBeenAlreadyCreated:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_1
    iput-object p1, p0, Lorg/eclipse/jgit/transport/SshTransport;->sch:Lorg/eclipse/jgit/transport/SshSessionFactory;

    .line 99
    return-void
.end method
