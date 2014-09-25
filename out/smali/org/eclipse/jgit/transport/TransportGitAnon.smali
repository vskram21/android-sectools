.class Lorg/eclipse/jgit/transport/TransportGitAnon;
.super Lorg/eclipse/jgit/transport/TcpTransport;
.source "TransportGitAnon.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PackTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;,
        Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;
    }
.end annotation


# static fields
.field static final GIT_PORT:I = 0x24ca

.field static final PROTO_GIT:Lorg/eclipse/jgit/transport/TransportProtocol;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 77
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitAnon$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportGitAnon$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportGitAnon;->PROTO_GIT:Lorg/eclipse/jgit/transport/TransportProtocol;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 0
    .parameter "local"
    .parameter "uri"

    .prologue
    .line 106
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/TcpTransport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 107
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 122
    return-void
.end method

.method openConnection()Ljava/net/Socket;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitAnon;->getTimeout()I

    move-result v5

    if-lez v5, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitAnon;->getTimeout()I

    move-result v5

    mul-int/lit16 v4, v5, 0x3e8

    .line 126
    .local v4, tms:I
    :goto_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v5

    if-lez v5, :cond_1

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v2

    .line 127
    .local v2, port:I
    :goto_1
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 129
    .local v3, s:Ljava/net/Socket;
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 130
    .local v1, host:Ljava/net/InetAddress;
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 131
    new-instance v5, Ljava/net/InetSocketAddress;

    invoke-direct {v5, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v3, v5, v4}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    return-object v3

    .line 125
    .end local v1           #host:Ljava/net/InetAddress;
    .end local v2           #port:I
    .end local v3           #s:Ljava/net/Socket;
    .end local v4           #tms:I
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 126
    .restart local v4       #tms:I
    :cond_1
    const/16 v2, 0x24ca

    goto :goto_1

    .line 132
    .restart local v2       #port:I
    .restart local v3       #s:Ljava/net/Socket;
    :catch_0
    move-exception v0

    .line 134
    .local v0, c:Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 138
    :goto_2
    instance-of v5, v0, Ljava/net/UnknownHostException;

    if-eqz v5, :cond_2

    .line 139
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->unknownHost:Ljava/lang/String;

    invoke-direct {v5, v6, v7}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v5

    .line 140
    :cond_2
    instance-of v5, v0, Ljava/net/ConnectException;

    if-eqz v5, :cond_3

    .line 141
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v5

    .line 142
    :cond_3
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 135
    :catch_1
    move-exception v5

    goto :goto_2
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;-><init>(Lorg/eclipse/jgit/transport/TransportGitAnon;)V

    return-object v0
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;-><init>(Lorg/eclipse/jgit/transport/TransportGitAnon;)V

    return-object v0
.end method

.method service(Ljava/lang/String;Lorg/eclipse/jgit/transport/PacketLineOut;)V
    .locals 4
    .parameter "name"
    .parameter "pckOut"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .local v0, cmd:Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 152
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 154
    const-string v1, "host="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v1

    const/16 v2, 0x24ca

    if-eq v1, v2, :cond_0

    .line 157
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 162
    invoke-virtual {p2}, Lorg/eclipse/jgit/transport/PacketLineOut;->flush()V

    .line 163
    return-void
.end method
