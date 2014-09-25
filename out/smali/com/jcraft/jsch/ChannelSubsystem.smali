.class public Lcom/jcraft/jsch/ChannelSubsystem;
.super Lcom/jcraft/jsch/ChannelSession;
.source "ChannelSubsystem.java"


# instance fields
.field pty:Z

.field subsystem:Ljava/lang/String;

.field want_reply:Z

.field xforwading:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 33
    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->xforwading:Z

    .line 34
    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->pty:Z

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->want_reply:Z

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->subsystem:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getErrStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getExtInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method init()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 74
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 75
    return-void
.end method

.method public bridge synthetic run()V
    .locals 0

    .prologue
    .line 32
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->run()V

    return-void
.end method

.method public bridge synthetic setAgentForwarding(Z)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/util/Hashtable;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/util/Hashtable;)V

    return-void
.end method

.method public bridge synthetic setEnv([B[B)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv([B[B)V

    return-void
.end method

.method public setErrStream(Ljava/io/OutputStream;)V
    .locals 0
    .parameter "out"

    .prologue
    .line 78
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/ChannelSubsystem;->setExtOutputStream(Ljava/io/OutputStream;)V

    .line 79
    return-void
.end method

.method public setPty(Z)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->pty:Z

    return-void
.end method

.method public bridge synthetic setPtySize(IIII)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 32
    invoke-super {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSession;->setPtySize(IIII)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;IIII)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 32
    invoke-super/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    return-void
.end method

.method public setSubsystem(Ljava/lang/String;)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 40
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->subsystem:Ljava/lang/String;

    return-void
.end method

.method public bridge synthetic setTerminalMode([B)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setTerminalMode([B)V

    return-void
.end method

.method public setWantReply(Z)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->want_reply:Z

    return-void
.end method

.method public setXForwarding(Z)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->xforwading:Z

    return-void
.end method

.method public start()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 45
    .local v0, _session:Lcom/jcraft/jsch/Session;
    :try_start_0
    iget-boolean v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->xforwading:Z

    if-eqz v3, :cond_0

    .line 46
    new-instance v2, Lcom/jcraft/jsch/RequestX11;

    invoke-direct {v2}, Lcom/jcraft/jsch/RequestX11;-><init>()V

    .line 47
    .local v2, request:Lcom/jcraft/jsch/Request;
    invoke-virtual {v2, v0, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 49
    .end local v2           #request:Lcom/jcraft/jsch/Request;
    :cond_0
    iget-boolean v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->pty:Z

    if-eqz v3, :cond_1

    .line 50
    new-instance v2, Lcom/jcraft/jsch/RequestPtyReq;

    invoke-direct {v2}, Lcom/jcraft/jsch/RequestPtyReq;-><init>()V

    .line 51
    .restart local v2       #request:Lcom/jcraft/jsch/Request;
    invoke-virtual {v2, v0, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 53
    .end local v2           #request:Lcom/jcraft/jsch/Request;
    :cond_1
    new-instance v2, Lcom/jcraft/jsch/RequestSubsystem;

    invoke-direct {v2}, Lcom/jcraft/jsch/RequestSubsystem;-><init>()V

    .line 54
    .restart local v2       #request:Lcom/jcraft/jsch/Request;
    check-cast v2, Lcom/jcraft/jsch/RequestSubsystem;

    .end local v2           #request:Lcom/jcraft/jsch/Request;
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->subsystem:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/jcraft/jsch/ChannelSubsystem;->want_reply:Z

    invoke-virtual {v2, v0, p0, v3, v4}, Lcom/jcraft/jsch/RequestSubsystem;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->io:Lcom/jcraft/jsch/IO;

    iget-object v3, v3, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v3, :cond_3

    .line 63
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    .line 64
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Subsystem for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 65
    iget-boolean v3, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    if-eqz v3, :cond_2

    .line 66
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    iget-boolean v4, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 68
    :cond_2
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 70
    :cond_3
    return-void

    .line 56
    :catch_0
    move-exception v1

    .line 57
    .local v1, e:Ljava/lang/Exception;
    instance-of v3, v1, Lcom/jcraft/jsch/JSchException;

    if-eqz v3, :cond_4

    check-cast v1, Lcom/jcraft/jsch/JSchException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 58
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_4
    instance-of v3, v1, Ljava/lang/Throwable;

    if-eqz v3, :cond_5

    .line 59
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelSubsystem"

    invoke-direct {v3, v4, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 60
    :cond_5
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelSubsystem"

    invoke-direct {v3, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
