.class public Lcom/jcraft/jsch/jce/SignatureRSA;
.super Ljava/lang/Object;
.source "SignatureRSA.java"

# interfaces
.implements Lcom/jcraft/jsch/SignatureRSA;


# instance fields
.field keyFactory:Ljava/security/KeyFactory;

.field signature:Ljava/security/Signature;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public init()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    const-string v0, "SHA1withRSA"

    invoke-static {v0}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->signature:Ljava/security/Signature;

    .line 43
    const-string v0, "RSA"

    invoke-static {v0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->keyFactory:Ljava/security/KeyFactory;

    .line 44
    return-void
.end method

.method public setPrvKey([B[B)V
    .locals 4
    .parameter "d"
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v1, Ljava/security/spec/RSAPrivateKeySpec;

    new-instance v2, Ljava/math/BigInteger;

    invoke-direct {v2, p2}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v3, Ljava/math/BigInteger;

    invoke-direct {v3, p1}, Ljava/math/BigInteger;-><init>([B)V

    invoke-direct {v1, v2, v3}, Ljava/security/spec/RSAPrivateKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 56
    .local v1, rsaPrivKeySpec:Ljava/security/spec/RSAPrivateKeySpec;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->keyFactory:Ljava/security/KeyFactory;

    invoke-virtual {v2, v1}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v0

    .line 57
    .local v0, prvKey:Ljava/security/PrivateKey;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->signature:Ljava/security/Signature;

    invoke-virtual {v2, v0}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 58
    return-void
.end method

.method public setPubKey([B[B)V
    .locals 4
    .parameter "e"
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    new-instance v1, Ljava/security/spec/RSAPublicKeySpec;

    new-instance v2, Ljava/math/BigInteger;

    invoke-direct {v2, p2}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v3, Ljava/math/BigInteger;

    invoke-direct {v3, p1}, Ljava/math/BigInteger;-><init>([B)V

    invoke-direct {v1, v2, v3}, Ljava/security/spec/RSAPublicKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 49
    .local v1, rsaPubKeySpec:Ljava/security/spec/RSAPublicKeySpec;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->keyFactory:Ljava/security/KeyFactory;

    invoke-virtual {v2, v1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v0

    .line 50
    .local v0, pubKey:Ljava/security/PublicKey;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->signature:Ljava/security/Signature;

    invoke-virtual {v2, v0}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 51
    return-void
.end method

.method public sign()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v1, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->signature:Ljava/security/Signature;

    invoke-virtual {v1}, Ljava/security/Signature;->sign()[B

    move-result-object v0

    .line 61
    .local v0, sig:[B
    return-object v0
.end method

.method public update([B)V
    .locals 1
    .parameter "foo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->signature:Ljava/security/Signature;

    invoke-virtual {v0, p1}, Ljava/security/Signature;->update([B)V

    .line 65
    return-void
.end method

.method public verify([B)Z
    .locals 10
    .parameter "sig"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/high16 v9, 0xff

    const v8, 0xff00

    const/4 v7, 0x0

    const/high16 v6, -0x100

    .line 67
    const/4 v0, 0x0

    .line 68
    .local v0, i:I
    const/4 v2, 0x0

    .line 71
    .local v2, j:I
    aget-byte v4, p1, v7

    if-nez v4, :cond_0

    const/4 v4, 0x1

    aget-byte v4, p1, v4

    if-nez v4, :cond_0

    const/4 v4, 0x2

    aget-byte v4, p1, v4

    if-nez v4, :cond_0

    .line 72
    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .local v1, i:I
    aget-byte v4, p1, v0

    shl-int/lit8 v4, v4, 0x18

    and-int/2addr v4, v6

    add-int/lit8 v0, v1, 0x1

    .end local v1           #i:I
    .restart local v0       #i:I
    aget-byte v5, p1, v1

    shl-int/lit8 v5, v5, 0x10

    and-int/2addr v5, v9

    or-int/2addr v4, v5

    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .restart local v1       #i:I
    aget-byte v5, p1, v0

    shl-int/lit8 v5, v5, 0x8

    and-int/2addr v5, v8

    or-int/2addr v4, v5

    add-int/lit8 v0, v1, 0x1

    .end local v1           #i:I
    .restart local v0       #i:I
    aget-byte v5, p1, v1

    and-int/lit16 v5, v5, 0xff

    or-int v2, v4, v5

    .line 74
    add-int/lit8 v0, v2, 0x4

    .line 75
    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .restart local v1       #i:I
    aget-byte v4, p1, v0

    shl-int/lit8 v4, v4, 0x18

    and-int/2addr v4, v6

    add-int/lit8 v0, v1, 0x1

    .end local v1           #i:I
    .restart local v0       #i:I
    aget-byte v5, p1, v1

    shl-int/lit8 v5, v5, 0x10

    and-int/2addr v5, v9

    or-int/2addr v4, v5

    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .restart local v1       #i:I
    aget-byte v5, p1, v0

    shl-int/lit8 v5, v5, 0x8

    and-int/2addr v5, v8

    or-int/2addr v4, v5

    add-int/lit8 v0, v1, 0x1

    .end local v1           #i:I
    .restart local v0       #i:I
    aget-byte v5, p1, v1

    and-int/lit16 v5, v5, 0xff

    or-int v2, v4, v5

    .line 77
    new-array v3, v2, [B

    .line 78
    .local v3, tmp:[B
    invoke-static {p1, v0, v3, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p1, v3

    .line 81
    .end local v3           #tmp:[B
    :cond_0
    iget-object v4, p0, Lcom/jcraft/jsch/jce/SignatureRSA;->signature:Ljava/security/Signature;

    invoke-virtual {v4, p1}, Ljava/security/Signature;->verify([B)Z

    move-result v4

    return v4
.end method
