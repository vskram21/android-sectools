.class public Lcom/jcraft/jsch/jce/KeyPairGenRSA;
.super Ljava/lang/Object;
.source "KeyPairGenRSA.java"

# interfaces
.implements Lcom/jcraft/jsch/KeyPairGenRSA;


# instance fields
.field c:[B

.field d:[B

.field e:[B

.field ep:[B

.field eq:[B

.field n:[B

.field p:[B

.field q:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getC()[B
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->c:[B

    return-object v0
.end method

.method public getD()[B
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->d:[B

    return-object v0
.end method

.method public getE()[B
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->e:[B

    return-object v0
.end method

.method public getEP()[B
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->ep:[B

    return-object v0
.end method

.method public getEQ()[B
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->eq:[B

    return-object v0
.end method

.method public getN()[B
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->n:[B

    return-object v0
.end method

.method public getP()[B
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->p:[B

    return-object v0
.end method

.method public getQ()[B
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->q:[B

    return-object v0
.end method

.method public init(I)V
    .locals 5
    .parameter "key_size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    const-string v4, "RSA"

    invoke-static {v4}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v0

    .line 48
    .local v0, keyGen:Ljava/security/KeyPairGenerator;
    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v0, p1, v4}, Ljava/security/KeyPairGenerator;->initialize(ILjava/security/SecureRandom;)V

    .line 49
    invoke-virtual {v0}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;

    move-result-object v1

    .line 51
    .local v1, pair:Ljava/security/KeyPair;
    invoke-virtual {v1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v3

    .line 52
    .local v3, pubKey:Ljava/security/PublicKey;
    invoke-virtual {v1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v2

    .local v2, prvKey:Ljava/security/PrivateKey;
    move-object v4, v2

    .line 54
    check-cast v4, Ljava/security/interfaces/RSAPrivateKey;

    invoke-interface {v4}, Ljava/security/interfaces/RSAPrivateKey;->getPrivateExponent()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->d:[B

    .line 55
    check-cast v3, Ljava/security/interfaces/RSAPublicKey;

    .end local v3           #pubKey:Ljava/security/PublicKey;
    invoke-interface {v3}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->e:[B

    move-object v4, v2

    .line 56
    check-cast v4, Ljava/security/interfaces/RSAPrivateKey;

    invoke-interface {v4}, Ljava/security/interfaces/RSAPrivateKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->n:[B

    move-object v4, v2

    .line 58
    check-cast v4, Ljava/security/interfaces/RSAPrivateCrtKey;

    invoke-interface {v4}, Ljava/security/interfaces/RSAPrivateCrtKey;->getCrtCoefficient()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->c:[B

    move-object v4, v2

    .line 59
    check-cast v4, Ljava/security/interfaces/RSAPrivateCrtKey;

    invoke-interface {v4}, Ljava/security/interfaces/RSAPrivateCrtKey;->getPrimeExponentP()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->ep:[B

    move-object v4, v2

    .line 60
    check-cast v4, Ljava/security/interfaces/RSAPrivateCrtKey;

    invoke-interface {v4}, Ljava/security/interfaces/RSAPrivateCrtKey;->getPrimeExponentQ()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->eq:[B

    move-object v4, v2

    .line 61
    check-cast v4, Ljava/security/interfaces/RSAPrivateCrtKey;

    invoke-interface {v4}, Ljava/security/interfaces/RSAPrivateCrtKey;->getPrimeP()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->p:[B

    .line 62
    check-cast v2, Ljava/security/interfaces/RSAPrivateCrtKey;

    .end local v2           #prvKey:Ljava/security/PrivateKey;
    invoke-interface {v2}, Ljava/security/interfaces/RSAPrivateCrtKey;->getPrimeQ()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/KeyPairGenRSA;->q:[B

    .line 63
    return-void
.end method
