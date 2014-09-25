.class public Lcom/jcraft/jsch/ChannelExec;
.super Lcom/jcraft/jsch/ChannelSession;
.source "ChannelExec.java"


# instance fields
.field command:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 36
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelExec;->command:[B

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
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelExec;->getExtInputStream()Ljava/io/InputStream;

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
    .line 70
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelExec;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelExec;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 71
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelExec;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelExec;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 72
    return-void
.end method

.method public bridge synthetic run()V
    .locals 0

    .prologue
    .line 34
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->run()V

    return-void
.end method

.method public bridge synthetic setAgentForwarding(Z)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    return-void
.end method

.method public setCommand(Ljava/lang/String;)V
    .locals 1
    .parameter "command"

    .prologue
    .line 63
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelExec;->command:[B

    .line 64
    return-void
.end method

.method public setCommand([B)V
    .locals 0
    .parameter "command"

    .prologue
    .line 66
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelExec;->command:[B

    .line 67
    return-void
.end method

.method public bridge synthetic setEnv(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/util/Hashtable;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/util/Hashtable;)V

    return-void
.end method

.method public bridge synthetic setEnv([B[B)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv([B[B)V

    return-void
.end method

.method public setErrStream(Ljava/io/OutputStream;)V
    .locals 0
    .parameter "out"

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/ChannelExec;->setExtOutputStream(Ljava/io/OutputStream;)V

    .line 76
    return-void
.end method

.method public setErrStream(Ljava/io/OutputStream;Z)V
    .locals 0
    .parameter "out"
    .parameter "dontclose"

    .prologue
    .line 78
    invoke-virtual {p0, p1, p2}, Lcom/jcraft/jsch/ChannelExec;->setExtOutputStream(Ljava/io/OutputStream;Z)V

    .line 79
    return-void
.end method

.method public bridge synthetic setPty(Z)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPty(Z)V

    return-void
.end method

.method public bridge synthetic setPtySize(IIII)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 34
    invoke-super {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSession;->setPtySize(IIII)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
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
    .line 34
    invoke-super/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    return-void
.end method

.method public bridge synthetic setTerminalMode([B)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setTerminalMode([B)V

    return-void
.end method

.method public bridge synthetic setXForwarding(Z)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setXForwarding(Z)V

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
    .line 39
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelExec;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 41
    .local v0, _session:Lcom/jcraft/jsch/Session;
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelExec;->sendRequests()V

    .line 42
    new-instance v2, Lcom/jcraft/jsch/RequestExec;

    iget-object v3, p0, Lcom/jcraft/jsch/ChannelExec;->command:[B

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/RequestExec;-><init>([B)V

    .line 43
    .local v2, request:Lcom/jcraft/jsch/Request;
    invoke-virtual {v2, v0, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelExec;->io:Lcom/jcraft/jsch/IO;

    iget-object v3, v3, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v3, :cond_1

    .line 53
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/jcraft/jsch/ChannelExec;->thread:Ljava/lang/Thread;

    .line 54
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelExec;->thread:Ljava/lang/Thread;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exec thread "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 55
    iget-boolean v3, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    if-eqz v3, :cond_0

    .line 56
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelExec;->thread:Ljava/lang/Thread;

    iget-boolean v4, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 58
    :cond_0
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelExec;->thread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 60
    :cond_1
    return-void

    .line 45
    .end local v2           #request:Lcom/jcraft/jsch/Request;
    :catch_0
    move-exception v1

    .line 46
    .local v1, e:Ljava/lang/Exception;
    instance-of v3, v1, Lcom/jcraft/jsch/JSchException;

    if-eqz v3, :cond_2

    check-cast v1, Lcom/jcraft/jsch/JSchException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 47
    .restart local v1       #e:Ljava/lang/Exception;
    :cond_2
    instance-of v3, v1, Ljava/lang/Throwable;

    if-eqz v3, :cond_3

    .line 48
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelExec"

    invoke-direct {v3, v4, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 49
    :cond_3
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelExec"

    invoke-direct {v3, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
