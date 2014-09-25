.class Lorg/eclipse/jgit/transport/JschSession$JschProcess;
.super Ljava/lang/Process;
.source "JschSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/JschSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JschProcess"
.end annotation


# instance fields
.field private channel:Lcom/jcraft/jsch/ChannelExec;

.field private errStream:Ljava/io/InputStream;

.field private inputStream:Ljava/io/InputStream;

.field private outputStream:Ljava/io/OutputStream;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/JschSession;

.field private final timeout:I


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/transport/JschSession;Ljava/lang/String;I)V
    .locals 4
    .parameter
    .parameter "commandName"
    .parameter "tms"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iput-object p1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->this$0:Lorg/eclipse/jgit/transport/JschSession;

    invoke-direct {p0}, Ljava/lang/Process;-><init>()V

    .line 145
    iput p3, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->timeout:I

    .line 147
    :try_start_0
    #getter for: Lorg/eclipse/jgit/transport/JschSession;->sock:Lcom/jcraft/jsch/Session;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/JschSession;->access$100(Lorg/eclipse/jgit/transport/JschSession;)Lcom/jcraft/jsch/Session;

    move-result-object v1

    const-string v2, "exec"

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Session;->openChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v1

    check-cast v1, Lcom/jcraft/jsch/ChannelExec;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    .line 148
    iget-object v1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v1, p2}, Lcom/jcraft/jsch/ChannelExec;->setCommand(Ljava/lang/String;)V

    .line 149
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->setupStreams()V

    .line 150
    iget-object v2, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    iget v1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->timeout:I

    if-lez v1, :cond_0

    iget v1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->timeout:I

    mul-int/lit16 v1, v1, 0x3e8

    :goto_0
    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/ChannelExec;->connect(I)V

    .line 151
    iget-object v1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v1}, Lcom/jcraft/jsch/ChannelExec;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 152
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    #getter for: Lorg/eclipse/jgit/transport/JschSession;->uri:Lorg/eclipse/jgit/transport/URIish;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/JschSession;->access$200(Lorg/eclipse/jgit/transport/JschSession;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v2

    const-string v3, "connection failed"

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, e:Lcom/jcraft/jsch/JSchException;
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    #getter for: Lorg/eclipse/jgit/transport/JschSession;->uri:Lorg/eclipse/jgit/transport/URIish;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/JschSession;->access$200(Lorg/eclipse/jgit/transport/JschSession;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v2

    invoke-virtual {v0}, Lcom/jcraft/jsch/JSchException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 150
    .end local v0           #e:Lcom/jcraft/jsch/JSchException;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 156
    :cond_1
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/transport/JschSession;Ljava/lang/String;ILorg/eclipse/jgit/transport/JschSession$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/JschSession$JschProcess;-><init>(Lorg/eclipse/jgit/transport/JschSession;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/transport/JschSession$JschProcess;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 118
    iget v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->timeout:I

    return v0
.end method

.method private isRunning()Z
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->getExitStatus()I

    move-result v0

    if-gez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setupStreams()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    iget-object v4, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v4}, Lcom/jcraft/jsch/ChannelExec;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->inputStream:Ljava/io/InputStream;

    .line 166
    iget-object v4, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v4}, Lcom/jcraft/jsch/ChannelExec;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 167
    .local v1, out:Ljava/io/OutputStream;
    iget v4, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->timeout:I

    if-gtz v4, :cond_0

    .line 168
    iput-object v1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->outputStream:Ljava/io/OutputStream;

    .line 195
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v4}, Lcom/jcraft/jsch/ChannelExec;->getErrStream()Ljava/io/InputStream;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->errStream:Ljava/io/InputStream;

    .line 196
    return-void

    .line 170
    :cond_0
    new-instance v2, Ljava/io/PipedInputStream;

    invoke-direct {v2}, Ljava/io/PipedInputStream;-><init>()V

    .line 171
    .local v2, pipeIn:Ljava/io/PipedInputStream;
    new-instance v0, Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-direct {v0, v2, v1}, Lorg/eclipse/jgit/util/io/StreamCopyThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 173
    .local v0, copier:Lorg/eclipse/jgit/util/io/StreamCopyThread;
    new-instance v3, Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;

    invoke-direct {v3, p0, v2, v0}, Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;-><init>(Lorg/eclipse/jgit/transport/JschSession$JschProcess;Ljava/io/PipedInputStream;Lorg/eclipse/jgit/util/io/StreamCopyThread;)V

    .line 191
    .local v3, pipeOut:Ljava/io/PipedOutputStream;
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->start()V

    .line 192
    iput-object v3, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->outputStream:Ljava/io/OutputStream;

    goto :goto_0
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->disconnect()V

    .line 228
    :cond_0
    return-void
.end method

.method public exitValue()I
    .locals 1

    .prologue
    .line 215
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 216
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 217
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->channel:Lcom/jcraft/jsch/ChannelExec;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelExec;->getExitStatus()I

    move-result v0

    return v0
.end method

.method public getErrorStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->errStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->outputStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public waitFor()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 232
    :goto_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 233
    const-wide/16 v0, 0x64

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_0

    .line 234
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->exitValue()I

    move-result v0

    return v0
.end method
