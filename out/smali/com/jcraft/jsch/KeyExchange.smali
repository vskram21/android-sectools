.class public abstract Lcom/jcraft/jsch/KeyExchange;
.super Ljava/lang/Object;
.source "KeyExchange.java"


# static fields
.field static final PROPOSAL_COMP_ALGS_CTOS:I = 0x6

.field static final PROPOSAL_COMP_ALGS_STOC:I = 0x7

.field static final PROPOSAL_ENC_ALGS_CTOS:I = 0x2

.field static final PROPOSAL_ENC_ALGS_STOC:I = 0x3

.field static final PROPOSAL_KEX_ALGS:I = 0x0

.field static final PROPOSAL_LANG_CTOS:I = 0x8

.field static final PROPOSAL_LANG_STOC:I = 0x9

.field static final PROPOSAL_MAC_ALGS_CTOS:I = 0x4

.field static final PROPOSAL_MAC_ALGS_STOC:I = 0x5

.field static final PROPOSAL_MAX:I = 0xa

.field static final PROPOSAL_SERVER_HOST_KEY_ALGS:I = 0x1

.field public static final STATE_END:I

.field static enc_c2s:Ljava/lang/String;

.field static enc_s2c:Ljava/lang/String;

.field static kex:Ljava/lang/String;

.field static lang_c2s:Ljava/lang/String;

.field static lang_s2c:Ljava/lang/String;

.field static mac_c2s:Ljava/lang/String;

.field static mac_s2c:Ljava/lang/String;

.field static server_host_key:Ljava/lang/String;


# instance fields
.field protected H:[B

.field protected K:[B

.field protected K_S:[B

.field protected session:Lcom/jcraft/jsch/Session;

.field protected sha:Lcom/jcraft/jsch/HASH;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-string v0, "diffie-hellman-group1-sha1"

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->kex:Ljava/lang/String;

    .line 51
    const-string v0, "ssh-rsa,ssh-dss"

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->server_host_key:Ljava/lang/String;

    .line 52
    const-string v0, "blowfish-cbc"

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->enc_c2s:Ljava/lang/String;

    .line 53
    const-string v0, "blowfish-cbc"

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->enc_s2c:Ljava/lang/String;

    .line 54
    const-string v0, "hmac-md5"

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->mac_c2s:Ljava/lang/String;

    .line 56
    const-string v0, "hmac-md5"

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->mac_s2c:Ljava/lang/String;

    .line 59
    const-string v0, ""

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->lang_c2s:Ljava/lang/String;

    .line 60
    const-string v0, ""

    sput-object v0, Lcom/jcraft/jsch/KeyExchange;->lang_s2c:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->session:Lcom/jcraft/jsch/Session;

    .line 65
    iput-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->sha:Lcom/jcraft/jsch/HASH;

    .line 66
    iput-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->K:[B

    .line 67
    iput-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->H:[B

    .line 68
    iput-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->K_S:[B

    return-void
.end method

.method protected static guess([B[B)[Ljava/lang/String;
    .locals 16
    .parameter "I_S"
    .parameter "I_C"

    .prologue
    .line 88
    const/16 v12, 0xa

    new-array v4, v12, [Ljava/lang/String;

    .line 89
    .local v4, guess:[Ljava/lang/String;
    new-instance v10, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .local v10, sb:Lcom/jcraft/jsch/Buffer;
    const/16 v12, 0x11

    invoke-virtual {v10, v12}, Lcom/jcraft/jsch/Buffer;->setOffSet(I)V

    .line 90
    new-instance v2, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p1

    invoke-direct {v2, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .local v2, cb:Lcom/jcraft/jsch/Buffer;
    const/16 v12, 0x11

    invoke-virtual {v2, v12}, Lcom/jcraft/jsch/Buffer;->setOffSet(I)V

    .line 92
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v12

    const/4 v13, 0x1

    invoke-interface {v12, v13}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 93
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    const/16 v12, 0xa

    if-ge v5, v12, :cond_0

    .line 94
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v12

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "kex: server: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v15

    invoke-static {v15}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 93
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 97
    :cond_0
    const/4 v5, 0x0

    :goto_1
    const/16 v12, 0xa

    if-ge v5, v12, :cond_1

    .line 98
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v12

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "kex: client: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v15

    invoke-static {v15}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 97
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 101
    :cond_1
    const/16 v12, 0x11

    invoke-virtual {v10, v12}, Lcom/jcraft/jsch/Buffer;->setOffSet(I)V

    .line 102
    const/16 v12, 0x11

    invoke-virtual {v2, v12}, Lcom/jcraft/jsch/Buffer;->setOffSet(I)V

    .line 105
    .end local v5           #i:I
    :cond_2
    const/4 v5, 0x0

    .restart local v5       #i:I
    :goto_2
    const/16 v12, 0xa

    if-ge v5, v12, :cond_d

    .line 106
    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v11

    .line 107
    .local v11, sp:[B
    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v3

    .line 108
    .local v3, cp:[B
    const/4 v6, 0x0

    .line 109
    .local v6, j:I
    const/4 v7, 0x0

    .line 112
    .local v7, k:I
    :goto_3
    array-length v12, v3

    if-ge v6, v12, :cond_8

    .line 113
    :goto_4
    array-length v12, v3

    if-ge v6, v12, :cond_3

    aget-byte v12, v3, v6

    const/16 v13, 0x2c

    if-eq v12, v13, :cond_3

    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 114
    :cond_3
    if-ne v7, v6, :cond_5

    const/4 v4, 0x0

    .line 152
    .end local v3           #cp:[B
    .end local v4           #guess:[Ljava/lang/String;
    .end local v6           #j:I
    .end local v7           #k:I
    .end local v11           #sp:[B
    :cond_4
    :goto_5
    return-object v4

    .line 115
    .restart local v3       #cp:[B
    .restart local v4       #guess:[Ljava/lang/String;
    .restart local v6       #j:I
    .restart local v7       #k:I
    .restart local v11       #sp:[B
    :cond_5
    sub-int v12, v6, v7

    invoke-static {v3, v7, v12}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, algorithm:Ljava/lang/String;
    const/4 v8, 0x0

    .line 117
    .local v8, l:I
    const/4 v9, 0x0

    .line 118
    .local v9, m:I
    :goto_6
    array-length v12, v11

    if-ge v8, v12, :cond_b

    .line 119
    :goto_7
    array-length v12, v11

    if-ge v8, v12, :cond_6

    aget-byte v12, v11, v8

    const/16 v13, 0x2c

    if-eq v12, v13, :cond_6

    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 120
    :cond_6
    if-ne v9, v8, :cond_7

    const/4 v4, 0x0

    goto :goto_5

    .line 121
    :cond_7
    sub-int v12, v8, v9

    invoke-static {v11, v9, v12}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 122
    aput-object v1, v4, v5

    .line 131
    .end local v1           #algorithm:Ljava/lang/String;
    .end local v8           #l:I
    .end local v9           #m:I
    :cond_8
    if-nez v6, :cond_c

    .line 132
    const-string v12, ""

    aput-object v12, v4, v5

    .line 105
    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 125
    .restart local v1       #algorithm:Ljava/lang/String;
    .restart local v8       #l:I
    .restart local v9       #m:I
    :cond_a
    add-int/lit8 v8, v8, 0x1

    .line 126
    move v9, v8

    goto :goto_6

    .line 128
    :cond_b
    add-int/lit8 v6, v6, 0x1

    .line 129
    move v7, v6

    .line 130
    goto :goto_3

    .line 134
    .end local v1           #algorithm:Ljava/lang/String;
    .end local v8           #l:I
    .end local v9           #m:I
    :cond_c
    aget-object v12, v4, v5

    if-nez v12, :cond_9

    .line 135
    const/4 v4, 0x0

    goto :goto_5

    .line 139
    .end local v3           #cp:[B
    .end local v6           #j:I
    .end local v7           #k:I
    .end local v11           #sp:[B
    :cond_d
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v12

    const/4 v13, 0x1

    invoke-interface {v12, v13}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 140
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v12

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "kex: server->client "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x3

    aget-object v15, v4, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x5

    aget-object v15, v4, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x7

    aget-object v15, v4, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 145
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v12

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "kex: client->server "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x2

    aget-object v15, v4, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x4

    aget-object v15, v4, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x6

    aget-object v15, v4, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v13, v14}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_5
.end method


# virtual methods
.method public getFingerPrint()Ljava/lang/String;
    .locals 7

    .prologue
    .line 156
    const/4 v3, 0x0

    .line 158
    .local v3, hash:Lcom/jcraft/jsch/HASH;
    :try_start_0
    iget-object v4, p0, Lcom/jcraft/jsch/KeyExchange;->session:Lcom/jcraft/jsch/Session;

    const-string v5, "md5"

    invoke-virtual {v4, v5}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 159
    .local v1, c:Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/HASH;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/HASH;

    move-object v3, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .end local v1           #c:Ljava/lang/Class;
    :goto_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyExchange;->getHostKey()[B

    move-result-object v4

    invoke-static {v3, v4}, Lcom/jcraft/jsch/Util;->getFingerPrint(Lcom/jcraft/jsch/HASH;[B)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 161
    :catch_0
    move-exception v2

    .local v2, e:Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getFingerPrint: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method getH()[B
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->H:[B

    return-object v0
.end method

.method getHash()Lcom/jcraft/jsch/HASH;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->sha:Lcom/jcraft/jsch/HASH;

    return-object v0
.end method

.method getHostKey()[B
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->K_S:[B

    return-object v0
.end method

.method getK()[B
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/jcraft/jsch/KeyExchange;->K:[B

    return-object v0
.end method

.method public abstract getKeyType()Ljava/lang/String;
.end method

.method public abstract getState()I
.end method

.method public abstract init(Lcom/jcraft/jsch/Session;[B[B[B[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract next(Lcom/jcraft/jsch/Buffer;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected normalize([B)[B
    .locals 4
    .parameter "secret"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 175
    array-length v1, p1

    if-le v1, v2, :cond_0

    aget-byte v1, p1, v3

    if-nez v1, :cond_0

    aget-byte v1, p1, v2

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_0

    .line 177
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    new-array v0, v1, [B

    .line 178
    .local v0, tmp:[B
    array-length v1, v0

    invoke-static {p1, v2, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 179
    move-object p1, v0

    .line 181
    .end local v0           #tmp:[B
    :cond_0
    return-object p1
.end method
