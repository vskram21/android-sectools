.class public Lcom/jcraft/jsch/Session;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/Session$1;,
        Lcom/jcraft/jsch/Session$GlobalRequestReply;,
        Lcom/jcraft/jsch/Session$Forwarding;
    }
.end annotation


# static fields
.field private static final PACKET_MAX_SIZE:I = 0x40000

.field static final SSH_MSG_CHANNEL_CLOSE:I = 0x61

.field static final SSH_MSG_CHANNEL_DATA:I = 0x5e

.field static final SSH_MSG_CHANNEL_EOF:I = 0x60

.field static final SSH_MSG_CHANNEL_EXTENDED_DATA:I = 0x5f

.field static final SSH_MSG_CHANNEL_FAILURE:I = 0x64

.field static final SSH_MSG_CHANNEL_OPEN:I = 0x5a

.field static final SSH_MSG_CHANNEL_OPEN_CONFIRMATION:I = 0x5b

.field static final SSH_MSG_CHANNEL_OPEN_FAILURE:I = 0x5c

.field static final SSH_MSG_CHANNEL_REQUEST:I = 0x62

.field static final SSH_MSG_CHANNEL_SUCCESS:I = 0x63

.field static final SSH_MSG_CHANNEL_WINDOW_ADJUST:I = 0x5d

.field static final SSH_MSG_DEBUG:I = 0x4

.field static final SSH_MSG_DISCONNECT:I = 0x1

.field static final SSH_MSG_GLOBAL_REQUEST:I = 0x50

.field static final SSH_MSG_IGNORE:I = 0x2

.field static final SSH_MSG_KEXDH_INIT:I = 0x1e

.field static final SSH_MSG_KEXDH_REPLY:I = 0x1f

.field static final SSH_MSG_KEXINIT:I = 0x14

.field static final SSH_MSG_KEX_DH_GEX_GROUP:I = 0x1f

.field static final SSH_MSG_KEX_DH_GEX_INIT:I = 0x20

.field static final SSH_MSG_KEX_DH_GEX_REPLY:I = 0x21

.field static final SSH_MSG_KEX_DH_GEX_REQUEST:I = 0x22

.field static final SSH_MSG_NEWKEYS:I = 0x15

.field static final SSH_MSG_REQUEST_FAILURE:I = 0x52

.field static final SSH_MSG_REQUEST_SUCCESS:I = 0x51

.field static final SSH_MSG_SERVICE_ACCEPT:I = 0x6

.field static final SSH_MSG_SERVICE_REQUEST:I = 0x5

.field static final SSH_MSG_UNIMPLEMENTED:I = 0x3

.field static final buffer_margin:I = 0x54

.field private static final keepalivemsg:[B

.field private static final nomoresessions:[B

.field static random:Lcom/jcraft/jsch/Random;


# instance fields
.field private Ec2s:[B

.field private Es2c:[B

.field private IVc2s:[B

.field private IVs2c:[B

.field private I_C:[B

.field private I_S:[B

.field private K_S:[B

.field private MACc2s:[B

.field private MACs2c:[B

.field private V_C:[B

.field private V_S:[B

.field agent_forwarding:Z

.field auth_failures:I

.field buf:Lcom/jcraft/jsch/Buffer;

.field private c2scipher:Lcom/jcraft/jsch/Cipher;

.field private c2scipher_size:I

.field private c2smac:Lcom/jcraft/jsch/MAC;

.field compress_len:[I

.field private config:Ljava/util/Hashtable;

.field private connectThread:Ljava/lang/Thread;

.field protected daemon_thread:Z

.field private deflater:Lcom/jcraft/jsch/Compression;

.field private grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

.field guess:[Ljava/lang/String;

.field host:Ljava/lang/String;

.field private hostKeyAlias:Ljava/lang/String;

.field private hostkey:Lcom/jcraft/jsch/HostKey;

.field private hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

.field private identityRepository:Lcom/jcraft/jsch/IdentityRepository;

.field in:Ljava/io/InputStream;

.field private in_kex:Z

.field private inflater:Lcom/jcraft/jsch/Compression;

.field private io:Lcom/jcraft/jsch/IO;

.field private isAuthed:Z

.field private volatile isConnected:Z

.field jsch:Lcom/jcraft/jsch/JSch;

.field private kex_start_time:J

.field private lock:Ljava/lang/Object;

.field max_auth_tries:I

.field org_host:Ljava/lang/String;

.field out:Ljava/io/OutputStream;

.field packet:Lcom/jcraft/jsch/Packet;

.field password:[B

.field port:I

.field private proxy:Lcom/jcraft/jsch/Proxy;

.field private s2ccipher:Lcom/jcraft/jsch/Cipher;

.field private s2ccipher_size:I

.field private s2cmac:Lcom/jcraft/jsch/MAC;

.field private s2cmac_result1:[B

.field private s2cmac_result2:[B

.field private seqi:I

.field private seqo:I

.field private serverAliveCountMax:I

.field private serverAliveInterval:I

.field private session_id:[B

.field private socket:Ljava/net/Socket;

.field socket_factory:Lcom/jcraft/jsch/SocketFactory;

.field thread:Ljava/lang/Runnable;

.field private timeout:I

.field uncompress_len:[I

.field private userinfo:Lcom/jcraft/jsch/UserInfo;

.field username:Ljava/lang/String;

.field x11_forwarding:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 2352
    const-string v0, "keepalive@jcraft.com"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Session;->keepalivemsg:[B

    .line 2363
    const-string v0, "no-more-sessions@openssh.com"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Session;->nomoresessions:[B

    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/JSch;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .parameter "jsch"
    .parameter "username"
    .parameter "host"
    .parameter "port"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const-string v0, "SSH-2.0-JSCH-0.1.50"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    .line 86
    iput v3, p0, Lcom/jcraft/jsch/Session;->seqi:I

    .line 87
    iput v3, p0, Lcom/jcraft/jsch/Session;->seqo:I

    .line 89
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    .line 103
    iput v3, p0, Lcom/jcraft/jsch/Session;->timeout:I

    .line 105
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 107
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    .line 109
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    .line 110
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    .line 112
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->x11_forwarding:Z

    .line 113
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->agent_forwarding:Z

    .line 115
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    .line 116
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    .line 123
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    .line 129
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    .line 131
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    .line 134
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    .line 135
    iput v3, p0, Lcom/jcraft/jsch/Session;->serverAliveInterval:I

    .line 136
    iput v4, p0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    .line 138
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    .line 139
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    .line 141
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    .line 143
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 145
    const/4 v0, 0x6

    iput v0, p0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    .line 146
    iput v3, p0, Lcom/jcraft/jsch/Session;->auth_failures:I

    .line 148
    const-string v0, "127.0.0.1"

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    .line 149
    const-string v0, "127.0.0.1"

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    .line 150
    const/16 v0, 0x16

    iput v0, p0, Lcom/jcraft/jsch/Session;->port:I

    .line 152
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    .line 153
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->password:[B

    .line 604
    iput-boolean v3, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 899
    new-array v0, v4, [I

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    .line 900
    new-array v0, v4, [I

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    .line 902
    iput v5, p0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    .line 903
    iput v5, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    .line 2130
    new-instance v0, Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-direct {v0, p0, v2}, Lcom/jcraft/jsch/Session$GlobalRequestReply;-><init>(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Session$1;)V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    .line 2374
    iput-object v2, p0, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    .line 159
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    .line 160
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 161
    new-instance v0, Lcom/jcraft/jsch/Packet;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    .line 162
    iput-object p2, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    .line 163
    iput-object p3, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    iput-object p3, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    .line 164
    iput p4, p0, Lcom/jcraft/jsch/Session;->port:I

    .line 166
    invoke-direct {p0}, Lcom/jcraft/jsch/Session;->applyConfig()V

    .line 168
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 170
    :try_start_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    const-string v1, "user.name"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 178
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    const-string v1, "username is not given."

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_1
    return-void

    .line 172
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private _setPortForwardingR(Ljava/lang/String;I)I
    .locals 11
    .parameter "bind_address"
    .parameter "rport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 2132
    iget-object v7, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    monitor-enter v7

    .line 2133
    :try_start_0
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    const/16 v6, 0x64

    invoke-direct {v1, v6}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 2134
    .local v1, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v4, Lcom/jcraft/jsch/Packet;

    invoke-direct {v4, v1}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2136
    .local v4, packet:Lcom/jcraft/jsch/Packet;
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2138
    .local v0, address_to_bind:Ljava/lang/String;
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setThread(Ljava/lang/Thread;)V

    .line 2139
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6, p2}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setPort(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2147
    :try_start_1
    invoke-virtual {v4}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2148
    const/16 v6, 0x50

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2149
    const-string v6, "tcpip-forward"

    invoke-static {v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2150
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2151
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2152
    invoke-virtual {v1, p2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2153
    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 2162
    const/4 v2, 0x0

    .line 2163
    .local v2, count:I
    :try_start_2
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getReply()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v5

    .line 2164
    .local v5, reply:I
    :goto_0
    const/16 v6, 0xa

    if-ge v2, v6, :cond_1

    const/4 v6, -0x1

    if-ne v5, v6, :cond_1

    .line 2165
    const-wide/16 v8, 0x3e8

    :try_start_3
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 2168
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 2169
    :try_start_4
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getReply()I

    move-result v5

    goto :goto_0

    .line 2155
    .end local v2           #count:I
    .end local v5           #reply:I
    :catch_0
    move-exception v3

    .line 2156
    .local v3, e:Ljava/lang/Exception;
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setThread(Ljava/lang/Thread;)V

    .line 2157
    instance-of v6, v3, Ljava/lang/Throwable;

    if-eqz v6, :cond_0

    .line 2158
    new-instance v6, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2176
    .end local v0           #address_to_bind:Ljava/lang/String;
    .end local v1           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v3           #e:Ljava/lang/Exception;
    .end local v4           #packet:Lcom/jcraft/jsch/Packet;
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v6

    .line 2159
    .restart local v0       #address_to_bind:Ljava/lang/String;
    .restart local v1       #buf:Lcom/jcraft/jsch/Buffer;
    .restart local v3       #e:Ljava/lang/Exception;
    .restart local v4       #packet:Lcom/jcraft/jsch/Packet;
    :cond_0
    :try_start_5
    new-instance v6, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2171
    .end local v3           #e:Ljava/lang/Exception;
    .restart local v2       #count:I
    .restart local v5       #reply:I
    :cond_1
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setThread(Ljava/lang/Thread;)V

    .line 2172
    if-eq v5, v10, :cond_2

    .line 2173
    new-instance v6, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "remote port forwarding failed for listen port "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2175
    :cond_2
    iget-object v6, p0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getPort()I

    move-result p2

    .line 2176
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 2177
    return p2

    .line 2166
    :catch_1
    move-exception v6

    goto :goto_1
.end method

.method private _write(Lcom/jcraft/jsch/Packet;)V
    .locals 2
    .parameter "packet"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1351
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 1352
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->encode(Lcom/jcraft/jsch/Packet;)V

    .line 1353
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    if-eqz v0, :cond_0

    .line 1354
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/IO;->put(Lcom/jcraft/jsch/Packet;)V

    .line 1355
    iget v0, p0, Lcom/jcraft/jsch/Session;->seqo:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jcraft/jsch/Session;->seqo:I

    .line 1357
    :cond_0
    monitor-exit v1

    .line 1358
    return-void

    .line 1357
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private applyConfig()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2609
    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v12}, Lcom/jcraft/jsch/JSch;->getConfigRepository()Lcom/jcraft/jsch/ConfigRepository;

    move-result-object v1

    .line 2610
    .local v1, configRepository:Lcom/jcraft/jsch/ConfigRepository;
    if-nez v1, :cond_1

    .line 2720
    :cond_0
    :goto_0
    return-void

    .line 2614
    :cond_1
    iget-object v12, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    invoke-interface {v1, v12}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v0

    .line 2617
    .local v0, config:Lcom/jcraft/jsch/ConfigRepository$Config;
    const/4 v10, 0x0

    .line 2619
    .local v10, value:Ljava/lang/String;
    invoke-interface {v0}, Lcom/jcraft/jsch/ConfigRepository$Config;->getUser()Ljava/lang/String;

    move-result-object v10

    .line 2620
    if-eqz v10, :cond_2

    .line 2621
    iput-object v10, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    .line 2623
    :cond_2
    invoke-interface {v0}, Lcom/jcraft/jsch/ConfigRepository$Config;->getHostname()Ljava/lang/String;

    move-result-object v10

    .line 2624
    if-eqz v10, :cond_3

    .line 2625
    iput-object v10, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    .line 2627
    :cond_3
    invoke-interface {v0}, Lcom/jcraft/jsch/ConfigRepository$Config;->getPort()I

    move-result v9

    .line 2628
    .local v9, port:I
    const/4 v12, -0x1

    if-eq v9, v12, :cond_4

    .line 2629
    iput v9, p0, Lcom/jcraft/jsch/Session;->port:I

    .line 2631
    :cond_4
    const-string v12, "kex"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2632
    const-string v12, "server_host_key"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2634
    const-string v12, "cipher.c2s"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2635
    const-string v12, "cipher.s2c"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2636
    const-string v12, "mac.c2s"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2637
    const-string v12, "mac.s2c"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2638
    const-string v12, "compression.c2s"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2639
    const-string v12, "compression.s2c"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2640
    const-string v12, "compression_level"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2642
    const-string v12, "StrictHostKeyChecking"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2643
    const-string v12, "HashKnownHosts"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2644
    const-string v12, "PreferredAuthentications"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2645
    const-string v12, "MaxAuthTries"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2646
    const-string v12, "ClearAllForwardings"

    invoke-direct {p0, v0, v12}, Lcom/jcraft/jsch/Session;->checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V

    .line 2648
    const-string v12, "HostKeyAlias"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2649
    if-eqz v10, :cond_5

    .line 2650
    invoke-virtual {p0, v10}, Lcom/jcraft/jsch/Session;->setHostKeyAlias(Ljava/lang/String;)V

    .line 2652
    :cond_5
    const-string v12, "UserKnownHostsFile"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2653
    if-eqz v10, :cond_6

    .line 2654
    new-instance v8, Lcom/jcraft/jsch/KnownHosts;

    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-direct {v8, v12}, Lcom/jcraft/jsch/KnownHosts;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 2655
    .local v8, kh:Lcom/jcraft/jsch/KnownHosts;
    invoke-virtual {v8, v10}, Lcom/jcraft/jsch/KnownHosts;->setKnownHosts(Ljava/lang/String;)V

    .line 2656
    invoke-virtual {p0, v8}, Lcom/jcraft/jsch/Session;->setHostKeyRepository(Lcom/jcraft/jsch/HostKeyRepository;)V

    .line 2659
    .end local v8           #kh:Lcom/jcraft/jsch/KnownHosts;
    :cond_6
    const-string v12, "IdentityFile"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 2660
    .local v11, values:[Ljava/lang/String;
    if-eqz v11, :cond_d

    .line 2661
    const-string v12, ""

    invoke-interface {v1, v12}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v12

    const-string v13, "IdentityFile"

    invoke-interface {v12, v13}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 2663
    .local v2, global:[Ljava/lang/String;
    if-eqz v2, :cond_7

    .line 2664
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    array-length v12, v2

    if-ge v3, v12, :cond_8

    .line 2665
    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    aget-object v13, v2, v3

    invoke-virtual {v12, v13}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;)V

    .line 2664
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2669
    .end local v3           #i:I
    :cond_7
    const/4 v12, 0x0

    new-array v2, v12, [Ljava/lang/String;

    .line 2671
    :cond_8
    array-length v12, v11

    array-length v13, v2

    sub-int/2addr v12, v13

    if-lez v12, :cond_d

    .line 2672
    new-instance v6, Lcom/jcraft/jsch/IdentityRepository$Wrapper;

    iget-object v12, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v12}, Lcom/jcraft/jsch/JSch;->getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v12

    const/4 v13, 0x1

    invoke-direct {v6, v12, v13}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;-><init>(Lcom/jcraft/jsch/IdentityRepository;Z)V

    .line 2674
    .local v6, ir:Lcom/jcraft/jsch/IdentityRepository$Wrapper;
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_2
    array-length v12, v11

    if-ge v3, v12, :cond_c

    .line 2675
    aget-object v5, v11, v3

    .line 2676
    .local v5, ifile:Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, j:I
    :goto_3
    array-length v12, v2

    if-ge v7, v12, :cond_a

    .line 2677
    aget-object v12, v2, v7

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_9

    .line 2676
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 2679
    :cond_9
    const/4 v5, 0x0

    .line 2682
    :cond_a
    if-nez v5, :cond_b

    .line 2674
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2684
    :cond_b
    const/4 v12, 0x0

    iget-object v13, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-static {v5, v12, v13}, Lcom/jcraft/jsch/IdentityFile;->newInstance(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/JSch;)Lcom/jcraft/jsch/IdentityFile;

    move-result-object v4

    .line 2686
    .local v4, identity:Lcom/jcraft/jsch/Identity;
    invoke-virtual {v6, v4}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->add(Lcom/jcraft/jsch/Identity;)V

    goto :goto_4

    .line 2688
    .end local v4           #identity:Lcom/jcraft/jsch/Identity;
    .end local v5           #ifile:Ljava/lang/String;
    .end local v7           #j:I
    :cond_c
    invoke-virtual {p0, v6}, Lcom/jcraft/jsch/Session;->setIdentityRepository(Lcom/jcraft/jsch/IdentityRepository;)V

    .line 2692
    .end local v2           #global:[Ljava/lang/String;
    .end local v3           #i:I
    .end local v6           #ir:Lcom/jcraft/jsch/IdentityRepository$Wrapper;
    :cond_d
    const-string v12, "ServerAliveInterval"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2693
    if-eqz v10, :cond_e

    .line 2695
    :try_start_0
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->setServerAliveInterval(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2701
    :cond_e
    :goto_5
    const-string v12, "ConnectTimeout"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2702
    if-eqz v10, :cond_f

    .line 2704
    :try_start_1
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->setTimeout(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 2710
    :cond_f
    :goto_6
    const-string v12, "MaxAuthTries"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2711
    if-eqz v10, :cond_10

    .line 2712
    const-string v12, "MaxAuthTries"

    invoke-virtual {p0, v12, v10}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 2715
    :cond_10
    const-string v12, "ClearAllForwardings"

    invoke-interface {v0, v12}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2716
    if-eqz v10, :cond_0

    .line 2717
    const-string v12, "ClearAllForwardings"

    invoke-virtual {p0, v12, v10}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2706
    :catch_0
    move-exception v12

    goto :goto_6

    .line 2697
    :catch_1
    move-exception v12

    goto :goto_5
.end method

.method private applyConfigChannel(Lcom/jcraft/jsch/ChannelSession;)V
    .locals 4
    .parameter "channel"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2723
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v3}, Lcom/jcraft/jsch/JSch;->getConfigRepository()Lcom/jcraft/jsch/ConfigRepository;

    move-result-object v1

    .line 2724
    .local v1, configRepository:Lcom/jcraft/jsch/ConfigRepository;
    if-nez v1, :cond_1

    .line 2742
    :cond_0
    :goto_0
    return-void

    .line 2728
    :cond_1
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    invoke-interface {v1, v3}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v0

    .line 2731
    .local v0, config:Lcom/jcraft/jsch/ConfigRepository$Config;
    const/4 v2, 0x0

    .line 2733
    .local v2, value:Ljava/lang/String;
    const-string v3, "ForwardAgent"

    invoke-interface {v0, v3}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2734
    if-eqz v2, :cond_2

    .line 2735
    const-string v3, "yes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p1, v3}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    .line 2738
    :cond_2
    const-string v3, "RequestTTY"

    invoke-interface {v0, v3}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2739
    if-eqz v2, :cond_0

    .line 2740
    const-string v3, "yes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p1, v3}, Lcom/jcraft/jsch/ChannelSession;->setPty(Z)V

    goto :goto_0
.end method

.method static checkCipher(Ljava/lang/String;)Z
    .locals 8
    .parameter "cipher"

    .prologue
    const/4 v5, 0x0

    .line 2467
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 2468
    .local v2, c:Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/Cipher;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v1, v0

    .line 2469
    .local v1, _c:Lcom/jcraft/jsch/Cipher;
    const/4 v4, 0x0

    invoke-interface {v1}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v6

    new-array v6, v6, [B

    invoke-interface {v1}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v7

    new-array v7, v7, [B

    invoke-interface {v1, v4, v6, v7}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2472
    const/4 v4, 0x1

    .line 2475
    .end local v1           #_c:Lcom/jcraft/jsch/Cipher;
    .end local v2           #c:Ljava/lang/Class;
    :goto_0
    return v4

    .line 2474
    :catch_0
    move-exception v3

    .local v3, e:Ljava/lang/Exception;
    move v4, v5

    .line 2475
    goto :goto_0
.end method

.method private checkCiphers(Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .parameter "ciphers"

    .prologue
    const/4 v1, 0x0

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 2435
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 2462
    :cond_0
    return-object v1

    .line 2438
    :cond_1
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    invoke-interface {v4, v7}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2439
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CheckCiphers: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v7, v5}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2443
    :cond_2
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 2444
    .local v3, result:Ljava/util/Vector;
    const-string v4, ","

    invoke-static {p1, v4}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 2445
    .local v0, _ciphers:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_4

    .line 2446
    aget-object v4, v0, v2

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 2447
    aget-object v4, v0, v2

    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2445
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2450
    :cond_4
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    if-eqz v4, :cond_0

    .line 2452
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v1, v4, [Ljava/lang/String;

    .line 2453
    .local v1, foo:[Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/Vector;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v5

    invoke-static {v4, v8, v1, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2455
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    invoke-interface {v4, v7}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2456
    const/4 v2, 0x0

    :goto_1
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 2457
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v6, v1, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not available."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v7, v5}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2456
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private checkConfig(Lcom/jcraft/jsch/ConfigRepository$Config;Ljava/lang/String;)V
    .locals 1
    .parameter "config"
    .parameter "key"

    .prologue
    .line 2773
    invoke-interface {p1, p2}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2774
    .local v0, value:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 2775
    invoke-virtual {p0, p2, v0}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 2776
    :cond_0
    return-void
.end method

.method private checkHost(Ljava/lang/String;ILcom/jcraft/jsch/KeyExchange;)V
    .locals 22
    .parameter "chost"
    .parameter "port"
    .parameter "kex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 693
    const-string v18, "StrictHostKeyChecking"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 695
    .local v17, shkc:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_0

    .line 696
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    move-object/from16 p1, v0

    .line 701
    :cond_0
    invoke-virtual/range {p3 .. p3}, Lcom/jcraft/jsch/KeyExchange;->getHostKey()[B

    move-result-object v3

    .line 702
    .local v3, K_S:[B
    invoke-virtual/range {p3 .. p3}, Lcom/jcraft/jsch/KeyExchange;->getKeyType()Ljava/lang/String;

    move-result-object v14

    .line 703
    .local v14, key_type:Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/jcraft/jsch/KeyExchange;->getFingerPrint()Ljava/lang/String;

    move-result-object v13

    .line 705
    .local v13, key_fprint:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_1

    const/16 v18, 0x16

    move/from16 v0, p2

    move/from16 v1, v18

    if-eq v0, v1, :cond_1

    .line 706
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "]:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 709
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;

    move-result-object v9

    .line 711
    .local v9, hkr:Lcom/jcraft/jsch/HostKeyRepository;
    const-string v18, "HashKnownHosts"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 712
    .local v8, hkh:Ljava/lang/String;
    const-string v18, "yes"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    instance-of v0, v9, Lcom/jcraft/jsch/KnownHosts;

    move/from16 v18, v0

    if-eqz v18, :cond_5

    move-object/from16 v18, v9

    .line 713
    check-cast v18, Lcom/jcraft/jsch/KnownHosts;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3}, Lcom/jcraft/jsch/KnownHosts;->createHashedHostKey(Ljava/lang/String;[B)Lcom/jcraft/jsch/HostKey;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    .line 719
    :goto_0
    const/4 v10, 0x0

    .line 720
    .local v10, i:I
    monitor-enter v9

    .line 721
    :try_start_0
    move-object/from16 v0, p1

    invoke-interface {v9, v0, v3}, Lcom/jcraft/jsch/HostKeyRepository;->check(Ljava/lang/String;[B)I

    move-result v10

    .line 722
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 724
    const/4 v11, 0x0

    .line 725
    .local v11, insert:Z
    const-string v18, "ask"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_2

    const-string v18, "yes"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    :cond_2
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v10, v0, :cond_8

    .line 727
    const/4 v6, 0x0

    .line 728
    .local v6, file:Ljava/lang/String;
    monitor-enter v9

    .line 729
    :try_start_1
    invoke-interface {v9}, Lcom/jcraft/jsch/HostKeyRepository;->getKnownHostsRepositoryID()Ljava/lang/String;

    move-result-object v6

    .line 730
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 731
    if-nez v6, :cond_3

    const-string v6, "known_hosts"

    .line 733
    :cond_3
    const/4 v5, 0x0

    .line 735
    .local v5, b:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    if-eqz v18, :cond_4

    .line 736
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!\nIT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!\nSomeone could be eavesdropping on you right now (man-in-the-middle attack)!\nIt is also possible that the "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " host key has just been changed.\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "The fingerprint for the "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " key sent by the remote host is\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ".\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "Please contact your system administrator.\n"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "Add correct host key in "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " to get rid of this message."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 746
    .local v16, message:Ljava/lang/String;
    const-string v18, "ask"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\nDo you want to delete the old key and insert the new key?"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v5

    .line 755
    .end local v16           #message:Ljava/lang/String;
    :cond_4
    :goto_1
    if-nez v5, :cond_7

    .line 756
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "HostKey has been changed: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 716
    .end local v5           #b:Z
    .end local v6           #file:Ljava/lang/String;
    .end local v10           #i:I
    .end local v11           #insert:Z
    :cond_5
    new-instance v18, Lcom/jcraft/jsch/HostKey;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;[B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    goto/16 :goto_0

    .line 722
    .restart local v10       #i:I
    :catchall_0
    move-exception v18

    :try_start_2
    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v18

    .line 730
    .restart local v6       #file:Ljava/lang/String;
    .restart local v11       #insert:Z
    :catchall_1
    move-exception v18

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v18

    .line 751
    .restart local v5       #b:Z
    .restart local v16       #message:Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto :goto_1

    .line 759
    .end local v16           #message:Ljava/lang/String;
    :cond_7
    monitor-enter v9

    .line 760
    :try_start_4
    const-string v18, "DSA"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_a

    const-string v18, "ssh-dss"

    :goto_2
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v9, v0, v1, v2}, Lcom/jcraft/jsch/HostKeyRepository;->remove(Ljava/lang/String;Ljava/lang/String;[B)V

    .line 763
    const/4 v11, 0x1

    .line 764
    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 767
    .end local v5           #b:Z
    .end local v6           #file:Ljava/lang/String;
    :cond_8
    const-string v18, "ask"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_9

    const-string v18, "yes"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_d

    :cond_9
    if-eqz v10, :cond_d

    if-nez v11, :cond_d

    .line 769
    const-string v18, "yes"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b

    .line 770
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "reject HostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 760
    .restart local v5       #b:Z
    .restart local v6       #file:Ljava/lang/String;
    :cond_a
    :try_start_5
    const-string v18, "ssh-rsa"

    goto :goto_2

    .line 764
    :catchall_2
    move-exception v18

    monitor-exit v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v18

    .line 773
    .end local v5           #b:Z
    .end local v6           #file:Ljava/lang/String;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    if-eqz v18, :cond_11

    .line 774
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "The authenticity of host \'"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\' can\'t be established.\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " key fingerprint is "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ".\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "Are you sure you want to continue connecting?"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v7

    .line 779
    .local v7, foo:Z
    if-nez v7, :cond_c

    .line 780
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "reject HostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 782
    :cond_c
    const/4 v11, 0x1

    .line 792
    .end local v7           #foo:Z
    :cond_d
    const-string v18, "no"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_e

    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v0, v10, :cond_e

    .line 794
    const/4 v11, 0x1

    .line 797
    :cond_e
    if-nez v10, :cond_15

    .line 798
    const-string v18, "DSA"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_13

    const-string v18, "ssh-dss"

    :goto_3
    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v9, v0, v1}, Lcom/jcraft/jsch/HostKeyRepository;->getHostKey(Ljava/lang/String;Ljava/lang/String;)[Lcom/jcraft/jsch/HostKey;

    move-result-object v15

    .line 801
    .local v15, keys:[Lcom/jcraft/jsch/HostKey;
    const/16 v18, 0x0

    array-length v0, v3

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v3, v0, v1}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    .line 802
    .local v4, _key:Ljava/lang/String;
    const/4 v12, 0x0

    .local v12, j:I
    :goto_4
    array-length v0, v15

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v12, v0, :cond_15

    .line 803
    aget-object v18, v15, v10

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/HostKey;->getKey()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_14

    aget-object v18, v15, v12

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/HostKey;->getMarker()Ljava/lang/String;

    move-result-object v18

    const-string v19, "@revoked"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_14

    .line 805
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    if-eqz v18, :cond_f

    .line 806
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "The "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " host key for "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " is marked as revoked.\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "This could mean that a stolen key is being used to "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "impersonate this host."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    .line 811
    :cond_f
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_10

    .line 812
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Host \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' has provided revoked key."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 815
    :cond_10
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "revoked HostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 785
    .end local v4           #_key:Ljava/lang/String;
    .end local v12           #j:I
    .end local v15           #keys:[Lcom/jcraft/jsch/HostKey;
    :cond_11
    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v10, v0, :cond_12

    .line 786
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "UnknownHostKey: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ". "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " key fingerprint is "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 788
    :cond_12
    new-instance v18, Lcom/jcraft/jsch/JSchException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "HostKey has been changed: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 798
    :cond_13
    const-string v18, "ssh-rsa"

    goto/16 :goto_3

    .line 802
    .restart local v4       #_key:Ljava/lang/String;
    .restart local v12       #j:I
    .restart local v15       #keys:[Lcom/jcraft/jsch/HostKey;
    :cond_14
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_4

    .line 820
    .end local v4           #_key:Ljava/lang/String;
    .end local v12           #j:I
    .end local v15           #keys:[Lcom/jcraft/jsch/HostKey;
    :cond_15
    if-nez v10, :cond_16

    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_16

    .line 822
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Host \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' is known and mathces the "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " host key"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 826
    :cond_16
    if-eqz v11, :cond_17

    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x2

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_17

    .line 828
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x2

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Permanently added \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' ("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ") to the list of known hosts."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 832
    :cond_17
    if-eqz v11, :cond_18

    .line 833
    monitor-enter v9

    .line 834
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v9, v0, v1}, Lcom/jcraft/jsch/HostKeyRepository;->add(Lcom/jcraft/jsch/HostKey;Lcom/jcraft/jsch/UserInfo;)V

    .line 835
    monitor-exit v9

    .line 837
    :cond_18
    return-void

    .line 835
    :catchall_3
    move-exception v18

    monitor-exit v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v18
.end method

.method static checkKex(Lcom/jcraft/jsch/Session;Ljava/lang/String;)Z
    .locals 9
    .parameter "s"
    .parameter "kex"

    .prologue
    .line 2512
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 2513
    .local v7, c:Ljava/lang/Class;
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/KeyExchange;

    move-object v0, v2

    check-cast v0, Lcom/jcraft/jsch/KeyExchange;

    move-object v1, v0

    .line 2514
    .local v1, _c:Lcom/jcraft/jsch/KeyExchange;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    invoke-virtual/range {v1 .. v6}, Lcom/jcraft/jsch/KeyExchange;->init(Lcom/jcraft/jsch/Session;[B[B[B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2515
    const/4 v2, 0x1

    .line 2517
    .end local v1           #_c:Lcom/jcraft/jsch/KeyExchange;
    .end local v7           #c:Ljava/lang/Class;
    :goto_0
    return v2

    :catch_0
    move-exception v8

    .local v8, e:Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private checkKexes(Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .parameter "kexes"

    .prologue
    const/4 v1, 0x0

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 2480
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 2507
    :cond_0
    return-object v1

    .line 2483
    :cond_1
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    invoke-interface {v4, v7}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2484
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CheckKexes: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v7, v5}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2488
    :cond_2
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 2489
    .local v3, result:Ljava/util/Vector;
    const-string v4, ","

    invoke-static {p1, v4}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 2490
    .local v0, _kexes:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_4

    .line 2491
    aget-object v4, v0, v2

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/jcraft/jsch/Session;->checkKex(Lcom/jcraft/jsch/Session;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 2492
    aget-object v4, v0, v2

    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2490
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2495
    :cond_4
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    if-eqz v4, :cond_0

    .line 2497
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v1, v4, [Ljava/lang/String;

    .line 2498
    .local v1, foo:[Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/Vector;->toArray()[Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v5

    invoke-static {v4, v8, v1, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2500
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    invoke-interface {v4, v7}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2501
    const/4 v2, 0x0

    :goto_1
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 2502
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v6, v1, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not available."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v7, v5}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 2501
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private expandKey(Lcom/jcraft/jsch/Buffer;[B[B[BLcom/jcraft/jsch/HASH;I)[B
    .locals 6
    .parameter "buf"
    .parameter "K"
    .parameter "H"
    .parameter "key"
    .parameter "hash"
    .parameter "required_length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1218
    move-object v0, p4

    .line 1219
    .local v0, result:[B
    invoke-interface {p5}, Lcom/jcraft/jsch/HASH;->getBlockSize()I

    move-result v1

    .line 1220
    .local v1, size:I
    :goto_0
    array-length v3, v0

    if-ge v3, p6, :cond_0

    .line 1221
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1222
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1223
    invoke-virtual {p1, p3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1224
    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1225
    iget-object v3, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v4, p1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {p5, v3, v5, v4}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1226
    array-length v3, v0

    add-int/2addr v3, v1

    new-array v2, v3, [B

    .line 1227
    .local v2, tmp:[B
    array-length v3, v0

    invoke-static {v0, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1228
    invoke-interface {p5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v3

    array-length v4, v0

    invoke-static {v3, v5, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1229
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 1230
    move-object v0, v2

    .line 1231
    goto :goto_0

    .line 1232
    .end local v2           #tmp:[B
    :cond_0
    return-object v0
.end method

.method private initDeflater(Ljava/lang/String;)V
    .locals 6
    .parameter "method"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2202
    const-string v4, "none"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2203
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    .line 2227
    :cond_0
    :goto_0
    return-void

    .line 2206
    :cond_1
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2207
    .local v2, foo:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 2208
    const-string v4, "zlib"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    iget-boolean v4, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    if-eqz v4, :cond_0

    const-string v4, "zlib@openssh.com"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2211
    :cond_2
    :try_start_0
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2212
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/Compression;

    check-cast v4, Lcom/jcraft/jsch/Compression;

    iput-object v4, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 2213
    const/4 v3, 0x6

    .line 2214
    .local v3, level:I
    :try_start_1
    const-string v4, "compression_level"

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    .line 2216
    :goto_1
    :try_start_2
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    const/4 v5, 0x1

    invoke-interface {v4, v5, v3}, Lcom/jcraft/jsch/Compression;->init(II)V
    :try_end_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 2218
    .end local v0           #c:Ljava/lang/Class;
    .end local v3           #level:I
    :catch_0
    move-exception v1

    .line 2219
    .local v1, ee:Ljava/lang/NoClassDefFoundError;
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/lang/NoClassDefFoundError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2221
    .end local v1           #ee:Ljava/lang/NoClassDefFoundError;
    :catch_1
    move-exception v1

    .line 2222
    .local v1, ee:Ljava/lang/Exception;
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2215
    .end local v1           #ee:Ljava/lang/Exception;
    .restart local v0       #c:Ljava/lang/Class;
    .restart local v3       #level:I
    :catch_2
    move-exception v4

    goto :goto_1
.end method

.method private initInflater(Ljava/lang/String;)V
    .locals 6
    .parameter "method"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2229
    const-string v3, "none"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2230
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    .line 2248
    :cond_0
    :goto_0
    return-void

    .line 2233
    :cond_1
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2234
    .local v2, foo:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 2235
    const-string v3, "zlib"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-boolean v3, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    if-eqz v3, :cond_0

    const-string v3, "zlib@openssh.com"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2238
    :cond_2
    :try_start_0
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2239
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Compression;

    check-cast v3, Lcom/jcraft/jsch/Compression;

    iput-object v3, p0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    .line 2240
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Lcom/jcraft/jsch/Compression;->init(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2242
    .end local v0           #c:Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 2243
    .local v1, ee:Ljava/lang/Exception;
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private parseForwarding(Ljava/lang/String;)Lcom/jcraft/jsch/Session$Forwarding;
    .locals 10
    .parameter "conf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    .line 2015
    const-string v7, " "

    invoke-virtual {p1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 2016
    .local v6, tmp:[Ljava/lang/String;
    array-length v7, v6

    const/4 v8, 0x1

    if-le v7, v8, :cond_4

    .line 2017
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 2018
    .local v2, foo:Ljava/util/Vector;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    array-length v7, v6

    if-ge v3, v7, :cond_1

    .line 2019
    aget-object v7, v6, v3

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_0

    .line 2018
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2020
    :cond_0
    aget-object v7, v6, v3

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1

    .line 2022
    :cond_1
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 2023
    .local v5, sb:Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    :goto_2
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v7

    if-ge v3, v7, :cond_3

    .line 2024
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2025
    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v8

    if-ge v7, v8, :cond_2

    .line 2026
    const-string v7, ":"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2023
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2028
    :cond_3
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2031
    .end local v2           #foo:Ljava/util/Vector;
    .end local v3           #i:I
    .end local v5           #sb:Ljava/lang/StringBuffer;
    :cond_4
    move-object v4, p1

    .line 2032
    .local v4, org:Ljava/lang/String;
    new-instance v1, Lcom/jcraft/jsch/Session$Forwarding;

    const/4 v7, 0x0

    invoke-direct {v1, p0, v7}, Lcom/jcraft/jsch/Session$Forwarding;-><init>(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Session$1;)V

    .line 2034
    .local v1, f:Lcom/jcraft/jsch/Session$Forwarding;
    :try_start_0
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v9, :cond_5

    .line 2035
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseForwarding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2054
    :catch_0
    move-exception v0

    .line 2055
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseForwarding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 2036
    .end local v0           #e:Ljava/lang/NumberFormatException;
    :cond_5
    :try_start_1
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->hostport:I

    .line 2037
    const/4 v7, 0x0

    const-string v8, ":"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2038
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v9, :cond_6

    .line 2039
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseForwarding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 2040
    :cond_6
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->host:Ljava/lang/String;

    .line 2041
    const/4 v7, 0x0

    const-string v8, ":"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2042
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    if-eq v7, v9, :cond_a

    .line 2043
    const-string v7, ":"

    invoke-virtual {p1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    .line 2044
    const/4 v7, 0x0

    const-string v8, ":"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2045
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_7

    const-string v7, "*"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    :cond_7
    const-string p1, "0.0.0.0"

    .line 2046
    :cond_8
    const-string v7, "localhost"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    const-string p1, "127.0.0.1"

    .line 2047
    :cond_9
    iput-object p1, v1, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    .line 2057
    :goto_3
    return-object v1

    .line 2050
    :cond_a
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    .line 2051
    const-string v7, "127.0.0.1"

    iput-object v7, v1, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3
.end method

.method private receive_kexinit(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyExchange;
    .locals 10
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 566
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 567
    .local v9, j:I
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v2

    if-eq v9, v2, :cond_1

    .line 568
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 569
    iget v2, p1, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v2, -0x5

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    .line 574
    :goto_0
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v3, p1, Lcom/jcraft/jsch/Buffer;->s:I

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    iget-object v5, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    array-length v5, v5

    invoke-static {v2, v3, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 576
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-nez v2, :cond_0

    .line 577
    invoke-direct {p0}, Lcom/jcraft/jsch/Session;->send_kexinit()V

    .line 580
    :cond_0
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    iget-object v3, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    invoke-static {v2, v3}, Lcom/jcraft/jsch/KeyExchange;->guess([B[B)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    .line 581
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    if-nez v2, :cond_2

    .line 582
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "Algorithm negotiation fail"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 572
    :cond_1
    add-int/lit8 v2, v9, -0x1

    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v3

    sub-int/2addr v2, v3

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    goto :goto_0

    .line 585
    :cond_2
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    const-string v3, "none"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    const-string v3, "none"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 588
    :cond_3
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "NONE Cipher should not be chosen before authentification is successed."

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 591
    :cond_4
    const/4 v1, 0x0

    .line 593
    .local v1, kex:Lcom/jcraft/jsch/KeyExchange;
    :try_start_0
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {p0, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 594
    .local v7, c:Ljava/lang/Class;
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/KeyExchange;

    move-object v0, v2

    check-cast v0, Lcom/jcraft/jsch/KeyExchange;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 600
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->V_S:[B

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    iget-object v5, p0, Lcom/jcraft/jsch/Session;->I_S:[B

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    move-object v2, p0

    invoke-virtual/range {v1 .. v6}, Lcom/jcraft/jsch/KeyExchange;->init(Lcom/jcraft/jsch/Session;[B[B[B[B)V

    .line 601
    return-object v1

    .line 596
    .end local v7           #c:Ljava/lang/Class;
    :catch_0
    move-exception v8

    .line 597
    .local v8, e:Ljava/lang/Exception;
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private receive_newkeys(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/KeyExchange;)V
    .locals 1
    .parameter "buf"
    .parameter "kex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1080
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/Session;->updateKeys(Lcom/jcraft/jsch/KeyExchange;)V

    .line 1081
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 1082
    return-void
.end method

.method private requestPortForwarding()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2746
    const-string v4, "ClearAllForwardings"

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "yes"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2770
    :cond_0
    return-void

    .line 2749
    :cond_1
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v4}, Lcom/jcraft/jsch/JSch;->getConfigRepository()Lcom/jcraft/jsch/ConfigRepository;

    move-result-object v1

    .line 2750
    .local v1, configRepository:Lcom/jcraft/jsch/ConfigRepository;
    if-eqz v1, :cond_0

    .line 2754
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->org_host:Ljava/lang/String;

    invoke-interface {v1, v4}, Lcom/jcraft/jsch/ConfigRepository;->getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;

    move-result-object v0

    .line 2757
    .local v0, config:Lcom/jcraft/jsch/ConfigRepository$Config;
    const-string v4, "LocalForward"

    invoke-interface {v0, v4}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 2758
    .local v3, values:[Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 2759
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v3

    if-ge v2, v4, :cond_2

    .line 2760
    aget-object v4, v3, v2

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;)I

    .line 2759
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2764
    .end local v2           #i:I
    :cond_2
    const-string v4, "RemoteForward"

    invoke-interface {v0, v4}, Lcom/jcraft/jsch/ConfigRepository$Config;->getValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 2765
    if-eqz v3, :cond_0

    .line 2766
    const/4 v2, 0x0

    .restart local v2       #i:I
    :goto_1
    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 2767
    aget-object v4, v3, v2

    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;)I

    .line 2766
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private send_kexinit()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 609
    iget-boolean v7, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v7, :cond_1

    .line 678
    :cond_0
    :goto_0
    return-void

    .line 612
    :cond_1
    const-string v7, "cipher.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 613
    .local v1, cipherc2s:Ljava/lang/String;
    const-string v7, "cipher.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 615
    .local v2, ciphers2c:Ljava/lang/String;
    const-string v7, "CheckCiphers"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/jcraft/jsch/Session;->checkCiphers(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 616
    .local v4, not_available_ciphers:[Ljava/lang/String;
    if-eqz v4, :cond_3

    array-length v7, v4

    if-lez v7, :cond_3

    .line 617
    invoke-static {v1, v4}, Lcom/jcraft/jsch/Util;->diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 618
    invoke-static {v2, v4}, Lcom/jcraft/jsch/Util;->diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 619
    if-eqz v1, :cond_2

    if-nez v2, :cond_3

    .line 620
    :cond_2
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    const-string v8, "There are not any available ciphers."

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 624
    :cond_3
    const-string v7, "kex"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 625
    .local v3, kex:Ljava/lang/String;
    const-string v7, "CheckKexes"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/jcraft/jsch/Session;->checkKexes(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 626
    .local v5, not_available_kexes:[Ljava/lang/String;
    if-eqz v5, :cond_4

    array-length v7, v5

    if-lez v7, :cond_4

    .line 627
    invoke-static {v3, v5}, Lcom/jcraft/jsch/Util;->diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 628
    if-nez v3, :cond_4

    .line 629
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    const-string v8, "There are not any available kexes."

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 633
    :cond_4
    iput-boolean v12, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 634
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 648
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 649
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v6, Lcom/jcraft/jsch/Packet;

    invoke-direct {v6, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 650
    .local v6, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v6}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 651
    const/16 v7, 0x14

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 652
    sget-object v8, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    monitor-enter v8

    .line 653
    :try_start_0
    sget-object v7, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    iget-object v9, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget v10, v0, Lcom/jcraft/jsch/Buffer;->index:I

    const/16 v11, 0x10

    invoke-interface {v7, v9, v10, v11}, Lcom/jcraft/jsch/Random;->fill([BII)V

    const/16 v7, 0x10

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 654
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 655
    invoke-static {v3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 656
    const-string v7, "server_host_key"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 657
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 658
    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 659
    const-string v7, "mac.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 660
    const-string v7, "mac.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 661
    const-string v7, "compression.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 662
    const-string v7, "compression.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 663
    const-string v7, "lang.c2s"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 664
    const-string v7, "lang.s2c"

    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 665
    invoke-virtual {v0, v13}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 666
    invoke-virtual {v0, v13}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 668
    const/4 v7, 0x5

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->setOffSet(I)V

    .line 669
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v7

    new-array v7, v7, [B

    iput-object v7, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    .line 670
    iget-object v7, p0, Lcom/jcraft/jsch/Session;->I_C:[B

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 672
    invoke-virtual {p0, v6}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 674
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    invoke-interface {v7, v12}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 675
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v7

    const-string v8, "SSH_MSG_KEXINIT sent"

    invoke-interface {v7, v12, v8}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 654
    :catchall_0
    move-exception v7

    :try_start_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7
.end method

.method private send_newkeys()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 682
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 683
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 684
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 686
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    invoke-interface {v0, v2}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 687
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    const-string v1, "SSH_MSG_NEWKEYS sent"

    invoke-interface {v0, v2, v1}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 690
    :cond_0
    return-void
.end method

.method private start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V
    .locals 5
    .parameter "buf"
    .parameter "cipher"
    .parameter "mac"
    .parameter "packet_length"
    .parameter "discard"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1046
    const/4 v0, 0x0

    .line 1048
    .local v0, discard_mac:Lcom/jcraft/jsch/MAC;
    invoke-interface {p2}, Lcom/jcraft/jsch/Cipher;->isCBC()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1049
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "Packet corrupt"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1052
    :cond_0
    const/high16 v2, 0x4

    if-eq p4, v2, :cond_1

    if-eqz p3, :cond_1

    .line 1053
    move-object v0, p3

    .line 1056
    :cond_1
    iget v2, p1, Lcom/jcraft/jsch/Buffer;->index:I

    sub-int/2addr p5, v2

    .line 1058
    :goto_0
    if-lez p5, :cond_4

    .line 1059
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1060
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v2, v2

    if-le p5, v2, :cond_3

    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v1, v2

    .line 1061
    .local v1, len:I
    :goto_1
    iget-object v2, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v3, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    invoke-virtual {v2, v3, v4, v1}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    .line 1062
    if-eqz v0, :cond_2

    .line 1063
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    invoke-interface {v0, v2, v4, v1}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 1065
    :cond_2
    sub-int/2addr p5, v1

    .line 1066
    goto :goto_0

    .end local v1           #len:I
    :cond_3
    move v1, p5

    .line 1060
    goto :goto_1

    .line 1068
    :cond_4
    if-eqz v0, :cond_5

    .line 1069
    iget-object v2, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    invoke-interface {v0, v2, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 1072
    :cond_5
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "Packet corrupt"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private updateKeys(Lcom/jcraft/jsch/KeyExchange;)V
    .locals 13
    .parameter "kex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1084
    invoke-virtual {p1}, Lcom/jcraft/jsch/KeyExchange;->getK()[B

    move-result-object v2

    .line 1085
    .local v2, K:[B
    invoke-virtual {p1}, Lcom/jcraft/jsch/KeyExchange;->getH()[B

    move-result-object v3

    .line 1086
    .local v3, H:[B
    invoke-virtual {p1}, Lcom/jcraft/jsch/KeyExchange;->getHash()Lcom/jcraft/jsch/HASH;

    move-result-object v5

    .line 1088
    .local v5, hash:Lcom/jcraft/jsch/HASH;
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    if-nez v0, :cond_0

    .line 1089
    array-length v0, v3

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    .line 1090
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    array-length v1, v3

    invoke-static {v3, v4, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1102
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1103
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1104
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1105
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v1, 0x41

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1106
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1107
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1108
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->IVc2s:[B

    .line 1110
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    array-length v1, v1

    sub-int/2addr v0, v1

    add-int/lit8 v11, v0, -0x1

    .line 1112
    .local v11, j:I
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1113
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1114
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->IVs2c:[B

    .line 1116
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1117
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1118
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    .line 1120
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1121
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1122
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    .line 1124
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1125
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1126
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    .line 1128
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    aget-byte v1, v0, v11

    add-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    aput-byte v1, v0, v11

    .line 1129
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, v1, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v4, v1}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1130
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    .line 1136
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v12, v0, v1

    .line 1137
    .local v12, method:Ljava/lang/String;
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1138
    .local v8, c:Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    .line 1139
    :goto_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v1, v1

    if-le v0, v1, :cond_1

    .line 1140
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1141
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1142
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1143
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1144
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v1, v4}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1145
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v10

    .line 1146
    .local v10, foo:[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v0, v0

    array-length v1, v10

    add-int/2addr v0, v1

    new-array v7, v0, [B

    .line 1147
    .local v7, bar:[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    const/4 v1, 0x0

    const/4 v4, 0x0

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v6, v6

    invoke-static {v0, v1, v7, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1148
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    array-length v1, v1

    array-length v4, v10

    invoke-static {v10, v0, v7, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1149
    iput-object v7, p0, Lcom/jcraft/jsch/Session;->Es2c:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1193
    .end local v7           #bar:[B
    .end local v8           #c:Ljava/lang/Class;
    .end local v10           #foo:[B
    .end local v12           #method:Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 1194
    .local v9, e:Ljava/lang/Exception;
    instance-of v0, v9, Lcom/jcraft/jsch/JSchException;

    if-eqz v0, :cond_3

    .line 1195
    throw v9

    .line 1151
    .end local v9           #e:Ljava/lang/Exception;
    .restart local v8       #c:Ljava/lang/Class;
    .restart local v12       #method:Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    const/4 v1, 0x1

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->Es2c:[B

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->IVs2c:[B

    invoke-interface {v0, v1, v4, v6}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 1152
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    .line 1154
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v12, v0, v1

    .line 1155
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1156
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/MAC;

    check-cast v0, Lcom/jcraft/jsch/MAC;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    .line 1157
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/Session;->expandKey(Lcom/jcraft/jsch/Buffer;[B[B[BLcom/jcraft/jsch/HASH;I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    .line 1158
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->MACs2c:[B

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 1160
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac_result1:[B

    .line 1161
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    .line 1163
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v12, v0, v1

    .line 1164
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1165
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    .line 1166
    :goto_1
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v1, v1

    if-le v0, v1, :cond_2

    .line 1167
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1168
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 1169
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1170
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putByte([B)V

    .line 1171
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v5, v0, v1, v4}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 1172
    invoke-interface {v5}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v10

    .line 1173
    .restart local v10       #foo:[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v0, v0

    array-length v1, v10

    add-int/2addr v0, v1

    new-array v7, v0, [B

    .line 1174
    .restart local v7       #bar:[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    const/4 v1, 0x0

    const/4 v4, 0x0

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v6, v6

    invoke-static {v0, v1, v7, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1175
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    array-length v1, v1

    array-length v4, v10

    invoke-static {v10, v0, v7, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1176
    iput-object v7, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    goto :goto_1

    .line 1178
    .end local v7           #bar:[B
    .end local v10           #foo:[B
    :cond_2
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->Ec2s:[B

    iget-object v6, p0, Lcom/jcraft/jsch/Session;->IVc2s:[B

    invoke-interface {v0, v1, v4, v6}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 1179
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    .line 1181
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x4

    aget-object v12, v0, v1

    .line 1182
    invoke-virtual {p0, v12}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 1183
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jcraft/jsch/MAC;

    check-cast v0, Lcom/jcraft/jsch/MAC;

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    .line 1184
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v4, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v0}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/Session;->expandKey(Lcom/jcraft/jsch/Buffer;[B[B[BLcom/jcraft/jsch/HASH;I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    .line 1185
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget-object v1, p0, Lcom/jcraft/jsch/Session;->MACc2s:[B

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 1187
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v12, v0, v1

    .line 1188
    invoke-direct {p0, v12}, Lcom/jcraft/jsch/Session;->initDeflater(Ljava/lang/String;)V

    .line 1190
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v12, v0, v1

    .line 1191
    invoke-direct {p0, v12}, Lcom/jcraft/jsch/Session;->initInflater(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1199
    return-void

    .line 1196
    .end local v8           #c:Ljava/lang/Class;
    .end local v12           #method:Ljava/lang/String;
    .restart local v9       #e:Ljava/lang/Exception;
    :cond_3
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v9}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method addChannel(Lcom/jcraft/jsch/Channel;)V
    .locals 0
    .parameter "channel"

    .prologue
    .line 2251
    invoke-virtual {p1, p0}, Lcom/jcraft/jsch/Channel;->setSession(Lcom/jcraft/jsch/Session;)V

    .line 2252
    return-void
.end method

.method public connect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 183
    iget v0, p0, Lcom/jcraft/jsch/Session;->timeout:I

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Session;->connect(I)V

    .line 184
    return-void
.end method

.method public connect(I)V
    .locals 35
    .parameter "connectTimeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 187
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v30, v0

    if-eqz v30, :cond_0

    .line 188
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    const-string v31, "session is already connected"

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 191
    :cond_0
    new-instance v30, Lcom/jcraft/jsch/IO;

    invoke-direct/range {v30 .. v30}, Lcom/jcraft/jsch/IO;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    .line 192
    sget-object v30, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    if-nez v30, :cond_1

    .line 194
    :try_start_0
    const-string v30, "random"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 195
    .local v8, c:Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lcom/jcraft/jsch/Random;

    check-cast v30, Lcom/jcraft/jsch/Random;

    sput-object v30, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 201
    .end local v8           #c:Ljava/lang/Class;
    :cond_1
    sget-object v30, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    invoke-static/range {v30 .. v30}, Lcom/jcraft/jsch/Packet;->setRandom(Lcom/jcraft/jsch/Random;)V

    .line 203
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_2

    .line 204
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Connecting to "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, " port "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 211
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v30, v0

    if-nez v30, :cond_a

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v30, v0

    if-nez v30, :cond_9

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v31, v0

    move-object/from16 v0, v30

    move/from16 v1, v31

    move/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/Util;->createSocket(Ljava/lang/String;II)Ljava/net/Socket;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v15

    .line 217
    .local v15, in:Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v22

    .line 225
    .local v22, out:Ljava/io/OutputStream;
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v30, v0

    const/16 v31, 0x1

    invoke-virtual/range {v30 .. v31}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 238
    .end local v15           #in:Ljava/io/InputStream;
    .end local v22           #out:Ljava/io/OutputStream;
    :goto_1
    if-lez p1, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v30, v0

    if-eqz v30, :cond_3

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 242
    :cond_3
    const/16 v30, 0x1

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 244
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_4

    .line 245
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    const-string v32, "Connection established"

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 249
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/JSch;->addSession(Lcom/jcraft/jsch/Session;)V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    add-int/lit8 v30, v30, 0x1

    move/from16 v0, v30

    new-array v13, v0, [B

    .line 254
    .local v13, foo:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v30, v0

    const/16 v31, 0x0

    const/16 v32, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    array-length v0, v0

    move/from16 v33, v0

    move-object/from16 v0, v30

    move/from16 v1, v31

    move/from16 v2, v32

    move/from16 v3, v33

    invoke-static {v0, v1, v13, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 255
    array-length v0, v13

    move/from16 v30, v0

    add-int/lit8 v30, v30, -0x1

    const/16 v31, 0xa

    aput-byte v31, v13, v30

    .line 256
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    array-length v0, v13

    move/from16 v32, v0

    move-object/from16 v0, v30

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v13, v1, v2}, Lcom/jcraft/jsch/IO;->put([BII)V

    .line 260
    :cond_5
    const/4 v14, 0x0

    .line 261
    .local v14, i:I
    const/16 v16, 0x0

    .line 262
    .local v16, j:I
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v14, v0, :cond_7

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jcraft/jsch/IO;->getByte()I

    move-result v16

    .line 264
    if-gez v16, :cond_b

    .line 268
    :cond_7
    :goto_2
    if-gez v16, :cond_c

    .line 269
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    const-string v31, "connection is closed by foreign host"

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 538
    .end local v13           #foo:[B
    .end local v14           #i:I
    .end local v16           #j:I
    :catch_0
    move-exception v11

    .line 539
    .local v11, e:Ljava/lang/Exception;
    const/16 v30, 0x0

    :try_start_2
    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 540
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v30, v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v30, :cond_8

    .line 542
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 543
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    const/16 v31, 0x1

    invoke-virtual/range {v30 .. v31}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 544
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    const/16 v31, 0x3

    invoke-virtual/range {v30 .. v31}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 545
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 546
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    const-string v31, "en"

    invoke-static/range {v31 .. v31}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 547
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 548
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->disconnect()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_b

    .line 553
    :cond_8
    :goto_3
    const/16 v30, 0x0

    :try_start_4
    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 555
    instance-of v0, v11, Ljava/lang/RuntimeException;

    move/from16 v30, v0

    if-eqz v30, :cond_2d

    check-cast v11, Ljava/lang/RuntimeException;

    .end local v11           #e:Ljava/lang/Exception;
    throw v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 560
    :catchall_0
    move-exception v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->password:[B

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 561
    const/16 v31, 0x0

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->password:[B

    throw v30

    .line 197
    :catch_1
    move-exception v11

    .line 198
    .restart local v11       #e:Ljava/lang/Exception;
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-direct {v0, v1, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v30

    .line 220
    .end local v11           #e:Ljava/lang/Exception;
    :cond_9
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v32, v0

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/SocketFactory;->getInputStream(Ljava/net/Socket;)Ljava/io/InputStream;

    move-result-object v15

    .line 222
    .restart local v15       #in:Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v31, v0

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/SocketFactory;->getOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;

    move-result-object v22

    .restart local v22       #out:Ljava/io/OutputStream;
    goto/16 :goto_0

    .line 230
    .end local v15           #in:Ljava/io/InputStream;
    .end local v22           #out:Ljava/io/OutputStream;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v31, v0

    monitor-enter v31
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 231
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v34, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move/from16 v3, v34

    move/from16 v4, p1

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/jcraft/jsch/Proxy;->connect(Lcom/jcraft/jsch/SocketFactory;Ljava/lang/String;II)V

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v32, v0

    invoke-interface/range {v32 .. v32}, Lcom/jcraft/jsch/Proxy;->getInputStream()Ljava/io/InputStream;

    move-result-object v32

    move-object/from16 v0, v30

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v32, v0

    invoke-interface/range {v32 .. v32}, Lcom/jcraft/jsch/Proxy;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v32

    move-object/from16 v0, v30

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Lcom/jcraft/jsch/Proxy;->getSocket()Ljava/net/Socket;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 235
    monitor-exit v31

    goto/16 :goto_1

    :catchall_1
    move-exception v30

    monitor-exit v31
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v30

    .line 265
    .restart local v13       #foo:[B
    .restart local v14       #i:I
    .restart local v16       #j:I
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    move/from16 v0, v16

    int-to-byte v0, v0

    move/from16 v31, v0

    aput-byte v31, v30, v14

    add-int/lit8 v14, v14, 0x1

    .line 266
    const/16 v30, 0xa

    move/from16 v0, v16

    move/from16 v1, v30

    if-ne v0, v1, :cond_6

    goto/16 :goto_2

    .line 272
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    add-int/lit8 v31, v14, -0x1

    aget-byte v30, v30, v31

    const/16 v31, 0xa

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_d

    .line 273
    add-int/lit8 v14, v14, -0x1

    .line 274
    if-lez v14, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    add-int/lit8 v31, v14, -0x1

    aget-byte v30, v30, v31

    const/16 v31, 0xd

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_d

    .line 275
    add-int/lit8 v14, v14, -0x1

    .line 279
    :cond_d
    const/16 v30, 0x3

    move/from16 v0, v30

    if-le v14, v0, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-eq v14, v0, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-byte v30, v30, v31

    const/16 v31, 0x53

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x1

    aget-byte v30, v30, v31

    const/16 v31, 0x53

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x2

    aget-byte v30, v30, v31

    const/16 v31, 0x48

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x3

    aget-byte v30, v30, v31

    const/16 v31, 0x2d

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_5

    .line 288
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-eq v14, v0, :cond_f

    const/16 v30, 0x7

    move/from16 v0, v30

    if-lt v14, v0, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x4

    aget-byte v30, v30, v31

    const/16 v31, 0x31

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x6

    aget-byte v30, v30, v31

    const/16 v31, 0x39

    move/from16 v0, v30

    move/from16 v1, v31

    if-eq v0, v1, :cond_10

    .line 292
    :cond_f
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    const-string v31, "invalid server\'s version string"

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 297
    :cond_10
    new-array v0, v14, [B

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->V_S:[B

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_S:[B

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, v30

    move/from16 v1, v31

    move-object/from16 v2, v32

    move/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 300
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_11

    .line 301
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Remote version string: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_S:[B

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 303
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Local version string: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->V_C:[B

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 307
    :cond_11
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->send_kexinit()V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 310
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v30

    const/16 v31, 0x14

    move/from16 v0, v30

    move/from16 v1, v31

    if-eq v0, v1, :cond_12

    .line 311
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 312
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "invalid protocol: "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 315
    :cond_12
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_13

    .line 316
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    const-string v32, "SSH_MSG_KEXINIT received"

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 320
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Session;->receive_kexinit(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyExchange;

    move-result-object v18

    .line 323
    .local v18, kex:Lcom/jcraft/jsch/KeyExchange;
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 324
    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/KeyExchange;->getState()I

    move-result v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v31

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_15

    .line 325
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v30

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/KeyExchange;->next(Lcom/jcraft/jsch/Buffer;)Z

    move-result v23

    .line 327
    .local v23, result:Z
    if-nez v23, :cond_16

    .line 329
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 330
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "verify: "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 334
    .end local v23           #result:Z
    :cond_15
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 335
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "invalid protocol(kex): "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 337
    .restart local v23       #result:Z
    :cond_16
    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/KeyExchange;->getState()I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    move-result v30

    if-nez v30, :cond_14

    .line 342
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move/from16 v2, v31

    move-object/from16 v3, v18

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/Session;->checkHost(Ljava/lang/String;ILcom/jcraft/jsch/KeyExchange;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 348
    :try_start_9
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->send_newkeys()V

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    .line 353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v30

    const/16 v31, 0x15

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_1b

    .line 355
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_17

    .line 356
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    const-string v32, "SSH_MSG_NEWKEYS received"

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 360
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/Session;->receive_newkeys(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/KeyExchange;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 368
    :try_start_a
    const-string v30, "MaxAuthTries"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 369
    .local v24, s:Ljava/lang/String;
    if-eqz v24, :cond_18

    .line 370
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v30

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/Session;->max_auth_tries:I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    .line 377
    :cond_18
    const/4 v6, 0x0

    .line 378
    .local v6, auth:Z
    const/4 v7, 0x0

    .line 380
    .local v7, auth_cancel:Z
    const/16 v29, 0x0

    .line 382
    .local v29, ua:Lcom/jcraft/jsch/UserAuth;
    :try_start_b
    const-string v30, "userauth.none"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 383
    .restart local v8       #c:Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v0, v30

    check-cast v0, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v29, v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    .line 389
    :try_start_c
    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    move-result v6

    .line 391
    const-string v30, "PreferredAuthentications"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 393
    .local v10, cmethods:Ljava/lang/String;
    const-string v30, ","

    move-object/from16 v0, v30

    invoke-static {v10, v0}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 395
    .local v9, cmethoda:[Ljava/lang/String;
    const/16 v26, 0x0

    .line 396
    .local v26, smethods:Ljava/lang/String;
    if-nez v6, :cond_19

    .line 397
    move-object/from16 v0, v29

    check-cast v0, Lcom/jcraft/jsch/UserAuthNone;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jcraft/jsch/UserAuthNone;->getMethods()Ljava/lang/String;

    move-result-object v26

    .line 398
    if-eqz v26, :cond_1c

    .line 399
    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v26

    .line 408
    :cond_19
    :goto_4
    const-string v30, ","

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v25

    .line 410
    .local v25, smethoda:[Ljava/lang/String;
    const/16 v20, 0x0

    .local v20, methodi:I
    move/from16 v21, v20

    .line 416
    .end local v20           #methodi:I
    .local v21, methodi:I
    :goto_5
    if-nez v6, :cond_2f

    if-eqz v9, :cond_2f

    array-length v0, v9

    move/from16 v30, v0

    move/from16 v0, v21

    move/from16 v1, v30

    if-ge v0, v1, :cond_2f

    .line 418
    add-int/lit8 v20, v21, 0x1

    .end local v21           #methodi:I
    .restart local v20       #methodi:I
    aget-object v19, v9, v21

    .line 419
    .local v19, method:Ljava/lang/String;
    const/4 v5, 0x0

    .line 420
    .local v5, acceptable:Z
    const/16 v17, 0x0

    .local v17, k:I
    :goto_6
    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v17

    move/from16 v1, v30

    if-ge v0, v1, :cond_1a

    .line 421
    aget-object v30, v25, v17

    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_1d

    .line 422
    const/4 v5, 0x1

    .line 426
    :cond_1a
    if-nez v5, :cond_1e

    move/from16 v21, v20

    .line 427
    .end local v20           #methodi:I
    .restart local v21       #methodi:I
    goto :goto_5

    .line 343
    .end local v5           #acceptable:Z
    .end local v6           #auth:Z
    .end local v7           #auth_cancel:Z
    .end local v8           #c:Ljava/lang/Class;
    .end local v9           #cmethoda:[Ljava/lang/String;
    .end local v10           #cmethods:Ljava/lang/String;
    .end local v17           #k:I
    .end local v19           #method:Ljava/lang/String;
    .end local v21           #methodi:I
    .end local v24           #s:Ljava/lang/String;
    .end local v25           #smethoda:[Ljava/lang/String;
    .end local v26           #smethods:Ljava/lang/String;
    .end local v29           #ua:Lcom/jcraft/jsch/UserAuth;
    :catch_2
    move-exception v12

    .line 344
    .local v12, ee:Lcom/jcraft/jsch/JSchException;
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 345
    throw v12

    .line 363
    .end local v12           #ee:Lcom/jcraft/jsch/JSchException;
    :cond_1b
    const/16 v30, 0x0

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 364
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "invalid protocol(newkyes): "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 373
    :catch_3
    move-exception v11

    .line 374
    .local v11, e:Ljava/lang/NumberFormatException;
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "MaxAuthTries: "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "MaxAuthTries"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-direct {v0, v1, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v30

    .line 385
    .end local v11           #e:Ljava/lang/NumberFormatException;
    .restart local v6       #auth:Z
    .restart local v7       #auth_cancel:Z
    .restart local v24       #s:Ljava/lang/String;
    .restart local v29       #ua:Lcom/jcraft/jsch/UserAuth;
    :catch_4
    move-exception v11

    .line 386
    .local v11, e:Ljava/lang/Exception;
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-direct {v0, v1, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v30

    .line 404
    .end local v11           #e:Ljava/lang/Exception;
    .restart local v8       #c:Ljava/lang/Class;
    .restart local v9       #cmethoda:[Ljava/lang/String;
    .restart local v10       #cmethods:Ljava/lang/String;
    .restart local v26       #smethods:Ljava/lang/String;
    :cond_1c
    move-object/from16 v26, v10

    goto/16 :goto_4

    .line 420
    .restart local v5       #acceptable:Z
    .restart local v17       #k:I
    .restart local v19       #method:Ljava/lang/String;
    .restart local v20       #methodi:I
    .restart local v25       #smethoda:[Ljava/lang/String;
    :cond_1d
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_6

    .line 432
    :cond_1e
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_21

    .line 433
    const-string v27, "Authentications that can continue: "

    .line 434
    .local v27, str:Ljava/lang/String;
    add-int/lit8 v17, v20, -0x1

    :goto_7
    array-length v0, v9

    move/from16 v30, v0

    move/from16 v0, v17

    move/from16 v1, v30

    if-ge v0, v1, :cond_20

    .line 435
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    aget-object v31, v9, v17

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 436
    add-int/lit8 v30, v17, 0x1

    array-length v0, v9

    move/from16 v31, v0

    move/from16 v0, v30

    move/from16 v1, v31

    if-ge v0, v1, :cond_1f

    .line 437
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, ","

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 434
    :cond_1f
    add-int/lit8 v17, v17, 0x1

    goto :goto_7

    .line 439
    :cond_20
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    move-object/from16 v0, v30

    move/from16 v1, v31

    move-object/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 441
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Next authentication method: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    .line 445
    .end local v27           #str:Ljava/lang/String;
    :cond_21
    const/16 v29, 0x0

    .line 447
    const/4 v8, 0x0

    .line 448
    :try_start_d
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "userauth."

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    if-eqz v30, :cond_22

    .line 449
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "userauth."

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 450
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v0, v30

    check-cast v0, Lcom/jcraft/jsch/UserAuth;

    move-object/from16 v29, v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_5

    .line 460
    :cond_22
    :goto_8
    if-eqz v29, :cond_23

    .line 461
    const/4 v7, 0x0

    .line 463
    :try_start_e
    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    move-result v6

    .line 464
    if-eqz v6, :cond_23

    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_23

    .line 466
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Authentication succeeded ("

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, ")."

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0
    .catch Lcom/jcraft/jsch/JSchAuthCancelException; {:try_start_e .. :try_end_e} :catch_6
    .catch Lcom/jcraft/jsch/JSchPartialAuthException; {:try_start_e .. :try_end_e} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_8
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_e .. :try_end_e} :catch_9
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_a

    :cond_23
    :goto_9
    move/from16 v21, v20

    .line 499
    .end local v20           #methodi:I
    .restart local v21       #methodi:I
    goto/16 :goto_5

    .line 453
    .end local v21           #methodi:I
    .restart local v20       #methodi:I
    :catch_5
    move-exception v11

    .line 454
    .restart local v11       #e:Ljava/lang/Exception;
    :try_start_f
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x2

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_22

    .line 455
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x2

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "failed to load "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, " method"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto :goto_8

    .line 470
    .end local v11           #e:Ljava/lang/Exception;
    :catch_6
    move-exception v12

    .line 471
    .local v12, ee:Lcom/jcraft/jsch/JSchAuthCancelException;
    const/4 v7, 0x1

    .line 497
    goto :goto_9

    .line 473
    .end local v12           #ee:Lcom/jcraft/jsch/JSchAuthCancelException;
    :catch_7
    move-exception v12

    .line 474
    .local v12, ee:Lcom/jcraft/jsch/JSchPartialAuthException;
    move-object/from16 v28, v26

    .line 475
    .local v28, tmp:Ljava/lang/String;
    invoke-virtual {v12}, Lcom/jcraft/jsch/JSchPartialAuthException;->getMethods()Ljava/lang/String;

    move-result-object v26

    .line 476
    const-string v30, ","

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v25

    .line 477
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_24

    .line 478
    const/16 v20, 0x0

    .line 481
    :cond_24
    const/4 v7, 0x0

    move/from16 v21, v20

    .line 482
    .end local v20           #methodi:I
    .restart local v21       #methodi:I
    goto/16 :goto_5

    .line 484
    .end local v12           #ee:Lcom/jcraft/jsch/JSchPartialAuthException;
    .end local v21           #methodi:I
    .end local v28           #tmp:Ljava/lang/String;
    .restart local v20       #methodi:I
    :catch_8
    move-exception v12

    .line 485
    .local v12, ee:Ljava/lang/RuntimeException;
    throw v12

    .line 487
    .end local v12           #ee:Ljava/lang/RuntimeException;
    :catch_9
    move-exception v12

    .line 488
    .local v12, ee:Lcom/jcraft/jsch/JSchException;
    throw v12

    .line 490
    .end local v12           #ee:Lcom/jcraft/jsch/JSchException;
    :catch_a
    move-exception v12

    .line 492
    .local v12, ee:Ljava/lang/Exception;
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x2

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_25

    .line 493
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x2

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "an exception during authentication\n"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 503
    .end local v5           #acceptable:Z
    .end local v12           #ee:Ljava/lang/Exception;
    .end local v17           #k:I
    .end local v19           #method:Ljava/lang/String;
    :cond_25
    :goto_a
    if-nez v6, :cond_28

    .line 504
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    move/from16 v31, v0

    move/from16 v0, v30

    move/from16 v1, v31

    if-lt v0, v1, :cond_26

    .line 505
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v30

    if-eqz v30, :cond_26

    .line 506
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v30

    const/16 v31, 0x1

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Login trials exceeds "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    move/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 510
    :cond_26
    if-eqz v7, :cond_27

    .line 511
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    const-string v31, "Auth cancel"

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 512
    :cond_27
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    const-string v31, "Auth fail"

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 515
    :cond_28
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v30, v0

    if-eqz v30, :cond_2a

    if-gtz p1, :cond_29

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->timeout:I

    move/from16 v30, v0

    if-lez v30, :cond_2a

    .line 516
    :cond_29
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->timeout:I

    move/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 519
    :cond_2a
    const/16 v30, 0x1

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isAuthed:Z

    .line 521
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    move-object/from16 v31, v0

    monitor-enter v31
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    .line 522
    :try_start_10
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v30, v0

    if-eqz v30, :cond_2c

    .line 523
    new-instance v30, Ljava/lang/Thread;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    move-object/from16 v30, v0

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Connect thread "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, " session"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v30

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 525
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v30, v0

    if-eqz v30, :cond_2b

    .line 526
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v32, v0

    move-object/from16 v0, v30

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 528
    :cond_2b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Thread;->start()V

    .line 530
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->requestPortForwarding()V

    .line 536
    :cond_2c
    monitor-exit v31
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 560
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->password:[B

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 561
    const/16 v30, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->password:[B

    .line 563
    return-void

    .line 536
    :catchall_2
    move-exception v30

    :try_start_11
    monitor-exit v31
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    :try_start_12
    throw v30
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_0

    .line 556
    .end local v6           #auth:Z
    .end local v7           #auth_cancel:Z
    .end local v8           #c:Ljava/lang/Class;
    .end local v9           #cmethoda:[Ljava/lang/String;
    .end local v10           #cmethods:Ljava/lang/String;
    .end local v13           #foo:[B
    .end local v14           #i:I
    .end local v16           #j:I
    .end local v18           #kex:Lcom/jcraft/jsch/KeyExchange;
    .end local v20           #methodi:I
    .end local v23           #result:Z
    .end local v24           #s:Ljava/lang/String;
    .end local v25           #smethoda:[Ljava/lang/String;
    .end local v26           #smethods:Ljava/lang/String;
    .end local v29           #ua:Lcom/jcraft/jsch/UserAuth;
    .restart local v11       #e:Ljava/lang/Exception;
    :cond_2d
    :try_start_13
    instance-of v0, v11, Lcom/jcraft/jsch/JSchException;

    move/from16 v30, v0

    if-eqz v30, :cond_2e

    check-cast v11, Lcom/jcraft/jsch/JSchException;

    .end local v11           #e:Ljava/lang/Exception;
    throw v11

    .line 557
    .restart local v11       #e:Ljava/lang/Exception;
    :cond_2e
    new-instance v30, Lcom/jcraft/jsch/JSchException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "Session.connect: "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v30
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 550
    :catch_b
    move-exception v30

    goto/16 :goto_3

    .end local v11           #e:Ljava/lang/Exception;
    .restart local v6       #auth:Z
    .restart local v7       #auth_cancel:Z
    .restart local v8       #c:Ljava/lang/Class;
    .restart local v9       #cmethoda:[Ljava/lang/String;
    .restart local v10       #cmethods:Ljava/lang/String;
    .restart local v13       #foo:[B
    .restart local v14       #i:I
    .restart local v16       #j:I
    .restart local v18       #kex:Lcom/jcraft/jsch/KeyExchange;
    .restart local v21       #methodi:I
    .restart local v23       #result:Z
    .restart local v24       #s:Ljava/lang/String;
    .restart local v25       #smethoda:[Ljava/lang/String;
    .restart local v26       #smethods:Ljava/lang/String;
    .restart local v29       #ua:Lcom/jcraft/jsch/UserAuth;
    :cond_2f
    move/from16 v20, v21

    .end local v21           #methodi:I
    .restart local v20       #methodi:I
    goto/16 :goto_a
.end method

.method public delPortForwardingL(I)V
    .locals 1
    .parameter "lport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1843
    const-string v0, "127.0.0.1"

    invoke-virtual {p0, v0, p1}, Lcom/jcraft/jsch/Session;->delPortForwardingL(Ljava/lang/String;I)V

    .line 1844
    return-void
.end method

.method public delPortForwardingL(Ljava/lang/String;I)V
    .locals 0
    .parameter "bind_address"
    .parameter "lport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1854
    invoke-static {p0, p1, p2}, Lcom/jcraft/jsch/PortWatcher;->delPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)V

    .line 1855
    return-void
.end method

.method public delPortForwardingR(I)V
    .locals 1
    .parameter "rport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2186
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/jcraft/jsch/Session;->delPortForwardingR(Ljava/lang/String;I)V

    .line 2187
    return-void
.end method

.method public delPortForwardingR(Ljava/lang/String;I)V
    .locals 0
    .parameter "bind_address"
    .parameter "rport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2198
    invoke-static {p0, p1, p2}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->delPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)V

    .line 2199
    return-void
.end method

.method public disconnect()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1695
    iget-boolean v0, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    if-nez v0, :cond_0

    .line 1758
    :goto_0
    return-void

    .line 1698
    :cond_0
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    invoke-interface {v0, v4}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1699
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Disconnecting from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " port "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/jcraft/jsch/Session;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 1713
    :cond_1
    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->disconnect(Lcom/jcraft/jsch/Session;)V

    .line 1715
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 1717
    invoke-static {p0}, Lcom/jcraft/jsch/PortWatcher;->delPort(Lcom/jcraft/jsch/Session;)V

    .line 1718
    invoke-static {p0}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->delPort(Lcom/jcraft/jsch/Session;)V

    .line 1719
    invoke-static {p0}, Lcom/jcraft/jsch/ChannelX11;->removeFakedCookie(Lcom/jcraft/jsch/Session;)V

    .line 1721
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 1722
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    if-eqz v0, :cond_2

    .line 1723
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 1724
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 1725
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->connectThread:Ljava/lang/Thread;

    .line 1727
    :cond_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1728
    iput-object v3, p0, Lcom/jcraft/jsch/Session;->thread:Ljava/lang/Runnable;

    .line 1730
    :try_start_1
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    if-eqz v0, :cond_5

    .line 1731
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1732
    :cond_3
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1733
    :cond_4
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    iget-object v0, v0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1735
    :cond_5
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    if-nez v0, :cond_7

    .line 1736
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_6

    .line 1737
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1749
    :cond_6
    :goto_1
    iput-object v3, p0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    .line 1750
    iput-object v3, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    .line 1755
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v0, p0}, Lcom/jcraft/jsch/JSch;->removeSession(Lcom/jcraft/jsch/Session;)Z

    goto/16 :goto_0

    .line 1727
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 1740
    :cond_7
    :try_start_3
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    monitor-enter v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1741
    :try_start_4
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    invoke-interface {v0}, Lcom/jcraft/jsch/Proxy;->close()V

    .line 1742
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1743
    const/4 v0, 0x0

    :try_start_5
    iput-object v0, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    .line 1746
    :catch_0
    move-exception v0

    goto :goto_1

    .line 1742
    :catchall_1
    move-exception v0

    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
.end method

.method public encode(Lcom/jcraft/jsch/Packet;)V
    .locals 8
    .parameter "packet"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 867
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    if-eqz v0, :cond_0

    .line 868
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, v3, Lcom/jcraft/jsch/Buffer;->index:I

    aput v3, v0, v2

    .line 869
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v4, v4, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v5, 0x5

    iget-object v7, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    invoke-interface {v3, v4, v5, v7}, Lcom/jcraft/jsch/Compression;->compress([BI[I)[B

    move-result-object v3

    iput-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 871
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/Session;->compress_len:[I

    aget v3, v3, v2

    iput v3, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 873
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v0, :cond_4

    .line 875
    iget v0, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Packet;->padding(I)V

    .line 876
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x4

    aget-byte v6, v0, v3

    .line 877
    .local v6, pad:I
    sget-object v3, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    monitor-enter v3

    .line 878
    :try_start_0
    sget-object v0, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v4, v4, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v5, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v5, v5, Lcom/jcraft/jsch/Buffer;->index:I

    sub-int/2addr v5, v6

    invoke-interface {v0, v4, v5, v6}, Lcom/jcraft/jsch/Random;->fill([BII)V

    .line 879
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 885
    .end local v6           #pad:I
    :goto_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    if-eqz v0, :cond_1

    .line 886
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget v3, p0, Lcom/jcraft/jsch/Session;->seqo:I

    invoke-interface {v0, v3}, Lcom/jcraft/jsch/MAC;->update(I)V

    .line 887
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v0, v3, v2, v4}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 888
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    iget-object v4, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v4, v4, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v0, v3, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 890
    :cond_1
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v0, :cond_2

    .line 891
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 892
    .local v1, buf:[B
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, v3, Lcom/jcraft/jsch/Buffer;->index:I

    move-object v4, v1

    move v5, v2

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V

    .line 894
    .end local v1           #buf:[B
    :cond_2
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    if-eqz v0, :cond_3

    .line 895
    iget-object v0, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v2, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v2}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 897
    :cond_3
    return-void

    .line 879
    .restart local v6       #pad:I
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 882
    .end local v6           #pad:I
    :cond_4
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Packet;->padding(I)V

    goto :goto_0
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2338
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConfig(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"

    .prologue
    .line 2301
    const/4 v0, 0x0

    .line 2302
    .local v0, foo:Ljava/lang/Object;
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    if-eqz v1, :cond_0

    .line 2303
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2304
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    .line 2308
    .end local v0           #foo:Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 2306
    :cond_0
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-static {p1}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2307
    .local v0, foo:Ljava/lang/String;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_1

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 2308
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2376
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getHostKey()Lcom/jcraft/jsch/HostKey;
    .locals 1

    .prologue
    .line 2375
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostkey:Lcom/jcraft/jsch/HostKey;

    return-object v0
.end method

.method public getHostKeyAlias()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2383
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    return-object v0
.end method

.method public getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;
    .locals 1

    .prologue
    .line 2563
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    if-nez v0, :cond_0

    .line 2564
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v0}, Lcom/jcraft/jsch/JSch;->getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;

    move-result-object v0

    .line 2565
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    goto :goto_0
.end method

.method getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;
    .locals 1

    .prologue
    .line 2539
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    if-nez v0, :cond_0

    .line 2540
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v0}, Lcom/jcraft/jsch/JSch;->getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v0

    .line 2541
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    goto :goto_0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 2378
    iget v0, p0, Lcom/jcraft/jsch/Session;->port:I

    return v0
.end method

.method public getPortForwardingL()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1863
    invoke-static {p0}, Lcom/jcraft/jsch/PortWatcher;->getPortForwarding(Lcom/jcraft/jsch/Session;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPortForwardingR()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1999
    invoke-static {p0}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->getPortForwarding(Lcom/jcraft/jsch/Session;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServerAliveCountMax()I
    .locals 1

    .prologue
    .line 2427
    iget v0, p0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    return v0
.end method

.method public getServerAliveInterval()I
    .locals 1

    .prologue
    .line 2405
    iget v0, p0, Lcom/jcraft/jsch/Session;->serverAliveInterval:I

    return v0
.end method

.method public getServerVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2335
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->V_S:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getSessionId()[B
    .locals 1

    .prologue
    .line 1076
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->session_id:[B

    return-object v0
.end method

.method public getStreamForwarder(Ljava/lang/String;I)Lcom/jcraft/jsch/Channel;
    .locals 1
    .parameter "host"
    .parameter "port"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2108
    new-instance v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;-><init>()V

    .line 2109
    .local v0, channel:Lcom/jcraft/jsch/ChannelDirectTCPIP;
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->init()V

    .line 2110
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Session;->addChannel(Lcom/jcraft/jsch/Channel;)V

    .line 2111
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setHost(Ljava/lang/String;)V

    .line 2112
    invoke-virtual {v0, p2}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setPort(I)V

    .line 2113
    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 2315
    iget v0, p0, Lcom/jcraft/jsch/Session;->timeout:I

    return v0
.end method

.method public getUserInfo()Lcom/jcraft/jsch/UserInfo;
    .locals 1

    .prologue
    .line 2259
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2377
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 2314
    iget-boolean v0, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    return v0
.end method

.method public noMoreSessionChannels()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2365
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 2366
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2367
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2368
    const/16 v2, 0x50

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2369
    sget-object v2, Lcom/jcraft/jsch/Session;->nomoresessions:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2370
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2371
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 2372
    return-void
.end method

.method public openChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;
    .locals 4
    .parameter "type"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 842
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->isConnected:Z

    if-nez v2, :cond_0

    .line 843
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "session is down"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 846
    :cond_0
    :try_start_0
    invoke-static {p1}, Lcom/jcraft/jsch/Channel;->getChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v1

    .line 847
    .local v1, channel:Lcom/jcraft/jsch/Channel;
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->addChannel(Lcom/jcraft/jsch/Channel;)V

    .line 848
    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel;->init()V

    .line 849
    instance-of v2, v1, Lcom/jcraft/jsch/ChannelSession;

    if-eqz v2, :cond_1

    .line 850
    move-object v0, v1

    check-cast v0, Lcom/jcraft/jsch/ChannelSession;

    move-object v2, v0

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/Session;->applyConfigChannel(Lcom/jcraft/jsch/ChannelSession;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 857
    .end local v1           #channel:Lcom/jcraft/jsch/Channel;
    :cond_1
    :goto_0
    return-object v1

    .line 854
    :catch_0
    move-exception v2

    .line 857
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;
    .locals 23
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 905
    const/4 v6, 0x0

    .line 907
    .local v6, j:I
    :cond_0
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 908
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    invoke-virtual {v2, v3, v4, v5}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    .line 909
    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    add-int/2addr v2, v3

    move-object/from16 v0, p1

    iput v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 910
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v2, :cond_1

    .line 911
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v5, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .end local v6           #j:I
    const/4 v7, 0x0

    invoke-interface/range {v2 .. v7}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V

    .line 913
    :cond_1
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x0

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x18

    const/high16 v3, -0x100

    and-int/2addr v2, v3

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x1

    aget-byte v3, v3, v4

    shl-int/lit8 v3, v3, 0x10

    const/high16 v4, 0xff

    and-int/2addr v3, v4

    or-int/2addr v2, v3

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x2

    aget-byte v3, v3, v4

    shl-int/lit8 v3, v3, 0x8

    const v4, 0xff00

    and-int/2addr v3, v4

    or-int/2addr v2, v3

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x3

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int v6, v2, v3

    .line 918
    .restart local v6       #j:I
    const/4 v2, 0x5

    if-lt v6, v2, :cond_2

    const/high16 v2, 0x4

    if-le v6, v2, :cond_3

    .line 919
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    const/high16 v7, 0x4

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/Session;->start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V

    .line 921
    :cond_3
    add-int/lit8 v2, v6, 0x4

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    sub-int v10, v2, v3

    .line 925
    .local v10, need:I
    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v2, v10

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    if-le v2, v3, :cond_4

    .line 926
    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v2, v10

    new-array v15, v2, [B

    .line 927
    .local v15, foo:[B
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p1

    iget v5, v0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-static {v2, v3, v15, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 928
    move-object/from16 v0, p1

    iput-object v15, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 931
    .end local v15           #foo:[B
    :cond_4
    move-object/from16 v0, p0

    iget v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    rem-int v2, v10, v2

    if-eqz v2, :cond_6

    .line 932
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad packet length "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 933
    .local v17, message:Ljava/lang/String;
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x4

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 934
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x4

    move-object/from16 v0, v17

    invoke-interface {v2, v3, v0}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 936
    :cond_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    const/high16 v2, 0x4

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    sub-int v7, v2, v3

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/Session;->start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V

    .line 939
    .end local v17           #message:Ljava/lang/String;
    :cond_6
    if-lez v10, :cond_7

    .line 940
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-virtual {v2, v3, v4, v10}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    move-object/from16 v0, p1

    iget v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/2addr v2, v10

    move-object/from16 v0, p1

    iput v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 941
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v2, :cond_7

    .line 942
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p0

    iget v9, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v0, p0

    iget v12, v0, Lcom/jcraft/jsch/Session;->s2ccipher_size:I

    invoke-interface/range {v7 .. v12}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V

    .line 946
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    if-eqz v2, :cond_9

    .line 947
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/Session;->seqi:I

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/MAC;->update(I)V

    .line 948
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x0

    move-object/from16 v0, p1

    iget v5, v0, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-interface {v2, v3, v4, v5}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 950
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/Session;->s2cmac_result1:[B

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 951
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->io:Lcom/jcraft/jsch/IO;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    array-length v5, v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    .line 952
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->s2cmac_result1:[B

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/Session;->s2cmac_result2:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_9

    .line 953
    const/high16 v2, 0x4

    if-le v10, v2, :cond_8

    .line 954
    new-instance v2, Ljava/io/IOException;

    const-string v3, "MAC Error"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 956
    :cond_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jcraft/jsch/Session;->s2ccipher:Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->s2cmac:Lcom/jcraft/jsch/MAC;

    const/high16 v2, 0x4

    sub-int v7, v2, v10

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/Session;->start_discard(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/Cipher;Lcom/jcraft/jsch/MAC;II)V

    goto/16 :goto_0

    .line 961
    :cond_9
    move-object/from16 v0, p0

    iget v2, v0, Lcom/jcraft/jsch/Session;->seqi:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/jcraft/jsch/Session;->seqi:I

    .line 963
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    if-eqz v2, :cond_a

    .line 965
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v3, 0x4

    aget-byte v19, v2, v3

    .line 966
    .local v19, pad:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    const/4 v3, 0x0

    move-object/from16 v0, p1

    iget v4, v0, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v4, v4, -0x5

    sub-int v4, v4, v19

    aput v4, v2, v3

    .line 967
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v4, 0x5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    invoke-interface {v2, v3, v4, v5}, Lcom/jcraft/jsch/Compression;->uncompress([BI[I)[B

    move-result-object v15

    .line 968
    .restart local v15       #foo:[B
    if-eqz v15, :cond_b

    .line 969
    move-object/from16 v0, p1

    iput-object v15, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 970
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->uncompress_len:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    add-int/lit8 v2, v2, 0x5

    move-object/from16 v0, p1

    iput v2, v0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 978
    .end local v15           #foo:[B
    .end local v19           #pad:I
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v2

    and-int/lit16 v0, v2, 0xff

    move/from16 v22, v0

    .line 980
    .local v22, type:I
    const/4 v2, 0x1

    move/from16 v0, v22

    if-ne v0, v2, :cond_d

    .line 981
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 982
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 983
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v20

    .line 984
    .local v20, reason_code:I
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 985
    .local v14, description:[B
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v16

    .line 986
    .local v16, language_tag:[B
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SSH_MSG_DISCONNECT: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v14}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static/range {v16 .. v16}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 973
    .end local v14           #description:[B
    .end local v16           #language_tag:[B
    .end local v20           #reason_code:I
    .end local v22           #type:I
    .restart local v15       #foo:[B
    .restart local v19       #pad:I
    :cond_b
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "fail in inflater"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1040
    .end local v15           #foo:[B
    .end local v19           #pad:I
    :cond_c
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1041
    return-object p1

    .line 992
    .restart local v22       #type:I
    :cond_d
    const/4 v2, 0x2

    move/from16 v0, v22

    if-eq v0, v2, :cond_0

    .line 994
    const/4 v2, 0x3

    move/from16 v0, v22

    if-ne v0, v2, :cond_e

    .line 995
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 996
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 997
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v21

    .line 998
    .local v21, reason_id:I
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 999
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received SSH_MSG_UNIMPLEMENTED for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 1003
    .end local v21           #reason_id:I
    :cond_e
    const/4 v2, 0x4

    move/from16 v0, v22

    if-ne v0, v2, :cond_f

    .line 1004
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1005
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    goto/16 :goto_0

    .line 1015
    :cond_f
    const/16 v2, 0x5d

    move/from16 v0, v22

    if-ne v0, v2, :cond_10

    .line 1016
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1017
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1018
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    move-object/from16 v0, p0

    invoke-static {v2, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v13

    .line 1019
    .local v13, c:Lcom/jcraft/jsch/Channel;
    if-eqz v13, :cond_0

    .line 1022
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    invoke-virtual {v13, v2}, Lcom/jcraft/jsch/Channel;->addRemoteWindowSize(I)V

    goto/16 :goto_0

    .line 1025
    .end local v13           #c:Lcom/jcraft/jsch/Channel;
    :cond_10
    const/16 v2, 0x34

    move/from16 v0, v22

    if-ne v0, v2, :cond_c

    .line 1026
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/jcraft/jsch/Session;->isAuthed:Z

    .line 1027
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->inflater:Lcom/jcraft/jsch/Compression;

    if-nez v2, :cond_c

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->deflater:Lcom/jcraft/jsch/Compression;

    if-nez v2, :cond_c

    .line 1029
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x6

    aget-object v18, v2, v3

    .line 1030
    .local v18, method:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Session;->initDeflater(Ljava/lang/String;)V

    .line 1031
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/Session;->guess:[Ljava/lang/String;

    const/4 v3, 0x7

    aget-object v18, v2, v3

    .line 1032
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/Session;->initInflater(Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method public rekey()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 606
    invoke-direct {p0}, Lcom/jcraft/jsch/Session;->send_kexinit()V

    .line 607
    return-void
.end method

.method public run()V
    .locals 31

    .prologue
    .line 1362
    move-object/from16 v0, p0

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/Session;->thread:Ljava/lang/Runnable;

    .line 1365
    new-instance v3, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v3}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 1366
    .local v3, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v14, Lcom/jcraft/jsch/Packet;

    invoke-direct {v14, v3}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 1367
    .local v14, packet:Lcom/jcraft/jsch/Packet;
    const/4 v9, 0x0

    .line 1369
    .local v9, i:I
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [I

    move-object/from16 v23, v0

    .line 1370
    .local v23, start:[I
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v12, v0, [I

    .line 1371
    .local v12, length:[I
    const/4 v10, 0x0

    .line 1373
    .local v10, kex:Lcom/jcraft/jsch/KeyExchange;
    const/16 v24, 0x0

    .line 1376
    .local v24, stimeout:I
    :cond_0
    :goto_0
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->isConnected:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->thread:Ljava/lang/Runnable;

    move-object/from16 v27, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v27, :cond_1

    .line 1378
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;
    :try_end_1
    .catch Ljava/io/InterruptedIOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 1379
    const/16 v24, 0x0

    .line 1394
    :try_start_2
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v27

    move/from16 v0, v27

    and-int/lit16 v13, v0, 0xff

    .line 1396
    .local v13, msgType:I
    if-eqz v10, :cond_4

    invoke-virtual {v10}, Lcom/jcraft/jsch/KeyExchange;->getState()I

    move-result v27

    move/from16 v0, v27

    if-ne v0, v13, :cond_4

    .line 1397
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    move-wide/from16 v0, v27

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/jcraft/jsch/Session;->kex_start_time:J

    .line 1398
    invoke-virtual {v10, v3}, Lcom/jcraft/jsch/KeyExchange;->next(Lcom/jcraft/jsch/Buffer;)Z

    move-result v19

    .line 1399
    .local v19, result:Z
    if-nez v19, :cond_0

    .line 1400
    new-instance v27, Lcom/jcraft/jsch/JSchException;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "verify: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v27
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 1671
    .end local v13           #msgType:I
    .end local v19           #result:Z
    :catch_0
    move-exception v6

    .line 1672
    .local v6, e:Ljava/lang/Exception;
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->in_kex:Z

    .line 1673
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v27

    const/16 v28, 0x1

    invoke-interface/range {v27 .. v28}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v27

    if-eqz v27, :cond_1

    .line 1674
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v27

    const/16 v28, 0x1

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Caught an exception, leaving main loop due to "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-interface/range {v27 .. v29}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 1681
    .end local v6           #e:Ljava/lang/Exception;
    :cond_1
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->disconnect()V
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    .line 1691
    :goto_1
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/jcraft/jsch/Session;->isConnected:Z

    .line 1692
    return-void

    .line 1381
    :catch_1
    move-exception v7

    .line 1382
    .local v7, ee:Ljava/io/InterruptedIOException;
    :try_start_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->in_kex:Z

    move/from16 v27, v0

    if-nez v27, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    move/from16 v27, v0

    move/from16 v0, v24

    move/from16 v1, v27

    if-ge v0, v1, :cond_2

    .line 1383
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->sendKeepAliveMsg()V

    .line 1384
    add-int/lit8 v24, v24, 0x1

    .line 1385
    goto/16 :goto_0

    .line 1387
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->in_kex:Z

    move/from16 v27, v0

    if-eqz v27, :cond_3

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    move/from16 v27, v0

    move/from16 v0, v24

    move/from16 v1, v27

    if-ge v0, v1, :cond_3

    .line 1388
    add-int/lit8 v24, v24, 0x1

    .line 1389
    goto/16 :goto_0

    .line 1391
    :cond_3
    throw v7

    .line 1405
    .end local v7           #ee:Ljava/io/InterruptedIOException;
    .restart local v13       #msgType:I
    :cond_4
    sparse-switch v13, :sswitch_data_0

    .line 1667
    new-instance v27, Ljava/io/IOException;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "Unknown SSH message type "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 1408
    :sswitch_0
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/Session;->receive_kexinit(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyExchange;

    move-result-object v10

    .line 1409
    goto/16 :goto_0

    .line 1413
    :sswitch_1
    invoke-direct/range {p0 .. p0}, Lcom/jcraft/jsch/Session;->send_newkeys()V

    .line 1414
    move-object/from16 v0, p0

    invoke-direct {v0, v3, v10}, Lcom/jcraft/jsch/Session;->receive_newkeys(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/KeyExchange;)V

    .line 1415
    const/4 v10, 0x0

    .line 1416
    goto/16 :goto_0

    .line 1419
    :sswitch_2
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1420
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 1421
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 1422
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1423
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1424
    .local v4, channel:Lcom/jcraft/jsch/Channel;
    move-object/from16 v0, v23

    invoke-virtual {v3, v0, v12}, Lcom/jcraft/jsch/Buffer;->getString([I[I)[B

    move-result-object v8

    .line 1425
    .local v8, foo:[B
    if-eqz v4, :cond_0

    .line 1429
    const/16 v27, 0x0

    aget v27, v12, v27
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    if-eqz v27, :cond_0

    .line 1434
    const/16 v27, 0x0

    :try_start_5
    aget v27, v23, v27

    const/16 v28, 0x0

    aget v28, v12, v28

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v4, v8, v0, v1}, Lcom/jcraft/jsch/Channel;->write([BII)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 1441
    const/16 v27, 0x0

    :try_start_6
    aget v11, v12, v27

    .line 1442
    .local v11, len:I
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    sub-int v27, v27, v11

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V

    .line 1443
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v28, v0

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v27

    move/from16 v1, v28

    if-ge v0, v1, :cond_0

    .line 1444
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1445
    const/16 v27, 0x5d

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1446
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1447
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v28, v0

    sub-int v27, v27, v28

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1448
    monitor-enter v4
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 1449
    :try_start_7
    iget-boolean v0, v4, Lcom/jcraft/jsch/Channel;->close:Z

    move/from16 v27, v0

    if-nez v27, :cond_5

    .line 1450
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 1451
    :cond_5
    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1452
    :try_start_8
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    goto/16 :goto_0

    .line 1436
    .end local v11           #len:I
    :catch_2
    move-exception v6

    .line 1438
    .restart local v6       #e:Ljava/lang/Exception;
    :try_start_9
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->disconnect()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    goto/16 :goto_0

    :catch_3
    move-exception v27

    goto/16 :goto_0

    .line 1451
    .end local v6           #e:Ljava/lang/Exception;
    .restart local v11       #len:I
    :catchall_0
    move-exception v27

    :try_start_a
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :try_start_b
    throw v27

    .line 1457
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    .end local v8           #foo:[B
    .end local v11           #len:I
    :sswitch_3
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1458
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1459
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1460
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1461
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1462
    move-object/from16 v0, v23

    invoke-virtual {v3, v0, v12}, Lcom/jcraft/jsch/Buffer;->getString([I[I)[B

    move-result-object v8

    .line 1464
    .restart local v8       #foo:[B
    if-eqz v4, :cond_0

    .line 1468
    const/16 v27, 0x0

    aget v27, v12, v27

    if-eqz v27, :cond_0

    .line 1472
    const/16 v27, 0x0

    aget v27, v23, v27

    const/16 v28, 0x0

    aget v28, v12, v28

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v4, v8, v0, v1}, Lcom/jcraft/jsch/Channel;->write_ext([BII)V

    .line 1474
    const/16 v27, 0x0

    aget v11, v12, v27

    .line 1475
    .restart local v11       #len:I
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    sub-int v27, v27, v11

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V

    .line 1476
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v28, v0

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v27

    move/from16 v1, v28

    if-ge v0, v1, :cond_0

    .line 1477
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1478
    const/16 v27, 0x5d

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1479
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1480
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize:I

    move/from16 v28, v0

    sub-int v27, v27, v28

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1481
    monitor-enter v4
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0

    .line 1482
    :try_start_c
    iget-boolean v0, v4, Lcom/jcraft/jsch/Channel;->close:Z

    move/from16 v27, v0

    if-nez v27, :cond_6

    .line 1483
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 1484
    :cond_6
    monitor-exit v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 1485
    :try_start_d
    iget v0, v4, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    move/from16 v27, v0

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setLocalWindowSize(I)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0

    goto/16 :goto_0

    .line 1484
    :catchall_1
    move-exception v27

    :try_start_e
    monitor-exit v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    :try_start_f
    throw v27

    .line 1490
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    .end local v8           #foo:[B
    .end local v11           #len:I
    :sswitch_4
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1491
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1492
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1493
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1494
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_0

    .line 1497
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->addRemoteWindowSize(I)V

    goto/16 :goto_0

    .line 1501
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    :sswitch_5
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1502
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1503
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1504
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1505
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_0

    .line 1508
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->eof_remote()V

    goto/16 :goto_0

    .line 1518
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    :sswitch_6
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1519
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1520
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1521
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1522
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_0

    .line 1524
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->disconnect()V

    goto/16 :goto_0

    .line 1533
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    :sswitch_7
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1534
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1535
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1536
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1537
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-nez v4, :cond_7

    .line 1540
    :cond_7
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v15

    .line 1541
    .local v15, r:I
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getUInt()J

    move-result-wide v21

    .line 1542
    .local v21, rws:J
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v20

    .line 1544
    .local v20, rps:I
    move-wide/from16 v0, v21

    invoke-virtual {v4, v0, v1}, Lcom/jcraft/jsch/Channel;->setRemoteWindowSize(J)V

    .line 1545
    move/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setRemotePacketSize(I)V

    .line 1546
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v4, Lcom/jcraft/jsch/Channel;->open_confirmation:Z

    .line 1547
    invoke-virtual {v4, v15}, Lcom/jcraft/jsch/Channel;->setRecipient(I)V

    goto/16 :goto_0

    .line 1550
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    .end local v15           #r:I
    .end local v20           #rps:I
    .end local v21           #rws:J
    :sswitch_8
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1551
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1552
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1553
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1554
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-nez v4, :cond_8

    .line 1557
    :cond_8
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v16

    .line 1560
    .local v16, reason_code:I
    move/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setExitStatus(I)V

    .line 1561
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v4, Lcom/jcraft/jsch/Channel;->close:Z

    .line 1562
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v4, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 1563
    const/16 v27, 0x0

    move/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Channel;->setRecipient(I)V

    goto/16 :goto_0

    .line 1566
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    .end local v16           #reason_code:I
    :sswitch_9
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1567
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1568
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1569
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v8

    .line 1570
    .restart local v8       #foo:[B
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v27

    if-eqz v27, :cond_a

    const/16 v17, 0x1

    .line 1571
    .local v17, reply:Z
    :goto_2
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1572
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_0

    .line 1573
    const/16 v18, 0x64

    .line 1574
    .local v18, reply_type:B
    invoke-static {v8}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v27

    const-string v28, "exit-status"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_9

    .line 1575
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1576
    invoke-virtual {v4, v9}, Lcom/jcraft/jsch/Channel;->setExitStatus(I)V

    .line 1577
    const/16 v18, 0x63

    .line 1579
    :cond_9
    if-eqz v17, :cond_0

    .line 1580
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1581
    move/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1582
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1583
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    goto/16 :goto_0

    .line 1570
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    .end local v17           #reply:Z
    .end local v18           #reply_type:B
    :cond_a
    const/16 v17, 0x0

    goto :goto_2

    .line 1590
    .end local v8           #foo:[B
    :sswitch_a
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1591
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1592
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v8

    .line 1593
    .restart local v8       #foo:[B
    invoke-static {v8}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    .line 1594
    .local v5, ctyp:Ljava/lang/String;
    const-string v27, "forwarded-tcpip"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_d

    const-string v27, "x11"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_b

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->x11_forwarding:Z

    move/from16 v27, v0

    if-nez v27, :cond_d

    :cond_b
    const-string v27, "auth-agent@openssh.com"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->agent_forwarding:Z

    move/from16 v27, v0

    if-nez v27, :cond_d

    .line 1599
    :cond_c
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1600
    const/16 v27, 0x5c

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1601
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v27

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1602
    const/16 v27, 0x1

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 1603
    sget-object v27, Lcom/jcraft/jsch/Util;->empty:[B

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 1604
    sget-object v27, Lcom/jcraft/jsch/Util;->empty:[B

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 1605
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 1622
    .end local v5           #ctyp:Ljava/lang/String;
    .end local v8           #foo:[B
    :sswitch_b
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1623
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1624
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1625
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1626
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_0

    .line 1629
    const/16 v27, 0x1

    move/from16 v0, v27

    iput v0, v4, Lcom/jcraft/jsch/Channel;->reply:I

    goto/16 :goto_0

    .line 1608
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    .restart local v5       #ctyp:Ljava/lang/String;
    .restart local v8       #foo:[B
    :cond_d
    invoke-static {v5}, Lcom/jcraft/jsch/Channel;->getChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1609
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Session;->addChannel(Lcom/jcraft/jsch/Channel;)V

    .line 1610
    invoke-virtual {v4, v3}, Lcom/jcraft/jsch/Channel;->getData(Lcom/jcraft/jsch/Buffer;)V

    .line 1611
    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->init()V

    .line 1613
    new-instance v26, Ljava/lang/Thread;

    move-object/from16 v0, v26

    invoke-direct {v0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1614
    .local v26, tmp:Ljava/lang/Thread;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Channel "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 1615
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v27, v0

    if-eqz v27, :cond_e

    .line 1616
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    move/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 1618
    :cond_e
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 1632
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    .end local v5           #ctyp:Ljava/lang/String;
    .end local v8           #foo:[B
    .end local v26           #tmp:Ljava/lang/Thread;
    :sswitch_c
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1633
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1634
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1635
    move-object/from16 v0, p0

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Channel;->getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;

    move-result-object v4

    .line 1636
    .restart local v4       #channel:Lcom/jcraft/jsch/Channel;
    if-eqz v4, :cond_0

    .line 1639
    const/16 v27, 0x0

    move/from16 v0, v27

    iput v0, v4, Lcom/jcraft/jsch/Channel;->reply:I

    goto/16 :goto_0

    .line 1642
    .end local v4           #channel:Lcom/jcraft/jsch/Channel;
    :sswitch_d
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1643
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1644
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v8

    .line 1645
    .restart local v8       #foo:[B
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v27

    if-eqz v27, :cond_f

    const/16 v17, 0x1

    .line 1646
    .restart local v17       #reply:Z
    :goto_3
    if-eqz v17, :cond_0

    .line 1647
    invoke-virtual {v14}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 1648
    const/16 v27, 0x52

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 1649
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    goto/16 :goto_0

    .line 1645
    .end local v17           #reply:Z
    :cond_f
    const/16 v17, 0x0

    goto :goto_3

    .line 1654
    .end local v8           #foo:[B
    :sswitch_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getThread()Ljava/lang/Thread;

    move-result-object v25

    .line 1655
    .local v25, t:Ljava/lang/Thread;
    if-eqz v25, :cond_0

    .line 1656
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v28, v0

    const/16 v27, 0x51

    move/from16 v0, v27

    if-ne v13, v0, :cond_11

    const/16 v27, 0x1

    :goto_4
    move-object/from16 v0, v28

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setReply(I)V

    .line 1657
    const/16 v27, 0x51

    move/from16 v0, v27

    if-ne v13, v0, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->getPort()I

    move-result v27

    if-nez v27, :cond_10

    .line 1658
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 1659
    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getShort()I

    .line 1660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->grr:Lcom/jcraft/jsch/Session$GlobalRequestReply;

    move-object/from16 v27, v0

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Lcom/jcraft/jsch/Session$GlobalRequestReply;->setPort(I)V

    .line 1662
    :cond_10
    invoke-virtual/range {v25 .. v25}, Ljava/lang/Thread;->interrupt()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    goto/16 :goto_0

    .line 1656
    :cond_11
    const/16 v27, 0x0

    goto :goto_4

    .line 1683
    .end local v13           #msgType:I
    .end local v25           #t:Ljava/lang/Thread;
    :catch_4
    move-exception v27

    goto/16 :goto_1

    .line 1687
    :catch_5
    move-exception v27

    goto/16 :goto_1

    .line 1405
    :sswitch_data_0
    .sparse-switch
        0x14 -> :sswitch_0
        0x15 -> :sswitch_1
        0x50 -> :sswitch_d
        0x51 -> :sswitch_e
        0x52 -> :sswitch_e
        0x5a -> :sswitch_a
        0x5b -> :sswitch_7
        0x5c -> :sswitch_8
        0x5d -> :sswitch_4
        0x5e -> :sswitch_2
        0x5f -> :sswitch_3
        0x60 -> :sswitch_5
        0x61 -> :sswitch_6
        0x62 -> :sswitch_9
        0x63 -> :sswitch_b
        0x64 -> :sswitch_c
    .end sparse-switch
.end method

.method public sendIgnore()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2345
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 2346
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2347
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2348
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2349
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 2350
    return-void
.end method

.method public sendKeepAliveMsg()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2354
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 2355
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 2356
    .local v1, packet:Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2357
    const/16 v2, 0x50

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2358
    sget-object v2, Lcom/jcraft/jsch/Session;->keepalivemsg:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2359
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2360
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 2361
    return-void
.end method

.method public setClientVersion(Ljava/lang/String;)V
    .locals 1
    .parameter "cv"

    .prologue
    .line 2341
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->V_C:[B

    .line 2342
    return-void
.end method

.method public setConfig(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "key"
    .parameter "value"

    .prologue
    .line 2292
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 2293
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    .line 2294
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    .line 2296
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2297
    monitor-exit v1

    .line 2298
    return-void

    .line 2297
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setConfig(Ljava/util/Hashtable;)V
    .locals 6
    .parameter "newconf"

    .prologue
    .line 2281
    iget-object v4, p0, Lcom/jcraft/jsch/Session;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 2282
    :try_start_0
    iget-object v3, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    if-nez v3, :cond_0

    .line 2283
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    iput-object v3, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    .line 2284
    :cond_0
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, e:Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2285
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v2, v0

    .line 2286
    .local v2, key:Ljava/lang/String;
    iget-object v5, p0, Lcom/jcraft/jsch/Session;->config:Ljava/util/Hashtable;

    invoke-virtual {p1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 2288
    .end local v1           #e:Ljava/util/Enumeration;
    .end local v2           #key:Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v1       #e:Ljava/util/Enumeration;
    :cond_1
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2289
    return-void
.end method

.method public setConfig(Ljava/util/Properties;)V
    .locals 0
    .parameter "newconf"

    .prologue
    .line 2277
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/util/Hashtable;)V

    .line 2278
    return-void
.end method

.method public setDaemonThread(Z)V
    .locals 0
    .parameter "enable"

    .prologue
    .line 2431
    iput-boolean p1, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    .line 2432
    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .parameter "host"

    .prologue
    .line 2255
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    return-void
.end method

.method public setHostKeyAlias(Ljava/lang/String;)V
    .locals 0
    .parameter "hostKeyAlias"

    .prologue
    .line 2380
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->hostKeyAlias:Ljava/lang/String;

    .line 2381
    return-void
.end method

.method public setHostKeyRepository(Lcom/jcraft/jsch/HostKeyRepository;)V
    .locals 0
    .parameter "hostkeyRepository"

    .prologue
    .line 2552
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->hostkeyRepository:Lcom/jcraft/jsch/HostKeyRepository;

    .line 2553
    return-void
.end method

.method public setIdentityRepository(Lcom/jcraft/jsch/IdentityRepository;)V
    .locals 0
    .parameter "identityRepository"

    .prologue
    .line 2528
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    .line 2529
    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;)V
    .locals 0
    .parameter "in"

    .prologue
    .line 2260
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .locals 0
    .parameter "out"

    .prologue
    .line 2261
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 1
    .parameter "password"

    .prologue
    .line 2266
    if-eqz p1, :cond_0

    .line 2267
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->password:[B

    .line 2268
    :cond_0
    return-void
.end method

.method public setPassword([B)V
    .locals 3
    .parameter "password"

    .prologue
    const/4 v2, 0x0

    .line 2270
    if-eqz p1, :cond_0

    .line 2271
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Session;->password:[B

    .line 2272
    iget-object v0, p0, Lcom/jcraft/jsch/Session;->password:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2274
    :cond_0
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .parameter "port"

    .prologue
    .line 2256
    iput p1, p0, Lcom/jcraft/jsch/Session;->port:I

    return-void
.end method

.method public setPortForwardingL(ILjava/lang/String;I)I
    .locals 1
    .parameter "lport"
    .parameter "host"
    .parameter "rport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1770
    const-string v0, "127.0.0.1"

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public setPortForwardingL(Ljava/lang/String;)I
    .locals 5
    .parameter "conf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2073
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->parseForwarding(Ljava/lang/String;)Lcom/jcraft/jsch/Session$Forwarding;

    move-result-object v0

    .line 2074
    .local v0, f:Lcom/jcraft/jsch/Session$Forwarding;
    iget-object v1, v0, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    iget v2, v0, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    iget-object v3, v0, Lcom/jcraft/jsch/Session$Forwarding;->host:Ljava/lang/String;

    iget v4, v0, Lcom/jcraft/jsch/Session$Forwarding;->hostport:I

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public setPortForwardingL(Ljava/lang/String;ILjava/lang/String;I)I
    .locals 6
    .parameter "bind_address"
    .parameter "lport"
    .parameter "host"
    .parameter "rport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1787
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)I

    move-result v0

    return v0
.end method

.method public setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)I
    .locals 7
    .parameter "bind_address"
    .parameter "lport"
    .parameter "host"
    .parameter "rport"
    .parameter "ssf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1806
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/jcraft/jsch/Session;->setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;I)I

    move-result v0

    return v0
.end method

.method public setPortForwardingL(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;I)I
    .locals 4
    .parameter "bind_address"
    .parameter "lport"
    .parameter "host"
    .parameter "rport"
    .parameter "ssf"
    .parameter "connectTimeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1825
    invoke-static/range {p0 .. p5}, Lcom/jcraft/jsch/PortWatcher;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)Lcom/jcraft/jsch/PortWatcher;

    move-result-object v0

    .line 1826
    .local v0, pw:Lcom/jcraft/jsch/PortWatcher;
    invoke-virtual {v0, p6}, Lcom/jcraft/jsch/PortWatcher;->setConnectTimeout(I)V

    .line 1827
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1828
    .local v1, tmp:Ljava/lang/Thread;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PortWatcher Thread for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 1829
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    if-eqz v2, :cond_0

    .line 1830
    iget-boolean v2, p0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 1832
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 1833
    iget v2, v0, Lcom/jcraft/jsch/PortWatcher;->lport:I

    return v2
.end method

.method public setPortForwardingR(Ljava/lang/String;)I
    .locals 8
    .parameter "conf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2093
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->parseForwarding(Ljava/lang/String;)Lcom/jcraft/jsch/Session$Forwarding;

    move-result-object v7

    .line 2094
    .local v7, f:Lcom/jcraft/jsch/Session$Forwarding;
    iget-object v0, v7, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    iget v1, v7, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/Session;->_setPortForwardingR(Ljava/lang/String;I)I

    move-result v3

    .line 2095
    .local v3, allocated:I
    iget-object v1, v7, Lcom/jcraft/jsch/Session$Forwarding;->bind_address:Ljava/lang/String;

    iget v2, v7, Lcom/jcraft/jsch/Session$Forwarding;->port:I

    iget-object v4, v7, Lcom/jcraft/jsch/Session$Forwarding;->host:Ljava/lang/String;

    iget v5, v7, Lcom/jcraft/jsch/Session$Forwarding;->hostport:I

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;IILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 2097
    return v3
.end method

.method public setPortForwardingR(ILjava/lang/String;)V
    .locals 1
    .parameter "rport"
    .parameter "daemon"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1948
    invoke-virtual {p0, v0, p1, p2, v0}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;)V

    .line 1949
    return-void
.end method

.method public setPortForwardingR(ILjava/lang/String;I)V
    .locals 6
    .parameter "rport"
    .parameter "host"
    .parameter "lport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1876
    move-object v5, v1

    check-cast v5, Lcom/jcraft/jsch/SocketFactory;

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1877
    return-void
.end method

.method public setPortForwardingR(ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V
    .locals 6
    .parameter "rport"
    .parameter "host"
    .parameter "lport"
    .parameter "sf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1909
    const/4 v1, 0x0

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1910
    return-void
.end method

.method public setPortForwardingR(ILjava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .parameter "rport"
    .parameter "daemon"
    .parameter "arg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1965
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;)V

    .line 1966
    return-void
.end method

.method public setPortForwardingR(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 6
    .parameter "bind_address"
    .parameter "rport"
    .parameter "host"
    .parameter "lport"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1895
    const/4 v5, 0x0

    check-cast v5, Lcom/jcraft/jsch/SocketFactory;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/Session;->setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1896
    return-void
.end method

.method public setPortForwardingR(Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V
    .locals 7
    .parameter "bind_address"
    .parameter "rport"
    .parameter "host"
    .parameter "lport"
    .parameter "sf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1930
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/Session;->_setPortForwardingR(Ljava/lang/String;I)I

    move-result v3

    .local v3, allocated:I
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    .line 1931
    invoke-static/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;IILjava/lang/String;ILcom/jcraft/jsch/SocketFactory;)V

    .line 1933
    return-void
.end method

.method public setPortForwardingR(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;)V
    .locals 6
    .parameter "bind_address"
    .parameter "rport"
    .parameter "daemon"
    .parameter "arg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 1988
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/Session;->_setPortForwardingR(Ljava/lang/String;I)I

    move-result v3

    .local v3, allocated:I
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v4, p3

    move-object v5, p4

    .line 1989
    invoke-static/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;->addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;IILjava/lang/String;[Ljava/lang/Object;)V

    .line 1991
    return-void
.end method

.method public setProxy(Lcom/jcraft/jsch/Proxy;)V
    .locals 0
    .parameter "proxy"

    .prologue
    .line 2254
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->proxy:Lcom/jcraft/jsch/Proxy;

    return-void
.end method

.method public setServerAliveCountMax(I)V
    .locals 0
    .parameter "count"

    .prologue
    .line 2418
    iput p1, p0, Lcom/jcraft/jsch/Session;->serverAliveCountMax:I

    .line 2419
    return-void
.end method

.method public setServerAliveInterval(I)V
    .locals 0
    .parameter "interval"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2395
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/Session;->setTimeout(I)V

    .line 2396
    iput p1, p0, Lcom/jcraft/jsch/Session;->serverAliveInterval:I

    .line 2397
    return-void
.end method

.method public setSocketFactory(Lcom/jcraft/jsch/SocketFactory;)V
    .locals 0
    .parameter "sfactory"

    .prologue
    .line 2312
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->socket_factory:Lcom/jcraft/jsch/SocketFactory;

    .line 2313
    return-void
.end method

.method public setTimeout(I)V
    .locals 3
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 2317
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    if-nez v1, :cond_1

    .line 2318
    if-gez p1, :cond_0

    .line 2319
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    const-string v2, "invalid timeout value"

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2321
    :cond_0
    iput p1, p0, Lcom/jcraft/jsch/Session;->timeout:I

    .line 2333
    :goto_0
    return-void

    .line 2325
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/Session;->socket:Ljava/net/Socket;

    invoke-virtual {v1, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 2326
    iput p1, p0, Lcom/jcraft/jsch/Session;->timeout:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2328
    :catch_0
    move-exception v0

    .line 2329
    .local v0, e:Ljava/lang/Exception;
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_2

    .line 2330
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2331
    :cond_2
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setUserInfo(Lcom/jcraft/jsch/UserInfo;)V
    .locals 0
    .parameter "userinfo"

    .prologue
    .line 2258
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->userinfo:Lcom/jcraft/jsch/UserInfo;

    return-void
.end method

.method setUserName(Ljava/lang/String;)V
    .locals 0
    .parameter "username"

    .prologue
    .line 2257
    iput-object p1, p0, Lcom/jcraft/jsch/Session;->username:Ljava/lang/String;

    return-void
.end method

.method public setX11Cookie(Ljava/lang/String;)V
    .locals 0
    .parameter "cookie"

    .prologue
    .line 2264
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelX11;->setCookie(Ljava/lang/String;)V

    return-void
.end method

.method public setX11Host(Ljava/lang/String;)V
    .locals 0
    .parameter "host"

    .prologue
    .line 2262
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelX11;->setHost(Ljava/lang/String;)V

    return-void
.end method

.method public setX11Port(I)V
    .locals 0
    .parameter "port"

    .prologue
    .line 2263
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelX11;->setPort(I)V

    return-void
.end method

.method public write(Lcom/jcraft/jsch/Packet;)V
    .locals 8
    .parameter "packet"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x1f

    .line 1326
    invoke-virtual {p0}, Lcom/jcraft/jsch/Session;->getTimeout()I

    move-result v3

    int-to-long v1, v3

    .line 1327
    .local v1, t:J
    :goto_0
    iget-boolean v3, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v3, :cond_1

    .line 1328
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    sub-long/2addr v3, v5

    cmp-long v3, v3, v1

    if-lez v3, :cond_0

    .line 1329
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "timeout in wating for rekeying process."

    invoke-direct {v3, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1331
    :cond_0
    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v0

    .line 1333
    .local v0, command:B
    const/16 v3, 0x14

    if-eq v0, v3, :cond_1

    const/16 v3, 0x15

    if-eq v0, v3, :cond_1

    const/16 v3, 0x1e

    if-eq v0, v3, :cond_1

    if-eq v0, v7, :cond_1

    if-eq v0, v7, :cond_1

    const/16 v3, 0x20

    if-eq v0, v3, :cond_1

    const/16 v3, 0x21

    if-eq v0, v3, :cond_1

    const/16 v3, 0x22

    if-eq v0, v3, :cond_1

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    .line 1347
    .end local v0           #command:B
    :cond_1
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->_write(Lcom/jcraft/jsch/Packet;)V

    .line 1348
    return-void

    .line 1344
    .restart local v0       #command:B
    :cond_2
    const-wide/16 v3, 0xa

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1345
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V
    .locals 12
    .parameter "packet"
    .parameter "c"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1236
    invoke-virtual {p0}, Lcom/jcraft/jsch/Session;->getTimeout()I

    move-result v8

    int-to-long v6, v8

    .line 1238
    .local v6, t:J
    :goto_0
    iget-boolean v8, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v8, :cond_1

    .line 1239
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/jcraft/jsch/Session;->kex_start_time:J

    sub-long/2addr v8, v10

    cmp-long v8, v8, v6

    if-lez v8, :cond_0

    .line 1240
    new-instance v8, Lcom/jcraft/jsch/JSchException;

    const-string v9, "timeout in wating for rekeying process."

    invoke-direct {v8, v9}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1242
    :cond_0
    const-wide/16 v8, 0xa

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1243
    :catch_0
    move-exception v8

    goto :goto_0

    .line 1246
    :cond_1
    monitor-enter p2

    .line 1248
    :try_start_1
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    int-to-long v10, p3

    cmp-long v8, v8, v10

    if-gez v8, :cond_2

    .line 1250
    :try_start_2
    iget v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 1251
    const-wide/16 v8, 0x64

    invoke-virtual {p2, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1256
    :try_start_3
    iget v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 1260
    :cond_2
    :goto_1
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    cmp-long v8, v8, v10

    if-ltz v8, :cond_4

    .line 1261
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    sub-long/2addr v8, v10

    iput-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1262
    monitor-exit p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1321
    :goto_2
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->_write(Lcom/jcraft/jsch/Packet;)V

    .line 1322
    :cond_3
    return-void

    .line 1253
    :catch_1
    move-exception v8

    .line 1256
    :try_start_4
    iget v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    goto :goto_1

    .line 1265
    :catchall_0
    move-exception v8

    monitor-exit p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v8

    .line 1256
    :catchall_1
    move-exception v8

    :try_start_5
    iget v9, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p2, Lcom/jcraft/jsch/Channel;->notifyme:I

    throw v8

    .line 1265
    :cond_4
    monitor-exit p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1266
    iget-boolean v8, p2, Lcom/jcraft/jsch/Channel;->close:Z

    if-nez v8, :cond_5

    invoke-virtual {p2}, Lcom/jcraft/jsch/Channel;->isConnected()Z

    move-result v8

    if-nez v8, :cond_6

    .line 1267
    :cond_5
    new-instance v8, Ljava/io/IOException;

    const-string v9, "channel is broken"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1270
    :cond_6
    const/4 v5, 0x0

    .line 1271
    .local v5, sendit:Z
    const/4 v4, 0x0

    .line 1272
    .local v4, s:I
    const/4 v0, 0x0

    .line 1273
    .local v0, command:B
    const/4 v3, -0x1

    .line 1274
    .local v3, recipient:I
    monitor-enter p2

    .line 1275
    :try_start_6
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_9

    .line 1276
    iget-wide v1, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1277
    .local v1, len:J
    int-to-long v8, p3

    cmp-long v8, v1, v8

    if-lez v8, :cond_7

    .line 1278
    int-to-long v1, p3

    .line 1280
    :cond_7
    int-to-long v8, p3

    cmp-long v8, v1, v8

    if-eqz v8, :cond_8

    .line 1281
    long-to-int v10, v1

    iget-object v8, p0, Lcom/jcraft/jsch/Session;->c2scipher:Lcom/jcraft/jsch/Cipher;

    if-eqz v8, :cond_b

    iget v8, p0, Lcom/jcraft/jsch/Session;->c2scipher_size:I

    move v9, v8

    :goto_3
    iget-object v8, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    if-eqz v8, :cond_c

    iget-object v8, p0, Lcom/jcraft/jsch/Session;->c2smac:Lcom/jcraft/jsch/MAC;

    invoke-interface {v8}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v8

    :goto_4
    invoke-virtual {p1, v10, v9, v8}, Lcom/jcraft/jsch/Packet;->shift(III)I

    move-result v4

    .line 1285
    :cond_8
    iget-object v8, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v0

    .line 1286
    invoke-virtual {p2}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v3

    .line 1287
    int-to-long v8, p3

    sub-long/2addr v8, v1

    long-to-int p3, v8

    .line 1288
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    sub-long/2addr v8, v1

    iput-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1289
    const/4 v5, 0x1

    .line 1291
    .end local v1           #len:J
    :cond_9
    monitor-exit p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 1292
    if-eqz v5, :cond_a

    .line 1293
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/Session;->_write(Lcom/jcraft/jsch/Packet;)V

    .line 1294
    if-eqz p3, :cond_3

    .line 1297
    invoke-virtual {p1, v0, v3, v4, p3}, Lcom/jcraft/jsch/Packet;->unshift(BIII)V

    .line 1300
    :cond_a
    monitor-enter p2

    .line 1301
    :try_start_7
    iget-boolean v8, p0, Lcom/jcraft/jsch/Session;->in_kex:Z

    if-eqz v8, :cond_d

    .line 1302
    monitor-exit p2

    goto/16 :goto_0

    .line 1319
    :catchall_2
    move-exception v8

    monitor-exit p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v8

    .line 1281
    .restart local v1       #len:J
    :cond_b
    const/16 v8, 0x8

    move v9, v8

    goto :goto_3

    :cond_c
    const/4 v8, 0x0

    goto :goto_4

    .line 1291
    .end local v1           #len:J
    :catchall_3
    move-exception v8

    :try_start_8
    monitor-exit p2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    throw v8

    .line 1304
    :cond_d
    :try_start_9
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    cmp-long v8, v8, v10

    if-ltz v8, :cond_e

    .line 1305
    iget-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    int-to-long v10, p3

    sub-long/2addr v8, v10

    iput-wide v8, p2, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 1306
    monitor-exit p2

    goto/16 :goto_2

    .line 1319
    :cond_e
    monitor-exit p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto/16 :goto_0
.end method
