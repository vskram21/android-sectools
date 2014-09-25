.class public Lcom/jcraft/jsch/DHGEX;
.super Lcom/jcraft/jsch/KeyExchange;
.source "DHGEX.java"


# static fields
.field static final DSS:I = 0x1

.field static final RSA:I = 0x0

.field private static final SSH_MSG_KEX_DH_GEX_GROUP:I = 0x1f

.field private static final SSH_MSG_KEX_DH_GEX_INIT:I = 0x20

.field private static final SSH_MSG_KEX_DH_GEX_REPLY:I = 0x21

.field private static final SSH_MSG_KEX_DH_GEX_REQUEST:I = 0x22

.field static max:I

.field static min:I

.field static preferred:I


# instance fields
.field I_C:[B

.field I_S:[B

.field V_C:[B

.field V_S:[B

.field private buf:Lcom/jcraft/jsch/Buffer;

.field dh:Lcom/jcraft/jsch/DH;

.field private e:[B

.field private g:[B

.field private p:[B

.field private packet:Lcom/jcraft/jsch/Packet;

.field private state:I

.field private type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/16 v0, 0x400

    .line 39
    sput v0, Lcom/jcraft/jsch/DHGEX;->min:I

    .line 42
    sput v0, Lcom/jcraft/jsch/DHGEX;->preferred:I

    .line 43
    sput v0, Lcom/jcraft/jsch/DHGEX;->max:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyExchange;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/DHGEX;->type:I

    return-void
.end method


# virtual methods
.method public getKeyType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 335
    iget v0, p0, Lcom/jcraft/jsch/DHGEX;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-string v0, "DSA"

    .line 336
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "RSA"

    goto :goto_0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 339
    iget v0, p0, Lcom/jcraft/jsch/DHGEX;->state:I

    return v0
.end method

.method public init(Lcom/jcraft/jsch/Session;[B[B[B[B)V
    .locals 6
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
    const/4 v5, 0x1

    .line 72
    iput-object p1, p0, Lcom/jcraft/jsch/DHGEX;->session:Lcom/jcraft/jsch/Session;

    .line 73
    iput-object p2, p0, Lcom/jcraft/jsch/DHGEX;->V_S:[B

    .line 74
    iput-object p3, p0, Lcom/jcraft/jsch/DHGEX;->V_C:[B

    .line 75
    iput-object p4, p0, Lcom/jcraft/jsch/DHGEX;->I_S:[B

    .line 76
    iput-object p5, p0, Lcom/jcraft/jsch/DHGEX;->I_C:[B

    .line 79
    :try_start_0
    const-string v2, "sha-1"

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 80
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/HASH;

    check-cast v2, Lcom/jcraft/jsch/HASH;

    iput-object v2, p0, Lcom/jcraft/jsch/DHGEX;->sha:Lcom/jcraft/jsch/HASH;

    .line 81
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->sha:Lcom/jcraft/jsch/HASH;

    invoke-interface {v2}, Lcom/jcraft/jsch/HASH;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .end local v0           #c:Ljava/lang/Class;
    :goto_0
    new-instance v2, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v2}, Lcom/jcraft/jsch/Buffer;-><init>()V

    iput-object v2, p0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    .line 88
    new-instance v2, Lcom/jcraft/jsch/Packet;

    iget-object v3, p0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v2, p0, Lcom/jcraft/jsch/DHGEX;->packet:Lcom/jcraft/jsch/Packet;

    .line 91
    :try_start_1
    const-string v2, "dh"

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 92
    .restart local v0       #c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/DH;

    check-cast v2, Lcom/jcraft/jsch/DH;

    iput-object v2, p0, Lcom/jcraft/jsch/DHGEX;->dh:Lcom/jcraft/jsch/DH;

    .line 93
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->dh:Lcom/jcraft/jsch/DH;

    invoke-interface {v2}, Lcom/jcraft/jsch/DH;->init()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 100
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 101
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v3, 0x22

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 102
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    sget v3, Lcom/jcraft/jsch/DHGEX;->min:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 103
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    sget v3, Lcom/jcraft/jsch/DHGEX;->preferred:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 104
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    sget v3, Lcom/jcraft/jsch/DHGEX;->max:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 105
    iget-object v2, p0, Lcom/jcraft/jsch/DHGEX;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 107
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    invoke-interface {v2, v5}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 108
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SSH_MSG_KEX_DH_GEX_REQUEST("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/jcraft/jsch/DHGEX;->min:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/jcraft/jsch/DHGEX;->preferred:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/jcraft/jsch/DHGEX;->max:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") sent"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v5, v3}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 110
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const-string v3, "expecting SSH_MSG_KEX_DH_GEX_GROUP"

    invoke-interface {v2, v5, v3}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 114
    :cond_0
    const/16 v2, 0x1f

    iput v2, p0, Lcom/jcraft/jsch/DHGEX;->state:I

    .line 115
    return-void

    .line 83
    .end local v0           #c:Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 84
    .local v1, e:Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 95
    .end local v1           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 97
    .restart local v1       #e:Ljava/lang/Exception;
    throw v1
.end method

.method public next(Lcom/jcraft/jsch/Buffer;)Z
    .locals 22
    .parameter "_buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 119
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/DHGEX;->state:I

    move/from16 v18, v0

    packed-switch v18, :pswitch_data_0

    .line 331
    :pswitch_0
    const/4 v14, 0x0

    :goto_0
    return v14

    .line 124
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 125
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 126
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v11

    .line 127
    .local v11, j:I
    const/16 v18, 0x1f

    move/from16 v0, v18

    if-eq v11, v0, :cond_0

    .line 128
    sget-object v18, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "type: must be SSH_MSG_KEX_DH_GEX_GROUP "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 129
    const/4 v14, 0x0

    goto :goto_0

    .line 132
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getMPInt()[B

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->p:[B

    .line 133
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getMPInt()[B

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->g:[B

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->p:[B

    move-object/from16 v19, v0

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/DH;->setP([B)V

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->g:[B

    move-object/from16 v19, v0

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/DH;->setG([B)V

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/jcraft/jsch/DH;->getE()[B

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->e:[B

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    const/16 v19, 0x20

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 155
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->e:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->session:Lcom/jcraft/jsch/Session;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 158
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 159
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    const-string v20, "SSH_MSG_KEX_DH_GEX_INIT sent"

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 161
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    const-string v20, "expecting SSH_MSG_KEX_DH_GEX_REPLY"

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 165
    :cond_1
    const/16 v18, 0x21

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHGEX;->state:I

    .line 166
    const/4 v14, 0x1

    goto/16 :goto_0

    .line 175
    .end local v11           #j:I
    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v11

    .line 176
    .restart local v11       #j:I
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v11

    .line 177
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v11

    .line 178
    const/16 v18, 0x21

    move/from16 v0, v18

    if-eq v11, v0, :cond_2

    .line 179
    sget-object v18, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "type: must be SSH_MSG_KEX_DH_GEX_REPLY "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 180
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 183
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    .line 192
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getMPInt()[B

    move-result-object v7

    .line 193
    .local v7, f:[B
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v16

    .line 195
    .local v16, sig_of_H:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v7}, Lcom/jcraft/jsch/DH;->setF([B)V

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/jcraft/jsch/DH;->getK()[B

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/DHGEX;->normalize([B)[B

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->K:[B

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->V_C:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->V_S:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->I_C:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->I_S:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    sget v19, Lcom/jcraft/jsch/DHGEX;->min:I

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    sget v19, Lcom/jcraft/jsch/DHGEX;->preferred:I

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    sget v19, Lcom/jcraft/jsch/DHGEX;->max:I

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->p:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->g:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->e:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K:[B

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v18

    move/from16 v0, v18

    new-array v8, v0, [B

    .line 225
    .local v8, foo:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->sha:Lcom/jcraft/jsch/HASH;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    array-length v0, v8

    move/from16 v20, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v8, v1, v2}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->sha:Lcom/jcraft/jsch/HASH;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->H:[B

    .line 232
    const/4 v9, 0x0

    .line 233
    .local v9, i:I
    const/4 v11, 0x0

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .local v10, i:I
    aget-byte v18, v18, v9

    shl-int/lit8 v18, v18, 0x18

    const/high16 v19, -0x100

    and-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    shl-int/lit8 v19, v19, 0x10

    const/high16 v20, 0xff

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v19, v19, v9

    shl-int/lit8 v19, v19, 0x8

    const v20, 0xff00

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-static {v0, v9, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    .line 237
    .local v3, alg:Ljava/lang/String;
    add-int/lit8 v9, v11, 0x4

    .line 239
    const/4 v14, 0x0

    .line 240
    .local v14, result:Z
    const-string v18, "ssh-rsa"

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 245
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHGEX;->type:I

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v18, v18, v9

    shl-int/lit8 v18, v18, 0x18

    const/high16 v19, -0x100

    and-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    shl-int/lit8 v19, v19, 0x10

    const/high16 v20, 0xff

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v19, v19, v9

    shl-int/lit8 v19, v19, 0x8

    const v20, 0xff00

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 249
    new-array v0, v11, [B

    move-object/from16 v17, v0

    .local v17, tmp:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    invoke-static {v0, v9, v1, v2, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v9, v11

    .line 250
    move-object/from16 v6, v17

    .line 251
    .local v6, ee:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v18, v18, v9

    shl-int/lit8 v18, v18, 0x18

    const/high16 v19, -0x100

    and-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    shl-int/lit8 v19, v19, 0x10

    const/high16 v20, 0xff

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v19, v19, v9

    shl-int/lit8 v19, v19, 0x8

    const v20, 0xff00

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 253
    new-array v0, v11, [B

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    invoke-static {v0, v9, v1, v2, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v9, v11

    .line 254
    move-object/from16 v12, v17

    .line 259
    .local v12, n:[B
    const/4 v15, 0x0

    .line 261
    .local v15, sig:Lcom/jcraft/jsch/SignatureRSA;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->session:Lcom/jcraft/jsch/Session;

    move-object/from16 v18, v0

    const-string v19, "signature.rsa"

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 262
    .local v4, c:Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/jcraft/jsch/SignatureRSA;

    move-object/from16 v0, v18

    check-cast v0, Lcom/jcraft/jsch/SignatureRSA;

    move-object v15, v0

    .line 263
    invoke-interface {v15}, Lcom/jcraft/jsch/SignatureRSA;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    .end local v4           #c:Ljava/lang/Class;
    :goto_1
    invoke-interface {v15, v6, v12}, Lcom/jcraft/jsch/SignatureRSA;->setPubKey([B[B)V

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->H:[B

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v15, v0}, Lcom/jcraft/jsch/SignatureRSA;->update([B)V

    .line 271
    invoke-interface/range {v15 .. v16}, Lcom/jcraft/jsch/SignatureRSA;->verify([B)Z

    move-result v14

    .line 273
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 274
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "ssh_rsa_verify: signature "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 328
    .end local v6           #ee:[B
    .end local v12           #n:[B
    .end local v15           #sig:Lcom/jcraft/jsch/SignatureRSA;
    .end local v17           #tmp:[B
    :cond_3
    :goto_2
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHGEX;->state:I

    goto/16 :goto_0

    .line 265
    .restart local v6       #ee:[B
    .restart local v12       #n:[B
    .restart local v15       #sig:Lcom/jcraft/jsch/SignatureRSA;
    .restart local v17       #tmp:[B
    :catch_0
    move-exception v5

    .line 266
    .local v5, e:Ljava/lang/Exception;
    sget-object v18, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_1

    .line 279
    .end local v5           #e:Ljava/lang/Exception;
    .end local v6           #ee:[B
    .end local v12           #n:[B
    .end local v15           #sig:Lcom/jcraft/jsch/SignatureRSA;
    .end local v17           #tmp:[B
    :cond_4
    const-string v18, "ssh-dss"

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 280
    const/4 v13, 0x0

    .line 283
    .local v13, q:[B
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHGEX;->type:I

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v18, v18, v9

    shl-int/lit8 v18, v18, 0x18

    const/high16 v19, -0x100

    and-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    shl-int/lit8 v19, v19, 0x10

    const/high16 v20, 0xff

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v19, v19, v9

    shl-int/lit8 v19, v19, 0x8

    const v20, 0xff00

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 287
    new-array v0, v11, [B

    move-object/from16 v17, v0

    .restart local v17       #tmp:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    invoke-static {v0, v9, v1, v2, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v9, v11

    .line 288
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->p:[B

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v18, v18, v9

    shl-int/lit8 v18, v18, 0x18

    const/high16 v19, -0x100

    and-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    shl-int/lit8 v19, v19, 0x10

    const/high16 v20, 0xff

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v19, v19, v9

    shl-int/lit8 v19, v19, 0x8

    const v20, 0xff00

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 291
    new-array v0, v11, [B

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    invoke-static {v0, v9, v1, v2, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v9, v11

    .line 292
    move-object/from16 v13, v17

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v18, v18, v9

    shl-int/lit8 v18, v18, 0x18

    const/high16 v19, -0x100

    and-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    shl-int/lit8 v19, v19, 0x10

    const/high16 v20, 0xff

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v19, v19, v9

    shl-int/lit8 v19, v19, 0x8

    const v20, 0xff00

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 295
    new-array v0, v11, [B

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    invoke-static {v0, v9, v1, v2, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v9, v11

    .line 296
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHGEX;->g:[B

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v18, v18, v9

    shl-int/lit8 v18, v18, 0x18

    const/high16 v19, -0x100

    and-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    shl-int/lit8 v19, v19, 0x10

    const/high16 v20, 0xff

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v10, v9, 0x1

    .end local v9           #i:I
    .restart local v10       #i:I
    aget-byte v19, v19, v9

    shl-int/lit8 v19, v19, 0x8

    const v20, 0xff00

    and-int v19, v19, v20

    or-int v18, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v19, v0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #i:I
    .restart local v9       #i:I
    aget-byte v19, v19, v10

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 299
    new-array v0, v11, [B

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->K_S:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    invoke-static {v0, v9, v1, v2, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v9, v11

    .line 300
    move-object/from16 v7, v17

    .line 305
    const/4 v15, 0x0

    .line 307
    .local v15, sig:Lcom/jcraft/jsch/SignatureDSA;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->session:Lcom/jcraft/jsch/Session;

    move-object/from16 v18, v0

    const-string v19, "signature.dss"

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 308
    .restart local v4       #c:Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/jcraft/jsch/SignatureDSA;

    move-object/from16 v0, v18

    check-cast v0, Lcom/jcraft/jsch/SignatureDSA;

    move-object v15, v0

    .line 309
    invoke-interface {v15}, Lcom/jcraft/jsch/SignatureDSA;->init()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 315
    .end local v4           #c:Ljava/lang/Class;
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->p:[B

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->g:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v15, v7, v0, v13, v1}, Lcom/jcraft/jsch/SignatureDSA;->setPubKey([B[B[B[B)V

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHGEX;->H:[B

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v15, v0}, Lcom/jcraft/jsch/SignatureDSA;->update([B)V

    .line 317
    invoke-interface/range {v15 .. v16}, Lcom/jcraft/jsch/SignatureDSA;->verify([B)Z

    move-result v14

    .line 319
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 320
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v18

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "ssh_dss_verify: signature "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_2

    .line 311
    :catch_1
    move-exception v5

    .line 312
    .restart local v5       #e:Ljava/lang/Exception;
    sget-object v18, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_3

    .line 326
    .end local v5           #e:Ljava/lang/Exception;
    .end local v13           #q:[B
    .end local v15           #sig:Lcom/jcraft/jsch/SignatureDSA;
    .end local v17           #tmp:[B
    :cond_5
    sget-object v18, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v19, "unknown alg"

    invoke-virtual/range {v18 .. v19}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 119
    nop

    :pswitch_data_0
    .packed-switch 0x1f
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
