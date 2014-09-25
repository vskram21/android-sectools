.class Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;
.super Lorg/eclipse/jgit/transport/BasePackPushConnection;
.source "TransportGitAnon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportGitAnon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TcpPushConnection"
.end annotation


# instance fields
.field private sock:Ljava/net/Socket;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportGitAnon;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportGitAnon;)V
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 207
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->this$0:Lorg/eclipse/jgit/transport/TransportGitAnon;

    .line 208
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 209
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportGitAnon;->openConnection()Ljava/net/Socket;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    .line 211
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 212
    .local v1, sIn:Ljava/io/InputStream;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 214
    .local v3, sOut:Ljava/io/OutputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 215
    .end local v1           #sIn:Ljava/io/InputStream;
    .local v2, sIn:Ljava/io/InputStream;
    new-instance v4, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v4, v3}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 217
    .end local v3           #sOut:Ljava/io/OutputStream;
    .local v4, sOut:Ljava/io/OutputStream;
    invoke-virtual {p0, v2, v4}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 218
    const-string v5, "git-receive-pack"

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {p1, v5, v6}, Lorg/eclipse/jgit/transport/TransportGitAnon;->service(Ljava/lang/String;Lorg/eclipse/jgit/transport/PacketLineOut;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->readAdvertisedRefs()V

    .line 225
    return-void

    .line 219
    .end local v2           #sIn:Ljava/io/InputStream;
    .end local v4           #sOut:Ljava/io/OutputStream;
    :catch_0
    move-exception v0

    .line 220
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->close()V

    .line 221
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->remoteHungUpUnexpectedly:Ljava/lang/String;

    invoke-direct {v5, v6, v7, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 229
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->close()V

    .line 231
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 233
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    .line 240
    :cond_0
    :goto_0
    return-void

    .line 234
    :catch_0
    move-exception v0

    .line 237
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpPushConnection;->sock:Ljava/net/Socket;

    throw v0
.end method
