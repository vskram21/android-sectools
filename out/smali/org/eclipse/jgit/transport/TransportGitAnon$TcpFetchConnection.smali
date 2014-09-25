.class Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;
.super Lorg/eclipse/jgit/transport/BasePackFetchConnection;
.source "TransportGitAnon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportGitAnon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TcpFetchConnection"
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
    .line 168
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->this$0:Lorg/eclipse/jgit/transport/TransportGitAnon;

    .line 169
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 170
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/TransportGitAnon;->openConnection()Ljava/net/Socket;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    .line 172
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 173
    .local v1, sIn:Ljava/io/InputStream;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 175
    .local v3, sOut:Ljava/io/OutputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 176
    .end local v1           #sIn:Ljava/io/InputStream;
    .local v2, sIn:Ljava/io/InputStream;
    new-instance v4, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v4, v3}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 178
    .end local v3           #sOut:Ljava/io/OutputStream;
    .local v4, sOut:Ljava/io/OutputStream;
    invoke-virtual {p0, v2, v4}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 179
    const-string v5, "git-upload-pack"

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {p1, v5, v6}, Lorg/eclipse/jgit/transport/TransportGitAnon;->service(Ljava/lang/String;Lorg/eclipse/jgit/transport/PacketLineOut;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->readAdvertisedRefs()V

    .line 186
    return-void

    .line 180
    .end local v2           #sIn:Ljava/io/InputStream;
    .end local v4           #sOut:Ljava/io/OutputStream;
    :catch_0
    move-exception v0

    .line 181
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->close()V

    .line 182
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

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

    .line 190
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->close()V

    .line 192
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 194
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    .line 201
    :cond_0
    :goto_0
    return-void

    .line 195
    :catch_0
    move-exception v0

    .line 198
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportGitAnon$TcpFetchConnection;->sock:Ljava/net/Socket;

    throw v0
.end method
