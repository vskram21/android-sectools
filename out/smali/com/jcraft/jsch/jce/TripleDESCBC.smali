.class public Lcom/jcraft/jsch/jce/TripleDESCBC;
.super Ljava/lang/Object;
.source "TripleDESCBC.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x18

.field private static final ivsize:I = 0x8


# instance fields
.field private cipher:Ljavax/crypto/Cipher;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBlockSize()I
    .locals 1

    .prologue
    .line 41
    const/16 v0, 0x18

    return v0
.end method

.method public getIVSize()I
    .locals 1

    .prologue
    .line 40
    const/16 v0, 0x8

    return v0
.end method

.method public init(I[B[B)V
    .locals 10
    .parameter "mode"
    .parameter "key"
    .parameter "iv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v9, 0x18

    const/16 v8, 0x8

    const/4 v7, 0x0

    .line 43
    const-string v4, "NoPadding"

    .line 46
    .local v4, pad:Ljava/lang/String;
    array-length v6, p3

    if-le v6, v8, :cond_0

    .line 47
    new-array v5, v8, [B

    .line 48
    .local v5, tmp:[B
    array-length v6, v5

    invoke-static {p3, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    move-object p3, v5

    .line 51
    .end local v5           #tmp:[B
    :cond_0
    array-length v6, p2

    if-le v6, v9, :cond_1

    .line 52
    new-array v5, v9, [B

    .line 53
    .restart local v5       #tmp:[B
    array-length v6, v5

    invoke-static {p2, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    move-object p2, v5

    .line 58
    .end local v5           #tmp:[B
    :cond_1
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DESede/CBC/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v6

    iput-object v6, p0, Lcom/jcraft/jsch/jce/TripleDESCBC;->cipher:Ljavax/crypto/Cipher;

    .line 67
    new-instance v3, Ljavax/crypto/spec/DESedeKeySpec;

    invoke-direct {v3, p2}, Ljavax/crypto/spec/DESedeKeySpec;-><init>([B)V

    .line 68
    .local v3, keyspec:Ljavax/crypto/spec/DESedeKeySpec;
    const-string v6, "DESede"

    invoke-static {v6}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v2

    .line 69
    .local v2, keyfactory:Ljavax/crypto/SecretKeyFactory;
    invoke-virtual {v2, v3}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v0

    .line 70
    .local v0, _key:Ljavax/crypto/SecretKey;
    iget-object v7, p0, Lcom/jcraft/jsch/jce/TripleDESCBC;->cipher:Ljavax/crypto/Cipher;

    if-nez p1, :cond_2

    const/4 v6, 0x1

    :goto_0
    new-instance v8, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v8, p3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v7, v6, v0, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    return-void

    .line 70
    :cond_2
    const/4 v6, 0x2

    goto :goto_0

    .line 75
    .end local v0           #_key:Ljavax/crypto/SecretKey;
    .end local v2           #keyfactory:Ljavax/crypto/SecretKeyFactory;
    .end local v3           #keyspec:Ljavax/crypto/spec/DESedeKeySpec;
    :catch_0
    move-exception v1

    .line 76
    .local v1, e:Ljava/lang/Exception;
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/jcraft/jsch/jce/TripleDESCBC;->cipher:Ljavax/crypto/Cipher;

    .line 77
    throw v1
.end method

.method public isCBC()Z
    .locals 1

    .prologue
    .line 83
    const/4 v0, 0x1

    return v0
.end method

.method public update([BII[BI)V
    .locals 6
    .parameter "foo"
    .parameter "s1"
    .parameter "len"
    .parameter "bar"
    .parameter "s2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/jcraft/jsch/jce/TripleDESCBC;->cipher:Ljavax/crypto/Cipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 82
    return-void
.end method
