.class Lcom/jcraft/jsch/ChannelX11;
.super Lcom/jcraft/jsch/Channel;
.source "ChannelX11.java"


# static fields
.field private static final LOCAL_MAXIMUM_PACKET_SIZE:I = 0x4000

.field private static final LOCAL_WINDOW_SIZE_MAX:I = 0x20000

.field private static final TIMEOUT:I = 0x2710

.field static cookie:[B

.field private static cookie_hex:[B

.field private static faked_cookie_hex_pool:Ljava/util/Hashtable;

.field private static faked_cookie_pool:Ljava/util/Hashtable;

.field private static host:Ljava/lang/String;

.field private static port:I

.field private static table:[B


# instance fields
.field private cache:[B

.field private init:Z

.field private socket:Ljava/net/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 41
    const-string v0, "127.0.0.1"

    sput-object v0, Lcom/jcraft/jsch/ChannelX11;->host:Ljava/lang/String;

    .line 42
    const/16 v0, 0x1770

    sput v0, Lcom/jcraft/jsch/ChannelX11;->port:I

    .line 46
    sput-object v1, Lcom/jcraft/jsch/ChannelX11;->cookie:[B

    .line 47
    sput-object v1, Lcom/jcraft/jsch/ChannelX11;->cookie_hex:[B

    .line 49
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_pool:Ljava/util/Hashtable;

    .line 50
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_hex_pool:Ljava/util/Hashtable;

    .line 52
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/jcraft/jsch/ChannelX11;->table:[B

    return-void

    nop

    :array_0
    .array-data 0x1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method constructor <init>()V
    .locals 3

    .prologue
    const/high16 v2, 0x2

    const/4 v1, 0x1

    .line 110
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel;-><init>()V

    .line 44
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelX11;->init:Z

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelX11;->socket:Ljava/net/Socket;

    .line 180
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    .line 112
    invoke-virtual {p0, v2}, Lcom/jcraft/jsch/ChannelX11;->setLocalWindowSizeMax(I)V

    .line 113
    invoke-virtual {p0, v2}, Lcom/jcraft/jsch/ChannelX11;->setLocalWindowSize(I)V

    .line 114
    const/16 v0, 0x4000

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/ChannelX11;->setLocalPacketSize(I)V

    .line 116
    const-string v0, "x11"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelX11;->type:[B

    .line 118
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelX11;->connected:Z

    .line 131
    return-void
.end method

.method private addCache([BII)[B
    .locals 4
    .parameter "foo"
    .parameter "s"
    .parameter "l"

    .prologue
    const/4 v3, 0x0

    .line 182
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    array-length v1, v1

    add-int/2addr v1, p3

    new-array v0, v1, [B

    .line 183
    .local v0, bar:[B
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    array-length v1, v1

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    array-length v1, v1

    if-lez v1, :cond_0

    .line 185
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    :cond_0
    iput-object v0, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    .line 187
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    return-object v1
.end method

.method private static equals([B[B)Z
    .locals 4
    .parameter "foo"
    .parameter "bar"

    .prologue
    const/4 v1, 0x0

    .line 267
    array-length v2, p0

    array-length v3, p1

    if-eq v2, v3, :cond_1

    .line 271
    :cond_0
    :goto_0
    return v1

    .line 268
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_2

    .line 269
    aget-byte v2, p0, v0

    aget-byte v3, p1, v0

    if-ne v2, v3, :cond_0

    .line 268
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 271
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method static getFakedCookie(Lcom/jcraft/jsch/Session;)[B
    .locals 10
    .parameter "session"

    .prologue
    const/16 v9, 0x10

    .line 74
    sget-object v6, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_hex_pool:Ljava/util/Hashtable;

    monitor-enter v6

    .line 75
    :try_start_0
    sget-object v5, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_hex_pool:Ljava/util/Hashtable;

    invoke-virtual {v5, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    move-object v0, v5

    check-cast v0, [B

    move-object v2, v0

    .line 76
    .local v2, foo:[B
    if-nez v2, :cond_1

    .line 77
    sget-object v4, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    .line 78
    .local v4, random:Lcom/jcraft/jsch/Random;
    const/16 v5, 0x10

    new-array v2, v5, [B

    .line 79
    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 80
    const/4 v5, 0x0

    const/16 v7, 0x10

    :try_start_1
    invoke-interface {v4, v2, v5, v7}, Lcom/jcraft/jsch/Random;->fill([BII)V

    .line 81
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    :try_start_2
    sget-object v5, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_pool:Ljava/util/Hashtable;

    invoke-virtual {v5, p0, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const/16 v5, 0x20

    new-array v1, v5, [B

    .line 91
    .local v1, bar:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v9, :cond_0

    .line 92
    mul-int/lit8 v5, v3, 0x2

    sget-object v7, Lcom/jcraft/jsch/ChannelX11;->table:[B

    aget-byte v8, v2, v3

    ushr-int/lit8 v8, v8, 0x4

    and-int/lit8 v8, v8, 0xf

    aget-byte v7, v7, v8

    aput-byte v7, v1, v5

    .line 93
    mul-int/lit8 v5, v3, 0x2

    add-int/lit8 v5, v5, 0x1

    sget-object v7, Lcom/jcraft/jsch/ChannelX11;->table:[B

    aget-byte v8, v2, v3

    and-int/lit8 v8, v8, 0xf

    aget-byte v7, v7, v8

    aput-byte v7, v1, v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 91
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 81
    .end local v1           #bar:[B
    .end local v3           #i:I
    :catchall_0
    move-exception v5

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v5

    .line 99
    .end local v2           #foo:[B
    .end local v4           #random:Lcom/jcraft/jsch/Random;
    :catchall_1
    move-exception v5

    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v5

    .line 95
    .restart local v1       #bar:[B
    .restart local v2       #foo:[B
    .restart local v3       #i:I
    .restart local v4       #random:Lcom/jcraft/jsch/Random;
    :cond_0
    :try_start_5
    sget-object v5, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_hex_pool:Ljava/util/Hashtable;

    invoke-virtual {v5, p0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    move-object v2, v1

    .line 98
    .end local v1           #bar:[B
    .end local v3           #i:I
    .end local v4           #random:Lcom/jcraft/jsch/Random;
    :cond_1
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    return-object v2
.end method

.method static removeFakedCookie(Lcom/jcraft/jsch/Session;)V
    .locals 2
    .parameter "session"

    .prologue
    .line 103
    sget-object v1, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_hex_pool:Ljava/util/Hashtable;

    monitor-enter v1

    .line 104
    :try_start_0
    sget-object v0, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_hex_pool:Ljava/util/Hashtable;

    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_pool:Ljava/util/Hashtable;

    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    monitor-exit v1

    .line 107
    return-void

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static revtable(B)I
    .locals 2
    .parameter "foo"

    .prologue
    .line 58
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget-object v1, Lcom/jcraft/jsch/ChannelX11;->table:[B

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 59
    sget-object v1, Lcom/jcraft/jsch/ChannelX11;->table:[B

    aget-byte v1, v1, v0

    if-ne v1, p0, :cond_0

    .line 61
    .end local v0           #i:I
    :goto_1
    return v0

    .line 58
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 61
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method static setCookie(Ljava/lang/String;)V
    .locals 6
    .parameter "foo"

    .prologue
    const/16 v5, 0x10

    .line 64
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    sput-object v1, Lcom/jcraft/jsch/ChannelX11;->cookie_hex:[B

    .line 65
    new-array v1, v5, [B

    sput-object v1, Lcom/jcraft/jsch/ChannelX11;->cookie:[B

    .line 66
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v5, :cond_0

    .line 67
    sget-object v1, Lcom/jcraft/jsch/ChannelX11;->cookie:[B

    sget-object v2, Lcom/jcraft/jsch/ChannelX11;->cookie_hex:[B

    mul-int/lit8 v3, v0, 0x2

    aget-byte v2, v2, v3

    invoke-static {v2}, Lcom/jcraft/jsch/ChannelX11;->revtable(B)I

    move-result v2

    shl-int/lit8 v2, v2, 0x4

    and-int/lit16 v2, v2, 0xf0

    sget-object v3, Lcom/jcraft/jsch/ChannelX11;->cookie_hex:[B

    mul-int/lit8 v4, v0, 0x2

    add-int/lit8 v4, v4, 0x1

    aget-byte v3, v3, v4

    invoke-static {v3}, Lcom/jcraft/jsch/ChannelX11;->revtable(B)I

    move-result v3

    and-int/lit8 v3, v3, 0xf

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 66
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 70
    :cond_0
    return-void
.end method

.method static setHost(Ljava/lang/String;)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 71
    sput-object p0, Lcom/jcraft/jsch/ChannelX11;->host:Ljava/lang/String;

    return-void
.end method

.method static setPort(I)V
    .locals 0
    .parameter "foo"

    .prologue
    .line 72
    sput p0, Lcom/jcraft/jsch/ChannelX11;->port:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 136
    :try_start_0
    sget-object v4, Lcom/jcraft/jsch/ChannelX11;->host:Ljava/lang/String;

    sget v5, Lcom/jcraft/jsch/ChannelX11;->port:I

    const/16 v6, 0x2710

    invoke-static {v4, v5, v6}, Lcom/jcraft/jsch/Util;->createSocket(Ljava/lang/String;II)Ljava/net/Socket;

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->socket:Ljava/net/Socket;

    .line 137
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->socket:Ljava/net/Socket;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 138
    new-instance v4, Lcom/jcraft/jsch/IO;

    invoke-direct {v4}, Lcom/jcraft/jsch/IO;-><init>()V

    iput-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    .line 139
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    iget-object v5, p0, Lcom/jcraft/jsch/ChannelX11;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 140
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    iget-object v5, p0, Lcom/jcraft/jsch/ChannelX11;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 141
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->sendOpenConfirmation()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->thread:Ljava/lang/Thread;

    .line 151
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    iget v4, p0, Lcom/jcraft/jsch/ChannelX11;->rmpsize:I

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 152
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    new-instance v3, Lcom/jcraft/jsch/Packet;

    invoke-direct {v3, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 153
    .local v3, packet:Lcom/jcraft/jsch/Packet;
    const/4 v2, 0x0

    .line 157
    .local v2, i:I
    :goto_0
    :try_start_1
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->thread:Ljava/lang/Thread;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    iget-object v4, v4, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v4, :cond_0

    .line 158
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    iget-object v4, v4, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    iget-object v5, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/16 v6, 0xe

    iget-object v7, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v7, v7

    add-int/lit8 v7, v7, -0xe

    add-int/lit8 v7, v7, -0x54

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 161
    if-gtz v2, :cond_1

    .line 162
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->eof()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 177
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->disconnect()V

    .line 178
    .end local v0           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v2           #i:I
    .end local v3           #packet:Lcom/jcraft/jsch/Packet;
    :goto_2
    return-void

    .line 143
    :catch_0
    move-exception v1

    .line 144
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {p0, v7}, Lcom/jcraft/jsch/ChannelX11;->sendOpenFailure(I)V

    .line 145
    iput-boolean v7, p0, Lcom/jcraft/jsch/ChannelX11;->close:Z

    .line 146
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->disconnect()V

    goto :goto_2

    .line 165
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v0       #buf:Lcom/jcraft/jsch/Buffer;
    .restart local v2       #i:I
    .restart local v3       #packet:Lcom/jcraft/jsch/Packet;
    :cond_1
    :try_start_2
    iget-boolean v4, p0, Lcom/jcraft/jsch/ChannelX11;->close:Z

    if-nez v4, :cond_0

    .line 166
    invoke-virtual {v3}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 167
    const/16 v4, 0x5e

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 168
    iget v4, p0, Lcom/jcraft/jsch/ChannelX11;->recipient:I

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 169
    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 170
    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 171
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v4

    invoke-virtual {v4, v3, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 174
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method write([BII)V
    .locals 13
    .parameter "foo"
    .parameter "s"
    .parameter "l"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const v11, 0xff00

    const/16 v9, 0x9

    const/4 v10, 0x0

    .line 193
    iget-boolean v7, p0, Lcom/jcraft/jsch/ChannelX11;->init:Z

    if-eqz v7, :cond_6

    .line 195
    const/4 v1, 0x0

    .line 197
    .local v1, _session:Lcom/jcraft/jsch/Session;
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->getSession()Lcom/jcraft/jsch/Session;
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 203
    invoke-direct/range {p0 .. p3}, Lcom/jcraft/jsch/ChannelX11;->addCache([BII)[B

    move-result-object p1

    .line 204
    const/4 p2, 0x0

    .line 205
    array-length v0, p1

    move/from16 p3, v0

    .line 207
    move/from16 v0, p3

    if-ge v0, v9, :cond_1

    .line 264
    .end local v1           #_session:Lcom/jcraft/jsch/Session;
    :cond_0
    :goto_0
    return-void

    .line 199
    .restart local v1       #_session:Lcom/jcraft/jsch/Session;
    :catch_0
    move-exception v4

    .line 200
    .local v4, e:Lcom/jcraft/jsch/JSchException;
    new-instance v7, Ljava/io/IOException;

    invoke-virtual {v4}, Lcom/jcraft/jsch/JSchException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 210
    .end local v4           #e:Lcom/jcraft/jsch/JSchException;
    :cond_1
    const/4 v7, 0x6

    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0xff

    mul-int/lit16 v7, v7, 0x100

    const/4 v8, 0x7

    aget-byte v8, p1, v8

    and-int/lit16 v8, v8, 0xff

    add-int v6, v7, v8

    .line 211
    .local v6, plen:I
    const/16 v7, 0x8

    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0xff

    mul-int/lit16 v7, v7, 0x100

    aget-byte v8, p1, v9

    and-int/lit16 v8, v8, 0xff

    add-int v3, v7, v8

    .line 213
    .local v3, dlen:I
    aget-byte v7, p1, p2

    and-int/lit16 v7, v7, 0xff

    const/16 v8, 0x42

    if-ne v7, v8, :cond_4

    .line 223
    :cond_2
    :goto_1
    add-int/lit8 v7, v6, 0xc

    neg-int v8, v6

    and-int/lit8 v8, v8, 0x3

    add-int/2addr v7, v8

    add-int/2addr v7, v3

    move/from16 v0, p3

    if-lt v0, v7, :cond_0

    .line 226
    new-array v2, v3, [B

    .line 227
    .local v2, bar:[B
    add-int/lit8 v7, v6, 0xc

    neg-int v8, v6

    and-int/lit8 v8, v8, 0x3

    add-int/2addr v7, v8

    invoke-static {p1, v7, v2, v10, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 228
    const/4 v5, 0x0

    .line 230
    .local v5, faked_cookie:[B
    sget-object v8, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_pool:Ljava/util/Hashtable;

    monitor-enter v8

    .line 231
    :try_start_1
    sget-object v7, Lcom/jcraft/jsch/ChannelX11;->faked_cookie_pool:Ljava/util/Hashtable;

    invoke-virtual {v7, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    move-object v0, v7

    check-cast v0, [B

    move-object v5, v0

    .line 232
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 247
    invoke-static {v2, v5}, Lcom/jcraft/jsch/ChannelX11;->equals([B[B)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 248
    sget-object v7, Lcom/jcraft/jsch/ChannelX11;->cookie:[B

    if-eqz v7, :cond_3

    .line 249
    sget-object v7, Lcom/jcraft/jsch/ChannelX11;->cookie:[B

    add-int/lit8 v8, v6, 0xc

    neg-int v9, v6

    and-int/lit8 v9, v9, 0x3

    add-int/2addr v8, v9

    invoke-static {v7, v10, p1, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 258
    :cond_3
    :goto_2
    iput-boolean v10, p0, Lcom/jcraft/jsch/ChannelX11;->init:Z

    .line 259
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    move/from16 v0, p3

    invoke-virtual {v7, p1, p2, v0}, Lcom/jcraft/jsch/IO;->put([BII)V

    .line 260
    iput-object v12, p0, Lcom/jcraft/jsch/ChannelX11;->cache:[B

    goto :goto_0

    .line 215
    .end local v2           #bar:[B
    .end local v5           #faked_cookie:[B
    :cond_4
    aget-byte v7, p1, p2

    and-int/lit16 v7, v7, 0xff

    const/16 v8, 0x6c

    if-ne v7, v8, :cond_2

    .line 216
    ushr-int/lit8 v7, v6, 0x8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v8, v6, 0x8

    and-int/2addr v8, v11

    or-int v6, v7, v8

    .line 217
    ushr-int/lit8 v7, v3, 0x8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v8, v3, 0x8

    and-int/2addr v8, v11

    or-int v3, v7, v8

    goto :goto_1

    .line 232
    .restart local v2       #bar:[B
    .restart local v5       #faked_cookie:[B
    :catchall_0
    move-exception v7

    :try_start_2
    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7

    .line 253
    :cond_5
    iput-object v12, p0, Lcom/jcraft/jsch/ChannelX11;->thread:Ljava/lang/Thread;

    .line 254
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->eof()V

    .line 255
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v7}, Lcom/jcraft/jsch/IO;->close()V

    .line 256
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelX11;->disconnect()V

    goto :goto_2

    .line 263
    .end local v1           #_session:Lcom/jcraft/jsch/Session;
    .end local v2           #bar:[B
    .end local v3           #dlen:I
    .end local v5           #faked_cookie:[B
    .end local v6           #plen:I
    :cond_6
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelX11;->io:Lcom/jcraft/jsch/IO;

    move/from16 v0, p3

    invoke-virtual {v7, p1, p2, v0}, Lcom/jcraft/jsch/IO;->put([BII)V

    goto/16 :goto_0
.end method
