.class public Lcom/jcraft/jsch/ProxySOCKS5;
.super Ljava/lang/Object;
.source "ProxySOCKS5.java"

# interfaces
.implements Lcom/jcraft/jsch/Proxy;


# static fields
.field private static DEFAULTPORT:I


# instance fields
.field private in:Ljava/io/InputStream;

.field private out:Ljava/io/OutputStream;

.field private passwd:Ljava/lang/String;

.field private proxy_host:Ljava/lang/String;

.field private proxy_port:I

.field private socket:Ljava/net/Socket;

.field private user:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const/16 v0, 0x438

    sput v0, Lcom/jcraft/jsch/ProxySOCKS5;->DEFAULTPORT:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .parameter "proxy_host"

    .prologue
    const/16 v2, 0x3a

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    sget v1, Lcom/jcraft/jsch/ProxySOCKS5;->DEFAULTPORT:I

    .line 53
    .local v1, port:I
    move-object v0, p1

    .line 54
    .local v0, host:Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 56
    const/4 v2, 0x0

    const/16 v3, 0x3a

    :try_start_0
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 57
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 62
    :cond_0
    :goto_0
    iput-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_host:Ljava/lang/String;

    .line 63
    iput v1, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_port:I

    .line 64
    return-void

    .line 59
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter "proxy_host"
    .parameter "proxy_port"

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_host:Ljava/lang/String;

    .line 67
    iput p2, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_port:I

    .line 68
    return-void
.end method

.method private fill(Ljava/io/InputStream;[BI)V
    .locals 4
    .parameter "in"
    .parameter "buf"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 340
    const/4 v1, 0x0

    .line 341
    .local v1, s:I
    :goto_0
    if-ge v1, p3, :cond_1

    .line 342
    sub-int v2, p3, v1

    invoke-virtual {p1, p2, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 343
    .local v0, i:I
    if-gtz v0, :cond_0

    .line 344
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "ProxySOCKS5: stream is closed"

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 346
    :cond_0
    add-int/2addr v1, v0

    .line 347
    goto :goto_0

    .line 348
    .end local v0           #i:I
    :cond_1
    return-void
.end method

.method public static getDefaultPort()I
    .locals 1

    .prologue
    .line 337
    sget v0, Lcom/jcraft/jsch/ProxySOCKS5;->DEFAULTPORT:I

    return v0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 326
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 328
    :cond_1
    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 332
    :cond_2
    :goto_0
    iput-object v1, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    .line 333
    iput-object v1, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    .line 334
    iput-object v1, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    .line 335
    return-void

    .line 330
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public connect(Lcom/jcraft/jsch/SocketFactory;Ljava/lang/String;II)V
    .locals 11
    .parameter "socket_factory"
    .parameter "host"
    .parameter "port"
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 75
    if-nez p1, :cond_2

    .line 76
    :try_start_0
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_host:Ljava/lang/String;

    iget v9, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_port:I

    invoke-static {v8, v9, p4}, Lcom/jcraft/jsch/Util;->createSocket(Ljava/lang/String;II)Ljava/net/Socket;

    move-result-object v8

    iput-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    .line 78
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    iput-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    .line 79
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    iput-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    .line 86
    :goto_0
    if-lez p4, :cond_0

    .line 87
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-virtual {v8, p4}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 89
    :cond_0
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 91
    const/16 v8, 0x400

    new-array v0, v8, [B

    .line 92
    .local v0, buf:[B
    const/4 v4, 0x0

    .line 115
    .local v4, index:I
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .local v5, index:I
    const/4 v8, 0x5

    aput-byte v8, v0, v4

    .line 117
    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    const/4 v8, 0x2

    aput-byte v8, v0, v5

    .line 118
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    const/4 v8, 0x0

    aput-byte v8, v0, v4

    .line 119
    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    const/4 v8, 0x2

    aput-byte v8, v0, v5

    .line 121
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 134
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    const/4 v9, 0x2

    invoke-direct {p0, v8, v0, v9}, Lcom/jcraft/jsch/ProxySOCKS5;->fill(Ljava/io/InputStream;[BI)V

    .line 136
    const/4 v1, 0x0

    .line 137
    .local v1, check:Z
    const/4 v8, 0x1

    aget-byte v8, v0, v8
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    and-int/lit16 v8, v8, 0xff

    packed-switch v8, :pswitch_data_0

    .line 196
    :cond_1
    :goto_1
    :pswitch_0
    if-nez v1, :cond_4

    .line 197
    :try_start_1
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 200
    :goto_2
    :try_start_2
    new-instance v8, Lcom/jcraft/jsch/JSchException;

    const-string v9, "fail in SOCKS5 proxy"

    invoke-direct {v8, v9}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 308
    .end local v0           #buf:[B
    .end local v1           #check:Z
    .end local v4           #index:I
    :catch_0
    move-exception v2

    .line 309
    .local v2, e:Ljava/lang/RuntimeException;
    throw v2

    .line 82
    .end local v2           #e:Ljava/lang/RuntimeException;
    :cond_2
    :try_start_3
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_host:Ljava/lang/String;

    iget v9, p0, Lcom/jcraft/jsch/ProxySOCKS5;->proxy_port:I

    invoke-interface {p1, v8, v9}, Lcom/jcraft/jsch/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v8

    iput-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    .line 83
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-interface {p1, v8}, Lcom/jcraft/jsch/SocketFactory;->getInputStream(Ljava/net/Socket;)Ljava/io/InputStream;

    move-result-object v8

    iput-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    .line 84
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-interface {p1, v8}, Lcom/jcraft/jsch/SocketFactory;->getOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;

    move-result-object v8

    iput-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 311
    :catch_1
    move-exception v2

    .line 312
    .local v2, e:Ljava/lang/Exception;
    :try_start_4
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 315
    :cond_3
    :goto_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ProxySOCKS5: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 316
    .local v7, message:Ljava/lang/String;
    instance-of v8, v2, Ljava/lang/Throwable;

    if-eqz v8, :cond_6

    .line 317
    new-instance v8, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v8, v7, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 139
    .end local v2           #e:Ljava/lang/Exception;
    .end local v7           #message:Ljava/lang/String;
    .restart local v0       #buf:[B
    .restart local v1       #check:Z
    .restart local v4       #index:I
    :pswitch_1
    const/4 v1, 0x1

    .line 140
    goto :goto_1

    .line 142
    :pswitch_2
    :try_start_5
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->user:Ljava/lang/String;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->passwd:Ljava/lang/String;

    if-eqz v8, :cond_1

    .line 163
    const/4 v4, 0x0

    .line 164
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    const/4 v8, 0x1

    aput-byte v8, v0, v4

    .line 165
    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->user:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    int-to-byte v8, v8

    aput-byte v8, v0, v5

    .line 166
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->user:Ljava/lang/String;

    invoke-static {v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/jcraft/jsch/ProxySOCKS5;->user:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-static {v8, v9, v0, v4, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->user:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v4, v8, 0x2

    .line 168
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->passwd:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    int-to-byte v8, v8

    aput-byte v8, v0, v4

    .line 169
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->passwd:Ljava/lang/String;

    invoke-static {v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/jcraft/jsch/ProxySOCKS5;->passwd:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-static {v8, v9, v0, v5, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->passwd:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int v4, v5, v8

    .line 172
    .end local v5           #index:I
    .restart local v4       #index:I
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 189
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    const/4 v9, 0x2

    invoke-direct {p0, v8, v0, v9}, Lcom/jcraft/jsch/ProxySOCKS5;->fill(Ljava/io/InputStream;[BI)V

    .line 190
    const/4 v8, 0x1

    aget-byte v8, v0, v8

    if-nez v8, :cond_1

    .line 191
    const/4 v1, 0x1

    goto/16 :goto_1

    .line 229
    :cond_4
    const/4 v4, 0x0

    .line 230
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    const/4 v8, 0x5

    aput-byte v8, v0, v4

    .line 231
    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    const/4 v8, 0x1

    aput-byte v8, v0, v5

    .line 232
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    const/4 v8, 0x0

    aput-byte v8, v0, v4

    .line 234
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v3

    .line 235
    .local v3, hostb:[B
    array-length v6, v3

    .line 236
    .local v6, len:I
    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    const/4 v8, 0x3

    aput-byte v8, v0, v5

    .line 237
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    int-to-byte v8, v6

    aput-byte v8, v0, v4

    .line 238
    const/4 v8, 0x0

    invoke-static {v3, v8, v0, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 239
    add-int/lit8 v4, v6, 0x5

    .line 240
    .end local v5           #index:I
    .restart local v4       #index:I
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    ushr-int/lit8 v8, p3, 0x8

    int-to-byte v8, v8

    aput-byte v8, v0, v4

    .line 241
    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    and-int/lit16 v8, p3, 0xff

    int-to-byte v8, v8

    aput-byte v8, v0, v5

    .line 243
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 281
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    const/4 v9, 0x4

    invoke-direct {p0, v8, v0, v9}, Lcom/jcraft/jsch/ProxySOCKS5;->fill(Ljava/io/InputStream;[BI)V

    .line 283
    const/4 v8, 0x1

    aget-byte v8, v0, v8
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    if-eqz v8, :cond_5

    .line 284
    :try_start_6
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0

    .line 287
    :goto_4
    :try_start_7
    new-instance v8, Lcom/jcraft/jsch/JSchException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ProxySOCKS5: server returns "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x1

    aget-byte v10, v0, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 290
    :cond_5
    const/4 v8, 0x3

    aget-byte v8, v0, v8

    and-int/lit16 v8, v8, 0xff

    packed-switch v8, :pswitch_data_1

    .line 320
    :goto_5
    :pswitch_3
    return-void

    .line 293
    :pswitch_4
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    const/4 v9, 0x6

    invoke-direct {p0, v8, v0, v9}, Lcom/jcraft/jsch/ProxySOCKS5;->fill(Ljava/io/InputStream;[BI)V

    goto :goto_5

    .line 297
    :pswitch_5
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    const/4 v9, 0x1

    invoke-direct {p0, v8, v0, v9}, Lcom/jcraft/jsch/ProxySOCKS5;->fill(Ljava/io/InputStream;[BI)V

    .line 299
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    const/4 v9, 0x0

    aget-byte v9, v0, v9

    and-int/lit16 v9, v9, 0xff

    add-int/lit8 v9, v9, 0x2

    invoke-direct {p0, v8, v0, v9}, Lcom/jcraft/jsch/ProxySOCKS5;->fill(Ljava/io/InputStream;[BI)V

    goto :goto_5

    .line 303
    :pswitch_6
    iget-object v8, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    const/16 v9, 0x12

    invoke-direct {p0, v8, v0, v9}, Lcom/jcraft/jsch/ProxySOCKS5;->fill(Ljava/io/InputStream;[BI)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_5

    .line 318
    .end local v0           #buf:[B
    .end local v1           #check:Z
    .end local v3           #hostb:[B
    .end local v4           #index:I
    .end local v6           #len:I
    .restart local v2       #e:Ljava/lang/Exception;
    .restart local v7       #message:Ljava/lang/String;
    :cond_6
    new-instance v8, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v8, v7}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 313
    .end local v7           #message:Ljava/lang/String;
    :catch_2
    move-exception v8

    goto/16 :goto_3

    .line 285
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v0       #buf:[B
    .restart local v1       #check:Z
    .restart local v3       #hostb:[B
    .restart local v4       #index:I
    .restart local v6       #len:I
    :catch_3
    move-exception v8

    goto :goto_4

    .line 198
    .end local v3           #hostb:[B
    .end local v6           #len:I
    :catch_4
    move-exception v8

    goto/16 :goto_2

    .line 137
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 290
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 321
    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->in:Ljava/io/InputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->out:Ljava/io/OutputStream;

    return-object v0
.end method

.method public getSocket()Ljava/net/Socket;
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lcom/jcraft/jsch/ProxySOCKS5;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method public setUserPasswd(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "user"
    .parameter "passwd"

    .prologue
    .line 70
    iput-object p1, p0, Lcom/jcraft/jsch/ProxySOCKS5;->user:Ljava/lang/String;

    .line 71
    iput-object p2, p0, Lcom/jcraft/jsch/ProxySOCKS5;->passwd:Ljava/lang/String;

    .line 72
    return-void
.end method
