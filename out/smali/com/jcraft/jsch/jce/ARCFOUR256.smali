.class public Lcom/jcraft/jsch/jce/ARCFOUR256;
.super Ljava/lang/Object;
.source "ARCFOUR256.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x20

.field private static final ivsize:I = 0x8

.field private static final skip:I = 0x600


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
    .line 42
    const/16 v0, 0x20

    return v0
.end method

.method public getIVSize()I
    .locals 1

    .prologue
    .line 41
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
    const/16 v4, 0x20

    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 45
    array-length v2, p2

    if-le v2, v4, :cond_0

    .line 46
    new-array v9, v4, [B

    .line 47
    .local v9, tmp:[B
    array-length v2, v9

    invoke-static {p2, v3, v9, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    move-object p2, v9

    .line 51
    .end local v9           #tmp:[B
    :cond_0
    :try_start_0
    const-string v2, "RC4"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/jce/ARCFOUR256;->cipher:Ljavax/crypto/Cipher;

    .line 52
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    const-string v2, "RC4"

    invoke-direct {v6, p2, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 53
    .local v6, _key:Ljavax/crypto/spec/SecretKeySpec;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/ARCFOUR256;->cipher:Ljavax/crypto/Cipher;

    if-nez p1, :cond_1

    :goto_0
    invoke-virtual {v2, v0, v6}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 57
    const/4 v0, 0x1

    new-array v1, v0, [B

    .line 58
    .local v1, foo:[B
    const/4 v8, 0x0

    .local v8, i:I
    :goto_1
    const/16 v0, 0x600

    if-ge v8, v0, :cond_2

    .line 59
    iget-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR256;->cipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v5, 0x0

    move-object v4, v1

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 53
    .end local v1           #foo:[B
    .end local v8           #i:I
    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    .line 62
    .end local v6           #_key:Ljavax/crypto/spec/SecretKeySpec;
    :catch_0
    move-exception v7

    .line 63
    .local v7, e:Ljava/lang/Exception;
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR256;->cipher:Ljavax/crypto/Cipher;

    .line 64
    throw v7

    .line 66
    .end local v7           #e:Ljava/lang/Exception;
    .restart local v1       #foo:[B
    .restart local v6       #_key:Ljavax/crypto/spec/SecretKeySpec;
    .restart local v8       #i:I
    :cond_2
    return-void
.end method

.method public isCBC()Z
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x0

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
    iget-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR256;->cipher:Ljavax/crypto/Cipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 69
    return-void
.end method
