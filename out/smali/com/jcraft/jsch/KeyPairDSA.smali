.class public Lcom/jcraft/jsch/KeyPairDSA;
.super Lcom/jcraft/jsch/KeyPair;
.source "KeyPairDSA.java"


# static fields
.field private static final begin:[B

.field private static final end:[B

.field private static final sshdss:[B


# instance fields
.field private G_array:[B

.field private P_array:[B

.field private Q_array:[B

.field private key_size:I

.field private prv_array:[B

.field private pub_array:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    const-string v0, "-----BEGIN DSA PRIVATE KEY-----"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairDSA;->begin:[B

    .line 85
    const-string v0, "-----END DSA PRIVATE KEY-----"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairDSA;->end:[B

    .line 242
    const-string v0, "ssh-dss"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairDSA;->sshdss:[B

    return-void
.end method

.method public constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .locals 7
    .parameter "jsch"

    .prologue
    const/4 v2, 0x0

    .line 43
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B[B[B)V

    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/jcraft/jsch/JSch;[B[B[B[B[B)V
    .locals 1
    .parameter "jsch"
    .parameter "P_array"
    .parameter "Q_array"
    .parameter "G_array"
    .parameter "pub_array"
    .parameter "prv_array"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/KeyPair;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 40
    const/16 v0, 0x400

    iput v0, p0, Lcom/jcraft/jsch/KeyPairDSA;->key_size:I

    .line 53
    iput-object p2, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    .line 54
    iput-object p3, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    .line 55
    iput-object p4, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    .line 56
    iput-object p5, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    .line 57
    iput-object p6, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    .line 58
    if-eqz p2, :cond_0

    .line 59
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, p2}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/KeyPairDSA;->key_size:I

    .line 60
    :cond_0
    return-void
.end method

.method static fromSSHAgent(Lcom/jcraft/jsch/JSch;Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyPair;
    .locals 9
    .parameter "jsch"
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 296
    const/4 v1, 0x7

    const-string v8, "invalid key format"

    invoke-virtual {p1, v1, v8}, Lcom/jcraft/jsch/Buffer;->getBytes(ILjava/lang/String;)[[B

    move-result-object v7

    .line 298
    .local v7, tmp:[[B
    const/4 v1, 0x1

    aget-object v2, v7, v1

    .line 299
    .local v2, P_array:[B
    const/4 v1, 0x2

    aget-object v3, v7, v1

    .line 300
    .local v3, Q_array:[B
    const/4 v1, 0x3

    aget-object v4, v7, v1

    .line 301
    .local v4, G_array:[B
    const/4 v1, 0x4

    aget-object v5, v7, v1

    .line 302
    .local v5, pub_array:[B
    const/4 v1, 0x5

    aget-object v6, v7, v1

    .line 303
    .local v6, prv_array:[B
    new-instance v0, Lcom/jcraft/jsch/KeyPairDSA;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B[B[B)V

    .line 306
    .local v0, kpair:Lcom/jcraft/jsch/KeyPairDSA;
    new-instance v1, Ljava/lang/String;

    const/4 v8, 0x6

    aget-object v8, v7, v8

    invoke-direct {v1, v8}, Ljava/lang/String;-><init>([B)V

    iput-object v1, v0, Lcom/jcraft/jsch/KeyPairDSA;->publicKeyComment:Ljava/lang/String;

    .line 307
    const/4 v1, 0x0

    iput v1, v0, Lcom/jcraft/jsch/KeyPairDSA;->vendor:I

    .line 308
    return-object v0
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 329
    invoke-super {p0}, Lcom/jcraft/jsch/KeyPair;->dispose()V

    .line 330
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 331
    return-void
.end method

.method public forSSHAgent()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPairDSA;->isEncrypted()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 313
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "key is encrypted."

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 315
    :cond_0
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 316
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    sget-object v2, Lcom/jcraft/jsch/KeyPairDSA;->sshdss:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 317
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 318
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 319
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 320
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 321
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 322
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairDSA;->publicKeyComment:Ljava/lang/String;

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 323
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v2

    new-array v1, v2, [B

    .line 324
    .local v1, result:[B
    const/4 v2, 0x0

    array-length v3, v1

    invoke-virtual {v0, v1, v2, v3}, Lcom/jcraft/jsch/Buffer;->getByte([BII)V

    .line 325
    return-object v1
.end method

.method generate(I)V
    .locals 6
    .parameter "key_size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 63
    iput p1, p0, Lcom/jcraft/jsch/KeyPairDSA;->key_size:I

    .line 65
    :try_start_0
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v4, "keypairgen.dsa"

    invoke-static {v4}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 66
    .local v1, c:Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/KeyPairGenDSA;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/KeyPairGenDSA;

    move-object v3, v0

    .line 67
    .local v3, keypairgen:Lcom/jcraft/jsch/KeyPairGenDSA;
    invoke-interface {v3, p1}, Lcom/jcraft/jsch/KeyPairGenDSA;->init(I)V

    .line 68
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenDSA;->getP()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    .line 69
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenDSA;->getQ()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    .line 70
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenDSA;->getG()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    .line 71
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenDSA;->getY()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    .line 72
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenDSA;->getX()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    return-void

    .line 76
    .end local v1           #c:Ljava/lang/Class;
    .end local v3           #keypairgen:Lcom/jcraft/jsch/KeyPairGenDSA;
    :catch_0
    move-exception v2

    .line 78
    .local v2, e:Ljava/lang/Exception;
    instance-of v4, v2, Ljava/lang/Throwable;

    if-eqz v4, :cond_0

    .line 79
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 80
    :cond_0
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method getBegin()[B
    .locals 1

    .prologue
    .line 87
    sget-object v0, Lcom/jcraft/jsch/KeyPairDSA;->begin:[B

    return-object v0
.end method

.method getEnd()[B
    .locals 1

    .prologue
    .line 88
    sget-object v0, Lcom/jcraft/jsch/KeyPairDSA;->end:[B

    return-object v0
.end method

.method public getKeySize()I
    .locals 1

    .prologue
    .line 247
    iget v0, p0, Lcom/jcraft/jsch/KeyPairDSA;->key_size:I

    return v0
.end method

.method public getKeyType()I
    .locals 1

    .prologue
    .line 244
    const/4 v0, 0x1

    return v0
.end method

.method getKeyTypeName()[B
    .locals 1

    .prologue
    .line 243
    sget-object v0, Lcom/jcraft/jsch/KeyPairDSA;->sshdss:[B

    return-object v0
.end method

.method getPrivateKey()[B
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 91
    invoke-virtual {p0, v6}, Lcom/jcraft/jsch/KeyPairDSA;->countLength(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairDSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairDSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairDSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairDSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairDSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    array-length v5, v5

    add-int v0, v4, v5

    .line 99
    .local v0, content:I
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPairDSA;->countLength(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int v3, v4, v0

    .line 102
    .local v3, total:I
    new-array v2, v3, [B

    .line 103
    .local v2, plain:[B
    const/4 v1, 0x0

    .line 104
    .local v1, index:I
    invoke-virtual {p0, v2, v1, v0}, Lcom/jcraft/jsch/KeyPairDSA;->writeSEQUENCE([BII)I

    move-result v1

    .line 105
    new-array v4, v6, [B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairDSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 106
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairDSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 107
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairDSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 108
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairDSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 109
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairDSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 110
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairDSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 111
    return-object v2
.end method

.method public getPublicKeyBlob()[B
    .locals 4

    .prologue
    .line 229
    invoke-super {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v0

    .line 230
    .local v0, foo:[B
    if-eqz v0, :cond_0

    .line 239
    .end local v0           #foo:[B
    :goto_0
    return-object v0

    .line 232
    .restart local v0       #foo:[B
    :cond_0
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    if-nez v2, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    .line 233
    :cond_1
    const/4 v2, 0x5

    new-array v1, v2, [[B

    .line 234
    .local v1, tmp:[[B
    const/4 v2, 0x0

    sget-object v3, Lcom/jcraft/jsch/KeyPairDSA;->sshdss:[B

    aput-object v3, v1, v2

    .line 235
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    aput-object v3, v1, v2

    .line 236
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    aput-object v3, v1, v2

    .line 237
    const/4 v2, 0x3

    iget-object v3, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    aput-object v3, v1, v2

    .line 238
    const/4 v2, 0x4

    iget-object v3, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    aput-object v3, v1, v2

    .line 239
    invoke-static {v1}, Lcom/jcraft/jsch/Buffer;->fromBytes([[B)Lcom/jcraft/jsch/Buffer;

    move-result-object v2

    iget-object v0, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    goto :goto_0
.end method

.method public getSignature([B)[B
    .locals 9
    .parameter "data"

    .prologue
    .line 252
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v5, "signature.dss"

    invoke-static {v5}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 253
    .local v1, c:Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/SignatureDSA;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/SignatureDSA;

    move-object v2, v0

    .line 254
    .local v2, dsa:Lcom/jcraft/jsch/SignatureDSA;
    invoke-interface {v2}, Lcom/jcraft/jsch/SignatureDSA;->init()V

    .line 255
    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    iget-object v6, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    iget-object v7, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    iget-object v8, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    invoke-interface {v2, v5, v6, v7, v8}, Lcom/jcraft/jsch/SignatureDSA;->setPrvKey([B[B[B[B)V

    .line 257
    invoke-interface {v2, p1}, Lcom/jcraft/jsch/SignatureDSA;->update([B)V

    .line 258
    invoke-interface {v2}, Lcom/jcraft/jsch/SignatureDSA;->sign()[B

    move-result-object v3

    .line 259
    .local v3, sig:[B
    const/4 v5, 0x2

    new-array v4, v5, [[B

    .line 260
    .local v4, tmp:[[B
    const/4 v5, 0x0

    sget-object v6, Lcom/jcraft/jsch/KeyPairDSA;->sshdss:[B

    aput-object v6, v4, v5

    .line 261
    const/4 v5, 0x1

    aput-object v3, v4, v5

    .line 262
    invoke-static {v4}, Lcom/jcraft/jsch/Buffer;->fromBytes([[B)Lcom/jcraft/jsch/Buffer;

    move-result-object v5

    iget-object v5, v5, Lcom/jcraft/jsch/Buffer;->buffer:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    .end local v1           #c:Ljava/lang/Class;
    .end local v2           #dsa:Lcom/jcraft/jsch/SignatureDSA;
    .end local v3           #sig:[B
    .end local v4           #tmp:[[B
    :goto_0
    return-object v5

    .line 264
    :catch_0
    move-exception v5

    .line 267
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public getVerifier()Lcom/jcraft/jsch/Signature;
    .locals 8

    .prologue
    .line 272
    :try_start_0
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v4, "signature.dss"

    invoke-static {v4}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 273
    .local v2, c:Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/SignatureDSA;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/SignatureDSA;

    move-object v3, v0

    .line 274
    .local v3, dsa:Lcom/jcraft/jsch/SignatureDSA;
    invoke-interface {v3}, Lcom/jcraft/jsch/SignatureDSA;->init()V

    .line 276
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPairDSA;->getPublicKeyBlob()[B

    move-result-object v4

    if-eqz v4, :cond_0

    .line 277
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPairDSA;->getPublicKeyBlob()[B

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 278
    .local v1, buf:Lcom/jcraft/jsch/Buffer;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 279
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    .line 280
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    .line 281
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    .line 282
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    .line 285
    .end local v1           #buf:Lcom/jcraft/jsch/Buffer;
    :cond_0
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    iget-object v6, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    iget-object v7, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    invoke-interface {v3, v4, v5, v6, v7}, Lcom/jcraft/jsch/SignatureDSA;->setPubKey([B[B[B[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    .end local v2           #c:Ljava/lang/Class;
    .end local v3           #dsa:Lcom/jcraft/jsch/SignatureDSA;
    :goto_0
    return-object v3

    .line 288
    :catch_0
    move-exception v4

    .line 291
    const/4 v3, 0x0

    goto :goto_0
.end method

.method parse([B)Z
    .locals 13
    .parameter "plain"

    .prologue
    const/16 v11, 0x30

    const/4 v12, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 117
    :try_start_0
    iget v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->vendor:I

    if-ne v10, v8, :cond_2

    .line 118
    const/4 v10, 0x0

    aget-byte v10, p1, v10

    if-eq v10, v11, :cond_1

    .line 119
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0, p1}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 120
    .local v0, buf:Lcom/jcraft/jsch/Buffer;
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 121
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    .line 122
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    .line 123
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    .line 124
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    .line 125
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    .line 126
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    if-eqz v10, :cond_0

    .line 127
    new-instance v10, Ljava/math/BigInteger;

    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    invoke-direct {v10, v11}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v10}, Ljava/math/BigInteger;->bitLength()I

    move-result v10

    iput v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->key_size:I

    .line 225
    .end local v0           #buf:Lcom/jcraft/jsch/Buffer;
    :cond_0
    :goto_0
    return v8

    :cond_1
    move v8, v9

    .line 130
    goto :goto_0

    .line 132
    :cond_2
    iget v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->vendor:I

    if-ne v10, v12, :cond_3

    .line 133
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0, p1}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 134
    .restart local v0       #buf:Lcom/jcraft/jsch/Buffer;
    array-length v10, p1

    invoke-virtual {v0, v10}, Lcom/jcraft/jsch/Buffer;->skip(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 137
    const/4 v10, 0x1

    :try_start_1
    const-string v11, ""

    invoke-virtual {v0, v10, v11}, Lcom/jcraft/jsch/Buffer;->getBytes(ILjava/lang/String;)[[B

    move-result-object v7

    .line 138
    .local v7, tmp:[[B
    const/4 v10, 0x0

    aget-object v10, v7, v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B
    :try_end_1
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 140
    .end local v7           #tmp:[[B
    :catch_0
    move-exception v1

    .local v1, e:Lcom/jcraft/jsch/JSchException;
    move v8, v9

    .line 141
    goto :goto_0

    .line 147
    .end local v0           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v1           #e:Lcom/jcraft/jsch/JSchException;
    :cond_3
    const/4 v4, 0x0

    .line 148
    .local v4, index:I
    const/4 v6, 0x0

    .line 150
    .local v6, length:I
    :try_start_2
    aget-byte v10, p1, v4

    if-eq v10, v11, :cond_4

    move v8, v9

    goto :goto_0

    .line 151
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 152
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .local v5, index:I
    aget-byte v10, p1, v4

    and-int/lit16 v6, v10, 0xff

    .line 153
    and-int/lit16 v10, v6, 0x80

    if-eqz v10, :cond_5

    .line 154
    and-int/lit8 v2, v6, 0x7f

    .local v2, foo:I
    const/4 v6, 0x0

    move v3, v2

    .line 155
    .end local v2           #foo:I
    .local v3, foo:I
    :goto_1
    add-int/lit8 v2, v3, -0x1

    .end local v3           #foo:I
    .restart local v2       #foo:I
    if-lez v3, :cond_5

    shl-int/lit8 v10, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v11, p1, v5

    and-int/lit16 v11, v11, 0xff

    add-int v6, v10, v11

    move v3, v2

    .end local v2           #foo:I
    .restart local v3       #foo:I
    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_1

    .end local v3           #foo:I
    :cond_5
    move v4, v5

    .line 158
    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v10, p1, v4

    if-eq v10, v12, :cond_6

    move v8, v9

    goto :goto_0

    .line 159
    :cond_6
    add-int/lit8 v4, v4, 0x1

    .line 160
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    aget-byte v10, p1, v4

    and-int/lit16 v6, v10, 0xff

    .line 161
    and-int/lit16 v10, v6, 0x80

    if-eqz v10, :cond_7

    .line 162
    and-int/lit8 v2, v6, 0x7f

    .restart local v2       #foo:I
    const/4 v6, 0x0

    move v3, v2

    .line 163
    .end local v2           #foo:I
    .restart local v3       #foo:I
    :goto_2
    add-int/lit8 v2, v3, -0x1

    .end local v3           #foo:I
    .restart local v2       #foo:I
    if-lez v3, :cond_7

    shl-int/lit8 v10, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v11, p1, v5

    and-int/lit16 v11, v11, 0xff

    add-int v6, v10, v11

    move v3, v2

    .end local v2           #foo:I
    .restart local v3       #foo:I
    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_2

    .end local v3           #foo:I
    :cond_7
    move v4, v5

    .line 165
    .end local v5           #index:I
    .restart local v4       #index:I
    add-int/2addr v4, v6

    .line 167
    add-int/lit8 v4, v4, 0x1

    .line 168
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    aget-byte v10, p1, v4

    and-int/lit16 v6, v10, 0xff

    .line 169
    and-int/lit16 v10, v6, 0x80

    if-eqz v10, :cond_8

    .line 170
    and-int/lit8 v2, v6, 0x7f

    .restart local v2       #foo:I
    const/4 v6, 0x0

    move v3, v2

    .line 171
    .end local v2           #foo:I
    .restart local v3       #foo:I
    :goto_3
    add-int/lit8 v2, v3, -0x1

    .end local v3           #foo:I
    .restart local v2       #foo:I
    if-lez v3, :cond_8

    shl-int/lit8 v10, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v11, p1, v5

    and-int/lit16 v11, v11, 0xff

    add-int v6, v10, v11

    move v3, v2

    .end local v2           #foo:I
    .restart local v3       #foo:I
    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_3

    .end local v3           #foo:I
    :cond_8
    move v4, v5

    .line 173
    .end local v5           #index:I
    .restart local v4       #index:I
    new-array v10, v6, [B

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    .line 174
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    const/4 v11, 0x0

    invoke-static {p1, v4, v10, v11, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    add-int/2addr v4, v6

    .line 177
    add-int/lit8 v4, v4, 0x1

    .line 178
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    aget-byte v10, p1, v4

    and-int/lit16 v6, v10, 0xff

    .line 179
    and-int/lit16 v10, v6, 0x80

    if-eqz v10, :cond_9

    .line 180
    and-int/lit8 v2, v6, 0x7f

    .restart local v2       #foo:I
    const/4 v6, 0x0

    move v3, v2

    .line 181
    .end local v2           #foo:I
    .restart local v3       #foo:I
    :goto_4
    add-int/lit8 v2, v3, -0x1

    .end local v3           #foo:I
    .restart local v2       #foo:I
    if-lez v3, :cond_9

    shl-int/lit8 v10, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v11, p1, v5

    and-int/lit16 v11, v11, 0xff

    add-int v6, v10, v11

    move v3, v2

    .end local v2           #foo:I
    .restart local v3       #foo:I
    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_4

    .end local v3           #foo:I
    :cond_9
    move v4, v5

    .line 183
    .end local v5           #index:I
    .restart local v4       #index:I
    new-array v10, v6, [B

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    .line 184
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->Q_array:[B

    const/4 v11, 0x0

    invoke-static {p1, v4, v10, v11, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 185
    add-int/2addr v4, v6

    .line 187
    add-int/lit8 v4, v4, 0x1

    .line 188
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    aget-byte v10, p1, v4

    and-int/lit16 v6, v10, 0xff

    .line 189
    and-int/lit16 v10, v6, 0x80

    if-eqz v10, :cond_a

    .line 190
    and-int/lit8 v2, v6, 0x7f

    .restart local v2       #foo:I
    const/4 v6, 0x0

    move v3, v2

    .line 191
    .end local v2           #foo:I
    .restart local v3       #foo:I
    :goto_5
    add-int/lit8 v2, v3, -0x1

    .end local v3           #foo:I
    .restart local v2       #foo:I
    if-lez v3, :cond_a

    shl-int/lit8 v10, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v11, p1, v5

    and-int/lit16 v11, v11, 0xff

    add-int v6, v10, v11

    move v3, v2

    .end local v2           #foo:I
    .restart local v3       #foo:I
    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_5

    .end local v3           #foo:I
    :cond_a
    move v4, v5

    .line 193
    .end local v5           #index:I
    .restart local v4       #index:I
    new-array v10, v6, [B

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    .line 194
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->G_array:[B

    const/4 v11, 0x0

    invoke-static {p1, v4, v10, v11, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    add-int/2addr v4, v6

    .line 197
    add-int/lit8 v4, v4, 0x1

    .line 198
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    aget-byte v10, p1, v4

    and-int/lit16 v6, v10, 0xff

    .line 199
    and-int/lit16 v10, v6, 0x80

    if-eqz v10, :cond_b

    .line 200
    and-int/lit8 v2, v6, 0x7f

    .restart local v2       #foo:I
    const/4 v6, 0x0

    move v3, v2

    .line 201
    .end local v2           #foo:I
    .restart local v3       #foo:I
    :goto_6
    add-int/lit8 v2, v3, -0x1

    .end local v3           #foo:I
    .restart local v2       #foo:I
    if-lez v3, :cond_b

    shl-int/lit8 v10, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v11, p1, v5

    and-int/lit16 v11, v11, 0xff

    add-int v6, v10, v11

    move v3, v2

    .end local v2           #foo:I
    .restart local v3       #foo:I
    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_6

    .end local v3           #foo:I
    :cond_b
    move v4, v5

    .line 203
    .end local v5           #index:I
    .restart local v4       #index:I
    new-array v10, v6, [B

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    .line 204
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->pub_array:[B

    const/4 v11, 0x0

    invoke-static {p1, v4, v10, v11, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    add-int/2addr v4, v6

    .line 207
    add-int/lit8 v4, v4, 0x1

    .line 208
    add-int/lit8 v5, v4, 0x1

    .end local v4           #index:I
    .restart local v5       #index:I
    aget-byte v10, p1, v4

    and-int/lit16 v6, v10, 0xff

    .line 209
    and-int/lit16 v10, v6, 0x80

    if-eqz v10, :cond_c

    .line 210
    and-int/lit8 v2, v6, 0x7f

    .restart local v2       #foo:I
    const/4 v6, 0x0

    move v3, v2

    .line 211
    .end local v2           #foo:I
    .restart local v3       #foo:I
    :goto_7
    add-int/lit8 v2, v3, -0x1

    .end local v3           #foo:I
    .restart local v2       #foo:I
    if-lez v3, :cond_c

    shl-int/lit8 v10, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5           #index:I
    .restart local v4       #index:I
    aget-byte v11, p1, v5

    and-int/lit16 v11, v11, 0xff

    add-int v6, v10, v11

    move v3, v2

    .end local v2           #foo:I
    .restart local v3       #foo:I
    move v5, v4

    .end local v4           #index:I
    .restart local v5       #index:I
    goto :goto_7

    .end local v3           #foo:I
    :cond_c
    move v4, v5

    .line 213
    .end local v5           #index:I
    .restart local v4       #index:I
    new-array v10, v6, [B

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    .line 214
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->prv_array:[B

    const/4 v11, 0x0

    invoke-static {p1, v4, v10, v11, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 215
    add-int/2addr v4, v6

    .line 217
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    if-eqz v10, :cond_0

    .line 218
    new-instance v10, Ljava/math/BigInteger;

    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairDSA;->P_array:[B

    invoke-direct {v10, v11}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v10}, Ljava/math/BigInteger;->bitLength()I

    move-result v10

    iput v10, p0, Lcom/jcraft/jsch/KeyPairDSA;->key_size:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 220
    .end local v4           #index:I
    .end local v6           #length:I
    :catch_1
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    move v8, v9

    .line 223
    goto/16 :goto_0
.end method
