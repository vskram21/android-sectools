.class public Lcom/jcraft/jsch/ChannelDirectTCPIP;
.super Lcom/jcraft/jsch/Channel;
.source "ChannelDirectTCPIP.java"


# static fields
.field private static final LOCAL_MAXIMUM_PACKET_SIZE:I = 0x4000

.field private static final LOCAL_WINDOW_SIZE_MAX:I = 0x20000

.field private static final _type:[B


# instance fields
.field host:Ljava/lang/String;

.field originator_IP_address:Ljava/lang/String;

.field originator_port:I

.field port:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-string v0, "direct-tcpip"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->_type:[B

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/high16 v1, 0x2

    .line 46
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel;-><init>()V

    .line 42
    const-string v0, "127.0.0.1"

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->originator_IP_address:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->originator_port:I

    .line 47
    sget-object v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->_type:[B

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->type:[B

    .line 48
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setLocalWindowSizeMax(I)V

    .line 49
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setLocalWindowSize(I)V

    .line 50
    const/16 v0, 0x4000

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setLocalPacketSize(I)V

    .line 51
    return-void
.end method


# virtual methods
.method public connect(I)V
    .locals 5
    .parameter "connectTimeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 58
    iput p1, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->connectTimeout:I

    .line 60
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 61
    .local v0, _session:Lcom/jcraft/jsch/Session;
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v2

    if-nez v2, :cond_0

    .line 62
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "session is down"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .end local v0           #_session:Lcom/jcraft/jsch/Session;
    :catch_0
    move-exception v1

    .line 78
    .local v1, e:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v2}, Lcom/jcraft/jsch/IO;->close()V

    .line 79
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    .line 80
    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->del(Lcom/jcraft/jsch/Channel;)V

    .line 81
    instance-of v2, v1, Lcom/jcraft/jsch/JSchException;

    if-eqz v2, :cond_2

    .line 82
    check-cast v1, Lcom/jcraft/jsch/JSchException;

    .end local v1           #e:Ljava/lang/Exception;
    throw v1

    .line 65
    .restart local v0       #_session:Lcom/jcraft/jsch/Session;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    iget-object v2, v2, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v2, :cond_3

    .line 66
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->thread:Ljava/lang/Thread;

    .line 67
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->thread:Ljava/lang/Thread;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DirectTCPIP thread "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 68
    iget-boolean v2, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    if-eqz v2, :cond_1

    .line 69
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->thread:Ljava/lang/Thread;

    iget-boolean v3, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 71
    :cond_1
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->thread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 85
    .end local v0           #_session:Lcom/jcraft/jsch/Session;
    :cond_2
    :goto_0
    return-void

    .line 74
    .restart local v0       #_session:Lcom/jcraft/jsch/Session;
    :cond_3
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->sendChannelOpen()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected genChannelOpenPacket()Lcom/jcraft/jsch/Packet;
    .locals 4

    .prologue
    .line 140
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->host:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x32

    iget-object v3, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->originator_IP_address:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x54

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 143
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 149
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 150
    const/16 v2, 0x5a

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 151
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->type:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 152
    iget v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->id:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 153
    iget v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->lwsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 154
    iget v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->lmpsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 155
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->host:Ljava/lang/String;

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 156
    iget v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->port:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 157
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->originator_IP_address:Ljava/lang/String;

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 158
    iget v2, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->originator_port:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 159
    return-object v1
.end method

.method init()V
    .locals 1

    .prologue
    .line 54
    new-instance v0, Lcom/jcraft/jsch/IO;

    invoke-direct {v0}, Lcom/jcraft/jsch/IO;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    .line 55
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    .line 90
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->sendChannelOpen()V

    .line 92
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    iget v4, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->rmpsize:I

    invoke-direct {v1, v4}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 93
    .local v1, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v3, Lcom/jcraft/jsch/Packet;

    invoke-direct {v3, v1}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 94
    .local v3, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 95
    .local v0, _session:Lcom/jcraft/jsch/Session;
    const/4 v2, 0x0

    .line 100
    .local v2, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->thread:Ljava/lang/Thread;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    iget-object v4, v4, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v4, :cond_0

    .line 101
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    iget-object v4, v4, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    iget-object v5, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/16 v6, 0xe

    iget-object v7, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v7, v7

    add-int/lit8 v7, v7, -0xe

    add-int/lit8 v7, v7, -0x54

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 106
    if-gtz v2, :cond_1

    .line 107
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->eof()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .end local v0           #_session:Lcom/jcraft/jsch/Session;
    .end local v1           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v2           #i:I
    .end local v3           #packet:Lcom/jcraft/jsch/Packet;
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->disconnect()V

    .line 125
    return-void

    .line 110
    .restart local v0       #_session:Lcom/jcraft/jsch/Session;
    .restart local v1       #buf:Lcom/jcraft/jsch/Buffer;
    .restart local v2       #i:I
    .restart local v3       #packet:Lcom/jcraft/jsch/Packet;
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 111
    const/16 v4, 0x5e

    invoke-virtual {v1, v4}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 112
    iget v4, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->recipient:I

    invoke-virtual {v1, v4}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 113
    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 114
    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 115
    monitor-enter p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 116
    :try_start_2
    iget-boolean v4, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->close:Z

    if-eqz v4, :cond_2

    .line 117
    monitor-exit p0

    goto :goto_1

    .line 119
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 122
    .end local v0           #_session:Lcom/jcraft/jsch/Session;
    .end local v1           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v2           #i:I
    .end local v3           #packet:Lcom/jcraft/jsch/Packet;
    :catch_0
    move-exception v4

    goto :goto_1

    .line 118
    .restart local v0       #_session:Lcom/jcraft/jsch/Session;
    .restart local v1       #buf:Lcom/jcraft/jsch/Buffer;
    .restart local v2       #i:I
    .restart local v3       #packet:Lcom/jcraft/jsch/Packet;
    :cond_2
    :try_start_4
    invoke-virtual {v0, v3, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 119
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .parameter "host"

    .prologue
    .line 134
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->host:Ljava/lang/String;

    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 129
    return-void
.end method

.method public setOrgIPAddress(Ljava/lang/String;)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 136
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->originator_IP_address:Ljava/lang/String;

    return-void
.end method

.method public setOrgPort(I)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 137
    iput p1, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->originator_port:I

    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "out"

    .prologue
    .line 131
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 132
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .parameter "port"

    .prologue
    .line 135
    iput p1, p0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->port:I

    return-void
.end method
