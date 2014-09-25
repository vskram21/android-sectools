.class public Lcom/jcraft/jsch/jce/ARCFOUR;
.super Ljava/lang/Object;
.source "ARCFOUR.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x10

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
    const/16 v0, 0x10

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
    .locals 7
    .parameter "mode"
    .parameter "key"
    .parameter "iv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v6, 0x10

    const/4 v5, 0x0

    .line 43
    const-string v2, "NoPadding"

    .line 45
    .local v2, pad:Ljava/lang/String;
    array-length v4, p2

    if-le v4, v6, :cond_0

    .line 46
    new-array v3, v6, [B

    .line 47
    .local v3, tmp:[B
    array-length v4, v3

    invoke-static {p2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    move-object p2, v3

    .line 52
    .end local v3           #tmp:[B
    :cond_0
    :try_start_0
    const-string v4, "RC4"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    .line 53
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "RC4"

    invoke-direct {v0, p2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 54
    .local v0, _key:Ljavax/crypto/spec/SecretKeySpec;
    iget-object v5, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    if-nez p1, :cond_1

    const/4 v4, 0x1

    :goto_0
    invoke-virtual {v5, v4, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    return-void

    .line 54
    :cond_1
    const/4 v4, 0x2

    goto :goto_0

    .line 59
    .end local v0           #_key:Ljavax/crypto/spec/SecretKeySpec;
    :catch_0
    move-exception v1

    .line 60
    .local v1, e:Ljava/lang/Exception;
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    .line 61
    throw v1
.end method

.method public isCBC()Z
    .locals 1

    .prologue
    .line 67
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
    .line 65
    iget-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 66
    return-void
.end method
