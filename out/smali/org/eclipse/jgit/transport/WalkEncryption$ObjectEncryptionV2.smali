.class Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;
.super Lorg/eclipse/jgit/transport/WalkEncryption;
.source "WalkEncryption.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/WalkEncryption;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ObjectEncryptionV2"
.end annotation


# static fields
.field private static ITERATION_COUNT:I

.field private static salt:[B


# instance fields
.field private final algorithmName:Ljava/lang/String;

.field private final aspec:Ljavax/crypto/spec/PBEParameterSpec;

.field private final skey:Ljavax/crypto/SecretKey;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 130
    const/16 v0, 0x1388

    sput v0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->ITERATION_COUNT:I

    .line 132
    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->salt:[B

    return-void

    :array_0
    .array-data 0x1
        0xa4t
        0xbt
        0xc8t
        0x34t
        0xd6t
        0x95t
        0xf3t
        0x13t
    .end array-data
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "algo"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkEncryption;-><init>()V

    .line 143
    iput-object p1, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->algorithmName:Ljava/lang/String;

    .line 146
    new-instance v0, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->salt:[B

    sget v3, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->ITERATION_COUNT:I

    const/16 v4, 0x20

    invoke-direct {v0, v1, v2, v3, v4}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 147
    .local v0, s:Ljavax/crypto/spec/PBEKeySpec;
    invoke-static {p1}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->skey:Ljavax/crypto/SecretKey;

    .line 148
    new-instance v1, Ljavax/crypto/spec/PBEParameterSpec;

    sget-object v2, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->salt:[B

    sget v3, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->ITERATION_COUNT:I

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->aspec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 149
    return-void
.end method


# virtual methods
.method decrypt(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 5
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->algorithmName:Ljava/lang/String;

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 184
    .local v0, c:Ljavax/crypto/Cipher;
    const/4 v2, 0x2

    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->skey:Ljavax/crypto/SecretKey;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->aspec:Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v0, v2, v3, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 185
    new-instance v2, Ljavax/crypto/CipherInputStream;

    invoke-direct {v2, p1, v0}, Ljavax/crypto/CipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_3

    return-object v2

    .line 186
    .end local v0           #c:Ljavax/crypto/Cipher;
    :catch_0
    move-exception v1

    .line 187
    .local v1, e:Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 188
    .end local v1           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 189
    .local v1, e:Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 190
    .end local v1           #e:Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v1

    .line 191
    .local v1, e:Ljava/security/InvalidKeyException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 192
    .end local v1           #e:Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v1

    .line 193
    .local v1, e:Ljava/security/InvalidAlgorithmParameterException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2
.end method

.method encrypt(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 5
    .parameter "os"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->algorithmName:Ljava/lang/String;

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 167
    .local v0, c:Ljavax/crypto/Cipher;
    const/4 v2, 0x1

    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->skey:Ljavax/crypto/SecretKey;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->aspec:Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v0, v2, v3, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 168
    new-instance v2, Ljavax/crypto/CipherOutputStream;

    invoke-direct {v2, p1, v0}, Ljavax/crypto/CipherOutputStream;-><init>(Ljava/io/OutputStream;Ljavax/crypto/Cipher;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_3

    return-object v2

    .line 169
    .end local v0           #c:Ljavax/crypto/Cipher;
    :catch_0
    move-exception v1

    .line 170
    .local v1, e:Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 171
    .end local v1           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 172
    .local v1, e:Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 173
    .end local v1           #e:Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v1

    .line 174
    .local v1, e:Ljava/security/InvalidKeyException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 175
    .end local v1           #e:Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v1

    .line 176
    .local v1, e:Ljava/security/InvalidAlgorithmParameterException;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->error(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v2

    throw v2
.end method

.method request(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .locals 2
    .parameter "u"
    .parameter "prefix"

    .prologue
    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "jets3t-crypto-ver"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "2"

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "jets3t-crypto-alg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->algorithmName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method validate(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .locals 2
    .parameter "u"
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    const-string v0, "2"

    iget-object v1, p0, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->algorithmName:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;->validateImpl(Ljava/net/HttpURLConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    return-void
.end method
