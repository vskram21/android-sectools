.class public Lorg/eclipse/jgit/transport/JschSession;
.super Ljava/lang/Object;
.source "JschSession.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/RemoteSession;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/JschSession$1;,
        Lorg/eclipse/jgit/transport/JschSession$JschProcess;
    }
.end annotation


# instance fields
.field private final sock:Lcom/jcraft/jsch/Session;

.field private final uri:Lorg/eclipse/jgit/transport/URIish;


# direct methods
.method public constructor <init>(Lcom/jcraft/jsch/Session;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 0
    .parameter "session"
    .parameter "uri"

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lorg/eclipse/jgit/transport/JschSession;->sock:Lcom/jcraft/jsch/Session;

    .line 87
    iput-object p2, p0, Lorg/eclipse/jgit/transport/JschSession;->uri:Lorg/eclipse/jgit/transport/URIish;

    .line 88
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/JschSession;)Lcom/jcraft/jsch/Session;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession;->sock:Lcom/jcraft/jsch/Session;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/transport/JschSession;)Lorg/eclipse/jgit/transport/URIish;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession;->uri:Lorg/eclipse/jgit/transport/URIish;

    return-object v0
.end method


# virtual methods
.method public disconnect()V
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession;->sock:Lcom/jcraft/jsch/Session;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession;->sock:Lcom/jcraft/jsch/Session;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->disconnect()V

    .line 97
    :cond_0
    return-void
.end method

.method public exec(Ljava/lang/String;I)Ljava/lang/Process;
    .locals 2
    .parameter "command"
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lorg/eclipse/jgit/transport/JschSession$JschProcess;-><init>(Lorg/eclipse/jgit/transport/JschSession;Ljava/lang/String;ILorg/eclipse/jgit/transport/JschSession$1;)V

    return-object v0
.end method

.method public getSftpChannel()Lcom/jcraft/jsch/Channel;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession;->sock:Lcom/jcraft/jsch/Session;

    const-string v1, "sftp"

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->openChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v0

    return-object v0
.end method
