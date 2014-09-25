.class public Lorg/eclipse/jgit/transport/AmazonS3;
.super Ljava/lang/Object;
.source "AmazonS3.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/AmazonS3$ListParser;
    }
.end annotation


# static fields
.field private static final DOMAIN:Ljava/lang/String; = "s3.amazonaws.com"

.field private static final HMAC:Ljava/lang/String; = "HmacSHA1"

.field private static final SIGNED_HEADERS:Ljava/util/Set; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final X_AMZ_ACL:Ljava/lang/String; = "x-amz-acl"

.field private static final X_AMZ_META:Ljava/lang/String; = "x-amz-meta-"


# instance fields
.field private final acl:Ljava/lang/String;

.field private final encryption:Lorg/eclipse/jgit/transport/WalkEncryption;

.field private final maxAttempts:I

.field private final privateKey:Ljavax/crypto/spec/SecretKeySpec;

.field private final proxySelector:Ljava/net/ProxySelector;

.field private final publicKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 125
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/AmazonS3;->SIGNED_HEADERS:Ljava/util/Set;

    .line 126
    sget-object v0, Lorg/eclipse/jgit/transport/AmazonS3;->SIGNED_HEADERS:Ljava/util/Set;

    const-string v1, "content-type"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 127
    sget-object v0, Lorg/eclipse/jgit/transport/AmazonS3;->SIGNED_HEADERS:Ljava/util/Set;

    const-string v1, "content-md5"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 128
    sget-object v0, Lorg/eclipse/jgit/transport/AmazonS3;->SIGNED_HEADERS:Ljava/util/Set;

    const-string v1, "date"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 129
    return-void
.end method

.method public constructor <init>(Ljava/util/Properties;)V
    .locals 8
    .parameter "props"

    .prologue
    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    const-string v5, "accesskey"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->publicKey:Ljava/lang/String;

    .line 215
    iget-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->publicKey:Ljava/lang/String;

    if-nez v5, :cond_0

    .line 216
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->missingAccesskey:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 218
    :cond_0
    const-string v5, "secretkey"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 219
    .local v4, secret:Ljava/lang/String;
    if-nez v4, :cond_1

    .line 220
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->missingSecretkey:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 221
    :cond_1
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    invoke-static {v4}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v6

    const-string v7, "HmacSHA1"

    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->privateKey:Ljavax/crypto/spec/SecretKeySpec;

    .line 223
    const-string v5, "acl"

    const-string v6, "PRIVATE"

    invoke-virtual {p1, v5, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 224
    .local v3, pacl:Ljava/lang/String;
    const-string v5, "PRIVATE"

    invoke-static {v5, v3}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 225
    const-string v5, "private"

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->acl:Ljava/lang/String;

    .line 236
    :goto_0
    :try_start_0
    const-string v5, "password"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 237
    .local v1, cPas:Ljava/lang/String;
    if-eqz v1, :cond_7

    .line 238
    const-string v5, "crypto.algorithm"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 239
    .local v0, cAlg:Ljava/lang/String;
    if-nez v0, :cond_2

    .line 240
    const-string v0, "PBEWithMD5AndDES"

    .line 241
    :cond_2
    new-instance v5, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;

    invoke-direct {v5, v0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption$ObjectEncryptionV2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->encryption:Lorg/eclipse/jgit/transport/WalkEncryption;
    :try_end_0
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    .line 251
    .end local v0           #cAlg:Ljava/lang/String;
    :goto_1
    const-string v5, "httpclient.retry-max"

    const-string v6, "3"

    invoke-virtual {p1, v5, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I

    .line 253
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->proxySelector:Ljava/net/ProxySelector;

    .line 254
    return-void

    .line 226
    .end local v1           #cPas:Ljava/lang/String;
    :cond_3
    const-string v5, "PUBLIC"

    invoke-static {v5, v3}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 227
    const-string v5, "public-read"

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->acl:Ljava/lang/String;

    goto :goto_0

    .line 228
    :cond_4
    const-string v5, "PUBLIC-READ"

    invoke-static {v5, v3}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 229
    const-string v5, "public-read"

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->acl:Ljava/lang/String;

    goto :goto_0

    .line 230
    :cond_5
    const-string v5, "PUBLIC_READ"

    invoke-static {v5, v3}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 231
    const-string v5, "public-read"

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->acl:Ljava/lang/String;

    goto :goto_0

    .line 233
    :cond_6
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid acl: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 243
    .restart local v1       #cPas:Ljava/lang/String;
    :cond_7
    :try_start_1
    sget-object v5, Lorg/eclipse/jgit/transport/WalkEncryption;->NONE:Lorg/eclipse/jgit/transport/WalkEncryption;

    iput-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->encryption:Lorg/eclipse/jgit/transport/WalkEncryption;
    :try_end_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 245
    .end local v1           #cPas:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 246
    .local v2, e:Ljava/security/spec/InvalidKeySpecException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->invalidEncryption:Ljava/lang/String;

    invoke-direct {v5, v6, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 247
    .end local v2           #e:Ljava/security/spec/InvalidKeySpecException;
    :catch_1
    move-exception v2

    .line 248
    .local v2, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->invalidEncryption:Ljava/lang/String;

    invoke-direct {v5, v6, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;[BLorg/eclipse/jgit/util/TemporaryBuffer;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .parameter "x6"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-direct/range {p0 .. p6}, Lorg/eclipse/jgit/transport/AmazonS3;->putImpl(Ljava/lang/String;Ljava/lang/String;[BLorg/eclipse/jgit/util/TemporaryBuffer;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/AmazonS3;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 113
    iget v0, p0, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I

    return v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/transport/AmazonS3;->open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/net/HttpURLConnection;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/AmazonS3;->authorize(Ljava/net/HttpURLConnection;)V

    return-void
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/AmazonS3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 113
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    return-object v0
.end method

.method private authorize(Ljava/net/HttpURLConnection;)V
    .locals 17
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 586
    invoke-virtual/range {p1 .. p1}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v8

    .line 587
    .local v8, reqHdr:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    new-instance v11, Ljava/util/TreeMap;

    invoke-direct {v11}, Ljava/util/TreeMap;-><init>()V

    .line 588
    .local v11, sigHdr:Ljava/util/SortedMap;,"Ljava/util/SortedMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 589
    .local v3, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 590
    .local v4, hdr:Ljava/lang/String;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/AmazonS3;->isSignedHeader(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 591
    invoke-static {v4}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    invoke-static {v12}, Lorg/eclipse/jgit/transport/AmazonS3;->toCleanString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v13, v12}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 594
    .end local v3           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v4           #hdr:Ljava/lang/String;
    :cond_1
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 595
    .local v9, s:Ljava/lang/StringBuilder;
    invoke-virtual/range {p1 .. p1}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 596
    const/16 v12, 0xa

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 598
    const-string v12, "content-md5"

    invoke-static {v11, v12}, Lorg/eclipse/jgit/transport/AmazonS3;->remove(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 599
    const/16 v12, 0xa

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 601
    const-string v12, "content-type"

    invoke-static {v11, v12}, Lorg/eclipse/jgit/transport/AmazonS3;->remove(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 602
    const/16 v12, 0xa

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 604
    const-string v12, "date"

    invoke-static {v11, v12}, Lorg/eclipse/jgit/transport/AmazonS3;->remove(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    const/16 v12, 0xa

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 607
    invoke-interface {v11}, Ljava/util/SortedMap;->entrySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 608
    .local v2, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    const/16 v12, 0x3a

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 610
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    const/16 v12, 0xa

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 614
    .end local v2           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v12

    invoke-virtual {v12}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v5

    .line 615
    .local v5, host:Ljava/lang/String;
    const/16 v12, 0x2f

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 616
    const/4 v12, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v13

    const-string v14, "s3.amazonaws.com"

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    sub-int/2addr v13, v14

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v5, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    invoke-virtual/range {p1 .. p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v12

    invoke-virtual {v12}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    :try_start_0
    const-string v12, "HmacSHA1"

    invoke-static {v12}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v7

    .line 622
    .local v7, m:Ljavax/crypto/Mac;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/AmazonS3;->privateKey:Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v7, v12}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 623
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "UTF-8"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    invoke-virtual {v7, v12}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v12

    invoke-static {v12}, Lorg/eclipse/jgit/util/Base64;->encodeBytes([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v10

    .line 629
    .local v10, sec:Ljava/lang/String;
    const-string v12, "Authorization"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "AWS "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/transport/AmazonS3;->publicKey:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ":"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 630
    return-void

    .line 624
    .end local v7           #m:Ljavax/crypto/Mac;
    .end local v10           #sec:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 625
    .local v1, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->noHMACsupport:Ljava/lang/String;

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, "HmacSHA1"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 626
    .end local v1           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 627
    .local v1, e:Ljava/security/InvalidKeyException;
    new-instance v12, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->invalidKey:Ljava/lang/String;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v1}, Ljava/security/InvalidKeyException;->getMessage()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12
.end method

.method private error(Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;
    .locals 10
    .parameter "action"
    .parameter "key"
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 513
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->amazonS3ActionFailed:Ljava/lang/String;

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v9

    const/4 v7, 0x1

    aput-object p2, v6, v7

    const/4 v7, 0x2

    invoke-static {p3}, Lorg/eclipse/jgit/util/HttpSupport;->response(Ljava/net/HttpURLConnection;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 517
    .local v2, err:Ljava/io/IOException;
    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    .line 518
    .local v3, errorStream:Ljava/io/InputStream;
    if-nez v3, :cond_1

    .line 533
    :cond_0
    :goto_0
    return-object v2

    .line 521
    :cond_1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 522
    .local v0, b:Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x800

    new-array v1, v5, [B

    .line 524
    .local v1, buf:[B
    :cond_2
    :goto_1
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 525
    .local v4, n:I
    if-gez v4, :cond_3

    .line 530
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 531
    array-length v5, v1

    if-lez v5, :cond_0

    .line 532
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    goto :goto_0

    .line 527
    :cond_3
    if-lez v4, :cond_2

    .line 528
    invoke-virtual {v0, v1, v9, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1
.end method

.method private static httpNow()Ljava/lang/String;
    .locals 4

    .prologue
    .line 152
    const-string v1, "GMT"

    .line 154
    .local v1, tz:Ljava/lang/String;
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE, dd MMM yyyy HH:mm:ss"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 155
    .local v0, fmt:Ljava/text/SimpleDateFormat;
    const-string v2, "GMT"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 156
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "GMT"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static isSignedHeader(Ljava/lang/String;)Z
    .locals 2
    .parameter "name"

    .prologue
    .line 132
    invoke-static {p0}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, nameLC:Ljava/lang/String;
    sget-object v1, Lorg/eclipse/jgit/transport/AmazonS3;->SIGNED_HEADERS:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "x-amz-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private maxAttempts(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;
    .locals 5
    .parameter "action"
    .parameter "key"

    .prologue
    .line 537
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->amazonS3ActionFailedGivingUp:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static newMD5()Ljava/security/MessageDigest;
    .locals 3

    .prologue
    .line 161
    :try_start_0
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 162
    :catch_0
    move-exception v0

    .line 163
    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->JRELacksMD5Implementation:Ljava/lang/String;

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 2
    .parameter "method"
    .parameter "bucket"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 544
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    .line 545
    .local v0, noArgs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object v1

    return-object v1
.end method

.method private open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/net/HttpURLConnection;
    .locals 8
    .parameter "method"
    .parameter "bucket"
    .parameter "key"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/net/HttpURLConnection;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 551
    .local p4, args:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 552
    .local v5, urlstr:Ljava/lang/StringBuilder;
    const-string v6, "http://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    const/16 v6, 0x2e

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 555
    const-string v6, "s3.amazonaws.com"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 556
    const/16 v6, 0x2f

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 557
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 558
    invoke-static {v5, p3}, Lorg/eclipse/jgit/util/HttpSupport;->encode(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 559
    :cond_0
    invoke-interface {p4}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 562
    const/16 v6, 0x3f

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 563
    invoke-interface {p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 564
    .local v2, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 565
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 566
    .local v1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 568
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v5, v6}, Lorg/eclipse/jgit/util/HttpSupport;->encode(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 569
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 570
    const/16 v6, 0x26

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 574
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_2
    new-instance v4, Ljava/net/URL;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 575
    .local v4, url:Ljava/net/URL;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/AmazonS3;->proxySelector:Ljava/net/ProxySelector;

    invoke-static {v6, v4}, Lorg/eclipse/jgit/util/HttpSupport;->proxyFor(Ljava/net/ProxySelector;Ljava/net/URL;)Ljava/net/Proxy;

    move-result-object v3

    .line 578
    .local v3, proxy:Ljava/net/Proxy;
    invoke-virtual {v4, v3}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 579
    .local v0, c:Ljava/net/HttpURLConnection;
    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 580
    const-string v6, "User-Agent"

    const-string v7, "jgit/1.0"

    invoke-virtual {v0, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    const-string v6, "Date"

    invoke-static {}, Lorg/eclipse/jgit/transport/AmazonS3;->httpNow()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 582
    return-object v0
.end method

.method static properties(Ljava/io/File;)Ljava/util/Properties;
    .locals 3
    .parameter "authFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 634
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 635
    .local v1, p:Ljava/util/Properties;
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 637
    .local v0, in:Ljava/io/FileInputStream;
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 639
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 641
    return-object v1

    .line 639
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    throw v2
.end method

.method private putImpl(Ljava/lang/String;Ljava/lang/String;[BLorg/eclipse/jgit/util/TemporaryBuffer;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)V
    .locals 12
    .parameter "bucket"
    .parameter "key"
    .parameter "csum"
    .parameter "buf"
    .parameter "monitor"
    .parameter "monitorTask"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 473
    if-nez p5, :cond_0

    .line 474
    sget-object p5, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 475
    :cond_0
    if-nez p6, :cond_1

    .line 476
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->progressMonUploading:Ljava/lang/String;

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p2, v10, v11

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p6

    .line 478
    :cond_1
    invoke-static {p3}, Lorg/eclipse/jgit/util/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v7

    .line 479
    .local v7, md5str:Ljava/lang/String;
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/util/TemporaryBuffer;->length()J

    move-result-wide v4

    .line 480
    .local v4, len:J
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    .line 481
    .local v6, lenstr:Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, curAttempt:I
    :goto_0
    iget v9, p0, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I

    if-ge v3, v9, :cond_2

    .line 482
    const-string v9, "PUT"

    invoke-direct {p0, v9, p1, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v2

    .line 483
    .local v2, c:Ljava/net/HttpURLConnection;
    const-string v9, "Content-Length"

    invoke-virtual {v2, v9, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    const-string v9, "Content-MD5"

    invoke-virtual {v2, v9, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    const-string v9, "x-amz-acl"

    iget-object v10, p0, Lorg/eclipse/jgit/transport/AmazonS3;->acl:Ljava/lang/String;

    invoke-virtual {v2, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    iget-object v9, p0, Lorg/eclipse/jgit/transport/AmazonS3;->encryption:Lorg/eclipse/jgit/transport/WalkEncryption;

    const-string v10, "x-amz-meta-"

    invoke-virtual {v9, v2, v10}, Lorg/eclipse/jgit/transport/WalkEncryption;->request(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    .line 487
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/AmazonS3;->authorize(Ljava/net/HttpURLConnection;)V

    .line 488
    const/4 v9, 0x1

    invoke-virtual {v2, v9}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 489
    long-to-int v9, v4

    invoke-virtual {v2, v9}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 490
    const-wide/16 v9, 0x400

    div-long v9, v4, v9

    long-to-int v9, v9

    move-object/from16 v0, p5

    move-object/from16 v1, p6

    invoke-interface {v0, v1, v9}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 491
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    .line 493
    .local v8, os:Ljava/io/OutputStream;
    :try_start_0
    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-virtual {v0, v8, v1}, Lorg/eclipse/jgit/util/TemporaryBuffer;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 495
    invoke-interface/range {p5 .. p5}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 496
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    .line 499
    invoke-static {v2}, Lorg/eclipse/jgit/util/HttpSupport;->response(Ljava/net/HttpURLConnection;)I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    .line 505
    const-string v9, "Writing"

    invoke-direct {p0, v9, p2, v2}, Lorg/eclipse/jgit/transport/AmazonS3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;

    move-result-object v9

    throw v9

    .line 495
    :catchall_0
    move-exception v9

    invoke-interface/range {p5 .. p5}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 496
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    throw v9

    .line 481
    :sswitch_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 508
    .end local v2           #c:Ljava/net/HttpURLConnection;
    .end local v8           #os:Ljava/io/OutputStream;
    :cond_2
    const-string v9, "Writing"

    invoke-direct {p0, v9, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v9

    throw v9

    .line 501
    .restart local v2       #c:Ljava/net/HttpURLConnection;
    .restart local v8       #os:Ljava/io/OutputStream;
    :sswitch_1
    return-void

    .line 499
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_1
        0x1f4 -> :sswitch_0
    .end sparse-switch
.end method

.method private static remove(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter "k"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, m:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 148
    .local v0, r:Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0           #r:Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0       #r:Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private static toCleanString(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .local v1, s:Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 139
    .local v2, v:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 140
    const/16 v3, 0x2c

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 141
    :cond_0
    const-string v3, "\n"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 143
    .end local v2           #v:Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public beginPut(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 7
    .parameter "bucket"
    .parameter "key"
    .parameter "monitor"
    .parameter "monitorTask"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 454
    invoke-static {}, Lorg/eclipse/jgit/transport/AmazonS3;->newMD5()Ljava/security/MessageDigest;

    move-result-object v4

    .line 455
    .local v4, md5:Ljava/security/MessageDigest;
    new-instance v0, Lorg/eclipse/jgit/transport/AmazonS3$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/transport/AmazonS3$1;-><init>(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;Ljava/security/MessageDigest;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)V

    .line 467
    .local v0, buffer:Lorg/eclipse/jgit/util/TemporaryBuffer;
    iget-object v1, p0, Lorg/eclipse/jgit/transport/AmazonS3;->encryption:Lorg/eclipse/jgit/transport/WalkEncryption;

    new-instance v2, Ljava/security/DigestOutputStream;

    invoke-direct {v2, v0, v4}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/WalkEncryption;->encrypt(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v1

    return-object v1
.end method

.method public decrypt(Ljava/net/URLConnection;)Ljava/io/InputStream;
    .locals 2
    .parameter "u"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    iget-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3;->encryption:Lorg/eclipse/jgit/transport/WalkEncryption;

    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/WalkEncryption;->decrypt(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "bucket"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    const/4 v1, 0x0

    .local v1, curAttempt:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I

    if-ge v1, v2, :cond_0

    .line 348
    const-string v2, "DELETE"

    invoke-direct {p0, v2, p1, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 349
    .local v0, c:Ljava/net/HttpURLConnection;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->authorize(Ljava/net/HttpURLConnection;)V

    .line 350
    invoke-static {v0}, Lorg/eclipse/jgit/util/HttpSupport;->response(Ljava/net/HttpURLConnection;)I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 356
    const-string v2, "Deletion"

    invoke-direct {p0, v2, p2, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 347
    :sswitch_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 359
    .end local v0           #c:Ljava/net/HttpURLConnection;
    :cond_0
    const-string v2, "Deletion"

    invoke-direct {p0, v2, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 352
    .restart local v0       #c:Ljava/net/HttpURLConnection;
    :sswitch_1
    return-void

    .line 350
    nop

    :sswitch_data_0
    .sparse-switch
        0xcc -> :sswitch_1
        0x1f4 -> :sswitch_0
    .end sparse-switch
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URLConnection;
    .locals 4
    .parameter "bucket"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 271
    const/4 v1, 0x0

    .local v1, curAttempt:I
    :goto_0
    iget v2, p0, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I

    if-ge v1, v2, :cond_0

    .line 272
    const-string v2, "GET"

    invoke-direct {p0, v2, p1, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 273
    .local v0, c:Ljava/net/HttpURLConnection;
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->authorize(Ljava/net/HttpURLConnection;)V

    .line 274
    invoke-static {v0}, Lorg/eclipse/jgit/util/HttpSupport;->response(Ljava/net/HttpURLConnection;)I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 283
    const-string v2, "Reading"

    invoke-direct {p0, v2, p2, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 276
    :sswitch_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/AmazonS3;->encryption:Lorg/eclipse/jgit/transport/WalkEncryption;

    const-string v3, "x-amz-meta-"

    invoke-virtual {v2, v0, v3}, Lorg/eclipse/jgit/transport/WalkEncryption;->validate(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    .line 277
    return-object v0

    .line 279
    :sswitch_1
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-direct {v2, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 271
    :sswitch_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 286
    .end local v0           #c:Ljava/net/HttpURLConnection;
    :cond_0
    const-string v2, "Reading"

    invoke-direct {p0, v2, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 274
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x194 -> :sswitch_1
        0x1f4 -> :sswitch_2
    .end sparse-switch
.end method

.method public list(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .parameter "bucket"
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 325
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 326
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;

    invoke-direct {v0, p0, p1, p2}, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;-><init>(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .local v0, lp:Lorg/eclipse/jgit/transport/AmazonS3$ListParser;
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->list()V

    .line 329
    iget-boolean v1, v0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->truncated:Z

    if-nez v1, :cond_1

    .line 330
    iget-object v1, v0, Lorg/eclipse/jgit/transport/AmazonS3$ListParser;->entries:Ljava/util/List;

    return-object v1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 8
    .parameter "bucket"
    .parameter "key"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 384
    iget-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->encryption:Lorg/eclipse/jgit/transport/WalkEncryption;

    sget-object v6, Lorg/eclipse/jgit/transport/WalkEncryption;->NONE:Lorg/eclipse/jgit/transport/WalkEncryption;

    if-eq v5, v6, :cond_0

    .line 388
    invoke-virtual {p0, p1, p2, v7, v7}, Lorg/eclipse/jgit/transport/AmazonS3;->beginPut(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v4

    .line 389
    .local v4, os:Ljava/io/OutputStream;
    invoke-virtual {v4, p3}, Ljava/io/OutputStream;->write([B)V

    .line 390
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 413
    :sswitch_0
    return-void

    .line 394
    .end local v4           #os:Ljava/io/OutputStream;
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/transport/AmazonS3;->newMD5()Ljava/security/MessageDigest;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v5

    invoke-static {v5}, Lorg/eclipse/jgit/util/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v3

    .line 395
    .local v3, md5str:Ljava/lang/String;
    array-length v5, p3

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 396
    .local v2, lenstr:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, curAttempt:I
    :goto_0
    iget v5, p0, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts:I

    if-ge v1, v5, :cond_1

    .line 397
    const-string v5, "PUT"

    invoke-direct {p0, v5, p1, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 398
    .local v0, c:Ljava/net/HttpURLConnection;
    const-string v5, "Content-Length"

    invoke-virtual {v0, v5, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    const-string v5, "Content-MD5"

    invoke-virtual {v0, v5, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    const-string v5, "x-amz-acl"

    iget-object v6, p0, Lorg/eclipse/jgit/transport/AmazonS3;->acl:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->authorize(Ljava/net/HttpURLConnection;)V

    .line 402
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 403
    array-length v5, p3

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 404
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 406
    .restart local v4       #os:Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {v4, p3}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 408
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 411
    invoke-static {v0}, Lorg/eclipse/jgit/util/HttpSupport;->response(Ljava/net/HttpURLConnection;)I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 417
    const-string v5, "Writing"

    invoke-direct {p0, v5, p2, v0}, Lorg/eclipse/jgit/transport/AmazonS3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/net/HttpURLConnection;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 408
    :catchall_0
    move-exception v5

    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    throw v5

    .line 396
    :sswitch_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 420
    .end local v0           #c:Ljava/net/HttpURLConnection;
    .end local v4           #os:Ljava/io/OutputStream;
    :cond_1
    const-string v5, "Writing"

    invoke-direct {p0, v5, p2}, Lorg/eclipse/jgit/transport/AmazonS3;->maxAttempts(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 411
    nop

    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x1f4 -> :sswitch_1
    .end sparse-switch
.end method
