.class public Lcom/jcraft/jsch/jce/AES256CBC;
.super Ljava/lang/Object;
.source "AES256CBC.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x20

.field private static final ivsize:I = 0x10


# instance fields
.field private cipher:Ljavax/crypto/Cipher;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBlockSize()I
    .locals 1

    .prologue
    .line 40
    const/16 v0, 0x20

    return v0
.end method

.method public getIVSize()I
    .locals 1

    .prologue
    .line 39
    const/16 v0, 0x10

    return v0
.end method

.method public init(I[B[B)V
    .locals 8
    .parameter "mode"
    .parameter "key"
    .parameter "iv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x20

    const/16 v6, 0x10

    const/4 v5, 0x0

    .line 42
    const-string v2, "NoPadding"

    .line 44
    .local v2, pad:Ljava/lang/String;
    array-length v4, p3

    if-le v4, v6, :cond_0

    .line 45
    new-array v3, v6, [B

    .line 46
    .local v3, tmp:[B
    array-length v4, v3

    invoke-static {p3, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    move-object p3, v3

    .line 49
    .end local v3           #tmp:[B
    :cond_0
    array-length v4, p2

    if-le v4, v7, :cond_1

    .line 50
    new-array v3, v7, [B

    .line 51
    .restart local v3       #tmp:[B
    array-length v4, v3

    invoke-static {p2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    move-object p2, v3

    .line 55
    .end local v3           #tmp:[B
    :cond_1
    :try_start_0
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "AES"

    invoke-direct {v1, p2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 56
    .local v1, keyspec:Ljavax/crypto/spec/SecretKeySpec;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AES/CBC/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/AES256CBC;->cipher:Ljavax/crypto/Cipher;

    .line 57
    iget-object v5, p0, Lcom/jcraft/jsch/jce/AES256CBC;->cipher:Ljavax/crypto/Cipher;

    if-nez p1, :cond_2

    const/4 v4, 0x1

    :goto_0
    new-instance v6, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v6, p3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v5, v4, v1, v6}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    return-void

    .line 57
    :cond_2
    const/4 v4, 0x2

    goto :goto_0

    .line 62
    .end local v1           #keyspec:Ljavax/crypto/spec/SecretKeySpec;
    :catch_0
    move-exception v0

    .line 63
    .local v0, e:Ljava/lang/Exception;
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/jcraft/jsch/jce/AES256CBC;->cipher:Ljavax/crypto/Cipher;

    .line 64
    throw v0
.end method

.method public isCBC()Z
    .locals 1

    .prologue
    .line 70
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
    .line 68
    iget-object v0, p0, Lcom/jcraft/jsch/jce/AES256CBC;->cipher:Ljavax/crypto/Cipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 69
    return-void
.end method
