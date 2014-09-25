.class public Lcom/jcraft/jsch/jce/KeyPairGenDSA;
.super Ljava/lang/Object;
.source "KeyPairGenDSA.java"

# interfaces
.implements Lcom/jcraft/jsch/KeyPairGenDSA;


# instance fields
.field g:[B

.field p:[B

.field q:[B

.field x:[B

.field y:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getG()[B
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->g:[B

    return-object v0
.end method

.method public getP()[B
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->p:[B

    return-object v0
.end method

.method public getQ()[B
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->q:[B

    return-object v0
.end method

.method public getX()[B
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->x:[B

    return-object v0
.end method

.method public getY()[B
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->y:[B

    return-object v0
.end method

.method public init(I)V
    .locals 6
    .parameter "key_size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    const-string v5, "DSA"

    invoke-static {v5}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v0

    .line 44
    .local v0, keyGen:Ljava/security/KeyPairGenerator;
    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v0, p1, v5}, Ljava/security/KeyPairGenerator;->initialize(ILjava/security/SecureRandom;)V

    .line 45
    invoke-virtual {v0}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;

    move-result-object v1

    .line 46
    .local v1, pair:Ljava/security/KeyPair;
    invoke-virtual {v1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v4

    .line 47
    .local v4, pubKey:Ljava/security/PublicKey;
    invoke-virtual {v1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v3

    .local v3, prvKey:Ljava/security/PrivateKey;
    move-object v5, v3

    .line 49
    check-cast v5, Ljava/security/interfaces/DSAPrivateKey;

    invoke-interface {v5}, Ljava/security/interfaces/DSAPrivateKey;->getX()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v5

    iput-object v5, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->x:[B

    .line 50
    check-cast v4, Ljava/security/interfaces/DSAPublicKey;

    .end local v4           #pubKey:Ljava/security/PublicKey;
    invoke-interface {v4}, Ljava/security/interfaces/DSAPublicKey;->getY()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v5

    iput-object v5, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->y:[B

    .line 52
    check-cast v3, Ljava/security/interfaces/DSAKey;

    .end local v3           #prvKey:Ljava/security/PrivateKey;
    invoke-interface {v3}, Ljava/security/interfaces/DSAKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v2

    .line 53
    .local v2, params:Ljava/security/interfaces/DSAParams;
    invoke-interface {v2}, Ljava/security/interfaces/DSAParams;->getP()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v5

    iput-object v5, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->p:[B

    .line 54
    invoke-interface {v2}, Ljava/security/interfaces/DSAParams;->getQ()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v5

    iput-object v5, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->q:[B

    .line 55
    invoke-interface {v2}, Ljava/security/interfaces/DSAParams;->getG()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v5

    iput-object v5, p0, Lcom/jcraft/jsch/jce/KeyPairGenDSA;->g:[B

    .line 56
    return-void
.end method
