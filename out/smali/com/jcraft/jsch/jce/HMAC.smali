.class abstract Lcom/jcraft/jsch/jce/HMAC;
.super Ljava/lang/Object;
.source "HMAC.java"

# interfaces
.implements Lcom/jcraft/jsch/MAC;


# instance fields
.field protected algorithm:Ljava/lang/String;

.field protected bsize:I

.field private mac:Ljavax/crypto/Mac;

.field protected name:Ljava/lang/String;

.field private final tmp:[B


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->tmp:[B

    return-void
.end method


# virtual methods
.method public doFinal([BI)V
    .locals 2
    .parameter "buf"
    .parameter "offset"

    .prologue
    .line 72
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/jce/HMAC;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v1, p1, p2}, Ljavax/crypto/Mac;->doFinal([BI)V
    :try_end_0
    .catch Ljavax/crypto/ShortBufferException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :goto_0
    return-void

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, e:Ljavax/crypto/ShortBufferException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getBlockSize()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/jcraft/jsch/jce/HMAC;->bsize:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->name:Ljava/lang/String;

    return-object v0
.end method

.method public init([B)V
    .locals 5
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 47
    array-length v2, p1

    iget v3, p0, Lcom/jcraft/jsch/jce/HMAC;->bsize:I

    if-le v2, v3, :cond_0

    .line 48
    iget v2, p0, Lcom/jcraft/jsch/jce/HMAC;->bsize:I

    new-array v1, v2, [B

    .line 49
    .local v1, tmp:[B
    iget v2, p0, Lcom/jcraft/jsch/jce/HMAC;->bsize:I

    invoke-static {p1, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 50
    move-object p1, v1

    .line 52
    .end local v1           #tmp:[B
    :cond_0
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v2, p0, Lcom/jcraft/jsch/jce/HMAC;->algorithm:Ljava/lang/String;

    invoke-direct {v0, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 53
    .local v0, skey:Ljavax/crypto/spec/SecretKeySpec;
    iget-object v2, p0, Lcom/jcraft/jsch/jce/HMAC;->algorithm:Ljava/lang/String;

    invoke-static {v2}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/jce/HMAC;->mac:Ljavax/crypto/Mac;

    .line 54
    iget-object v2, p0, Lcom/jcraft/jsch/jce/HMAC;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v2, v0}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 55
    return-void
.end method

.method public update(I)V
    .locals 4
    .parameter "i"

    .prologue
    const/4 v3, 0x0

    .line 59
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->tmp:[B

    ushr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 60
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->tmp:[B

    const/4 v1, 0x1

    ushr-int/lit8 v2, p1, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 61
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->tmp:[B

    const/4 v1, 0x2

    ushr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 62
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->tmp:[B

    const/4 v1, 0x3

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 63
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->tmp:[B

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v3, v1}, Lcom/jcraft/jsch/jce/HMAC;->update([BII)V

    .line 64
    return-void
.end method

.method public update([BII)V
    .locals 1
    .parameter "foo"
    .parameter "s"
    .parameter "l"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMAC;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0, p1, p2, p3}, Ljavax/crypto/Mac;->update([BII)V

    .line 68
    return-void
.end method
