.class public Lorg/eclipse/jgit/transport/DaemonClient;
.super Ljava/lang/Object;
.source "DaemonClient.java"


# instance fields
.field private final daemon:Lorg/eclipse/jgit/transport/Daemon;

.field private peer:Ljava/net/InetAddress;

.field private rawIn:Ljava/io/InputStream;

.field private rawOut:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/Daemon;)V
    .locals 0
    .parameter "d"

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/eclipse/jgit/transport/DaemonClient;->daemon:Lorg/eclipse/jgit/transport/Daemon;

    .line 69
    return-void
.end method


# virtual methods
.method execute(Ljava/net/Socket;)V
    .locals 6
    .parameter "sock"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 97
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Lorg/eclipse/jgit/transport/DaemonClient;->rawIn:Ljava/io/InputStream;

    .line 98
    new-instance v3, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v3, p0, Lorg/eclipse/jgit/transport/DaemonClient;->rawOut:Ljava/io/OutputStream;

    .line 100
    iget-object v3, p0, Lorg/eclipse/jgit/transport/DaemonClient;->daemon:Lorg/eclipse/jgit/transport/Daemon;

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/Daemon;->getTimeout()I

    move-result v3

    if-lez v3, :cond_0

    .line 101
    iget-object v3, p0, Lorg/eclipse/jgit/transport/DaemonClient;->daemon:Lorg/eclipse/jgit/transport/Daemon;

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/Daemon;->getTimeout()I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    invoke-virtual {p1, v3}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 102
    :cond_0
    new-instance v3, Lorg/eclipse/jgit/transport/PacketLineIn;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/DaemonClient;->rawIn:Ljava/io/InputStream;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/transport/PacketLineIn;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/PacketLineIn;->readStringRaw()Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, cmd:Ljava/lang/String;
    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 104
    .local v1, nul:I
    if-ltz v1, :cond_1

    .line 109
    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 112
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/DaemonClient;->getDaemon()Lorg/eclipse/jgit/transport/Daemon;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/transport/Daemon;->matchService(Ljava/lang/String;)Lorg/eclipse/jgit/transport/DaemonService;

    move-result-object v2

    .line 113
    .local v2, srv:Lorg/eclipse/jgit/transport/DaemonService;
    if-nez v2, :cond_2

    .line 117
    :goto_0
    return-void

    .line 115
    :cond_2
    invoke-virtual {p1, v5}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 116
    invoke-virtual {v2, p0, v0}, Lorg/eclipse/jgit/transport/DaemonService;->execute(Lorg/eclipse/jgit/transport/DaemonClient;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getDaemon()Lorg/eclipse/jgit/transport/Daemon;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonClient;->daemon:Lorg/eclipse/jgit/transport/Daemon;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonClient;->rawIn:Ljava/io/InputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonClient;->rawOut:Ljava/io/OutputStream;

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/eclipse/jgit/transport/DaemonClient;->peer:Ljava/net/InetAddress;

    return-object v0
.end method

.method setRemoteAddress(Ljava/net/InetAddress;)V
    .locals 0
    .parameter "ia"

    .prologue
    .line 72
    iput-object p1, p0, Lorg/eclipse/jgit/transport/DaemonClient;->peer:Ljava/net/InetAddress;

    .line 73
    return-void
.end method
