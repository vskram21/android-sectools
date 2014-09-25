.class public Lorg/eclipse/jgit/transport/TransportSftp;
.super Lorg/eclipse/jgit/transport/SshTransport;
.source "TransportSftp.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/WalkTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;
    }
.end annotation


# static fields
.field static final PROTO_SFTP:Lorg/eclipse/jgit/transport/TransportProtocol;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 100
    new-instance v0, Lorg/eclipse/jgit/transport/TransportSftp$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportSftp$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportSftp;->PROTO_SFTP:Lorg/eclipse/jgit/transport/TransportProtocol;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 0
    .parameter "local"
    .parameter "uri"

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/SshTransport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 131
    return-void
.end method


# virtual methods
.method newSftp()Lcom/jcraft/jsch/ChannelSftp;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportSftp;->getTimeout()I

    move-result v3

    if-lez v3, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportSftp;->getTimeout()I

    move-result v3

    mul-int/lit16 v2, v3, 0x3e8

    .line 154
    .local v2, tms:I
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportSftp;->getSession()Lorg/eclipse/jgit/transport/RemoteSession;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/JschSession;

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/JschSession;->getSftpChannel()Lcom/jcraft/jsch/Channel;

    move-result-object v0

    .line 156
    .local v0, channel:Lcom/jcraft/jsch/Channel;
    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Channel;->connect(I)V

    .line 157
    check-cast v0, Lcom/jcraft/jsch/ChannelSftp;
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0           #channel:Lcom/jcraft/jsch/Channel;
    return-object v0

    .line 150
    .end local v2           #tms:I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 158
    .restart local v2       #tms:I
    :catch_0
    move-exception v1

    .line 159
    .local v1, je:Lcom/jcraft/jsch/JSchException;
    new-instance v3, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportSftp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v1}, Lcom/jcraft/jsch/JSchException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;-><init>(Lorg/eclipse/jgit/transport/TransportSftp;Ljava/lang/String;)V

    .line 136
    .local v0, c:Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;
    new-instance v1, Lorg/eclipse/jgit/transport/WalkFetchConnection;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/transport/WalkFetchConnection;-><init>(Lorg/eclipse/jgit/transport/WalkTransport;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)V

    .line 137
    .local v1, r:Lorg/eclipse/jgit/transport/WalkFetchConnection;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readAdvertisedRefs()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->available(Ljava/util/Map;)V

    .line 138
    return-object v1
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportSftp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;-><init>(Lorg/eclipse/jgit/transport/TransportSftp;Ljava/lang/String;)V

    .line 144
    .local v0, c:Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;
    new-instance v1, Lorg/eclipse/jgit/transport/WalkPushConnection;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/transport/WalkPushConnection;-><init>(Lorg/eclipse/jgit/transport/WalkTransport;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)V

    .line 145
    .local v1, r:Lorg/eclipse/jgit/transport/WalkPushConnection;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->readAdvertisedRefs()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/WalkPushConnection;->available(Ljava/util/Map;)V

    .line 146
    return-object v1
.end method
