.class public Lcom/jcraft/jsch/DHG1;
.super Lcom/jcraft/jsch/KeyExchange;
.source "DHG1.java"


# static fields
.field static final DSS:I = 0x1

.field static final RSA:I = 0x0

.field private static final SSH_MSG_KEXDH_INIT:I = 0x1e

.field private static final SSH_MSG_KEXDH_REPLY:I = 0x1f

.field static final g:[B

.field static final p:[B


# instance fields
.field I_C:[B

.field I_S:[B

.field V_C:[B

.field V_S:[B

.field private buf:Lcom/jcraft/jsch/Buffer;

.field dh:Lcom/jcraft/jsch/DH;

.field e:[B

.field private packet:Lcom/jcraft/jsch/Packet;

.field private state:I

.field private type:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 34
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/4 v2, 0x2

    aput-byte v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/DHG1;->g:[B

    .line 35
    const/16 v0, 0x81

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/jcraft/jsch/DHG1;->p:[B

    return-void

    nop

    :array_0
    .array-data 0x1
        0x0t
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
        0xc9t
        0xft
        0xdat
        0xa2t
        0x21t
        0x68t
        0xc2t
        0x34t
        0xc4t
        0xc6t
        0x62t
        0x8bt
        0x80t
        0xdct
        0x1ct
        0xd1t
        0x29t
        0x2t
        0x4et
        0x8t
        0x8at
        0x67t
        0xcct
        0x74t
        0x2t
        0xbt
        0xbet
        0xa6t
        0x3bt
        0x13t
        0x9bt
        0x22t
        0x51t
        0x4at
        0x8t
        0x79t
        0x8et
        0x34t
        0x4t
        0xddt
        0xeft
        0x95t
        0x19t
        0xb3t
        0xcdt
        0x3at
        0x43t
        0x1bt
        0x30t
        0x2bt
        0xat
        0x6dt
        0xf2t
        0x5ft
        0x14t
        0x37t
        0x4ft
        0xe1t
        0x35t
        0x6dt
        0x6dt
        0x51t
        0xc2t
        0x45t
        0xe4t
        0x85t
        0xb5t
        0x76t
        0x62t
        0x5et
        0x7et
        0xc6t
        0xf4t
        0x4ct
        0x42t
        0xe9t
        0xa6t
        0x37t
        0xedt
        0x6bt
        0xbt
        0xfft
        0x5ct
        0xb6t
        0xf4t
        0x6t
        0xb7t
        0xedt
        0xeet
        0x38t
        0x6bt
        0xfbt
        0x5at
        0x89t
        0x9ft
        0xa5t
        0xaet
        0x9ft
        0x24t
        0x11t
        0x7ct
        0x4bt
        0x1ft
        0xe6t
        0x49t
        0x28t
        0x66t
        0x51t
        0xect
        0xe6t
        0x53t
        0x81t
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
        0xfft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyExchange;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/DHG1;->type:I

    return-void
.end method


# virtual methods
.method public getKeyType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 305
    iget v0, p0, Lcom/jcraft/jsch/DHG1;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-string v0, "DSA"

    .line 306
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "RSA"

    goto :goto_0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 309
    iget v0, p0, Lcom/jcraft/jsch/DHG1;->state:I

    return v0
.end method

.method public init(Lcom/jcraft/jsch/Session;[B[B[B[B)V
    .locals 5
    .parameter "session"
    .parameter "V_S"
    .parameter "V_C"
    .parameter "I_S"
    .parameter "I_C"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 84
    iput-object p1, p0, Lcom/jcraft/jsch/DHG1;->session:Lcom/jcraft/jsch/Session;

    .line 85
    iput-object p2, p0, Lcom/jcraft/jsch/DHG1;->V_S:[B

    .line 86
    iput-object p3, p0, Lcom/jcraft/jsch/DHG1;->V_C:[B

    .line 87
    iput-object p4, p0, Lcom/jcraft/jsch/DHG1;->I_S:[B

    .line 88
    iput-object p5, p0, Lcom/jcraft/jsch/DHG1;->I_C:[B

    .line 93
    :try_start_0
    const-string v2, "sha-1"

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 94
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/HASH;

    check-cast v2, Lcom/jcraft/jsch/HASH;

    iput-object v2, p0, Lcom/jcraft/jsch/DHG1;->sha:Lcom/jcraft/jsch/HASH;

    .line 95
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->sha:Lcom/jcraft/jsch/HASH;

    invoke-interface {v2}, Lcom/jcraft/jsch/HASH;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .end local v0           #c:Ljava/lang/Class;
    :goto_0
    new-instance v2, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v2}, Lcom/jcraft/jsch/Buffer;-><init>()V

    iput-object v2, p0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    .line 102
    new-instance v2, Lcom/jcraft/jsch/Packet;

    iget-object v3, p0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v2, p0, Lcom/jcraft/jsch/DHG1;->packet:Lcom/jcraft/jsch/Packet;

    .line 105
    :try_start_1
    const-string v2, "dh"

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 106
    .restart local v0       #c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/DH;

    check-cast v2, Lcom/jcraft/jsch/DH;

    iput-object v2, p0, Lcom/jcraft/jsch/DHG1;->dh:Lcom/jcraft/jsch/DH;

    .line 107
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->dh:Lcom/jcraft/jsch/DH;

    invoke-interface {v2}, Lcom/jcraft/jsch/DH;->init()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 114
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->dh:Lcom/jcraft/jsch/DH;

    sget-object v3, Lcom/jcraft/jsch/DHG1;->p:[B

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/DH;->setP([B)V

    .line 115
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->dh:Lcom/jcraft/jsch/DH;

    sget-object v3, Lcom/jcraft/jsch/DHG1;->g:[B

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/DH;->setG([B)V

    .line 122
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->dh:Lcom/jcraft/jsch/DH;

    invoke-interface {v2}, Lcom/jcraft/jsch/DH;->getE()[B

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/DHG1;->e:[B

    .line 124
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 125
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v3, 0x1e

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 126
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/DHG1;->e:[B

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 127
    iget-object v2, p0, Lcom/jcraft/jsch/DHG1;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 129
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    invoke-interface {v2, v4}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const-string v3, "SSH_MSG_KEXDH_INIT sent"

    invoke-interface {v2, v4, v3}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 132
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const-string v3, "expecting SSH_MSG_KEXDH_REPLY"

    invoke-interface {v2, v4, v3}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 136
    :cond_0
    const/16 v2, 0x1f

    iput v2, p0, Lcom/jcraft/jsch/DHG1;->state:I

    .line 137
    return-void

    .line 97
    .end local v0           #c:Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 98
    .local v1, e:Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0

    .line 109
    .end local v1           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 111
    .restart local v1       #e:Ljava/lang/Exception;
    throw v1
.end method

.method public next(Lcom/jcraft/jsch/Buffer;)Z
    .locals 24
    .parameter "_buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 142
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/DHG1;->state:I

    move/from16 v20, v0

    packed-switch v20, :pswitch_data_0

    .line 301
    const/16 v16, 0x0

    :goto_0
    return v16

    .line 149
    :pswitch_0
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v12

    .line 150
    .local v12, j:I
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v12

    .line 151
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v12

    .line 152
    const/16 v20, 0x1f

    move/from16 v0, v20

    if-eq v12, v0, :cond_0

    .line 153
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "type: must be 31 "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 154
    const/16 v16, 0x0

    goto :goto_0

    .line 157
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHG1;->K_S:[B

    .line 165
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getMPInt()[B

    move-result-object v7

    .line 166
    .local v7, f:[B
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v18

    .line 175
    .local v18, sig_of_H:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v7}, Lcom/jcraft/jsch/DH;->setF([B)V

    .line 176
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/jcraft/jsch/DH;->getK()[B

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/DHG1;->normalize([B)[B

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHG1;->K:[B

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->V_C:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->V_S:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->I_C:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->I_S:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->e:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v20

    move/from16 v0, v20

    new-array v8, v0, [B

    .line 197
    .local v8, foo:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->sha:Lcom/jcraft/jsch/HASH;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    array-length v0, v8

    move/from16 v22, v0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-interface {v0, v8, v1, v2}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->sha:Lcom/jcraft/jsch/HASH;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHG1;->H:[B

    .line 202
    const/4 v10, 0x0

    .line 203
    .local v10, i:I
    const/4 v12, 0x0

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .local v11, i:I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x100

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-static {v0, v10, v12}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    .line 207
    .local v3, alg:Ljava/lang/String;
    add-int/lit8 v10, v12, 0x4

    .line 209
    const/16 v16, 0x0

    .line 211
    .local v16, result:Z
    const-string v20, "ssh-rsa"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 216
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHG1;->type:I

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x100

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 220
    new-array v0, v12, [B

    move-object/from16 v19, v0

    .local v19, tmp:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 221
    move-object/from16 v6, v19

    .line 222
    .local v6, ee:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x100

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 224
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 225
    move-object/from16 v13, v19

    .line 230
    .local v13, n:[B
    const/16 v17, 0x0

    .line 232
    .local v17, sig:Lcom/jcraft/jsch/SignatureRSA;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->session:Lcom/jcraft/jsch/Session;

    move-object/from16 v20, v0

    const-string v21, "signature.rsa"

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 233
    .local v4, c:Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/jcraft/jsch/SignatureRSA;

    move-object/from16 v0, v20

    check-cast v0, Lcom/jcraft/jsch/SignatureRSA;

    move-object/from16 v17, v0

    .line 234
    invoke-interface/range {v17 .. v17}, Lcom/jcraft/jsch/SignatureRSA;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    .end local v4           #c:Ljava/lang/Class;
    :goto_1
    move-object/from16 v0, v17

    invoke-interface {v0, v6, v13}, Lcom/jcraft/jsch/SignatureRSA;->setPubKey([B[B)V

    .line 241
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->H:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/SignatureRSA;->update([B)V

    .line 242
    invoke-interface/range {v17 .. v18}, Lcom/jcraft/jsch/SignatureRSA;->verify([B)Z

    move-result v16

    .line 244
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    invoke-interface/range {v20 .. v21}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 245
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ssh_rsa_verify: signature "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-interface/range {v20 .. v22}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 298
    .end local v6           #ee:[B
    .end local v13           #n:[B
    .end local v17           #sig:Lcom/jcraft/jsch/SignatureRSA;
    .end local v19           #tmp:[B
    :cond_1
    :goto_2
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHG1;->state:I

    goto/16 :goto_0

    .line 236
    .restart local v6       #ee:[B
    .restart local v13       #n:[B
    .restart local v17       #sig:Lcom/jcraft/jsch/SignatureRSA;
    .restart local v19       #tmp:[B
    :catch_0
    move-exception v5

    .line 237
    .local v5, e:Ljava/lang/Exception;
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_1

    .line 250
    .end local v5           #e:Ljava/lang/Exception;
    .end local v6           #ee:[B
    .end local v13           #n:[B
    .end local v17           #sig:Lcom/jcraft/jsch/SignatureRSA;
    .end local v19           #tmp:[B
    :cond_2
    const-string v20, "ssh-dss"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 251
    const/4 v15, 0x0

    .line 256
    .local v15, q:[B
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHG1;->type:I

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x100

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 260
    new-array v0, v12, [B

    move-object/from16 v19, v0

    .restart local v19       #tmp:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 261
    move-object/from16 v14, v19

    .line 262
    .local v14, p:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x100

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 264
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 265
    move-object/from16 v15, v19

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x100

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 268
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 269
    move-object/from16 v9, v19

    .line 270
    .local v9, g:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x100

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10           #i:I
    .restart local v11       #i:I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11           #i:I
    .restart local v10       #i:I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 272
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 273
    move-object/from16 v7, v19

    .line 276
    const/16 v17, 0x0

    .line 278
    .local v17, sig:Lcom/jcraft/jsch/SignatureDSA;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->session:Lcom/jcraft/jsch/Session;

    move-object/from16 v20, v0

    const-string v21, "signature.dss"

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 279
    .restart local v4       #c:Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/jcraft/jsch/SignatureDSA;

    move-object/from16 v0, v20

    check-cast v0, Lcom/jcraft/jsch/SignatureDSA;

    move-object/from16 v17, v0

    .line 280
    invoke-interface/range {v17 .. v17}, Lcom/jcraft/jsch/SignatureDSA;->init()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 285
    .end local v4           #c:Ljava/lang/Class;
    :goto_3
    move-object/from16 v0, v17

    invoke-interface {v0, v7, v14, v15, v9}, Lcom/jcraft/jsch/SignatureDSA;->setPubKey([B[B[B[B)V

    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG1;->H:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/SignatureDSA;->update([B)V

    .line 287
    invoke-interface/range {v17 .. v18}, Lcom/jcraft/jsch/SignatureDSA;->verify([B)Z

    move-result v16

    .line 289
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    invoke-interface/range {v20 .. v21}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 290
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ssh_dss_verify: signature "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-interface/range {v20 .. v22}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_2

    .line 282
    :catch_1
    move-exception v5

    .line 283
    .restart local v5       #e:Ljava/lang/Exception;
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_3

    .line 296
    .end local v5           #e:Ljava/lang/Exception;
    .end local v9           #g:[B
    .end local v14           #p:[B
    .end local v15           #q:[B
    .end local v17           #sig:Lcom/jcraft/jsch/SignatureDSA;
    .end local v19           #tmp:[B
    :cond_3
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v21, "unknown alg"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x1f
        :pswitch_0
    .end packed-switch
.end method
