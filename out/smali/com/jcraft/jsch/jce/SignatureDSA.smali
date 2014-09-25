.class public Lcom/jcraft/jsch/jce/SignatureDSA;
.super Ljava/lang/Object;
.source "SignatureDSA.java"

# interfaces
.implements Lcom/jcraft/jsch/SignatureDSA;


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
    const-string v0, "SHA1withDSA"

    invoke-static {v0}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->signature:Ljava/security/Signature;

    .line 43
    const-string v0, "DSA"

    invoke-static {v0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->keyFactory:Ljava/security/KeyFactory;

    .line 44
    return-void
.end method

.method public setPrvKey([B[B[B[B)V
    .locals 6
    .parameter "x"
    .parameter "p"
    .parameter "q"
    .parameter "g"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v0, Ljava/security/spec/DSAPrivateKeySpec;

    new-instance v2, Ljava/math/BigInteger;

    invoke-direct {v2, p1}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v3, Ljava/math/BigInteger;

    invoke-direct {v3, p2}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v4, Ljava/math/BigInteger;

    invoke-direct {v4, p3}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v5, Ljava/math/BigInteger;

    invoke-direct {v5, p4}, Ljava/math/BigInteger;-><init>([B)V

    invoke-direct {v0, v2, v3, v4, v5}, Ljava/security/spec/DSAPrivateKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 60
    .local v0, dsaPrivKeySpec:Ljava/security/spec/DSAPrivateKeySpec;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->keyFactory:Ljava/security/KeyFactory;

    invoke-virtual {v2, v0}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v1

    .line 61
    .local v1, prvKey:Ljava/security/PrivateKey;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->signature:Ljava/security/Signature;

    invoke-virtual {v2, v1}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 62
    return-void
.end method

.method public setPubKey([B[B[B[B)V
    .locals 6
    .parameter "y"
    .parameter "p"
    .parameter "q"
    .parameter "g"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    new-instance v0, Ljava/security/spec/DSAPublicKeySpec;

    new-instance v2, Ljava/math/BigInteger;

    invoke-direct {v2, p1}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v3, Ljava/math/BigInteger;

    invoke-direct {v3, p2}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v4, Ljava/math/BigInteger;

    invoke-direct {v4, p3}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v5, Ljava/math/BigInteger;

    invoke-direct {v5, p4}, Ljava/math/BigInteger;-><init>([B)V

    invoke-direct {v0, v2, v3, v4, v5}, Ljava/security/spec/DSAPublicKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 51
    .local v0, dsaPubKeySpec:Ljava/security/spec/DSAPublicKeySpec;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->keyFactory:Ljava/security/KeyFactory;

    invoke-virtual {v2, v0}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v1

    .line 52
    .local v1, pubKey:Ljava/security/PublicKey;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->signature:Ljava/security/Signature;

    invoke-virtual {v2, v1}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 53
    return-void
.end method

.method public sign()[B
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    const/16 v12, 0x14

    .line 64
    iget-object v7, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->signature:Ljava/security/Signature;

    invoke-virtual {v7}, Ljava/security/Signature;->sign()[B

    move-result-object v6

    .line 74
    .local v6, sig:[B
    const/4 v2, 0x0

    .line 75
    .local v2, len:I
    const/4 v0, 0x3

    .line 76
    .local v0, index:I
    add-int/lit8 v1, v0, 0x1

    .end local v0           #index:I
    .local v1, index:I
    aget-byte v7, v6, v0

    and-int/lit16 v2, v7, 0xff

    .line 78
    new-array v3, v2, [B

    .line 79
    .local v3, r:[B
    array-length v7, v3

    invoke-static {v6, v1, v3, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    add-int/lit8 v7, v2, 0x4

    add-int/lit8 v0, v7, 0x1

    .line 81
    .end local v1           #index:I
    .restart local v0       #index:I
    add-int/lit8 v1, v0, 0x1

    .end local v0           #index:I
    .restart local v1       #index:I
    aget-byte v7, v6, v0

    and-int/lit16 v2, v7, 0xff

    .line 83
    new-array v5, v2, [B

    .line 84
    .local v5, s:[B
    array-length v7, v5

    invoke-static {v6, v1, v5, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    const/16 v7, 0x28

    new-array v4, v7, [B

    .line 90
    .local v4, result:[B
    array-length v7, v3

    if-le v7, v12, :cond_0

    move v7, v8

    :goto_0
    array-length v10, v3

    if-le v10, v12, :cond_1

    move v10, v9

    :goto_1
    array-length v11, v3

    if-le v11, v12, :cond_2

    move v11, v12

    :goto_2
    invoke-static {v3, v7, v4, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    array-length v7, v5

    if-le v7, v12, :cond_3

    :goto_3
    array-length v7, v5

    if-le v7, v12, :cond_4

    move v7, v12

    :goto_4
    array-length v9, v5

    if-le v9, v12, :cond_5

    :goto_5
    invoke-static {v5, v8, v4, v7, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 100
    return-object v4

    :cond_0
    move v7, v9

    .line 90
    goto :goto_0

    :cond_1
    array-length v10, v3

    rsub-int/lit8 v10, v10, 0x14

    goto :goto_1

    :cond_2
    array-length v11, v3

    goto :goto_2

    :cond_3
    move v8, v9

    .line 93
    goto :goto_3

    :cond_4
    array-length v7, v5

    rsub-int/lit8 v7, v7, 0x28

    goto :goto_4

    :cond_5
    array-length v12, v5

    goto :goto_5
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
    .line 103
    iget-object v0, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->signature:Ljava/security/Signature;

    invoke-virtual {v0, p1}, Ljava/security/Signature;->update([B)V

    .line 104
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
    .line 106
    const/4 v1, 0x0

    .line 107
    .local v1, i:I
    const/4 v3, 0x0

    .line 110
    .local v3, j:I
    const/4 v7, 0x0

    aget-byte v7, p1, v7

    if-nez v7, :cond_0

    const/4 v7, 0x1

    aget-byte v7, p1, v7

    if-nez v7, :cond_0

    const/4 v7, 0x2

    aget-byte v7, p1, v7

    if-nez v7, :cond_0

    .line 111
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .local v2, i:I
    aget-byte v7, p1, v1

    shl-int/lit8 v7, v7, 0x18

    const/high16 v8, -0x100

    and-int/2addr v7, v8

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aget-byte v8, p1, v2

    shl-int/lit8 v8, v8, 0x10

    const/high16 v9, 0xff

    and-int/2addr v8, v9

    or-int/2addr v7, v8

    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .restart local v2       #i:I
    aget-byte v8, p1, v1

    shl-int/lit8 v8, v8, 0x8

    const v9, 0xff00

    and-int/2addr v8, v9

    or-int/2addr v7, v8

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aget-byte v8, p1, v2

    and-int/lit16 v8, v8, 0xff

    or-int v3, v7, v8

    .line 113
    add-int/lit8 v1, v3, 0x4

    .line 114
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .restart local v2       #i:I
    aget-byte v7, p1, v1

    shl-int/lit8 v7, v7, 0x18

    const/high16 v8, -0x100

    and-int/2addr v7, v8

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aget-byte v8, p1, v2

    shl-int/lit8 v8, v8, 0x10

    const/high16 v9, 0xff

    and-int/2addr v8, v9

    or-int/2addr v7, v8

    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .restart local v2       #i:I
    aget-byte v8, p1, v1

    shl-int/lit8 v8, v8, 0x8

    const v9, 0xff00

    and-int/2addr v8, v9

    or-int/2addr v7, v8

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aget-byte v8, p1, v2

    and-int/lit16 v8, v8, 0xff

    or-int v3, v7, v8

    .line 116
    new-array v6, v3, [B

    .line 117
    .local v6, tmp:[B
    const/4 v7, 0x0

    invoke-static {p1, v1, v6, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p1, v6

    .line 121
    .end local v6           #tmp:[B
    :cond_0
    const/4 v7, 0x0

    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0x80

    if-eqz v7, :cond_1

    const/4 v0, 0x1

    .line 122
    .local v0, frst:I
    :goto_0
    const/16 v7, 0x14

    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0x80

    if-eqz v7, :cond_2

    const/4 v5, 0x1

    .line 125
    .local v5, scnd:I
    :goto_1
    array-length v7, p1

    add-int/lit8 v7, v7, 0x6

    add-int/2addr v7, v0

    add-int v4, v7, v5

    .line 126
    .local v4, length:I
    new-array v6, v4, [B

    .line 127
    .restart local v6       #tmp:[B
    const/4 v7, 0x0

    const/16 v8, 0x30

    aput-byte v8, v6, v7

    const/4 v7, 0x1

    const/16 v8, 0x2c

    aput-byte v8, v6, v7

    .line 128
    const/4 v7, 0x1

    aget-byte v8, v6, v7

    add-int/2addr v8, v0

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    const/4 v7, 0x1

    aget-byte v8, v6, v7

    add-int/2addr v8, v5

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    .line 129
    const/4 v7, 0x2

    const/4 v8, 0x2

    aput-byte v8, v6, v7

    const/4 v7, 0x3

    const/16 v8, 0x14

    aput-byte v8, v6, v7

    .line 130
    const/4 v7, 0x3

    aget-byte v8, v6, v7

    add-int/2addr v8, v0

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    .line 131
    const/4 v7, 0x0

    add-int/lit8 v8, v0, 0x4

    const/16 v9, 0x14

    invoke-static {p1, v7, v6, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 132
    const/4 v7, 0x3

    aget-byte v7, v6, v7

    add-int/lit8 v7, v7, 0x4

    const/4 v8, 0x2

    aput-byte v8, v6, v7

    const/4 v7, 0x3

    aget-byte v7, v6, v7

    add-int/lit8 v7, v7, 0x5

    const/16 v8, 0x14

    aput-byte v8, v6, v7

    .line 133
    const/4 v7, 0x3

    aget-byte v7, v6, v7

    add-int/lit8 v7, v7, 0x5

    aget-byte v8, v6, v7

    add-int/2addr v8, v5

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    .line 134
    const/16 v7, 0x14

    const/4 v8, 0x3

    aget-byte v8, v6, v8

    add-int/lit8 v8, v8, 0x6

    add-int/2addr v8, v5

    const/16 v9, 0x14

    invoke-static {p1, v7, v6, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 135
    move-object p1, v6

    .line 145
    iget-object v7, p0, Lcom/jcraft/jsch/jce/SignatureDSA;->signature:Ljava/security/Signature;

    invoke-virtual {v7, p1}, Ljava/security/Signature;->verify([B)Z

    move-result v7

    return v7

    .line 121
    .end local v0           #frst:I
    .end local v4           #length:I
    .end local v5           #scnd:I
    .end local v6           #tmp:[B
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 122
    .restart local v0       #frst:I
    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method
